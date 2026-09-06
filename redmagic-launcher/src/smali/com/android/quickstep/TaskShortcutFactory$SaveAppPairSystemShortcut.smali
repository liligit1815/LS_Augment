.class public Lcom/android/quickstep/TaskShortcutFactory$SaveAppPairSystemShortcut;
.super Lcom/android/launcher3/popup/P;
.source "TaskShortcutFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskShortcutFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SaveAppPairSystemShortcut"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/popup/P<",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">;"
    }
.end annotation


# instance fields
.field private final mTaskView:Lcom/android/quickstep/views/GroupedTaskView;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/GroupedTaskView;I)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    const v2, 0x7f14034d

    .line 6
    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-object v3, p1

    .line 10
    move-object v5, p2

    .line 11
    move v1, p3

    .line 12
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object v5, v0, Lcom/android/quickstep/TaskShortcutFactory$SaveAppPairSystemShortcut;->mTaskView:Lcom/android/quickstep/views/GroupedTaskView;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 7
    .line 8
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitSelectStateController;->getAppPairsController()Lcom/android/quickstep/util/AppPairsController;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/android/quickstep/TaskShortcutFactory$SaveAppPairSystemShortcut;->mTaskView:Lcom/android/quickstep/views/GroupedTaskView;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/AppPairsController;->saveAppPair(Lcom/android/quickstep/views/GroupedTaskView;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
