.class Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;
.super Ljava/lang/Object;
.source "KeyboardQuickSwitchView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->onAnimationStart(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->k(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-le v0, v1, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->s(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/ImageButton;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->l(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/ImageButton;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->D(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
