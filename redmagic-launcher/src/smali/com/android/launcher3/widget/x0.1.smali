.class public abstract Lcom/android/launcher3/widget/x0;
.super Landroid/appwidget/AppWidgetHostView;
.source "NavigableAppWidgetHostView.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/y;
.implements Lcom/android/launcher3/G5;


# static fields
.field public static m:[Ljava/lang/String;


# instance fields
.field private final g:Lcom/android/launcher3/util/z1;

.field protected h:F

.field private i:F

.field private j:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field protected final k:Lcom/android/launcher3/views/k;

.field private l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const-string v5, "com.google.android.keep/com.google.android.keep.quickaddwidget.QuickAddWidgetProvider"

    .line 2
    .line 3
    const-string v6, "com.google.android.keep/com.google.android.keep.homescreenwidget.MemoryAppWidgetProvider"

    .line 4
    .line 5
    const-string v0, "com.google.android.deskclock/com.android.alarmclock.DigitalCitiesAppWidgetProvider"

    .line 6
    .line 7
    const-string v1, "com.google.android.apps.docs/com.google.android.apps.docs.drive.widget.suggestion.SuggestionAppWidgetProvider"

    .line 8
    .line 9
    const-string v2, "com.google.android.gm/com.google.android.gm.widget.GmailWidgetProvider"

    .line 10
    .line 11
    const-string v3, "com.google.android.apps.youtube.music/com.google.android.apps.youtube.music.player.widget.gm3.FreeformMusicWidgetProvider"

    .line 12
    .line 13
    const-string v4, "com.android.systemui/com.android.systemui.people.widget.PeopleSpaceWidgetProvider"

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Lcom/android/launcher3/widget/x0;->m:[Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/appwidget/AppWidgetHostView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/z1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/z1;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/x0;->g:Lcom/android/launcher3/util/z1;

    .line 10
    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v0, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 14
    .line 15
    iput v0, p0, Lcom/android/launcher3/widget/x0;->i:F

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/android/launcher3/widget/x0;->l:Z

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/launcher3/widget/x0;->k:Lcom/android/launcher3/views/k;

    .line 27
    .line 28
    return-void
.end method

.method private k(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetHostView;->setSelected(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/widget/x0;->i:F

    .line 4
    .line 5
    mul-float/2addr v0, v1

    .line 6
    invoke-super {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setScaleX(F)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/widget/x0;->i:F

    .line 12
    .line 13
    mul-float/2addr v0, v1

    .line 14
    invoke-super {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public clearChildFocus(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->clearChildFocus(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/x0;->k(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iget v1, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    float-to-int v0, v0

    .line 10
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    int-to-float v1, v1

    .line 15
    iget p0, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 16
    .line 17
    mul-float/2addr v1, p0

    .line 18
    float-to-int p0, v1

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p1, v1, v1, v0, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x6f

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->requestFocus()Z

    .line 24
    .line 25
    .line 26
    return v1

    .line 27
    :cond_0
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public getDescendantFocusability()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/high16 p0, 0x20000

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/high16 p0, 0x60000

    .line 9
    .line 10
    return p0
.end method

.method public getReorderBounceScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/x0;->i:F

    .line 2
    .line 3
    return p0
.end method

.method public getScaleToFit()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public getTranslateDelegate()Lcom/android/launcher3/util/z1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/x0;->g:Lcom/android/launcher3/util/z1;

    .line 2
    .line 3
    return-object p0
.end method

.method public getViewType()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected abstract l()Z
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/x0;->k(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/appwidget/AppWidgetHostView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x42

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/KeyEvent;->startTracking()V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetHostView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isTracking()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 8
    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    const/16 v0, 0x42

    .line 12
    .line 13
    if-ne p1, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->getFocusables(I)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    if-eq v2, v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/x0;->l()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 49
    .line 50
    .line 51
    iput-boolean v3, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 52
    .line 53
    return v0

    .line 54
    :cond_1
    :goto_0
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 61
    .line 62
    .line 63
    return v0

    .line 64
    :cond_2
    iput-boolean v3, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 65
    .line 66
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetHostView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetHostView;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/launcher3/widget/x0;->j:Z

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p1, v0

    .line 14
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/x0;->k(Z)V

    .line 15
    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V
    .locals 4

    .line 1
    const-string v0, "NavigableAppWidgetHostView"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Lcom/android/launcher3/widget/x0;->l:Z

    .line 5
    .line 6
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetHostView;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 7
    .line 8
    .line 9
    iput-boolean v1, p0, Lcom/android/launcher3/widget/x0;->l:Z

    .line 10
    .line 11
    :try_start_0
    const-class p1, Landroid/appwidget/AppWidgetHostView;

    .line 12
    .line 13
    const-string v2, "getRemoteContextEnsuringCorrectCachedApkPath"

    .line 14
    .line 15
    new-array v3, v1, [Ljava/lang/Class;

    .line 16
    .line 17
    invoke-virtual {p1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-array v1, v1, [Ljava/lang/Object;

    .line 22
    .line 23
    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "setAppWidget getRemoteContextEnsuringCorrectCachedApkPath context="

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    instance-of v1, p0, Landroid/content/Context;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    instance-of p1, p0, Landroid/content/Context;

    .line 50
    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    move-object p1, p0

    .line 54
    check-cast p1, Landroid/content/Context;

    .line 55
    .line 56
    check-cast p0, Landroid/content/Context;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-static {p1, p0, v1}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    new-instance p1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v1, "setAppWidget getRemoteContextEnsuringCorrectCachedApkPath info: "

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object p2, p2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 79
    .line 80
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 88
    .line 89
    .line 90
    :cond_0
    return-void
.end method

.method public setPadding(IIII)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/x0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2, p3, p4}, Landroid/appwidget/AppWidgetHostView;->setPadding(IIII)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setReorderBounceScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/x0;->i:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/widget/x0;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setScaleToFit(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/x0;->h:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/widget/x0;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
