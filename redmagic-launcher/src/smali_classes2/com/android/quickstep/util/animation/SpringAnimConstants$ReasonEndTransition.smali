.class public final enum Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;
.super Ljava/lang/Enum;
.source "SpringAnimConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/SpringAnimConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ReasonEndTransition"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum BACK_ANIMA_STOP:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum CLOSE_FOLDER:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum ENTER_OR_EXIT_ALL_APPS:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum HANDLE_OVERVIEW_CONSUMER_TOUCH:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum LAUNCHER_STATE_CHANGE:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum OPEN_FOLDER:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum PULL_DOWN_TO_GLOBAL_SEARCH:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum RECENT_KEY:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum SCROLL_TO_ASSISTANT_SCREEN:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum SCROLL_TO_SWITCH_GROUP_CHILD_CARD:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum START_NEW_APP:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum UNKNOWN:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

.field public static final enum WORKSPACE_TRANSITION:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;
    .locals 13

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->START_NEW_APP:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->SCROLL_TO_ASSISTANT_SCREEN:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->WORKSPACE_TRANSITION:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 6
    .line 7
    sget-object v3, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->OPEN_FOLDER:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 8
    .line 9
    sget-object v4, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->CLOSE_FOLDER:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 10
    .line 11
    sget-object v5, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->ENTER_OR_EXIT_ALL_APPS:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 12
    .line 13
    sget-object v6, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->PULL_DOWN_TO_GLOBAL_SEARCH:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 14
    .line 15
    sget-object v7, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->RECENT_KEY:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 16
    .line 17
    sget-object v8, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->LAUNCHER_STATE_CHANGE:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 18
    .line 19
    sget-object v9, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->SCROLL_TO_SWITCH_GROUP_CHILD_CARD:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 20
    .line 21
    sget-object v10, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->BACK_ANIMA_STOP:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 22
    .line 23
    sget-object v11, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->HANDLE_OVERVIEW_CONSUMER_TOUCH:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 24
    .line 25
    sget-object v12, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->UNKNOWN:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 26
    .line 27
    filled-new-array/range {v0 .. v12}, [Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 2
    .line 3
    const-string v1, "START_NEW_APP"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->START_NEW_APP:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 12
    .line 13
    const-string v1, "SCROLL_TO_ASSISTANT_SCREEN"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->SCROLL_TO_ASSISTANT_SCREEN:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 22
    .line 23
    const-string v1, "WORKSPACE_TRANSITION"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->WORKSPACE_TRANSITION:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 30
    .line 31
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 32
    .line 33
    const-string v1, "OPEN_FOLDER"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->OPEN_FOLDER:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 40
    .line 41
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 42
    .line 43
    const-string v1, "CLOSE_FOLDER"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->CLOSE_FOLDER:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 50
    .line 51
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 52
    .line 53
    const-string v1, "ENTER_OR_EXIT_ALL_APPS"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->ENTER_OR_EXIT_ALL_APPS:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 60
    .line 61
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 62
    .line 63
    const-string v1, "PULL_DOWN_TO_GLOBAL_SEARCH"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->PULL_DOWN_TO_GLOBAL_SEARCH:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 70
    .line 71
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 72
    .line 73
    const-string v1, "RECENT_KEY"

    .line 74
    .line 75
    const/4 v2, 0x7

    .line 76
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->RECENT_KEY:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 80
    .line 81
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 82
    .line 83
    const-string v1, "LAUNCHER_STATE_CHANGE"

    .line 84
    .line 85
    const/16 v2, 0x8

    .line 86
    .line 87
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->LAUNCHER_STATE_CHANGE:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 91
    .line 92
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 93
    .line 94
    const-string v1, "SCROLL_TO_SWITCH_GROUP_CHILD_CARD"

    .line 95
    .line 96
    const/16 v2, 0x9

    .line 97
    .line 98
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->SCROLL_TO_SWITCH_GROUP_CHILD_CARD:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 102
    .line 103
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 104
    .line 105
    const-string v1, "BACK_ANIMA_STOP"

    .line 106
    .line 107
    const/16 v2, 0xa

    .line 108
    .line 109
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->BACK_ANIMA_STOP:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 113
    .line 114
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 115
    .line 116
    const-string v1, "HANDLE_OVERVIEW_CONSUMER_TOUCH"

    .line 117
    .line 118
    const/16 v2, 0xb

    .line 119
    .line 120
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 121
    .line 122
    .line 123
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->HANDLE_OVERVIEW_CONSUMER_TOUCH:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 124
    .line 125
    new-instance v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 126
    .line 127
    const-string v1, "UNKNOWN"

    .line 128
    .line 129
    const/16 v2, 0xc

    .line 130
    .line 131
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;-><init>(Ljava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->UNKNOWN:Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 135
    .line 136
    invoke-static {}, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->$values()[Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sput-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->$VALUES:[Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 141
    .line 142
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->$VALUES:[Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/util/animation/SpringAnimConstants$ReasonEndTransition;

    .line 8
    .line 9
    return-object v0
.end method
