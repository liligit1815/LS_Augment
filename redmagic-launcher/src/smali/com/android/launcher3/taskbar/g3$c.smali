.class Lcom/android/launcher3/taskbar/g3$c;
.super Ljava/lang/Object;
.source "TaskbarManager.java"

# interfaces
.implements LC2/i$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/g3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/g3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3$c;->g:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTransitionFinished()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$c;->g:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    const-string v0, "fold/unfold transition finished getting called."

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onTransitionFinishing()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$c;->g:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    const-string v0, "fold/unfold transition finishing getting called."

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onTransitionProgress(F)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$c;->g:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "fold/unfold transition progress getting called. | progress="

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onTransitionStarted()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$c;->g:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    const-string v0, "fold/unfold transition started getting called."

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
