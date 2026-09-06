.class public final Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;
.super Ljava/lang/Object;
.source "TaskWindowSpringScrollController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/touch/TaskWindowSpringScrollController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "SpringScroller"
.end annotation


# instance fields
.field private previousXStartValue:Ljava/lang/Float;

.field final this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

.field final synthetic this$0$:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

.field private final wrapperEndListenerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;",
            "Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;",
            ">;"
        }
    .end annotation
.end field

.field private final x:Lcom/android/quickstep/util/animation/SpringAnimation;

.field private final y:Lcom/android/quickstep/util/animation/SpringAnimation;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/touch/TaskWindowSpringScrollController;Lcom/android/quickstep/util/animation/SpringAnimation;Lcom/android/quickstep/util/animation/SpringAnimation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->this$0$:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, "x"

    .line 7
    .line 8
    invoke-static {p3, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "y"

    .line 12
    .line 13
    invoke-static {p4, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->this$0:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->x:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 19
    .line 20
    iput-object p4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->y:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 21
    .line 22
    new-instance p1, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->wrapperEndListenerMap:Ljava/util/HashMap;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final addEndListener(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V
    .locals 2

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;-><init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->x:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->addEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->y:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->addEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)Lcom/android/quickstep/util/animation/DynamicAnimation;

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->wrapperEndListenerMap:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final cancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->x:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->y:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->cancel()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final end()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->x:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/SpringAnimation;->skipToEnd()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->y:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimation;->skipToEnd()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final getPreviousXStartValue()Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->previousXStartValue:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getX()Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->x:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getY()Lcom/android/quickstep/util/animation/SpringAnimation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->y:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isRunning()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->x:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->y:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public final removeEndListener(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->wrapperEndListenerMap:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lkotlin/jvm/internal/H;->c(Ljava/lang/Object;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->x:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->y:Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final setPreviousXStartValue(Ljava/lang/Float;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->previousXStartValue:Ljava/lang/Float;

    .line 2
    .line 3
    return-void
.end method
