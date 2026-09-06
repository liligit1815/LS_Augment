.class public abstract LN2/f;
.super Ljava/lang/Object;
.source "BaseBubblePinController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN2/f$a;,
        LN2/f$b;
    }
.end annotation


# static fields
.field public static final i:LN2/f$a;


# instance fields
.field private final a:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation
.end field

.field private b:Z

.field private c:Z

.field private d:Landroid/graphics/RectF;

.field private e:Z

.field private f:I

.field private g:LN2/f$b;

.field private h:Ly/s;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LN2/f$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LN2/f$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LN2/f;->i:LN2/f$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "+",
            "Landroid/graphics/Point;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "screenSizeProvider"

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
    iput-object p1, p0, LN2/f;->a:Lu4/a;

    .line 10
    .line 11
    return-void
.end method

.method private static final A(LN2/f;LN2/h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LN2/f;->B(LN2/h;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p2}, LN2/f;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(LN2/f;)V
    .locals 0

    .line 1
    invoke-static {p0}, LN2/f;->h(LN2/f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(ZLN2/f;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LN2/f;->w(ZLN2/f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ljava/lang/Runnable;LN2/f;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LN2/f;->j(Ljava/lang/Runnable;LN2/f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(LN2/f;LN2/h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LN2/f;->A(LN2/f;LN2/h;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(LN2/f;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LN2/f;->q(LN2/f;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final f(Ly/d;Ljava/lang/Runnable;)Ly/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ly/d;",
            ">(TT;",
            "Ljava/lang/Runnable;",
            ")TT;"
        }
    .end annotation

    .line 1
    new-instance p0, LN2/f$c;

    .line 2
    .line 3
    invoke-direct {p0, p2}, LN2/f$c;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ly/d;->b(Ly/d$a;)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method private final g(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, LN2/f;->h:Ly/s;

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
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    new-array v1, v1, [F

    .line 12
    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    aput v2, v1, v3

    .line 17
    .line 18
    invoke-static {p1, v0, v1}, Ly/s;->R(Ljava/lang/Object;Landroid/util/Property;[F)Ly/s;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-wide/16 v0, 0x96

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Ly/s;->S(J)Ly/s;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, LN2/e;

    .line 29
    .line 30
    invoke-direct {v0, p0}, LN2/e;-><init>(LN2/f;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, p1, v0}, LN2/f;->f(Ly/d;Ljava/lang/Runnable;)Ly/d;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ly/s;

    .line 38
    .line 39
    iput-object p1, p0, LN2/f;->h:Ly/s;

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1}, Ly/s;->L()V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method private static final h(LN2/f;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, LN2/f;->h:Ly/s;

    .line 3
    .line 4
    return-void
.end method

.method private final i(Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    iget-object v0, p0, LN2/f;->h:Ly/s;

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
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    new-array v1, v1, [F

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x0

    .line 15
    aput v2, v1, v3

    .line 16
    .line 17
    invoke-static {p1, v0, v1}, Ly/s;->R(Ljava/lang/Object;Landroid/util/Property;[F)Ly/s;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-wide/16 v0, 0x64

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Ly/s;->S(J)Ly/s;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, LN2/d;

    .line 28
    .line 29
    invoke-direct {v0, p2, p0}, LN2/d;-><init>(Ljava/lang/Runnable;LN2/f;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p1, v0}, LN2/f;->f(Ly/d;Ljava/lang/Runnable;)Ly/d;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ly/s;

    .line 37
    .line 38
    iput-object p1, p0, LN2/f;->h:Ly/s;

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1}, Ly/s;->L()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method private static final j(Ljava/lang/Runnable;LN2/f;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    iput-object p0, p1, LN2/f;->h:Ly/s;

    .line 8
    .line 9
    return-void
.end method

.method private final m()Landroid/graphics/RectF;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0}, LN2/f;->o()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, LN2/f;->n()F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, LN2/f;->a:Lu4/a;

    .line 16
    .line 17
    invoke-interface {v1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/graphics/Point;

    .line 22
    .line 23
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 24
    .line 25
    iget p0, p0, LN2/f;->f:I

    .line 26
    .line 27
    int-to-float p0, p0

    .line 28
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, 0x2

    .line 33
    int-to-float v3, v3

    .line 34
    div-float/2addr v2, v3

    .line 35
    sub-float/2addr p0, v2

    .line 36
    int-to-float v1, v1

    .line 37
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    sub-float/2addr v1, v2

    .line 42
    invoke-virtual {v0, p0, v1}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method private static final q(LN2/f;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LN2/f;->x(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final u(LN2/h;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LN2/f;->z(LN2/h;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, LN2/f;->g:LN2/f$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, LN2/f$b;->a(LN2/h;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private static final w(ZLN2/f;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-boolean p0, p1, LN2/f;->c:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, LN2/h;->i:LN2/h;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, LN2/h;->j:LN2/h;

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p1, p0}, LN2/f;->B(LN2/h;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method


# virtual methods
.method protected abstract B(LN2/h;)V
.end method

.method protected abstract k()Landroid/view/View;
.end method

.method protected abstract l()Landroid/view/View;
.end method

.method protected abstract n()F
.end method

.method protected abstract o()F
.end method

.method public final p()V
    .locals 2

    .line 1
    invoke-virtual {p0}, LN2/f;->l()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, LN2/b;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0}, LN2/b;-><init>(LN2/f;Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0, v1}, LN2/f;->i(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LN2/f;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, LN2/f;->d:Landroid/graphics/RectF;

    .line 6
    .line 7
    iget-object v0, p0, LN2/f;->g:LN2/f$b;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-boolean p0, p0, LN2/f;->c:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, LN2/h;->i:LN2/h;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p0, LN2/h;->j:LN2/h;

    .line 19
    .line 20
    :goto_0
    invoke-interface {v0, p0}, LN2/f$b;->c(LN2/h;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final s(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, LN2/f;->b:Z

    .line 2
    .line 3
    iput-boolean p1, p0, LN2/f;->c:Z

    .line 4
    .line 5
    iget-object v0, p0, LN2/f;->a:Lu4/a;

    .line 6
    .line 7
    invoke-interface {v0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/graphics/Point;

    .line 12
    .line 13
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 14
    .line 15
    div-int/lit8 v0, v0, 0x2

    .line 16
    .line 17
    iput v0, p0, LN2/f;->f:I

    .line 18
    .line 19
    invoke-direct {p0}, LN2/f;->m()Landroid/graphics/RectF;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, LN2/f;->d:Landroid/graphics/RectF;

    .line 24
    .line 25
    iget-object p0, p0, LN2/f;->g:LN2/f$b;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    sget-object p1, LN2/h;->i:LN2/h;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget-object p1, LN2/h;->j:LN2/h;

    .line 35
    .line 36
    :goto_0
    invoke-interface {p0, p1}, LN2/f$b;->b(LN2/h;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public final t(FF)V
    .locals 2

    .line 1
    iget-object v0, p0, LN2/f;->d:Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean p2, p0, LN2/f;->c:Z

    .line 14
    .line 15
    iget v0, p0, LN2/f;->f:I

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    cmpg-float p1, p1, v0

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    if-gez p1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v1, v0

    .line 25
    :goto_0
    iput-boolean v1, p0, LN2/f;->c:Z

    .line 26
    .line 27
    if-eq p2, v1, :cond_3

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    sget-object p1, LN2/h;->i:LN2/h;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    sget-object p1, LN2/h;->j:LN2/h;

    .line 35
    .line 36
    :goto_1
    invoke-direct {p0, p1}, LN2/f;->u(LN2/h;)V

    .line 37
    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    iget-boolean p1, p0, LN2/f;->e:Z

    .line 41
    .line 42
    if-eqz p1, :cond_4

    .line 43
    .line 44
    invoke-virtual {p0}, LN2/f;->l()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    invoke-direct {p0, p1}, LN2/f;->g(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    :goto_2
    iput-boolean v0, p0, LN2/f;->e:Z

    .line 54
    .line 55
    return-void
.end method

.method public final v()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LN2/f;->e:Z

    .line 3
    .line 4
    iget-boolean v1, p0, LN2/f;->c:Z

    .line 5
    .line 6
    iget-boolean v2, p0, LN2/f;->b:Z

    .line 7
    .line 8
    if-eq v1, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iput-boolean v2, p0, LN2/f;->c:Z

    .line 15
    .line 16
    iget-object v1, p0, LN2/f;->g:LN2/f$b;

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    sget-object v2, LN2/h;->i:LN2/h;

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    sget-object v2, LN2/h;->j:LN2/h;

    .line 26
    .line 27
    :goto_1
    invoke-interface {v1, v2}, LN2/f$b;->a(LN2/h;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    invoke-virtual {p0}, LN2/f;->l()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    new-instance v2, LN2/a;

    .line 37
    .line 38
    invoke-direct {v2, v0, p0}, LN2/a;-><init>(ZLN2/f;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, v1, v2}, LN2/f;->i(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method protected abstract x(Landroid/view/View;)V
.end method

.method public final y(LN2/f$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LN2/f;->g:LN2/f$b;

    .line 2
    .line 3
    return-void
.end method

.method public final z(LN2/h;)V
    .locals 3

    .line 1
    const-string v0, "location"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LN2/f;->l()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, LN2/f;->k()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    cmpl-float v1, v2, v1

    .line 25
    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    new-instance v1, LN2/c;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1, v0}, LN2/c;-><init>(LN2/f;LN2/h;Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, v0, v1}, LN2/f;->i(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-virtual {p0, p1}, LN2/f;->B(LN2/h;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, v0}, LN2/f;->g(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
