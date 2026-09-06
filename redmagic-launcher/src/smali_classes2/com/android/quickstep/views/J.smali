.class public final synthetic Lcom/android/quickstep/views/J;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Landroidx/dynamicanimation/animation/g;

.field public final synthetic b:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(Landroidx/dynamicanimation/animation/g;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/J;->a:Landroidx/dynamicanimation/animation/g;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/J;->b:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/J;->a:Landroidx/dynamicanimation/animation/g;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/J;->b:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    check-cast p1, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->b(Landroidx/dynamicanimation/animation/g;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
