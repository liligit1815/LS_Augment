.class public final synthetic Lcom/android/quickstep/G4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/RotationTouchHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RotationTouchHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/G4;->a:Lcom/android/quickstep/RotationTouchHelper;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/G4;->a:Lcom/android/quickstep/RotationTouchHelper;

    .line 2
    .line 3
    check-cast p1, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic;->a(Lcom/android/quickstep/RotationTouchHelper;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
