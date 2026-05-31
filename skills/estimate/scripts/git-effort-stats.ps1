param(
    [string]$RepoPath = (Get-Location).Path,
    [string]$Since,
    [string]$Until,
    [string[]]$Paths = @(),
    [double]$HoursPerActiveDay = 8,
    [switch]$CurrentBranchOnly
)

$ErrorActionPreference = "Stop"

function Write-JsonResult {
    param([object]$Value)
    $Value | ConvertTo-Json -Depth 8
}

$root = & git -C $RepoPath rev-parse --show-toplevel 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($root)) {
    Write-JsonResult ([ordered]@{
        hasGitRepo = $false
        hasData = $false
        repoPath = $RepoPath
        error = "Not a git repository"
    })
    exit 0
}

$root = $root.Trim()
$gitArgs = @(
    "-C", $root,
    "log",
    "--date=short",
    "--pretty=format:%ad%x09%H%x09%s"
)

if (-not $CurrentBranchOnly) {
    $gitArgs += "--all"
}

if (-not [string]::IsNullOrWhiteSpace($Since)) {
    $gitArgs += "--since=$Since"
}

if (-not [string]::IsNullOrWhiteSpace($Until)) {
    $gitArgs += "--until=$Until"
}

if ($Paths.Count -gt 0) {
    $gitArgs += "--"
    $gitArgs += $Paths
}

$lines = @(& git @gitArgs)
if ($LASTEXITCODE -ne 0) {
    throw "git log failed"
}

$records = @(
    foreach ($line in $lines) {
        if (-not [string]::IsNullOrWhiteSpace($line)) {
            $parts = $line -split "`t", 3
            [pscustomobject]@{
                date = $parts[0]
                hash = $parts[1]
                subject = if ($parts.Count -gt 2) { $parts[2] } else { "" }
            }
        }
    }
)

$dates = @($records | ForEach-Object { $_.date } | Sort-Object -Unique)
$commitCount = $records.Count
$activeDayCount = $dates.Count

$oldestDate = $null
$newestDate = $null
if ($activeDayCount -gt 0) {
    $oldestDate = @($dates | Sort-Object | Select-Object -First 1)[0]
    $newestDate = @($dates | Sort-Object | Select-Object -Last 1)[0]
}

$estimatedHoursFromActiveDays = [math]::Round($activeDayCount * $HoursPerActiveDay, 2)

Write-JsonResult ([ordered]@{
    hasGitRepo = $true
    hasData = ($commitCount -gt 0)
    repoRoot = $root
    currentBranchOnly = [bool]$CurrentBranchOnly
    paths = @($Paths)
    since = $Since
    until = $Until
    commits = $commitCount
    distinctActiveDays = $activeDayCount
    firstActiveDate = $oldestDate
    lastActiveDate = $newestDate
    hoursPerActiveDay = $HoursPerActiveDay
    estimatedHoursFromActiveDays = $estimatedHoursFromActiveDays
    sampleNewestCommits = @($records | Select-Object -First 5)
    notes = @(
        "Git commit days are a proxy, not a timesheet.",
        "Squash commits, rebases, private work, generated files, and uncommitted work can distort this estimate.",
        "Use path filters and date ranges when the repository contains unrelated work."
    )
})
