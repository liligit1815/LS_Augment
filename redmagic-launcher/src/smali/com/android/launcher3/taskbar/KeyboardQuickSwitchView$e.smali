.class Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$e;
.super Landroid/view/ViewOutlineProvider;
.source "KeyboardQuickSwitchView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->L()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$e;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

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
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$e;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->r(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$e;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->u(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int v3, v0, v1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sub-int v5, v0, v3

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    sub-int v6, p1, v3

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$e;->a:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->v(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    int-to-float v7, p0

    .line 34
    move v4, v3

    .line 35
    move-object v2, p2

    .line 36
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
