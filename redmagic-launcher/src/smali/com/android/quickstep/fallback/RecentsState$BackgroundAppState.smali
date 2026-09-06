.class Lcom/android/quickstep/fallback/RecentsState$BackgroundAppState;
.super Lcom/android/quickstep/fallback/RecentsState;
.source "RecentsState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/fallback/RecentsState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BackgroundAppState"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/fallback/RecentsState;-><init>(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic getBlur(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/statemanager/a;->getBlur(Landroid/content/Context;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic getHistoryForState(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    invoke-super {p0, p1}, Lcom/android/quickstep/fallback/RecentsState;->getHistoryForState(Lcom/android/quickstep/fallback/RecentsState;)Lcom/android/quickstep/fallback/RecentsState;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getOverviewScaleAndOffset(Lcom/android/quickstep/views/RecentsViewContainer;)[F
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-static {p0}, Lf2/b;->O(Lcom/android/quickstep/views/RecentsView;)[F

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public bridge synthetic shouldDisableRestore()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->shouldDisableRestore()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic shouldPreserveDataStateOnReapply()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/statemanager/a;->shouldPreserveDataStateOnReapply()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
