.class Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;
.super Landroid/view/ViewOutlineProvider;
.source "KeyboardQuickSwitchView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->onAnimationStart(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 9

    .line 1
    new-instance p1, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v1, v1

    .line 20
    iget-object v2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->o(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Lcom/android/launcher3/anim/d;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget v3, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 29
    .line 30
    const/high16 v7, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-static {}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->E()Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    .line 35
    move-result-object v8

    .line 36
    const/4 v4, 0x0

    .line 37
    const/high16 v5, 0x3f800000    # 1.0f

    .line 38
    .line 39
    const v6, 0x3ee66666    # 0.45f

    .line 40
    .line 41
    .line 42
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    mul-float/2addr v1, v2

    .line 47
    float-to-int v1, v1

    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->p(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    int-to-float v0, v0

    .line 61
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g$a;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$g;->j:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 64
    .line 65
    invoke-static {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->o(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Lcom/android/launcher3/anim/d;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iget v1, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 70
    .line 71
    invoke-static {}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->E()Landroid/view/animation/Interpolator;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    const/4 v2, 0x0

    .line 76
    const/high16 v3, 0x3f800000    # 1.0f

    .line 77
    .line 78
    const/high16 v4, 0x3e800000    # 0.25f

    .line 79
    .line 80
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    mul-float/2addr v0, p0

    .line 85
    invoke-virtual {p2, p1, v0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
