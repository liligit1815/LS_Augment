.class Lcom/android/launcher3/taskbar/W4$a;
.super Ljava/lang/Object;
.source "TaskbarViewController.java"

# interfaces
.implements Landroid/animation/LayoutTransition$TransitionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/W4;->G()Landroid/animation/LayoutTransition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/W4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4$a;->a:Lcom/android/launcher3/taskbar/W4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public endTransition(Landroid/animation/LayoutTransition;Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    if-ne p4, p0, :cond_0

    .line 3
    .line 4
    instance-of p0, p3, Lcom/android/launcher3/BubbleTextView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {p3, p0}, Lcom/android/launcher3/BubbleTextView;->setLineIndicatorAnimStartDelay(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public startTransition(Landroid/animation/LayoutTransition;Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 0

    .line 1
    const/4 p1, 0x2

    .line 2
    if-ne p4, p1, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p3, p0}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3, p0}, Landroid/view/View;->setScaleX(F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p0}, Landroid/view/View;->setScaleY(F)V

    .line 12
    .line 13
    .line 14
    instance-of p0, p3, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 19
    .line 20
    const/16 p0, 0x15e

    .line 21
    .line 22
    invoke-virtual {p3, p0}, Lcom/android/launcher3/BubbleTextView;->setLineIndicatorAnimStartDelay(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/4 p1, 0x3

    .line 27
    if-ne p4, p1, :cond_1

    .line 28
    .line 29
    instance-of p1, p3, Lcom/android/launcher3/BubbleTextView;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4$a;->a:Lcom/android/launcher3/taskbar/W4;

    .line 36
    .line 37
    invoke-static {p0, p3}, Lcom/android/launcher3/taskbar/W4;->t(Lcom/android/launcher3/taskbar/W4;Lcom/android/launcher3/BubbleTextView;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method
