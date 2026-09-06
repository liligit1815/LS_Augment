.class public final Lu2/F$f;
.super Ljava/lang/Object;
.source "TransitionAnimator.kt"

# interfaces
.implements Lu2/F$a;


# annotations
.annotation build Lcom/android/internal/annotations/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lu2/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "f"
.end annotation


# instance fields
.field private final a:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

.field private final b:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

.field private final c:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

.field private final d:Lu2/F$i;

.field private final e:J

.field private final f:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/android/internal/dynamicanimation/animation/SpringAnimation;Lcom/android/internal/dynamicanimation/animation/SpringAnimation;Lcom/android/internal/dynamicanimation/animation/SpringAnimation;Lu2/F$i;JLjava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "springX"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "springY"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "springScale"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "springState"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "onAnimationStart"

    .line 22
    .line 23
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lu2/F$f;->a:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 30
    .line 31
    iput-object p2, p0, Lu2/F$f;->b:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 32
    .line 33
    iput-object p3, p0, Lu2/F$f;->c:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 34
    .line 35
    iput-object p4, p0, Lu2/F$f;->d:Lu2/F$i;

    .line 36
    .line 37
    iput-wide p5, p0, Lu2/F$f;->e:J

    .line 38
    .line 39
    iput-object p7, p0, Lu2/F$f;->f:Ljava/lang/Runnable;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Lu2/F$f;J)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lu2/F$f;->c(Lu2/F$f;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final b(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lu2/F$f;->a:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 2
    .line 3
    iget-wide v1, p0, Lu2/F$f;->e:J

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->doAnimationFrame(J)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lu2/F$f;->b:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 9
    .line 10
    iget-wide v1, p0, Lu2/F$f;->e:J

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->doAnimationFrame(J)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lu2/F$f;->c:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 16
    .line 17
    iget-wide v1, p0, Lu2/F$f;->e:J

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->doAnimationFrame(J)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lu2/F$f;->a:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 23
    .line 24
    invoke-virtual {v0, p1, p2}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->doAnimationFrame(J)Z

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lu2/F$f;->b:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 28
    .line 29
    invoke-virtual {v0, p1, p2}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->doAnimationFrame(J)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lu2/F$f;->c:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 33
    .line 34
    invoke-virtual {v0, p1, p2}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->doAnimationFrame(J)Z

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lu2/F$f;->d()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private static final c(Lu2/F$f;J)V
    .locals 2

    .line 1
    const-wide/32 v0, 0xf4240

    .line 2
    .line 3
    .line 4
    div-long/2addr p1, v0

    .line 5
    invoke-direct {p0, p1, p2}, Lu2/F$f;->b(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private final d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lu2/F$f;->a:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->start()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lu2/F$f;->b:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->start()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lu2/F$f;->c:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->start()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Lu2/F$f;->a:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lu2/F$f;->b:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lu2/F$f;->c:Lcom/android/internal/dynamicanimation/animation/SpringAnimation;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/internal/dynamicanimation/animation/SpringAnimation;->cancel()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public start()V
    .locals 4

    .line 1
    iget-object v0, p0, Lu2/F$f;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lu2/F$f;->e:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lu2/F$f;->d()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/view/Choreographer;->getFrameTime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    invoke-direct {p0, v0, v1}, Lu2/F$f;->b(J)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Lu2/G;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lu2/G;-><init>(Lu2/F$f;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
