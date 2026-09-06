.class public final Lcom/android/quickstep/views/BlurUtils;
.super Ljava/lang/Object;
.source "BlurUtils.kt"


# instance fields
.field private final recentsView:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "recentsView"

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
    iput-object p1, p0, Lcom/android/quickstep/views/BlurUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic setDrawBelowRecents$default(Lcom/android/quickstep/views/BlurUtils;Z[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/BlurUtils;->setDrawBelowRecents(Z[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final setDrawBelowRecents(Z[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    array-length v1, p2

    .line 5
    move v2, v0

    .line 6
    :goto_0
    if-ge v2, v1, :cond_0

    .line 7
    .line 8
    aget-object v3, p2, v2

    .line 9
    .line 10
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3, p1}, Lcom/android/quickstep/util/TaskViewSimulator;->setDrawsBelowRecents(Z)V

    .line 15
    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->J()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_7

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/views/BlurUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getDepthController()LP1/h;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p0, :cond_7

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz p1, :cond_6

    .line 36
    .line 37
    if-nez p2, :cond_1

    .line 38
    .line 39
    goto :goto_3

    .line 40
    :cond_1
    array-length p1, p2

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    move-object p1, v1

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    aget-object p1, p2, v0

    .line 46
    .line 47
    invoke-static {p2}, Li4/g;->L([Ljava/lang/Object;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTarget()Landroid/view/RemoteAnimationTarget;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v2, v2, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/view/SurfaceControl;->getLayerId()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    const/4 v3, 0x1

    .line 73
    if-gt v3, v0, :cond_5

    .line 74
    .line 75
    :goto_1
    aget-object v4, p2, v3

    .line 76
    .line 77
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v5}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTarget()Landroid/view/RemoteAnimationTarget;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    iget-object v5, v5, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 90
    .line 91
    invoke-virtual {v5}, Landroid/view/SurfaceControl;->getLayerId()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-ge v2, v5, :cond_4

    .line 96
    .line 97
    move-object p1, v4

    .line 98
    move v2, v5

    .line 99
    :cond_4
    if-eq v3, v0, :cond_5

    .line 100
    .line 101
    add-int/lit8 v3, v3, 0x1

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_5
    :goto_2
    if-eqz p1, :cond_6

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    if-eqz p1, :cond_6

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTarget()Landroid/view/RemoteAnimationTarget;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    iget-object v1, p1, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 125
    .line 126
    :cond_6
    :goto_3
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBaseSurfaceOverride(Landroid/view/SurfaceControl;)V

    .line 127
    .line 128
    .line 129
    :cond_7
    return-void
.end method

.method public final setDrawLiveTileBelowRecents(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/BlurUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/views/BlurUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRecentsAnimationController()Lcom/android/quickstep/RecentsAnimationController;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/views/BlurUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/views/BlurUtils;->setDrawBelowRecents(Z[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
