.class public Lz1/Z4;
.super Lcom/android/launcher3/util/E;
.source "WidgetItem.java"


# instance fields
.field public final d:Lcom/android/launcher3/widget/U;

.field public final e:LD1/i;

.field public f:Ls1/d;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/CharSequence;

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(LD1/i;Ls1/P;)V
    .locals 2

    .line 9
    invoke-virtual {p1}, LD1/i;->g()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {p1}, LD1/i;->e()Landroid/os/UserHandle;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 10
    sget-object v0, Ls1/d;->i:Ls1/d;

    iput-object v0, p0, Lz1/Z4;->f:Ls1/d;

    .line 11
    invoke-virtual {p1}, LD1/i;->f()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2, p1}, Ls1/P;->J0(Lt1/h;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {p1}, Lt1/h;->getLabel()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    iput-object p2, p0, Lz1/Z4;->g:Ljava/lang/String;

    const/4 p2, 0x0

    .line 13
    iput-object p2, p0, Lz1/Z4;->h:Ljava/lang/CharSequence;

    .line 14
    iput-object p2, p0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 15
    iput-object p1, p0, Lz1/Z4;->e:LD1/i;

    const/4 p1, 0x1

    .line 16
    iput p1, p0, Lz1/Z4;->j:I

    iput p1, p0, Lz1/Z4;->i:I

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/widget/U;Lcom/android/launcher3/F1;Ls1/P;Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {p1}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 2
    sget-object v0, Ls1/d;->i:Ls1/d;

    iput-object v0, p0, Lz1/Z4;->f:Ls1/d;

    .line 3
    invoke-virtual {p3, p1}, Ls1/P;->J0(Lt1/h;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lz1/Z4;->g:Ljava/lang/String;

    .line 4
    invoke-virtual {p1, p4}, Landroid/appwidget/AppWidgetProviderInfo;->loadDescription(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object p3

    iput-object p3, p0, Lz1/Z4;->h:Ljava/lang/CharSequence;

    .line 5
    iput-object p1, p0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    const/4 p3, 0x0

    .line 6
    iput-object p3, p0, Lz1/Z4;->e:LD1/i;

    .line 7
    iget p3, p1, Lcom/android/launcher3/widget/U;->g:I

    iget p4, p2, Lcom/android/launcher3/F1;->H0:I

    invoke-static {p3, p4}, Ljava/lang/Math;->min(II)I

    move-result p3

    iput p3, p0, Lz1/Z4;->i:I

    .line 8
    iget p1, p1, Lcom/android/launcher3/widget/U;->h:I

    iget p2, p2, Lcom/android/launcher3/F1;->G0:I

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lz1/Z4;->j:I

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/Z4;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/Z4;->e:LD1/i;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
