.class public final Lcom/android/quickstep/util/animation/MultiDynamicAnimation;
.super Ljava/lang/Object;
.source "MultiDynamicAnimation.java"

# interfaces
.implements Landroid/animation/AnimationHandler$AnimationFrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationEndListener;,
        Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationUpdateListener;,
        Lcom/android/quickstep/util/animation/MultiDynamicAnimation$MessState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MultiDynamicAnimation"


# instance fields
.field private mCancelRequest:Z

.field private mEndListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationEndListener;",
            ">;"
        }
    .end annotation
.end field

.field private mEndRequest:Z

.field private mLastFrameTime:J

.field private mRunning:Z

.field private mSpringHolderMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/util/animation/SpringHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mUpdateListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationUpdateListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mSpringHolderMap:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 24
    .line 25
    return-void
.end method

.method private final applyToAllSpringHolder(Ljava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/util/animation/SpringHolder;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mSpringHolderMap:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/quickstep/util/animation/SpringHolder;

    .line 28
    .line 29
    const-string v1, "entry.value"

    .line 30
    .line 31
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public static final doAnimationFrame$lambda$2(JLcom/android/quickstep/util/animation/MultiDynamicAnimation;[ZLcom/android/quickstep/util/animation/SpringHolder;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$result"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "it"

    .line 12
    .line 13
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p2}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->isEndRequest()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p4, p0, p1, v0}, Lcom/android/quickstep/util/animation/SpringHolder;->updateValueAndVelocity(JZ)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-direct {p2}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->isEndRequest()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    aput-boolean p0, p3, p0

    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method private final endAnimationInternal(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "MultiDynamicAnimation endAnimationInternal, cancel = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "MultiDynamicAnimation"

    .line 19
    .line 20
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mRunning:Z

    .line 25
    .line 26
    invoke-static {}, Landroid/animation/AnimationHandler;->getInstance()Landroid/animation/AnimationHandler;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p0}, Landroid/animation/AnimationHandler;->removeCallback(Landroid/animation/AnimationHandler$AnimationFrameCallback;)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    iput-wide v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mLastFrameTime:J

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationEndListener;

    .line 54
    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    invoke-interface {v1, p0, p1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationEndListener;->onAnimationEnd(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;Z)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-void
.end method

.method private final isEndRequest()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mCancelRequest:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mEndRequest:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private final notifyAnimUpdate()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationUpdateListener;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v1, p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationUpdateListener;->onAnimationUpdate(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-void
.end method

.method public static final start$lambda$0(Lcom/android/quickstep/util/animation/SpringHolder;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringHolder;->setValuesThreshold()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final startAnimationInternal()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "MultiDynamicAnimation startAnimationInternal, running = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mRunning:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "MultiDynamicAnimation"

    .line 21
    .line 22
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mRunning:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mRunning:Z

    .line 32
    .line 33
    invoke-static {}, Landroid/animation/AnimationHandler;->getInstance()Landroid/animation/AnimationHandler;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-wide/16 v1, 0x0

    .line 38
    .line 39
    invoke-virtual {v0, p0, v1, v2}, Landroid/animation/AnimationHandler;->addAnimationFrameCallback(Landroid/animation/AnimationHandler$AnimationFrameCallback;J)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public final addAnimationEndListener(Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationEndListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mEndListeners:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final addSpringHolderItem(Lcom/android/quickstep/util/animation/SpringHolder;)V
    .locals 1

    .line 1
    const-string v0, "springHolder"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mSpringHolderMap:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/SpringHolder;->getMKey()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final addUpdateListener(Lcom/android/quickstep/util/animation/MultiDynamicAnimation$OnAnimationUpdateListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mUpdateListeners:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public commitAnimationFrame(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->doAnimationFrame(J)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public doAnimationFrame(J)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-wide v1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mLastFrameTime:J

    .line 3
    .line 4
    const-wide/16 v3, 0x0

    .line 5
    .line 6
    cmp-long v3, v1, v3

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    iput-wide p1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mLastFrameTime:J

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->notifyAnimUpdate()V

    .line 14
    .line 15
    .line 16
    return v4

    .line 17
    :cond_0
    sub-long v1, p1, v1

    .line 18
    .line 19
    iput-wide p1, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mLastFrameTime:J

    .line 20
    .line 21
    new-array p1, v0, [Z

    .line 22
    .line 23
    aput-boolean v0, p1, v4

    .line 24
    .line 25
    new-instance p2, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;

    .line 26
    .line 27
    invoke-direct {p2, p0, v1, v2, p1}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$1;-><init>(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;J[Z)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, p2}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->applyToAllSpringHolder(Ljava/util/function/Consumer;)V

    .line 31
    .line 32
    .line 33
    iget-boolean p2, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mCancelRequest:Z

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->isEndRequest()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iput-boolean v4, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mEndRequest:Z

    .line 42
    .line 43
    iput-boolean v4, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mCancelRequest:Z

    .line 44
    .line 45
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->notifyAnimUpdate()V

    .line 46
    .line 47
    .line 48
    aget-boolean v0, p1, v4

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-direct {p0, p2}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->endAnimationInternal(Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    aget-boolean p0, p1, v4

    .line 56
    .line 57
    return p0
.end method

.method public final getMRunning()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mRunning:Z

    .line 2
    .line 3
    return p0
.end method

.method public final requestEnd(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mCancelRequest:Z

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mEndRequest:Z

    .line 8
    .line 9
    return-void
.end method

.method public final start()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation$2;-><init>(Lcom/android/quickstep/util/animation/MultiDynamicAnimation;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->applyToAllSpringHolder(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->mRunning:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/util/animation/MultiDynamicAnimation;->startAnimationInternal()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
