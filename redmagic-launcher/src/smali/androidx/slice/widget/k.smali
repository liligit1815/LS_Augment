.class Landroidx/slice/widget/k;
.super Landroidx/slice/widget/j;
.source "SliceMetricsWrapper.java"


# instance fields
.field private final a:Landroid/app/slice/SliceMetrics;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/slice/widget/j;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/app/slice/SliceMetrics;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Landroid/app/slice/SliceMetrics;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/slice/widget/k;->a:Landroid/app/slice/SliceMetrics;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method protected b()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/k;->a:Landroid/app/slice/SliceMetrics;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/slice/SliceMetrics;->logHidden()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected c()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/k;->a:Landroid/app/slice/SliceMetrics;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/slice/SliceMetrics;->logVisible()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
