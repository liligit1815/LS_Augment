.class Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;
.super Ljava/lang/Object;
.source "StatsLogCompatManager.java"

# interfaces
.implements Lcom/android/launcher3/logging/StatsLogManager$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/logging/StatsLogCompatManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StatsCompatLatencyLogger"
.end annotation


# instance fields
.field private mCardinality:I

.field private mInstanceId:Lcom/android/launcher3/logging/d;

.field private mLatencyInMillis:J

.field private mPackageId:I

.field private mQueryLength:I

.field private mSubEventType:I

.field private mType:Lcom/android/launcher3/logging/StatsLogManager$h$a;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {}, Lcom/android/quickstep/logging/StatsLogCompatManager;->b()Lcom/android/launcher3/logging/d;

    move-result-object v0

    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 4
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->h:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mType:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mPackageId:I

    const/4 v1, -0x1

    .line 6
    iput v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mQueryLength:I

    .line 7
    iput v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mSubEventType:I

    .line 8
    iput v1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mCardinality:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/logging/w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;-><init>()V

    return-void
.end method


# virtual methods
.method public log(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 12

    .line 1
    invoke-static {}, Lcom/android/quickstep/logging/StatsLogCompatManager;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    instance-of v0, p1, Ljava/lang/Enum;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Ljava/lang/Enum;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Lcom/android/launcher3/logging/StatsLogManager$d;->getId()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ""

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v2, "\n"

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 48
    .line 49
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "InstanceId:%s "

    .line 54
    .line 55
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-wide v2, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mLatencyInMillis:J

    .line 63
    .line 64
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    filled-new-array {v0, v2}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v2, "%s=%sms"

    .line 73
    .line 74
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v0, "StatsLatencyLog"

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    :cond_1
    invoke-interface {p1}, Lcom/android/launcher3/logging/StatsLogManager$d;->getId()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    iget-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/android/launcher3/logging/d;->b()I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    iget v5, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mPackageId:I

    .line 101
    .line 102
    iget-wide v6, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mLatencyInMillis:J

    .line 103
    .line 104
    iget-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mType:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager$h$a;->c()I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    iget v9, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mQueryLength:I

    .line 111
    .line 112
    iget v10, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mSubEventType:I

    .line 113
    .line 114
    iget v11, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mCardinality:I

    .line 115
    .line 116
    const/16 v2, 0x1aa

    .line 117
    .line 118
    invoke-static/range {v2 .. v11}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIJIIII)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public withCardinality(I)Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mCardinality:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public withLatency(J)Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mLatencyInMillis:J

    .line 2
    .line 3
    return-object p0
.end method

.method public withPackageId(I)Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mPackageId:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withQueryLength(I)Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mQueryLength:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withSubEventType(I)Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mSubEventType:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withType(Lcom/android/launcher3/logging/StatsLogManager$h$a;)Lcom/android/launcher3/logging/StatsLogManager$h;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatLatencyLogger;->mType:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 2
    .line 3
    return-object p0
.end method
