.class public Lcom/android/launcher3/hybridhotseat/b;
.super Ljava/lang/Object;
.source "HotseatPredictionController.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/j$b;
.implements Lcom/android/launcher3/popup/P$i;
.implements Lcom/android/launcher3/X3$b;
.implements Lcom/android/launcher3/m0;
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/hybridhotseat/b$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/dragndrop/j$b;",
        "Lcom/android/launcher3/popup/P$i<",
        "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
        ">;",
        "Lcom/android/launcher3/X3$b;",
        "Lcom/android/launcher3/m0;",
        "Landroid/view/ViewGroup$OnHierarchyChangeListener;"
    }
.end annotation


# instance fields
.field private g:I

.field private h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final i:Lcom/android/launcher3/Hotseat;

.field private final j:Ljava/lang/Runnable;

.field private k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private l:Landroid/animation/AnimatorSet;

.field private m:I

.field private n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/uioverrides/PredictedAppIcon$e;",
            ">;"
        }
    .end annotation
.end field

.field private o:Z

.field private final p:Landroid/view/View$OnLongClickListener;

.field private final q:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lq1/f;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lq1/f;-><init>(Lcom/android/launcher3/hybridhotseat/b;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->j:Ljava/lang/Runnable;

    .line 10
    .line 11
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->n:Ljava/util/List;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/android/launcher3/hybridhotseat/b;->o:Z

    .line 27
    .line 28
    new-instance v0, Lq1/g;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lq1/g;-><init>(Lcom/android/launcher3/hybridhotseat/b;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->p:Landroid/view/View$OnLongClickListener;

    .line 34
    .line 35
    new-instance v0, Lq1/h;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lq1/h;-><init>(Lcom/android/launcher3/hybridhotseat/b;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->q:Ljava/lang/Runnable;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget v1, v1, Lcom/android/launcher3/h0;->a2:I

    .line 57
    .line 58
    iput v1, p0, Lcom/android/launcher3/hybridhotseat/b;->g:I

    .line 59
    .line 60
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private C()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/b;->j:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->j:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private D()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/b;->q:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->q:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private H(Lcom/android/launcher3/model/data/I;I)V
    .locals 1

    .line 1
    const/16 v0, -0x67

    .line 2
    .line 3
    iput v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 4
    .line 5
    iput p2, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lcom/android/launcher3/Hotseat;->U0(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Hotseat;->V0(I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    iput p0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 22
    .line 23
    iput p2, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 24
    .line 25
    return-void
.end method

.method private I(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x8

    .line 4
    .line 5
    iput v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 13
    .line 14
    and-int/lit8 p1, p1, -0x9

    .line 15
    .line 16
    iput p1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 17
    .line 18
    return-void
.end method

.method private J()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->n:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->n:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/android/launcher3/uioverrides/PredictedAppIcon$e;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Lcom/android/launcher3/CellLayout;->s0(Lc1/d;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->n:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private K(Ljava/util/List;Lcom/android/launcher3/n0$a;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/uioverrides/PredictedAppIcon$e;",
            ">;",
            "Lcom/android/launcher3/n0$a;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->l:Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->end()V

    .line 7
    .line 8
    .line 9
    :cond_0
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->l:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->J()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->q()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/widget/TextView;->isEnabled()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v3, p2, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 47
    .line 48
    if-ne v3, p0, :cond_2

    .line 49
    .line 50
    iget-object v3, p2, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    invoke-direct {p0, v2}, Lcom/android/launcher3/hybridhotseat/b;->I(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 67
    .line 68
    iget v3, v3, Lcom/android/launcher3/model/data/y;->rank:I

    .line 69
    .line 70
    new-instance v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon$e;

    .line 71
    .line 72
    iget-object v5, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 73
    .line 74
    invoke-virtual {v5, v3}, Lcom/android/launcher3/Hotseat;->U0(I)I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    iget-object v6, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 79
    .line 80
    invoke-virtual {v6, v3}, Lcom/android/launcher3/Hotseat;->V0(I)I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    invoke-direct {v4, v5, v3, v2}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$e;-><init>(IILcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 91
    .line 92
    .line 93
    sget-object v3, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 94
    .line 95
    const/4 v4, 0x1

    .line 96
    new-array v4, v4, [F

    .line 97
    .line 98
    const/4 v5, 0x0

    .line 99
    aput v5, v4, v0

    .line 100
    .line 101
    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    new-instance v4, Lcom/android/launcher3/hybridhotseat/b$b;

    .line 106
    .line 107
    invoke-direct {v4, p0, v2}, Lcom/android/launcher3/hybridhotseat/b$b;-><init>(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3, v4}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/b;->l:Landroid/animation/AnimatorSet;

    .line 114
    .line 115
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->l:Landroid/animation/AnimatorSet;

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method private O()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-direct {p0, v0}, Lcom/android/launcher3/hybridhotseat/b;->p(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private P()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->c3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 14
    .line 15
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getHotseatDivideAnimation()Lp1/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lp1/a;->o(Lcom/android/launcher3/K5;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/hybridhotseat/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/hybridhotseat/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->P()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/hybridhotseat/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/android/launcher3/hybridhotseat/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/hybridhotseat/b;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/b;->y(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic h(Lcom/android/launcher3/hybridhotseat/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->J()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/hybridhotseat/b;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/hybridhotseat/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/b;->p(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/b;->I(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 23
    .line 24
    invoke-static {v2, v1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->o1(Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/I;)Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-interface {v3, v2, v1}, Lcom/android/launcher3/M6;->i(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->p:Landroid/view/View$OnLongClickListener;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->q1(Landroid/view/View$OnLongClickListener;)V

    .line 40
    .line 41
    .line 42
    if-eqz p2, :cond_0

    .line 43
    .line 44
    sget-object v1, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 45
    .line 46
    const/4 v3, 0x2

    .line 47
    new-array v3, v3, [F

    .line 48
    .line 49
    fill-array-data v3, :array_0

    .line 50
    .line 51
    .line 52
    invoke-static {v2, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    if-eqz p2, :cond_2

    .line 61
    .line 62
    new-instance p1, Lq1/j;

    .line 63
    .line 64
    invoke-direct {p1, p0}, Lq1/j;-><init>(Lcom/android/launcher3/hybridhotseat/b;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->J()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :array_0
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/hybridhotseat/b;->p(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private p(Z)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->l:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->l:Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    new-instance v1, Lcom/android/launcher3/hybridhotseat/b$a;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/hybridhotseat/b$a;-><init>(Lcom/android/launcher3/hybridhotseat/b;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget v1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 33
    .line 34
    or-int/lit8 v1, v1, 0x4

    .line 35
    .line 36
    iput v1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    move v2, v1

    .line 40
    move v3, v2

    .line 41
    :goto_0
    iget v4, p0, Lcom/android/launcher3/hybridhotseat/b;->g:I

    .line 42
    .line 43
    if-ge v1, v4, :cond_7

    .line 44
    .line 45
    iget-object v4, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 46
    .line 47
    invoke-virtual {v4, v1}, Lcom/android/launcher3/Hotseat;->U0(I)I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    iget-object v6, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 52
    .line 53
    invoke-virtual {v6, v1}, Lcom/android/launcher3/Hotseat;->V0(I)I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    invoke-virtual {v4, v5, v6}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    invoke-static {v4}, Lcom/android/launcher3/hybridhotseat/b;->w(Landroid/view/View;)Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-nez v5, :cond_2

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    iget-object v5, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-gt v5, v2, :cond_3

    .line 77
    .line 78
    invoke-static {v4}, Lcom/android/launcher3/hybridhotseat/b;->w(Landroid/view/View;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_6

    .line 83
    .line 84
    iget-object v5, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 85
    .line 86
    invoke-virtual {v5, v4}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    iget-object v5, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 91
    .line 92
    add-int/lit8 v6, v2, 0x1

    .line 93
    .line 94
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 99
    .line 100
    invoke-static {v4}, Lcom/android/launcher3/hybridhotseat/b;->w(Landroid/view/View;)Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    if-eqz v5, :cond_5

    .line 105
    .line 106
    invoke-virtual {v4}, Landroid/view/View;->isEnabled()Z

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-eqz v5, :cond_5

    .line 111
    .line 112
    check-cast v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 113
    .line 114
    invoke-virtual {v4, v2, v3}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->m1(Lcom/android/launcher3/model/data/I;I)Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-eqz v5, :cond_4

    .line 119
    .line 120
    add-int/lit8 v3, v3, 0x1

    .line 121
    .line 122
    :cond_4
    iget-object v5, p0, Lcom/android/launcher3/hybridhotseat/b;->p:Landroid/view/View$OnLongClickListener;

    .line 123
    .line 124
    invoke-virtual {v4, v5}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->q1(Landroid/view/View$OnLongClickListener;)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_5
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    :goto_1
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/hybridhotseat/b;->H(Lcom/android/launcher3/model/data/I;I)V

    .line 132
    .line 133
    .line 134
    move v2, v6

    .line 135
    :cond_6
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_7
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/hybridhotseat/b;->l(Ljava/util/List;Z)V

    .line 139
    .line 140
    .line 141
    iget p1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 142
    .line 143
    and-int/lit8 p1, p1, -0x5

    .line 144
    .line 145
    iput p1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 146
    .line 147
    return-void
.end method

.method private q()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/uioverrides/PredictedAppIcon;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v1, v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/android/launcher3/hybridhotseat/b;->w(Landroid/view/View;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    check-cast v2, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 30
    .line 31
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-object v0
.end method

.method private static t(I)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v1, "|"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const-string v2, "FLAG_UPDATE_PAUSED"

    .line 10
    .line 11
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    const-string v2, "FLAG_DRAG_IN_PROGRESS"

    .line 16
    .line 17
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    const-string v2, "FLAG_FILL_IN_PROGRESS"

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 v1, 0x8

    .line 27
    .line 28
    const-string v2, "FLAG_REMOVING_PREDICTED_ICON"

    .line 29
    .line 30
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method private static w(Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 18
    .line 19
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 20
    .line 21
    const/16 v0, -0x67

    .line 22
    .line 23
    if-ne p0, v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private synthetic x()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/hybridhotseat/a;->e()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic y(Landroid/view/View;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/touch/A;->d(Lcom/android/launcher3/C2;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    const-string v0, "Main"

    .line 25
    .line 26
    const-string v2, "onWorkspaceItemLongClick"

    .line 27
    .line 28
    invoke-static {v0, v2}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/android/launcher3/hybridhotseat/b;->o:Z

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    sget-object v0, Lcom/android/launcher3/util/H1;->g:Lcom/android/launcher3/X;

    .line 37
    .line 38
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Lcom/android/launcher3/X;->g(Landroid/content/Context;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-nez v3, :cond_2

    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 53
    .line 54
    new-instance v3, Lq1/k;

    .line 55
    .line 56
    invoke-direct {v3, p0}, Lq1/k;-><init>(Lcom/android/launcher3/hybridhotseat/b;)V

    .line 57
    .line 58
    .line 59
    const v4, 0x7f14020e

    .line 60
    .line 61
    .line 62
    const v5, 0x7f14020d

    .line 63
    .line 64
    .line 65
    const/4 v6, 0x0

    .line 66
    invoke-static {p1, v4, v5, v6, v3}, Lcom/android/launcher3/views/W;->U(Landroid/content/Context;IILjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-virtual {p1, v0, v3}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->performHapticFeedback(I)Z

    .line 87
    .line 88
    .line 89
    return v2

    .line 90
    :cond_2
    new-instance v7, Lcom/android/launcher3/model/data/I;

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 97
    .line 98
    invoke-direct {v7, v0}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 99
    .line 100
    .line 101
    const/4 v0, 0x4

    .line 102
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    new-instance v8, Ln1/d;

    .line 112
    .line 113
    invoke-direct {v8, p1}, Ln1/d;-><init>(Landroid/view/View;)V

    .line 114
    .line 115
    .line 116
    new-instance v9, Lcom/android/launcher3/dragndrop/p;

    .line 117
    .line 118
    invoke-direct {v9}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 119
    .line 120
    .line 121
    const/4 v5, 0x0

    .line 122
    move-object v6, p0

    .line 123
    move-object v4, p1

    .line 124
    invoke-virtual/range {v3 .. v9}, Lcom/android/launcher3/Workspace;->E0(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;Lcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Ln1/d;Lcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 125
    .line 126
    .line 127
    return v2
.end method

.method private synthetic z()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/hybridhotseat/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/hybridhotseat/a;-><init>(Lcom/android/launcher3/C2;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v1, Lq1/l;

    .line 15
    .line 16
    invoke-direct {v1}, Lq1/l;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Lcom/android/launcher3/hybridhotseat/a;->l(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/hybridhotseat/a;->o()V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public A(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    sub-int/2addr v1, v2

    .line 16
    :goto_0
    if-ltz v1, :cond_2

    .line 17
    .line 18
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 25
    .line 26
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v0, v4}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    iget-object v4, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 37
    .line 38
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 39
    .line 40
    invoke-virtual {v4, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 v1, -0x1

    .line 51
    :goto_1
    if-gez v1, :cond_3

    .line 52
    .line 53
    :goto_2
    return-void

    .line 54
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->q()Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const/4 v3, 0x0

    .line 63
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_4

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 74
    .line 75
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 80
    .line 81
    iget v4, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 82
    .line 83
    shl-int v4, v2, v4

    .line 84
    .line 85
    or-int/2addr v3, v4

    .line 86
    goto :goto_3

    .line 87
    :cond_4
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v3}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;->setCardinality(I)Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;

    .line 92
    .line 93
    .line 94
    iget p1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 95
    .line 96
    const/16 v2, -0x67

    .line 97
    .line 98
    if-ne p1, v2, :cond_5

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;->setIndex(I)Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;

    .line 101
    .line 102
    .line 103
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-interface {p0, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-interface {p0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withRank(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1, v0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setPredictedHotseatContainer(Lcom/android/launcher3/logger/LauncherAtom$PredictedHotseatContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 134
    .line 135
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->c0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 140
    .line 141
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public B(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of p2, p1, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    check-cast p1, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/b;->I(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public E(Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->removeIf(Ljava/util/function/Predicate;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/b;->p(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/hybridhotseat/b;->n:Ljava/util/List;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/hybridhotseat/b;->K(Ljava/util/List;Lcom/android/launcher3/n0$a;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b;->n:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b;->n:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Lcom/android/launcher3/uioverrides/PredictedAppIcon$e;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Lcom/android/launcher3/CellLayout;->c(Lc1/d;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget p1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 40
    .line 41
    or-int/lit8 p1, p1, 0x2

    .line 42
    .line 43
    iput p1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public G(Lcom/android/launcher3/model/data/y;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    iget v1, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Hotseat;->U0(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/b;->i:Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    iget v3, p1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Lcom/android/launcher3/Hotseat;->V0(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance v2, Lcom/android/launcher3/model/data/I;

    .line 27
    .line 28
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 29
    .line 30
    invoke-direct {v2, p1}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget v4, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 40
    .line 41
    iget v5, v2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 42
    .line 43
    iget v6, v2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 44
    .line 45
    const/16 v3, -0x65

    .line 46
    .line 47
    invoke-virtual/range {v1 .. v6}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 48
    .line 49
    .line 50
    sget-object p1, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    new-array v1, v1, [F

    .line 54
    .line 55
    fill-array-data v1, :array_0

    .line 56
    .line 57
    .line 58
    invoke-static {v0, p1, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v2}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->u1(Lcom/android/launcher3/model/data/I;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->a1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 83
    .line 84
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    nop

    .line 89
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public L(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 4
    .line 5
    or-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 9
    .line 10
    and-int/lit8 v0, v0, -0x2

    .line 11
    .line 12
    :goto_0
    iput v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->o()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public M(Lz1/y0$c;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p1, p1, Lz1/y0$c;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-static {p1}, Lq1/t;->d(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->o()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public N()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    new-instance v2, Lq1/i;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Lq1/i;-><init>(Lcom/android/launcher3/hybridhotseat/b;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/hybridhotseat/b;->L(Z)V

    .line 9
    .line 10
    .line 11
    const-string p0, "HotseatPredictionController"

    .line 12
    .line 13
    const-string v0, "FLAG_UPDATE_PAUSED should not be set to true (see b/339700174)"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public bridge synthetic a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/hybridhotseat/b;->s(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/b;->h:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

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
    const-string v1, "HotseatPredictionController"

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
    const-string v1, "\tFlags: "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 35
    .line 36
    invoke-static {v1}, Lcom/android/launcher3/hybridhotseat/b;->t(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v1, "\tmHotSeatItemsCount: "

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget v1, p0, Lcom/android/launcher3/hybridhotseat/b;->g:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\tmPredictedItems: "

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_0

    .line 115
    .line 116
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 121
    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v2, "\t\t"

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_0
    return-void
.end method

.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->C()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lf1/a;->y:Lf1/a$a;

    .line 5
    .line 6
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const-string p1, "HotseatPredictionController"

    .line 13
    .line 14
    const-string p2, "onChildViewRemoved"

    .line 15
    .line 16
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/b;->D()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iget p1, p1, Lcom/android/launcher3/h0;->a2:I

    .line 2
    .line 3
    iput p1, p0, Lcom/android/launcher3/hybridhotseat/b;->g:I

    .line 4
    .line 5
    return-void
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public s(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            ")",
            "Lcom/android/launcher3/popup/P<",
            "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
            ">;"
        }
    .end annotation

    .line 1
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 2
    .line 3
    const/16 v1, -0x67

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    return-object v2

    .line 9
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, LD1/t;->k(Landroid/content/Context;)LD1/t;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/util/N2;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    return-object v2

    .line 36
    :cond_1
    new-instance v3, Lcom/android/launcher3/hybridhotseat/b$c;

    .line 37
    .line 38
    const/4 v8, 0x0

    .line 39
    move-object v4, p0

    .line 40
    move-object v5, p1

    .line 41
    move-object v6, p2

    .line 42
    move-object v7, p3

    .line 43
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/hybridhotseat/b$c;-><init>(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lq1/m;)V

    .line 44
    .line 45
    .line 46
    return-object v3
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public v()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, -0x3

    .line 4
    .line 5
    iput v0, p0, Lcom/android/launcher3/hybridhotseat/b;->m:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p0, v0}, Lcom/android/launcher3/hybridhotseat/b;->p(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
