.class public final Landroidx/activity/a;
.super Ljava/lang/Object;
.source "BackEventCompat.kt"


# static fields
.field public static final a:Landroidx/activity/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/activity/a;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/activity/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/activity/a;->a:Landroidx/activity/a;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(FFFI)Landroid/window/BackEvent;
    .locals 0

    .line 1
    new-instance p0, Landroid/window/BackEvent;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/window/BackEvent;-><init>(FFFI)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final b(Landroid/window/BackEvent;)F
    .locals 0

    .line 1
    const-string p0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/window/BackEvent;->getProgress()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final c(Landroid/window/BackEvent;)I
    .locals 0

    .line 1
    const-string p0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/window/BackEvent;->getSwipeEdge()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final d(Landroid/window/BackEvent;)F
    .locals 0

    .line 1
    const-string p0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchX()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final e(Landroid/window/BackEvent;)F
    .locals 0

    .line 1
    const-string p0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/window/BackEvent;->getTouchY()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method
