.class Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "GroupWidgetBackgroundLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->d(ZZJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;FF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->h:F

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
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
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->b(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)Landroid/widget/ImageView;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->b(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)Landroid/widget/ImageView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->h:F

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->c(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;Landroid/animation/Animator;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 5
    .line 6
    invoke-static {v0, p1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->c(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->b(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)Landroid/widget/ImageView;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->i:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->b(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)Landroid/widget/ImageView;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$c;->g:F

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
