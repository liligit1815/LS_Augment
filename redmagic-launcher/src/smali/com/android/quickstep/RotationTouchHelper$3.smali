.class Lcom/android/quickstep/RotationTouchHelper$3;
.super Landroid/view/OrientationEventListener;
.source "RotationTouchHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/RotationTouchHelper;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/Z;Lcom/android/quickstep/SystemUiProxy;Lcom/android/launcher3/util/K;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/RotationTouchHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/RotationTouchHelper;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RotationTouchHelper$3;->this$0:Lcom/android/quickstep/RotationTouchHelper;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper$3;->this$0:Lcom/android/quickstep/RotationTouchHelper;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/android/quickstep/RotationTouchHelper;->h(Lcom/android/quickstep/RotationTouchHelper;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {p1, v0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRotationForUserDegreesRotated(FI)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper$3;->this$0:Lcom/android/quickstep/RotationTouchHelper;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/quickstep/RotationTouchHelper;->h(Lcom/android/quickstep/RotationTouchHelper;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ne p1, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper$3;->this$0:Lcom/android/quickstep/RotationTouchHelper;

    .line 22
    .line 23
    invoke-static {v0, p1}, Lcom/android/quickstep/RotationTouchHelper;->k(Lcom/android/quickstep/RotationTouchHelper;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper$3;->this$0:Lcom/android/quickstep/RotationTouchHelper;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Lcom/android/quickstep/RotationTouchHelper;->j(Lcom/android/quickstep/RotationTouchHelper;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/RotationTouchHelper$3;->this$0:Lcom/android/quickstep/RotationTouchHelper;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/quickstep/RotationTouchHelper;->d(Lcom/android/quickstep/RotationTouchHelper;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-ne p1, v0, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/quickstep/RotationTouchHelper$3;->this$0:Lcom/android/quickstep/RotationTouchHelper;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/android/quickstep/RotationTouchHelper;->n(Lcom/android/quickstep/RotationTouchHelper;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method
