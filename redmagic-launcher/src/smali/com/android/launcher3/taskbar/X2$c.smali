.class Lcom/android/launcher3/taskbar/X2$c;
.super Ljava/lang/Object;
.source "TaskbarLauncherStateController.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/X2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/X2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/X2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2$c;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$c;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/X2;->q(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/statemanager/d$g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Lcom/android/quickstep/fallback/RecentsStateUtilsKt;->toLauncherState(Lcom/android/quickstep/fallback/RecentsState;)Lcom/android/launcher3/V3;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Lcom/android/launcher3/statemanager/d$g;->onStateTransitionComplete(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$c;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/X2;->q(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/statemanager/d$g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Lcom/android/quickstep/fallback/RecentsStateUtilsKt;->toLauncherState(Lcom/android/quickstep/fallback/RecentsState;)Lcom/android/launcher3/V3;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Lcom/android/launcher3/statemanager/d$g;->onStateTransitionStart(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/X2$c;->a(Lcom/android/quickstep/fallback/RecentsState;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/X2$c;->b(Lcom/android/quickstep/fallback/RecentsState;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
