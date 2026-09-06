.class Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;
.super Landroid/animation/AnimatorListenerAdapter;
.source "KeyboardQuickSwitchView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->H(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

.field final synthetic h:I

.field final synthetic i:I

.field final synthetic j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->i:I

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestAccessibilityFocus()Z

    .line 7
    .line 8
    .line 9
    iget p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->h:I

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    if-ne p1, v0, :cond_3

    .line 13
    .line 14
    iget p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->i:I

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 21
    .line 22
    add-int/lit8 p1, p1, -0x1

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->M(I)Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->i:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->i:I

    .line 34
    .line 35
    sub-int/2addr p1, v0

    .line 36
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iget v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->i:I

    .line 41
    .line 42
    if-eq p1, v2, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    const/4 v0, 0x0

    .line 46
    :goto_1
    invoke-static {v1, p1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->y(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;IZ)V

    .line 47
    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_3
    iget v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->i:I

    .line 51
    .line 52
    if-gt v0, p1, :cond_6

    .line 53
    .line 54
    if-nez v0, :cond_4

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_5

    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 68
    .line 69
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->C(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 76
    .line 77
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->B(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_6
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_7

    .line 88
    .line 89
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 92
    .line 93
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->B(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;

    .line 100
    .line 101
    invoke-static {p1, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->C(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    :goto_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 105
    .line 106
    invoke-static {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Lcom/android/launcher3/taskbar/L$b;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    if-eqz p1, :cond_8

    .line 111
    .line 112
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->w(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Lcom/android/launcher3/taskbar/L$b;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$h;->i:I

    .line 119
    .line 120
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/L$b;->g(I)V

    .line 121
    .line 122
    .line 123
    :cond_8
    return-void
.end method
