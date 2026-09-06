.class public Lcom/android/launcher3/widget/custom/bestie/WeatherWidget;
.super Ljava/lang/Object;
.source "WeatherWidget.java"

# interfaces
.implements Lcom/android/systemui/plugins/CustomWidgetPlugin;


# instance fields
.field private g:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidget;->g:Landroid/content/Context;

    .line 9
    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v0, "new instance mContext: "

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidget;->g:Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "WeatherWidget"

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public doUnlockAnim()V
    .locals 0

    .line 1
    return-void
.end method

.method public getLabel()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getMinSpanX()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public getMinSpanY()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public getPreviewImage()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getResizeMode()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getSpanX()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public getSpanY()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public getWidgetPadding(IIII)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidget;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const p1, 0x7f070249

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    new-instance p1, Landroid/graphics/Rect;

    .line 15
    .line 16
    invoke-direct {p1, p0, p0, p0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public keyEventClick(Lcom/android/launcher3/widget/T;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/bestie/WeatherWidgetLayout;->c()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onLauncherDestroy()V
    .locals 1

    .line 1
    const-string p0, "WeatherWidget"

    .line 2
    .line 3
    const-string v0, "onLauncherDestroy"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onLauncherModeChanged()V
    .locals 1

    .line 1
    const-string p0, "WeatherWidget"

    .line 2
    .line 3
    const-string v0, "onLauncherModeChanged"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onLauncherPaused()V
    .locals 0

    .line 1
    return-void
.end method

.method public onLauncherResumed()V
    .locals 0

    .line 1
    return-void
.end method

.method public onLauncherStarted()V
    .locals 0

    .line 1
    return-void
.end method

.method public onLauncherStopped()V
    .locals 0

    .line 1
    return-void
.end method

.method public onLoaderTaskBindAllApplications()V
    .locals 0

    .line 1
    return-void
.end method

.method public onStateChangeStartMFV(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onViewCreated(Landroid/appwidget/AppWidgetHostView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const v0, 0x7f0e00a3

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onWallpaperOrForeColorChanged()V
    .locals 0

    .line 1
    return-void
.end method

.method public prepareOrResetUnlockAnim(Z)V
    .locals 0

    .line 1
    return-void
.end method
