.class public final LX1/j$g;
.super Ljava/lang/Object;
.source "Animator.kt"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LX1/j;->v0(Landroid/animation/Animator;FF)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lkotlin/jvm/internal/A;

.field final synthetic h:LX1/j;

.field final synthetic i:Lkotlin/jvm/internal/A;

.field final synthetic j:F

.field final synthetic k:F


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/A;LX1/j;Lkotlin/jvm/internal/A;FF)V
    .locals 0

    .line 1
    iput-object p1, p0, LX1/j$g;->g:Lkotlin/jvm/internal/A;

    .line 2
    .line 3
    iput-object p2, p0, LX1/j$g;->h:LX1/j;

    .line 4
    .line 5
    iput-object p3, p0, LX1/j$g;->i:Lkotlin/jvm/internal/A;

    .line 6
    .line 7
    iput p4, p0, LX1/j$g;->j:F

    .line 8
    .line 9
    iput p5, p0, LX1/j$g;->k:F

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
    iget-object p1, p0, LX1/j$g;->g:Lkotlin/jvm/internal/A;

    .line 2
    .line 3
    iget-object v0, p0, LX1/j$g;->h:LX1/j;

    .line 4
    .line 5
    invoke-static {v0}, LX1/j;->T(LX1/j;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const-string v2, "bubbleBarViewController"

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    move-object v0, v1

    .line 18
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->h0()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p1, Lkotlin/jvm/internal/A;->g:F

    .line 23
    .line 24
    iget-object p1, p0, LX1/j$g;->i:Lkotlin/jvm/internal/A;

    .line 25
    .line 26
    iget-object v0, p0, LX1/j$g;->h:LX1/j;

    .line 27
    .line 28
    invoke-static {v0}, LX1/j;->T(LX1/j;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    move-object v0, v1

    .line 38
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->i0()F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p1, Lkotlin/jvm/internal/A;->g:F

    .line 43
    .line 44
    iget-object p1, p0, LX1/j$g;->h:LX1/j;

    .line 45
    .line 46
    invoke-static {p1}, LX1/j;->T(LX1/j;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    move-object v1, p1

    .line 57
    :goto_0
    iget p1, p0, LX1/j$g;->j:F

    .line 58
    .line 59
    iget p0, p0, LX1/j$g;->k:F

    .line 60
    .line 61
    invoke-virtual {v1, p1, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->s1(FF)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
