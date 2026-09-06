.class Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;
.super Landroid/animation/AnimatorListenerAdapter;
.source "KeyboardQuickSwitchView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->I(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Landroid/view/ViewOutlineProvider;

.field final synthetic j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;ILandroid/view/View;Landroid/view/ViewOutlineProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->g:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->h:Landroid/view/View;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->i:Landroid/view/ViewOutlineProvider;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const/16 p0, 0x71

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->i:Landroid/view/ViewOutlineProvider;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/ViewGroup;->invalidateOutline()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->x(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/animation/AnimatorSet;)V

    .line 26
    .line 27
    .line 28
    const/16 p1, 0x71

    .line 29
    .line 30
    invoke-static {p1}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 34
    .line 35
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->g:I

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->M(I)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->requestAccessibilityFocus()Z

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 5
    .line 6
    const/16 v0, 0x71

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 18
    .line 19
    new-instance v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->t(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Landroid/widget/HorizontalScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 54
    .line 55
    const/4 v1, -0x1

    .line 56
    iget v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->g:I

    .line 57
    .line 58
    invoke-virtual {p1, v1, v2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->H(II)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->h:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 74
    .line 75
    .line 76
    return-void
.end method
