.class public final LH1/q$a;
.super Ljava/lang/Object;
.source "SizeSpec.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LH1/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LH1/q$a;-><init>()V

    return-void
.end method

.method private final b(Landroid/content/res/TypedArray;I)F
    .locals 2

    .line 1
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x4

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x5

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    invoke-virtual {p1, p2, p0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    int-to-float p0, p0

    .line 19
    return p0

    .line 20
    :cond_1
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/util/W1;Landroid/util/AttributeSet;)LH1/q;
    .locals 6

    .line 1
    const-string v0, "resourceHelper"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "attrs"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/x5;->R2:[I

    .line 12
    .line 13
    const-string v1, "SizeSpec"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/util/W1;->b(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-direct {p0, p1, p2}, LH1/q$a;->b(Landroid/content/res/TypedArray;I)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v0, 0x3

    .line 28
    invoke-direct {p0, p1, v0}, LH1/q$a;->b(Landroid/content/res/TypedArray;I)F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v0, 0x4

    .line 33
    invoke-direct {p0, p1, v0}, LH1/q$a;->b(Landroid/content/res/TypedArray;I)F

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 p0, 0x1

    .line 38
    invoke-virtual {p1, p0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    const/4 p0, 0x2

    .line 43
    const p2, 0x7fffffff

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 51
    .line 52
    .line 53
    new-instance v0, LH1/q;

    .line 54
    .line 55
    invoke-direct/range {v0 .. v5}, LH1/q;-><init>(FFFZI)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method
