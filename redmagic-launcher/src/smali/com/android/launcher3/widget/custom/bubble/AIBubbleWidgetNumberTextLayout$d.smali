.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AIBubbleWidgetNumberTextLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

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
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/16 v1, 0x8

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 51
    .line 52
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->c(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->c(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v0, v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
