.class public final Lcom/android/launcher3/taskbar/c5$a;
.super Lcom/android/launcher3/views/BaseDragLayer;
.source "VoiceInteractionWindowController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/c5;->j(Lcom/android/launcher3/taskbar/R1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/BaseDragLayer<",
        "Lcom/android/launcher3/taskbar/I1;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/R1;

.field final synthetic h:Lcom/android/launcher3/taskbar/c5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/c5;Lcom/android/launcher3/taskbar/I1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/c5$a;->g:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/taskbar/c5$a;->h:Lcom/android/launcher3/taskbar/c5;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    const/4 p2, 0x0

    .line 7
    invoke-direct {p0, p3, p1, p2}, Lcom/android/launcher3/views/BaseDragLayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5$a;->g:Lcom/android/launcher3/taskbar/R1;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->i0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5$a;->h:Lcom/android/launcher3/taskbar/c5;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/launcher3/taskbar/c5;->h(Lcom/android/launcher3/taskbar/c5;)Lcom/android/launcher3/taskbar/L1;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/L1;->a(Landroid/graphics/Canvas;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5$a;->h:Lcom/android/launcher3/taskbar/c5;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/taskbar/c5;->g(Lcom/android/launcher3/taskbar/c5;)Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5$a;->h:Lcom/android/launcher3/taskbar/c5;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/taskbar/c5;->g(Lcom/android/launcher3/taskbar/c5;)Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public recreateControllers()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lcom/android/launcher3/util/G2;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mControllers:[Lcom/android/launcher3/util/G2;

    .line 5
    .line 6
    return-void
.end method
