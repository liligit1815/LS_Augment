.class public final Lcom/android/launcher3/uioverrides/H;
.super Lcom/android/launcher3/widget/l0;
.source "QuickstepWidgetHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/uioverrides/H$d;,
        Lcom/android/launcher3/uioverrides/H$b;,
        Lcom/android/launcher3/uioverrides/H$e;,
        Lcom/android/launcher3/uioverrides/H$c;
    }
.end annotation


# static fields
.field private static final j:Lcom/android/launcher3/uioverrides/H$e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/uioverrides/H$e<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final k:Lcom/android/launcher3/uioverrides/H$e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/uioverrides/H$e<",
            "Landroid/widget/RemoteViews;",
            ">;"
        }
    .end annotation
.end field

.field private static final l:Lcom/android/launcher3/uioverrides/H$e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/uioverrides/H$e<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final m:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/uioverrides/H$c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final h:Lcom/android/launcher3/uioverrides/H$d;

.field private final i:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/uioverrides/H$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/B;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/uioverrides/B;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/uioverrides/H;->j:Lcom/android/launcher3/uioverrides/H$e;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/uioverrides/C;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/uioverrides/C;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/uioverrides/H;->k:Lcom/android/launcher3/uioverrides/H$e;

    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/uioverrides/D;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/android/launcher3/uioverrides/D;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/launcher3/uioverrides/H;->l:Lcom/android/launcher3/uioverrides/H$e;

    .line 21
    .line 22
    new-instance v0, Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/android/launcher3/uioverrides/H;->m:Landroid/util/SparseArray;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/uioverrides/f;->b()Lcom/android/launcher3/widget/p0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/l0;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/p0;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Lcom/android/launcher3/uioverrides/z;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Lcom/android/launcher3/uioverrides/z;-><init>(Lcom/android/launcher3/uioverrides/H;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/H;->h:Lcom/android/launcher3/uioverrides/H$d;

    .line 14
    .line 15
    new-instance p1, Landroid/util/SparseArray;

    .line 16
    .line 17
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/H;->i:Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/widget/f;->g()Lcom/android/launcher3/widget/f;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Lcom/android/launcher3/uioverrides/A;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/A;-><init>(Lcom/android/launcher3/uioverrides/H;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/f;->i(Ljava/util/function/Consumer;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public static synthetic e0(Lcom/android/launcher3/uioverrides/H;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/H;->o0(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Lcom/android/launcher3/uioverrides/H;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/H;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g0(Landroid/appwidget/AppWidgetHostView;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/uioverrides/H;->l:Lcom/android/launcher3/uioverrides/H$e;

    .line 2
    .line 3
    invoke-interface {v0, p0, p1}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h0(Lcom/android/launcher3/uioverrides/H;ILcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/uioverrides/H;->r0(ILcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Lcom/android/launcher3/uioverrides/H;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/H;->q0(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/H$c;->k(Lcom/android/launcher3/uioverrides/H$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic k0()Lcom/android/launcher3/uioverrides/H$e;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/uioverrides/H;->j:Lcom/android/launcher3/uioverrides/H$e;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic l0()Lcom/android/launcher3/uioverrides/H$e;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/uioverrides/H;->k:Lcom/android/launcher3/uioverrides/H$e;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic m0()Lcom/android/launcher3/uioverrides/H$e;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/uioverrides/H;->l:Lcom/android/launcher3/uioverrides/H$e;

    .line 2
    .line 3
    return-object v0
.end method

.method private static n0(I)Lcom/android/launcher3/uioverrides/H$c;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/uioverrides/H;->m:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/android/launcher3/uioverrides/H$c;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/uioverrides/H$c;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/H$c;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/uioverrides/f;->b()Lcom/android/launcher3/widget/p0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, p0, v1}, Landroid/appwidget/AppWidgetHost;->setListener(ILandroid/appwidget/AppWidgetHost$AppWidgetHostListener;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object v1
.end method

.method private synthetic o0(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    const-string p1, "startListening start"

    .line 8
    .line 9
    const-string v0, "QuickstepWidgetHolder"

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/uioverrides/f;->b()Lcom/android/launcher3/widget/p0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHost;->startListening()V

    .line 19
    .line 20
    .line 21
    const-string p1, "startListening end"

    .line 22
    .line 23
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/lit8 p1, p1, -0x1

    .line 33
    .line 34
    :goto_0
    if-ltz p1, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 43
    .line 44
    instance-of v1, v0, Lcom/android/launcher3/widget/t0;

    .line 45
    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->T()V

    .line 49
    .line 50
    .line 51
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return-void
.end method

.method private synthetic p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->b:Lcom/android/launcher3/widget/p0;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHost;->setAppWidgetHidden()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/l0;->S(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic q0(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "stopListening setAppWidgetHidden start"

    .line 8
    .line 9
    const-string v0, "QuickstepWidgetHolder"

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/widget/p0;->f()Lcom/android/launcher3/util/p1;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v1, Lcom/android/launcher3/uioverrides/F;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/F;-><init>(Lcom/android/launcher3/uioverrides/H;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "stopListening setAppWidgetHidden end"

    .line 27
    .line 28
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private r0(ILcom/android/launcher3/uioverrides/H$e;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lcom/android/launcher3/uioverrides/H$e<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/appwidget/AppWidgetHostView;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-interface {p2, p0, p3}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/H;->i:Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/android/launcher3/uioverrides/H$b;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Lcom/android/launcher3/uioverrides/H$b;

    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/android/launcher3/uioverrides/H$b;-><init>(Lcom/android/launcher3/uioverrides/M;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H;->i:Landroid/util/SparseArray;

    .line 39
    .line 40
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    sget-object p0, Lcom/android/launcher3/uioverrides/H;->j:Lcom/android/launcher3/uioverrides/H$e;

    .line 44
    .line 45
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    check-cast p3, Landroid/appwidget/AppWidgetProviderInfo;

    .line 52
    .line 53
    iput-object p3, v0, Lcom/android/launcher3/uioverrides/H$b;->b:Landroid/appwidget/AppWidgetProviderInfo;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/android/launcher3/uioverrides/H$b;->c:Landroid/widget/RemoteViews;

    .line 56
    .line 57
    iget-object p0, v0, Lcom/android/launcher3/uioverrides/H$b;->a:Lcom/android/launcher3/util/z0;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/util/z0;->clear()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    sget-object p0, Lcom/android/launcher3/uioverrides/H;->k:Lcom/android/launcher3/uioverrides/H$e;

    .line 64
    .line 65
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    check-cast p3, Landroid/widget/RemoteViews;

    .line 72
    .line 73
    iput-object p3, v0, Lcom/android/launcher3/uioverrides/H$b;->c:Landroid/widget/RemoteViews;

    .line 74
    .line 75
    return-void

    .line 76
    :cond_4
    sget-object p0, Lcom/android/launcher3/uioverrides/H;->l:Lcom/android/launcher3/uioverrides/H$e;

    .line 77
    .line 78
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    iget-object p0, v0, Lcom/android/launcher3/uioverrides/H$b;->a:Lcom/android/launcher3/util/z0;

    .line 85
    .line 86
    check-cast p3, Ljava/lang/Integer;

    .line 87
    .line 88
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 93
    .line 94
    .line 95
    :cond_5
    :goto_0
    return-void
.end method


# virtual methods
.method protected M(Lcom/android/launcher3/widget/T;)Lcom/android/launcher3/widget/T;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/uioverrides/H;->n0(I)Lcom/android/launcher3/uioverrides/H$c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H;->h:Lcom/android/launcher3/uioverrides/H$d;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/uioverrides/H$c;->e(Lcom/android/launcher3/uioverrides/H$d;)Landroid/widget/RemoteViews;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/T;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method protected W(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    and-int/2addr p1, p0

    .line 3
    if-ne p1, p0, :cond_0

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

.method public b0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/l0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/widget/f;->g()Lcom/android/launcher3/widget/f;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/launcher3/uioverrides/E;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/E;-><init>(Lcom/android/launcher3/uioverrides/H;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/f;->i(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method protected d0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/H;->i:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_4

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/H;->i:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget-object v3, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/appwidget/AppWidgetHostView;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/H;->i:Landroid/util/SparseArray;

    .line 25
    .line 26
    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Lcom/android/launcher3/uioverrides/H$b;

    .line 31
    .line 32
    if-eqz v2, :cond_3

    .line 33
    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object v4, v3, Lcom/android/launcher3/uioverrides/H$b;->b:Landroid/appwidget/AppWidgetProviderInfo;

    .line 38
    .line 39
    if-eqz v4, :cond_1

    .line 40
    .line 41
    sget-object v5, Lcom/android/launcher3/uioverrides/H;->j:Lcom/android/launcher3/uioverrides/H$e;

    .line 42
    .line 43
    invoke-interface {v5, v2, v4}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v4, v3, Lcom/android/launcher3/uioverrides/H$b;->c:Landroid/widget/RemoteViews;

    .line 47
    .line 48
    if-eqz v4, :cond_2

    .line 49
    .line 50
    sget-object v5, Lcom/android/launcher3/uioverrides/H;->k:Lcom/android/launcher3/uioverrides/H$e;

    .line 51
    .line 52
    invoke-interface {v5, v2, v4}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object v3, v3, Lcom/android/launcher3/uioverrides/H$b;->a:Lcom/android/launcher3/util/z0;

    .line 56
    .line 57
    new-instance v4, Lcom/android/launcher3/uioverrides/G;

    .line 58
    .line 59
    invoke-direct {v4, v2}, Lcom/android/launcher3/uioverrides/G;-><init>(Landroid/appwidget/AppWidgetHostView;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v3, v4}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H;->i:Landroid/util/SparseArray;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public p(ILcom/android/launcher3/widget/U;Ljava/lang/Runnable;)Lcom/android/launcher3/util/a2;
    .locals 0

    .line 1
    new-instance p2, Lcom/android/launcher3/uioverrides/H$a;

    .line 2
    .line 3
    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/uioverrides/H$a;-><init>(Lcom/android/launcher3/uioverrides/H;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/uioverrides/H;->n0(I)Lcom/android/launcher3/uioverrides/H$c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p2}, Lcom/android/launcher3/uioverrides/H$c;->e(Lcom/android/launcher3/uioverrides/H$d;)Landroid/widget/RemoteViews;

    .line 11
    .line 12
    .line 13
    new-instance p1, Lcom/android/launcher3/uioverrides/y;

    .line 14
    .line 15
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/uioverrides/y;-><init>(Lcom/android/launcher3/uioverrides/H$c;Lcom/android/launcher3/uioverrides/H$d;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method public t()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/uioverrides/H;->m:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    :goto_0
    if-ltz v0, :cond_0

    .line 15
    .line 16
    sget-object v1, Lcom/android/launcher3/uioverrides/H;->m:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/uioverrides/H$c;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/H;->h:Lcom/android/launcher3/uioverrides/H$d;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/android/launcher3/uioverrides/H$c;->k(Lcom/android/launcher3/uioverrides/H$d;)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v0, v0, -0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected w(ILcom/android/launcher3/widget/U;)Lcom/android/launcher3/widget/T;
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/widget/suggest/v;->z(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/widget/suggest/m;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 10
    .line 11
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/widget/suggest/m;-><init>(Landroid/content/Context;I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/widget/suggest/g;->e(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/widget/suggest/f;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/suggest/f;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {p2}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->i(Lcom/android/launcher3/widget/U;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/widget/group/b;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 38
    .line 39
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/widget/group/b;-><init>(Landroid/content/Context;I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    invoke-static {p2, p1}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->k(Lcom/android/launcher3/widget/U;I)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    new-instance v0, Lcom/android/launcher3/widget/group/c;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 52
    .line 53
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/widget/group/c;-><init>(Landroid/content/Context;I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 58
    .line 59
    invoke-static {v0, p2, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->A(Landroid/content/Context;Lcom/android/launcher3/widget/U;I)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    new-instance v0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-direct {v0, v1, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;-><init>(Landroid/content/Context;ILcom/android/launcher3/widget/U;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    new-instance v0, Lcom/android/launcher3/widget/T;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->a:Landroid/content/Context;

    .line 76
    .line 77
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/T;-><init>(Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/widget/l0;->f:Ljava/util/function/Consumer;

    .line 81
    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    invoke-interface {v1, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :cond_5
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/widget/T;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1}, Lcom/android/launcher3/uioverrides/H;->n0(I)Lcom/android/launcher3/uioverrides/H$c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/H;->h:Lcom/android/launcher3/uioverrides/H$d;

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Lcom/android/launcher3/uioverrides/H$c;->e(Lcom/android/launcher3/uioverrides/H$d;)Landroid/widget/RemoteViews;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/T;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 101
    .line 102
    .line 103
    return-object v0
.end method

.method public x(I)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/l0;->c:Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/appwidget/AppWidgetHostView;

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/uioverrides/H;->m:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/m;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "deleteAppWidgetId  appWidgetId="

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, " hostView="

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    move-object v1, p0

    .line 46
    check-cast v1, Lcom/android/launcher3/widget/suggest/m;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/android/launcher3/widget/suggest/m;->getSuggestWidgetHostViewTag()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v2, "QuickstepWidgetHolder"

    .line 60
    .line 61
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0, p1, v1}, Lcom/android/launcher3/widget/suggest/v;->H(Lcom/android/launcher3/C2;ILcom/android/launcher3/widget/T;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method
