.class Lcom/android/quickstep/util/AnimUtils$1;
.super Ljava/lang/Object;
.source "AnimUtils.java"

# interfaces
.implements LW/b;


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


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/Y1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/AnimUtils$1;->val$list:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic onCreate(LW/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, LW/b;->onCreate(LW/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDestroy(LW/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AnimUtils$1;->val$list:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onPause(LW/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, LW/b;->onPause(LW/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onResume(LW/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, LW/b;->onResume(LW/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onStart(LW/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, LW/b;->onStart(LW/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic onStop(LW/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, LW/b;->onStop(LW/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
