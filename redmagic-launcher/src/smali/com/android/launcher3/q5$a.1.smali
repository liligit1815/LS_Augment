.class Lcom/android/launcher3/q5$a;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->s0(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic A:Lcom/android/quickstep/RemoteAnimationTargets;

.field final synthetic B:Landroid/graphics/Rect;

.field final synthetic C:Landroid/graphics/RectF;

.field final synthetic D:Landroid/view/View;

.field final synthetic E:[I

.field final synthetic F:Z

.field final synthetic G:Lcom/android/launcher3/views/FloatingIconView;

.field final synthetic H:Landroid/graphics/Rect;

.field final synthetic I:I

.field final synthetic J:Landroid/graphics/RectF;

.field final synthetic K:Lcom/android/launcher3/anim/C;

.field final synthetic L:Landroid/graphics/RectF;

.field final synthetic M:Landroid/graphics/RectF;

.field final synthetic N:[Landroid/view/RemoteAnimationTarget;

.field final synthetic O:Landroid/graphics/Matrix;

.field final synthetic P:Landroid/graphics/Point;

.field final synthetic Q:Landroid/view/RemoteAnimationTarget;

.field final synthetic R:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field final synthetic S:Lcom/android/launcher3/q5;

.field g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field r:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field s:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field t:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic u:Lcom/android/launcher3/q5$D;

.field final synthetic v:F

.field final synthetic w:F

.field final synthetic x:F

.field final synthetic y:Z

.field final synthetic z:[I


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/q5$D;FFFZ[ILcom/android/quickstep/RemoteAnimationTargets;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/view/View;[IZLcom/android/launcher3/views/FloatingIconView;Landroid/graphics/Rect;ILandroid/graphics/RectF;Lcom/android/launcher3/anim/C;Landroid/graphics/RectF;Landroid/graphics/RectF;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;Landroid/graphics/Point;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p1

    .line 1
    iput-object v5, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    iput-object v1, v0, Lcom/android/launcher3/q5$a;->u:Lcom/android/launcher3/q5$D;

    iput v2, v0, Lcom/android/launcher3/q5$a;->v:F

    iput v3, v0, Lcom/android/launcher3/q5$a;->w:F

    iput v4, v0, Lcom/android/launcher3/q5$a;->x:F

    move/from16 v6, p6

    iput-boolean v6, v0, Lcom/android/launcher3/q5$a;->y:Z

    move-object/from16 v6, p7

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->z:[I

    move-object/from16 v6, p8

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->A:Lcom/android/quickstep/RemoteAnimationTargets;

    move-object/from16 v6, p9

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->B:Landroid/graphics/Rect;

    move-object/from16 v6, p10

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->C:Landroid/graphics/RectF;

    move-object/from16 v6, p11

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->D:Landroid/view/View;

    move-object/from16 v6, p12

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->E:[I

    move/from16 v6, p13

    iput-boolean v6, v0, Lcom/android/launcher3/q5$a;->F:Z

    move-object/from16 v6, p14

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->G:Lcom/android/launcher3/views/FloatingIconView;

    move-object/from16 v6, p15

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    move/from16 v6, p16

    iput v6, v0, Lcom/android/launcher3/q5$a;->I:I

    move-object/from16 v6, p17

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    move-object/from16 v6, p18

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    move-object/from16 v6, p19

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->L:Landroid/graphics/RectF;

    move-object/from16 v6, p20

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->M:Landroid/graphics/RectF;

    move-object/from16 v6, p21

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->N:[Landroid/view/RemoteAnimationTarget;

    move-object/from16 v6, p22

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    move-object/from16 v6, p23

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->P:Landroid/graphics/Point;

    move-object/from16 v6, p24

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->Q:Landroid/view/RemoteAnimationTarget;

    move-object/from16 v6, p25

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->R:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    invoke-direct {v0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 2
    new-instance v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v7, v1, Lcom/android/launcher3/q5$D;->i:F

    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v8

    iget v8, v8, Lcom/android/launcher3/h0;->U0:I

    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v9

    iget v9, v9, Lcom/android/launcher3/h0;->T0:I

    if-le v8, v9, :cond_0

    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v8

    goto :goto_0

    :cond_0
    sget-object v8, Lcom/android/launcher3/anim/L;->y:Landroid/view/animation/Interpolator;

    :goto_0
    const/4 v9, 0x0

    invoke-direct {v6, v0, v9, v7, v8}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 3
    new-instance v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v7, v1, Lcom/android/launcher3/q5$D;->j:F

    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v8

    iget v8, v8, Lcom/android/launcher3/h0;->U0:I

    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v10

    iget v10, v10, Lcom/android/launcher3/h0;->T0:I

    if-le v8, v10, :cond_1

    sget-object v8, Lcom/android/launcher3/anim/L;->y:Landroid/view/animation/Interpolator;

    goto :goto_1

    :cond_1
    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v8

    :goto_1
    invoke-direct {v6, v0, v9, v7, v8}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 4
    new-instance v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v7, v1, Lcom/android/launcher3/q5$D;->k:F

    iget v8, v1, Lcom/android/launcher3/q5$D;->l:F

    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v10

    invoke-direct {v6, v0, v7, v8, v10}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 5
    new-instance v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v7, v1, Lcom/android/launcher3/q5$D;->m:F

    sget-object v8, LJ0/h;->q:Landroid/view/animation/Interpolator;

    sget-wide v10, Lcom/android/launcher3/q5;->V:J

    long-to-float v12, v10

    const/high16 v13, 0x41a00000    # 20.0f

    const/high16 v14, 0x42480000    # 50.0f

    .line 6
    invoke-static {v8, v13, v14, v12}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    move-result-object v12

    invoke-direct {v6, v0, v7, v9, v12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 7
    new-instance v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v7, v1, Lcom/android/launcher3/q5$D;->m:F

    const/high16 v12, 0x43af0000    # 350.0f

    sget-object v13, Lcom/android/launcher3/q5;->b0:Landroid/view/animation/Interpolator;

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 p7, v0

    move-object/from16 p6, v6

    move/from16 p8, v7

    move/from16 p11, v12

    move-object/from16 p12, v13

    move/from16 p9, v14

    move/from16 p10, v15

    invoke-direct/range {p6 .. p12}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 8
    new-instance v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v7

    invoke-direct {v6, v0, v2, v3, v7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v6, v0, Lcom/android/launcher3/q5$a;->l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 9
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-direct {v2, v0, v9, v4, v3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v2, v0, Lcom/android/launcher3/q5$a;->m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 10
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v3, v1, Lcom/android/launcher3/q5$D;->a:I

    int-to-float v3, v3

    iget v4, v1, Lcom/android/launcher3/q5$D;->e:I

    int-to-float v4, v4

    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-direct {v2, v0, v3, v4, v6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v2, v0, Lcom/android/launcher3/q5$a;->n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 11
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v3, v1, Lcom/android/launcher3/q5$D;->b:I

    int-to-float v3, v3

    iget v4, v1, Lcom/android/launcher3/q5$D;->f:I

    int-to-float v4, v4

    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-direct {v2, v0, v3, v4, v6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v2, v0, Lcom/android/launcher3/q5$a;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 12
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v3, v1, Lcom/android/launcher3/q5$D;->c:I

    int-to-float v3, v3

    iget v4, v1, Lcom/android/launcher3/q5$D;->g:I

    int-to-float v4, v4

    .line 13
    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v6

    iget v6, v6, Lcom/android/launcher3/h0;->U0:I

    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v7

    iget v7, v7, Lcom/android/launcher3/h0;->T0:I

    if-le v6, v7, :cond_2

    sget-object v6, Lcom/android/launcher3/anim/L;->y:Landroid/view/animation/Interpolator;

    goto :goto_2

    :cond_2
    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v6

    :goto_2
    invoke-direct {v2, v0, v3, v4, v6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v2, v0, Lcom/android/launcher3/q5$a;->p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 14
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    iget v3, v1, Lcom/android/launcher3/q5$D;->d:I

    int-to-float v3, v3

    iget v1, v1, Lcom/android/launcher3/q5$D;->h:I

    int-to-float v1, v1

    .line 15
    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v4

    iget v4, v4, Lcom/android/launcher3/h0;->U0:I

    invoke-static {v5}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    move-result-object v6

    iget v6, v6, Lcom/android/launcher3/h0;->T0:I

    if-le v4, v6, :cond_3

    invoke-static {v5}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    move-result-object v4

    goto :goto_3

    :cond_3
    sget-object v4, Lcom/android/launcher3/anim/L;->y:Landroid/view/animation/Interpolator;

    :goto_3
    invoke-direct {v2, v0, v3, v1, v4}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v2, v0, Lcom/android/launcher3/q5$a;->q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 16
    new-instance v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    sget-object v2, Lcom/android/launcher3/q5;->Y:Landroid/view/animation/Interpolator;

    long-to-float v3, v10

    const/high16 v4, 0x43050000    # 133.0f

    invoke-static {v2, v9, v4, v3}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v0, v3, v9, v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v1, v0, Lcom/android/launcher3/q5$a;->r:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 17
    new-instance v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    sget-object v2, Lcom/android/launcher3/q5;->X:Landroid/view/animation/Interpolator;

    sget-wide v5, Lcom/android/launcher3/q5;->W:J

    long-to-float v5, v5

    long-to-float v6, v10

    invoke-static {v2, v5, v4, v6}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    move-result-object v2

    invoke-direct {v1, v0, v9, v3, v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    iput-object v1, v0, Lcom/android/launcher3/q5$a;->s:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 18
    new-instance v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    const/4 v2, 0x0

    const/high16 v3, 0x41f00000    # 30.0f

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    move-object/from16 p2, v0

    move-object/from16 p1, v1

    move/from16 p5, v2

    move/from16 p6, v3

    move/from16 p3, v4

    move/from16 p4, v5

    move-object/from16 p7, v8

    invoke-direct/range {p1 .. p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    iput-object v1, v0, Lcom/android/launcher3/q5$a;->t:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-boolean v2, v0, Lcom/android/launcher3/q5$a;->y:Z

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x1

    .line 9
    const/4 v5, 0x0

    .line 10
    if-eqz v2, :cond_1

    .line 11
    .line 12
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->z:[I

    .line 13
    .line 14
    aget v2, v2, v5

    .line 15
    .line 16
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 17
    .line 18
    invoke-static {v6}, Lcom/android/launcher3/q5;->t(Lcom/android/launcher3/q5;)Lcom/android/quickstep/SystemUiProxy;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    invoke-virtual {v6}, Lcom/android/quickstep/SystemUiProxy;->getHomeVisibilityState()Lcom/android/quickstep/HomeVisibilityState;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-virtual {v6}, Lcom/android/quickstep/HomeVisibilityState;->getNavbarInsetPosition()I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    if-eq v2, v6, :cond_1

    .line 31
    .line 32
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->A:Lcom/android/quickstep/RemoteAnimationTargets;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTarget()Landroid/view/RemoteAnimationTarget;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->z:[I

    .line 39
    .line 40
    iget-object v7, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 41
    .line 42
    invoke-static {v7}, Lcom/android/launcher3/q5;->t(Lcom/android/launcher3/q5;)Lcom/android/quickstep/SystemUiProxy;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    invoke-virtual {v7}, Lcom/android/quickstep/SystemUiProxy;->getHomeVisibilityState()Lcom/android/quickstep/HomeVisibilityState;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-virtual {v7}, Lcom/android/quickstep/HomeVisibilityState;->getNavbarInsetPosition()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    aput v7, v6, v5

    .line 55
    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    iget-object v2, v2, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->B:Landroid/graphics/Rect;

    .line 62
    .line 63
    :goto_0
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->z:[I

    .line 64
    .line 65
    aget v6, v6, v5

    .line 66
    .line 67
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->B:Landroid/graphics/Rect;

    .line 74
    .line 75
    iput v2, v6, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    new-instance v7, Lcom/android/launcher3/q5$D;

    .line 78
    .line 79
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 82
    .line 83
    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 88
    .line 89
    invoke-static {v2}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 90
    .line 91
    .line 92
    move-result-object v9

    .line 93
    iget-object v10, v0, Lcom/android/launcher3/q5$a;->B:Landroid/graphics/Rect;

    .line 94
    .line 95
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->C:Landroid/graphics/RectF;

    .line 96
    .line 97
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->D:Landroid/view/View;

    .line 98
    .line 99
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->E:[I

    .line 100
    .line 101
    aget v13, v2, v5

    .line 102
    .line 103
    aget v14, v2, v4

    .line 104
    .line 105
    iget-boolean v15, v0, Lcom/android/launcher3/q5$a;->F:Z

    .line 106
    .line 107
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->G:Lcom/android/launcher3/views/FloatingIconView;

    .line 108
    .line 109
    invoke-virtual {v2}, Lcom/android/launcher3/views/FloatingIconView;->B()Z

    .line 110
    .line 111
    .line 112
    move-result v16

    .line 113
    invoke-direct/range {v7 .. v16}, Lcom/android/launcher3/q5$D;-><init>(Landroid/content/res/Resources;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/view/View;IIZZ)V

    .line 114
    .line 115
    .line 116
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 117
    .line 118
    iget v6, v7, Lcom/android/launcher3/q5$D;->b:I

    .line 119
    .line 120
    int-to-float v6, v6

    .line 121
    iget v8, v7, Lcom/android/launcher3/q5$D;->f:I

    .line 122
    .line 123
    int-to-float v8, v8

    .line 124
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 125
    .line 126
    invoke-static {v9}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    invoke-direct {v2, v0, v6, v8, v9}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 131
    .line 132
    .line 133
    iput-object v2, v0, Lcom/android/launcher3/q5$a;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 134
    .line 135
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 136
    .line 137
    iget v6, v7, Lcom/android/launcher3/q5$D;->d:I

    .line 138
    .line 139
    int-to-float v6, v6

    .line 140
    iget v8, v7, Lcom/android/launcher3/q5$D;->h:I

    .line 141
    .line 142
    int-to-float v8, v8

    .line 143
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 144
    .line 145
    invoke-static {v9}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    .line 146
    .line 147
    .line 148
    move-result-object v9

    .line 149
    invoke-direct {v2, v0, v6, v8, v9}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 150
    .line 151
    .line 152
    iput-object v2, v0, Lcom/android/launcher3/q5$a;->q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 153
    .line 154
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 155
    .line 156
    iget v6, v7, Lcom/android/launcher3/q5$D;->j:F

    .line 157
    .line 158
    iget-object v8, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 159
    .line 160
    invoke-static {v8}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    .line 161
    .line 162
    .line 163
    move-result-object v8

    .line 164
    invoke-direct {v2, v0, v3, v6, v8}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 165
    .line 166
    .line 167
    iput-object v2, v0, Lcom/android/launcher3/q5$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 168
    .line 169
    new-instance v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 170
    .line 171
    iget v6, v7, Lcom/android/launcher3/q5$D;->k:F

    .line 172
    .line 173
    iget v8, v7, Lcom/android/launcher3/q5$D;->l:F

    .line 174
    .line 175
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 176
    .line 177
    invoke-static {v9}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    .line 178
    .line 179
    .line 180
    move-result-object v9

    .line 181
    invoke-direct {v2, v0, v6, v8, v9}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 182
    .line 183
    .line 184
    iput-object v2, v0, Lcom/android/launcher3/q5$a;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 185
    .line 186
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 187
    .line 188
    invoke-static {v2}, Lcom/android/launcher3/q5;->r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-interface {v2, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 197
    .line 198
    iget v8, v7, Lcom/android/launcher3/q5$D;->d:I

    .line 199
    .line 200
    int-to-float v8, v8

    .line 201
    iget v9, v7, Lcom/android/launcher3/q5$D;->h:I

    .line 202
    .line 203
    int-to-float v9, v9

    .line 204
    invoke-static {v2, v8, v9}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 205
    .line 206
    .line 207
    move-result v8

    .line 208
    iput v8, v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 209
    .line 210
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 211
    .line 212
    iget v8, v7, Lcom/android/launcher3/q5$D;->b:I

    .line 213
    .line 214
    int-to-float v8, v8

    .line 215
    iget v9, v7, Lcom/android/launcher3/q5$D;->f:I

    .line 216
    .line 217
    int-to-float v9, v9

    .line 218
    invoke-static {v2, v8, v9}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 219
    .line 220
    .line 221
    move-result v8

    .line 222
    iput v8, v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 223
    .line 224
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 225
    .line 226
    iget v8, v7, Lcom/android/launcher3/q5$D;->j:F

    .line 227
    .line 228
    invoke-static {v2, v3, v8}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 229
    .line 230
    .line 231
    move-result v8

    .line 232
    iput v8, v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 233
    .line 234
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 235
    .line 236
    iget v8, v7, Lcom/android/launcher3/q5$D;->k:F

    .line 237
    .line 238
    iget v7, v7, Lcom/android/launcher3/q5$D;->l:F

    .line 239
    .line 240
    invoke-static {v2, v8, v7}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    iput v2, v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 245
    .line 246
    :cond_1
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->C:Landroid/graphics/RectF;

    .line 247
    .line 248
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 253
    .line 254
    iget v6, v6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 255
    .line 256
    mul-float/2addr v2, v6

    .line 257
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->C:Landroid/graphics/RectF;

    .line 258
    .line 259
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 260
    .line 261
    .line 262
    move-result v6

    .line 263
    iget-object v7, v0, Lcom/android/launcher3/q5$a;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 264
    .line 265
    iget v7, v7, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 266
    .line 267
    mul-float/2addr v6, v7

    .line 268
    int-to-float v7, v5

    .line 269
    iget-object v8, v0, Lcom/android/launcher3/q5$a;->p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 270
    .line 271
    iget v8, v8, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 272
    .line 273
    add-float/2addr v8, v7

    .line 274
    float-to-int v8, v8

    .line 275
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 276
    .line 277
    iget v9, v9, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 278
    .line 279
    add-float/2addr v7, v9

    .line 280
    float-to-int v7, v7

    .line 281
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 282
    .line 283
    invoke-virtual {v9, v5, v5, v8, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 284
    .line 285
    .line 286
    iget-object v7, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 287
    .line 288
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 289
    .line 290
    .line 291
    move-result v7

    .line 292
    iget-object v8, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 293
    .line 294
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    .line 295
    .line 296
    .line 297
    move-result v8

    .line 298
    iget v9, v0, Lcom/android/launcher3/q5$a;->I:I

    .line 299
    .line 300
    if-eqz v9, :cond_2

    .line 301
    .line 302
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 303
    .line 304
    iget-object v10, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 305
    .line 306
    invoke-static {v10}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 307
    .line 308
    .line 309
    move-result-object v10

    .line 310
    iget v10, v10, Lcom/android/launcher3/h0;->T0:I

    .line 311
    .line 312
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 313
    .line 314
    invoke-static {v11}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 315
    .line 316
    .line 317
    move-result-object v11

    .line 318
    iget v11, v11, Lcom/android/launcher3/h0;->U0:I

    .line 319
    .line 320
    iget v12, v0, Lcom/android/launcher3/q5$a;->I:I

    .line 321
    .line 322
    invoke-static {v9, v10, v11, v12}, Lcom/android/launcher3/N5;->X(Landroid/graphics/Rect;III)V

    .line 323
    .line 324
    .line 325
    :cond_2
    int-to-float v7, v7

    .line 326
    div-float/2addr v2, v7

    .line 327
    int-to-float v8, v8

    .line 328
    div-float/2addr v6, v8

    .line 329
    invoke-static {v2, v6}, Ljava/lang/Math;->max(FF)F

    .line 330
    .line 331
    .line 332
    move-result v2

    .line 333
    const/high16 v6, 0x3f800000    # 1.0f

    .line 334
    .line 335
    invoke-static {v6, v2}, Ljava/lang/Math;->min(FF)F

    .line 336
    .line 337
    .line 338
    move-result v2

    .line 339
    mul-float/2addr v7, v2

    .line 340
    mul-float/2addr v8, v2

    .line 341
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 342
    .line 343
    iget-object v10, v0, Lcom/android/launcher3/q5$a;->C:Landroid/graphics/RectF;

    .line 344
    .line 345
    invoke-virtual {v9, v10}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 346
    .line 347
    .line 348
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 349
    .line 350
    iget-object v10, v0, Lcom/android/launcher3/q5$a;->E:[I

    .line 351
    .line 352
    aget v11, v10, v5

    .line 353
    .line 354
    int-to-float v11, v11

    .line 355
    aget v10, v10, v4

    .line 356
    .line 357
    int-to-float v10, v10

    .line 358
    invoke-virtual {v9, v11, v10}, Landroid/graphics/RectF;->offset(FF)V

    .line 359
    .line 360
    .line 361
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 362
    .line 363
    iget-object v10, v0, Lcom/android/launcher3/q5$a;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 364
    .line 365
    iget v10, v10, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 366
    .line 367
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 368
    .line 369
    iget v11, v11, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 370
    .line 371
    invoke-virtual {v9, v10, v11}, Landroid/graphics/RectF;->offset(FF)V

    .line 372
    .line 373
    .line 374
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 375
    .line 376
    iget-object v10, v0, Lcom/android/launcher3/q5$a;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 377
    .line 378
    iget v10, v10, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 379
    .line 380
    invoke-static {v9, v10}, Lcom/android/launcher3/N5;->a0(Landroid/graphics/RectF;F)V

    .line 381
    .line 382
    .line 383
    iget-object v9, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 384
    .line 385
    iget v10, v9, Landroid/graphics/RectF;->left:F

    .line 386
    .line 387
    iget-object v10, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 388
    .line 389
    iget v11, v10, Landroid/graphics/Rect;->left:I

    .line 390
    .line 391
    iget v9, v9, Landroid/graphics/RectF;->top:F

    .line 392
    .line 393
    iget v9, v10, Landroid/graphics/Rect;->top:I

    .line 394
    .line 395
    iget-object v9, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectF:Landroid/graphics/RectF;

    .line 396
    .line 397
    iget v10, v9, Landroid/graphics/RectF;->left:F

    .line 398
    .line 399
    iget v9, v9, Landroid/graphics/RectF;->top:F

    .line 400
    .line 401
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    .line 402
    .line 403
    invoke-virtual {v11}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 404
    .line 405
    .line 406
    move-result-object v11

    .line 407
    invoke-virtual {v11}, Lu2/e;->c()Landroid/graphics/RectF;

    .line 408
    .line 409
    .line 410
    move-result-object v11

    .line 411
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 412
    .line 413
    invoke-virtual {v12}, Landroid/graphics/RectF;->centerX()F

    .line 414
    .line 415
    .line 416
    move-result v12

    .line 417
    const/high16 v13, 0x40000000    # 2.0f

    .line 418
    .line 419
    div-float v14, v7, v13

    .line 420
    .line 421
    sub-float/2addr v12, v14

    .line 422
    iget-object v15, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 423
    .line 424
    invoke-virtual {v15}, Landroid/graphics/RectF;->centerY()F

    .line 425
    .line 426
    .line 427
    move-result v15

    .line 428
    div-float v13, v8, v13

    .line 429
    .line 430
    sub-float/2addr v15, v13

    .line 431
    iget-object v5, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 432
    .line 433
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    .line 434
    .line 435
    .line 436
    move-result v5

    .line 437
    add-float/2addr v5, v14

    .line 438
    iget-object v14, v0, Lcom/android/launcher3/q5$a;->J:Landroid/graphics/RectF;

    .line 439
    .line 440
    invoke-virtual {v14}, Landroid/graphics/RectF;->centerY()F

    .line 441
    .line 442
    .line 443
    move-result v14

    .line 444
    add-float/2addr v14, v13

    .line 445
    invoke-virtual {v11, v12, v15, v5, v14}, Landroid/graphics/RectF;->set(FFFF)V

    .line 446
    .line 447
    .line 448
    iget-object v5, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    .line 449
    .line 450
    invoke-virtual {v5}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 451
    .line 452
    .line 453
    move-result-object v5

    .line 454
    invoke-virtual {v5, v1}, Lu2/e;->i(F)V

    .line 455
    .line 456
    .line 457
    iget-object v5, v0, Lcom/android/launcher3/q5$a;->L:Landroid/graphics/RectF;

    .line 458
    .line 459
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->M:Landroid/graphics/RectF;

    .line 460
    .line 461
    invoke-virtual {v5, v11}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 462
    .line 463
    .line 464
    iget-object v5, v0, Lcom/android/launcher3/q5$a;->L:Landroid/graphics/RectF;

    .line 465
    .line 466
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 467
    .line 468
    iget v11, v11, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 469
    .line 470
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 471
    .line 472
    iget v12, v12, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 473
    .line 474
    invoke-virtual {v5, v11, v12}, Landroid/graphics/RectF;->offset(FF)V

    .line 475
    .line 476
    .line 477
    iget-object v5, v0, Lcom/android/launcher3/q5$a;->L:Landroid/graphics/RectF;

    .line 478
    .line 479
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 480
    .line 481
    iget v11, v11, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 482
    .line 483
    invoke-static {v5, v11}, Lcom/android/launcher3/N5;->a0(Landroid/graphics/RectF;F)V

    .line 484
    .line 485
    .line 486
    if-eqz p2, :cond_3

    .line 487
    .line 488
    iget-object v1, v0, Lcom/android/launcher3/q5$a;->G:Lcom/android/launcher3/views/FloatingIconView;

    .line 489
    .line 490
    iget-object v2, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectF:Landroid/graphics/RectF;

    .line 491
    .line 492
    iget v3, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurProgress:F

    .line 493
    .line 494
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectRadius:F

    .line 495
    .line 496
    const/16 v23, 0x1

    .line 497
    .line 498
    const/high16 v18, 0x3f800000    # 1.0f

    .line 499
    .line 500
    const/16 v21, 0x0

    .line 501
    .line 502
    move/from16 v22, v0

    .line 503
    .line 504
    move-object/from16 v17, v1

    .line 505
    .line 506
    move-object/from16 v19, v2

    .line 507
    .line 508
    move/from16 v20, v3

    .line 509
    .line 510
    invoke-virtual/range {v17 .. v23}, Lcom/android/launcher3/views/FloatingIconView;->N(FLandroid/graphics/RectF;FFFZ)V

    .line 511
    .line 512
    .line 513
    return-void

    .line 514
    :cond_3
    new-instance v5, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 515
    .line 516
    invoke-direct {v5}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 517
    .line 518
    .line 519
    iget-object v11, v0, Lcom/android/launcher3/q5$a;->N:[Landroid/view/RemoteAnimationTarget;

    .line 520
    .line 521
    array-length v11, v11

    .line 522
    sub-int/2addr v11, v4

    .line 523
    :goto_1
    if-ltz v11, :cond_e

    .line 524
    .line 525
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->N:[Landroid/view/RemoteAnimationTarget;

    .line 526
    .line 527
    aget-object v12, v12, v11

    .line 528
    .line 529
    iget-object v13, v12, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 530
    .line 531
    invoke-virtual {v5, v13}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 532
    .line 533
    .line 534
    move-result-object v13

    .line 535
    iget v14, v12, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 536
    .line 537
    const/4 v15, 0x2

    .line 538
    if-nez v14, :cond_a

    .line 539
    .line 540
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 541
    .line 542
    invoke-virtual {v12, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 543
    .line 544
    .line 545
    iget v12, v0, Lcom/android/launcher3/q5$a;->I:I

    .line 546
    .line 547
    if-ne v12, v4, :cond_4

    .line 548
    .line 549
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 550
    .line 551
    iget-object v14, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 552
    .line 553
    invoke-static {v14}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 554
    .line 555
    .line 556
    move-result-object v14

    .line 557
    iget v14, v14, Lcom/android/launcher3/h0;->T0:I

    .line 558
    .line 559
    int-to-float v14, v14

    .line 560
    add-float v15, v10, v7

    .line 561
    .line 562
    sub-float/2addr v14, v15

    .line 563
    invoke-virtual {v12, v9, v14}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 564
    .line 565
    .line 566
    goto :goto_2

    .line 567
    :cond_4
    if-ne v12, v15, :cond_5

    .line 568
    .line 569
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 570
    .line 571
    iget-object v14, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 572
    .line 573
    invoke-static {v14}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 574
    .line 575
    .line 576
    move-result-object v14

    .line 577
    iget v14, v14, Lcom/android/launcher3/h0;->T0:I

    .line 578
    .line 579
    int-to-float v14, v14

    .line 580
    add-float v15, v10, v7

    .line 581
    .line 582
    sub-float/2addr v14, v15

    .line 583
    iget-object v15, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 584
    .line 585
    invoke-static {v15}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 586
    .line 587
    .line 588
    move-result-object v15

    .line 589
    iget v15, v15, Lcom/android/launcher3/h0;->U0:I

    .line 590
    .line 591
    int-to-float v15, v15

    .line 592
    add-float v17, v9, v8

    .line 593
    .line 594
    sub-float v15, v15, v17

    .line 595
    .line 596
    invoke-virtual {v12, v14, v15}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 597
    .line 598
    .line 599
    goto :goto_2

    .line 600
    :cond_5
    const/4 v14, 0x3

    .line 601
    if-ne v12, v14, :cond_6

    .line 602
    .line 603
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 604
    .line 605
    iget-object v14, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 606
    .line 607
    invoke-static {v14}, Lcom/android/launcher3/q5;->o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;

    .line 608
    .line 609
    .line 610
    move-result-object v14

    .line 611
    iget v14, v14, Lcom/android/launcher3/h0;->U0:I

    .line 612
    .line 613
    int-to-float v14, v14

    .line 614
    add-float v15, v9, v8

    .line 615
    .line 616
    sub-float/2addr v14, v15

    .line 617
    invoke-virtual {v12, v14, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 618
    .line 619
    .line 620
    goto :goto_2

    .line 621
    :cond_6
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 622
    .line 623
    invoke-virtual {v12, v10, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 624
    .line 625
    .line 626
    :goto_2
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->t:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 627
    .line 628
    iget v12, v12, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 629
    .line 630
    iget-object v12, v0, Lcom/android/launcher3/q5$a;->l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 631
    .line 632
    iget v12, v12, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 633
    .line 634
    invoke-static {v1}, Lcom/android/launcher3/anim/C;->d0(F)F

    .line 635
    .line 636
    .line 637
    const v12, 0x3e4ccccd    # 0.2f

    .line 638
    .line 639
    .line 640
    sub-float v12, v1, v12

    .line 641
    .line 642
    const v14, 0x3e99999a    # 0.3f

    .line 643
    .line 644
    .line 645
    div-float/2addr v12, v14

    .line 646
    invoke-static {v3, v12}, Ljava/lang/Math;->max(FF)F

    .line 647
    .line 648
    .line 649
    move-result v14

    .line 650
    invoke-static {v6, v14}, Ljava/lang/Math;->min(FF)F

    .line 651
    .line 652
    .line 653
    move-result v14

    .line 654
    cmpl-float v15, v2, v3

    .line 655
    .line 656
    if-lez v15, :cond_7

    .line 657
    .line 658
    iget v15, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectRadius:F

    .line 659
    .line 660
    div-float/2addr v15, v2

    .line 661
    goto :goto_3

    .line 662
    :cond_7
    iget v15, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectRadius:F

    .line 663
    .line 664
    :goto_3
    invoke-static {v3, v12}, Ljava/lang/Math;->max(FF)F

    .line 665
    .line 666
    .line 667
    move-result v12

    .line 668
    invoke-static {v6, v12}, Ljava/lang/Math;->min(FF)F

    .line 669
    .line 670
    .line 671
    move-result v12

    .line 672
    move/from16 v17, v3

    .line 673
    .line 674
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->u:Lcom/android/launcher3/q5$D;

    .line 675
    .line 676
    iget v3, v3, Lcom/android/launcher3/q5$D;->m:F

    .line 677
    .line 678
    sub-float v18, v17, v3

    .line 679
    .line 680
    sget-object v6, Lcom/android/launcher3/q5;->b0:Landroid/view/animation/Interpolator;

    .line 681
    .line 682
    invoke-interface {v6, v12}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 683
    .line 684
    .line 685
    move-result v6

    .line 686
    mul-float v18, v18, v6

    .line 687
    .line 688
    add-float v21, v3, v18

    .line 689
    .line 690
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->G:Lcom/android/launcher3/views/FloatingIconView;

    .line 691
    .line 692
    iget-object v6, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectF:Landroid/graphics/RectF;

    .line 693
    .line 694
    iget v12, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurProgress:F

    .line 695
    .line 696
    move/from16 v18, v4

    .line 697
    .line 698
    iget v4, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectRadius:F

    .line 699
    .line 700
    const/16 v26, 0x1

    .line 701
    .line 702
    const/16 v24, 0x0

    .line 703
    .line 704
    move-object/from16 v20, v3

    .line 705
    .line 706
    move/from16 v25, v4

    .line 707
    .line 708
    move-object/from16 v22, v6

    .line 709
    .line 710
    move/from16 v23, v12

    .line 711
    .line 712
    invoke-virtual/range {v20 .. v26}, Lcom/android/launcher3/views/FloatingIconView;->N(FLandroid/graphics/RectF;FFFZ)V

    .line 713
    .line 714
    .line 715
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 716
    .line 717
    invoke-static {v3}, Lcom/android/launcher3/q5;->m(Lcom/android/launcher3/q5;)Lcom/android/launcher3/M2$b;

    .line 718
    .line 719
    .line 720
    move-result-object v3

    .line 721
    if-eqz v3, :cond_9

    .line 722
    .line 723
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->S:Lcom/android/launcher3/q5;

    .line 724
    .line 725
    invoke-static {v3}, Lcom/android/launcher3/q5;->m(Lcom/android/launcher3/q5;)Lcom/android/launcher3/M2$b;

    .line 726
    .line 727
    .line 728
    move-result-object v3

    .line 729
    invoke-interface {v3}, Lcom/android/launcher3/M2$b;->getAppTransitionParamForInterrupt()Lu2/e;

    .line 730
    .line 731
    .line 732
    move-result-object v3

    .line 733
    if-eqz v3, :cond_9

    .line 734
    .line 735
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    .line 736
    .line 737
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 738
    .line 739
    .line 740
    move-result-object v3

    .line 741
    invoke-virtual {v3}, Lu2/e;->d()Landroid/graphics/Matrix;

    .line 742
    .line 743
    .line 744
    move-result-object v3

    .line 745
    iget-object v4, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 746
    .line 747
    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 748
    .line 749
    .line 750
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    .line 751
    .line 752
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 753
    .line 754
    .line 755
    move-result-object v3

    .line 756
    invoke-virtual {v3}, Lu2/e;->a()Landroid/graphics/Rect;

    .line 757
    .line 758
    .line 759
    move-result-object v3

    .line 760
    iget-object v4, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 761
    .line 762
    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 763
    .line 764
    .line 765
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    .line 766
    .line 767
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 768
    .line 769
    .line 770
    move-result-object v3

    .line 771
    invoke-static {}, Lx1/O;->U2()Z

    .line 772
    .line 773
    .line 774
    move-result v4

    .line 775
    if-eqz v4, :cond_8

    .line 776
    .line 777
    const/high16 v4, 0x3f800000    # 1.0f

    .line 778
    .line 779
    goto :goto_4

    .line 780
    :cond_8
    iget-object v4, v0, Lcom/android/launcher3/q5$a;->t:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 781
    .line 782
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 783
    .line 784
    :goto_4
    invoke-virtual {v3, v4}, Lu2/e;->l(F)V

    .line 785
    .line 786
    .line 787
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    .line 788
    .line 789
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 790
    .line 791
    .line 792
    move-result-object v3

    .line 793
    invoke-static {}, Lx1/O;->U2()Z

    .line 794
    .line 795
    .line 796
    move-result v4

    .line 797
    xor-int/lit8 v4, v4, 0x1

    .line 798
    .line 799
    invoke-virtual {v3, v4}, Lu2/e;->k(Z)V

    .line 800
    .line 801
    .line 802
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->K:Lcom/android/launcher3/anim/C;

    .line 803
    .line 804
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 805
    .line 806
    .line 807
    move-result-object v3

    .line 808
    iget v4, v0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectRadius:F

    .line 809
    .line 810
    invoke-virtual {v3, v4}, Lu2/e;->m(F)V

    .line 811
    .line 812
    .line 813
    :cond_9
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 814
    .line 815
    invoke-virtual {v13, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 816
    .line 817
    .line 818
    move-result-object v3

    .line 819
    iget-object v4, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 820
    .line 821
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 822
    .line 823
    .line 824
    move-result-object v3

    .line 825
    invoke-virtual {v3, v14}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 826
    .line 827
    .line 828
    move-result-object v3

    .line 829
    invoke-virtual {v3, v15}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 830
    .line 831
    .line 832
    move-result-object v3

    .line 833
    iget-object v4, v0, Lcom/android/launcher3/q5$a;->m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 834
    .line 835
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 836
    .line 837
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setShadowRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 838
    .line 839
    .line 840
    move/from16 v12, v18

    .line 841
    .line 842
    :goto_5
    const/4 v4, 0x0

    .line 843
    const/high16 v6, 0x3f800000    # 1.0f

    .line 844
    .line 845
    goto :goto_7

    .line 846
    :cond_a
    move/from16 v17, v3

    .line 847
    .line 848
    move v3, v4

    .line 849
    if-ne v14, v3, :cond_d

    .line 850
    .line 851
    iget-object v3, v12, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 852
    .line 853
    if-eqz v3, :cond_b

    .line 854
    .line 855
    iget-object v4, v0, Lcom/android/launcher3/q5$a;->P:Landroid/graphics/Point;

    .line 856
    .line 857
    iget v6, v3, Landroid/graphics/Rect;->left:I

    .line 858
    .line 859
    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 860
    .line 861
    invoke-virtual {v4, v6, v3}, Landroid/graphics/Point;->set(II)V

    .line 862
    .line 863
    .line 864
    goto :goto_6

    .line 865
    :cond_b
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->P:Landroid/graphics/Point;

    .line 866
    .line 867
    iget-object v4, v12, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 868
    .line 869
    iget v6, v4, Landroid/graphics/Point;->x:I

    .line 870
    .line 871
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 872
    .line 873
    invoke-virtual {v3, v6, v4}, Landroid/graphics/Point;->set(II)V

    .line 874
    .line 875
    .line 876
    :goto_6
    new-instance v3, Landroid/graphics/Rect;

    .line 877
    .line 878
    iget-object v4, v12, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 879
    .line 880
    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 881
    .line 882
    .line 883
    const/4 v4, 0x0

    .line 884
    invoke-virtual {v3, v4, v4}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 885
    .line 886
    .line 887
    iget v6, v0, Lcom/android/launcher3/q5$a;->I:I

    .line 888
    .line 889
    rem-int/2addr v6, v15

    .line 890
    const/4 v12, 0x1

    .line 891
    if-ne v6, v12, :cond_c

    .line 892
    .line 893
    iget v6, v3, Landroid/graphics/Rect;->right:I

    .line 894
    .line 895
    iget v14, v3, Landroid/graphics/Rect;->bottom:I

    .line 896
    .line 897
    iput v14, v3, Landroid/graphics/Rect;->right:I

    .line 898
    .line 899
    iput v6, v3, Landroid/graphics/Rect;->bottom:I

    .line 900
    .line 901
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->P:Landroid/graphics/Point;

    .line 902
    .line 903
    iget v14, v6, Landroid/graphics/Point;->x:I

    .line 904
    .line 905
    iget v15, v6, Landroid/graphics/Point;->y:I

    .line 906
    .line 907
    iput v15, v6, Landroid/graphics/Point;->x:I

    .line 908
    .line 909
    iput v14, v6, Landroid/graphics/Point;->y:I

    .line 910
    .line 911
    :cond_c
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 912
    .line 913
    iget-object v14, v0, Lcom/android/launcher3/q5$a;->P:Landroid/graphics/Point;

    .line 914
    .line 915
    iget v15, v14, Landroid/graphics/Point;->x:I

    .line 916
    .line 917
    int-to-float v15, v15

    .line 918
    iget v14, v14, Landroid/graphics/Point;->y:I

    .line 919
    .line 920
    int-to-float v14, v14

    .line 921
    invoke-virtual {v6, v15, v14}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 922
    .line 923
    .line 924
    iget-object v6, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 925
    .line 926
    invoke-virtual {v13, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 927
    .line 928
    .line 929
    move-result-object v6

    .line 930
    invoke-virtual {v6, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 931
    .line 932
    .line 933
    move-result-object v3

    .line 934
    const/high16 v6, 0x3f800000    # 1.0f

    .line 935
    .line 936
    invoke-virtual {v3, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 937
    .line 938
    .line 939
    goto :goto_7

    .line 940
    :cond_d
    move v12, v3

    .line 941
    goto :goto_5

    .line 942
    :goto_7
    add-int/lit8 v11, v11, -0x1

    .line 943
    .line 944
    move v4, v12

    .line 945
    move/from16 v3, v17

    .line 946
    .line 947
    goto/16 :goto_1

    .line 948
    .line 949
    :cond_e
    iget-object v1, v0, Lcom/android/launcher3/q5$a;->Q:Landroid/view/RemoteAnimationTarget;

    .line 950
    .line 951
    if-eqz v1, :cond_10

    .line 952
    .line 953
    iget-object v1, v1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 954
    .line 955
    invoke-virtual {v5, v1}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 956
    .line 957
    .line 958
    move-result-object v1

    .line 959
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->s:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 960
    .line 961
    iget v4, v3, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 962
    .line 963
    invoke-virtual {v3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->getStartValue()F

    .line 964
    .line 965
    .line 966
    move-result v3

    .line 967
    cmpl-float v3, v4, v3

    .line 968
    .line 969
    if-lez v3, :cond_f

    .line 970
    .line 971
    iget-object v3, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 972
    .line 973
    invoke-virtual {v3, v2, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 974
    .line 975
    .line 976
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 977
    .line 978
    invoke-virtual {v2, v10, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 979
    .line 980
    .line 981
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->O:Landroid/graphics/Matrix;

    .line 982
    .line 983
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 984
    .line 985
    .line 986
    move-result-object v1

    .line 987
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->H:Landroid/graphics/Rect;

    .line 988
    .line 989
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 990
    .line 991
    .line 992
    move-result-object v1

    .line 993
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->s:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 994
    .line 995
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 996
    .line 997
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 998
    .line 999
    .line 1000
    goto :goto_8

    .line 1001
    :cond_f
    iget-object v2, v0, Lcom/android/launcher3/q5$a;->r:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 1002
    .line 1003
    iget v2, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 1004
    .line 1005
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 1006
    .line 1007
    .line 1008
    :cond_10
    :goto_8
    iget-object v0, v0, Lcom/android/launcher3/q5$a;->R:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 1009
    .line 1010
    invoke-virtual {v0, v5}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 1011
    .line 1012
    .line 1013
    return-void
.end method
