.class public final Ln1/t$c;
.super Ljava/lang/Object;
.source "ShapeDelegate.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ln1/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# static fields
.field static final synthetic a:Ln1/t$c;

.field private static b:Ln1/t;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ln1/t$c;

    .line 2
    .line 3
    invoke-direct {v0}, Ln1/t$c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ln1/t$c;->a:Ln1/t$c;

    .line 7
    .line 8
    new-instance v0, Ln1/t$e;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1}, Ln1/t$e;-><init>(F)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ln1/t$c;->b:Ln1/t;

    .line 15
    .line 16
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

.method public static synthetic a(Landroid/graphics/Path;Landroid/graphics/Region;Landroid/graphics/Region;Landroid/graphics/Region;Ln1/t;)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Ln1/t$c;->c(Landroid/graphics/Path;Landroid/graphics/Region;Landroid/graphics/Region;Landroid/graphics/Region;Ln1/t;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final c(Landroid/graphics/Path;Landroid/graphics/Region;Landroid/graphics/Region;Landroid/graphics/Region;Ln1/t;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Path;->reset()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/high16 v1, 0x43fa0000    # 500.0f

    .line 6
    .line 7
    invoke-interface {p4, p0, v0, v0, v1}, Ln1/t;->c(Landroid/graphics/Path;FFF)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    .line 11
    .line 12
    .line 13
    sget-object p0, Landroid/graphics/Region$Op;->XOR:Landroid/graphics/Region$Op;

    .line 14
    .line 15
    invoke-virtual {p1, p3, p0}, Landroid/graphics/Region;->op(Landroid/graphics/Region;Landroid/graphics/Region$Op;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ls1/q;->c(Landroid/graphics/Region;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method


# virtual methods
.method public final b(Landroid/graphics/Path;)Lu4/l;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Path;",
            ")",
            "Lu4/l<",
            "Ln1/t;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "base"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/graphics/Region;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/16 v1, 0x3e8

    .line 10
    .line 11
    invoke-direct {p0, v0, v0, v1, v1}, Landroid/graphics/Region;-><init>(IIII)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Landroid/graphics/Region;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1, p0}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    .line 20
    .line 21
    .line 22
    new-instance p1, Landroid/graphics/Path;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v1, Landroid/graphics/Region;

    .line 28
    .line 29
    invoke-direct {v1}, Landroid/graphics/Region;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ln1/u;

    .line 33
    .line 34
    invoke-direct {v2, p1, v1, p0, v0}, Ln1/u;-><init>(Landroid/graphics/Path;Landroid/graphics/Region;Landroid/graphics/Region;Landroid/graphics/Region;)V

    .line 35
    .line 36
    .line 37
    return-object v2
.end method

.method public final d(FFFFF)LU/x;
    .locals 9

    .line 1
    sget-object v0, LU/x;->d:LU/x$a;

    .line 2
    .line 3
    sub-float v1, p3, p1

    .line 4
    .line 5
    sub-float v2, p4, p2

    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    int-to-float p1, p0

    .line 9
    div-float v5, v1, p1

    .line 10
    .line 11
    div-float v6, v2, p1

    .line 12
    .line 13
    new-instance v3, LU/b;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    const/4 p2, 0x0

    .line 17
    invoke-direct {v3, p5, p1, p0, p2}, LU/b;-><init>(FFILkotlin/jvm/internal/j;)V

    .line 18
    .line 19
    .line 20
    const/16 v7, 0x8

    .line 21
    .line 22
    const/4 v8, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-static/range {v0 .. v8}, LU/z;->b(LU/x$a;FFLU/b;Ljava/util/List;FFILjava/lang/Object;)LU/x;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final e(Landroid/graphics/Path;Ljava/lang/String;)Ln1/t;
    .locals 5

    .line 1
    const-string v0, "baseShape"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "shapeStr"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ln1/t$c;->b(Landroid/graphics/Path;)Lu4/l;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ln1/t$a;

    .line 16
    .line 17
    invoke-direct {p1}, Ln1/t$a;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Number;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    const/16 v2, 0x15

    .line 32
    .line 33
    if-ge v1, v2, :cond_1

    .line 34
    .line 35
    new-instance v2, Ln1/t$e;

    .line 36
    .line 37
    int-to-float v3, v1

    .line 38
    const/16 v4, 0x14

    .line 39
    .line 40
    int-to-float v4, v4

    .line 41
    div-float/2addr v3, v4

    .line 42
    invoke-direct {v2, v3}, Ln1/t$e;-><init>(F)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p0, v2}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Ljava/lang/Number;

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-ge v3, v0, :cond_0

    .line 56
    .line 57
    move-object p1, v2

    .line 58
    move v0, v3

    .line 59
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-lez p0, :cond_2

    .line 67
    .line 68
    const/16 p0, 0x3e8

    .line 69
    .line 70
    if-le v0, p0, :cond_2

    .line 71
    .line 72
    :try_start_0
    new-instance p0, Ln1/t$d;

    .line 73
    .line 74
    invoke-direct {p0, p2}, Ln1/t$d;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-object p0

    .line 78
    :catch_0
    move-exception p0

    .line 79
    const-string p2, "ShapeDelegate"

    .line 80
    .line 81
    const-string v0, "Error converting mask to generic shape"

    .line 82
    .line 83
    invoke-static {p2, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 84
    .line 85
    .line 86
    :cond_2
    return-object p1
.end method

.method public final f(Ljava/lang/String;)Ln1/t;
    .locals 3

    .line 1
    const-string v0, "shapeStr"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, LB/c;->e(Ljava/lang/String;)Landroid/graphics/Path;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Landroid/graphics/Matrix;

    .line 17
    .line 18
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 19
    .line 20
    .line 21
    const/high16 v2, 0x41200000    # 10.0f

    .line 22
    .line 23
    invoke-virtual {v1, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 31
    .line 32
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 33
    .line 34
    const/high16 v2, -0x1000000

    .line 35
    .line 36
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-direct {v0, v2, v1}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    const/16 v2, 0x3e8

    .line 45
    .line 46
    invoke-virtual {v0, v1, v1, v2, v2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->setBounds(IIII)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getIconMask()Landroid/graphics/Path;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    :goto_0
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0, p1}, Ln1/t$c;->e(Landroid/graphics/Path;Ljava/lang/String;)Ln1/t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method
