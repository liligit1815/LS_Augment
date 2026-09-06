.class public final LX1/j$f;
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

.field final synthetic h:Lkotlin/jvm/internal/A;

.field final synthetic i:LX1/j;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;LX1/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, LX1/j$f;->g:Lkotlin/jvm/internal/A;

    .line 2
    .line 3
    iput-object p2, p0, LX1/j$f;->h:Lkotlin/jvm/internal/A;

    .line 4
    .line 5
    iput-object p3, p0, LX1/j$f;->i:LX1/j;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
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
    iget-object p1, p0, LX1/j$f;->g:Lkotlin/jvm/internal/A;

    .line 2
    .line 3
    iget p1, p1, Lkotlin/jvm/internal/A;->g:F

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, LX1/j$f;->h:Lkotlin/jvm/internal/A;

    .line 12
    .line 13
    iget p1, p1, Lkotlin/jvm/internal/A;->g:F

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, LX1/j$f;->i:LX1/j;

    .line 22
    .line 23
    invoke-static {p1}, LX1/j;->T(LX1/j;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const-string p1, "bubbleBarViewController"

    .line 30
    .line 31
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    :cond_0
    iget-object v0, p0, LX1/j$f;->g:Lkotlin/jvm/internal/A;

    .line 36
    .line 37
    iget v0, v0, Lkotlin/jvm/internal/A;->g:F

    .line 38
    .line 39
    iget-object p0, p0, LX1/j$f;->h:Lkotlin/jvm/internal/A;

    .line 40
    .line 41
    iget p0, p0, Lkotlin/jvm/internal/A;->g:F

    .line 42
    .line 43
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->s1(FF)V

    .line 44
    .line 45
    .line 46
    :cond_1
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
