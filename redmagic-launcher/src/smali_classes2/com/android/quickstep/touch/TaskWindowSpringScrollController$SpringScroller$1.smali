.class Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;
.super Ljava/lang/Object;
.source "TaskWindowSpringScrollController.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->addEndListener(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private count:I

.field private final maxCount:I

.field final synthetic this$1:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

.field final synthetic val$listener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

.field private xCancel:Z

.field private xValue:F

.field private xVelocity:F

.field private yCancel:Z

.field private yValue:F

.field private yVelocity:F


# direct methods
.method constructor <init>(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->this$1:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->val$listener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    iput p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->maxCount:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final getCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->count:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMaxCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public final getXCancel()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xCancel:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getXValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xValue:F

    .line 2
    .line 3
    return p0
.end method

.method public final getXVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public final getYCancel()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yCancel:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getYValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yValue:F

    .line 2
    .line 3
    return p0
.end method

.method public final getYVelocity()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yVelocity:F

    .line 2
    .line 3
    return p0
.end method

.method public onAnimationEnd(Lcom/android/quickstep/util/animation/DynamicAnimation;ZFF)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/animation/DynamicAnimation<",
            "*>;ZFF)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->this$1:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->this$0$:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->a(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;)Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getX()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iput-boolean p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xCancel:Z

    .line 20
    .line 21
    iput p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xValue:F

    .line 22
    .line 23
    iput p4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xVelocity:F

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->this$1:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->this$0$:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->a(Lcom/android/quickstep/touch/TaskWindowSpringScrollController;)Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->getY()Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iput-boolean p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yCancel:Z

    .line 45
    .line 46
    iput p3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yValue:F

    .line 47
    .line 48
    iput p4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yVelocity:F

    .line 49
    .line 50
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/animation/DynamicAnimation;->removeEndListener(Lcom/android/quickstep/util/animation/DynamicAnimation$OnAnimationEndListener;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->this$1:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->isRunning()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->count:I

    .line 62
    .line 63
    add-int/lit8 p2, p2, 0x1

    .line 64
    .line 65
    iput p2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->count:I

    .line 66
    .line 67
    const/4 p3, 0x2

    .line 68
    if-ge p2, p3, :cond_4

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    return-void

    .line 74
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->val$listener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->this$1:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 77
    .line 78
    iget-boolean v2, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xCancel:Z

    .line 79
    .line 80
    iget v3, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xValue:F

    .line 81
    .line 82
    iget v4, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xVelocity:F

    .line 83
    .line 84
    iget-boolean v5, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yCancel:Z

    .line 85
    .line 86
    iget v6, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yValue:F

    .line 87
    .line 88
    iget v7, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yVelocity:F

    .line 89
    .line 90
    invoke-interface/range {v0 .. v7}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;->onAnimationEnd(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;ZFFZFF)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->this$1:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->val$listener:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller;->removeEndListener(Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScrollEndListener;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final setCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->count:I

    .line 2
    .line 3
    return-void
.end method

.method public final setXCancel(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xCancel:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setXValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xValue:F

    .line 2
    .line 3
    return-void
.end method

.method public final setXVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->xVelocity:F

    .line 2
    .line 3
    return-void
.end method

.method public final setYCancel(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yCancel:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setYValue(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yValue:F

    .line 2
    .line 3
    return-void
.end method

.method public final setYVelocity(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$SpringScroller$1;->yVelocity:F

    .line 2
    .line 3
    return-void
.end method
