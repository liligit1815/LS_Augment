.class Lcom/android/launcher3/V4$a;
.super Ljava/lang/Object;
.source "PagedView.java"

# interfaces
.implements Landroid/animation/LayoutTransition$TransitionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/V4;->onLayout(ZIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/V4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/V4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/V4$a;->a:Lcom/android/launcher3/V4;

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
    invoke-virtual {p1}, Landroid/animation/LayoutTransition;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/animation/LayoutTransition;->removeTransitionListener(Landroid/animation/LayoutTransition$TransitionListener;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/V4$a;->a:Lcom/android/launcher3/V4;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->updateMinAndMaxScrollX()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public startTransition(Landroid/animation/LayoutTransition;Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 0

    .line 1
    return-void
.end method
