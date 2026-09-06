.class public LP1/h;
.super Lcom/android/quickstep/util/BaseDepthController;
.source "DepthController.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$f;
.implements Lcom/android/launcher3/v$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/util/BaseDepthController;",
        "Lcom/android/launcher3/statemanager/d$f<",
        "Lcom/android/launcher3/V3;",
        ">;",
        "Lcom/android/launcher3/v$a;"
    }
.end annotation


# static fields
.field private static final r:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "LP1/h;",
            ">;"
        }
    .end annotation
.end field

.field private static final s:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "LP1/h;",
            ">;"
        }
    .end annotation
.end field

.field private static final t:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "LP1/h;",
            ">;"
        }
    .end annotation
.end field

.field private static final u:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "LP1/h;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final g:Landroid/view/ViewTreeObserver$OnDrawListener;

.field private final h:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Ljava/lang/Runnable;

.field private j:Z

.field private k:Landroid/view/View$OnAttachStateChangeListener;

.field private l:Z

.field protected m:Landroid/animation/ValueAnimator;

.field protected n:Z

.field private o:Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

.field private p:J

.field private q:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LP1/h$d;

    .line 2
    .line 3
    const-string v1, "ZOOM_OUT"

    .line 4
    .line 5
    invoke-direct {v0, v1}, LP1/h$d;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LP1/h;->r:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, LP1/h$e;

    .line 11
    .line 12
    const-string v1, "MIRROR_BLUR"

    .line 13
    .line 14
    invoke-direct {v0, v1}, LP1/h$e;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, LP1/h;->s:Landroid/util/FloatProperty;

    .line 18
    .line 19
    new-instance v0, LP1/h$f;

    .line 20
    .line 21
    const-string v1, "BLUR"

    .line 22
    .line 23
    invoke-direct {v0, v1}, LP1/h$f;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, LP1/h;->t:Landroid/util/FloatProperty;

    .line 27
    .line 28
    new-instance v0, LP1/h$g;

    .line 29
    .line 30
    const-string v1, "ICON_BLUR"

    .line 31
    .line 32
    invoke-direct {v0, v1}, LP1/h$g;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, LP1/h;->u:Landroid/util/FloatProperty;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/BaseDepthController;-><init>(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, LP1/c;

    .line 5
    .line 6
    invoke-direct {p1, p0}, LP1/c;-><init>(LP1/h;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LP1/h;->g:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 10
    .line 11
    new-instance p1, LP1/d;

    .line 12
    .line 13
    invoke-direct {p1, p0}, LP1/d;-><init>(LP1/h;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, LP1/h;->h:Ljava/util/function/Consumer;

    .line 17
    .line 18
    new-instance p1, LP1/e;

    .line 19
    .line 20
    invoke-direct {p1, p0}, LP1/e;-><init>(LP1/h;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, LP1/h;->i:Ljava/lang/Runnable;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, LP1/h;->j:Z

    .line 27
    .line 28
    iput-boolean p1, p0, LP1/h;->l:Z

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, LP1/h;->n:Z

    .line 32
    .line 33
    new-instance p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-direct {p1, p0, v0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;-><init>(LP1/h;Lcom/android/launcher3/C2;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, LP1/h;->o:Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 41
    .line 42
    return-void
.end method

.method private A(Ljava/lang/String;)Z
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    sparse-switch v2, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v2, "app_exit"

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x6

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v2, "app_launch"

    .line 27
    .line 28
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v1, 0x5

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v2, "one_shot_launch"

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v1, 0x4

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string v2, "first_in_launcher"

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v1, 0x3

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string v2, "app_recent_exit"

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    const/4 v1, 0x2

    .line 69
    goto :goto_0

    .line 70
    :sswitch_5
    const-string v2, "interrupt_anim"

    .line 71
    .line 72
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    move v1, p0

    .line 80
    goto :goto_0

    .line 81
    :sswitch_6
    const-string v2, "app_recent_enter"

    .line 82
    .line 83
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_6

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    move v1, v0

    .line 91
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 92
    .line 93
    .line 94
    return v0

    .line 95
    :pswitch_0
    return p0

    .line 96
    nop

    .line 97
    :sswitch_data_0
    .sparse-switch
        -0x7e6492ae -> :sswitch_6
        -0x6bd62d93 -> :sswitch_5
        -0x672c649c -> :sswitch_4
        -0x33fb2995 -> :sswitch_3
        -0x2c6283c1 -> :sswitch_2
        0x3f912f91 -> :sswitch_1
        0x4595247c -> :sswitch_0
    .end sparse-switch

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private synthetic B()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/CrossWindowBlurListeners;->getInstance()Landroid/view/CrossWindowBlurListeners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, LP1/h;->h:Ljava/util/function/Consumer;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/view/CrossWindowBlurListeners;->removeListener(Ljava/util/function/Consumer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic C(FFLandroid/animation/ValueAnimator;)V
    .locals 7

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Float;->compare(FF)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/high16 v3, 0x3f800000    # 1.0f

    .line 13
    .line 14
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    move v4, p1

    .line 18
    move v5, p2

    .line 19
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    :goto_0
    sget-object p1, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 26
    .line 27
    invoke-virtual {p1, p0, p2}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private D()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/ViewRootImpl;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    :goto_0
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBaseSurface(Landroid/view/SurfaceControl;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->g0:Z

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    move v1, v2

    .line 44
    :goto_1
    iget-object v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    sget-object v4, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 47
    .line 48
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-nez v3, :cond_2

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->getMaxBlurRadius()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setWallpaperBlur(I)V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 66
    .line 67
    invoke-interface {v1, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_4

    .line 72
    .line 73
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 74
    .line 75
    sget-object v3, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 76
    .line 77
    invoke-interface {v1, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_7

    .line 82
    .line 83
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->R2()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_7

    .line 90
    .line 91
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 92
    .line 93
    sget-object v3, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 94
    .line 95
    invoke-interface {v1, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    invoke-static {}, Lx1/O;->A2()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_6

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->getBlurValue()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-nez v1, :cond_5

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->getMaxBlurRadius()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    goto :goto_2

    .line 118
    :cond_5
    invoke-virtual {p0}, Lcom/android/quickstep/util/BaseDepthController;->getBlurValue()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    :cond_6
    :goto_2
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/BaseDepthController;->setWallpaperBlur(I)V

    .line 123
    .line 124
    .line 125
    :cond_7
    new-instance v1, LP1/f;

    .line 126
    .line 127
    invoke-direct {v1, p0}, LP1/f;-><init>(LP1/h;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method private E()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LP1/h;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-boolean v0, p0, LP1/h;->l:Z

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void

    .line 21
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, LP1/h;->g:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, LP1/h;->l:Z

    .line 38
    .line 39
    return-void
.end method

.method private F()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, LP1/b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LP1/b;-><init>(LP1/h;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LP1/h;->i:Ljava/lang/Runnable;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, LP1/h;->i:Ljava/lang/Runnable;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/android/launcher3/views/ScrimView;->removeOpaquenessListener(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic a(LP1/h;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BaseDepthController;->setCrossWindowBlursEnabled(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(LP1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(LP1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(LP1/h;FFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LP1/h;->C(FFLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(LP1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f(LP1/h;)Ljava/util/function/Consumer;
    .locals 0

    .line 1
    iget-object p0, p0, LP1/h;->h:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(LP1/h;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, LP1/h;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(LP1/h;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LP1/h;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(LP1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic j(LP1/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic k(LP1/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic l(LP1/h;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 2
    .line 3
    return p0
.end method

.method static synthetic m(LP1/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic n(LP1/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic o(LP1/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic p(LP1/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic q(LP1/h;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic r(LP1/h;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 2
    .line 3
    return p0
.end method

.method static synthetic s(LP1/h;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 2
    .line 3
    return p0
.end method

.method static synthetic t(LP1/h;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 2
    .line 3
    return p0
.end method

.method private u()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LP1/h;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, LP1/h;->g:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, LP1/h;->l:Z

    .line 23
    .line 24
    return-void
.end method

.method private x()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, LP1/h;->k:Landroid/view/View$OnAttachStateChangeListener;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    new-instance v1, LP1/h$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, LP1/h$a;-><init>(LP1/h;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, LP1/h;->k:Landroid/view/View$OnAttachStateChangeListener;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, LP1/h;->k:Landroid/view/View$OnAttachStateChangeListener;

    .line 32
    .line 33
    invoke-interface {p0, v0}, Landroid/view/View$OnAttachStateChangeListener;->onViewAttachedToWindow(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public G(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, LP1/h;->u()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-direct {p0}, LP1/h;->E()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/BaseDepthController;->setBaseSurface(Landroid/view/SurfaceControl;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    iput-boolean p1, p0, LP1/h;->q:Z

    .line 15
    .line 16
    return-void
.end method

.method public H(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LP1/h;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, LP1/h;->I(FZ)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public I(FZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget-object p2, LP1/h;->s:Landroid/util/FloatProperty;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p2, p0, p1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p2, LP1/h;->t:Landroid/util/FloatProperty;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p2, p0, p1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public J(F)V
    .locals 1

    .line 1
    sget-object v0, LP1/h;->r:Landroid/util/FloatProperty;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p0, p1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public K(F)V
    .locals 1

    .line 1
    sget-object v0, LP1/h;->u:Landroid/util/FloatProperty;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p0, p1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LP1/h;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public M(Lcom/android/launcher3/V3;)V
    .locals 6

    .line 1
    invoke-static {}, Lx1/O;->N1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "DepthController"

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, LP1/h;->x()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getWindowToken()Landroid/os/IBinder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 29
    .line 30
    const/high16 v0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Landroid/app/WallpaperManager;->setWallpaperZoomOut(Landroid/os/IBinder;F)V

    .line 33
    .line 34
    .line 35
    :cond_0
    const-string p0, "setState: disable MyOS ComplexAnim and toState allapps."

    .line 36
    .line 37
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-boolean v0, p0, LP1/h;->j:Z

    .line 42
    .line 43
    if-nez v0, :cond_e

    .line 44
    .line 45
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 46
    .line 47
    if-ne p1, v0, :cond_2

    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->R2()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_e

    .line 56
    .line 57
    :cond_2
    sget-boolean v2, Lcom/android/quickstep/util/BaseDepthController;->BLUR_DISABLED:Z

    .line 58
    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    goto/16 :goto_4

    .line 62
    .line 63
    :cond_3
    sget-object v2, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 64
    .line 65
    if-ne p1, v2, :cond_4

    .line 66
    .line 67
    invoke-virtual {p0}, LP1/h;->y()F

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/4 v4, 0x0

    .line 72
    cmpl-float v3, v3, v4

    .line 73
    .line 74
    if-eqz v3, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0}, LP1/h;->y()F

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    goto :goto_0

    .line 81
    :cond_4
    iget-object v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    invoke-virtual {p1, v3}, Lcom/android/launcher3/V3;->e(Landroid/content/Context;)F

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v5, "setState: toState("

    .line 93
    .line 94
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v5, "), mBlurValue="

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    iget v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    .line 106
    .line 107
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string v5, ", mDepth="

    .line 111
    .line 112
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget v5, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 116
    .line 117
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v5, ", toDepth="

    .line 121
    .line 122
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 136
    .line 137
    if-eq p1, v1, :cond_5

    .line 138
    .line 139
    if-ne p1, v2, :cond_6

    .line 140
    .line 141
    :cond_5
    invoke-static {}, Lx1/O;->A2()Z

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    invoke-virtual {p0, v3}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 146
    .line 147
    .line 148
    :cond_6
    sget-object v3, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 149
    .line 150
    iget-object v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 151
    .line 152
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    check-cast v4, Lcom/android/launcher3/anim/C;

    .line 157
    .line 158
    if-ne p1, v2, :cond_7

    .line 159
    .line 160
    invoke-virtual {v4}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v4}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    if-nez v4, :cond_d

    .line 169
    .line 170
    iget-object v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 171
    .line 172
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    check-cast v3, Lcom/android/launcher3/anim/C;

    .line 177
    .line 178
    iget-boolean v3, v3, Lcom/android/launcher3/anim/C;->D:Z

    .line 179
    .line 180
    if-nez v3, :cond_d

    .line 181
    .line 182
    :cond_7
    const/4 v3, 0x1

    .line 183
    if-ne p1, v0, :cond_8

    .line 184
    .line 185
    iput-boolean v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlur:Z

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_8
    if-ne p1, v1, :cond_9

    .line 189
    .line 190
    invoke-static {}, Lx1/O;->A2()Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    iput-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlur:Z

    .line 195
    .line 196
    :cond_9
    :goto_1
    invoke-virtual {p0, v3}, Lcom/android/quickstep/util/BaseDepthController;->setZoom(Z)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 200
    .line 201
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    const/4 v1, 0x0

    .line 206
    if-eqz v0, :cond_a

    .line 207
    .line 208
    iget-object v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 209
    .line 210
    invoke-static {v4}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 211
    .line 212
    .line 213
    move-result-object v4

    .line 214
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->g0:Z

    .line 215
    .line 216
    if-eqz v4, :cond_a

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_a
    move v3, v1

    .line 220
    :goto_2
    if-eqz v3, :cond_b

    .line 221
    .line 222
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->u1()Z

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    if-nez v4, :cond_b

    .line 227
    .line 228
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 229
    .line 230
    .line 231
    :cond_b
    if-eqz v3, :cond_c

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->u1()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_c

    .line 238
    .line 239
    goto :goto_3

    .line 240
    :cond_c
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 241
    .line 242
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 243
    .line 244
    invoke-virtual {p1, v1}, Lcom/android/launcher3/V3;->e(Landroid/content/Context;)F

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 249
    .line 250
    .line 251
    :cond_d
    :goto_3
    if-ne p1, v2, :cond_e

    .line 252
    .line 253
    invoke-direct {p0}, LP1/h;->u()V

    .line 254
    .line 255
    .line 256
    :cond_e
    :goto_4
    return-void
.end method

.method public N(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 6

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p2, v0}, LQ1/f;->c(I)Z

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    if-nez p2, :cond_c

    .line 7
    .line 8
    iget-boolean p2, p0, LP1/h;->j:Z

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    goto/16 :goto_4

    .line 13
    .line 14
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-static {p2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-boolean p2, p2, Lcom/android/launcher3/r4;->g0:Z

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    iget-object p2, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-static {p2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    move p2, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move p2, v0

    .line 37
    :goto_0
    invoke-static {}, Lx1/O;->N1()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_c

    .line 42
    .line 43
    sget-boolean v2, Lcom/android/quickstep/util/BaseDepthController;->BLUR_DISABLED:Z

    .line 44
    .line 45
    if-nez v2, :cond_c

    .line 46
    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    sget-object v2, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 50
    .line 51
    if-ne p1, v2, :cond_2

    .line 52
    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :cond_2
    iget-object v2, p0, LP1/h;->m:Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v2, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Lcom/android/launcher3/V3;->e(Landroid/content/Context;)F

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setZoom(Z)V

    .line 69
    .line 70
    .line 71
    const/4 v3, 0x2

    .line 72
    new-array v3, v3, [F

    .line 73
    .line 74
    fill-array-data v3, :array_0

    .line 75
    .line 76
    .line 77
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    iput-object v3, p0, LP1/h;->m:Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    sget-object v3, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 84
    .line 85
    iget-object v4, p0, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 86
    .line 87
    invoke-virtual {v3, v4}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Ljava/lang/Float;

    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    cmpl-float v3, v3, v2

    .line 98
    .line 99
    if-eqz v3, :cond_4

    .line 100
    .line 101
    iget v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 102
    .line 103
    iget-object v4, p0, LP1/h;->m:Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    new-instance v5, LP1/a;

    .line 106
    .line 107
    invoke-direct {v5, p0, v3, v2}, LP1/a;-><init>(LP1/h;FF)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    iget-object v3, p0, LP1/h;->m:Landroid/animation/ValueAnimator;

    .line 114
    .line 115
    invoke-virtual {p3, v3}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 116
    .line 117
    .line 118
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 119
    .line 120
    if-ne p1, v3, :cond_6

    .line 121
    .line 122
    iget v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlurValue:I

    .line 123
    .line 124
    if-eqz v3, :cond_5

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_5
    move v1, v0

    .line 128
    :goto_1
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    sget-object v3, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 133
    .line 134
    if-eq p1, v3, :cond_9

    .line 135
    .line 136
    sget-object v3, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 137
    .line 138
    if-ne p1, v3, :cond_7

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_7
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 142
    .line 143
    if-eq p1, v1, :cond_8

    .line 144
    .line 145
    sget-object v1, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 146
    .line 147
    if-ne p1, v1, :cond_a

    .line 148
    .line 149
    :cond_8
    invoke-static {}, Lx1/O;->A2()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 154
    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_9
    :goto_2
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 158
    .line 159
    .line 160
    :cond_a
    :goto_3
    if-eqz p2, :cond_b

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 163
    .line 164
    .line 165
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    const-string v1, "setStateWithAnimation: mDepth="

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    iget v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string v1, ",toState="

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v1, ",toDepth="

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    const-string v1, ",mBlur="

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    iget-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlur:Z

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    const-string v1, "DepthController"

    .line 211
    .line 212
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    new-instance v0, LP1/h$b;

    .line 216
    .line 217
    invoke-direct {v0, p0, p2, p1}, LP1/h$b;-><init>(LP1/h;ZLcom/android/launcher3/V3;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 221
    .line 222
    .line 223
    :cond_c
    :goto_4
    return-void

    .line 224
    nop

    .line 225
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public O(F)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public P(ZLjava/lang/String;)V
    .locals 7

    .line 1
    invoke-direct {p0, p2}, LP1/h;->A(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string p1, "startWallpaperAnimationImpl other type is not start wallpaper command, type : "

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "DepthController"

    .line 25
    .line 26
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    iget-wide v2, p0, LP1/h;->p:J

    .line 35
    .line 36
    sub-long/2addr v0, v2

    .line 37
    add-long/2addr v2, v0

    .line 38
    iput-wide v2, p0, LP1/h;->p:J

    .line 39
    .line 40
    invoke-static {}, Lx1/O;->k5()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-static {v0}, Lx1/O;->v0(Landroid/content/Context;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v0, 0x0

    .line 57
    :goto_0
    const v1, 0x3f947ae1    # 1.16f

    .line 58
    .line 59
    .line 60
    const/high16 v2, 0x3f800000    # 1.0f

    .line 61
    .line 62
    const v3, 0x3f8a3d71    # 1.08f

    .line 63
    .line 64
    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    move p1, v3

    .line 70
    goto :goto_1

    .line 71
    :cond_2
    move p1, v2

    .line 72
    move v1, v3

    .line 73
    :goto_1
    const-wide/16 v4, 0x28a

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_3
    if-eqz v0, :cond_4

    .line 77
    .line 78
    move p1, v3

    .line 79
    goto :goto_2

    .line 80
    :cond_4
    move p1, v2

    .line 81
    move v1, v3

    .line 82
    :goto_2
    const-wide/16 v4, 0x3e8

    .line 83
    .line 84
    move v6, v1

    .line 85
    move v1, p1

    .line 86
    move p1, v6

    .line 87
    :goto_3
    const-string v0, "one_shot_launch"

    .line 88
    .line 89
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-eqz p2, :cond_5

    .line 94
    .line 95
    const-wide/16 v4, 0x2a8

    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_5
    move v2, p1

    .line 99
    move v3, v1

    .line 100
    :goto_4
    long-to-int p1, v4

    .line 101
    invoke-virtual {p0, v2, v3, p1}, Lcom/android/quickstep/util/BaseDepthController;->startWallpaperAnimation(FFI)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method protected applyDepthAndBlur()V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h;->x()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlur()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected applyDepthAndBlurWithEnsureDependencies(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h;->x()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Lcom/android/quickstep/util/BaseDepthController;->applyDepthAndBlurWithEnsureDependencies(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onInvalidSurface()V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMultiWindowModeChanged(Z)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LP1/h;->j:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    sget-object v2, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Lcom/android/launcher3/V3;

    .line 19
    .line 20
    iget-object v4, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v3, v4, p1}, Lcom/android/launcher3/V3;->f(Landroid/content/Context;Z)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    new-array v3, v0, [F

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    aput p1, v3, v4

    .line 30
    .line 31
    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-wide/16 v1, 0x12c

    .line 36
    .line 37
    invoke-virtual {p1, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v1, LP1/h$c;

    .line 42
    .line 43
    invoke-direct {v1, p0}, LP1/h$c;-><init>(LP1/h;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setAutoCancel(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public bridge synthetic setState(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LP1/h;->M(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, LP1/h;->N(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(FZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, LP1/h;->m:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, LP1/h;->o:Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->isDepthAnimRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, LP1/h;->o:Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->cancelDepthAnimImmediately()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/util/BaseDepthController;->mBlur:Z

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    const-string v2, "DepthController"

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    const-string v0, "doWallpaperBlurForMiBoard enable blur"

    .line 31
    .line 32
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 36
    .line 37
    .line 38
    :cond_2
    if-eqz p3, :cond_3

    .line 39
    .line 40
    iget-object p3, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p3}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 51
    .line 52
    if-ne p3, v0, :cond_3

    .line 53
    .line 54
    iget-object p3, p0, Lcom/android/quickstep/util/BaseDepthController;->mLauncher:Lcom/android/launcher3/C2;

    .line 55
    .line 56
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    invoke-virtual {p3}, Lcom/android/launcher3/statemanager/d;->Q()Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-nez p3, :cond_3

    .line 65
    .line 66
    const-string p1, "doWallpaperBlurForMiBoard: Allapps wallpaper forced blur "

    .line 67
    .line 68
    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    const/high16 p1, 0x3f800000    # 1.0f

    .line 72
    .line 73
    :cond_3
    invoke-virtual {p0, p1, v1, p2}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(FZZ)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public w(Ljava/lang/String;Ljava/io/PrintWriter;)V
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
    const-string v1, "DepthController"

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
    const-string v1, "\tmMaxBlurRadius="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mMaxBlurRadius:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tmCrossWindowBlursEnabled="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mCrossWindowBlursEnabled:Z

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, "\tmBaseSurface="

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurface:Landroid/view/SurfaceControl;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v1, "\tmBaseSurfaceOverride="

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mBaseSurfaceOverride:Landroid/view/SurfaceControl;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v1, "\tmStateDepth="

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 135
    .line 136
    invoke-virtual {v1}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v1, "\tmWidgetDepth="

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-object v1, p0, Lcom/android/quickstep/util/BaseDepthController;->widgetDepth:Lcom/android/launcher3/util/v1$c;

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v1, "\tmCurrentBlur="

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    iget v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mCurrentBlur:I

    .line 193
    .line 194
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v1, "\tmInEarlyWakeUp="

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    iget-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mInEarlyWakeUp:Z

    .line 218
    .line 219
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    const-string v1, "\tmIgnoreStateChangesDuringMultiWindowAnimation="

    .line 238
    .line 239
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    iget-boolean v1, p0, LP1/h;->j:Z

    .line 243
    .line 244
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    const-string v1, "\tmPauseBlurs="

    .line 263
    .line 264
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    iget-boolean v1, p0, Lcom/android/quickstep/util/BaseDepthController;->mPauseBlurs:Z

    .line 268
    .line 269
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    new-instance v0, Ljava/lang/StringBuilder;

    .line 280
    .line 281
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    const-string p1, "\tmWaitingOnSurfaceValidity="

    .line 288
    .line 289
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    iget-boolean p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mWaitingOnSurfaceValidity:Z

    .line 293
    .line 294
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    return-void
.end method

.method public y()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BaseDepthController;->mDepth:F

    .line 2
    .line 3
    return p0
.end method

.method public z()Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;
    .locals 0

    .line 1
    iget-object p0, p0, LP1/h;->o:Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 2
    .line 3
    return-object p0
.end method
