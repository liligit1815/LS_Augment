.class public interface abstract Lcom/android/launcher3/views/k;
.super Ljava/lang/Object;
.source "ActivityContext.java"

# interfaces
.implements Le0/f;


# direct methods
.method public static synthetic A(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static Q(Landroid/content/Context;)Landroid/content/Context;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(",
            "Landroid/content/Context;",
            ")TT;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    check-cast p0, Landroid/content/ContextWrapper;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lcom/android/launcher3/views/k;->Q(Landroid/content/Context;)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/logging/StatsLogManager;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->q1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic g(Landroid/view/inputmethod/InputMethodManager;Landroid/os/IBinder;Lcom/android/launcher3/logging/StatsLogManager;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance p1, Lcom/android/launcher3/views/j;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Lcom/android/launcher3/views/j;-><init>(Lcom/android/launcher3/logging/StatsLogManager;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static m(Landroid/content/Context;)Landroid/content/Context;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(",
            "Landroid/content/Context;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/views/k;->Q(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 9
    .line 10
    const-string v0, "Cannot find ActivityContext in parent tree"

    .line 11
    .line 12
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method


# virtual methods
.method public addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getOnDeviceProfileChangeListeners()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public applyOverwritesToLogItem(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V
    .locals 0

    .line 1
    return-void
.end method

.method public asContext()Landroid/content/Context;
    .locals 0

    .line 1
    check-cast p0, Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public canUseMultipleShadesForPopup()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public dispatchDeviceProfileChanged()V
    .locals 3

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getOnDeviceProfileChangeListeners()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, -0x1

    .line 14
    .line 15
    :goto_0
    if-ltz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/android/launcher3/X3$b;

    .line 22
    .line 23
    invoke-interface {v2, v0}, Lcom/android/launcher3/X3$b;->onDeviceProfileChanged(Lcom/android/launcher3/h0;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v1, v1, -0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public finishAppClosingAnim(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public finishAutoCancelActionMode()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public finishFolderAnim()V
    .locals 0

    .line 1
    return-void
.end method

.method public getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    instance-of v0, p1, Lcom/android/launcher3/BubbleTextView;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sub-int/2addr p0, v0

    .line 32
    div-int/lit8 p0, p0, 0x2

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v2, p0

    .line 48
    move p0, v1

    .line 49
    move v0, p0

    .line 50
    :goto_0
    invoke-static {p1, p0, v0, v2, p2}, Landroid/app/ActivityOptions;->makeClipRevealAnimation(Landroid/view/View;IIII)Landroid/app/ActivityOptions;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Lcom/android/launcher3/N5;->a(Landroid/app/ActivityOptions;)Landroid/app/ActivityOptions;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    if-eqz p2, :cond_1

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    :cond_1
    invoke-virtual {p0, v1}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    .line 73
    .line 74
    .line 75
    new-instance p1, Lcom/android/launcher3/util/Y1;

    .line 76
    .line 77
    invoke-direct {p1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 78
    .line 79
    .line 80
    new-instance p2, Lcom/android/launcher3/util/b;

    .line 81
    .line 82
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    .line 83
    .line 84
    .line 85
    return-object p2
.end method

.method public getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/launcher3/views/i;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/views/i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/r<",
            "*>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getCellPosMapper()Lc1/c;
    .locals 2

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lc1/c;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget p0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 12
    .line 13
    invoke-direct {v0, v1, p0}, Lc1/c;-><init>(ZI)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getContent()Lcom/android/launcher3/util/Y0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract getDeviceProfile()Lcom/android/launcher3/h0;
.end method

.method public getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/popup/n;->h(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/launcher3/dragndrop/j;",
            ">()TT;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
.end method

.method public getDropTargetHandler()Lcom/android/launcher3/q0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getFolderBoundingBox()Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->V()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public abstract getForeColor()I
.end method

.method public getIfIgnorestylusGesture()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/launcher3/views/h;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/views/h;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 1

    .line 1
    instance-of v0, p0, Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public abstract getOnDeviceProfileChangeListeners()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/X3$b;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getOwnerCleanupSet()Lcom/android/launcher3/util/o3;
.end method

.method public getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/popup/n;-><init>(Lcom/android/launcher3/views/k;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getRootView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;
    .locals 0

    .line 1
    check-cast p0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getStringCache()Lz1/G4;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getSystemUiController()Lcom/android/launcher3/util/E2;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract getViewCache()Lcom/android/launcher3/util/X2;
.end method

.method public getWidgetPickerDataProvider()Ln2/c;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getWindow()Landroid/view/Window;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public handleIncorrectSplitTargetSelection()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public hasBubbles()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public hideKeyboard()V
    .locals 4

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getWindowInsetsController()Landroid/view/WindowInsetsController;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v2, v3}, Landroid/view/WindowInsets;->isVisible(I)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v2, 0x0

    .line 34
    :goto_0
    if-eqz v1, :cond_2

    .line 35
    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-interface {v1, v0}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->q1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 54
    .line 55
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-class v2, Landroid/view/inputmethod/InputMethodManager;

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 84
    .line 85
    new-instance v3, Lcom/android/launcher3/views/g;

    .line 86
    .line 87
    invoke-direct {v3, v1, v0, p0}, Lcom/android/launcher3/views/g;-><init>(Landroid/view/inputmethod/InputMethodManager;Landroid/os/IBinder;Lcom/android/launcher3/logging/StatsLogManager;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    :goto_1
    return-void
.end method

.method public isBubbleBarEnabled()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isHardwareKeyboard()Z
    .locals 1

    .line 1
    check-cast p0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/content/res/Configuration;->keyboard:I

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-ne v0, p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public isSoftwareKeyboardHidden()Z
    .locals 2

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->isHardwareKeyboard()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    invoke-static {v0, p0}, LJ/Y;->w(Landroid/view/WindowInsets;Landroid/view/View;)LJ/Y;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, LJ/Y$k;->c()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, v0}, LJ/Y;->p(I)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    xor-int/2addr p0, v1

    .line 34
    return p0
.end method

.method public isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isSplitSelectionActive()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->i:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;
    .locals 1

    .line 1
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/N5;->a(Landroid/app/ActivityOptions;)Landroid/app/ActivityOptions;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-boolean v0, Lcom/android/launcher3/N5;->f:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance p1, Lcom/android/launcher3/util/b;

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p1, p0, v0}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getOnDeviceProfileChangeListeners()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public resetDraglayer()V
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 9

    .line 1
    invoke-interface {p0, p1, p3}, Lcom/android/launcher3/views/k;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    invoke-virtual {v0}, Lcom/android/launcher3/util/b;->a()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v8

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v6, 0x0

    .line 14
    const/4 v7, 0x0

    .line 15
    move-object v1, p2

    .line 16
    invoke-virtual/range {v1 .. v8}, Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;Landroid/app/PendingIntent$OnFinished;Landroid/os/Handler;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    new-instance p2, Lcom/android/launcher3/logging/f;

    .line 22
    .line 23
    invoke-direct {p2}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object p2, Lcom/android/launcher3/logging/StatsLogManager$e;->Z2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 47
    .line 48
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p0, v0, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    return-object p0

    .line 54
    :catch_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const p2, 0x7f1403d4

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const/4 p2, 0x0

    .line 74
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x0

    .line 82
    return-object p0
.end method

.method public startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 12

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    move-object v1, p0

    .line 5
    check-cast v1, Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->l()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/util/k;

    .line 20
    .line 21
    invoke-direct {v0, v1, p2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/util/k;->n()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    const p0, 0x7f140344

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 38
    .line 39
    .line 40
    return-object v2

    .line 41
    :cond_0
    instance-of v0, p3, Lcom/android/launcher3/model/data/I;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget v0, p3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 46
    .line 47
    const/4 v4, 0x6

    .line 48
    if-ne v0, v4, :cond_1

    .line 49
    .line 50
    move-object v0, p3

    .line 51
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    move v0, v3

    .line 62
    :goto_0
    if-eqz p1, :cond_2

    .line 63
    .line 64
    invoke-interface {p0, p1, p3}, Lcom/android/launcher3/views/k;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    goto :goto_2

    .line 69
    :cond_2
    if-eqz p3, :cond_3

    .line 70
    .line 71
    iget v4, p3, Lcom/android/launcher3/model/data/y;->animationType:I

    .line 72
    .line 73
    const/4 v5, 0x2

    .line 74
    if-ne v4, v5, :cond_3

    .line 75
    .line 76
    move v4, v3

    .line 77
    goto :goto_1

    .line 78
    :cond_3
    const/4 v4, -0x1

    .line 79
    :goto_1
    invoke-interface {p0, v4}, Lcom/android/launcher3/views/k;->makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    :goto_2
    if-nez p3, :cond_4

    .line 84
    .line 85
    move-object v5, v2

    .line 86
    goto :goto_3

    .line 87
    :cond_4
    iget-object v5, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 88
    .line 89
    :goto_3
    instance-of v6, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 90
    .line 91
    if-eqz v6, :cond_5

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    check-cast v6, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 98
    .line 99
    if-eqz v6, :cond_5

    .line 100
    .line 101
    iget-boolean v6, v6, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->doubleApp:Z

    .line 102
    .line 103
    if-eqz v6, :cond_5

    .line 104
    .line 105
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    const/16 v6, 0x3e7

    .line 110
    .line 111
    invoke-virtual {v5, v6}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    :cond_5
    move-object v11, v5

    .line 116
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    if-eqz v5, :cond_6

    .line 121
    .line 122
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    if-eqz v5, :cond_6

    .line 139
    .line 140
    const v5, 0x208000

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    iget-object v5, v4, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 147
    .line 148
    invoke-virtual {v5, v3}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 149
    .line 150
    .line 151
    :cond_6
    invoke-virtual {v4}, Lcom/android/launcher3/util/b;->a()Landroid/os/Bundle;

    .line 152
    .line 153
    .line 154
    move-result-object v10

    .line 155
    const/high16 v5, 0x10000000

    .line 156
    .line 157
    invoke-virtual {p2, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    if-eqz p1, :cond_7

    .line 161
    .line 162
    invoke-static {p1}, Lcom/android/launcher3/N5;->u(Landroid/view/View;)Landroid/graphics/Rect;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setSourceBounds(Landroid/graphics/Rect;)V

    .line 167
    .line 168
    .line 169
    :cond_7
    const-class p1, Landroid/content/pm/LauncherApps;

    .line 170
    .line 171
    const-string v5, "ActivityContext"

    .line 172
    .line 173
    if-eqz v0, :cond_a

    .line 174
    .line 175
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_8

    .line 180
    .line 181
    invoke-static {v1, p2}, Lcom/android/launcher3/widget/group/h;->g(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/Intent;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    goto :goto_4

    .line 186
    :catch_0
    move-exception v0

    .line 187
    move-object p0, v0

    .line 188
    goto/16 :goto_7

    .line 189
    .line 190
    :cond_8
    move-object v0, v2

    .line 191
    :goto_4
    if-eqz v0, :cond_9

    .line 192
    .line 193
    new-instance p1, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    const-string v6, "startActivity widgetShortcutIntent="

    .line 199
    .line 200
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1, v0, v10}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 214
    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_9
    move-object v0, p3

    .line 218
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 219
    .line 220
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v8

    .line 224
    invoke-virtual {p2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v7

    .line 228
    move-object v0, p0

    .line 229
    check-cast v0, Landroid/content/Context;

    .line 230
    .line 231
    invoke-virtual {v0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    move-object v6, p1

    .line 236
    check-cast v6, Landroid/content/pm/LauncherApps;

    .line 237
    .line 238
    invoke-virtual {p2}, Landroid/content/Intent;->getSourceBounds()Landroid/graphics/Rect;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    invoke-virtual/range {v6 .. v11}, Landroid/content/pm/LauncherApps;->startShortcut(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Rect;Landroid/os/Bundle;Landroid/os/UserHandle;)V

    .line 243
    .line 244
    .line 245
    goto :goto_6

    .line 246
    :cond_a
    if-eqz v11, :cond_c

    .line 247
    .line 248
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-virtual {v11, v0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_b

    .line 257
    .line 258
    goto :goto_5

    .line 259
    :cond_b
    invoke-virtual {v1, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    check-cast p1, Landroid/content/pm/LauncherApps;

    .line 264
    .line 265
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-virtual {p2}, Landroid/content/Intent;->getSourceBounds()Landroid/graphics/Rect;

    .line 270
    .line 271
    .line 272
    move-result-object v6

    .line 273
    invoke-virtual {p1, v0, v11, v6, v10}, Landroid/content/pm/LauncherApps;->startMainActivity(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/graphics/Rect;Landroid/os/Bundle;)V

    .line 274
    .line 275
    .line 276
    goto :goto_6

    .line 277
    :cond_c
    :goto_5
    invoke-virtual {v1, p2, v10}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 278
    .line 279
    .line 280
    :goto_6
    if-eqz p3, :cond_d

    .line 281
    .line 282
    new-instance p1, Lcom/android/launcher3/logging/f;

    .line 283
    .line 284
    invoke-direct {p1}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p1}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-interface {p0, v0, p3, p1}, Lcom/android/launcher3/views/k;->logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 296
    .line 297
    .line 298
    :cond_d
    iget-object p0, v4, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 299
    .line 300
    return-object p0

    .line 301
    :goto_7
    const p1, 0x7f140047

    .line 302
    .line 303
    .line 304
    invoke-static {v1, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 309
    .line 310
    .line 311
    new-instance p1, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 314
    .line 315
    .line 316
    const-string v0, "Unable to launch. tag="

    .line 317
    .line 318
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    const-string p3, " intent="

    .line 325
    .line 326
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    invoke-static {v5, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 337
    .line 338
    .line 339
    return-object v2
.end method

.method public startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 1
    return-void
.end method

.method public updateOpenFolderPosition([ILandroid/graphics/Rect;II)V
    .locals 0

    .line 1
    return-void
.end method
