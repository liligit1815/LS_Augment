.class Lcom/android/launcher3/dragndrop/v$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DragView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/dragndrop/v;-><init>(Landroid/content/Context;Landroid/view/View;IIIIFFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/dragndrop/v;


# direct methods
.method constructor <init>(Lcom/android/launcher3/dragndrop/v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/v$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/v$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/dragndrop/v;->e(Lcom/android/launcher3/dragndrop/v;)Ljava/lang/Runnable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/dragndrop/v;->e(Lcom/android/launcher3/dragndrop/v;)Ljava/lang/Runnable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/v$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Lcom/android/launcher3/dragndrop/v;->i(Lcom/android/launcher3/dragndrop/v;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
