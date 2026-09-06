.class Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;
.super Ljava/lang/Object;
.source "KeyboardQuickSwitchView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->L()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, p0, v1}, Landroid/widget/HorizontalScrollView;->smoothScrollBy(II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->q(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Landroid/widget/HorizontalScrollView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    neg-int p0, p0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, p0, v1}, Landroid/widget/HorizontalScrollView;->smoothScrollBy(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->m(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/taskbar/D;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/D;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->A(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;ZLjava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;->g:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 22
    .line 23
    new-instance v1, Lcom/android/launcher3/taskbar/E;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/E;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$b;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->A(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;ZLjava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
