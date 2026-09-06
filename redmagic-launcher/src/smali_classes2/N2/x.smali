.class public final LN2/x;
.super Ljava/lang/Object;
.source "DropTargetManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN2/x$a;,
        LN2/x$b;,
        LN2/x$c;
    }
.end annotation


# static fields
.field private static final i:LN2/x$a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/widget/FrameLayout;

.field private final c:LN2/x$c;

.field private d:LN2/x$b;

.field private final e:LN2/y;

.field private f:Ly/z;

.field private g:Landroid/graphics/RectF;

.field private final h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LN2/x$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LN2/x$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LN2/x;->i:LN2/x$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/FrameLayout;LN2/x$c;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "container"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "dragZoneChangedListener"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, LN2/x;->a:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, LN2/x;->b:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    iput-object p3, p0, LN2/x;->c:LN2/x$c;

    .line 24
    .line 25
    new-instance p3, LN2/y;

    .line 26
    .line 27
    invoke-direct {p3, p1}, LN2/y;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    iput-object p3, p0, LN2/x;->e:LN2/y;

    .line 31
    .line 32
    new-instance p1, Landroid/graphics/RectF;

    .line 33
    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-direct {p1, p3, p3, p3, p3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, LN2/x;->g:Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput-boolean p1, p0, LN2/x;->h:Z

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(Ly/z;LN2/x;FLandroid/graphics/RectF;Landroid/graphics/Rect;Ly/d;)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, LN2/x;->o(Ly/z;LN2/x;FLandroid/graphics/RectF;Landroid/graphics/Rect;Ly/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(LN2/x;Ly/z;Ly/d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LN2/x;->m(LN2/x;Ly/z;Ly/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(LN2/x;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LN2/x;->g(LN2/x;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic d(LN2/x;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LN2/x;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method private final e(Ly/d;Lu4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ly/d;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, LN2/x$d;

    .line 2
    .line 3
    invoke-direct {p0, p2}, LN2/x$d;-><init>(Lu4/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ly/d;->b(Ly/d$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final g(LN2/x;)Lh4/t;
    .locals 1

    .line 1
    iget-object v0, p0, LN2/x;->b:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iget-object p0, p0, LN2/x;->e:LN2/y;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 9
    .line 10
    return-object p0
.end method

.method private final j()V
    .locals 3

    .line 1
    iget-object v0, p0, LN2/x;->e:LN2/y;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, LN2/x;->b:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    iget-object v1, p0, LN2/x;->e:LN2/y;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, LN2/x;->b:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    iget-object v1, p0, LN2/x;->e:LN2/y;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, LN2/x;->e:LN2/y;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, LN2/x;->e:LN2/y;

    .line 31
    .line 32
    iget-object v1, p0, LN2/x;->a:Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Lcom/android/wm/shell/shared/R$dimen;->drop_target_elevation:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, LN2/x;->e:LN2/y;

    .line 48
    .line 49
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 50
    .line 51
    const/4 v1, -0x1

    .line 52
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private final k(FFLu4/a;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LN2/x;->f:Ly/z;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ly/z;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    cmpg-float v0, p1, p2

    .line 9
    .line 10
    if-gez v0, :cond_1

    .line 11
    .line 12
    const-wide/16 v0, 0x96

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const-wide/16 v0, 0x64

    .line 16
    .line 17
    :goto_0
    const/4 v2, 0x2

    .line 18
    new-array v2, v2, [F

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    aput p1, v2, v3

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    aput p2, v2, p1

    .line 25
    .line 26
    invoke-static {v2}, Ly/z;->B([F)Ly/z;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, v0, v1}, Ly/z;->G(J)Ly/z;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string p2, "setDuration(...)"

    .line 35
    .line 36
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance p2, LN2/v;

    .line 40
    .line 41
    invoke-direct {p2, p0, p1}, LN2/v;-><init>(LN2/x;Ly/z;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ly/d;->c(Ly/d$c;)V

    .line 45
    .line 46
    .line 47
    if-eqz p3, :cond_2

    .line 48
    .line 49
    invoke-direct {p0, p1, p3}, LN2/x;->e(Ly/d;Lu4/a;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iput-object p1, p0, LN2/x;->f:Ly/z;

    .line 53
    .line 54
    invoke-virtual {p1}, Ly/z;->L()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method static synthetic l(LN2/x;FFLu4/a;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2, p3}, LN2/x;->k(FFLu4/a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final m(LN2/x;Ly/z;Ly/d;)V
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LN2/x;->e:LN2/y;

    .line 7
    .line 8
    invoke-virtual {p1}, Ly/z;->t()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string p2, "null cannot be cast to non-null type kotlin.Float"

    .line 13
    .line 14
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    check-cast p1, Ljava/lang/Float;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private final n(Landroid/graphics/Rect;)V
    .locals 7

    .line 1
    iget-object v0, p0, LN2/x;->f:Ly/z;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ly/z;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, LN2/x;->e:LN2/y;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    iget-object v0, p0, LN2/x;->e:LN2/y;

    .line 15
    .line 16
    invoke-virtual {v0}, LN2/y;->getRect()Landroid/graphics/RectF;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    const/4 v0, 0x2

    .line 21
    new-array v0, v0, [F

    .line 22
    .line 23
    fill-array-data v0, :array_0

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ly/z;->B([F)Ly/z;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-wide/16 v1, 0xfa

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Ly/z;->G(J)Ly/z;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v0, "setDuration(...)"

    .line 37
    .line 38
    invoke-static {v2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, LN2/w;

    .line 42
    .line 43
    move-object v3, p0

    .line 44
    move-object v6, p1

    .line 45
    invoke-direct/range {v1 .. v6}, LN2/w;-><init>(Ly/z;LN2/x;FLandroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ly/d;->c(Ly/d$c;)V

    .line 49
    .line 50
    .line 51
    iput-object v2, v3, LN2/x;->f:Ly/z;

    .line 52
    .line 53
    invoke-virtual {v2}, Ly/z;->L()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static final o(Ly/z;LN2/x;FLandroid/graphics/RectF;Landroid/graphics/Rect;Ly/d;)V
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ly/z;->t()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p5, "null cannot be cast to non-null type kotlin.Float"

    .line 11
    .line 12
    invoke-static {p0, p5}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    check-cast p0, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    iget-object p5, p1, LN2/x;->e:LN2/y;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    int-to-float v0, v0

    .line 25
    sub-float/2addr v0, p2

    .line 26
    mul-float/2addr v0, p0

    .line 27
    add-float/2addr p2, v0

    .line 28
    invoke-virtual {p5, p2}, Landroid/view/View;->setAlpha(F)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p1, LN2/x;->g:Landroid/graphics/RectF;

    .line 32
    .line 33
    iget p5, p3, Landroid/graphics/RectF;->left:F

    .line 34
    .line 35
    iget v0, p4, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    int-to-float v0, v0

    .line 38
    sub-float/2addr v0, p5

    .line 39
    mul-float/2addr v0, p0

    .line 40
    add-float/2addr p5, v0

    .line 41
    iput p5, p2, Landroid/graphics/RectF;->left:F

    .line 42
    .line 43
    iget p5, p3, Landroid/graphics/RectF;->top:F

    .line 44
    .line 45
    iget v0, p4, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    int-to-float v0, v0

    .line 48
    sub-float/2addr v0, p5

    .line 49
    mul-float/2addr v0, p0

    .line 50
    add-float/2addr p5, v0

    .line 51
    iput p5, p2, Landroid/graphics/RectF;->top:F

    .line 52
    .line 53
    iget p5, p3, Landroid/graphics/RectF;->right:F

    .line 54
    .line 55
    iget v0, p4, Landroid/graphics/Rect;->right:I

    .line 56
    .line 57
    int-to-float v0, v0

    .line 58
    sub-float/2addr v0, p5

    .line 59
    mul-float/2addr v0, p0

    .line 60
    add-float/2addr p5, v0

    .line 61
    iput p5, p2, Landroid/graphics/RectF;->right:F

    .line 62
    .line 63
    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    .line 64
    .line 65
    iget p4, p4, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    int-to-float p4, p4

    .line 68
    sub-float/2addr p4, p3

    .line 69
    mul-float/2addr p4, p0

    .line 70
    add-float/2addr p3, p4

    .line 71
    iput p3, p2, Landroid/graphics/RectF;->bottom:F

    .line 72
    .line 73
    iget-object p0, p1, LN2/x;->e:LN2/y;

    .line 74
    .line 75
    invoke-virtual {p0, p2}, LN2/y;->b(Landroid/graphics/RectF;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private final p()V
    .locals 13

    .line 1
    iget-object v0, p0, LN2/x;->d:LN2/x$b;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, LN2/x$b;->a()LN2/r;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {v0}, LN2/r;->a()Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, LN2/x;->e:LN2/y;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v5, 0x4

    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v3, 0x0

    .line 27
    const/4 v4, 0x0

    .line 28
    move-object v1, p0

    .line 29
    invoke-static/range {v1 .. v6}, LN2/x;->l(LN2/x;FFLu4/a;ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    move-object v1, p0

    .line 34
    iget-object p0, v1, LN2/x;->e:LN2/y;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    const/4 v2, 0x0

    .line 41
    cmpg-float p0, p0, v2

    .line 42
    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    iget-object p0, v1, LN2/x;->e:LN2/y;

    .line 46
    .line 47
    new-instance v2, Landroid/graphics/RectF;

    .line 48
    .line 49
    invoke-direct {v2, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v2}, LN2/y;->b(Landroid/graphics/RectF;)V

    .line 53
    .line 54
    .line 55
    const/4 v11, 0x4

    .line 56
    const/4 v12, 0x0

    .line 57
    const/4 v8, 0x0

    .line 58
    const/high16 v9, 0x3f800000    # 1.0f

    .line 59
    .line 60
    const/4 v10, 0x0

    .line 61
    move-object v7, v1

    .line 62
    invoke-static/range {v7 .. v12}, LN2/x;->l(LN2/x;FFLu4/a;ILjava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    invoke-direct {v1, v0}, LN2/x;->n(Landroid/graphics/Rect;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public final f()V
    .locals 4

    .line 1
    iget-object v0, p0, LN2/x;->d:LN2/x$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, LN2/x;->e:LN2/y;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    new-instance v2, LN2/u;

    .line 13
    .line 14
    invoke-direct {v2, p0}, LN2/u;-><init>(LN2/x;)V

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-direct {p0, v1, v3, v2}, LN2/x;->k(FFLu4/a;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, LN2/x;->c:LN2/x$c;

    .line 22
    .line 23
    invoke-virtual {v0}, LN2/x$b;->a()LN2/r;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v1, v0}, LN2/x$c;->c(LN2/r;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, LN2/x;->d:LN2/x$b;

    .line 32
    .line 33
    return-void
.end method

.method public final h(LN2/t;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LN2/t;",
            "Ljava/util/List<",
            "+",
            "LN2/r;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "draggedObject"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dragZones"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, LN2/x$b;

    .line 12
    .line 13
    invoke-direct {v0, p0, p2, p1}, LN2/x$b;-><init>(LN2/x;Ljava/util/List;LN2/t;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, LN2/x;->c:LN2/x$c;

    .line 17
    .line 18
    invoke-virtual {v0}, LN2/x$b;->c()LN2/r$a;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-interface {p1, p2}, LN2/x$c;->b(LN2/r;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, LN2/x;->d:LN2/x$b;

    .line 26
    .line 27
    iget-object p1, p0, LN2/x;->f:Ly/z;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Ly/z;->cancel()V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-direct {p0}, LN2/x;->j()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final i(II)V
    .locals 2

    .line 1
    iget-object v0, p0, LN2/x;->d:LN2/x$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, LN2/x$b;->a()LN2/r;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, p1, p2}, LN2/x$b;->d(II)LN2/r;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v0, p1}, LN2/x$b;->e(LN2/r;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-nez p2, :cond_1

    .line 22
    .line 23
    iget-object p2, p0, LN2/x;->c:LN2/x$c;

    .line 24
    .line 25
    invoke-virtual {v0}, LN2/x$b;->b()LN2/t;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {p2, v0, v1, p1}, LN2/x$c;->a(LN2/t;LN2/r;LN2/r;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, LN2/x;->p()V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method
