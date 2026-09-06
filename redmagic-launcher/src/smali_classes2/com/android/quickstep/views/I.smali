.class public final synthetic Lcom/android/quickstep/views/I;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/util/FloatProperty;

.field public final synthetic c:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/views/I;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/I;->b:Landroid/util/FloatProperty;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/I;->c:Lcom/android/quickstep/views/TaskView;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/I;->a:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/I;->b:Landroid/util/FloatProperty;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/I;->c:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    check-cast p1, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->a(ZLandroid/util/FloatProperty;Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
