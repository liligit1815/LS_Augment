.class public final Lcom/android/quickstep/util/animation/MultiAnimatorSet;
.super Ljava/lang/Object;
.source "MultiAnimatorSet.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MultiAnimatorSet"

.field public static final TYPE_ALL:I = 0x7

.field public static final TYPE_ANIMATOR_SET:I = 0x1

.field public static final TYPE_RECTF_SPRING_ANIM:I = 0x4

.field public static final TYPE_SPRING_ANIMATIONS:I = 0x2


# instance fields
.field private mAnimEndCallback:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

.field private mAnimationId:I

.field private mAnimatorListeners:Landroid/util/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArraySet<",
            "Lcom/android/launcher3/anim/T;",
            ">;"
        }
    .end annotation
.end field

.field private final mAnimatorSet:Landroid/animation/AnimatorSet;

.field private mAnimatorSetEnded:Z

.field private mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

.field private mRectFSpringAnimEnded:Z

.field private mSpringAnimEndListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

.field private final mSpringAnimations:Landroid/util/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArraySet<",
            "Lcom/android/quickstep/util/animation/SpringAnimation;",
            ">;"
        }
    .end annotation
.end field

.field private mStarted:Z

.field private mViewSpringAnimEnded:Z


# direct methods
.method public constructor <init>(Landroid/animation/AnimatorSet;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string v0, "animatorSet"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    const-string v0, "animType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 15
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSetEnded:Z

    .line 17
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    .line 18
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnimEnded:Z

    .line 19
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorListeners:Landroid/util/ArraySet;

    .line 20
    iput-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 21
    iput-object p2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    const-string v0, "animType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 4
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSetEnded:Z

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnimEnded:Z

    .line 8
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorListeners:Landroid/util/ArraySet;

    .line 9
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 10
    iput-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)Landroid/util/ArraySet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSetEnded:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnimEnded:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    .line 2
    .line 3
    return-void
.end method

.method private final getSpringAnimations()[Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    new-array v0, v0, [Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/util/ArraySet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, [Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 11
    .line 12
    return-object p0
.end method

.method private final initSpringAnimEndListener()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimEndListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet$1;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimEndListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    .line 12
    .line 13
    return-void
.end method

.method private final removeSpringAnimFromSet()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getSpringAnimations()[Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v2, "removeSpringAnimFromSet, size: "

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    array-length v2, v0

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "MultiAnimatorSet"

    .line 24
    .line 25
    invoke-static {v2, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    array-length v1, v0

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    array-length v1, v0

    .line 32
    const/4 v2, 0x0

    .line 33
    :goto_0
    if-ge v2, v1, :cond_0

    .line 34
    .line 35
    aget-object v3, v0, v2

    .line 36
    .line 37
    iget-object v4, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimEndListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    .line 38
    .line 39
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/util/ArraySet;->clear()V

    .line 48
    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    .line 52
    .line 53
    :cond_1
    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimEndCallback:Ljava/util/function/Consumer;

    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final addListener(Lcom/android/launcher3/anim/T;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorListeners:Landroid/util/ArraySet;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final cancel(I)V
    .locals 5

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 10
    .line 11
    const/16 v2, 0xa

    .line 12
    .line 13
    invoke-static {v2}, Landroid/os/Debug;->getCallers(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v4, "#"

    .line 20
    .line 21
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " Cancel request type: "

    .line 28
    .line 29
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, ", mStarted: "

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, ", Callers:"

    .line 44
    .line 45
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, "MultiAnimatorSet"

    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    and-int/lit8 v0, p1, 0x1

    .line 65
    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 71
    .line 72
    .line 73
    :cond_1
    and-int/lit8 v0, p1, 0x2

    .line 74
    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getSpringAnimations()[Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    array-length v1, v0

    .line 82
    const/4 v2, 0x0

    .line 83
    :goto_0
    if-ge v2, v1, :cond_3

    .line 84
    .line 85
    aget-object v3, v0, v2

    .line 86
    .line 87
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 88
    .line 89
    .line 90
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->removeSpringAnimFromSet()V

    .line 94
    .line 95
    .line 96
    :cond_3
    and-int/lit8 p1, p1, 0x4

    .line 97
    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 101
    .line 102
    if-eqz p1, :cond_4

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->cancel()V

    .line 105
    .line 106
    .line 107
    :cond_4
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorListeners:Landroid/util/ArraySet;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_5

    .line 118
    .line 119
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Lcom/android/launcher3/anim/T;

    .line 124
    .line 125
    const/4 v0, 0x0

    .line 126
    invoke-interface {p1, v0}, Lcom/android/launcher3/anim/T;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_5
    return-void
.end method

.method public final cancelAllAnimExceptSpringAnim()V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->cancel(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final end(I)V
    .locals 5

    .line 1
    invoke-static {}, LM3/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 10
    .line 11
    const/16 v2, 0xa

    .line 12
    .line 13
    invoke-static {v2}, Landroid/os/Debug;->getCallers(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v4, "#"

    .line 20
    .line 21
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " end request type: "

    .line 28
    .line 29
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, ", mStarted: "

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, ", Callers:"

    .line 44
    .line 45
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, "MultiAnimatorSet"

    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v0, v1}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 61
    .line 62
    if-eqz v0, :cond_6

    .line 63
    .line 64
    and-int/lit8 v0, p1, 0x1

    .line 65
    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 71
    .line 72
    .line 73
    :cond_1
    and-int/lit8 v0, p1, 0x2

    .line 74
    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getSpringAnimations()[Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    array-length v1, v0

    .line 82
    const/4 v2, 0x0

    .line 83
    :goto_0
    if-ge v2, v1, :cond_4

    .line 84
    .line 85
    aget-object v3, v0, v2

    .line 86
    .line 87
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/SpringAnimation;->canSkipToEnd()Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_2

    .line 92
    .line 93
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/SpringAnimation;->skipToEnd()V

    .line 94
    .line 95
    .line 96
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->removeSpringAnimFromSet()V

    .line 100
    .line 101
    .line 102
    :cond_4
    and-int/lit8 p1, p1, 0x4

    .line 103
    .line 104
    if-eqz p1, :cond_6

    .line 105
    .line 106
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 107
    .line 108
    if-nez p0, :cond_5

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_5
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->skipToEnd()V

    .line 112
    .line 113
    .line 114
    :cond_6
    :goto_1
    return-void
.end method

.method public final endAllAnimExceptSpringAnim()V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->end(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMAnimationId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMAnimatorSet()Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isAppOpenType()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/AnimationRecord;->INSTANCE:Lcom/android/quickstep/util/animation/AnimationRecord$Companion;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/animation/AnimationRecord$Companion;->isOpenAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final isRunning()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSetEnded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnimEnded:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public final maybeOnEnd()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSetEnded:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnimEnded:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v1, "#"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget v1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, " all animations ended. type: "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "MultiAnimatorSet"

    .line 47
    .line 48
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimEndCallback:Ljava/util/function/Consumer;

    .line 55
    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    iget v1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 59
    .line 60
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-interface {v0, v1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    const/4 v0, 0x0

    .line 68
    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimEndCallback:Ljava/util/function/Consumer;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorListeners:Landroid/util/ArraySet;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/android/launcher3/anim/T;

    .line 87
    .line 88
    invoke-interface {v1, v0}, Lcom/android/launcher3/anim/T;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    return-void
.end method

.method public final play(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string v0, "animator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    if-eqz v0, :cond_0

    return-void

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    return-void
.end method

.method public final play(Landroid/animation/Animator;Z)V
    .locals 1

    .line 7
    const-string v0, "animator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p2, :cond_0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Landroid/animation/Animator;)V

    return-void

    .line 9
    :cond_0
    iget-boolean p2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    if-eqz p2, :cond_1

    .line 10
    iget-object p2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorListeners:Landroid/util/ArraySet;

    new-instance v0, Lcom/android/quickstep/util/animation/MultiAnimatorSet$4;

    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet$4;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/animation/Animator;)V

    invoke-virtual {p2, v0}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 12
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    return-void

    .line 13
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    return-void
.end method

.method public final play(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 1

    .line 23
    const-string v0, "rectFSpringAnim"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 25
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 26
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 27
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setAnimParamByType(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final play(Lcom/android/quickstep/util/animation/SpringAnimation;)V
    .locals 2

    .line 14
    const-string v0, "springAnimation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SpringAnimation new start. size:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    invoke-virtual {v1}, Landroid/util/ArraySet;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MultiAnimatorSet"

    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->initSpringAnimEndListener()V

    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimEndListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->addEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 19
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    invoke-virtual {v0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    .line 20
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringAnimation;->start()V

    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    invoke-virtual {p0, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final varargs play([Lcom/android/quickstep/util/animation/SpringAnimation;)V
    .locals 3

    .line 4
    const-string v0, "springAnimations"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 6
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/SpringAnimation;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final setAnimationId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 2
    .line 3
    return-void
.end method

.method public final setViewStateResetRunnable(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimEndCallback:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method

.method public final start()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mStarted:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimations:Landroid/util/ArraySet;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/util/ArraySet;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 27
    .line 28
    iget-object v3, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimType:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 29
    .line 30
    const-string v4, ", animatorSize: "

    .line 31
    .line 32
    const-string v5, ", viewSpringAnimSize: "

    .line 33
    .line 34
    const-string v6, "Start, #"

    .line 35
    .line 36
    invoke-static {v6, v2, v4, v0, v5}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v4, ", mAnimType:"

    .line 44
    .line 45
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "MultiAnimatorSet"

    .line 56
    .line 57
    invoke-static {v3, v2}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorListeners:Landroid/util/ArraySet;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_2

    .line 71
    .line 72
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    check-cast v4, Lcom/android/launcher3/anim/T;

    .line 77
    .line 78
    instance-of v5, v4, Lcom/android/launcher3/anim/U;

    .line 79
    .line 80
    if-eqz v5, :cond_1

    .line 81
    .line 82
    move-object v5, v4

    .line 83
    check-cast v5, Lcom/android/launcher3/anim/U;

    .line 84
    .line 85
    iget v6, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 86
    .line 87
    invoke-virtual {v5, v6}, Lcom/android/launcher3/anim/U;->setAnimationId(I)V

    .line 88
    .line 89
    .line 90
    :cond_1
    const/4 v5, 0x0

    .line 91
    invoke-interface {v4, v5}, Lcom/android/launcher3/anim/T;->onAnimationStart(Landroid/animation/Animator;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    if-lez v0, :cond_3

    .line 96
    .line 97
    iget-object v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 98
    .line 99
    new-instance v4, Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;

    .line 100
    .line 101
    invoke-direct {v4, p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet$2;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimatorSet:Landroid/animation/AnimatorSet;

    .line 108
    .line 109
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 110
    .line 111
    .line 112
    :cond_3
    if-lez v1, :cond_4

    .line 113
    .line 114
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->initSpringAnimEndListener()V

    .line 115
    .line 116
    .line 117
    const/4 v2, 0x0

    .line 118
    iput-boolean v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mViewSpringAnimEnded:Z

    .line 119
    .line 120
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getSpringAnimations()[Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    array-length v5, v4

    .line 125
    :goto_1
    if-ge v2, v5, :cond_4

    .line 126
    .line 127
    aget-object v6, v4, v2

    .line 128
    .line 129
    iget-object v7, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mSpringAnimEndListener:Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    .line 130
    .line 131
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/animation/DynamicAnimation;->addEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/SpringAnimation;->start()V

    .line 135
    .line 136
    .line 137
    add-int/lit8 v2, v2, 0x1

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_4
    iget-object v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 141
    .line 142
    if-eqz v2, :cond_6

    .line 143
    .line 144
    iget v4, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mAnimationId:I

    .line 145
    .line 146
    invoke-virtual {v2, v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setAnimationId(I)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 150
    .line 151
    if-eqz v2, :cond_5

    .line 152
    .line 153
    new-instance v4, Lcom/android/quickstep/util/animation/MultiAnimatorSet$3;

    .line 154
    .line 155
    invoke-direct {v4, p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet$3;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v2, v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 159
    .line 160
    .line 161
    :cond_5
    iget-object v2, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 162
    .line 163
    if-eqz v2, :cond_6

    .line 164
    .line 165
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->start()V

    .line 166
    .line 167
    .line 168
    :cond_6
    if-nez v0, :cond_7

    .line 169
    .line 170
    if-nez v1, :cond_7

    .line 171
    .line 172
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->mRectFSpringAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 173
    .line 174
    if-nez v0, :cond_7

    .line 175
    .line 176
    const-string v0, "Null multi animator set"

    .line 177
    .line 178
    invoke-static {v3, v0}, LM3/a;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->maybeOnEnd()V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_7
    sget-object v0, Lcom/android/launcher3/anim/x;->c:Lcom/android/launcher3/anim/x$a;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/android/launcher3/anim/x$a;->b()Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_8

    .line 192
    .line 193
    const/4 v0, 0x3

    .line 194
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->end(I)V

    .line 195
    .line 196
    .line 197
    :cond_8
    :goto_2
    return-void
.end method
