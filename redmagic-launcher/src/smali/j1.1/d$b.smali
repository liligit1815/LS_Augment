.class public final Lj1/d$b;
.super Ljava/lang/Object;
.source "Animator.kt"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lj1/d;->h(Landroid/window/TransitionInfo$Change;Landroid/view/SurfaceControl$Transaction;Lu4/l;Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lu4/l;

.field final synthetic h:Lj1/d;


# direct methods
.method public constructor <init>(Lu4/l;Lj1/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj1/d$b;->g:Lu4/l;

    .line 2
    .line 3
    iput-object p2, p0, Lj1/d$b;->h:Lj1/d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lj1/d$b;->g:Lu4/l;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lj1/d$b;->h:Lj1/d;

    .line 7
    .line 8
    invoke-static {p1}, Lj1/d;->e(Lj1/d;)Lcom/android/internal/jank/InteractionJankMonitor;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lj1/d$b;->h:Lj1/d;

    .line 13
    .line 14
    invoke-static {p0}, Lj1/d;->d(Lj1/d;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Lcom/android/internal/jank/InteractionJankMonitor;->end(I)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method
