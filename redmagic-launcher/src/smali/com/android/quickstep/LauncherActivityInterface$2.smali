.class Lcom/android/quickstep/LauncherActivityInterface$2;
.super Ljava/lang/Object;
.source "LauncherActivityInterface.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherActivityInterface;->onExitOverview(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/LauncherActivityInterface;

.field final synthetic val$exitRunnable:Ljava/lang/Runnable;

.field final synthetic val$stateManager:Lcom/android/launcher3/statemanager/d;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherActivityInterface;Ljava/lang/Runnable;Lcom/android/launcher3/statemanager/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherActivityInterface$2;->this$0:Lcom/android/quickstep/LauncherActivityInterface;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/LauncherActivityInterface$2;->val$exitRunnable:Ljava/lang/Runnable;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/LauncherActivityInterface$2;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onStateTransitionComplete(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 2
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_0

    .line 3
    iget-object p1, p0, Lcom/android/quickstep/LauncherActivityInterface$2;->val$exitRunnable:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 4
    iget-object p1, p0, Lcom/android/quickstep/LauncherActivityInterface$2;->this$0:Lcom/android/quickstep/LauncherActivityInterface;

    invoke-static {p1}, Lcom/android/quickstep/LauncherActivityInterface;->f(Lcom/android/quickstep/LauncherActivityInterface;)V

    .line 5
    iget-object p1, p0, Lcom/android/quickstep/LauncherActivityInterface$2;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/LauncherActivityInterface$2;->onStateTransitionComplete(Lcom/android/launcher3/V3;)V

    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/d$g;->onStateTransitionStart(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
