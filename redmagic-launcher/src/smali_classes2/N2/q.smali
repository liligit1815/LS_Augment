.class public final LN2/q;
.super Landroid/widget/FrameLayout;
.source "DismissView.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN2/q$a;,
        LN2/q$b;
    }
.end annotation


# static fields
.field public static final p:LN2/q$a;

.field private static final q:Ljava/lang/String;


# instance fields
.field private g:LN2/o;

.field private h:Z

.field private i:LN2/q$b;

.field private final j:LM2/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i<",
            "LN2/o;",
            ">;"
        }
    .end annotation
.end field

.field private final k:LM2/i$f;

.field private final l:J

.field private m:Landroid/view/WindowManager;

.field private n:Landroid/graphics/drawable/GradientDrawable;

.field private final o:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Landroid/graphics/drawable/GradientDrawable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LN2/q$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LN2/q$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LN2/q;->p:LN2/q$a;

    .line 8
    .line 9
    const-class v0, LN2/q;

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/D;->b(Ljava/lang/Class;)LB4/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, LB4/c;->d()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, LN2/q;->q:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, LN2/o;

    .line 10
    .line 11
    invoke-direct {v0, p1}, LN2/o;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, LN2/q;->g:LN2/o;

    .line 15
    .line 16
    sget-object v1, LM2/i;->n:LM2/i$b;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, LN2/q;->j:LM2/i;

    .line 23
    .line 24
    new-instance v0, LM2/i$f;

    .line 25
    .line 26
    const/high16 v1, 0x43480000    # 200.0f

    .line 27
    .line 28
    const/high16 v2, 0x3f400000    # 0.75f

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, LM2/i$f;-><init>(FF)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, LN2/q;->k:LM2/i$f;

    .line 34
    .line 35
    const-wide/16 v0, 0xc8

    .line 36
    .line 37
    iput-wide v0, p0, LN2/q;->l:J

    .line 38
    .line 39
    const-string v0, "window"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v0, "null cannot be cast to non-null type android.view.WindowManager"

    .line 46
    .line 47
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    check-cast p1, Landroid/view/WindowManager;

    .line 51
    .line 52
    iput-object p1, p0, LN2/q;->m:Landroid/view/WindowManager;

    .line 53
    .line 54
    new-instance p1, LN2/q$c;

    .line 55
    .line 56
    invoke-direct {p1}, LN2/q$c;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, LN2/q;->o:Landroid/util/IntProperty;

    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 66
    .line 67
    .line 68
    const/4 p1, 0x4

    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, LN2/q;->g:LN2/o;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static synthetic a(LN2/q;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, LN2/q;->e(LN2/q;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final b(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, LN2/q;->q:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "The view isn\'t ready. Should be called after `setup`"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p1
.end method

.method private final c(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Lz/a;->c(Landroid/content/Context;I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const p1, 0x43328000    # 178.5f

    .line 10
    .line 11
    .line 12
    float-to-int p1, p1

    .line 13
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p1, v0, v1, p0}, Landroid/graphics/Color;->argb(IIII)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 30
    .line 31
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    filled-new-array {p0, v1}, [I

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {p1, v0, p0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setDither(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 46
    .line 47
    .line 48
    return-object p1
.end method

.method private static final e(LN2/q;)Lh4/t;
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, LN2/q;->g:LN2/o;

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, LN2/q;->g:LN2/o;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 18
    .line 19
    return-object p0
.end method

.method private final g()V
    .locals 3

    .line 1
    iget-object v0, p0, LN2/q;->i:LN2/q$b;

    .line 2
    .line 3
    invoke-direct {p0, v0}, LN2/q;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LN2/q$b;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v1, p0, LN2/q;->m:Landroid/view/WindowManager;

    .line 13
    .line 14
    invoke-interface {v1}, Landroid/view/WindowManager;->getCurrentWindowMetrics()Landroid/view/WindowMetrics;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Landroid/view/WindowMetrics;->getWindowInsets()Landroid/view/WindowInsets;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "getWindowInsets(...)"

    .line 23
    .line 24
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v1, v2}, Landroid/view/WindowInsets;->getInsetsIgnoringVisibility(I)Landroid/graphics/Insets;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "getInsetsIgnoringVisibility(...)"

    .line 36
    .line 37
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget v1, v1, Landroid/graphics/Insets;->bottom:I

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v0}, LN2/q$b;->b()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/2addr v1, v0

    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, v0, v0, v0, v1}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public final d()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-boolean v1, p0, LN2/q;->h:Z

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object v1, p0, LN2/q;->n:Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-direct {p0, v1}, LN2/q;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_1
    iput-boolean v0, p0, LN2/q;->h:Z

    .line 19
    .line 20
    iget-object v2, p0, LN2/q;->o:Landroid/util/IntProperty;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/drawable/GradientDrawable;->getAlpha()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    filled-new-array {v3, v0}, [I

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-wide v2, p0, LN2/q;->l:J

    .line 35
    .line 36
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, LN2/q;->j:LM2/i;

    .line 43
    .line 44
    sget-object v2, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 45
    .line 46
    const-string v3, "TRANSLATION_Y"

    .line 47
    .line 48
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    int-to-float v3, v3

    .line 56
    iget-object v4, p0, LN2/q;->k:LM2/i$f;

    .line 57
    .line 58
    invoke-virtual {v1, v2, v3, v4}, LM2/i;->D(Landroidx/dynamicanimation/animation/g;FLM2/i$f;)LM2/i;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, LN2/p;

    .line 63
    .line 64
    invoke-direct {v2, p0}, LN2/p;-><init>(LN2/q;)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    new-array p0, p0, [Lu4/a;

    .line 69
    .line 70
    aput-object v2, p0, v0

    .line 71
    .line 72
    invoke-virtual {v1, p0}, LM2/i;->I([Lu4/a;)LM2/i;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, LM2/i;->F()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    iget-boolean v0, p0, LN2/q;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, LN2/q;->n:Landroid/graphics/drawable/GradientDrawable;

    .line 7
    .line 8
    invoke-direct {p0, v0}, LN2/q;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    const/4 v1, 0x1

    .line 18
    iput-boolean v1, p0, LN2/q;->h:Z

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, LN2/q;->o:Landroid/util/IntProperty;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getAlpha()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/16 v3, 0xff

    .line 31
    .line 32
    filled-new-array {v2, v3}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-wide v1, p0, LN2/q;->l:J

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, LN2/q;->j:LM2/i;

    .line 49
    .line 50
    invoke-virtual {v0}, LM2/i;->k()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, LN2/q;->j:LM2/i;

    .line 54
    .line 55
    sget-object v1, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 56
    .line 57
    const-string v2, "TRANSLATION_Y"

    .line 58
    .line 59
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    iget-object p0, p0, LN2/q;->k:LM2/i$f;

    .line 64
    .line 65
    invoke-virtual {v0, v1, v2, p0}, LM2/i;->D(Landroidx/dynamicanimation/animation/g;FLM2/i$f;)LM2/i;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, LM2/i;->F()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final getCircle()LN2/o;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/q;->g:LN2/o;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getConfig()LN2/q$b;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/q;->i:LN2/q$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setCircle(LN2/o;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LN2/q;->g:LN2/o;

    .line 7
    .line 8
    return-void
.end method

.method public final setConfig(LN2/q$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LN2/q;->i:LN2/q$b;

    .line 2
    .line 3
    return-void
.end method

.method public final setShowing(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LN2/q;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setup(LN2/q$b;)V
    .locals 4

    .line 1
    const-string v0, "config"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LN2/q;->i:LN2/q$b;

    .line 7
    .line 8
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1}, LN2/q$b;->e()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/16 v2, 0x50

    .line 23
    .line 24
    const/4 v3, -0x1

    .line 25
    invoke-direct {v0, v3, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, LN2/q;->g()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, LN2/q$b;->d()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-direct {p0, v0}, LN2/q;->c(I)Landroid/graphics/drawable/GradientDrawable;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, LN2/q;->n:Landroid/graphics/drawable/GradientDrawable;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, LN2/q;->g:LN2/o;

    .line 48
    .line 49
    invoke-virtual {p1}, LN2/q$b;->c()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setId(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, LN2/q;->g:LN2/o;

    .line 57
    .line 58
    invoke-virtual {p1}, LN2/q$b;->a()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p1}, LN2/q$b;->f()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {p1}, LN2/q$b;->g()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-virtual {v0, v1, v2, v3}, LN2/o;->b(III)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1}, LN2/q$b;->h()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iget-object v1, p0, LN2/q;->g:LN2/o;

    .line 86
    .line 87
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 88
    .line 89
    const/16 v3, 0x51

    .line 90
    .line 91
    invoke-direct {v2, v0, v0, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, LN2/q;->g:LN2/o;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p1}, LN2/q$b;->e()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    int-to-float p0, p0

    .line 112
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 113
    .line 114
    .line 115
    return-void
.end method
