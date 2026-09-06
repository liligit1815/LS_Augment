.class public final LX1/j$c;
.super Ljava/lang/Object;
.source "Animator.kt"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LX1/j;->l0(ZJ)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:LX1/j;

.field final synthetic h:Z


# direct methods
.method public constructor <init>(LX1/j;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, LX1/j$c;->g:LX1/j;

    .line 2
    .line 3
    iput-boolean p2, p0, LX1/j$c;->h:Z

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
    .locals 2

    .line 1
    iget-object p1, p0, LX1/j$c;->g:LX1/j;

    .line 2
    .line 3
    invoke-static {p1}, LX1/j;->N(LX1/j;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LX1/j$c;->g:LX1/j;

    .line 7
    .line 8
    invoke-static {p1}, LX1/j;->U(LX1/j;)LX1/b$c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const-string p1, "controllersAfterInitAction"

    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    :cond_0
    new-instance v0, LX1/j$e;

    .line 21
    .line 22
    iget-boolean v1, p0, LX1/j$c;->h:Z

    .line 23
    .line 24
    iget-object p0, p0, LX1/j$c;->g:LX1/j;

    .line 25
    .line 26
    invoke-direct {v0, v1, p0}, LX1/j$e;-><init>(ZLX1/j;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p1, v0}, LX1/b$c;->a(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
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
