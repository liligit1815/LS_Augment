.class public Lcom/android/launcher3/qsb/QsbContainerView$a;
.super Landroid/appwidget/AppWidgetHost;
.source "QsbContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/qsb/QsbContainerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/qsb/QsbContainerView$c;

.field private final b:Lcom/android/launcher3/qsb/QsbContainerView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/launcher3/qsb/QsbContainerView$c;Lcom/android/launcher3/qsb/QsbContainerView$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/appwidget/AppWidgetHost;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/android/launcher3/qsb/QsbContainerView$a;->a:Lcom/android/launcher3/qsb/QsbContainerView$c;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/android/launcher3/qsb/QsbContainerView$a;->b:Lcom/android/launcher3/qsb/QsbContainerView$b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method protected onCreateView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/qsb/QsbContainerView$a;->a:Lcom/android/launcher3/qsb/QsbContainerView$c;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/android/launcher3/qsb/QsbContainerView$c;->a(Landroid/content/Context;)Lcom/android/launcher3/qsb/g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected onProvidersChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/appwidget/AppWidgetHost;->onProvidersChanged()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/qsb/QsbContainerView$a;->b:Lcom/android/launcher3/qsb/QsbContainerView$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/qsb/QsbContainerView$b;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
