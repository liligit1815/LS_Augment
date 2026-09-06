.class public final Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
.super Ljava/lang/Object;
.source "OverviewCommandHelper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/OverviewCommandHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CommandInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;
    }
.end annotation


# instance fields
.field private animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

.field private final createTime:J

.field private final displayId:I

.field private final isLastOfBatch:Z

.field private miPopAppSwitchSeq:I

.field private status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

.field private final type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZ)V
    .locals 1

    const-string v0, "type"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 3
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 4
    iput-wide p3, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 5
    iput-object p5, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 6
    iput p6, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 7
    iput-boolean p7, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZILkotlin/jvm/internal/j;)V
    .locals 6

    and-int/lit8 v0, p8, 0x2

    if-eqz v0, :cond_0

    .line 8
    sget-object v0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;->IDLE:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    and-int/lit8 v1, p8, 0x4

    if-eqz v1, :cond_1

    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    goto :goto_1

    :cond_1
    move-wide v1, p3

    :goto_1
    and-int/lit8 v3, p8, 0x8

    if-eqz v3, :cond_2

    const/4 v3, 0x0

    goto :goto_2

    :cond_2
    move-object v3, p5

    :goto_2
    and-int/lit8 v4, p8, 0x10

    if-eqz v4, :cond_3

    const/4 v4, 0x0

    goto :goto_3

    :cond_3
    move v4, p6

    :goto_3
    and-int/lit8 v5, p8, 0x20

    if-eqz v5, :cond_4

    const/4 v5, 0x1

    move p9, v5

    :goto_4
    move-object p2, p0

    move-object p3, p1

    move-object p4, v0

    move-wide p5, v1

    move-object p7, v3

    move p8, v4

    goto :goto_5

    :cond_4
    move p9, p7

    goto :goto_4

    .line 10
    :goto_5
    invoke-direct/range {p2 .. p9}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZ)V

    return-void
.end method

.method private final component4()Lcom/android/quickstep/RecentsAnimationCallbacks;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZILjava/lang/Object;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 0

    .line 1
    and-int/lit8 p9, p8, 0x1

    .line 2
    .line 3
    if-eqz p9, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p9, p8, 0x2

    .line 8
    .line 9
    if-eqz p9, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p9, p8, 0x4

    .line 14
    .line 15
    if-eqz p9, :cond_2

    .line 16
    .line 17
    iget-wide p3, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 18
    .line 19
    :cond_2
    and-int/lit8 p9, p8, 0x8

    .line 20
    .line 21
    if-eqz p9, :cond_3

    .line 22
    .line 23
    iget-object p5, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 24
    .line 25
    :cond_3
    and-int/lit8 p9, p8, 0x10

    .line 26
    .line 27
    if-eqz p9, :cond_4

    .line 28
    .line 29
    iget p6, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 30
    .line 31
    :cond_4
    and-int/lit8 p8, p8, 0x20

    .line 32
    .line 33
    if-eqz p8, :cond_5

    .line 34
    .line 35
    iget-boolean p7, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    .line 36
    .line 37
    :cond_5
    move p8, p6

    .line 38
    move p9, p7

    .line 39
    move-object p7, p5

    .line 40
    move-wide p5, p3

    .line 41
    move-object p3, p1

    .line 42
    move-object p4, p2

    .line 43
    move-object p2, p0

    .line 44
    invoke-virtual/range {p2 .. p9}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->copy(Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZ)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method


# virtual methods
.method public final addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final component1()Lcom/android/quickstep/OverviewCommandHelper$CommandType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component2()Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component3()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final component5()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 2
    .line 3
    return p0
.end method

.method public final component6()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    .line 2
    .line 3
    return p0
.end method

.method public final copy(Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZ)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
    .locals 8

    .line 1
    const-string p0, "type"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "status"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    move-object v2, p2

    .line 15
    move-wide v3, p3

    .line 16
    move-object v5, p5

    .line 17
    move v6, p6

    .line 18
    move v7, p7

    .line 19
    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;-><init>(Lcom/android/quickstep/OverviewCommandHelper$CommandType;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;JLcom/android/quickstep/RecentsAnimationCallbacks;IZ)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

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
    check-cast p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 21
    .line 22
    iget-object v3, p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 23
    .line 24
    if-eq v1, v3, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    iget-wide v3, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 28
    .line 29
    iget-wide v5, p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 30
    .line 31
    cmp-long v1, v3, v5

    .line 32
    .line 33
    if-eqz v1, :cond_4

    .line 34
    .line 35
    return v2

    .line 36
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 37
    .line 38
    iget-object v3, p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 39
    .line 40
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_5

    .line 45
    .line 46
    return v2

    .line 47
    :cond_5
    iget v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 48
    .line 49
    iget v3, p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 50
    .line 51
    if-eq v1, v3, :cond_6

    .line 52
    .line 53
    return v2

    .line 54
    :cond_6
    iget-boolean p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    .line 55
    .line 56
    iget-boolean p1, p1, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    .line 57
    .line 58
    if-eq p0, p1, :cond_7

    .line 59
    .line 60
    return v2

    .line 61
    :cond_7
    return v0
.end method

.method public final getCreateTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getDisplayId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMiPopAppSwitchSeq()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->miPopAppSwitchSeq:I

    .line 2
    .line 3
    return p0
.end method

.method public final getStatus()Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getType()Lcom/android/quickstep/OverviewCommandHelper$CommandType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Enum;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Enum;->hashCode()I

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
    iget-wide v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 19
    .line 20
    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

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
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    :goto_0
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x1f

    .line 39
    .line 40
    iget v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 41
    .line 42
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x1f

    .line 48
    .line 49
    iget-boolean p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    .line 50
    .line 51
    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    add-int/2addr v0, p0

    .line 56
    return v0
.end method

.method public final isLastOfBatch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    .line 2
    .line 3
    return p0
.end method

.method public final removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final setAnimationCallbacks(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 1

    .line 1
    const-string v0, "recentsAnimationCallbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 7
    .line 8
    return-void
.end method

.method public final setMiPopAppSwitchSeq(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->miPopAppSwitchSeq:I

    .line 2
    .line 3
    return-void
.end method

.method public final setStatus(Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 7
    .line 8
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->type:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->status:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo$CommandStatus;

    .line 4
    .line 5
    iget-wide v2, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->createTime:J

    .line 6
    .line 7
    iget-object v4, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->animationCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 8
    .line 9
    iget v5, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->displayId:I

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;->isLastOfBatch:Z

    .line 12
    .line 13
    new-instance v6, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v7, "CommandInfo(type="

    .line 19
    .line 20
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v0, ", status="

    .line 27
    .line 28
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v0, ", createTime="

    .line 35
    .line 36
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, ", animationCallbacks="

    .line 43
    .line 44
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, ", displayId="

    .line 51
    .line 52
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v0, ", isLastOfBatch="

    .line 59
    .line 60
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p0, ")"

    .line 67
    .line 68
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method
