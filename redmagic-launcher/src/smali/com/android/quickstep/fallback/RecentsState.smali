.class public Lcom/android/quickstep/fallback/RecentsState;
.super Ljava/lang/Object;
.source "RecentsState.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/fallback/RecentsState$ModalState;,
        Lcom/android/quickstep/fallback/RecentsState$BackgroundAppState;,
        Lcom/android/quickstep/fallback/RecentsState$LauncherState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/a<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;"
    }
.end annotation


# static fields
.field public static final BACKGROUND_APP:Lcom/android/quickstep/fallback/RecentsState;

.field public static final BACKGROUND_APP_ORDINAL:I = 0x2

.field public static final BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

.field public static final BG_LAUNCHER_ORDINAL:I = 0x4

.field public static final DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

.field public static final DEFAULT_STATE_ORDINAL:I = 0x0

.field private static final FLAG_ADD_DESK_BUTTON:I

.field private static final FLAG_CLEAR_ALL_BUTTON:I

.field private static final FLAG_DETACH_DESKTOP_CAROUSEL:I

.field private static final FLAG_FULL_SCREEN:I

.field private static final FLAG_LIVE_TILE:I

.field private static final FLAG_MODAL:I

.field private static final FLAG_OVERVIEW_ACTIONS:I

.field private static final FLAG_RECENTS_VIEW_VISIBLE:I

.field private static final FLAG_SCRIM:I

.field private static final FLAG_SHOW_AS_GRID:I

.field private static final FLAG_SHOW_EXPLODED_DESKTOP_VIEW:I

.field private static final FLAG_TASK_THUMBNAIL_SPLASH:I

.field public static final HOME:Lcom/android/quickstep/fallback/RecentsState;

.field public static final HOME_STATE_ORDINAL:I = 0x3

.field public static final MODAL_TASK:Lcom/android/quickstep/fallback/RecentsState;

.field public static final MODAL_TASK_ORDINAL:I = 0x1

.field private static final NO_OFFSET:F = 0.0f

.field private static final NO_SCALE:F = 1.0f

.field public static final OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

.field public static final OVERVIEW_SPLIT_SELECT_ORDINAL:I = 0x5

.field private static final sAllStates:[Lcom/android/quickstep/fallback/RecentsState;


# instance fields
.field private final mFlags:I

.field public final ordinal:I


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    sput v1, Lcom/android/quickstep/fallback/RecentsState;->FLAG_MODAL:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-static {v2}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    sput v3, Lcom/android/quickstep/fallback/RecentsState;->FLAG_CLEAR_ALL_BUTTON:I

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    invoke-static {v3}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    sput v4, Lcom/android/quickstep/fallback/RecentsState;->FLAG_FULL_SCREEN:I

    .line 21
    .line 22
    const/4 v5, 0x3

    .line 23
    invoke-static {v5}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    sput v6, Lcom/android/quickstep/fallback/RecentsState;->FLAG_OVERVIEW_ACTIONS:I

    .line 28
    .line 29
    const/4 v7, 0x4

    .line 30
    invoke-static {v7}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 31
    .line 32
    .line 33
    move-result v8

    .line 34
    sput v8, Lcom/android/quickstep/fallback/RecentsState;->FLAG_SHOW_AS_GRID:I

    .line 35
    .line 36
    const/4 v9, 0x5

    .line 37
    invoke-static {v9}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 38
    .line 39
    .line 40
    move-result v10

    .line 41
    sput v10, Lcom/android/quickstep/fallback/RecentsState;->FLAG_SCRIM:I

    .line 42
    .line 43
    const/4 v11, 0x6

    .line 44
    invoke-static {v11}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 45
    .line 46
    .line 47
    move-result v12

    .line 48
    sput v12, Lcom/android/quickstep/fallback/RecentsState;->FLAG_LIVE_TILE:I

    .line 49
    .line 50
    const/4 v13, 0x7

    .line 51
    invoke-static {v13}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 52
    .line 53
    .line 54
    move-result v13

    .line 55
    sput v13, Lcom/android/quickstep/fallback/RecentsState;->FLAG_RECENTS_VIEW_VISIBLE:I

    .line 56
    .line 57
    const/16 v14, 0x8

    .line 58
    .line 59
    invoke-static {v14}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 60
    .line 61
    .line 62
    move-result v14

    .line 63
    sput v14, Lcom/android/quickstep/fallback/RecentsState;->FLAG_TASK_THUMBNAIL_SPLASH:I

    .line 64
    .line 65
    const/16 v15, 0x9

    .line 66
    .line 67
    invoke-static {v15}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 68
    .line 69
    .line 70
    move-result v15

    .line 71
    sput v15, Lcom/android/quickstep/fallback/RecentsState;->FLAG_DETACH_DESKTOP_CAROUSEL:I

    .line 72
    .line 73
    const/16 v16, 0xa

    .line 74
    .line 75
    invoke-static/range {v16 .. v16}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 76
    .line 77
    .line 78
    move-result v16

    .line 79
    sput v16, Lcom/android/quickstep/fallback/RecentsState;->FLAG_ADD_DESK_BUTTON:I

    .line 80
    .line 81
    const/16 v17, 0xb

    .line 82
    .line 83
    invoke-static/range {v17 .. v17}, Lcom/android/launcher3/statemanager/a;->a(I)I

    .line 84
    .line 85
    .line 86
    move-result v17

    .line 87
    sput v17, Lcom/android/quickstep/fallback/RecentsState;->FLAG_SHOW_EXPLODED_DESKTOP_VIEW:I

    .line 88
    .line 89
    new-array v11, v11, [Lcom/android/quickstep/fallback/RecentsState;

    .line 90
    .line 91
    sput-object v11, Lcom/android/quickstep/fallback/RecentsState;->sAllStates:[Lcom/android/quickstep/fallback/RecentsState;

    .line 92
    .line 93
    new-instance v11, Lcom/android/quickstep/fallback/RecentsState;

    .line 94
    .line 95
    or-int/lit8 v18, v6, 0x2

    .line 96
    .line 97
    or-int v18, v18, v8

    .line 98
    .line 99
    or-int v18, v18, v10

    .line 100
    .line 101
    or-int v18, v18, v12

    .line 102
    .line 103
    or-int v18, v18, v13

    .line 104
    .line 105
    or-int v16, v18, v16

    .line 106
    .line 107
    or-int v9, v16, v17

    .line 108
    .line 109
    invoke-direct {v11, v0, v9}, Lcom/android/quickstep/fallback/RecentsState;-><init>(II)V

    .line 110
    .line 111
    .line 112
    sput-object v11, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    .line 113
    .line 114
    new-instance v9, Lcom/android/quickstep/fallback/RecentsState$ModalState;

    .line 115
    .line 116
    or-int/2addr v6, v3

    .line 117
    or-int/2addr v1, v6

    .line 118
    or-int/2addr v1, v8

    .line 119
    or-int/2addr v1, v10

    .line 120
    or-int/2addr v1, v12

    .line 121
    or-int/2addr v1, v13

    .line 122
    or-int v1, v1, v17

    .line 123
    .line 124
    invoke-direct {v9, v2, v1}, Lcom/android/quickstep/fallback/RecentsState$ModalState;-><init>(II)V

    .line 125
    .line 126
    .line 127
    sput-object v9, Lcom/android/quickstep/fallback/RecentsState;->MODAL_TASK:Lcom/android/quickstep/fallback/RecentsState;

    .line 128
    .line 129
    new-instance v1, Lcom/android/quickstep/fallback/RecentsState$BackgroundAppState;

    .line 130
    .line 131
    or-int/lit8 v2, v4, 0x3

    .line 132
    .line 133
    or-int/2addr v2, v13

    .line 134
    or-int/2addr v2, v14

    .line 135
    or-int/2addr v2, v15

    .line 136
    invoke-direct {v1, v3, v2}, Lcom/android/quickstep/fallback/RecentsState$BackgroundAppState;-><init>(II)V

    .line 137
    .line 138
    .line 139
    sput-object v1, Lcom/android/quickstep/fallback/RecentsState;->BACKGROUND_APP:Lcom/android/quickstep/fallback/RecentsState;

    .line 140
    .line 141
    new-instance v1, Lcom/android/quickstep/fallback/RecentsState;

    .line 142
    .line 143
    invoke-direct {v1, v5, v0}, Lcom/android/quickstep/fallback/RecentsState;-><init>(II)V

    .line 144
    .line 145
    .line 146
    sput-object v1, Lcom/android/quickstep/fallback/RecentsState;->HOME:Lcom/android/quickstep/fallback/RecentsState;

    .line 147
    .line 148
    new-instance v1, Lcom/android/quickstep/fallback/RecentsState$LauncherState;

    .line 149
    .line 150
    invoke-direct {v1, v7, v0}, Lcom/android/quickstep/fallback/RecentsState$LauncherState;-><init>(II)V

    .line 151
    .line 152
    .line 153
    sput-object v1, Lcom/android/quickstep/fallback/RecentsState;->BG_LAUNCHER:Lcom/android/quickstep/fallback/RecentsState;

    .line 154
    .line 155
    new-instance v0, Lcom/android/quickstep/fallback/RecentsState;

    .line 156
    .line 157
    or-int v1, v8, v10

    .line 158
    .line 159
    or-int/2addr v1, v13

    .line 160
    sget v2, Lcom/android/launcher3/V3;->j:I

    .line 161
    .line 162
    or-int/2addr v1, v2

    .line 163
    or-int/2addr v1, v3

    .line 164
    or-int v1, v1, v17

    .line 165
    .line 166
    const/4 v2, 0x5

    .line 167
    invoke-direct {v0, v2, v1}, Lcom/android/quickstep/fallback/RecentsState;-><init>(II)V

    .line 168
    .line 169
    .line 170
    sput-object v0, Lcom/android/quickstep/fallback/RecentsState;->OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

    .line 171
    .line 172
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/fallback/RecentsState;->ordinal:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/fallback/RecentsState;->mFlags:I

    .line 7
    .line 8
    sget-object p2, Lcom/android/quickstep/fallback/RecentsState;->sAllStates:[Lcom/android/quickstep/fallback/RecentsState;

    .line 9
    .line 10
    aput-object p0, p2, p1

    .line 11
    .line 12
    return-void
.end method

.method public static stateFromOrdinal(I)Lcom/android/quickstep/fallback/RecentsState;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->sAllStates:[Lcom/android/quickstep/fallback/RecentsState;

    .line 2
    .line 3
    aget-object p0, v0, p0

    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public detachDesktopCarousel()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_DETACH_DESKTOP_CAROUSEL:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->n()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_SHOW_AS_GRID:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->b()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    :cond_1
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_2
    const/4 p0, 0x0

    .line 22
    return p0
.end method

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

.method public getHistoryForState(Lcom/android/quickstep/fallback/RecentsState;)Lcom/android/quickstep/fallback/RecentsState;
    .locals 0

    .line 2
    sget-object p0, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    return-object p0
.end method

.method public bridge synthetic getHistoryForState(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/RecentsState;->getHistoryForState(Lcom/android/quickstep/fallback/RecentsState;)Lcom/android/quickstep/fallback/RecentsState;

    move-result-object p0

    return-object p0
.end method

.method public getOverviewModalness()F
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_MODAL:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/high16 p0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public getOverviewScaleAndOffset(Lcom/android/quickstep/views/RecentsViewContainer;)[F
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    fill-array-data p0, :array_0

    .line 5
    .line 6
    .line 7
    return-object p0

    .line 8
    nop

    .line 9
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getScrimColor(Landroid/content/Context;)I
    .locals 0

    .line 1
    sget p1, Lcom/android/quickstep/fallback/RecentsState;->FLAG_SCRIM:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/H5$g;->a()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p0}, Lx1/O;->G0(I)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public getTransitionDuration(Lcom/android/launcher3/views/k;Z)I
    .locals 0

    .line 1
    const/16 p0, 0xfa

    .line 2
    .line 3
    return p0
.end method

.method public hasAddDeskButton()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_ADD_DESK_BUTTON:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public hasClearAllButton()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_CLEAR_ALL_BUTTON:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final hasFlag(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/fallback/RecentsState;->mFlags:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public hasLiveTile()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_LIVE_TILE:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public hasOverviewActions()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_OVERVIEW_ACTIONS:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isFullScreen()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_FULL_SCREEN:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isRecentsViewVisible()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_RECENTS_VIEW_VISIBLE:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
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

.method public showExplodedDesktopView()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_SHOW_EXPLODED_DESKTOP_VIEW:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public showTaskThumbnailSplash()Z
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/fallback/RecentsState;->FLAG_TASK_THUMBNAIL_SPLASH:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/RecentsState;->hasFlag(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/fallback/RecentsState;->ordinal:I

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_4

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_3

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x4

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x5

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "Unknown Ordinal-"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget p0, p0, Lcom/android/quickstep/fallback/RecentsState;->ordinal:I

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_0
    const-string p0, "SPLIT_SELECT"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, "BG_LAUNCHER"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    const-string p0, "HOME"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    const-string p0, "BACKGROUND_APP"

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_4
    const-string p0, "MODAL_TASK"

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_5
    const-string p0, "DEFAULT"

    .line 56
    .line 57
    return-object p0
.end method
