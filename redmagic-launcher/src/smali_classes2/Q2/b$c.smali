.class public final LQ2/b$c;
.super Ljava/lang/Object;
.source "MagnetizedObject.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LQ2/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field private final a:Landroid/view/View;

.field private b:I

.field private final c:Landroid/graphics/PointF;

.field private d:I

.field private final e:[I


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 1

    .line 1
    const-string v0, "targetView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 10
    .line 11
    iput p2, p0, LQ2/b$c;->b:I

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/PointF;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, LQ2/b$c;->c:Landroid/graphics/PointF;

    .line 19
    .line 20
    const/4 p1, 0x2

    .line 21
    new-array p1, p1, [I

    .line 22
    .line 23
    iput-object p1, p0, LQ2/b$c;->e:[I

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(LQ2/b$c;)V
    .locals 0

    .line 1
    invoke-static {p0}, LQ2/b$c;->h(LQ2/b$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final h(LQ2/b$c;)V
    .locals 5

    .line 1
    iget-object v0, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, LQ2/b$c;->e:[I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LQ2/b$c;->c:Landroid/graphics/PointF;

    .line 9
    .line 10
    iget-object v1, p0, LQ2/b$c;->e:[I

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aget v1, v1, v2

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    iget-object v2, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-float v2, v2

    .line 23
    const/high16 v3, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v2, v3

    .line 26
    add-float/2addr v1, v2

    .line 27
    iget-object v2, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    sub-float/2addr v1, v2

    .line 34
    iget-object v2, p0, LQ2/b$c;->e:[I

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    aget v2, v2, v4

    .line 38
    .line 39
    int-to-float v2, v2

    .line 40
    iget-object v4, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    int-to-float v4, v4

    .line 47
    div-float/2addr v4, v3

    .line 48
    add-float/2addr v2, v4

    .line 49
    iget-object p0, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    sub-float/2addr v2, p0

    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public final b()F
    .locals 0

    .line 1
    iget-object p0, p0, LQ2/b$c;->c:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    return p0
.end method

.method public final c()F
    .locals 1

    .line 1
    iget-object v0, p0, LQ2/b$c;->c:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 4
    .line 5
    iget p0, p0, LQ2/b$c;->d:I

    .line 6
    .line 7
    int-to-float p0, p0

    .line 8
    add-float/2addr v0, p0

    .line 9
    return v0
.end method

.method public final d()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, LQ2/b$c;->c:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, LQ2/b$c;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final f()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, LQ2/b$c;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, LQ2/c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LQ2/c;-><init>(LQ2/b$c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
