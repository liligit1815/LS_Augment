.class Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;
.super Ljava/lang/Object;
.source "QuickstepLauncher.java"

# interfaces
.implements Lcom/android/launcher3/uioverrides/touchcontrollers/I;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uioverrides/QuickstepLauncher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isRecentsInteractive()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    sget-object v0, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public isRecentsModal()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/V3;->w:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public onUserControlledAnimationCreated(Lcom/android/launcher3/anim/q;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->g0(Lcom/android/launcher3/anim/q;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
