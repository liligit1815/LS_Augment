.class public interface abstract Lcom/android/launcher3/statemanager/i;
.super Ljava/lang/Object;
.source "StatefulContainer.java"

# interfaces
.implements Lcom/android/launcher3/views/k;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<STATE_TYPE::",
        "Lcom/android/launcher3/statemanager/a<",
        "TSTATE_TYPE;>;>",
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/views/k;"
    }
.end annotation


# virtual methods
.method public abstract collectStateHandlers(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/statemanager/d$f<",
            "TSTATE_TYPE;>;>;)V"
        }
    .end annotation
.end method

.method public createAtomicAnimationFactory()Lcom/android/launcher3/statemanager/d$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d$d<",
            "TSTATE_TYPE;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/launcher3/statemanager/d$d;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lcom/android/launcher3/statemanager/d$d;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public abstract getStateManager()Lcom/android/launcher3/statemanager/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d<",
            "TSTATE_TYPE;*>;"
        }
    .end annotation
.end method

.method public handleConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    return-void
.end method

.method public isInState(Lcom/android/launcher3/statemanager/a;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSTATE_TYPE;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public onStateSetEnd(Lcom/android/launcher3/statemanager/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSTATE_TYPE;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public onStateSetStart(Lcom/android/launcher3/statemanager/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSTATE_TYPE;)V"
        }
    .end annotation

    .line 1
    sget v0, Lcom/android/launcher3/V3;->j:I

    .line 2
    .line 3
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/a;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/a;->hasFlag(I)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    xor-int/2addr p1, v0

    .line 15
    const/16 v0, 0x101

    .line 16
    .line 17
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public abstract shouldAnimateStateChange()Z
.end method
