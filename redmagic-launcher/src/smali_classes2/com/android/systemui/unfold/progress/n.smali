.class public final Lcom/android/systemui/unfold/progress/n;
.super Ljava/lang/Object;
.source "UnfoldRemoteFilter.kt"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/unfold/progress/n$a;
    }
.end annotation


# instance fields
.field private final g:LC2/i$a;

.field private final h:Landroidx/dynamicanimation/animation/j;

.field private i:Z

.field private j:Z

.field private k:F


# direct methods
.method public constructor <init>(LC2/i$a;)V
    .locals 3

    .line 1
    const-string v0, "listener"

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
    iput-object p1, p0, Lcom/android/systemui/unfold/progress/n;->g:LC2/i$a;

    .line 10
    .line 11
    new-instance p1, Landroidx/dynamicanimation/animation/j;

    .line 12
    .line 13
    sget-object v0, Lcom/android/systemui/unfold/progress/n$a;->a:Lcom/android/systemui/unfold/progress/n$a;

    .line 14
    .line 15
    invoke-direct {p1, p0, v0}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Landroidx/dynamicanimation/animation/k;

    .line 19
    .line 20
    invoke-direct {v0}, Landroidx/dynamicanimation/animation/k;-><init>()V

    .line 21
    .line 22
    .line 23
    const/high16 v1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 26
    .line 27
    .line 28
    const v2, 0x47c35000    # 100000.0f

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/k;->g(F)Landroidx/dynamicanimation/animation/k;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/j;->B(Landroidx/dynamicanimation/animation/k;)Landroidx/dynamicanimation/animation/j;

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/e;->n(F)Landroidx/dynamicanimation/animation/e;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroidx/dynamicanimation/animation/e;->m(F)Landroidx/dynamicanimation/animation/e;

    .line 45
    .line 46
    .line 47
    const v0, 0x3a83126f    # 0.001f

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/e;->o(F)Landroidx/dynamicanimation/animation/e;

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Lcom/android/systemui/unfold/progress/n;->h:Landroidx/dynamicanimation/animation/j;

    .line 54
    .line 55
    iput v1, p0, Lcom/android/systemui/unfold/progress/n;->k:F

    .line 56
    .line 57
    return-void
.end method

.method public static synthetic a()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/n;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic b()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/n;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private static final c()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/o;->b()Ljava/lang/String;

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
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, "#filtered_progress"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0
.end method

.method public static final synthetic d(Lcom/android/systemui/unfold/progress/n;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/systemui/unfold/progress/n;->k:F

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic e(Lcom/android/systemui/unfold/progress/n;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/systemui/unfold/progress/n;->h(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final f(Lu4/a;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Ljava/lang/String;",
            ">;F)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/o;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    const/16 p1, 0x64

    .line 14
    .line 15
    int-to-float p1, p1

    .line 16
    mul-float/2addr p2, p1

    .line 17
    float-to-long p1, p2

    .line 18
    invoke-static {p0, p1, p2}, Landroid/os/Trace;->setCounter(Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private static final g()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/systemui/unfold/progress/o;->b()Ljava/lang/String;

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
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, "#plain_remote_progress"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0
.end method

.method private final h(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/n;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/android/systemui/unfold/progress/l;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/systemui/unfold/progress/l;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0, p1}, Lcom/android/systemui/unfold/progress/n;->f(Lu4/a;F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/n;->g:LC2/i$a;

    .line 14
    .line 15
    invoke-interface {v0, p1}, LC2/i$a;->onTransitionProgress(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput p1, p0, Lcom/android/systemui/unfold/progress/n;->k:F

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/systemui/unfold/progress/n;->i:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/android/systemui/unfold/progress/n;->j:Z

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/n;->g:LC2/i$a;

    .line 7
    .line 8
    invoke-interface {p0}, LC2/i$a;->onTransitionFinished()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/systemui/unfold/progress/m;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/unfold/progress/m;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0, p1}, Lcom/android/systemui/unfold/progress/n;->f(Lu4/a;F)V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/n;->i:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/systemui/unfold/progress/n;->j:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/n;->h:Landroidx/dynamicanimation/animation/j;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroidx/dynamicanimation/animation/j;->w(F)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/systemui/unfold/progress/n;->h(F)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/android/systemui/unfold/progress/n;->j:Z

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {}, Lcom/android/systemui/unfold/progress/o;->b()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "Progress received while not in progress."

    .line 35
    .line 36
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onTransitionStarted()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/n;->g:LC2/i$a;

    .line 2
    .line 3
    invoke-interface {v0}, LC2/i$a;->onTransitionStarted()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/systemui/unfold/progress/n;->i:Z

    .line 8
    .line 9
    return-void
.end method
