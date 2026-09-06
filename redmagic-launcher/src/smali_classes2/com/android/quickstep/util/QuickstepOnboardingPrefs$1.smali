.class Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;
.super Ljava/lang/Object;
.source "QuickstepOnboardingPrefs.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/QuickstepOnboardingPrefs;->setup(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
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
.field final synthetic val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field final synthetic val$stateManager:Lcom/android/launcher3/statemanager/d;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/statemanager/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onStateTransitionComplete(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    move-result-object v0

    iget-boolean v0, v0, Lcom/android/launcher3/util/C1;->g:Z

    .line 4
    iget-object v1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->A()Lcom/android/launcher3/statemanager/a;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/V3;

    if-eqz v0, :cond_0

    .line 5
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    if-eq p1, v2, :cond_2

    :cond_0
    if-nez v0, :cond_1

    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_1

    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    if-eq v1, p1, :cond_2

    :cond_1
    sget-object p1, Lcom/android/launcher3/util/H1;->c:Lcom/android/launcher3/util/H1$a;

    iget-object v0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/H1$a;->c(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 7
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    move-result-object p1

    sget-object v0, Lcom/android/launcher3/util/H1;->f:Lcom/android/launcher3/X;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 8
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->val$stateManager:Lcom/android/launcher3/statemanager/d;

    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    :cond_3
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$1;->onStateTransitionComplete(Lcom/android/launcher3/V3;)V

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
