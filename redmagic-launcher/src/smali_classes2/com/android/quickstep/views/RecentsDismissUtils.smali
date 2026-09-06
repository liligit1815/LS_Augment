.class public final Lcom/android/quickstep/views/RecentsDismissUtils;
.super Ljava/lang/Object;
.source "RecentsDismissUtils.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/RecentsDismissUtils$Companion;
    }
.end annotation


# static fields
.field private static final ADDITIONAL_DISMISS_DAMPING_RATIO:F = 0.15f

.field private static final Companion:Lcom/android/quickstep/views/RecentsDismissUtils$Companion;

.field private static final RECENTS_SCALE_SPRING_MULTIPLIER:F = 1000.0f


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
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/RecentsDismissUtils$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/RecentsDismissUtils$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/RecentsDismissUtils;->Companion:Lcom/android/quickstep/views/RecentsDismissUtils$Companion;

    .line 8
    .line 9
    return-void
.end method

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
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsDismissUtils;->createNeighboringTaskViewSpringAnimation$lambda$14$lambda$13(ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final addNeighborSettlingSpringAnimations(Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/j;Ljava/util/List;FZF)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            "Landroidx/dynamicanimation/animation/j;",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/views/TaskView;",
            ">;FZF)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    new-instance v1, Landroidx/dynamicanimation/animation/h;

    .line 4
    .line 5
    invoke-direct {v1}, Landroidx/dynamicanimation/animation/h;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/j;-><init>(Landroidx/dynamicanimation/animation/h;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-static {p0, v2, v3, v1}, Lcom/android/quickstep/views/RecentsDismissUtils;->createExpressiveDismissSpringForce$default(Lcom/android/quickstep/views/RecentsDismissUtils;FILjava/lang/Object;)Landroidx/dynamicanimation/animation/k;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-direct {p0, p1, v3}, Lcom/android/quickstep/views/RecentsDismissUtils;->getTasksOffsetPairAdjacentToDraggedTask(Lcom/android/quickstep/views/TaskView;Z)LC4/e;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Lcom/android/quickstep/views/w;

    .line 27
    .line 28
    invoke-direct {v2, p3}, Lcom/android/quickstep/views/w;-><init>(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, LC4/h;->h(LC4/e;Lu4/l;)LC4/e;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, LC4/e;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    move-object v2, v0

    .line 40
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    const-string v4, "element"

    .line 45
    .line 46
    const v5, 0x3e19999a    # 0.15f

    .line 47
    .line 48
    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Lh4/l;

    .line 56
    .line 57
    invoke-virtual {v3}, Lh4/l;->a()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    check-cast v6, Lcom/android/quickstep/views/TaskView;

    .line 62
    .line 63
    invoke-virtual {v3}, Lh4/l;->b()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Ljava/lang/Number;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    int-to-float v3, v3

    .line 74
    mul-float/2addr v3, v5

    .line 75
    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p0, v6, v3, v2, p5}, Lcom/android/quickstep/views/RecentsDismissUtils;->createNeighboringTaskViewSpringAnimation(Lcom/android/quickstep/views/TaskView;FLandroidx/dynamicanimation/animation/j;Z)Landroidx/dynamicanimation/animation/j;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const/4 v1, 0x0

    .line 84
    invoke-direct {p0, p1, v1}, Lcom/android/quickstep/views/RecentsDismissUtils;->getTasksOffsetPairAdjacentToDraggedTask(Lcom/android/quickstep/views/TaskView;Z)LC4/e;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    new-instance v2, Lcom/android/quickstep/views/F;

    .line 89
    .line 90
    invoke-direct {v2, p3}, Lcom/android/quickstep/views/F;-><init>(Ljava/util/List;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1, v2}, LC4/h;->h(LC4/e;Lu4/l;)LC4/e;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-interface {p3}, LC4/e;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    move-object v1, v0

    .line 102
    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_1

    .line 107
    .line 108
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Lh4/l;

    .line 113
    .line 114
    invoke-virtual {v2}, Lh4/l;->a()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Lcom/android/quickstep/views/TaskView;

    .line 119
    .line 120
    invoke-virtual {v2}, Lh4/l;->b()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    check-cast v2, Ljava/lang/Number;

    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    int-to-float v2, v2

    .line 131
    mul-float/2addr v2, v5

    .line 132
    invoke-static {v1, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-direct {p0, v3, v2, v1, p5}, Lcom/android/quickstep/views/RecentsDismissUtils;->createNeighboringTaskViewSpringAnimation(Lcom/android/quickstep/views/TaskView;FLandroidx/dynamicanimation/animation/j;Z)Landroidx/dynamicanimation/animation/j;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    goto :goto_1

    .line 140
    :cond_1
    iget-object p3, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 141
    .line 142
    invoke-virtual {p3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 143
    .line 144
    .line 145
    move-result-object p3

    .line 146
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getSecondaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 147
    .line 148
    .line 149
    move-result-object p5

    .line 150
    invoke-virtual {p5, p1}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    const-string p5, "get(...)"

    .line 155
    .line 156
    invoke-static {p1, p5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    check-cast p1, Ljava/lang/Number;

    .line 160
    .line 161
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    iget-object p5, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 166
    .line 167
    invoke-virtual {p5}, Lcom/android/quickstep/views/RecentsView;->isRtl()Z

    .line 168
    .line 169
    .line 170
    move-result p5

    .line 171
    invoke-interface {p3, p1, p5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    move p3, p4

    .line 179
    move p4, p1

    .line 180
    move-object p1, p2

    .line 181
    move p2, p3

    .line 182
    move p5, p6

    .line 183
    move-object p3, v0

    .line 184
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/views/RecentsDismissUtils;->addThresholdSpringAnimationTrigger(Landroidx/dynamicanimation/animation/j;FLandroidx/dynamicanimation/animation/j;ZF)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method static synthetic addNeighborSettlingSpringAnimations$default(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/j;Ljava/util/List;FZFILjava/lang/Object;)V
    .locals 7

    .line 1
    and-int/lit8 p7, p7, 0x4

    .line 2
    .line 3
    if-eqz p7, :cond_0

    .line 4
    .line 5
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    :cond_0
    move-object v0, p0

    .line 10
    move-object v1, p1

    .line 11
    move-object v2, p2

    .line 12
    move-object v3, p3

    .line 13
    move v4, p4

    .line 14
    move v5, p5

    .line 15
    move v6, p6

    .line 16
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/views/RecentsDismissUtils;->addNeighborSettlingSpringAnimations(Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/j;Ljava/util/List;FZF)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static final addNeighborSettlingSpringAnimations$lambda$3(Ljava/util/List;Lh4/l;)Z
    .locals 1

    .line 1
    const-string v0, "<destruct>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lh4/l;->a()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    xor-int/lit8 p0, p0, 0x1

    .line 17
    .line 18
    return p0
.end method

.method private static final addNeighborSettlingSpringAnimations$lambda$5(Ljava/util/List;Lh4/l;)Z
    .locals 1

    .line 1
    const-string v0, "<destruct>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lh4/l;->a()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    xor-int/lit8 p0, p0, 0x1

    .line 17
    .line 18
    return p0
.end method

.method private final addThresholdSpringAnimationTrigger(Landroidx/dynamicanimation/animation/j;FLandroidx/dynamicanimation/animation/j;ZF)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/views/K;

    .line 2
    .line 3
    invoke-direct {v0, p3, p0}, Lcom/android/quickstep/views/K;-><init>(Landroidx/dynamicanimation/animation/j;Lcom/android/quickstep/views/RecentsDismissUtils;)V

    .line 4
    .line 5
    .line 6
    if-eqz p4, :cond_0

    .line 7
    .line 8
    new-instance p0, Lkotlin/jvm/internal/A;

    .line 9
    .line 10
    invoke-direct {p0}, Lkotlin/jvm/internal/A;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance p3, Lkotlin/jvm/internal/z;

    .line 14
    .line 15
    invoke-direct {p3}, Lkotlin/jvm/internal/z;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance p4, Lcom/android/quickstep/views/L;

    .line 19
    .line 20
    invoke-direct {p4, p3, p0, p2, v0}, Lcom/android/quickstep/views/L;-><init>(Lkotlin/jvm/internal/z;Lkotlin/jvm/internal/A;FLu4/l;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p4}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {v0, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private static final addThresholdSpringAnimationTrigger$lambda$7(Landroidx/dynamicanimation/animation/j;Lcom/android/quickstep/views/RecentsDismissUtils;F)Lh4/t;
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroidx/dynamicanimation/animation/j;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p1, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->playDismissSettlingHaptic(F)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 15
    .line 16
    return-object p0
.end method

.method private static final addThresholdSpringAnimationTrigger$lambda$8(Lkotlin/jvm/internal/z;Lkotlin/jvm/internal/A;FLu4/l;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 1

    .line 1
    iget-boolean p4, p0, Lkotlin/jvm/internal/z;->g:Z

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget p4, p1, Lkotlin/jvm/internal/A;->g:F

    .line 7
    .line 8
    cmpg-float v0, p4, p2

    .line 9
    .line 10
    if-gez v0, :cond_1

    .line 11
    .line 12
    cmpl-float v0, p5, p2

    .line 13
    .line 14
    if-gez v0, :cond_2

    .line 15
    .line 16
    :cond_1
    cmpl-float p4, p4, p2

    .line 17
    .line 18
    if-lez p4, :cond_3

    .line 19
    .line 20
    cmpg-float p2, p5, p2

    .line 21
    .line 22
    if-gtz p2, :cond_3

    .line 23
    .line 24
    :cond_2
    const/4 p2, 0x1

    .line 25
    iput-boolean p2, p0, Lkotlin/jvm/internal/z;->g:Z

    .line 26
    .line 27
    :cond_3
    iput p5, p1, Lkotlin/jvm/internal/A;->g:F

    .line 28
    .line 29
    iget-boolean p0, p0, Lkotlin/jvm/internal/z;->g:Z

    .line 30
    .line 31
    if-eqz p0, :cond_4

    .line 32
    .line 33
    invoke-static {p6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p3, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :cond_4
    :goto_0
    return-void
.end method

.method private static final animateRecentsScale$lambda$16(Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    const/high16 p3, 0x447a0000    # 1000.0f

    .line 6
    .line 7
    div-float/2addr p2, p3

    .line 8
    invoke-virtual {p1, p0, p2}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Landroidx/dynamicanimation/animation/g;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->createTaskDismissSettlingSpringAnimation$lambda$1$lambda$0(Landroidx/dynamicanimation/animation/g;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final buildDismissReflowSpringAnimationChain(Ljava/lang/Iterable;FLandroidx/dynamicanimation/animation/j;)Landroidx/dynamicanimation/animation/j;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/android/quickstep/views/TaskView;",
            ">;F",
            "Landroidx/dynamicanimation/animation/j;",
            ")",
            "Landroidx/dynamicanimation/animation/j;"
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
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

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
    move-object v2, v1

    .line 21
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 22
    .line 23
    invoke-static {p2}, Lx4/a;->a(F)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-direct {p0, v2, v3}, Lcom/android/quickstep/views/RecentsDismissUtils;->willTaskBeVisibleAfterDismiss(Lcom/android/quickstep/views/TaskView;I)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 52
    .line 53
    new-instance v1, Landroidx/dynamicanimation/animation/j;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPrimaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v2}, Landroidx/dynamicanimation/animation/g;->createFloatPropertyCompat(Landroid/util/FloatProperty;)Landroidx/dynamicanimation/animation/g;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-direct {v1, v0, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->createExpressiveGridReflowSpringForce(F)Landroidx/dynamicanimation/animation/k;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getEnableDrawingLiveTile()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_2

    .line 87
    .line 88
    new-instance v2, Lcom/android/quickstep/views/z;

    .line 89
    .line 90
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/views/z;-><init>(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 94
    .line 95
    .line 96
    :cond_2
    new-instance v0, Lcom/android/quickstep/views/A;

    .line 97
    .line 98
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/A;-><init>(Landroidx/dynamicanimation/animation/j;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p3, v0}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 102
    .line 103
    .line 104
    move-object p3, v1

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    return-object p3
.end method

.method private static final buildDismissReflowSpringAnimationChain$lambda$27$lambda$25(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    new-instance p3, Lcom/android/quickstep/views/G;

    .line 4
    .line 5
    invoke-direct {p3, p1}, Lcom/android/quickstep/views/G;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p3}, Lcom/android/quickstep/views/RecentsView;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->redrawLiveTile()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static final buildDismissReflowSpringAnimationChain$lambda$27$lambda$25$lambda$24(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/android/quickstep/util/TaskViewSimulator;->taskPrimaryTranslation:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPrimaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Number;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    iput p0, p1, Lcom/android/launcher3/anim/d;->d:F

    .line 22
    .line 23
    return-void
.end method

.method private static final buildDismissReflowSpringAnimationChain$lambda$27$lambda$26(Landroidx/dynamicanimation/animation/j;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/views/RecentsDismissUtils;Lh4/l;)Lh4/l;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->getTasksOffsetPairAdjacentToDraggedTask$lambda$10(Lcom/android/quickstep/views/RecentsDismissUtils;Lh4/l;)Lh4/l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final createExpressiveDismissSpringForce(F)Landroidx/dynamicanimation/animation/k;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Landroidx/dynamicanimation/animation/k;

    .line 10
    .line 11
    invoke-direct {v0}, Landroidx/dynamicanimation/animation/k;-><init>()V

    .line 12
    .line 13
    .line 14
    const v1, 0x7f070308

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, v1}, Lx2/h;->getFloat(I)F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-float/2addr v1, p1

    .line 22
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const v0, 0x7f070309

    .line 27
    .line 28
    .line 29
    invoke-interface {p0, v0}, Lx2/h;->getFloat(I)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {p1, p0}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "setStiffness(...)"

    .line 38
    .line 39
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method static synthetic createExpressiveDismissSpringForce$default(Lcom/android/quickstep/views/RecentsDismissUtils;FILjava/lang/Object;)Landroidx/dynamicanimation/animation/k;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->createExpressiveDismissSpringForce(F)Landroidx/dynamicanimation/animation/k;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private final createExpressiveGridReflowSpringForce(F)Landroidx/dynamicanimation/animation/k;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Landroidx/dynamicanimation/animation/k;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 12
    .line 13
    .line 14
    const p1, 0x7f070306

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, p1}, Lx2/h;->getFloat(I)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const v0, 0x7f070307

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, v0}, Lx2/h;->getFloat(I)F

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p1, p0}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "setStiffness(...)"

    .line 37
    .line 38
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method static synthetic createExpressiveGridReflowSpringForce$default(Lcom/android/quickstep/views/RecentsDismissUtils;FILjava/lang/Object;)Landroidx/dynamicanimation/animation/k;
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->createExpressiveGridReflowSpringForce(F)Landroidx/dynamicanimation/animation/k;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private final createNeighboringTaskViewSpringAnimation(Lcom/android/quickstep/views/TaskView;FLandroidx/dynamicanimation/animation/j;Z)Landroidx/dynamicanimation/animation/j;
    .locals 3

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getSecondaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getPrimaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    new-instance v1, Landroidx/dynamicanimation/animation/j;

    .line 13
    .line 14
    invoke-static {v0}, Landroidx/dynamicanimation/animation/g;->createFloatPropertyCompat(Landroid/util/FloatProperty;)Landroidx/dynamicanimation/animation/g;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v1, p1, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->createExpressiveDismissSpringForce(F)Landroidx/dynamicanimation/animation/k;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {v1, p2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getEnableDrawingLiveTile()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    new-instance v1, Lcom/android/quickstep/views/M;

    .line 44
    .line 45
    invoke-direct {v1, p0, p4, v0, p1}, Lcom/android/quickstep/views/M;-><init>(Lcom/android/quickstep/views/RecentsDismissUtils;ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, v1}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 49
    .line 50
    .line 51
    :cond_1
    new-instance p0, Lcom/android/quickstep/views/N;

    .line 52
    .line 53
    invoke-direct {p0, p2}, Lcom/android/quickstep/views/N;-><init>(Landroidx/dynamicanimation/animation/j;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p3, p0}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-object p2
.end method

.method private static final createNeighboringTaskViewSpringAnimation$lambda$14(Lcom/android/quickstep/views/RecentsDismissUtils;ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    iget-object p4, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    new-instance p5, Lcom/android/quickstep/views/I;

    .line 4
    .line 5
    invoke-direct {p5, p1, p2, p3}, Lcom/android/quickstep/views/I;-><init>(ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p4, p5}, Lcom/android/quickstep/views/RecentsView;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->redrawLiveTile()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private static final createNeighboringTaskViewSpringAnimation$lambda$14$lambda$13(ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskSecondaryTranslation:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/TaskViewSimulator;->taskPrimaryTranslation:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1, p2}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Number;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 27
    .line 28
    return-void
.end method

.method private static final createNeighboringTaskViewSpringAnimation$lambda$15(Landroidx/dynamicanimation/animation/j;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final createTaskDismissSettlingSpringAnimation$lambda$1(ZILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p6}, Ljava/lang/Math;->abs(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    int-to-float p1, p1

    .line 12
    cmpl-float p0, p0, p1

    .line 13
    .line 14
    if-ltz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p5}, Landroidx/dynamicanimation/animation/e;->c()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->isRunningTask()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    iget-object p0, p3, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getEnableDrawingLiveTile()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    iget-object p0, p3, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 35
    .line 36
    new-instance p1, Lcom/android/quickstep/views/J;

    .line 37
    .line 38
    invoke-direct {p1, p4, p2}, Lcom/android/quickstep/views/J;-><init>(Landroidx/dynamicanimation/animation/g;Lcom/android/quickstep/views/TaskView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p3, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->redrawLiveTile()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method private static final createTaskDismissSettlingSpringAnimation$lambda$1$lambda$0(Landroidx/dynamicanimation/animation/g;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Lcom/android/quickstep/util/TaskViewSimulator;->taskSecondaryTranslation:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/g;->getValue(Ljava/lang/Object;)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    iput p0, p2, Lcom/android/launcher3/anim/d;->d:F

    .line 12
    .line 13
    return-void
.end method

.method private static final createTaskDismissSettlingSpringAnimation$lambda$2(ZLcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    iget-object p0, p1, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p1, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    const/4 p4, 0x1

    .line 22
    invoke-virtual {p0, p2, p1, p4}, Lcom/android/quickstep/views/RecentsView;->dismissTaskView(Lcom/android/quickstep/views/TaskView;ZZ)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p3}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    :goto_0
    invoke-direct {p1, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->getDismissedTaskGapForReflow(Lcom/android/quickstep/views/TaskView;)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-direct {p1, p2, p0, p3}, Lcom/android/quickstep/views/RecentsDismissUtils;->runTaskGridReflowSpringAnimation(Lcom/android/quickstep/views/TaskView;FLu4/a;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    iget-object p0, p1, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->onDismissAnimationEnds()V

    .line 40
    .line 41
    .line 42
    invoke-interface {p3}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain$lambda$27$lambda$25(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Landroidx/dynamicanimation/animation/j;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain$lambda$27$lambda$26(Landroidx/dynamicanimation/animation/j;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/views/RecentsDismissUtils;ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, Lcom/android/quickstep/views/RecentsDismissUtils;->createNeighboringTaskViewSpringAnimation$lambda$14(Lcom/android/quickstep/views/RecentsDismissUtils;ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ljava/util/List;Lh4/l;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->addNeighborSettlingSpringAnimations$lambda$5(Ljava/util/List;Lh4/l;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final getDismissedTaskGapForReflow(Lcom/android/quickstep/views/TaskView;)F
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    invoke-interface {v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getMeasuredSize(Landroid/view/View;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/2addr v1, v0

    .line 26
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getChildStart(Landroid/view/View;)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 37
    .line 38
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {p1, v3}, Lcom/android/quickstep/views/TaskView;->getOffsetAdjustment(Z)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    add-int/2addr v2, v3

    .line 47
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-interface {v3, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getMeasuredSize(Landroid/view/View;)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    int-to-float v3, v3

    .line 58
    iget-object v4, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->showAsFullscreen()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {p1, v4}, Lcom/android/quickstep/views/TaskView;->getSizeAdjustment(Z)F

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    mul-float/2addr v3, v4

    .line 69
    int-to-float v4, v2

    .line 70
    add-float/2addr v4, v3

    .line 71
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 72
    .line 73
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->isRtl()Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    const/4 v5, 0x0

    .line 78
    const/4 v6, 0x1

    .line 79
    if-eqz v3, :cond_0

    .line 80
    .line 81
    int-to-float v0, v1

    .line 82
    cmpl-float v0, v4, v0

    .line 83
    .line 84
    if-lez v0, :cond_1

    .line 85
    .line 86
    :goto_0
    move v5, v6

    .line 87
    goto :goto_1

    .line 88
    :cond_0
    if-ge v2, v0, :cond_1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    if-eqz v5, :cond_2

    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsViewUtils;->getLargeTileCount()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-ne v0, v6, :cond_2

    .line 108
    .line 109
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-interface {p1, p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsViewUtils;->getFirstNonDesktopTaskView()Lcom/android/quickstep/views/TaskView;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getScrollForPage(I)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    sub-int/2addr p1, p0

    .line 134
    int-to-float p0, p1

    .line 135
    return p0

    .line 136
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 137
    .line 138
    iget-object v1, v0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsViewUtils;->getLastTaskView()Lcom/android/quickstep/views/TaskView;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 149
    .line 150
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    invoke-static {v1, v0}, LA4/d;->e(II)I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    const/high16 v3, -0x40800000    # -1.0f

    .line 163
    .line 164
    const/high16 v4, 0x3f800000    # 1.0f

    .line 165
    .line 166
    if-eqz v2, :cond_4

    .line 167
    .line 168
    :cond_3
    move v0, v4

    .line 169
    goto :goto_3

    .line 170
    :cond_4
    if-ne v1, v0, :cond_5

    .line 171
    .line 172
    :goto_2
    move v0, v3

    .line 173
    goto :goto_3

    .line 174
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 175
    .line 176
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-ge v0, v1, :cond_3

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :goto_3
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 184
    .line 185
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->isRtl()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-eqz v1, :cond_6

    .line 190
    .line 191
    move v3, v4

    .line 192
    :cond_6
    mul-float/2addr v0, v3

    .line 193
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-interface {v1, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimarySize(Landroid/view/View;)I

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 204
    .line 205
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageSpacing()I

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    add-int/2addr p1, p0

    .line 210
    int-to-float p0, p1

    .line 211
    mul-float/2addr p0, v0

    .line 212
    return p0
.end method

.method private final getTasksOffsetPairAdjacentToDraggedTask(Lcom/android/quickstep/views/TaskView;Z)LC4/e;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            "Z)",
            "LC4/e<",
            "Lh4/l<",
            "Lcom/android/quickstep/views/TaskView;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/util/TaskGridNavHelper;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowIdArray()Lcom/android/launcher3/util/x0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowIdArray()Lcom/android/launcher3/util/x0;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v4, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 29
    .line 30
    iget-object v4, v4, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 31
    .line 32
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsViewUtils;->getLargeTaskViewIds()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-direct {v0, v2, v3, v4, v1}, Lcom/android/quickstep/util/TaskGridNavHelper;-><init>(Lcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;Ljava/util/List;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/util/TaskGridNavHelper;->gridTaskViewIdOffsetPairInTabOrderSequence(IZ)LC4/e;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Lcom/android/quickstep/views/B;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Lcom/android/quickstep/views/B;-><init>(Lcom/android/quickstep/views/RecentsDismissUtils;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, p2}, LC4/h;->m(LC4/e;Lu4/l;)LC4/e;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Li4/m;->E0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    const/16 v0, 0xa

    .line 74
    .line 75
    if-eqz p2, :cond_3

    .line 76
    .line 77
    invoke-static {p0, p1}, Li4/m;->z0(Ljava/lang/Iterable;I)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0}, Li4/m;->t0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    new-instance p1, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-static {p0, v0}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 92
    .line 93
    .line 94
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-eqz p2, :cond_2

    .line 103
    .line 104
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    add-int/lit8 v0, v1, 0x1

    .line 109
    .line 110
    if-gez v1, :cond_1

    .line 111
    .line 112
    invoke-static {}, Li4/m;->r()V

    .line 113
    .line 114
    .line 115
    :cond_1
    check-cast p2, Lcom/android/quickstep/views/TaskView;

    .line 116
    .line 117
    new-instance v1, Lh4/l;

    .line 118
    .line 119
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-direct {v1, p2, v2}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    invoke-interface {p1, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move v1, v0

    .line 130
    goto :goto_0

    .line 131
    :cond_2
    invoke-static {p1}, Li4/m;->P(Ljava/lang/Iterable;)LC4/e;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0

    .line 136
    :cond_3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    sub-int/2addr p2, p1

    .line 141
    add-int/lit8 p2, p2, -0x1

    .line 142
    .line 143
    invoke-static {p0, p2}, Li4/m;->A0(Ljava/util/List;I)Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    new-instance p1, Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-static {p0, v0}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 154
    .line 155
    .line 156
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    if-eqz p2, :cond_5

    .line 165
    .line 166
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    add-int/lit8 v0, v1, 0x1

    .line 171
    .line 172
    if-gez v1, :cond_4

    .line 173
    .line 174
    invoke-static {}, Li4/m;->r()V

    .line 175
    .line 176
    .line 177
    :cond_4
    check-cast p2, Lcom/android/quickstep/views/TaskView;

    .line 178
    .line 179
    new-instance v1, Lh4/l;

    .line 180
    .line 181
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-direct {v1, p2, v2}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    invoke-interface {p1, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move v1, v0

    .line 192
    goto :goto_1

    .line 193
    :cond_5
    invoke-static {p1}, Li4/m;->P(Ljava/lang/Iterable;)LC4/e;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    return-object p0
.end method

.method private static final getTasksOffsetPairAdjacentToDraggedTask$lambda$10(Lcom/android/quickstep/views/RecentsDismissUtils;Lh4/l;)Lh4/l;
    .locals 1

    .line 1
    const-string v0, "<destruct>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lh4/l;->a()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Number;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Lh4/l;->b()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Number;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewFromTaskViewId(I)Lcom/android/quickstep/views/TaskView;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    new-instance v0, Lh4/l;

    .line 35
    .line 36
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {v0, p0, p1}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method private final getTasksToReflow(Ljava/util/List;Lcom/android/quickstep/views/TaskView;Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/views/TaskView;",
            ">;",
            "Lcom/android/quickstep/views/TaskView;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p2, -0x1

    .line 6
    if-ne p0, p2, :cond_0

    .line 7
    .line 8
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    if-eqz p3, :cond_1

    .line 14
    .line 15
    invoke-static {p1, p0}, Li4/m;->z0(Ljava/lang/Iterable;I)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Li4/m;->t0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    sub-int/2addr p2, p0

    .line 29
    add-int/lit8 p2, p2, -0x1

    .line 30
    .line 31
    invoke-static {p1, p2}, Li4/m;->A0(Ljava/util/List;I)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic h(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->runTaskGridReflowSpringAnimation$lambda$19(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i(Landroidx/dynamicanimation/animation/j;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsDismissUtils;->createNeighboringTaskViewSpringAnimation$lambda$15(Landroidx/dynamicanimation/animation/j;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain$lambda$27$lambda$25$lambda$24(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(ZILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/android/quickstep/views/RecentsDismissUtils;->createTaskDismissSettlingSpringAnimation$lambda$1(ZILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ljava/util/List;Lh4/l;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->addNeighborSettlingSpringAnimations$lambda$3(Ljava/util/List;Lh4/l;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic m(Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/RecentsDismissUtils;->runTaskGridReflowSpringAnimation$lambda$18(Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Landroidx/dynamicanimation/animation/j;Lcom/android/quickstep/views/RecentsDismissUtils;F)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->addThresholdSpringAnimationTrigger$lambda$7(Landroidx/dynamicanimation/animation/j;Lcom/android/quickstep/views/RecentsDismissUtils;F)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o(ZLcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/android/quickstep/views/RecentsDismissUtils;->createTaskDismissSettlingSpringAnimation$lambda$2(ZLcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lu4/a;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/RecentsDismissUtils;->runTaskGridReflowSpringAnimation$lambda$21$lambda$20(Lu4/a;Landroidx/dynamicanimation/animation/e;ZFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final playDismissSettlingHaptic(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryDimension(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/android/launcher3/util/s1;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    sget-object v1, Lw3/e;->p:Lw3/e;

    .line 30
    .line 31
    new-instance v2, Ly3/b$a;

    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    int-to-float v0, v0

    .line 38
    div-float/2addr p1, v0

    .line 39
    const/4 v0, 0x0

    .line 40
    const/high16 v3, 0x3f800000    # 1.0f

    .line 41
    .line 42
    invoke-static {p1, v0, v3}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    new-instance v0, Landroid/os/VibrationAttributes$Builder;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/os/VibrationAttributes$Builder;-><init>()V

    .line 49
    .line 50
    .line 51
    const/16 v3, 0x12

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Landroid/os/VibrationAttributes$Builder;->setUsage(I)Landroid/os/VibrationAttributes$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/16 v3, 0x8

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Landroid/os/VibrationAttributes$Builder;->setFlags(I)Landroid/os/VibrationAttributes$Builder;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Landroid/os/VibrationAttributes$Builder;->build()Landroid/os/VibrationAttributes;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v3, "build(...)"

    .line 68
    .line 69
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-direct {v2, p1, v0}, Ly3/b$a;-><init>(FLandroid/os/VibrationAttributes;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/util/s1;->d(Lw3/e;Ly3/b;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public static synthetic q(Lkotlin/jvm/internal/z;Lkotlin/jvm/internal/A;FLu4/l;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, Lcom/android/quickstep/views/RecentsDismissUtils;->addThresholdSpringAnimationTrigger$lambda$8(Lkotlin/jvm/internal/z;Lkotlin/jvm/internal/A;FLu4/l;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/e;FF)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsDismissUtils;->animateRecentsScale$lambda$16(Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/e;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final runTaskGridReflowSpringAnimation(Lcom/android/quickstep/views/TaskView;FLu4/a;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            "F",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    new-instance v1, Landroidx/dynamicanimation/animation/h;

    .line 4
    .line 5
    invoke-direct {v1}, Landroidx/dynamicanimation/animation/h;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/j;-><init>(Landroidx/dynamicanimation/animation/h;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p2}, Lcom/android/quickstep/views/RecentsDismissUtils;->createExpressiveGridReflowSpringForce(F)Landroidx/dynamicanimation/animation/k;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isRtl()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    const/4 v2, 0x1

    .line 27
    const/4 v3, 0x0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    cmpg-float v0, p2, v3

    .line 31
    .line 32
    if-gez v0, :cond_1

    .line 33
    .line 34
    :goto_0
    move v1, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    cmpl-float v0, p2, v3

    .line 37
    .line 38
    if-lez v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsViewUtils;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Li4/m;->E0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-direct {p0, v0, p1, v1}, Lcom/android/quickstep/views/RecentsDismissUtils;->getTasksToReflow(Ljava/util/List;Lcom/android/quickstep/views/TaskView;Z)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0, v0, p2, v4}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain(Ljava/lang/Iterable;FLandroidx/dynamicanimation/animation/j;)Landroidx/dynamicanimation/animation/j;

    .line 69
    .line 70
    .line 71
    :goto_2
    move-object v5, v0

    .line 72
    goto/16 :goto_3

    .line 73
    .line 74
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsViewUtils;->getLargeTaskViews()Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-direct {p0, v0, p1, v1}, Lcom/android/quickstep/views/RecentsDismissUtils;->getTasksToReflow(Ljava/util/List;Lcom/android/quickstep/views/TaskView;Z)Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    invoke-direct {p0, v0, p2, v4}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain(Ljava/lang/Iterable;FLandroidx/dynamicanimation/animation/j;)Landroidx/dynamicanimation/animation/j;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    if-nez v1, :cond_3

    .line 100
    .line 101
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowTaskViews()Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {v0, v1}, Li4/m;->r0(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowTaskViews()Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {v0, v1}, Li4/m;->r0(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 126
    .line 127
    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowTaskViews()Ljava/util/List;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-direct {p0, v1, p2, v2}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain(Ljava/lang/Iterable;FLandroidx/dynamicanimation/animation/j;)Landroidx/dynamicanimation/animation/j;

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowTaskViews()Ljava/util/List;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-direct {p0, v1, p2, v2}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain(Ljava/lang/Iterable;FLandroidx/dynamicanimation/animation/j;)Landroidx/dynamicanimation/animation/j;

    .line 145
    .line 146
    .line 147
    :cond_3
    sget-object v1, Lh4/t;->a:Lh4/t;

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 151
    .line 152
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->isOnGridBottomRow(Lcom/android/quickstep/views/TaskView;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_5

    .line 157
    .line 158
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 159
    .line 160
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 161
    .line 162
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowTaskViews()Ljava/util/List;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-direct {p0, v0, p1, v1}, Lcom/android/quickstep/views/RecentsDismissUtils;->getTasksToReflow(Ljava/util/List;Lcom/android/quickstep/views/TaskView;Z)Ljava/util/List;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    invoke-direct {p0, v0, p2, v4}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain(Ljava/lang/Iterable;FLandroidx/dynamicanimation/animation/j;)Landroidx/dynamicanimation/animation/j;

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mUtils:Lcom/android/quickstep/views/RecentsViewUtils;

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowTaskViews()Ljava/util/List;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-direct {p0, v0, p1, v1}, Lcom/android/quickstep/views/RecentsDismissUtils;->getTasksToReflow(Ljava/util/List;Lcom/android/quickstep/views/TaskView;Z)Ljava/util/List;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    invoke-direct {p0, v0, p2, v4}, Lcom/android/quickstep/views/RecentsDismissUtils;->buildDismissReflowSpringAnimationChain(Ljava/lang/Iterable;FLandroidx/dynamicanimation/animation/j;)Landroidx/dynamicanimation/animation/j;

    .line 193
    .line 194
    .line 195
    goto :goto_2

    .line 196
    :goto_3
    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-nez v0, :cond_6

    .line 201
    .line 202
    const/4 v7, 0x0

    .line 203
    const/4 v8, 0x0

    .line 204
    move-object v2, p0

    .line 205
    move-object v3, p1

    .line 206
    move v6, p2

    .line 207
    invoke-direct/range {v2 .. v8}, Lcom/android/quickstep/views/RecentsDismissUtils;->addNeighborSettlingSpringAnimations(Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/j;Ljava/util/List;FZF)V

    .line 208
    .line 209
    .line 210
    goto :goto_4

    .line 211
    :cond_6
    move-object v2, p0

    .line 212
    move-object v3, p1

    .line 213
    move v6, p2

    .line 214
    new-instance p0, Lcom/android/quickstep/views/C;

    .line 215
    .line 216
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/C;-><init>(Lcom/android/quickstep/views/RecentsDismissUtils;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v4, p0}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 220
    .line 221
    .line 222
    :goto_4
    new-instance p0, Lcom/android/quickstep/views/D;

    .line 223
    .line 224
    invoke-direct {p0, v2, v3, p3}, Lcom/android/quickstep/views/D;-><init>(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;)V

    .line 225
    .line 226
    .line 227
    new-instance p1, Lcom/android/quickstep/views/E;

    .line 228
    .line 229
    invoke-direct {p1, p0}, Lcom/android/quickstep/views/E;-><init>(Lu4/a;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v4, p1}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v4, v6}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method private static final runTaskGridReflowSpringAnimation$lambda$18(Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    sget-object p1, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/util/s1;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget-object p1, Lw3/e;->p:Lw3/e;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/s1;->c(Lw3/e;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private static final runTaskGridReflowSpringAnimation$lambda$19(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/RecentsView;->expressiveDismissTaskView(Lcom/android/quickstep/views/TaskView;Lu4/a;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 7
    .line 8
    return-object p0
.end method

.method private static final runTaskGridReflowSpringAnimation$lambda$21$lambda$20(Lu4/a;Landroidx/dynamicanimation/animation/e;ZFF)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final willTaskBeVisibleAfterDismiss(Lcom/android/quickstep/views/TaskView;I)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryScroll(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    invoke-interface {v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getMeasuredSize(Landroid/view/View;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/2addr v1, v0

    .line 26
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/android/quickstep/views/RecentsView;->isTaskViewWithinBounds(Lcom/android/quickstep/views/TaskView;III)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method


# virtual methods
.method public final animateRecentsScale(F)Landroidx/dynamicanimation/animation/j;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f070ac6

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Lx2/h;->getFloat(I)F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const v2, 0x7f070aca

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v2}, Lx2/h;->getFloat(I)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "get(...)"

    .line 32
    .line 33
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    check-cast v2, Ljava/lang/Number;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 43
    .line 44
    mul-float/2addr v2, v3

    .line 45
    new-instance v4, Landroidx/dynamicanimation/animation/j;

    .line 46
    .line 47
    new-instance v5, Landroidx/dynamicanimation/animation/h;

    .line 48
    .line 49
    invoke-direct {v5, v2}, Landroidx/dynamicanimation/animation/h;-><init>(F)V

    .line 50
    .line 51
    .line 52
    invoke-direct {v4, v5}, Landroidx/dynamicanimation/animation/j;-><init>(Landroidx/dynamicanimation/animation/h;)V

    .line 53
    .line 54
    .line 55
    new-instance v5, Landroidx/dynamicanimation/animation/k;

    .line 56
    .line 57
    invoke-direct {v5, v2}, Landroidx/dynamicanimation/animation/k;-><init>(F)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5, v1}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1, v0}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v4, v0}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Lcom/android/quickstep/views/H;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/H;-><init>(Lcom/android/quickstep/views/RecentsDismissUtils;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    move-object v0, p0

    .line 82
    check-cast v0, Landroidx/dynamicanimation/animation/j;

    .line 83
    .line 84
    mul-float/2addr p1, v3

    .line 85
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 86
    .line 87
    .line 88
    const-string p1, "apply(...)"

    .line 89
    .line 90
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-object v0
.end method

.method public final createTaskDismissSettlingSpringAnimation(Lcom/android/quickstep/views/TaskView;FZILu4/a;)Landroidx/dynamicanimation/animation/j;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            "FZI",
            "Lu4/a<",
            "Lh4/t;",
            ">;)",
            "Landroidx/dynamicanimation/animation/j;"
        }
    .end annotation

    .line 1
    const-string v2, "onEndRunnable"

    .line 2
    .line 3
    invoke-static {p5, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-object v2

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getSecondaryDismissTranslationProperty()Landroid/util/FloatProperty;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-static {v3}, Landroidx/dynamicanimation/animation/g;->createFloatPropertyCompat(Landroid/util/FloatProperty;)Landroidx/dynamicanimation/animation/g;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsDismissUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 19
    .line 20
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-interface {v3, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryDimension(Landroid/view/View;)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    int-to-float v3, v3

    .line 29
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-static {v4, v3}, LA4/d;->b(FF)F

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    mul-float v7, v3, v4

    .line 42
    .line 43
    new-instance v3, Landroidx/dynamicanimation/animation/j;

    .line 44
    .line 45
    invoke-direct {v3, p1, v5}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 46
    .line 47
    .line 48
    const/4 v4, 0x0

    .line 49
    const/4 v8, 0x1

    .line 50
    invoke-static {p0, v4, v8, v2}, Lcom/android/quickstep/views/RecentsDismissUtils;->createExpressiveDismissSpringForce$default(Lcom/android/quickstep/views/RecentsDismissUtils;FILjava/lang/Object;)Landroidx/dynamicanimation/animation/k;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v3, v2}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2, v7}, Landroidx/dynamicanimation/animation/e;->r(F)Landroidx/dynamicanimation/animation/e;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    move-object v8, v2

    .line 63
    check-cast v8, Landroidx/dynamicanimation/animation/j;

    .line 64
    .line 65
    new-instance v0, Lcom/android/quickstep/views/x;

    .line 66
    .line 67
    move-object v4, p0

    .line 68
    move-object v3, p1

    .line 69
    move v1, p3

    .line 70
    move v2, p4

    .line 71
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/views/x;-><init>(ZILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/RecentsDismissUtils;Landroidx/dynamicanimation/animation/g;)V

    .line 72
    .line 73
    .line 74
    move-object v3, v0

    .line 75
    invoke-virtual {v8, v3}, Landroidx/dynamicanimation/animation/e;->b(Landroidx/dynamicanimation/animation/e$r;)Landroidx/dynamicanimation/animation/e;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Landroidx/dynamicanimation/animation/j;

    .line 80
    .line 81
    new-instance v4, Lcom/android/quickstep/views/y;

    .line 82
    .line 83
    invoke-direct {v4, p3, p0, p1, p5}, Lcom/android/quickstep/views/y;-><init>(ZLcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Lu4/a;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3, v4}, Landroidx/dynamicanimation/animation/e;->a(Landroidx/dynamicanimation/animation/e$q;)Landroidx/dynamicanimation/animation/e;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Landroidx/dynamicanimation/animation/j;

    .line 91
    .line 92
    if-nez p3, :cond_1

    .line 93
    .line 94
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    move v6, v7

    .line 98
    const/4 v7, 0x4

    .line 99
    const/4 v8, 0x0

    .line 100
    move-object v2, v3

    .line 101
    const/4 v3, 0x0

    .line 102
    const/4 v4, 0x0

    .line 103
    const/4 v5, 0x1

    .line 104
    move-object v0, p0

    .line 105
    move-object v1, p1

    .line 106
    invoke-static/range {v0 .. v8}, Lcom/android/quickstep/views/RecentsDismissUtils;->addNeighborSettlingSpringAnimations$default(Lcom/android/quickstep/views/RecentsDismissUtils;Lcom/android/quickstep/views/TaskView;Landroidx/dynamicanimation/animation/j;Ljava/util/List;FZFILjava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-object v2

    .line 110
    :cond_1
    move-object v2, v3

    .line 111
    return-object v2
.end method
