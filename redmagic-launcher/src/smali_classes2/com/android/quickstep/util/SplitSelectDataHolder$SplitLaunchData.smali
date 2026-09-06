.class public final Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;
.super Ljava/lang/Object;
.source "SplitSelectDataHolder.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SplitSelectDataHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SplitLaunchData"
.end annotation


# instance fields
.field private initialPendingIntent:Landroid/app/PendingIntent;

.field private initialShortcut:Landroid/content/pm/ShortcutInfo;

.field private final initialStagePosition:I

.field private initialTaskId:I

.field private initialUserId:I

.field private itemInfo:Lcom/android/launcher3/model/data/y;

.field private secondPendingIntent:Landroid/app/PendingIntent;

.field private secondShortcut:Landroid/content/pm/ShortcutInfo;

.field private secondTaskId:I

.field private secondUserId:I

.field private splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

.field private final splitLaunchType:I

.field private widgetSecondIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    .line 3
    iput p2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 4
    iput p3, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 5
    iput-object p4, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 6
    iput-object p5, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 7
    iput-object p6, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 8
    iput p7, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 9
    iput p8, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 10
    iput-object p9, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 11
    iput-object p10, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 12
    iput-object p11, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 13
    iput-object p12, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 14
    iput p13, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    return-void
.end method

.method public synthetic constructor <init>(IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;IILkotlin/jvm/internal/j;)V
    .locals 14

    move/from16 v0, p14

    and-int/lit8 v1, v0, 0x2

    const/4 v2, -0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move/from16 v1, p2

    :goto_0
    and-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_1

    move v3, v2

    goto :goto_1

    :cond_1
    move/from16 v3, p3

    :goto_1
    and-int/lit8 v4, v0, 0x8

    const/4 v5, 0x0

    if-eqz v4, :cond_2

    move-object v4, v5

    goto :goto_2

    :cond_2
    move-object/from16 v4, p4

    :goto_2
    and-int/lit8 v6, v0, 0x10

    if-eqz v6, :cond_3

    move-object v6, v5

    goto :goto_3

    :cond_3
    move-object/from16 v6, p5

    :goto_3
    and-int/lit8 v7, v0, 0x20

    if-eqz v7, :cond_4

    move-object v7, v5

    goto :goto_4

    :cond_4
    move-object/from16 v7, p6

    :goto_4
    and-int/lit8 v8, v0, 0x40

    if-eqz v8, :cond_5

    move v8, v2

    goto :goto_5

    :cond_5
    move/from16 v8, p7

    :goto_5
    and-int/lit16 v9, v0, 0x80

    if-eqz v9, :cond_6

    move v9, v2

    goto :goto_6

    :cond_6
    move/from16 v9, p8

    :goto_6
    and-int/lit16 v10, v0, 0x100

    if-eqz v10, :cond_7

    move-object v10, v5

    goto :goto_7

    :cond_7
    move-object/from16 v10, p9

    :goto_7
    and-int/lit16 v11, v0, 0x200

    if-eqz v11, :cond_8

    move-object v11, v5

    goto :goto_8

    :cond_8
    move-object/from16 v11, p10

    :goto_8
    and-int/lit16 v12, v0, 0x400

    if-eqz v12, :cond_9

    move-object v12, v5

    goto :goto_9

    :cond_9
    move-object/from16 v12, p11

    :goto_9
    and-int/lit16 v13, v0, 0x800

    if-eqz v13, :cond_a

    goto :goto_a

    :cond_a
    move-object/from16 v5, p12

    :goto_a
    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_b

    move/from16 p15, v2

    :goto_b
    move-object/from16 p2, p0

    move/from16 p3, p1

    move/from16 p4, v1

    move/from16 p5, v3

    move-object/from16 p6, v4

    move-object/from16 p14, v5

    move-object/from16 p7, v6

    move-object/from16 p8, v7

    move/from16 p9, v8

    move/from16 p10, v9

    move-object/from16 p11, v10

    move-object/from16 p12, v11

    move-object/from16 p13, v12

    goto :goto_c

    :cond_b
    move/from16 p15, p13

    goto :goto_b

    .line 15
    :goto_c
    invoke-direct/range {p2 .. p15}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;-><init>(IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V

    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;IILjava/lang/Object;)Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;
    .locals 12

    .line 1
    move/from16 v0, p14

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    iget p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    :cond_0
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    goto :goto_0

    :cond_1
    move v1, p2

    :goto_0
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    goto :goto_1

    :cond_2
    move v2, p3

    :goto_1
    and-int/lit8 v3, v0, 0x8

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    goto :goto_2

    :cond_3
    move-object/from16 v3, p4

    :goto_2
    and-int/lit8 v4, v0, 0x10

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    goto :goto_3

    :cond_4
    move-object/from16 v4, p5

    :goto_3
    and-int/lit8 v5, v0, 0x20

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    goto :goto_4

    :cond_5
    move-object/from16 v5, p6

    :goto_4
    and-int/lit8 v6, v0, 0x40

    if-eqz v6, :cond_6

    iget v6, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    goto :goto_5

    :cond_6
    move/from16 v6, p7

    :goto_5
    and-int/lit16 v7, v0, 0x80

    if-eqz v7, :cond_7

    iget v7, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    goto :goto_6

    :cond_7
    move/from16 v7, p8

    :goto_6
    and-int/lit16 v8, v0, 0x100

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    goto :goto_7

    :cond_8
    move-object/from16 v8, p9

    :goto_7
    and-int/lit16 v9, v0, 0x200

    if-eqz v9, :cond_9

    iget-object v9, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    goto :goto_8

    :cond_9
    move-object/from16 v9, p10

    :goto_8
    and-int/lit16 v10, v0, 0x400

    if-eqz v10, :cond_a

    iget-object v10, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    goto :goto_9

    :cond_a
    move-object/from16 v10, p11

    :goto_9
    and-int/lit16 v11, v0, 0x800

    if-eqz v11, :cond_b

    iget-object v11, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    goto :goto_a

    :cond_b
    move-object/from16 v11, p12

    :goto_a
    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    move/from16 p15, v0

    :goto_b
    move-object p2, p0

    move p3, p1

    move/from16 p4, v1

    move/from16 p5, v2

    move-object/from16 p6, v3

    move-object/from16 p7, v4

    move-object/from16 p8, v5

    move/from16 p9, v6

    move/from16 p10, v7

    move-object/from16 p11, v8

    move-object/from16 p12, v9

    move-object/from16 p13, v10

    move-object/from16 p14, v11

    goto :goto_c

    :cond_c
    move/from16 p15, p13

    goto :goto_b

    :goto_c
    invoke-virtual/range {p2 .. p15}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->copy(IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    .line 2
    .line 3
    return p0
.end method

.method public final component10()Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component11()Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component12()Lcom/android/launcher3/logging/StatsLogManager$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component13()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    .line 2
    .line 3
    return p0
.end method

.method public final component2()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component3()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component4()Landroid/app/PendingIntent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component5()Landroid/app/PendingIntent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component6()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component7()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component8()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component9()Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final copy(IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p13}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;-><init>(IIILandroid/app/PendingIntent;Landroid/app/PendingIntent;Landroid/content/Intent;IILandroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 21
    .line 22
    iget v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 23
    .line 24
    if-eq v1, v3, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 28
    .line 29
    iget v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 30
    .line 31
    if-eq v1, v3, :cond_4

    .line 32
    .line 33
    return v2

    .line 34
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 35
    .line 36
    iget-object v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 37
    .line 38
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_5

    .line 43
    .line 44
    return v2

    .line 45
    :cond_5
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_6

    .line 54
    .line 55
    return v2

    .line 56
    :cond_6
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 57
    .line 58
    iget-object v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 59
    .line 60
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_7

    .line 65
    .line 66
    return v2

    .line 67
    :cond_7
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 68
    .line 69
    iget v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 70
    .line 71
    if-eq v1, v3, :cond_8

    .line 72
    .line 73
    return v2

    .line 74
    :cond_8
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 75
    .line 76
    iget v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 77
    .line 78
    if-eq v1, v3, :cond_9

    .line 79
    .line 80
    return v2

    .line 81
    :cond_9
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_a

    .line 90
    .line 91
    return v2

    .line 92
    :cond_a
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 93
    .line 94
    iget-object v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 95
    .line 96
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_b

    .line 101
    .line 102
    return v2

    .line 103
    :cond_b
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 106
    .line 107
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-nez v1, :cond_c

    .line 112
    .line 113
    return v2

    .line 114
    :cond_c
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 115
    .line 116
    iget-object v3, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 117
    .line 118
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_d

    .line 123
    .line 124
    return v2

    .line 125
    :cond_d
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    .line 126
    .line 127
    iget p1, p1, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    .line 128
    .line 129
    if-eq p0, p1, :cond_e

    .line 130
    .line 131
    return v2

    .line 132
    :cond_e
    return v0
.end method

.method public final getInitialPendingIntent()Landroid/app/PendingIntent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getInitialShortcut()Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getInitialStagePosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    .line 2
    .line 3
    return p0
.end method

.method public final getInitialTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getInitialUserId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getItemInfo()Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSecondPendingIntent()Landroid/app/PendingIntent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSecondShortcut()Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSecondTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getSecondUserId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getSplitEvent()Lcom/android/launcher3/logging/StatsLogManager$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSplitLaunchType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    .line 2
    .line 3
    return p0
.end method

.method public final getWidgetSecondIntent()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x1f

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    move v1, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v1}, Landroid/app/PendingIntent;->hashCode()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    :goto_0
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x1f

    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 42
    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    move v1, v2

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {v1}, Landroid/app/PendingIntent;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    :goto_1
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x1f

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 55
    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    move v1, v2

    .line 59
    goto :goto_2

    .line 60
    :cond_2
    invoke-virtual {v1}, Landroid/content/Intent;->hashCode()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    :goto_2
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x1f

    .line 66
    .line 67
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 68
    .line 69
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    add-int/2addr v0, v1

    .line 74
    mul-int/lit8 v0, v0, 0x1f

    .line 75
    .line 76
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 77
    .line 78
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    add-int/2addr v0, v1

    .line 83
    mul-int/lit8 v0, v0, 0x1f

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 86
    .line 87
    if-nez v1, :cond_3

    .line 88
    .line 89
    move v1, v2

    .line 90
    goto :goto_3

    .line 91
    :cond_3
    invoke-virtual {v1}, Landroid/content/pm/ShortcutInfo;->hashCode()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    :goto_3
    add-int/2addr v0, v1

    .line 96
    mul-int/lit8 v0, v0, 0x1f

    .line 97
    .line 98
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 99
    .line 100
    if-nez v1, :cond_4

    .line 101
    .line 102
    move v1, v2

    .line 103
    goto :goto_4

    .line 104
    :cond_4
    invoke-virtual {v1}, Landroid/content/pm/ShortcutInfo;->hashCode()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    :goto_4
    add-int/2addr v0, v1

    .line 109
    mul-int/lit8 v0, v0, 0x1f

    .line 110
    .line 111
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 112
    .line 113
    if-nez v1, :cond_5

    .line 114
    .line 115
    move v1, v2

    .line 116
    goto :goto_5

    .line 117
    :cond_5
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    :goto_5
    add-int/2addr v0, v1

    .line 122
    mul-int/lit8 v0, v0, 0x1f

    .line 123
    .line 124
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 125
    .line 126
    if-nez v1, :cond_6

    .line 127
    .line 128
    goto :goto_6

    .line 129
    :cond_6
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    :goto_6
    add-int/2addr v0, v2

    .line 134
    mul-int/lit8 v0, v0, 0x1f

    .line 135
    .line 136
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    .line 137
    .line 138
    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    add-int/2addr v0, p0

    .line 143
    return v0
.end method

.method public final setInitialPendingIntent(Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-void
.end method

.method public final setInitialShortcut(Landroid/content/pm/ShortcutInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-void
.end method

.method public final setInitialTaskId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 2
    .line 3
    return-void
.end method

.method public final setInitialUserId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 2
    .line 3
    return-void
.end method

.method public final setItemInfo(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-void
.end method

.method public final setSecondPendingIntent(Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 2
    .line 3
    return-void
.end method

.method public final setSecondShortcut(Landroid/content/pm/ShortcutInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-void
.end method

.method public final setSecondTaskId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 2
    .line 3
    return-void
.end method

.method public final setSecondUserId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 2
    .line 3
    return-void
.end method

.method public final setSplitEvent(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 2
    .line 3
    return-void
.end method

.method public final setWidgetSecondIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 14

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitLaunchType:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialTaskId:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondTaskId:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialPendingIntent:Landroid/app/PendingIntent;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondPendingIntent:Landroid/app/PendingIntent;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->widgetSecondIntent:Landroid/content/Intent;

    .line 12
    .line 13
    iget v6, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialUserId:I

    .line 14
    .line 15
    iget v7, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondUserId:I

    .line 16
    .line 17
    iget-object v8, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialShortcut:Landroid/content/pm/ShortcutInfo;

    .line 18
    .line 19
    iget-object v9, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->secondShortcut:Landroid/content/pm/ShortcutInfo;

    .line 20
    .line 21
    iget-object v10, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->itemInfo:Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    iget-object v11, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->splitEvent:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 24
    .line 25
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->initialStagePosition:I

    .line 26
    .line 27
    new-instance v12, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v13, "SplitLaunchData(splitLaunchType="

    .line 33
    .line 34
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ", initialTaskId="

    .line 41
    .line 42
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v0, ", secondTaskId="

    .line 49
    .line 50
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, ", initialPendingIntent="

    .line 57
    .line 58
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v0, ", secondPendingIntent="

    .line 65
    .line 66
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v0, ", widgetSecondIntent="

    .line 73
    .line 74
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v0, ", initialUserId="

    .line 81
    .line 82
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v0, ", secondUserId="

    .line 89
    .line 90
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v0, ", initialShortcut="

    .line 97
    .line 98
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v0, ", secondShortcut="

    .line 105
    .line 106
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v0, ", itemInfo="

    .line 113
    .line 114
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v0, ", splitEvent="

    .line 121
    .line 122
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v0, ", initialStagePosition="

    .line 129
    .line 130
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string p0, ")"

    .line 137
    .line 138
    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    return-object p0
.end method
