.class public final Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;
.super Ljava/lang/Object;
.source "RecentsAnimationDeviceState_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/RecentsAnimationDeviceState;",
        ">;"
    }
.end annotation


# instance fields
.field private final contextProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final contextualSearchStateManagerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/quickstep/util/ContextualSearchStateManager;",
            ">;"
        }
    .end annotation
.end field

.field private final displayControllerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;"
        }
    .end annotation
.end field

.field private final exclusionManagerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/quickstep/util/GestureExclusionManager;",
            ">;"
        }
    .end annotation
.end field

.field private final lifeCycleProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field

.field private final rotationTouchHelperProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/quickstep/RotationTouchHelper;",
            ">;"
        }
    .end annotation
.end field

.field private final settingsCacheProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/util/GestureExclusionManager;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/util/ContextualSearchStateManager;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/RotationTouchHelper;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->contextProvider:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->exclusionManagerProvider:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->displayControllerProvider:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->contextualSearchStateManagerProvider:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->rotationTouchHelperProvider:Lg4/a;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->settingsCacheProvider:Lg4/a;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->lifeCycleProvider:Lg4/a;

    .line 17
    .line 18
    return-void
.end method

.method public static create(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/util/GestureExclusionManager;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/util/ContextualSearchStateManager;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/RotationTouchHelper;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static newInstance(Landroid/content/Context;Lcom/android/quickstep/util/GestureExclusionManager;Lcom/android/launcher3/util/Z;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/quickstep/RotationTouchHelper;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/RecentsAnimationDeviceState;
    .locals 8

    .line 1
    new-instance v0, Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/RecentsAnimationDeviceState;-><init>(Landroid/content/Context;Lcom/android/quickstep/util/GestureExclusionManager;Lcom/android/launcher3/util/Z;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/quickstep/RotationTouchHelper;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/K;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/quickstep/RecentsAnimationDeviceState;
    .locals 8

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->contextProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/content/Context;

    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->exclusionManagerProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/android/quickstep/util/GestureExclusionManager;

    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->displayControllerProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/android/launcher3/util/Z;

    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->contextualSearchStateManagerProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/android/quickstep/util/ContextualSearchStateManager;

    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->rotationTouchHelperProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/android/quickstep/RotationTouchHelper;

    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->settingsCacheProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/android/launcher3/util/p2;

    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->lifeCycleProvider:Lg4/a;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lcom/android/launcher3/util/K;

    invoke-static/range {v1 .. v7}, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->newInstance(Landroid/content/Context;Lcom/android/quickstep/util/GestureExclusionManager;Lcom/android/launcher3/util/Z;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/quickstep/RotationTouchHelper;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState_Factory;->get()Lcom/android/quickstep/RecentsAnimationDeviceState;

    move-result-object p0

    return-object p0
.end method
