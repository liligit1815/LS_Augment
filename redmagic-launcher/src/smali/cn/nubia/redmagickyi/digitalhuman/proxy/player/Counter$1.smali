.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;
.super Ljava/lang/Object;
.source "Counter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->start()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field passTime:Ljava/lang/Long;

.field startTime:Ljava/lang/Long;

.field final synthetic this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 2
    .line 3
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$000(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->startTime:Ljava/lang/Long;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->startTime:Ljava/lang/Long;

    .line 23
    .line 24
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 25
    .line 26
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {p0, v0, v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    sub-long/2addr v0, v4

    .line 39
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->passTime:Ljava/lang/Long;

    .line 48
    .line 49
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 50
    .line 51
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v1, -0x1

    .line 56
    if-ne v0, v1, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->passTime:Ljava/lang/Long;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->passTime:Ljava/lang/Long;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 72
    .line 73
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v6

    .line 77
    rem-long/2addr v4, v6

    .line 78
    :goto_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 79
    .line 80
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v6

    .line 84
    cmp-long v0, v4, v6

    .line 85
    .line 86
    const-wide/16 v6, 0x0

    .line 87
    .line 88
    if-ltz v0, :cond_3

    .line 89
    .line 90
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 91
    .line 92
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v4

    .line 96
    cmp-long v0, v4, v6

    .line 97
    .line 98
    const/4 v2, 0x1

    .line 99
    if-lez v0, :cond_2

    .line 100
    .line 101
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 102
    .line 103
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    invoke-static {v0, v4, v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V

    .line 108
    .line 109
    .line 110
    :try_start_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 111
    .line 112
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$500(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J

    .line 113
    .line 114
    .line 115
    move-result-wide v3

    .line 116
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    :catch_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 120
    .line 121
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-static {v0, v3, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_2
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 130
    .line 131
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-static {v0, v3, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V

    .line 136
    .line 137
    .line 138
    :goto_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 139
    .line 140
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-ne v0, v1, :cond_5

    .line 145
    .line 146
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 147
    .line 148
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->cancel()V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_3
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 153
    .line 154
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 159
    .line 160
    invoke-static {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 165
    .line 166
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    const/4 v8, 0x2

    .line 171
    if-ne v2, v8, :cond_4

    .line 172
    .line 173
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->passTime:Ljava/lang/Long;

    .line 174
    .line 175
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 176
    .line 177
    .line 178
    move-result-wide v8

    .line 179
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 180
    .line 181
    invoke-static {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J

    .line 182
    .line 183
    .line 184
    move-result-wide v10

    .line 185
    div-long/2addr v8, v10

    .line 186
    const-wide/16 v10, 0x2

    .line 187
    .line 188
    rem-long/2addr v8, v10

    .line 189
    cmp-long v2, v8, v6

    .line 190
    .line 191
    if-eqz v2, :cond_4

    .line 192
    .line 193
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 194
    .line 195
    invoke-static {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$600(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 200
    .line 201
    invoke-static {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$100(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)F

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    :cond_4
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$1;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;

    .line 206
    .line 207
    sub-float/2addr v1, v0

    .line 208
    long-to-float v2, v4

    .line 209
    mul-float/2addr v1, v2

    .line 210
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$400(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;)J

    .line 211
    .line 212
    .line 213
    move-result-wide v4

    .line 214
    long-to-float v2, v4

    .line 215
    div-float/2addr v1, v2

    .line 216
    add-float/2addr v0, v1

    .line 217
    invoke-static {p0, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$700(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;F)F

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    invoke-static {p0, v0, v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter;FZ)V

    .line 222
    .line 223
    .line 224
    :cond_5
    :goto_2
    return-void
.end method
