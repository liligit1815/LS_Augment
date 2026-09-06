.class Lcom/android/launcher3/widget/Q;
.super Lcom/android/launcher3/widget/p0;
.source "LauncherAppWidgetHost.java"


# instance fields
.field private e:Lcom/android/launcher3/widget/s0;


# virtual methods
.method public clearViews()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/appwidget/AppWidgetHost;->clearViews()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/T;
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/widget/Q;->e:Lcom/android/launcher3/widget/s0;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance p2, Lcom/android/launcher3/widget/s0;

    .line 7
    .line 8
    invoke-direct {p2, p1}, Lcom/android/launcher3/widget/s0;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    :goto_0
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/android/launcher3/widget/Q;->e:Lcom/android/launcher3/widget/s0;

    .line 13
    .line 14
    return-object p2
.end method

.method public k(Lcom/android/launcher3/widget/s0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/Q;->e:Lcom/android/launcher3/widget/s0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic onCreateView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/widget/Q;->j(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
