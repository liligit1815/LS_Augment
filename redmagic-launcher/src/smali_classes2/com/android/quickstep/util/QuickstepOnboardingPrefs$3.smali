.class Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;
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


# static fields
.field private static final MAX_NUM_SWIPES_TO_TRIGGER_EDU:I = 0x3


# instance fields
.field private mCount:I

.field private mShouldIncreaseCount:Z

.field final synthetic val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mCount:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onStateTransitionComplete(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 2
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    const/16 v1, 0x200

    const/4 v2, 0x0

    if-ne p1, v0, :cond_1

    .line 3
    iget p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mCount:I

    const/4 v0, 0x3

    if-lt p1, v0, :cond_3

    .line 4
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-static {p1, v1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    move-result-object p1

    if-nez p1, :cond_0

    .line 5
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/H5;->M0()Z

    move-result p1

    if-nez p1, :cond_0

    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->show(Lcom/android/launcher3/C2;)V

    .line 7
    :cond_0
    iput v2, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mCount:I

    return-void

    .line 8
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mShouldIncreaseCount:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_2

    .line 9
    iget v0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mCount:I

    goto :goto_0

    .line 10
    :cond_2
    iput v2, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mCount:I

    .line 11
    :goto_0
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_3

    .line 12
    iget-object p0, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-static {p0, v1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/views/AllAppsEduView;

    if-eqz p0, :cond_3

    .line 13
    invoke-virtual {p0, v2}, Lcom/android/launcher3/a;->close(Z)V

    :cond_3
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->onStateTransitionComplete(Lcom/android/launcher3/V3;)V

    return-void
.end method

.method public onStateTransitionStart(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 2
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_0

    return-void

    .line 3
    :cond_0
    sget-object v0, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getNextPage()I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->val$launcher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->I5()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->mShouldIncreaseCount:Z

    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs$3;->onStateTransitionStart(Lcom/android/launcher3/V3;)V

    return-void
.end method
