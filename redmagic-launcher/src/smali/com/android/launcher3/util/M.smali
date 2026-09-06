.class public final Lcom/android/launcher3/util/M;
.super Ljava/lang/Object;
.source "DimensionUtils.kt"


# static fields
.field public static final a:Lcom/android/launcher3/util/M;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/M;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/M;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/M;->a:Lcom/android/launcher3/util/M;

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

.method public static final a(Lcom/android/launcher3/h0;Landroid/content/res/Resources;ZZ)Landroid/graphics/Point;
    .locals 2

    .line 1
    const-string v0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "res"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 20
    .line 21
    iget p0, p0, Lcom/android/launcher3/h0;->r3:I

    .line 22
    .line 23
    iput p0, v0, Landroid/graphics/Point;->y:I

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    if-eqz p3, :cond_1

    .line 27
    .line 28
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 29
    .line 30
    const p0, 0x7f070bb6

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    iput p0, v0, Landroid/graphics/Point;->y:I

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 41
    .line 42
    const p2, 0x7f070ba8

    .line 43
    .line 44
    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    iput p0, v0, Landroid/graphics/Point;->y:I

    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_2
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    iput p0, v0, Landroid/graphics/Point;->x:I

    .line 61
    .line 62
    iput v1, v0, Landroid/graphics/Point;->y:I

    .line 63
    .line 64
    return-object v0
.end method
