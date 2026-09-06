.class public Lcom/android/quickstep/fallback/RecentsDragLayer;
.super Lcom/android/launcher3/views/BaseDragLayer;
.source "RecentsDragLayer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ":",
        "Lcom/android/launcher3/statemanager/i<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;>",
        "Lcom/android/launcher3/views/BaseDragLayer<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final mTaskViewRecentsTouchContext:Lcom/android/launcher3/uioverrides/touchcontrollers/I;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/BaseDragLayer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    .line 4
    .line 5
    new-instance p1, Lcom/android/quickstep/fallback/RecentsDragLayer$1;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lcom/android/quickstep/fallback/RecentsDragLayer$1;-><init>(Lcom/android/quickstep/fallback/RecentsDragLayer;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/quickstep/fallback/RecentsDragLayer;->mTaskViewRecentsTouchContext:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 11
    .line 12
    return-void
.end method

.method static synthetic access$000(Lcom/android/quickstep/fallback/RecentsDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic access$100(Lcom/android/quickstep/fallback/RecentsDragLayer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public recreateControllers()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    new-array v0, v0, [Lcom/android/launcher3/util/G2;

    .line 12
    .line 13
    new-instance v4, Lcom/android/launcher3/uioverrides/touchcontrollers/H;

    .line 14
    .line 15
    iget-object v5, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 16
    .line 17
    iget-object v6, p0, Lcom/android/quickstep/fallback/RecentsDragLayer;->mTaskViewRecentsTouchContext:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 18
    .line 19
    invoke-direct {v4, v5, v6}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V

    .line 20
    .line 21
    .line 22
    aput-object v4, v0, v3

    .line 23
    .line 24
    new-instance v3, Lcom/android/launcher3/uioverrides/touchcontrollers/F;

    .line 25
    .line 26
    iget-object v4, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/android/quickstep/fallback/RecentsDragLayer;->mTaskViewRecentsTouchContext:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 29
    .line 30
    invoke-direct {v3, v4, v5}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;-><init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V

    .line 31
    .line 32
    .line 33
    aput-object v3, v0, v2

    .line 34
    .line 35
    new-instance v2, Lcom/android/quickstep/fallback/FallbackNavBarTouchController;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 38
    .line 39
    check-cast v3, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 40
    .line 41
    invoke-direct {v2, v3}, Lcom/android/quickstep/fallback/FallbackNavBarTouchController;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 42
    .line 43
    .line 44
    aput-object v2, v0, v1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-array v0, v1, [Lcom/android/launcher3/util/G2;

    .line 48
    .line 49
    new-instance v1, Lcom/android/launcher3/uioverrides/touchcontrollers/K;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 52
    .line 53
    iget-object v5, p0, Lcom/android/quickstep/fallback/RecentsDragLayer;->mTaskViewRecentsTouchContext:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 54
    .line 55
    invoke-direct {v1, v4, v5}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;-><init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V

    .line 56
    .line 57
    .line 58
    aput-object v1, v0, v3

    .line 59
    .line 60
    new-instance v1, Lcom/android/quickstep/fallback/FallbackNavBarTouchController;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/android/launcher3/views/BaseDragLayer;->mContainer:Landroid/content/Context;

    .line 63
    .line 64
    check-cast v3, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 65
    .line 66
    invoke-direct {v1, v3}, Lcom/android/quickstep/fallback/FallbackNavBarTouchController;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 67
    .line 68
    .line 69
    aput-object v1, v0, v2

    .line 70
    .line 71
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/views/BaseDragLayer;->mControllers:[Lcom/android/launcher3/util/G2;

    .line 72
    .line 73
    return-void
.end method
