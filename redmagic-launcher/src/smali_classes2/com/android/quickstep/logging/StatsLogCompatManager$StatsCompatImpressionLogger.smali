.class Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;
.super Ljava/lang/Object;
.source "StatsLogCompatManager.java"

# interfaces
.implements Lcom/android/launcher3/logging/StatsLogManager$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/logging/StatsLogCompatManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StatsCompatImpressionLogger"
.end annotation


# instance fields
.field private mAboveKeyboard:Z

.field private mInstanceId:Lcom/android/launcher3/logging/d;

.field private mLauncherState:Lcom/android/launcher3/logging/StatsLogManager$g$a;

.field private mQueryLength:I

.field private mResultSource:I

.field private mResultType:I

.field private mUid:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    invoke-static {}, Lcom/android/quickstep/logging/StatsLogCompatManager;->b()Lcom/android/launcher3/logging/d;

    move-result-object v0

    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 4
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$g$a;->h:Lcom/android/launcher3/logging/StatsLogManager$g$a;

    iput-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mLauncherState:Lcom/android/launcher3/logging/StatsLogManager$g$a;

    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mQueryLength:I

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mAboveKeyboard:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/logging/w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;-><init>()V

    return-void
.end method


# virtual methods
.method public log(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 11

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
    iget-object v2, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

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
    const-string v2, "ImpressionEvent:%s "

    .line 63
    .line 64
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mLauncherState:Lcom/android/launcher3/logging/StatsLogManager$g$a;

    .line 76
    .line 77
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const-string v2, "\n\tLauncherState = %s "

    .line 82
    .line 83
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mQueryLength:I

    .line 91
    .line 92
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v2, "\tQueryLength = %s "

    .line 101
    .line 102
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget v0, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mResultType:I

    .line 110
    .line 111
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-boolean v2, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mAboveKeyboard:Z

    .line 116
    .line 117
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iget v3, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mUid:I

    .line 122
    .line 123
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    iget v4, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mResultSource:I

    .line 128
    .line 129
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    filled-new-array {v0, v2, v3, v4}, [Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v2, "\n\t ResultType = %s is_above_keyboard = %s uid = %s result_source = %s"

    .line 138
    .line 139
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v0, "StatsImpressionLog"

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    :cond_1
    invoke-interface {p1}, Lcom/android/launcher3/logging/StatsLogManager$d;->getId()I

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    iget-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/android/launcher3/logging/d;->b()I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    iget-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mLauncherState:Lcom/android/launcher3/logging/StatsLogManager$g$a;

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager$g$a;->c()I

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    iget v6, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mQueryLength:I

    .line 172
    .line 173
    iget v7, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mResultType:I

    .line 174
    .line 175
    iget-boolean v8, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mAboveKeyboard:Z

    .line 176
    .line 177
    iget v9, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mUid:I

    .line 178
    .line 179
    iget v10, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mResultSource:I

    .line 180
    .line 181
    const/16 v2, 0x2cc

    .line 182
    .line 183
    invoke-static/range {v2 .. v10}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIZII)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public withAboveKeyboard(Z)Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mAboveKeyboard:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mInstanceId:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public withQueryLength(I)Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mQueryLength:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withResultSource(I)Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mResultSource:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withResultType(I)Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mResultType:I

    .line 2
    .line 3
    return-object p0
.end method

.method public withState(Lcom/android/launcher3/logging/StatsLogManager$g$a;)Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mLauncherState:Lcom/android/launcher3/logging/StatsLogManager$g$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public withUid(I)Lcom/android/launcher3/logging/StatsLogManager$g;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/logging/StatsLogCompatManager$StatsCompatImpressionLogger;->mUid:I

    .line 2
    .line 3
    return-object p0
.end method
