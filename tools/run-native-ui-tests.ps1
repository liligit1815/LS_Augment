$ErrorActionPreference='Stop'
$taskRoot=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$taskJava=Join-Path $taskRoot 'android/app/src/main/java/ls/augment/com'
$taskClasses=Join-Path $taskRoot 'outputs/prototype-current/native-ui-test-classes'
New-Item -ItemType Directory -Force -Path $taskClasses | Out-Null
$taskSources=@('EnhancementOption','EnhancementCatalog','SystemOptions','SystemUiOptions','GameOptions','LauncherOptions','AppearanceOptions','ConnectionExtrasPolicy','ShoulderQuickSwitchPolicy','HookAppCatalog','NativeFeatureGroups','ValueOverrideState','HiddenEntrySession','LauncherOverrides','LauncherEditQueue') | ForEach-Object {Join-Path $taskJava ($_+'.java')}
$taskSources+=Join-Path $PSScriptRoot 'TestNativeFeatureGroups.java'
$taskSources+=Join-Path $PSScriptRoot 'TestHiddenEntrySession.java'
$taskSources+=Join-Path $PSScriptRoot 'TestLauncherEditQueue.java'
& javac -encoding UTF-8 --release 17 -d $taskClasses @taskSources
if($LASTEXITCODE -ne 0){throw 'Native UI policy tests did not compile'}
& java -cp $taskClasses ls.augment.com.TestNativeFeatureGroups
if($LASTEXITCODE -ne 0){throw 'Native feature group checks failed'}
& java -cp $taskClasses ls.augment.com.TestHiddenEntrySession
if($LASTEXITCODE -ne 0){throw 'Hidden entry checks failed'}
& java -cp $taskClasses ls.augment.com.TestLauncherEditQueue
if($LASTEXITCODE -ne 0){throw 'Launcher draft checks failed'}
