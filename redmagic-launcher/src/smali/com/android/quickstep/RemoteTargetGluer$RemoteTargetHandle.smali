.class public Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
.super Ljava/lang/Object;
.source "RemoteTargetGluer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/RemoteTargetGluer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RemoteTargetHandle"
.end annotation


# instance fields
.field private mPlaybackController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

.field private final mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

.field private final mTransformParams:Lcom/android/quickstep/util/TransformParams;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/util/TaskViewSimulator;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TaskViewSimulator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public getPlaybackController()Lcom/android/quickstep/util/AnimatorControllerWithResistance;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mPlaybackController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mTaskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransformParams()Lcom/android/quickstep/util/TransformParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPlaybackController(Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->mPlaybackController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 2
    .line 3
    return-void
.end method
