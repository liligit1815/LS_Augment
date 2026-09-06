.class Lcom/android/launcher3/taskbar/M0$c;
.super Ljava/lang/Object;
.source "NavbarButtonsViewController.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/M0;->E0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/M0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0$c;->g:Lcom/android/launcher3/taskbar/M0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$c;->g:Lcom/android/launcher3/taskbar/M0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/M0;->P(Lcom/android/launcher3/taskbar/M0;)Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0$c;->g:Lcom/android/launcher3/taskbar/M0;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/taskbar/M0;->O(Lcom/android/launcher3/taskbar/M0;)Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$c;->g:Lcom/android/launcher3/taskbar/M0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/taskbar/M0;->P(Lcom/android/launcher3/taskbar/M0;)Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$c;->g:Lcom/android/launcher3/taskbar/M0;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/taskbar/M0;->P(Lcom/android/launcher3/taskbar/M0;)Lcom/android/launcher3/views/BaseDragLayer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0$c;->g:Lcom/android/launcher3/taskbar/M0;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/taskbar/M0;->O(Lcom/android/launcher3/taskbar/M0;)Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
