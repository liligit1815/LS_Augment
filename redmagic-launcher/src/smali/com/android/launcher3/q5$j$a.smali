.class Lcom/android/launcher3/q5$j$a;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5$j;->onAnimationStart(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field g:Z

.field final synthetic h:Lcom/android/launcher3/q5$j;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5$j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$j$a;->h:Lcom/android/launcher3/q5$j;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/q5$j$a;->g:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/q5$j$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/q5$j$a;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5$j$a;->h:Lcom/android/launcher3/q5$j;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/q5$j;->h:Lcom/android/launcher3/q5;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onDraw()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/q5$j$a;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/q5$j$a;->g:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/q5$j$a;->h:Lcom/android/launcher3/q5$j;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/android/launcher3/q5$j;->h:Lcom/android/launcher3/q5;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 14
    .line 15
    iget v0, v0, Lcom/android/launcher3/q5$j;->g:I

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/q5$j$a;->h:Lcom/android/launcher3/q5$j;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/android/launcher3/q5$j;->h:Lcom/android/launcher3/q5;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 25
    .line 26
    new-instance v1, Lcom/android/launcher3/s5;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/android/launcher3/s5;-><init>(Lcom/android/launcher3/q5$j$a;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method
