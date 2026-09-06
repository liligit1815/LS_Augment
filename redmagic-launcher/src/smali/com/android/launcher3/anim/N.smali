.class public Lcom/android/launcher3/anim/N;
.super Ljava/lang/Object;
.source "MFVBaseAppTransitionHelper.java"


# instance fields
.field private final a:LU0/a;

.field private b:Lcom/android/quickstep/util/animation/AnimationRecord;

.field private c:Lcom/android/quickstep/util/animation/AnimationRecord;

.field private d:Lcom/android/launcher3/h0;

.field private e:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/anim/N;->e:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/anim/N;->d:Lcom/android/launcher3/h0;

    .line 7
    .line 8
    sget-object p2, LU0/g;->h:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, LU0/a;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/anim/N;->a:LU0/a;

    .line 17
    .line 18
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/anim/N;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/N;->e:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final b()Landroid/graphics/RectF;
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/N;->d:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 4
    .line 5
    div-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/h0;->V0:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    const/high16 v2, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr v1, v2

    .line 13
    iget p0, p0, Lcom/android/launcher3/h0;->W0:I

    .line 14
    .line 15
    int-to-float p0, p0

    .line 16
    div-float/2addr p0, v2

    .line 17
    int-to-float v0, v0

    .line 18
    new-instance v2, Landroid/graphics/RectF;

    .line 19
    .line 20
    sub-float v3, v1, v0

    .line 21
    .line 22
    sub-float v4, p0, v0

    .line 23
    .line 24
    add-float/2addr v1, v0

    .line 25
    add-float/2addr p0, v0

    .line 26
    invoke-direct {v2, v3, v4, v1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 27
    .line 28
    .line 29
    return-object v2
.end method

.method public final c([Lu2/s;Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/RemoteAnimationTargets;ZLu4/a;Lu4/l;)Lcom/android/launcher3/anim/U;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lu2/s;",
            "Lcom/android/quickstep/util/SurfaceTransactionApplier;",
            "Lcom/android/quickstep/RemoteAnimationTargets;",
            "Z",
            "Lu4/a<",
            "Lcom/android/quickstep/util/anim/IconSurfaceLockObject;",
            ">;",
            "Lu4/l<",
            "Ljava/lang/Boolean;",
            "Lcom/android/quickstep/util/anim/IconSurfaceLockObject;",
            ">;)",
            "Lcom/android/launcher3/anim/U;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/N$a;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v6, p1

    .line 5
    move-object v5, p2

    .line 6
    move-object v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v7, p5

    .line 9
    move-object v2, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/anim/N$a;-><init>(Lcom/android/launcher3/anim/N;Lu4/l;Lcom/android/quickstep/RemoteAnimationTargets;ZLcom/android/quickstep/util/SurfaceTransactionApplier;[Lu2/s;Lu4/a;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final d(ZLandroid/view/View;ZLandroid/graphics/RectF;ZZ)Lcom/android/launcher3/views/FloatingIconView;
    .locals 7

    .line 1
    const-string v0, "startRect"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    if-eqz p6, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/anim/N;->e:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 11
    .line 12
    invoke-static {p0, p2, p3, p4, p5}, Lcom/android/launcher3/views/FloatingIconView;->u(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/anim/N;->e:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    move-object v1, p2

    .line 22
    move v4, p3

    .line 23
    move-object v5, p4

    .line 24
    move v6, p5

    .line 25
    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/views/FloatingIconView;->v(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final e()LU0/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/N;->a:LU0/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/N;->b:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/N;->c:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h([Lu2/s;Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/RemoteAnimationTargets;ZLu4/a;Lu4/a;)Lcom/android/launcher3/anim/U;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lu2/s;",
            "Lcom/android/quickstep/util/SurfaceTransactionApplier;",
            "Lcom/android/quickstep/RemoteAnimationTargets;",
            "Z",
            "Lu4/a<",
            "Lcom/android/quickstep/util/anim/IconSurfaceLockObject;",
            ">;",
            "Lu4/a<",
            "Lcom/android/quickstep/util/anim/IconSurfaceLockObject;",
            ">;)",
            "Lcom/android/launcher3/anim/U;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/N$b;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v6, p1

    .line 5
    move-object v5, p2

    .line 6
    move-object v2, p3

    .line 7
    move v4, p4

    .line 8
    move-object v7, p5

    .line 9
    move-object v3, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/anim/N$b;-><init>(Lcom/android/launcher3/anim/N;Lcom/android/quickstep/RemoteAnimationTargets;Lu4/a;ZLcom/android/quickstep/util/SurfaceTransactionApplier;[Lu2/s;Lu4/a;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final i(Lcom/android/quickstep/util/animation/AnimationRecord;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/N;->b:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 2
    .line 3
    return-void
.end method

.method public final j(Lcom/android/quickstep/util/animation/AnimationRecord;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/N;->c:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 2
    .line 3
    return-void
.end method
