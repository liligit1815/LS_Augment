.class Lcom/android/quickstep/RecentsAnimationDeviceState$1;
.super Ljava/lang/Object;
.source "RecentsAnimationDeviceState.java"

# interfaces
.implements Lcom/android/systemui/shared/system/TaskStackChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/RecentsAnimationDeviceState;-><init>(Landroid/content/Context;Lcom/android/quickstep/util/GestureExclusionManager;Lcom/android/launcher3/util/Z;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/quickstep/RotationTouchHelper;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/K;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/RecentsAnimationDeviceState;


# direct methods
.method constructor <init>(Lcom/android/quickstep/RecentsAnimationDeviceState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState$1;->this$0:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onActivityPinned(Ljava/lang/String;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState$1;->this$0:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->R(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onActivityUnpinned()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState$1;->this$0:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->R(Lcom/android/quickstep/RecentsAnimationDeviceState;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
