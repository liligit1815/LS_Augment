.class Lcom/android/quickstep/util/AnimUtils$2;
.super Landroid/os/IRemoteCallback$Stub;
.source "AnimUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/AnimUtils;->completeRunnableListCallback(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/views/k;)Landroid/os/IRemoteCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$list:Lcom/android/launcher3/util/Y1;

.field final synthetic val$owner:Lcom/android/launcher3/views/k;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/views/k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/AnimUtils$2;->val$list:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/AnimUtils$2;->val$owner:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/os/IRemoteCallback$Stub;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/AnimUtils$2;->val$owner:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getOwnerCleanupSet()Lcom/android/launcher3/util/o3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Landroid/os/BinderUtils;->wrapLifecycle(Landroid/os/Binder;Lcom/android/launcher3/util/o3;)Landroid/os/Binder;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public sendResult(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/AnimUtils$2;->val$list:Lcom/android/launcher3/util/Y1;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/t;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
