.class public final LM2/c$a;
.super Ljava/lang/Object;
.source "MinimizeAnimator.kt"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LM2/c;->b(Landroid/content/Context;Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl$Transaction;Lu4/l;Lcom/android/internal/jank/InteractionJankMonitor;Landroid/os/Handler;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/internal/jank/InteractionJankMonitor;

.field final synthetic h:Landroid/window/TransitionInfo$Change;

.field final synthetic i:Landroid/content/Context;

.field final synthetic j:Landroid/os/Handler;

.field final synthetic k:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroid/animation/Animator;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/android/internal/jank/InteractionJankMonitor;Landroid/window/TransitionInfo$Change;Landroid/content/Context;Landroid/os/Handler;Lu4/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/jank/InteractionJankMonitor;",
            "Landroid/window/TransitionInfo$Change;",
            "Landroid/content/Context;",
            "Landroid/os/Handler;",
            "Lu4/l<",
            "-",
            "Landroid/animation/Animator;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LM2/c$a;->g:Lcom/android/internal/jank/InteractionJankMonitor;

    .line 2
    .line 3
    iput-object p2, p0, LM2/c$a;->h:Landroid/window/TransitionInfo$Change;

    .line 4
    .line 5
    iput-object p3, p0, LM2/c$a;->i:Landroid/content/Context;

    .line 6
    .line 7
    iput-object p4, p0, LM2/c$a;->j:Landroid/os/Handler;

    .line 8
    .line 9
    iput-object p5, p0, LM2/c$a;->k:Lu4/l;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LM2/c$a;->g:Lcom/android/internal/jank/InteractionJankMonitor;

    .line 7
    .line 8
    const/16 p1, 0x6d

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/internal/jank/InteractionJankMonitor;->cancel(I)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/c$a;->g:Lcom/android/internal/jank/InteractionJankMonitor;

    .line 7
    .line 8
    const/16 v1, 0x6d

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/internal/jank/InteractionJankMonitor;->end(I)Z

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, LM2/c$a;->k:Lu4/l;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const-string p0, "animator"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LM2/c$a;->g:Lcom/android/internal/jank/InteractionJankMonitor;

    .line 7
    .line 8
    iget-object v0, p0, LM2/c$a;->h:Landroid/window/TransitionInfo$Change;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/window/TransitionInfo$Change;->getLeash()Landroid/view/SurfaceControl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, LM2/c$a;->i:Landroid/content/Context;

    .line 15
    .line 16
    iget-object p0, p0, LM2/c$a;->j:Landroid/os/Handler;

    .line 17
    .line 18
    const/16 v2, 0x6d

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1, p0, v2}, Lcom/android/internal/jank/InteractionJankMonitor;->begin(Landroid/view/SurfaceControl;Landroid/content/Context;Landroid/os/Handler;I)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method
