.class public Lcom/android/launcher3/taskbar/U0;
.super Ljava/lang/Object;
.source "StashedHandleViewController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;
.implements Lcom/android/quickstep/NavHandle;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:Landroid/content/SharedPreferences;

.field private final i:Lcom/android/launcher3/taskbar/StashedHandleView;

.field private j:I

.field private final k:I

.field private l:LP2/d;

.field private final m:Lcom/android/launcher3/util/B1;

.field private final n:Lcom/android/launcher3/anim/d;

.field private o:Lcom/android/launcher3/taskbar/R1;

.field private p:I

.field private final q:Landroid/graphics/Rect;

.field private r:F

.field private s:F

.field private t:Z

.field private u:Z

.field private v:Z

.field private w:Z

.field private x:Z

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/StashedHandleView;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/S0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/S0;-><init>(Lcom/android/launcher3/taskbar/U0;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/U0;->n:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/taskbar/U0;->q:Landroid/graphics/Rect;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/android/launcher3/taskbar/U0;->h:Landroid/content/SharedPreferences;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 32
    .line 33
    new-instance v1, Lcom/android/launcher3/util/B1;

    .line 34
    .line 35
    const/4 v2, 0x4

    .line 36
    invoke-direct {v1, p2, v2}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/android/launcher3/taskbar/U0;->m:Lcom/android/launcher3/util/B1;

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 43
    .line 44
    .line 45
    const-string v1, "stashed_handle_region_is_dark"

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {p2, v0, v2}, Lcom/android/launcher3/taskbar/StashedHandleView;->c(ZZ)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const p2, 0x7f070bb3

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput p1, p0, Lcom/android/launcher3/taskbar/U0;->k:I

    .line 67
    .line 68
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->z()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->y()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/taskbar/U0;->q:Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/StashedHandleView;->d(Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->l:LP2/d;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/StashedHandleView;->getSampledRegion()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, LP2/d;->q(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->l:LP2/d;

    .line 30
    .line 31
    invoke-virtual {p0}, LP2/d;->r()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private D()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->y:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/taskbar/U0;->z:F

    .line 6
    .line 7
    add-float/2addr v1, p0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(ILandroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    div-int/lit8 p2, p2, 0x2

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    div-int/lit8 p0, p0, 0x2

    .line 12
    .line 13
    sub-int/2addr p3, p0

    .line 14
    int-to-float p0, p2

    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setPivotX(F)V

    .line 16
    .line 17
    .line 18
    int-to-float p0, p3

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->setPivotY(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/taskbar/U0;)Landroid/content/SharedPreferences;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->h:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/U0;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->q:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/U0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/U0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/taskbar/U0;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/U0;->r:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/taskbar/U0;)Lcom/android/launcher3/taskbar/StashedHandleView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/U0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/U0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/U0;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/U0;->s:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/U0;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/U0;->r:F

    .line 2
    .line 3
    return-void
.end method

.method private p()V
    .locals 4

    .line 1
    new-instance v0, LP2/d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 4
    .line 5
    new-instance v2, Lcom/android/launcher3/taskbar/U0$b;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/U0$b;-><init>(Lcom/android/launcher3/taskbar/U0;)V

    .line 8
    .line 9
    .line 10
    sget-object v3, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, LP2/d;-><init>(Landroid/view/View;LP2/d$d;Ljava/util/concurrent/Executor;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/taskbar/U0;->l:LP2/d;

    .line 16
    .line 17
    return-void
.end method

.method private y()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/U0;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/U0;->v:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/U0;->w:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->l:LP2/d;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->y()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/U0;->x:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-virtual {v0, p0}, LP2/d;->p(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method protected B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/U0;->n:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->n:Lcom/android/launcher3/anim/d;

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/view/View;->setScaleY(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public C(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x2

    .line 2
    .line 3
    and-long/2addr p1, v0

    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long p1, p1, v0

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/U0;->x:Z

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->z()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "StashedHandleViewController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tisStashedHandleVisible="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/U0;->q()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, "\tmStashedHandleWidth="

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->j:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v1, "\tmStashedHandleHeight="

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->k:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->l:LP2/d;

    .line 99
    .line 100
    invoke-virtual {p0, p1, p2}, LP2/d;->l(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public animateNavBarLongPress(ZZJ)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const p1, 0x3f59999a    # 0.85f

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const p1, 0x3f970a3d    # 1.18f

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p3, p4}, Lcom/android/launcher3/taskbar/StashedHandleView;->b(FJ)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public canNavHandleBeLongPressed()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/U0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getNavHandleWidth(Landroid/content/Context;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/U0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public isNavHandleStashedTaskbar()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public k(Z)Landroid/animation/Animator;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->o:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/W4;->a0()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->r:F

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->p:I

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    sub-int/2addr v1, v2

    .line 26
    div-int/lit8 v1, v1, 0x2

    .line 27
    .line 28
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 29
    .line 30
    sub-int/2addr v2, v1

    .line 31
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 34
    .line 35
    add-int/2addr v2, v1

    .line 36
    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-float v1, v1

    .line 43
    const/high16 v2, 0x40000000    # 2.0f

    .line 44
    .line 45
    div-float/2addr v1, v2

    .line 46
    :cond_0
    new-instance v2, Lcom/android/launcher3/anim/d0;

    .line 47
    .line 48
    iget v3, p0, Lcom/android/launcher3/taskbar/U0;->r:F

    .line 49
    .line 50
    iget-object v4, p0, Lcom/android/launcher3/taskbar/U0;->q:Landroid/graphics/Rect;

    .line 51
    .line 52
    invoke-direct {v2, v1, v3, v0, v4}, Lcom/android/launcher3/anim/d0;-><init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    xor-int/2addr p1, v0

    .line 57
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/U0;->t:Z

    .line 58
    .line 59
    if-eq v1, p1, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const/4 v0, 0x0

    .line 63
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/U0;->t:Z

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    const/high16 v0, 0x3f800000    # 1.0f

    .line 68
    .line 69
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->s:F

    .line 70
    .line 71
    sub-float/2addr v0, v1

    .line 72
    iput v0, p0, Lcom/android/launcher3/taskbar/U0;->s:F

    .line 73
    .line 74
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 75
    .line 76
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->s:F

    .line 77
    .line 78
    invoke-virtual {v2, v0, p1, v1}, Lcom/android/launcher3/anim/c0;->c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance v0, Lcom/android/launcher3/taskbar/U0$c;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/U0$c;-><init>(Lcom/android/launcher3/taskbar/U0;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    .line 89
    .line 90
    return-object p1
.end method

.method public l()Lcom/android/launcher3/util/v1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->m:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->q:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->n:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Lcom/android/launcher3/taskbar/R1;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/U0;->o:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->b1()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->j1()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->P0()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget v1, p1, Lcom/android/launcher3/h0;->r3:I

    .line 41
    .line 42
    iput v1, p0, Lcom/android/launcher3/taskbar/U0;->p:I

    .line 43
    .line 44
    const v1, 0x7f070bb4

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/android/launcher3/taskbar/U0;->j:I

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    :goto_0
    const v1, 0x7f070ba8

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iput v1, p0, Lcom/android/launcher3/taskbar/U0;->p:I

    .line 62
    .line 63
    const v1, 0x7f070bb7

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Lcom/android/launcher3/taskbar/U0;->j:I

    .line 71
    .line 72
    :goto_1
    iget p1, p1, Lcom/android/launcher3/h0;->t3:I

    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v1, p0, Lcom/android/launcher3/taskbar/U0;->p:I

    .line 81
    .line 82
    add-int/2addr v1, p1

    .line 83
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/launcher3/taskbar/U0;->m:Lcom/android/launcher3/util/B1;

    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->b1()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    const/high16 v1, 0x3f800000    # 1.0f

    .line 99
    .line 100
    if-eqz v0, :cond_2

    .line 101
    .line 102
    move v0, v1

    .line 103
    goto :goto_2

    .line 104
    :cond_2
    const/4 v0, 0x0

    .line 105
    :goto_2
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/android/launcher3/taskbar/U0;->n:Lcom/android/launcher3/anim/d;

    .line 109
    .line 110
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/android/launcher3/taskbar/U0;->o:Lcom/android/launcher3/taskbar/R1;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/a4;->Q()I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 122
    .line 123
    new-instance v1, Lcom/android/launcher3/taskbar/U0$a;

    .line 124
    .line 125
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/U0$a;-><init>(Lcom/android/launcher3/taskbar/U0;I)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 132
    .line 133
    new-instance v1, Lcom/android/launcher3/taskbar/T0;

    .line 134
    .line 135
    invoke-direct {v1, p1}, Lcom/android/launcher3/taskbar/T0;-><init>(I)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 139
    .line 140
    .line 141
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->p()V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/android/launcher3/taskbar/U0;->g:Lcom/android/launcher3/taskbar/I1;

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->b1()Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_3

    .line 151
    .line 152
    const/4 p1, 0x1

    .line 153
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/U0;->s(Z)V

    .line 154
    .line 155
    .line 156
    :cond_3
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->i:Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0;->l:LP2/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LP2/d;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/U0;->l:LP2/d;

    .line 10
    .line 11
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/U0;->u:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->A()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(IZ)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/U0;->v:Z

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->A()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/U0;->w:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->A()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0;->m:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected w(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/U0;->z:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->D()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected x(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/U0;->y:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/U0;->D()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
