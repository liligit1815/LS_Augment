.class public abstract Lcom/android/quickstep/fallback/window/RecentsWindowContext;
.super Lcom/android/launcher3/util/s;
.source "RecentsWindowContext.kt"


# instance fields
.field private deviceProfile:Lcom/android/launcher3/h0;

.field private windowLayoutParams:Landroid/view/WindowManager$LayoutParams;

.field private final windowTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 1
    const-string v0, "windowContext"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2}, Lcom/android/launcher3/util/F2;->b(Landroid/content/Context;I)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/util/s;-><init>(Landroid/content/Context;IZ)V

    .line 12
    .line 13
    .line 14
    const-string p1, "RecentsWindow"

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->windowTitle:Ljava/lang/String;

    .line 17
    .line 18
    const/16 p2, 0x7f6

    .line 19
    .line 20
    invoke-direct {p0, p2, p1}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->createDefaultWindowLayoutParams(ILjava/lang/String;)Landroid/view/WindowManager$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->windowLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 25
    .line 26
    return-void
.end method

.method private final createDefaultWindowLayoutParams(ILjava/lang/String;)Landroid/view/WindowManager$LayoutParams;
    .locals 6

    .line 1
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    const/4 v2, -0x1

    .line 4
    const/4 v5, -0x3

    .line 5
    const/4 v1, -0x1

    .line 6
    const v4, -0x7efffe00

    .line 7
    .line 8
    .line 9
    move v3, p1

    .line 10
    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p2}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-virtual {v0, p0}, Landroid/view/WindowManager$LayoutParams;->setFitInsetsTypes(I)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x3

    .line 21
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    invoke-virtual {v0, p0}, Landroid/view/WindowManager$LayoutParams;->setSystemApplicationOverlay(Z)V

    .line 25
    .line 26
    .line 27
    const/high16 p0, 0x2000000

    .line 28
    .line 29
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 30
    .line 31
    return-object v0
.end method


# virtual methods
.method public bridge synthetic addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic applyOverwritesToLogItem(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->applyOverwritesToLogItem(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic asContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic canUseMultipleShadesForPopup()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->canUseMultipleShadesForPopup()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic dispatchDeviceProfileChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->dispatchDeviceProfileChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic finishAppClosingAnim(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic finishAutoCancelActionMode()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->finishAutoCancelActionMode()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic finishFolderAnim()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->finishFolderAnim()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/views/k;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getCellPosMapper()Lc1/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getComponentName()Landroid/content/ComponentName;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getComponentName()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getContent()Lcom/android/launcher3/util/Y0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getContent()Lcom/android/launcher3/util/Y0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDeviceProfile()Lcom/android/launcher3/h0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->deviceProfile:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->initDeviceProfile()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->deviceProfile:Lcom/android/launcher3/h0;

    .line 9
    .line 10
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public bridge synthetic getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract synthetic getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
.end method

.method public bridge synthetic getDropTargetHandler()Lcom/android/launcher3/q0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDropTargetHandler()Lcom/android/launcher3/q0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getFolderBoundingBox()Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getFolderBoundingBox()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getForeColor()I
    .locals 2

    .line 1
    new-instance p0, Lh4/k;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "An operation is not implemented: "

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "Not yet implemented"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-direct {p0, v0}, Lh4/k;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method

.method public bridge synthetic getIfIgnorestylusGesture()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getIfIgnorestylusGesture()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getRootView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getStringCache()Lz1/G4;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getSystemUiController()Lcom/android/launcher3/util/E2;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getWidgetPickerDataProvider()Ln2/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getWindow()Landroid/view/Window;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected final getWindowLayoutParams()Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->windowLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic handleIncorrectSplitTargetSelection()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->handleIncorrectSplitTargetSelection()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic hasBubbles()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hasBubbles()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic hideKeyboard()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final initDeviceProfile()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/F1;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/F1;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/android/launcher3/F1;->k0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    iput-object v0, p0, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->deviceProfile:Lcom/android/launcher3/h0;

    .line 33
    .line 34
    return-void
.end method

.method public bridge synthetic isBubbleBarEnabled()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isBubbleBarEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isHardwareKeyboard()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isHardwareKeyboard()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSoftwareKeyboardHidden()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSoftwareKeyboardHidden()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSplitSelectionActive()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSplitSelectionActive()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic resetDraglayer()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->resetDraglayer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected final setWindowLayoutParams(Landroid/view/WindowManager$LayoutParams;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsWindowContext;->windowLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->startSplitSelection(Lcom/android/launcher3/util/y2$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic updateOpenFolderPosition([ILandroid/graphics/Rect;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/views/k;->updateOpenFolderPosition([ILandroid/graphics/Rect;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
