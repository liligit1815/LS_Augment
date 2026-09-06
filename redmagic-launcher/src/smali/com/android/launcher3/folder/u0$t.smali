.class Lcom/android/launcher3/folder/u0$t;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->V(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$t;->h:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/folder/u0$t;->g:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "animScaleBottomIcon onAnimationEnd isExpand="

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/android/launcher3/folder/u0$t;->g:Z

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "PreviewBackground"

    .line 24
    .line 25
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$t;->h:Lcom/android/launcher3/folder/u0;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {p1, v0}, Lcom/android/launcher3/folder/u0;->N(Lcom/android/launcher3/folder/u0;Landroid/animation/ValueAnimator;)V

    .line 32
    .line 33
    .line 34
    iget-boolean p1, p0, Lcom/android/launcher3/folder/u0$t;->g:Z

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$t;->h:Lcom/android/launcher3/folder/u0;

    .line 39
    .line 40
    invoke-static {p0, v0}, Lcom/android/launcher3/folder/u0;->A(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/BubbleTextView;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
