$ErrorActionPreference='Stop'
$taskRoot=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$taskJava=Join-Path $taskRoot 'android/app/src/main/java/ls/augment/com'
$taskClasses=Join-Path $taskRoot 'outputs/prototype-current/native-ui-test-classes'
New-Item -ItemType Directory -Force -Path $taskClasses | Out-Null
$taskSources=@('EnhancementOption','EnhancementCatalog','SystemOptions','SystemUiOptions','BackGestureIconPolicy','GameOptions','LauncherOptions','RecentsCardRadiusOptions','AppearanceOptions','CollabOptions','EntryVisibilityOptions','GlassOptions','ConnectionExtrasPolicy','ShoulderQuickSwitchPolicy','HookAppCatalog','NativeFeatureGroups','ValueOverrideState','HiddenEntrySession','LauncherOverrides','LauncherEditQueue') | ForEach-Object {Join-Path $taskJava ($_+'.java')}
$taskSources+=Join-Path $PSScriptRoot 'TestNativeFeatureGroups.java'
$taskSources+=Join-Path $PSScriptRoot 'TestHiddenEntrySession.java'
$taskSources+=Join-Path $PSScriptRoot 'TestLauncherEditQueue.java'
$taskSources+=Join-Path $taskJava 'ModuleHierarchy.java'
$taskSources+=Join-Path $taskJava 'BrightnessRange.java'
$taskSources+=Join-Path $taskJava 'LauncherGridSpec.java'
$taskSources+=Join-Path $PSScriptRoot 'TestModuleHierarchy.java'
$taskSources+=Join-Path $PSScriptRoot 'TestModuleFeatureSearch.java'
$taskSources+=Join-Path $PSScriptRoot 'TestStatusBarIconLayout.java'
$taskSources+=Join-Path $taskJava 'RecentsCardRadiusRange.java'
$taskSources+=Join-Path $taskJava 'RecentsCardRadiusUiRange.java'
$taskSources+=Join-Path $PSScriptRoot 'TestRecentsCardRadiusRange.java'
$taskSources+=Join-Path $PSScriptRoot 'TestRecentsCardRadiusUiRange.java'
& javac -encoding UTF-8 --release 17 -sourcepath (Join-Path $taskRoot 'android/app/src/main/java') -d $taskClasses @taskSources
if($LASTEXITCODE -ne 0){throw 'Native UI policy tests did not compile'}
& java -cp $taskClasses ls.augment.com.TestRecentsCardRadiusRange
if($LASTEXITCODE -ne 0){throw 'Recents radius range checks failed'}
& java -cp $taskClasses ls.augment.com.TestRecentsCardRadiusUiRange
if($LASTEXITCODE -ne 0){throw 'Recents radius UI range checks failed'}
& java -cp $taskClasses ls.augment.com.TestNativeFeatureGroups
if($LASTEXITCODE -ne 0){throw 'Native feature group checks failed'}
& java -cp $taskClasses ls.augment.com.TestHiddenEntrySession
if($LASTEXITCODE -ne 0){throw 'Hidden entry checks failed'}
& java -cp $taskClasses ls.augment.com.TestLauncherEditQueue
if($LASTEXITCODE -ne 0){throw 'Launcher draft checks failed'}
& java -cp $taskClasses ls.augment.com.TestModuleHierarchy
if($LASTEXITCODE -ne 0){throw 'Module hierarchy checks failed'}
& java -cp $taskClasses ls.augment.com.TestModuleFeatureSearch
if($LASTEXITCODE -ne 0){throw 'Module feature search checks failed'}
& java -cp $taskClasses ls.augment.com.TestStatusBarIconLayout
if($LASTEXITCODE -ne 0){throw 'Status bar icon layout policy checks failed'}
