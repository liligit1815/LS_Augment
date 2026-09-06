.class Lcom/android/launcher3/taskbar/M0$b;
.super Landroid/view/View$AccessibilityDelegate;
.source "NavbarButtonsViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/M0;->U0(Landroid/view/View;Landroid/view/View$AccessibilityDelegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/View$AccessibilityDelegate;

.field final synthetic b:Lcom/android/launcher3/taskbar/M0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/M0;Landroid/view/View$AccessibilityDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0$b;->b:Lcom/android/launcher3/taskbar/M0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0$b;->a:Landroid/view/View$AccessibilityDelegate;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0$b;->a:Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    const/16 v0, 0x10

    .line 9
    .line 10
    if-ne p2, v0, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$b;->b:Lcom/android/launcher3/taskbar/M0;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/taskbar/M0;->L(Lcom/android/launcher3/taskbar/M0;)Lcom/android/launcher3/taskbar/R1;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p1, p2, p2}, Lcom/android/launcher3/taskbar/l3;->t(IZ)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0$b;->b:Lcom/android/launcher3/taskbar/M0;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/android/launcher3/taskbar/M0;->L(Lcom/android/launcher3/taskbar/M0;)Lcom/android/launcher3/taskbar/R1;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/l3;->t(IZ)V

    .line 34
    .line 35
    .line 36
    return p1

    .line 37
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method
