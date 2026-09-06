.class public Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;
.super Ljava/lang/Object;
.source "TouchInteractionService.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TouchInteractionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AngleSensorEventListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/TouchInteractionService;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/O;->j4(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    aget p1, p1, v0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 16
    .line 17
    invoke-static {v0, p1}, Lcom/android/quickstep/TouchInteractionService;->x(Lcom/android/quickstep/TouchInteractionService;F)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 22
    .line 23
    iget v2, v1, Lcom/android/quickstep/TouchInteractionService;->mCurrentTouchY:F

    .line 24
    .line 25
    invoke-static {v1, v2}, Lcom/android/quickstep/TouchInteractionService;->w(Lcom/android/quickstep/TouchInteractionService;F)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 30
    .line 31
    iget v3, v2, Lcom/android/quickstep/TouchInteractionService;->mLastAngle:F

    .line 32
    .line 33
    cmpl-float v3, v3, p1

    .line 34
    .line 35
    if-lez v3, :cond_1

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-static {v2}, Lx1/O;->d5(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$AngleSensorEventListener;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 45
    .line 46
    iput p1, p0, Lcom/android/quickstep/TouchInteractionService;->mLastAngle:F

    .line 47
    .line 48
    return-void
.end method
