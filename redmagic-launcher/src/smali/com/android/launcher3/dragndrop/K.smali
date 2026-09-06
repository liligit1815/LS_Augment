.class public Lcom/android/launcher3/dragndrop/K;
.super Lcom/android/launcher3/dragndrop/h;
.source "PinItemDragListener.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation


# instance fields
.field private final n:Landroid/content/pm/LauncherApps$PinItemRequest;

.field private final o:Landroid/os/CancellationSignal;

.field private final p:F

.field protected q:Z


# direct methods
.method public constructor <init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/graphics/Rect;II)V
    .locals 6

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 1
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/dragndrop/K;-><init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/graphics/Rect;IIF)V

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/graphics/Rect;IIF)V
    .locals 0

    .line 2
    invoke-direct {p0, p2, p3, p4}, Lcom/android/launcher3/dragndrop/h;-><init>(Landroid/graphics/Rect;II)V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 4
    new-instance p1, Landroid/os/CancellationSignal;

    invoke-direct {p1}, Landroid/os/CancellationSignal;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/dragndrop/K;->o:Landroid/os/CancellationSignal;

    .line 5
    iput p5, p0, Lcom/android/launcher3/dragndrop/K;->p:F

    return-void
.end method

.method public static l(Landroid/content/pm/LauncherApps$PinItemRequest;)Landroid/widget/RemoteViews;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getExtras()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string v0, "appWidgetPreview"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    instance-of v1, v1, Landroid/widget/RemoteViews;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/widget/RemoteViews;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method


# virtual methods
.method protected e()Lcom/android/launcher3/widget/H0;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/widget/y0;

    .line 11
    .line 12
    new-instance v2, Lcom/android/launcher3/dragndrop/M;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/dragndrop/M;-><init>(Landroid/content/pm/LauncherApps$PinItemRequest;Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v0, v2}, Lcom/android/launcher3/widget/y0;-><init>(LD1/i;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 28
    .line 29
    invoke-virtual {v2, v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getAppWidgetProviderInfo(Landroid/content/Context;)Landroid/appwidget/AppWidgetProviderInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v0, v2}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v2, Lcom/android/launcher3/dragndrop/N;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 40
    .line 41
    invoke-direct {v2, v0, v3}, Lcom/android/launcher3/dragndrop/N;-><init>(Landroid/appwidget/AppWidgetProviderInfo;Landroid/content/pm/LauncherApps$PinItemRequest;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Lcom/android/launcher3/dragndrop/K$a;

    .line 45
    .line 46
    const/16 v4, -0x71

    .line 47
    .line 48
    invoke-direct {v3, p0, v0, v4, v2}, Lcom/android/launcher3/dragndrop/K$a;-><init>(Lcom/android/launcher3/dragndrop/K;Lcom/android/launcher3/widget/U;ILcom/android/launcher3/dragndrop/N;)V

    .line 49
    .line 50
    .line 51
    move-object v0, v3

    .line 52
    :goto_0
    new-instance v2, Landroid/view/View;

    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 55
    .line 56
    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Lcom/android/launcher3/widget/H0;

    .line 63
    .line 64
    invoke-direct {v0, v2}, Lcom/android/launcher3/widget/H0;-><init>(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 68
    .line 69
    invoke-virtual {v2}, Landroid/content/pm/LauncherApps$PinItemRequest;->getRequestType()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    const/4 v3, 0x2

    .line 74
    if-ne v2, v3, :cond_1

    .line 75
    .line 76
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 77
    .line 78
    invoke-static {v2}, Lcom/android/launcher3/dragndrop/K;->l(Landroid/content/pm/LauncherApps$PinItemRequest;)Landroid/widget/RemoteViews;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget v3, p0, Lcom/android/launcher3/dragndrop/K;->p:F

    .line 83
    .line 84
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/widget/H0;->w(Landroid/widget/RemoteViews;F)V

    .line 85
    .line 86
    .line 87
    :cond_1
    iget-boolean p0, p0, Lcom/android/launcher3/dragndrop/K;->q:Z

    .line 88
    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    iput-boolean v1, v0, Lcom/android/launcher3/widget/H0;->o:Z

    .line 92
    .line 93
    :cond_2
    return-object v0
.end method

.method protected h(Landroid/view/DragEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$PinItemRequest;->isValid()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/dragndrop/h;->h(Landroid/view/DragEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method protected j()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/h;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/K;->o:Landroid/os/CancellationSignal;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m()Landroid/content/pm/ShortcutInfo;
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/K;->n:Landroid/content/pm/LauncherApps$PinItemRequest;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/pm/LauncherApps$PinItemRequest;->getShortcutInfo()Landroid/content/pm/ShortcutInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    const-string v0, "PinItemDragListener"

    .line 12
    .line 13
    const-string v1, "getShortcutKey error"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method
