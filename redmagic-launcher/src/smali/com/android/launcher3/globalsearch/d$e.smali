.class Lcom/android/launcher3/globalsearch/d$e;
.super Ljava/lang/Object;
.source "GSAppLocationAnim.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/globalsearch/d;->k(Landroid/os/Handler;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;)Lcom/android/launcher3/globalsearch/d$h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/BubbleTextView;

.field final synthetic h:Lcom/android/launcher3/BubbleTextView;

.field final synthetic i:Lcom/android/launcher3/C2;

.field final synthetic j:Landroid/os/Handler;

.field final synthetic k:Lcom/android/launcher3/globalsearch/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/C2;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->k:Lcom/android/launcher3/globalsearch/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/globalsearch/d$e;->g:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/globalsearch/d$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/globalsearch/d$e;->i:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/globalsearch/d$e;->j:Landroid/os/Handler;

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
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->i:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$e;->g:Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->k:Lcom/android/launcher3/globalsearch/d;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$e;->i:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/android/launcher3/globalsearch/d;->c(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/C2;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->k:Lcom/android/launcher3/globalsearch/d;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$e;->j:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-static {p1, p0}, Lcom/android/launcher3/globalsearch/d;->d(Lcom/android/launcher3/globalsearch/d;Landroid/os/Handler;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "Global_Search_GSAppLocationAnim"

    .line 33
    .line 34
    const-string p1, "iconTwinkle--canceled"

    .line 35
    .line 36
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->i:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$e;->g:Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->k:Lcom/android/launcher3/globalsearch/d;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$e;->i:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/android/launcher3/globalsearch/d;->c(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/C2;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->k:Lcom/android/launcher3/globalsearch/d;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$e;->j:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-static {p1, p0}, Lcom/android/launcher3/globalsearch/d;->d(Lcom/android/launcher3/globalsearch/d;Landroid/os/Handler;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "Global_Search_GSAppLocationAnim"

    .line 33
    .line 34
    const-string p1, "iconTwinkle--runEnd"

    .line 35
    .line 36
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->g:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->g:Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/TextView;->getPivotX()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setPivotX(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->g:Lcom/android/launcher3/BubbleTextView;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/globalsearch/d$e;->h:Lcom/android/launcher3/BubbleTextView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/widget/TextView;->getPivotY()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setPivotY(F)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/globalsearch/d$e;->k:Lcom/android/launcher3/globalsearch/d;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/d$e;->i:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-static {p1, p0}, Lcom/android/launcher3/globalsearch/d;->b(Lcom/android/launcher3/globalsearch/d;Lcom/android/launcher3/C2;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
