$ErrorActionPreference = 'Stop'
$workspace = Split-Path -Parent $PSScriptRoot
$classes = Join-Path $workspace 'outputs/native-fixes/hide-test-classes'
New-Item -ItemType Directory -Path $classes -Force | Out-Null
$source = Join-Path $workspace 'android/app/src/main/java/ls/augment/com'
$files = @(
    (Join-Path $source 'HideBatchExecutor.java'),
    (Join-Path $source 'HidePackageSnapshot.java'),
    (Join-Path $source 'RootShell.java'),
    (Join-Path $PSScriptRoot 'TestHideBatchExecutor.java'),
    (Join-Path $PSScriptRoot 'TestHidePackageSnapshot.java'),
    (Join-Path $PSScriptRoot 'TestRootShellTransport.java')
)
& javac -encoding UTF-8 -source 17 -target 17 -d $classes @files
if ($LASTEXITCODE -ne 0) { throw 'Hide test compilation failed' }
foreach ($test in @('TestHideBatchExecutor', 'TestHidePackageSnapshot', 'TestRootShellTransport')) {
    & java -cp $classes "ls.augment.com.$test"
    if ($LASTEXITCODE -ne 0) { throw "$test failed" }
}
