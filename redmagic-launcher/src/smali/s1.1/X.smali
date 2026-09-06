.class public final Ls1/X;
.super Ls1/b;
.source "LauncherIcons.kt"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/X$a;,
        Ls1/X$b;,
        Ls1/X$c;
    }
.end annotation


# static fields
.field public static final B:Ls1/X$a;


# instance fields
.field private final A:F

.field private x:Ln1/C;

.field private y:LD1/t;

.field private final z:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Ls1/X;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ls1/X$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ls1/X$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ls1/X;->B:Ls1/X$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Ln1/C;LD1/t;Ljava/util/concurrent/ConcurrentLinkedQueue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/F1;",
            "Ln1/C;",
            "LD1/t;",
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Ls1/X;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "idp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "themeManager"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "userCache"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "pool"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget v0, p2, Lcom/android/launcher3/F1;->O0:I

    .line 27
    .line 28
    iget p2, p2, Lcom/android/launcher3/F1;->N0:I

    .line 29
    .line 30
    invoke-direct {p0, p1, v0, p2}, Ls1/b;-><init>(Landroid/content/Context;II)V

    .line 31
    .line 32
    .line 33
    iput-object p3, p0, Ls1/X;->x:Ln1/C;

    .line 34
    .line 35
    iput-object p4, p0, Ls1/X;->y:LD1/t;

    .line 36
    .line 37
    iput-object p5, p0, Ls1/X;->z:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 38
    .line 39
    invoke-virtual {p3}, Ln1/C;->k()Ln1/C$c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ln1/C$c;->d()F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Ls1/X;->A:F

    .line 48
    .line 49
    iget-object p1, p0, Ls1/X;->x:Ln1/C;

    .line 50
    .line 51
    invoke-virtual {p1}, Ln1/C;->l()Ls1/U;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Ls1/b;->n:Ls1/U;

    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    invoke-static {p0}, Ls1/b;->i0(Z)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lx1/O;->e4()Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "needForceWrapAdaptiveIcon(...)"

    .line 66
    .line 67
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-static {p0}, Ls1/b;->h0(Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static final m0(Landroid/content/Context;)Ls1/X;
    .locals 1

    .line 1
    sget-object v0, Ls1/X;->B:Ls1/X$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ls1/X$a;->a(Landroid/content/Context;)Ls1/X;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method protected C(Landroid/graphics/Canvas;Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Path;)V
    .locals 2

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "drawable"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "overridePath"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-super {p0, p1, p2, p3}, Ls1/b;->C(Landroid/graphics/Canvas;Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Path;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1, p3}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 27
    .line 28
    .line 29
    const/high16 p3, -0x1000000

    .line 30
    .line 31
    invoke-virtual {p1, p3}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 35
    .line 36
    .line 37
    iget p0, p0, Ls1/X;->A:F

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    int-to-float p3, p3

    .line 44
    const/high16 v0, 0x40000000    # 2.0f

    .line 45
    .line 46
    div-float/2addr p3, v0

    .line 47
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v1, v1

    .line 52
    div-float/2addr v1, v0

    .line 53
    invoke-virtual {p1, p0, p0, p3, v1}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public L()F
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Ls1/b;->L()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Ls1/X;->x:Ln1/C;

    .line 13
    .line 14
    invoke-virtual {p0}, Ln1/C;->k()Ln1/C$c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ln1/C$c;->d()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public T(Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Rect;)Landroid/graphics/Path;
    .locals 1

    .line 1
    const-string v0, "drawable"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "iconBounds"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-super {p0, p1, p2}, Ls1/b;->T(Landroid/graphics/drawable/AdaptiveIconDrawable;Landroid/graphics/Rect;)Landroid/graphics/Path;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "getShapePath(...)"

    .line 22
    .line 23
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    iget-object p0, p0, Ls1/X;->x:Ln1/C;

    .line 28
    .line 29
    invoke-virtual {p0}, Ln1/C;->j()Ln1/t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0, p2}, Ln1/t;->e(Landroid/graphics/Rect;)Landroid/graphics/Path;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method protected a0(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;
    .locals 1

    .line 1
    const-string v0, "user"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ls1/X;->y:LD1/t;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "getUserInfo(...)"

    .line 13
    .line 14
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public close()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/X;->n0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ls1/b;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ls1/X;->z:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method
