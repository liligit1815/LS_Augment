.class public final LX1/j$d;
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
    iput-object p1, p0, LX1/j$d;->g:LX1/j;

    .line 2
    .line 3
    iput-boolean p2, p0, LX1/j$d;->h:Z

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
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, LX1/j$d;->g:LX1/j;

    .line 2
    .line 3
    invoke-static {p1}, LX1/j;->R(LX1/j;)Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    const-string p1, "bubbleBarBubbleAlpha"

    .line 11
    .line 12
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    move-object p1, v0

    .line 16
    :cond_0
    iget-object v1, p0, LX1/j$d;->g:LX1/j;

    .line 17
    .line 18
    iget-boolean v2, p0, LX1/j$d;->h:Z

    .line 19
    .line 20
    invoke-static {v1, v2}, LX1/j;->O(LX1/j;Z)F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, LX1/j$d;->g:LX1/j;

    .line 28
    .line 29
    invoke-static {p1}, LX1/j;->Q(LX1/j;)Lcom/android/launcher3/anim/d;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    const-string p1, "bubbleBarBackgroundAlpha"

    .line 36
    .line 37
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    move-object p1, v0

    .line 41
    :cond_1
    iget-object v1, p0, LX1/j$d;->g:LX1/j;

    .line 42
    .line 43
    iget-boolean v2, p0, LX1/j$d;->h:Z

    .line 44
    .line 45
    invoke-static {v1, v2}, LX1/j;->O(LX1/j;Z)F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, LX1/j$d;->g:LX1/j;

    .line 53
    .line 54
    invoke-static {p0}, LX1/j;->P(LX1/j;)Lcom/android/launcher3/util/v1$c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    if-nez p0, :cond_2

    .line 59
    .line 60
    const-string p0, "bubbleBarAlpha"

    .line 61
    .line 62
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    move-object v0, p0

    .line 67
    :goto_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
