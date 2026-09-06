.class public Lcom/android/launcher3/anim/C;
.super Ljava/lang/Object;
.source "AppOCAnimHelper.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/anim/C$e;,
        Lcom/android/launcher3/anim/C$d;
    }
.end annotation


# static fields
.field public static final Q:I

.field public static final R:F

.field public static final S:I

.field public static final T:I

.field public static final U:I

.field public static final V:I

.field public static final W:F

.field public static final X:F

.field public static final Y:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/anim/C;",
            ">;"
        }
    .end annotation
.end field

.field public static final Z:Landroid/content/ComponentName;

.field public static final a0:Landroid/content/ComponentName;

.field public static final b0:Landroid/content/ComponentName;

.field public static c0:I

.field public static d0:Z

.field private static e0:[Landroid/content/ComponentName;

.field public static final f0:Landroid/net/Uri;

.field public static final g0:Landroid/net/Uri;

.field public static final h0:Landroid/net/Uri;

.field public static final i0:Landroid/content/ComponentName;

.field public static final j0:Landroid/content/ComponentName;

.field public static final k0:Landroid/content/ComponentName;

.field public static final l0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static m0:Landroid/animation/ValueAnimator;


# instance fields
.field public A:Z

.field public B:Ljava/lang/String;

.field private C:Lu2/e;

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:I

.field public H:Ljava/lang/String;

.field public I:Z

.field public J:F

.field public volatile K:Z

.field public volatile L:Z

.field private final M:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/content/ComponentName;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private N:Lcom/android/launcher3/anim/C$e;

.field private O:Landroid/content/Context;

.field private P:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/anim/C$d;",
            ">;"
        }
    .end annotation
.end field

.field private g:I

.field private h:Landroid/graphics/PointF;

.field private i:Landroid/graphics/PointF;

.field private j:Landroid/graphics/PointF;

.field private k:Landroid/view/View;

.field private l:I

.field private m:Z

.field private n:Z

.field private o:Landroid/content/ComponentName;

.field private p:F

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:Z

.field public x:Z

.field private y:Z

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->U2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xfa

    .line 6
    .line 7
    const/16 v2, 0x96

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lx1/O;->Y2()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Lx1/O;->V2()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 v0, 0x2bc

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_1
    :goto_0
    invoke-static {}, Lx1/O;->W2()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lx1/O;->X2()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    move v0, v1

    .line 41
    goto :goto_2

    .line 42
    :cond_3
    :goto_1
    move v0, v2

    .line 43
    :goto_2
    sput v0, Lcom/android/launcher3/anim/C;->Q:I

    .line 44
    .line 45
    const/high16 v3, 0x41f00000    # 30.0f

    .line 46
    .line 47
    int-to-float v0, v0

    .line 48
    div-float/2addr v3, v0

    .line 49
    sput v3, Lcom/android/launcher3/anim/C;->R:F

    .line 50
    .line 51
    invoke-static {}, Lx1/O;->U2()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/16 v3, 0x12c

    .line 56
    .line 57
    if-nez v0, :cond_5

    .line 58
    .line 59
    invoke-static {}, Lx1/O;->Y2()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_4
    const/16 v0, 0x258

    .line 67
    .line 68
    goto :goto_4

    .line 69
    :cond_5
    :goto_3
    move v0, v3

    .line 70
    :goto_4
    sput v0, Lcom/android/launcher3/anim/C;->S:I

    .line 71
    .line 72
    invoke-static {}, Lx1/O;->U2()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_7

    .line 77
    .line 78
    invoke-static {}, Lx1/O;->Y2()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_7

    .line 83
    .line 84
    invoke-static {}, Lx1/O;->V2()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_6

    .line 89
    .line 90
    goto :goto_5

    .line 91
    :cond_6
    const/16 v0, 0x1f4

    .line 92
    .line 93
    goto :goto_7

    .line 94
    :cond_7
    :goto_5
    invoke-static {}, Lx1/O;->W2()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_9

    .line 99
    .line 100
    invoke-static {}, Lx1/O;->X2()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_8

    .line 105
    .line 106
    goto :goto_6

    .line 107
    :cond_8
    move v0, v3

    .line 108
    goto :goto_7

    .line 109
    :cond_9
    :goto_6
    move v0, v2

    .line 110
    :goto_7
    sput v0, Lcom/android/launcher3/anim/C;->T:I

    .line 111
    .line 112
    invoke-static {}, Lx1/O;->W2()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_a

    .line 117
    .line 118
    invoke-static {}, Lx1/O;->X2()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_b

    .line 123
    .line 124
    :cond_a
    move v1, v2

    .line 125
    :cond_b
    sput v1, Lcom/android/launcher3/anim/C;->U:I

    .line 126
    .line 127
    invoke-static {}, Lx1/O;->W2()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_d

    .line 132
    .line 133
    invoke-static {}, Lx1/O;->X2()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_c

    .line 138
    .line 139
    goto :goto_8

    .line 140
    :cond_c
    move v2, v3

    .line 141
    :cond_d
    :goto_8
    sput v2, Lcom/android/launcher3/anim/C;->V:I

    .line 142
    .line 143
    sget-boolean v0, Lf1/a;->H:Z

    .line 144
    .line 145
    if-eqz v0, :cond_e

    .line 146
    .line 147
    const v1, 0x3eb33333    # 0.35f

    .line 148
    .line 149
    .line 150
    goto :goto_9

    .line 151
    :cond_e
    const v1, 0x3da3d70a    # 0.08f

    .line 152
    .line 153
    .line 154
    :goto_9
    sput v1, Lcom/android/launcher3/anim/C;->W:F

    .line 155
    .line 156
    if-eqz v0, :cond_f

    .line 157
    .line 158
    const/high16 v0, 0x3f400000    # 0.75f

    .line 159
    .line 160
    goto :goto_a

    .line 161
    :cond_f
    const/high16 v0, 0x3f800000    # 1.0f

    .line 162
    .line 163
    :goto_a
    sput v0, Lcom/android/launcher3/anim/C;->X:F

    .line 164
    .line 165
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 166
    .line 167
    new-instance v1, Lcom/android/launcher3/anim/z;

    .line 168
    .line 169
    invoke-direct {v1}, Lcom/android/launcher3/anim/z;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 173
    .line 174
    .line 175
    sput-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 176
    .line 177
    new-instance v0, Landroid/content/ComponentName;

    .line 178
    .line 179
    const-string v1, "com.google.android.dialer"

    .line 180
    .line 181
    const-string v2, "com.android.dialer.incall.activity.ui.InCallActivity"

    .line 182
    .line 183
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    sput-object v0, Lcom/android/launcher3/anim/C;->Z:Landroid/content/ComponentName;

    .line 187
    .line 188
    new-instance v1, Landroid/content/ComponentName;

    .line 189
    .line 190
    const-string v2, "cn.zte.recorder"

    .line 191
    .line 192
    const-string v3, "cn.zte.recorder.RecordingActivity"

    .line 193
    .line 194
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    sput-object v1, Lcom/android/launcher3/anim/C;->a0:Landroid/content/ComponentName;

    .line 198
    .line 199
    new-instance v2, Landroid/content/ComponentName;

    .line 200
    .line 201
    const-string v3, "zte.com.cn.alarmclock"

    .line 202
    .line 203
    const-string v4, "zte.com.cn.alarmclock.activity.AlarmClockActivity"

    .line 204
    .line 205
    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    sput-object v2, Lcom/android/launcher3/anim/C;->b0:Landroid/content/ComponentName;

    .line 209
    .line 210
    const-string v3, "status_bar_clock_start_padding"

    .line 211
    .line 212
    const/16 v4, 0x13

    .line 213
    .line 214
    invoke-static {v3, v4}, Lcom/zte/feature/Feature;->getInt(Ljava/lang/String;I)I

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    sput v3, Lcom/android/launcher3/anim/C;->c0:I

    .line 219
    .line 220
    const-string v3, "zte_feature_live_island_full_screen"

    .line 221
    .line 222
    const/4 v4, 0x0

    .line 223
    invoke-static {v3, v4}, Lcom/zte/feature/Feature;->getBoolean(Ljava/lang/String;Z)Z

    .line 224
    .line 225
    .line 226
    move-result v3

    .line 227
    sput-boolean v3, Lcom/android/launcher3/anim/C;->d0:Z

    .line 228
    .line 229
    filled-new-array {v0, v1, v2}, [Landroid/content/ComponentName;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    sput-object v0, Lcom/android/launcher3/anim/C;->e0:[Landroid/content/ComponentName;

    .line 234
    .line 235
    const-string v0, "content://com.android.systemui.zte/count_status"

    .line 236
    .line 237
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    sput-object v0, Lcom/android/launcher3/anim/C;->f0:Landroid/net/Uri;

    .line 242
    .line 243
    const-string v0, "content://com.android.systemui.zte/record_count_status"

    .line 244
    .line 245
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    sput-object v0, Lcom/android/launcher3/anim/C;->g0:Landroid/net/Uri;

    .line 250
    .line 251
    const-string v0, "content://com.android.systemui.zte/meeting_count_status"

    .line 252
    .line 253
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    sput-object v0, Lcom/android/launcher3/anim/C;->h0:Landroid/net/Uri;

    .line 258
    .line 259
    new-instance v0, Landroid/content/ComponentName;

    .line 260
    .line 261
    const-string v1, "com.android.dialer"

    .line 262
    .line 263
    const-string v2, "com.android.incallui.InCallActivity"

    .line 264
    .line 265
    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    sput-object v0, Lcom/android/launcher3/anim/C;->i0:Landroid/content/ComponentName;

    .line 269
    .line 270
    new-instance v0, Landroid/content/ComponentName;

    .line 271
    .line 272
    const-string v1, "com.zte.nebulatranslation.ui.view.activity.MeetingAssistantActivity"

    .line 273
    .line 274
    const-string v2, "com.zte.nebulatranslation"

    .line 275
    .line 276
    invoke-direct {v0, v2, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    sput-object v0, Lcom/android/launcher3/anim/C;->j0:Landroid/content/ComponentName;

    .line 280
    .line 281
    new-instance v0, Landroid/content/ComponentName;

    .line 282
    .line 283
    const-string v1, "com.zte.nebulatranslation.ui.view.activity.TabbedMainEntryActivity"

    .line 284
    .line 285
    invoke-direct {v0, v2, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    sput-object v0, Lcom/android/launcher3/anim/C;->k0:Landroid/content/ComponentName;

    .line 289
    .line 290
    const-string v0, "com.ume.browser"

    .line 291
    .line 292
    filled-new-array {v0}, [Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    sput-object v0, Lcom/android/launcher3/anim/C;->l0:Ljava/util/List;

    .line 301
    .line 302
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/PointF;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->k:Landroid/view/View;

    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    iput v1, p0, Lcom/android/launcher3/anim/C;->l:I

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    iput-boolean v1, p0, Lcom/android/launcher3/anim/C;->m:Z

    .line 33
    .line 34
    iput-boolean v1, p0, Lcom/android/launcher3/anim/C;->n:Z

    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->o:Landroid/content/ComponentName;

    .line 37
    .line 38
    const v0, 0x3e638e39

    .line 39
    .line 40
    .line 41
    iput v0, p0, Lcom/android/launcher3/anim/C;->p:F

    .line 42
    .line 43
    iput-boolean v1, p0, Lcom/android/launcher3/anim/C;->y:Z

    .line 44
    .line 45
    new-instance v0, Lu2/e;

    .line 46
    .line 47
    invoke-direct {v0}, Lu2/e;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->C:Lu2/e;

    .line 51
    .line 52
    iput v1, p0, Lcom/android/launcher3/anim/C;->G:I

    .line 53
    .line 54
    new-instance v0, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->M:Ljava/util/Map;

    .line 60
    .line 61
    new-instance v0, Landroid/util/ArraySet;

    .line 62
    .line 63
    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->P:Ljava/util/Set;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/android/launcher3/X3;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 73
    .line 74
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 75
    .line 76
    div-int/lit8 v2, v2, 0x2

    .line 77
    .line 78
    int-to-float v2, v2

    .line 79
    iget v3, v0, Landroid/graphics/Point;->y:I

    .line 80
    .line 81
    div-int/lit8 v3, v3, 0x2

    .line 82
    .line 83
    int-to-float v3, v3

    .line 84
    invoke-virtual {v1, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 88
    .line 89
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 90
    .line 91
    div-int/lit8 v2, v2, 0x2

    .line 92
    .line 93
    int-to-float v2, v2

    .line 94
    iget v3, v0, Landroid/graphics/Point;->y:I

    .line 95
    .line 96
    div-int/lit8 v3, v3, 0x2

    .line 97
    .line 98
    int-to-float v3, v3

    .line 99
    invoke-virtual {v1, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 103
    .line 104
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 105
    .line 106
    div-int/lit8 v2, v2, 0x2

    .line 107
    .line 108
    int-to-float v2, v2

    .line 109
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 110
    .line 111
    div-int/lit8 v0, v0, 0x2

    .line 112
    .line 113
    int-to-float v0, v0

    .line 114
    invoke-virtual {v1, v2, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const v1, 0x7f0704d4

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput v0, p0, Lcom/android/launcher3/anim/C;->g:I

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const v1, 0x7f0704d5

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    iput v0, p0, Lcom/android/launcher3/anim/C;->t:I

    .line 142
    .line 143
    iput v0, p0, Lcom/android/launcher3/anim/C;->s:I

    .line 144
    .line 145
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    const v1, 0x7f070c69

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iput v0, p0, Lcom/android/launcher3/anim/C;->v:I

    .line 157
    .line 158
    iput-object p1, p0, Lcom/android/launcher3/anim/C;->O:Landroid/content/Context;

    .line 159
    .line 160
    new-instance p1, Lcom/android/launcher3/anim/C$e;

    .line 161
    .line 162
    invoke-direct {p1, p0}, Lcom/android/launcher3/anim/C$e;-><init>(Lcom/android/launcher3/anim/C;)V

    .line 163
    .line 164
    .line 165
    iput-object p1, p0, Lcom/android/launcher3/anim/C;->N:Lcom/android/launcher3/anim/C$e;

    .line 166
    .line 167
    invoke-direct {p0}, Lcom/android/launcher3/anim/C;->k0()V

    .line 168
    .line 169
    .line 170
    new-instance p1, Lcom/android/launcher3/anim/B;

    .line 171
    .line 172
    invoke-direct {p1, p0}, Lcom/android/launcher3/anim/B;-><init>(Lcom/android/launcher3/anim/C;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public static A0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->W1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-eqz v0, :cond_3

    .line 29
    .line 30
    new-instance v1, Landroid/content/ComponentName;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    if-eqz p3, :cond_2

    .line 36
    .line 37
    iget-object p0, v0, Lcom/android/launcher3/anim/C;->M:Ljava/util/Map;

    .line 38
    .line 39
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_3

    .line 44
    .line 45
    iget-object p0, v0, Lcom/android/launcher3/anim/C;->M:Ljava/util/Map;

    .line 46
    .line 47
    invoke-interface {p0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iget-object p0, v0, Lcom/android/launcher3/anim/C;->M:Ljava/util/Map;

    .line 52
    .line 53
    invoke-interface {p0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_1
    return-void
.end method

.method public static B(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string v2, "callState:"

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    array-length v2, p0

    .line 20
    if-gtz v2, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    array-length v2, p0

    .line 24
    if-ne v2, v0, :cond_2

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    aget-object v2, p0, v0

    .line 28
    .line 29
    invoke-static {v2}, Lcom/android/launcher3/anim/C;->E(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    aput-object v2, v1, v0

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    aget-object p0, p0, v0

    .line 37
    .line 38
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->f0(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    aput-object p0, v1, v0

    .line 43
    .line 44
    :cond_2
    :goto_0
    return-object v1
.end method

.method public static E(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const-string v1, "\\|"

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_3

    .line 12
    .line 13
    array-length v1, p0

    .line 14
    if-gtz v1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    array-length v0, p0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    aget-object p0, p0, v0

    .line 23
    .line 24
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->f0(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_2
    aget-object p0, p0, v1

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_3
    :goto_0
    return-object v0
.end method

.method public static F(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 1
    const-string v1, "AppOCAnimHelper"

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    .line 9
    .line 10
    .line 11
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 12
    const/4 v7, 0x0

    .line 13
    const/4 v8, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v6, 0x0

    .line 16
    move-object v4, p1

    .line 17
    :try_start_1
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentProviderClient;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->moveToLast()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    move-object p1, v0

    .line 40
    move-object v2, p0

    .line 41
    goto :goto_4

    .line 42
    :catch_0
    move-exception v0

    .line 43
    move-object p1, v0

    .line 44
    goto :goto_2

    .line 45
    :cond_0
    :goto_0
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_1
    invoke-virtual {v3}, Landroid/content/ContentProviderClient;->close()V

    .line 51
    .line 52
    .line 53
    goto :goto_3

    .line 54
    :catchall_1
    move-exception v0

    .line 55
    move-object p1, v0

    .line 56
    goto :goto_4

    .line 57
    :catch_1
    move-exception v0

    .line 58
    move-object p1, v0

    .line 59
    move-object p0, v2

    .line 60
    goto :goto_2

    .line 61
    :catchall_2
    move-exception v0

    .line 62
    move-object p1, v0

    .line 63
    move-object v3, v2

    .line 64
    goto :goto_4

    .line 65
    :catch_2
    move-exception v0

    .line 66
    move-object p1, v0

    .line 67
    move-object p0, v2

    .line 68
    move-object v3, p0

    .line 69
    :goto_2
    :try_start_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v0, "queryCount exception : "

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-static {v1, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    .line 92
    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 96
    .line 97
    .line 98
    :cond_2
    if-eqz v3, :cond_3

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    :goto_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    const-string p1, "countContent "

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    return-object v2

    .line 122
    :goto_4
    if-eqz v2, :cond_4

    .line 123
    .line 124
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 125
    .line 126
    .line 127
    :cond_4
    if-eqz v3, :cond_5

    .line 128
    .line 129
    invoke-virtual {v3}, Landroid/content/ContentProviderClient;->close()V

    .line 130
    .line 131
    .line 132
    :cond_5
    throw p1
.end method

.method public static I(Z)Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 14
    .line 15
    iget-boolean v1, v0, Lcom/android/launcher3/anim/C;->L:Z

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-boolean v1, v0, Lcom/android/launcher3/anim/C;->K:Z

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    move p0, v2

    .line 27
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v3, "finishController fixToRecents "

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-boolean v3, v0, Lcom/android/launcher3/anim/C;->L:Z

    .line 38
    .line 39
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v3, "-"

    .line 43
    .line 44
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-boolean v4, v0, Lcom/android/launcher3/anim/C;->K:Z

    .line 48
    .line 49
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v3, "AppOCAnimHelper"

    .line 63
    .line 64
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    iput-boolean v2, v0, Lcom/android/launcher3/anim/C;->K:Z

    .line 68
    .line 69
    iput-boolean v2, v0, Lcom/android/launcher3/anim/C;->L:Z

    .line 70
    .line 71
    :cond_1
    return p0
.end method

.method public static J(F)F
    .locals 1

    .line 1
    sget v0, Lcom/android/launcher3/anim/C;->W:F

    .line 2
    .line 3
    cmpl-float p0, p0, v0

    .line 4
    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/high16 p0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static U(Lcom/android/launcher3/statemanager/h;I)Landroid/graphics/RectF;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-direct {v0, v1, v1, v2, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 7
    .line 8
    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    const/4 v1, 0x3

    .line 20
    const/high16 v2, 0x40000000    # 2.0f

    .line 21
    .line 22
    if-ne p1, v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const v1, 0x7f070512

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    div-float/2addr p1, v2

    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 41
    .line 42
    int-to-float v1, v1

    .line 43
    div-float/2addr v1, v2

    .line 44
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const v4, 0x7f070511

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    const v5, 0x7f07050f

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    div-float/2addr v4, v2

    .line 67
    add-float/2addr v3, v4

    .line 68
    div-float v4, p1, v2

    .line 69
    .line 70
    sub-float/2addr v1, v4

    .line 71
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    div-float/2addr v1, v2

    .line 82
    sub-float/2addr v3, v1

    .line 83
    iput v3, v0, Landroid/graphics/RectF;->top:F

    .line 84
    .line 85
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 86
    .line 87
    add-float/2addr v1, p1

    .line 88
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    add-float/2addr v3, p0

    .line 99
    iput v3, v0, Landroid/graphics/RectF;->bottom:F

    .line 100
    .line 101
    return-object v0

    .line 102
    :cond_1
    const/4 v1, 0x5

    .line 103
    if-ne p1, v1, :cond_2

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    const v1, 0x7f070513

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget v1, v1, Lcom/android/launcher3/h0;->T0:I

    .line 121
    .line 122
    int-to-float v1, v1

    .line 123
    div-float/2addr v1, v2

    .line 124
    div-float v2, p1, v2

    .line 125
    .line 126
    sub-float/2addr v1, v2

    .line 127
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    const v1, 0x7f070514

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    iput p0, v0, Landroid/graphics/RectF;->top:F

    .line 141
    .line 142
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 143
    .line 144
    add-float/2addr v1, p1

    .line 145
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 146
    .line 147
    const p1, 0x3dcccccd    # 0.1f

    .line 148
    .line 149
    .line 150
    add-float/2addr p0, p1

    .line 151
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 152
    .line 153
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static a0(F)I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    const/high16 v6, 0x43480000    # 200.0f

    .line 9
    .line 10
    sget-object v7, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/high16 v4, 0x3f800000    # 1.0f

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/anim/C;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/anim/C;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b0(Lcom/android/launcher3/h0;)Landroid/graphics/RectF;
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    const/high16 v2, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr v0, v2

    .line 10
    const v2, 0x40533333    # 3.3f

    .line 11
    .line 12
    .line 13
    div-float/2addr v1, v2

    .line 14
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 15
    .line 16
    div-int/lit8 p0, p0, 0x2

    .line 17
    .line 18
    new-instance v2, Landroid/graphics/RectF;

    .line 19
    .line 20
    int-to-float p0, p0

    .line 21
    sub-float v3, v0, p0

    .line 22
    .line 23
    sub-float v4, v1, p0

    .line 24
    .line 25
    add-float/2addr v0, p0

    .line 26
    add-float/2addr v1, p0

    .line 27
    invoke-direct {v2, v3, v4, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 28
    .line 29
    .line 30
    return-object v2
.end method

.method static bridge synthetic c(Lcom/android/launcher3/anim/C;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->O:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/anim/C;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->P:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static d0(F)F
    .locals 1

    .line 1
    sget v0, Lcom/android/launcher3/anim/C;->R:F

    .line 2
    .line 3
    cmpl-float p0, p0, v0

    .line 4
    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    return p0
.end method

.method static bridge synthetic e(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/android/launcher3/anim/C;->m0:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method private static f0(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    const/4 v3, -0x1

    .line 19
    if-ge v2, v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    move v2, v3

    .line 36
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 37
    .line 38
    :goto_2
    if-ltz v0, :cond_4

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_3

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_4
    move v0, v3

    .line 55
    :goto_3
    if-eq v2, v3, :cond_5

    .line 56
    .line 57
    if-eq v0, v3, :cond_5

    .line 58
    .line 59
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_5
    return-object v1
.end method

.method public static g0(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseCompatLoadingForDrawables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/graphics/drawable/Drawable;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of p2, p2, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lt1/f;->F(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public static h0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 15
    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget v0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 23
    .line 24
    div-int/lit8 v0, v0, 0x2

    .line 25
    .line 26
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 27
    .line 28
    div-int/lit8 p0, p0, 0x2

    .line 29
    .line 30
    new-instance v2, Landroid/graphics/PointF;

    .line 31
    .line 32
    int-to-float v0, v0

    .line 33
    int-to-float p0, p0

    .line 34
    invoke-direct {v2, v0, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/android/launcher3/anim/C;->q0(Landroid/graphics/PointF;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const/4 v0, 0x0

    .line 42
    invoke-virtual {v1, p0, v0}, Lcom/android/launcher3/anim/C;->w(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static i0(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public static j(Lcom/android/launcher3/statemanager/h;Landroid/view/RemoteAnimationTarget;Z)I
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->U1()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, -0x1

    .line 6
    if-eqz p2, :cond_5

    .line 7
    .line 8
    invoke-static {}, Lx1/O;->V1()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_5

    .line 13
    .line 14
    invoke-static {}, Lx1/O;->C2()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_5

    .line 19
    .line 20
    instance-of p0, p0, Lcom/android/launcher3/C2;

    .line 21
    .line 22
    if-eqz p0, :cond_5

    .line 23
    .line 24
    if-eqz p1, :cond_5

    .line 25
    .line 26
    iget-object p0, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 27
    .line 28
    if-eqz p0, :cond_5

    .line 29
    .line 30
    iget-object p1, p0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p2, p0, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 35
    .line 36
    if-nez p2, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    if-eqz p1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object p1, p0, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 43
    .line 44
    :goto_0
    sget-object p0, Lcom/android/launcher3/anim/C;->i0:Landroid/content/ComponentName;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_2
    sget-object p0, Lcom/android/launcher3/anim/C;->a0:Landroid/content/ComponentName;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    :cond_3
    sget-object p0, Lcom/android/launcher3/anim/C;->j0:Landroid/content/ComponentName;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_4

    .line 71
    .line 72
    const/4 p0, 0x3

    .line 73
    return p0

    .line 74
    :cond_4
    sget-object p0, Lcom/android/launcher3/anim/C;->k0:Landroid/content/ComponentName;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_5

    .line 81
    .line 82
    const/4 p0, 0x4

    .line 83
    return p0

    .line 84
    :cond_5
    :goto_1
    return v0
.end method

.method private synthetic j0()V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "persist.sys.theme_icon_name"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "persist.sys.icon_config_mask"

    .line 14
    .line 15
    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v2, "mThemeName "

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, " "

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "AppOCAnimHelper"

    .line 51
    .line 52
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->x:Z

    .line 57
    .line 58
    invoke-static {}, Lx1/S;->r()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    const-string v3, "config_4"

    .line 63
    .line 64
    const-string v4, "config_3"

    .line 65
    .line 66
    const v5, 0x3e9e0652

    .line 67
    .line 68
    .line 69
    const-string v6, "config_2"

    .line 70
    .line 71
    const-string v7, "config_1"

    .line 72
    .line 73
    const/high16 v8, 0x3f000000    # 0.5f

    .line 74
    .line 75
    const-string v9, "config"

    .line 76
    .line 77
    const v10, 0x3e18231c

    .line 78
    .line 79
    .line 80
    const-string v11, "default_theme_11"

    .line 81
    .line 82
    const-string v12, "default_theme_04"

    .line 83
    .line 84
    const-string v13, "default_theme_27"

    .line 85
    .line 86
    const v14, 0x3e638e39

    .line 87
    .line 88
    .line 89
    if-eqz v2, :cond_d

    .line 90
    .line 91
    const-string v2, "default_theme_24"

    .line 92
    .line 93
    iget-object v15, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_0

    .line 100
    .line 101
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 102
    .line 103
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 104
    .line 105
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 106
    .line 107
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 108
    .line 109
    return-void

    .line 110
    :cond_0
    const-string v2, "ZT653f1821e4b010526441f698"

    .line 111
    .line 112
    iget-object v15, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-nez v2, :cond_c

    .line 119
    .line 120
    const-string v2, "default_theme_29"

    .line 121
    .line 122
    iget-object v15, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-nez v2, :cond_c

    .line 129
    .line 130
    const-string v2, "default_theme_30"

    .line 131
    .line 132
    iget-object v15, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_1

    .line 139
    .line 140
    goto/16 :goto_3

    .line 141
    .line 142
    :cond_1
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-nez v2, :cond_6

    .line 149
    .line 150
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-eqz v2, :cond_2

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_2
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-nez v2, :cond_5

    .line 166
    .line 167
    const-string v2, "default_theme_26"

    .line 168
    .line 169
    iget-object v3, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-eqz v2, :cond_3

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_3
    const-string v2, "default_theme_61"

    .line 179
    .line 180
    iget-object v3, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-eqz v2, :cond_4

    .line 187
    .line 188
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 189
    .line 190
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 191
    .line 192
    iput v10, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 193
    .line 194
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 195
    .line 196
    return-void

    .line 197
    :cond_4
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 198
    .line 199
    iget v1, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 200
    .line 201
    iput v1, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 202
    .line 203
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 204
    .line 205
    return-void

    .line 206
    :cond_5
    :goto_0
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 207
    .line 208
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 209
    .line 210
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 211
    .line 212
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 213
    .line 214
    return-void

    .line 215
    :cond_6
    :goto_1
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 216
    .line 217
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 218
    .line 219
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eqz v2, :cond_7

    .line 226
    .line 227
    iput v8, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_7
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    if-eqz v2, :cond_8

    .line 237
    .line 238
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_8
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-eqz v2, :cond_9

    .line 248
    .line 249
    iput v5, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 250
    .line 251
    goto :goto_2

    .line 252
    :cond_9
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    if-eqz v2, :cond_a

    .line 259
    .line 260
    const v2, 0x3de38e39

    .line 261
    .line 262
    .line 263
    iput v2, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 264
    .line 265
    const/4 v4, 0x1

    .line 266
    iput-boolean v4, v0, Lcom/android/launcher3/anim/C;->x:Z

    .line 267
    .line 268
    goto :goto_2

    .line 269
    :cond_a
    const v2, 0x3de38e39

    .line 270
    .line 271
    .line 272
    const/4 v4, 0x1

    .line 273
    iget-object v5, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v3

    .line 279
    if-eqz v3, :cond_b

    .line 280
    .line 281
    iput v2, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 282
    .line 283
    iput-boolean v4, v0, Lcom/android/launcher3/anim/C;->x:Z

    .line 284
    .line 285
    :cond_b
    :goto_2
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 286
    .line 287
    return-void

    .line 288
    :cond_c
    :goto_3
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 289
    .line 290
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 291
    .line 292
    const v2, 0x3e24587e

    .line 293
    .line 294
    .line 295
    iput v2, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 296
    .line 297
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 298
    .line 299
    return-void

    .line 300
    :cond_d
    invoke-static {}, Lx1/c0;->d()Z

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    if-eqz v2, :cond_e

    .line 305
    .line 306
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 307
    .line 308
    iput v1, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 309
    .line 310
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 311
    .line 312
    return-void

    .line 313
    :cond_e
    const-string v2, "default_theme_13"

    .line 314
    .line 315
    iget-object v15, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    if-nez v2, :cond_12

    .line 322
    .line 323
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 324
    .line 325
    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    if-nez v2, :cond_12

    .line 330
    .line 331
    const-string v2, "default_theme_49"

    .line 332
    .line 333
    iget-object v12, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v2

    .line 339
    if-nez v2, :cond_12

    .line 340
    .line 341
    const-string v2, "default_theme_59"

    .line 342
    .line 343
    iget-object v12, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result v2

    .line 349
    if-nez v2, :cond_12

    .line 350
    .line 351
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 352
    .line 353
    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    move-result v2

    .line 357
    if-eqz v2, :cond_f

    .line 358
    .line 359
    goto :goto_4

    .line 360
    :cond_f
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 361
    .line 362
    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    if-eqz v2, :cond_10

    .line 367
    .line 368
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 369
    .line 370
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 371
    .line 372
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 373
    .line 374
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 375
    .line 376
    return-void

    .line 377
    :cond_10
    const-string v2, "default_theme_60"

    .line 378
    .line 379
    iget-object v3, v0, Lcom/android/launcher3/anim/C;->r:Ljava/lang/String;

    .line 380
    .line 381
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result v2

    .line 385
    if-eqz v2, :cond_11

    .line 386
    .line 387
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 388
    .line 389
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 390
    .line 391
    iput v10, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 392
    .line 393
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 394
    .line 395
    return-void

    .line 396
    :cond_11
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 397
    .line 398
    iput v1, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 399
    .line 400
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 401
    .line 402
    return-void

    .line 403
    :cond_12
    :goto_4
    iget v2, v0, Lcom/android/launcher3/anim/C;->s:I

    .line 404
    .line 405
    iput v2, v0, Lcom/android/launcher3/anim/C;->u:I

    .line 406
    .line 407
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 408
    .line 409
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v2

    .line 413
    if-eqz v2, :cond_13

    .line 414
    .line 415
    iput v8, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 416
    .line 417
    goto :goto_5

    .line 418
    :cond_13
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 419
    .line 420
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result v2

    .line 424
    if-eqz v2, :cond_14

    .line 425
    .line 426
    iput v14, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 427
    .line 428
    goto :goto_5

    .line 429
    :cond_14
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 430
    .line 431
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result v2

    .line 435
    if-eqz v2, :cond_15

    .line 436
    .line 437
    iput v5, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 438
    .line 439
    goto :goto_5

    .line 440
    :cond_15
    iget-object v2, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 441
    .line 442
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 443
    .line 444
    .line 445
    move-result v2

    .line 446
    if-eqz v2, :cond_16

    .line 447
    .line 448
    const v2, 0x3de38e39

    .line 449
    .line 450
    .line 451
    iput v2, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 452
    .line 453
    const/4 v4, 0x1

    .line 454
    iput-boolean v4, v0, Lcom/android/launcher3/anim/C;->x:Z

    .line 455
    .line 456
    goto :goto_5

    .line 457
    :cond_16
    const v2, 0x3de38e39

    .line 458
    .line 459
    .line 460
    const/4 v4, 0x1

    .line 461
    iget-object v5, v0, Lcom/android/launcher3/anim/C;->q:Ljava/lang/String;

    .line 462
    .line 463
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 464
    .line 465
    .line 466
    move-result v3

    .line 467
    if-eqz v3, :cond_17

    .line 468
    .line 469
    iput v2, v0, Lcom/android/launcher3/anim/C;->p:F

    .line 470
    .line 471
    iput-boolean v4, v0, Lcom/android/launcher3/anim/C;->x:Z

    .line 472
    .line 473
    :cond_17
    :goto_5
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->w:Z

    .line 474
    .line 475
    return-void
.end method

.method private k0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->O:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->N:Lcom/android/launcher3/anim/C$e;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "register AppActivityEventCallback!"

    .line 11
    .line 12
    const-string v1, "AppOCAnimHelper"

    .line 13
    .line 14
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->O:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/zte/activityevent/ActivityEventsManager;->getInstance(Landroid/content/Context;)Lcom/zte/activityevent/ActivityEventsManager;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "mBinderForTopAtyMFVDock"

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->N:Lcom/android/launcher3/anim/C$e;

    .line 30
    .line 31
    const/16 v3, 0x290

    .line 32
    .line 33
    invoke-virtual {v0, v2, p0, v3}, Lcom/zte/activityevent/ActivityEventsManager;->addCallBack(Ljava/lang/String;Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "registerAppActivityEventCallback: Exception = "

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method

.method public static n(Landroid/view/RemoteAnimationTarget;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->W1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    invoke-static {}, Lx1/O;->V1()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_4

    .line 13
    .line 14
    if-eqz p0, :cond_4

    .line 15
    .line 16
    iget-object v0, p0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 17
    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    iget-object v2, v0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    sget-object v2, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move-object v0, v1

    .line 45
    :goto_0
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 46
    .line 47
    iget-object v2, p0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 48
    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    iget-object v2, p0, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 53
    .line 54
    :goto_1
    if-eqz v0, :cond_4

    .line 55
    .line 56
    iget-object p0, v0, Lcom/android/launcher3/anim/C;->M:Ljava/util/Map;

    .line 57
    .line 58
    invoke-interface {p0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_4

    .line 63
    .line 64
    iget-object p0, v0, Lcom/android/launcher3/anim/C;->M:Ljava/util/Map;

    .line 65
    .line 66
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_3
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_4
    :goto_2
    return-object v1
.end method

.method public static n0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-boolean v1, v0, Lcom/android/launcher3/anim/C;->K:Z

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static t(Lcom/android/launcher3/statemanager/h;Landroid/view/RemoteAnimationTarget;Z)Z
    .locals 8

    .line 1
    invoke-static {}, Lx1/O;->V1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_8

    .line 7
    .line 8
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 9
    .line 10
    if-eqz v0, :cond_8

    .line 11
    .line 12
    if-eqz p1, :cond_8

    .line 13
    .line 14
    iget-object v0, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 15
    .line 16
    if-eqz v0, :cond_8

    .line 17
    .line 18
    iget-object v2, v0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_0
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 35
    .line 36
    iget-boolean v2, v0, Lcom/android/launcher3/anim/C;->y:Z

    .line 37
    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    return v1

    .line 41
    :cond_1
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 42
    .line 43
    iget-object v2, p1, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 44
    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    iget-object v2, p1, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 49
    .line 50
    :goto_0
    sget-object p1, Lcom/android/launcher3/anim/C;->e0:[Landroid/content/ComponentName;

    .line 51
    .line 52
    array-length v3, p1

    .line 53
    move v4, v1

    .line 54
    :goto_1
    const/4 v5, 0x1

    .line 55
    if-ge v4, v3, :cond_7

    .line 56
    .line 57
    aget-object v6, p1, v4

    .line 58
    .line 59
    invoke-virtual {v6, v2}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eqz v7, :cond_6

    .line 64
    .line 65
    sget-object p1, Lcom/android/launcher3/anim/C;->b0:Landroid/content/ComponentName;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_3

    .line 80
    .line 81
    iget-boolean p0, v0, Lcom/android/launcher3/anim/C;->z:Z

    .line 82
    .line 83
    return p0

    .line 84
    :cond_3
    sget-object p1, Lcom/android/launcher3/anim/C;->Z:Landroid/content/ComponentName;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_5

    .line 99
    .line 100
    if-eqz p2, :cond_5

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    const-string p2, "end_call_for_live_island"

    .line 107
    .line 108
    invoke-static {p1, p2, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {p0, p2, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 117
    .line 118
    .line 119
    if-nez p1, :cond_4

    .line 120
    .line 121
    return v5

    .line 122
    :cond_4
    return v1

    .line 123
    :cond_5
    return v5

    .line 124
    :cond_6
    add-int/lit8 v4, v4, 0x1

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_7
    iget-boolean p0, v0, Lcom/android/launcher3/anim/C;->A:Z

    .line 128
    .line 129
    if-eqz p0, :cond_8

    .line 130
    .line 131
    if-eqz v2, :cond_8

    .line 132
    .line 133
    iget-object p0, v0, Lcom/android/launcher3/anim/C;->B:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz p0, :cond_8

    .line 136
    .line 137
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-eqz p0, :cond_8

    .line 146
    .line 147
    return v5

    .line 148
    :cond_8
    :goto_2
    return v1
.end method

.method public static u0(Landroid/view/View;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/android/launcher3/anim/C;->l0:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public static v0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;I)V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x1

    .line 10
    sget-object v6, Lcom/android/launcher3/anim/C;->m0:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    const/4 v7, 0x0

    .line 13
    if-eqz v6, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lx1/O;->Y2()Z

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    if-eqz v6, :cond_0

    .line 20
    .line 21
    sget-object v6, Lcom/android/launcher3/anim/C;->m0:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->end()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object v6, Lcom/android/launcher3/anim/C;->m0:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->cancel()V

    .line 30
    .line 31
    .line 32
    :goto_0
    sput-object v7, Lcom/android/launcher3/anim/C;->m0:Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    :cond_1
    if-nez v0, :cond_2

    .line 35
    .line 36
    move-object v6, v7

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    sget-object v6, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 39
    .line 40
    invoke-virtual {v6, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    check-cast v6, Lcom/android/launcher3/anim/C;

    .line 45
    .line 46
    :goto_1
    if-eqz v6, :cond_21

    .line 47
    .line 48
    iget-boolean v8, v6, Lcom/android/launcher3/anim/C;->F:Z

    .line 49
    .line 50
    if-nez v8, :cond_21

    .line 51
    .line 52
    if-nez v2, :cond_3

    .line 53
    .line 54
    invoke-static {}, Lx1/O;->W2()Z

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    if-nez v8, :cond_21

    .line 59
    .line 60
    :cond_3
    invoke-static {}, Lx1/O;->X2()Z

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    if-eqz v8, :cond_4

    .line 65
    .line 66
    if-eqz v2, :cond_21

    .line 67
    .line 68
    if-ne v2, v5, :cond_4

    .line 69
    .line 70
    goto/16 :goto_1a

    .line 71
    .line 72
    :cond_4
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->C()Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    if-nez v2, :cond_5

    .line 77
    .line 78
    if-eqz v8, :cond_5

    .line 79
    .line 80
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    instance-of v9, v9, Lcom/android/launcher3/model/data/y;

    .line 85
    .line 86
    if-eqz v9, :cond_5

    .line 87
    .line 88
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    check-cast v8, Lcom/android/launcher3/model/data/y;

    .line 93
    .line 94
    iget v8, v8, Lcom/android/launcher3/model/data/y;->container:I

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_5
    const/4 v8, -0x1

    .line 98
    :goto_2
    if-lez v8, :cond_6

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 101
    .line 102
    .line 103
    move-result-object v9

    .line 104
    invoke-virtual {v9, v8}, Lcom/android/launcher3/Workspace;->g1(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    goto :goto_3

    .line 109
    :cond_6
    move-object v8, v7

    .line 110
    :goto_3
    instance-of v9, v8, Lcom/android/launcher3/folder/FolderIcon;

    .line 111
    .line 112
    if-eqz v9, :cond_7

    .line 113
    .line 114
    check-cast v8, Lcom/android/launcher3/folder/FolderIcon;

    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_7
    move-object v8, v7

    .line 118
    :goto_4
    if-eqz v8, :cond_8

    .line 119
    .line 120
    invoke-virtual {v8}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    invoke-virtual {v9}, Lcom/android/launcher3/a;->isOpen()Z

    .line 125
    .line 126
    .line 127
    move-result v9

    .line 128
    if-eqz v9, :cond_8

    .line 129
    .line 130
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    iget-boolean v9, v9, Lcom/android/launcher3/r4;->g0:Z

    .line 135
    .line 136
    if-nez v9, :cond_8

    .line 137
    .line 138
    invoke-virtual {v8}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v2, "scaleX"

    .line 143
    .line 144
    const v3, 0x3f733333    # 0.95f

    .line 145
    .line 146
    .line 147
    new-array v6, v5, [F

    .line 148
    .line 149
    aput v3, v6, v4

    .line 150
    .line 151
    invoke-static {v0, v2, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    sget-object v6, Lcom/android/launcher3/anim/L;->o:Landroid/view/animation/Interpolator;

    .line 156
    .line 157
    invoke-virtual {v2, v6}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 158
    .line 159
    .line 160
    sget v7, Lcom/android/launcher3/anim/C;->Q:I

    .line 161
    .line 162
    int-to-long v8, v7

    .line 163
    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 167
    .line 168
    .line 169
    const-string v2, "scaleY"

    .line 170
    .line 171
    new-array v5, v5, [F

    .line 172
    .line 173
    aput v3, v5, v4

    .line 174
    .line 175
    invoke-static {v0, v2, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v2, v6}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 180
    .line 181
    .line 182
    int-to-long v3, v7

    .line 183
    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 187
    .line 188
    .line 189
    new-instance v2, Lcom/android/launcher3/anim/C$a;

    .line 190
    .line 191
    invoke-direct {v2, v0}, Lcom/android/launcher3/anim/C$a;-><init>(Lcom/android/launcher3/folder/Folder;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_8
    invoke-static {}, Lx1/O;->Y2()Z

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    if-eqz v8, :cond_9

    .line 203
    .line 204
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->m0()V

    .line 205
    .line 206
    .line 207
    :cond_9
    if-eq v2, v3, :cond_b

    .line 208
    .line 209
    if-ne v2, v5, :cond_a

    .line 210
    .line 211
    goto :goto_5

    .line 212
    :cond_a
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->e0()Landroid/graphics/PointF;

    .line 213
    .line 214
    .line 215
    move-result-object v8

    .line 216
    goto :goto_6

    .line 217
    :cond_b
    :goto_5
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->D()Landroid/graphics/PointF;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    :goto_6
    const/high16 v9, 0x3f800000    # 1.0f

    .line 222
    .line 223
    if-nez v2, :cond_c

    .line 224
    .line 225
    move v10, v9

    .line 226
    goto :goto_8

    .line 227
    :cond_c
    invoke-static {}, Lx1/O;->W2()Z

    .line 228
    .line 229
    .line 230
    move-result v10

    .line 231
    if-eqz v10, :cond_d

    .line 232
    .line 233
    if-ne v2, v5, :cond_d

    .line 234
    .line 235
    move v10, v5

    .line 236
    goto :goto_7

    .line 237
    :cond_d
    move v10, v4

    .line 238
    :goto_7
    int-to-float v10, v10

    .line 239
    :goto_8
    if-nez v2, :cond_e

    .line 240
    .line 241
    invoke-static {}, Lx1/O;->W2()Z

    .line 242
    .line 243
    .line 244
    move-result v12

    .line 245
    if-nez v12, :cond_e

    .line 246
    .line 247
    move v12, v10

    .line 248
    const/4 v10, 0x0

    .line 249
    goto :goto_9

    .line 250
    :cond_e
    move v12, v10

    .line 251
    move v10, v9

    .line 252
    :goto_9
    const v13, 0x3f666666    # 0.9f

    .line 253
    .line 254
    .line 255
    if-nez v2, :cond_f

    .line 256
    .line 257
    move v14, v9

    .line 258
    goto :goto_a

    .line 259
    :cond_f
    invoke-static {}, Lx1/O;->W2()Z

    .line 260
    .line 261
    .line 262
    move-result v14

    .line 263
    if-eqz v14, :cond_10

    .line 264
    .line 265
    if-ne v2, v5, :cond_10

    .line 266
    .line 267
    const/high16 v14, 0x3fa00000    # 1.25f

    .line 268
    .line 269
    goto :goto_a

    .line 270
    :cond_10
    move v14, v13

    .line 271
    :goto_a
    if-nez v2, :cond_11

    .line 272
    .line 273
    invoke-static {}, Lx1/O;->W2()Z

    .line 274
    .line 275
    .line 276
    move-result v15

    .line 277
    if-nez v15, :cond_11

    .line 278
    .line 279
    goto :goto_b

    .line 280
    :cond_11
    move v13, v9

    .line 281
    :goto_b
    invoke-static {}, Lx1/O;->Y2()Z

    .line 282
    .line 283
    .line 284
    move-result v9

    .line 285
    if-eqz v9, :cond_12

    .line 286
    .line 287
    sget-object v9, Lcom/android/launcher3/anim/L;->V:Landroid/view/animation/Interpolator;

    .line 288
    .line 289
    goto :goto_c

    .line 290
    :cond_12
    if-nez v2, :cond_13

    .line 291
    .line 292
    sget-object v9, Lcom/android/launcher3/anim/L;->x:Landroid/view/animation/Interpolator;

    .line 293
    .line 294
    goto :goto_c

    .line 295
    :cond_13
    sget-object v9, Lcom/android/launcher3/anim/L;->C:Landroid/view/animation/Interpolator;

    .line 296
    .line 297
    :goto_c
    invoke-static {}, Lx1/O;->Y2()Z

    .line 298
    .line 299
    .line 300
    move-result v15

    .line 301
    if-eqz v15, :cond_14

    .line 302
    .line 303
    sget-object v15, Lcom/android/launcher3/anim/L;->W:Landroid/view/animation/Interpolator;

    .line 304
    .line 305
    goto :goto_d

    .line 306
    :cond_14
    if-nez v2, :cond_15

    .line 307
    .line 308
    sget-object v15, Lcom/android/launcher3/anim/L;->x:Landroid/view/animation/Interpolator;

    .line 309
    .line 310
    goto :goto_d

    .line 311
    :cond_15
    sget-object v15, Lcom/android/launcher3/anim/L;->C:Landroid/view/animation/Interpolator;

    .line 312
    .line 313
    :goto_d
    sget-boolean v16, LU2/a;->a:Z

    .line 314
    .line 315
    if-eqz v16, :cond_17

    .line 316
    .line 317
    if-eq v2, v5, :cond_16

    .line 318
    .line 319
    if-ne v2, v3, :cond_17

    .line 320
    .line 321
    :cond_16
    move/from16 v16, v4

    .line 322
    .line 323
    goto :goto_e

    .line 324
    :cond_17
    move/from16 v16, v4

    .line 325
    .line 326
    goto :goto_10

    .line 327
    :goto_e
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    iget-boolean v4, v4, Lu2/e;->m:Z

    .line 332
    .line 333
    if-eqz v4, :cond_18

    .line 334
    .line 335
    invoke-static {}, Lx1/O;->U2()Z

    .line 336
    .line 337
    .line 338
    move-result v4

    .line 339
    if-nez v4, :cond_18

    .line 340
    .line 341
    invoke-static {}, Lx1/O;->Y2()Z

    .line 342
    .line 343
    .line 344
    move-result v4

    .line 345
    if-nez v4, :cond_18

    .line 346
    .line 347
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 348
    .line 349
    .line 350
    move-result-object v4

    .line 351
    iget v4, v4, Lu2/e;->l:F

    .line 352
    .line 353
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 354
    .line 355
    .line 356
    move-result-object v12

    .line 357
    iget v14, v12, Lu2/e;->k:F

    .line 358
    .line 359
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 360
    .line 361
    .line 362
    move-result-object v12

    .line 363
    iget-object v12, v12, Lu2/e;->j:Landroid/graphics/PointF;

    .line 364
    .line 365
    invoke-virtual {v8, v12}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 366
    .line 367
    .line 368
    :goto_f
    move v12, v14

    .line 369
    goto :goto_11

    .line 370
    :cond_18
    :goto_10
    move v4, v12

    .line 371
    goto :goto_f

    .line 372
    :goto_11
    invoke-virtual {v6}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 373
    .line 374
    .line 375
    move-result-object v14

    .line 376
    iget-object v14, v14, Lu2/e;->j:Landroid/graphics/PointF;

    .line 377
    .line 378
    invoke-virtual {v14, v8}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 382
    .line 383
    .line 384
    move-result-object v14

    .line 385
    move/from16 v17, v16

    .line 386
    .line 387
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 388
    .line 389
    .line 390
    move-result-object v16

    .line 391
    if-eqz v16, :cond_19

    .line 392
    .line 393
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 394
    .line 395
    .line 396
    move-result-object v7

    .line 397
    iget-boolean v7, v7, Lcom/android/launcher3/r4;->g0:Z

    .line 398
    .line 399
    if-eqz v7, :cond_19

    .line 400
    .line 401
    move-object v7, v15

    .line 402
    move v15, v5

    .line 403
    goto :goto_12

    .line 404
    :cond_19
    move-object v7, v15

    .line 405
    move/from16 v15, v17

    .line 406
    .line 407
    :goto_12
    iget v11, v8, Landroid/graphics/PointF;->x:F

    .line 408
    .line 409
    invoke-virtual {v14, v11}, Landroid/view/ViewGroup;->setPivotX(F)V

    .line 410
    .line 411
    .line 412
    iget v11, v8, Landroid/graphics/PointF;->y:F

    .line 413
    .line 414
    invoke-virtual {v14, v11}, Landroid/view/ViewGroup;->setPivotY(F)V

    .line 415
    .line 416
    .line 417
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 418
    .line 419
    .line 420
    move-result-object v11

    .line 421
    move/from16 v22, v5

    .line 422
    .line 423
    new-array v5, v3, [I

    .line 424
    .line 425
    invoke-virtual {v11, v5}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 426
    .line 427
    .line 428
    new-instance v3, Landroid/graphics/PointF;

    .line 429
    .line 430
    iget v0, v8, Landroid/graphics/PointF;->x:F

    .line 431
    .line 432
    move/from16 v21, v0

    .line 433
    .line 434
    aget v0, v5, v17

    .line 435
    .line 436
    int-to-float v0, v0

    .line 437
    sub-float v0, v21, v0

    .line 438
    .line 439
    move/from16 v21, v4

    .line 440
    .line 441
    iget v4, v8, Landroid/graphics/PointF;->y:F

    .line 442
    .line 443
    aget v5, v5, v22

    .line 444
    .line 445
    int-to-float v5, v5

    .line 446
    sub-float/2addr v4, v5

    .line 447
    invoke-direct {v3, v0, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 448
    .line 449
    .line 450
    iget v0, v3, Landroid/graphics/PointF;->x:F

    .line 451
    .line 452
    invoke-virtual {v11, v0}, Landroid/view/ViewGroup;->setPivotX(F)V

    .line 453
    .line 454
    .line 455
    iget v0, v3, Landroid/graphics/PointF;->y:F

    .line 456
    .line 457
    invoke-virtual {v11, v0}, Landroid/view/ViewGroup;->setPivotY(F)V

    .line 458
    .line 459
    .line 460
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    if-eqz v0, :cond_1a

    .line 465
    .line 466
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->k0()Z

    .line 471
    .line 472
    .line 473
    move-result v0

    .line 474
    if-eqz v0, :cond_1a

    .line 475
    .line 476
    const/4 v0, 0x0

    .line 477
    goto :goto_13

    .line 478
    :cond_1a
    invoke-virtual {v14}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 479
    .line 480
    .line 481
    move-result-object v0

    .line 482
    :goto_13
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 483
    .line 484
    .line 485
    move-result-object v4

    .line 486
    iget-object v4, v4, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 487
    .line 488
    if-eqz v4, :cond_1b

    .line 489
    .line 490
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 491
    .line 492
    .line 493
    move-result-object v4

    .line 494
    iget-object v4, v4, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 495
    .line 496
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->k:Z

    .line 497
    .line 498
    if-eqz v4, :cond_1b

    .line 499
    .line 500
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 501
    .line 502
    .line 503
    move-result-object v4

    .line 504
    :goto_14
    move-object/from16 v18, v6

    .line 505
    .line 506
    const/4 v5, 0x2

    .line 507
    goto :goto_15

    .line 508
    :cond_1b
    const/4 v4, 0x0

    .line 509
    goto :goto_14

    .line 510
    :goto_15
    new-array v6, v5, [I

    .line 511
    .line 512
    new-instance v5, Landroid/graphics/PointF;

    .line 513
    .line 514
    invoke-direct {v5}, Landroid/graphics/PointF;-><init>()V

    .line 515
    .line 516
    .line 517
    new-instance v23, Landroid/graphics/PointF;

    .line 518
    .line 519
    invoke-direct/range {v23 .. v23}, Landroid/graphics/PointF;-><init>()V

    .line 520
    .line 521
    .line 522
    if-eqz v0, :cond_1c

    .line 523
    .line 524
    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout;->getLocationOnScreen([I)V

    .line 525
    .line 526
    .line 527
    new-instance v5, Landroid/graphics/PointF;

    .line 528
    .line 529
    move-object/from16 v24, v7

    .line 530
    .line 531
    iget v7, v8, Landroid/graphics/PointF;->x:F

    .line 532
    .line 533
    move/from16 p0, v7

    .line 534
    .line 535
    aget v7, v6, v17

    .line 536
    .line 537
    int-to-float v7, v7

    .line 538
    sub-float v7, p0, v7

    .line 539
    .line 540
    move-object/from16 v25, v9

    .line 541
    .line 542
    iget v9, v8, Landroid/graphics/PointF;->y:F

    .line 543
    .line 544
    move/from16 p0, v9

    .line 545
    .line 546
    aget v9, v6, v22

    .line 547
    .line 548
    int-to-float v9, v9

    .line 549
    sub-float v9, p0, v9

    .line 550
    .line 551
    invoke-direct {v5, v7, v9}, Landroid/graphics/PointF;-><init>(FF)V

    .line 552
    .line 553
    .line 554
    iget v7, v5, Landroid/graphics/PointF;->x:F

    .line 555
    .line 556
    invoke-virtual {v0, v7}, Landroid/widget/RelativeLayout;->setPivotX(F)V

    .line 557
    .line 558
    .line 559
    iget v7, v5, Landroid/graphics/PointF;->y:F

    .line 560
    .line 561
    invoke-virtual {v0, v7}, Landroid/widget/RelativeLayout;->setPivotY(F)V

    .line 562
    .line 563
    .line 564
    goto :goto_16

    .line 565
    :cond_1c
    move-object/from16 v24, v7

    .line 566
    .line 567
    move-object/from16 v25, v9

    .line 568
    .line 569
    :goto_16
    if-eqz v4, :cond_1d

    .line 570
    .line 571
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->getLocationOnScreen([I)V

    .line 572
    .line 573
    .line 574
    new-instance v7, Landroid/graphics/PointF;

    .line 575
    .line 576
    iget v9, v8, Landroid/graphics/PointF;->x:F

    .line 577
    .line 578
    move-object/from16 v26, v0

    .line 579
    .line 580
    aget v0, v6, v17

    .line 581
    .line 582
    int-to-float v0, v0

    .line 583
    sub-float/2addr v9, v0

    .line 584
    iget v0, v8, Landroid/graphics/PointF;->y:F

    .line 585
    .line 586
    aget v6, v6, v22

    .line 587
    .line 588
    int-to-float v6, v6

    .line 589
    sub-float/2addr v0, v6

    .line 590
    invoke-direct {v7, v9, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 591
    .line 592
    .line 593
    iget v0, v7, Landroid/graphics/PointF;->x:F

    .line 594
    .line 595
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setPivotX(F)V

    .line 596
    .line 597
    .line 598
    iget v0, v7, Landroid/graphics/PointF;->y:F

    .line 599
    .line 600
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setPivotY(F)V

    .line 601
    .line 602
    .line 603
    goto :goto_17

    .line 604
    :cond_1d
    move-object/from16 v26, v0

    .line 605
    .line 606
    move-object/from16 v7, v23

    .line 607
    .line 608
    :goto_17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 609
    .line 610
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 611
    .line 612
    .line 613
    const-string v6, "getLauncherContentAnimatorMFV: "

    .line 614
    .line 615
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 619
    .line 620
    .line 621
    const-string v6, " , "

    .line 622
    .line 623
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 627
    .line 628
    .line 629
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    .line 631
    .line 632
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 633
    .line 634
    .line 635
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 636
    .line 637
    .line 638
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 639
    .line 640
    .line 641
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v0

    .line 645
    const-string v3, "AppOCAnimHelper"

    .line 646
    .line 647
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    .line 649
    .line 650
    const/4 v5, 0x2

    .line 651
    new-array v0, v5, [F

    .line 652
    .line 653
    fill-array-data v0, :array_0

    .line 654
    .line 655
    .line 656
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 657
    .line 658
    .line 659
    move-result-object v0

    .line 660
    if-nez v2, :cond_1e

    .line 661
    .line 662
    sget v3, Lcom/android/launcher3/anim/C;->Q:I

    .line 663
    .line 664
    :goto_18
    int-to-long v6, v3

    .line 665
    goto :goto_19

    .line 666
    :cond_1e
    if-ne v2, v5, :cond_1f

    .line 667
    .line 668
    invoke-static {}, Lx1/O;->Y2()Z

    .line 669
    .line 670
    .line 671
    move-result v3

    .line 672
    if-eqz v3, :cond_1f

    .line 673
    .line 674
    sget v3, Lcom/android/launcher3/anim/C;->V:I

    .line 675
    .line 676
    goto :goto_18

    .line 677
    :cond_1f
    sget v3, Lcom/android/launcher3/anim/C;->T:I

    .line 678
    .line 679
    goto :goto_18

    .line 680
    :goto_19
    invoke-virtual {v0, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 681
    .line 682
    .line 683
    sget-object v3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 684
    .line 685
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 686
    .line 687
    .line 688
    invoke-static {}, Lx1/O;->Y2()Z

    .line 689
    .line 690
    .line 691
    move-result v3

    .line 692
    if-eqz v3, :cond_20

    .line 693
    .line 694
    const/4 v5, 0x2

    .line 695
    if-ne v2, v5, :cond_20

    .line 696
    .line 697
    const-wide/16 v2, 0x64

    .line 698
    .line 699
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 700
    .line 701
    .line 702
    :cond_20
    sput-object v0, Lcom/android/launcher3/anim/C;->m0:Landroid/animation/ValueAnimator;

    .line 703
    .line 704
    new-instance v8, Lcom/android/launcher3/anim/C$b;

    .line 705
    .line 706
    move-object/from16 v20, v4

    .line 707
    .line 708
    move-object/from16 v17, v14

    .line 709
    .line 710
    move/from16 v9, v21

    .line 711
    .line 712
    move-object/from16 v14, v24

    .line 713
    .line 714
    move-object/from16 v19, v26

    .line 715
    .line 716
    const/4 v2, 0x0

    .line 717
    move-object/from16 v21, v18

    .line 718
    .line 719
    move-object/from16 v18, v11

    .line 720
    .line 721
    move-object/from16 v11, v25

    .line 722
    .line 723
    invoke-direct/range {v8 .. v21}, Lcom/android/launcher3/anim/C$b;-><init>(FFLandroid/view/animation/Interpolator;FFLandroid/view/animation/Interpolator;ZLcom/android/launcher3/folder/Folder;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Lcom/android/launcher3/anim/C;)V

    .line 724
    .line 725
    .line 726
    move-object/from16 v3, v17

    .line 727
    .line 728
    move-object/from16 v4, v18

    .line 729
    .line 730
    move-object/from16 v5, v19

    .line 731
    .line 732
    move-object/from16 v6, v20

    .line 733
    .line 734
    new-instance v7, Lcom/android/launcher3/anim/C$c;

    .line 735
    .line 736
    invoke-direct {v7, v3, v4, v5, v6}, Lcom/android/launcher3/anim/C$c;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;)V

    .line 737
    .line 738
    .line 739
    invoke-virtual {v0, v7}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 740
    .line 741
    .line 742
    move/from16 v3, v22

    .line 743
    .line 744
    invoke-virtual {v8, v2, v3}, Lcom/android/quickstep/util/MultiValueUpdateListener;->onUpdate(FZ)V

    .line 745
    .line 746
    .line 747
    invoke-virtual {v0, v8}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 748
    .line 749
    .line 750
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 751
    .line 752
    .line 753
    :cond_21
    :goto_1a
    return-void

    .line 754
    nop

    .line 755
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static w0(Landroid/content/Context;)Lcom/android/launcher3/C2;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->g0()[Lz1/y0$b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    array-length v0, p0

    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    if-ge v1, v0, :cond_1

    .line 24
    .line 25
    aget-object v2, p0, v1

    .line 26
    .line 27
    instance-of v3, v2, Lcom/android/launcher3/C2;

    .line 28
    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    check-cast v2, Lcom/android/launcher3/C2;

    .line 32
    .line 33
    return-object v2

    .line 34
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method private x0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->O:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->N:Lcom/android/launcher3/anim/C$e;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "recentApp: unregister AppActivityEventCallback!"

    .line 11
    .line 12
    const-string v1, "AppOCAnimHelper"

    .line 13
    .line 14
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->O:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/zte/activityevent/ActivityEventsManager;->getInstance(Landroid/content/Context;)Lcom/zte/activityevent/ActivityEventsManager;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "mBinderForTopAtyMFVDock"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/zte/activityevent/ActivityEventsManager;->delCallBack(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v2, "registerAppActivityEventCallback: Exception = "

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    return-void
.end method

.method public static y0(Landroid/graphics/RectF;Landroid/graphics/RectF;FFLandroid/graphics/RectF;F)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->T()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float v0, v0

    .line 26
    mul-float/2addr v0, p5

    .line 27
    const/4 p5, 0x0

    .line 28
    cmpl-float p5, v0, p5

    .line 29
    .line 30
    if-eqz p5, :cond_2

    .line 31
    .line 32
    cmpl-float p2, p2, p3

    .line 33
    .line 34
    if-lez p2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    :goto_0
    div-float/2addr p0, p2

    .line 45
    mul-float/2addr p0, v0

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    neg-float p0, p0

    .line 57
    invoke-virtual {p1, p0, p0}, Landroid/graphics/RectF;->inset(FF)V

    .line 58
    .line 59
    .line 60
    :cond_2
    const/4 p0, 0x1

    .line 61
    return p0
.end method


# virtual methods
.method public A()Lu2/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->C:Lu2/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public B0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/anim/A;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/anim/A;-><init>(Lcom/android/launcher3/anim/C;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public C()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->k:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public C0(Landroid/content/ComponentName;)Landroid/content/ComponentName;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.android.contacts"

    .line 6
    .line 7
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->o:Landroid/content/ComponentName;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    return-object p1
.end method

.method public D()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/anim/C;->p:F

    .line 2
    .line 3
    return p0
.end method

.method public M(Landroid/view/View;)F
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p0, p0, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    iget v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    iget p0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 23
    .line 24
    if-ne p0, v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const p1, 0x7f0704c8

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    :goto_0
    int-to-float p0, p0

    .line 42
    return p0

    .line 43
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const p1, 0x7f0704b9

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public P(Landroid/view/View;Z)F
    .locals 0

    .line 1
    instance-of p2, p1, Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    if-nez p2, :cond_4

    .line 4
    .line 5
    instance-of p2, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    instance-of p2, p1, Lcom/android/launcher3/widget/T;

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/anim/C;->v:I

    .line 15
    .line 16
    int-to-float p0, p0

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    int-to-float p1, p1

    .line 30
    div-float/2addr p0, p1

    .line 31
    return p0

    .line 32
    :cond_1
    instance-of p2, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 33
    .line 34
    if-eqz p2, :cond_2

    .line 35
    .line 36
    const/high16 p0, 0x3f000000    # 0.5f

    .line 37
    .line 38
    return p0

    .line 39
    :cond_2
    instance-of p1, p1, Lcom/android/quickstep/views/CapsuleView;

    .line 40
    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    iget p0, p0, Lcom/android/launcher3/anim/C;->J:F

    .line 44
    .line 45
    return p0

    .line 46
    :cond_3
    const p0, 0x3e638e39

    .line 47
    .line 48
    .line 49
    return p0

    .line 50
    :cond_4
    :goto_0
    instance-of p2, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 51
    .line 52
    if-eqz p2, :cond_8

    .line 53
    .line 54
    if-eqz p1, :cond_8

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    instance-of p2, p2, Lcom/android/launcher3/model/data/y;

    .line 61
    .line 62
    if-eqz p2, :cond_8

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 69
    .line 70
    iget p1, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 71
    .line 72
    const/4 p2, 0x3

    .line 73
    if-le p1, p2, :cond_5

    .line 74
    .line 75
    const p0, 0x3d1bb564

    .line 76
    .line 77
    .line 78
    return p0

    .line 79
    :cond_5
    const/4 p2, 0x1

    .line 80
    if-gt p1, p2, :cond_7

    .line 81
    .line 82
    iget p0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 83
    .line 84
    if-le p0, p2, :cond_6

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_6
    const p0, 0x3e6228d6

    .line 88
    .line 89
    .line 90
    return p0

    .line 91
    :cond_7
    :goto_1
    const p0, 0x3dacaa44

    .line 92
    .line 93
    .line 94
    return p0

    .line 95
    :cond_8
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->L()F

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    return p0
.end method

.method public T()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/anim/C;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public c0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->T()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/anim/C;->w:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public close()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/anim/C;->K:Z

    .line 3
    .line 4
    return-void
.end method

.method public e0()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Lcom/android/launcher3/anim/C$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->P:Ljava/util/Set;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l0(Lcom/android/launcher3/anim/C$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->P:Ljava/util/Set;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m0()V
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/launcher3/anim/C;->l:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 7
    .line 8
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 9
    .line 10
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 18
    .line 19
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 20
    .line 21
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->k:Landroid/view/View;

    .line 28
    .line 29
    return-void
.end method

.method public o0(Landroid/view/View;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/C;->k:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->k:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string p0, "AppOCAnimHelper"

    .line 22
    .line 23
    const-string p1, "setCacheClickView--itemInfo == null"

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/anim/C;->w(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget p1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v1, "com.android.contacts"

    .line 52
    .line 53
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/android/launcher3/anim/C;->o:Landroid/content/ComponentName;

    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    const/4 p1, 0x0

    .line 67
    iput-object p1, p0, Lcom/android/launcher3/anim/C;->o:Landroid/content/ComponentName;

    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public p0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/anim/C;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public q0(Landroid/graphics/PointF;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "1"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "2"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 21
    :goto_1
    iput-boolean p1, p0, Lcom/android/launcher3/anim/C;->z:Z

    .line 22
    .line 23
    return-void
.end method

.method public s0(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "dynamicIslandSwitchState "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "AppOCAnimHelper"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/android/launcher3/anim/C;->y:Z

    .line 24
    .line 25
    return-void
.end method

.method public t0(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :pswitch_0
    const-string v0, "2"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    move p1, v3

    .line 21
    goto :goto_1

    .line 22
    :pswitch_1
    const-string v0, "1"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    move p1, v2

    .line 31
    goto :goto_1

    .line 32
    :pswitch_2
    const-string v0, "0"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    move p1, v1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    const/4 p1, -0x1

    .line 43
    :goto_1
    if-eqz p1, :cond_2

    .line 44
    .line 45
    if-eq p1, v3, :cond_1

    .line 46
    .line 47
    iput v2, p0, Lcom/android/launcher3/anim/C;->G:I

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iput v1, p0, Lcom/android/launcher3/anim/C;->G:I

    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    iput v3, p0, Lcom/android/launcher3/anim/C;->G:I

    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->P:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->P:Ljava/util/Set;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/anim/C;->x0()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/anim/C;->N:Lcom/android/launcher3/anim/C$e;

    .line 13
    .line 14
    return-void
.end method

.method public w(Landroid/view/View;Z)V
    .locals 12

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x1

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-static {v4}, Lcom/android/launcher3/anim/C;->w0(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    if-nez v4, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    xor-int/lit8 v5, p2, 0x1

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    if-eqz v6, :cond_1

    .line 25
    .line 26
    iget v7, v6, Lcom/android/launcher3/model/data/y;->container:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v8, "computePivots, itemInfo is null!"

    .line 35
    .line 36
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    new-instance v8, Ljava/lang/Throwable;

    .line 40
    .line 41
    new-instance v9, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v10, "computePivots isOpening:"

    .line 47
    .line 48
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v9

    .line 58
    invoke-direct {v8, v9}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v8}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    const-string v8, "AppOCAnimHelper"

    .line 73
    .line 74
    invoke-static {v8, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    const/16 v7, -0x64

    .line 78
    .line 79
    :goto_0
    if-lez v7, :cond_2

    .line 80
    .line 81
    invoke-virtual {p0, v3}, Lcom/android/launcher3/anim/C;->p0(Z)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    invoke-virtual {p0, v2}, Lcom/android/launcher3/anim/C;->p0(Z)V

    .line 86
    .line 87
    .line 88
    :goto_1
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-virtual {v8}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    invoke-virtual {v8, v9}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    check-cast v9, Lcom/android/launcher3/CellLayout;

    .line 101
    .line 102
    if-nez p2, :cond_3

    .line 103
    .line 104
    if-lez v7, :cond_3

    .line 105
    .line 106
    invoke-virtual {v8, v7}, Lcom/android/launcher3/Workspace;->g1(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    goto :goto_3

    .line 111
    :cond_3
    instance-of v7, p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 112
    .line 113
    if-eqz v7, :cond_4

    .line 114
    .line 115
    check-cast p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    :goto_2
    move v5, v2

    .line 122
    goto :goto_3

    .line 123
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    instance-of v7, v7, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 128
    .line 129
    if-eqz v7, :cond_5

    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getOriginalIcon()Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    goto :goto_2

    .line 150
    :cond_5
    :goto_3
    if-eqz v6, :cond_b

    .line 151
    .line 152
    if-eqz v9, :cond_b

    .line 153
    .line 154
    if-nez p1, :cond_6

    .line 155
    .line 156
    goto/16 :goto_5

    .line 157
    .line 158
    :cond_6
    new-instance v7, Landroid/graphics/Rect;

    .line 159
    .line 160
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 161
    .line 162
    .line 163
    instance-of v8, p1, Lcom/android/launcher3/BubbleTextView;

    .line 164
    .line 165
    if-eqz v8, :cond_7

    .line 166
    .line 167
    move-object v8, p1

    .line 168
    check-cast v8, Lcom/android/launcher3/BubbleTextView;

    .line 169
    .line 170
    invoke-virtual {v8, v7}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 171
    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_7
    instance-of v8, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 175
    .line 176
    if-eqz v8, :cond_8

    .line 177
    .line 178
    move-object v8, p1

    .line 179
    check-cast v8, Lcom/android/launcher3/folder/FolderIcon;

    .line 180
    .line 181
    invoke-virtual {v8, v7}, Lcom/android/launcher3/folder/FolderIcon;->C(Landroid/graphics/Rect;)V

    .line 182
    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 186
    .line 187
    .line 188
    move-result v8

    .line 189
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 190
    .line 191
    .line 192
    move-result v9

    .line 193
    invoke-virtual {v7, v2, v2, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 194
    .line 195
    .line 196
    :goto_4
    iget v8, v7, Landroid/graphics/Rect;->left:I

    .line 197
    .line 198
    int-to-float v8, v8

    .line 199
    iget v9, v7, Landroid/graphics/Rect;->top:I

    .line 200
    .line 201
    int-to-float v9, v9

    .line 202
    iget v10, v7, Landroid/graphics/Rect;->right:I

    .line 203
    .line 204
    int-to-float v10, v10

    .line 205
    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    .line 206
    .line 207
    int-to-float v7, v7

    .line 208
    const/4 v11, 0x4

    .line 209
    new-array v11, v11, [F

    .line 210
    .line 211
    aput v8, v11, v2

    .line 212
    .line 213
    aput v9, v11, v3

    .line 214
    .line 215
    aput v10, v11, v1

    .line 216
    .line 217
    aput v7, v11, v0

    .line 218
    .line 219
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    invoke-static {p1, v4, v11, v2, v5}, Lcom/android/launcher3/N5;->n(Landroid/view/View;Landroid/view/View;[FZZ)F

    .line 224
    .line 225
    .line 226
    new-instance p1, Landroid/graphics/RectF;

    .line 227
    .line 228
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 229
    .line 230
    .line 231
    aget v4, v11, v2

    .line 232
    .line 233
    aget v5, v11, v1

    .line 234
    .line 235
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    aget v5, v11, v3

    .line 240
    .line 241
    aget v7, v11, v0

    .line 242
    .line 243
    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    .line 244
    .line 245
    .line 246
    move-result v5

    .line 247
    aget v2, v11, v2

    .line 248
    .line 249
    aget v7, v11, v1

    .line 250
    .line 251
    invoke-static {v2, v7}, Ljava/lang/Math;->max(FF)F

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    aget v3, v11, v3

    .line 256
    .line 257
    aget v0, v11, v0

    .line 258
    .line 259
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    invoke-virtual {p1, v4, v5, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 264
    .line 265
    .line 266
    if-eqz p2, :cond_a

    .line 267
    .line 268
    iget-object p2, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 269
    .line 270
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 275
    .line 276
    .line 277
    move-result v2

    .line 278
    invoke-virtual {p2, v0, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 279
    .line 280
    .line 281
    iget p2, v6, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 282
    .line 283
    if-ne p2, v1, :cond_9

    .line 284
    .line 285
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 286
    .line 287
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 288
    .line 289
    .line 290
    move-result p2

    .line 291
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    invoke-virtual {p0, p2, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :cond_9
    iget-object p1, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 300
    .line 301
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 302
    .line 303
    invoke-virtual {p1, p0}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_a
    iget-object p2, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 308
    .line 309
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 310
    .line 311
    invoke-virtual {p2, v0}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 312
    .line 313
    .line 314
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 315
    .line 316
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 317
    .line 318
    .line 319
    move-result p2

    .line 320
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 321
    .line 322
    .line 323
    move-result p1

    .line 324
    invoke-virtual {p0, p2, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 325
    .line 326
    .line 327
    return-void

    .line 328
    :cond_b
    :goto_5
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    if-eqz p2, :cond_c

    .line 333
    .line 334
    iget-object p2, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 335
    .line 336
    iget v0, p1, Lcom/android/launcher3/h0;->T0:I

    .line 337
    .line 338
    div-int/2addr v0, v1

    .line 339
    int-to-float v0, v0

    .line 340
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 341
    .line 342
    div-int/2addr p1, v1

    .line 343
    int-to-float p1, p1

    .line 344
    invoke-virtual {p2, v0, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 345
    .line 346
    .line 347
    iget-object p1, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 348
    .line 349
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 350
    .line 351
    invoke-virtual {p1, p0}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 352
    .line 353
    .line 354
    return-void

    .line 355
    :cond_c
    iget-object p2, p0, Lcom/android/launcher3/anim/C;->i:Landroid/graphics/PointF;

    .line 356
    .line 357
    iget-object v0, p0, Lcom/android/launcher3/anim/C;->h:Landroid/graphics/PointF;

    .line 358
    .line 359
    invoke-virtual {p2, v0}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 360
    .line 361
    .line 362
    iget-object p0, p0, Lcom/android/launcher3/anim/C;->j:Landroid/graphics/PointF;

    .line 363
    .line 364
    iget p2, p1, Lcom/android/launcher3/h0;->T0:I

    .line 365
    .line 366
    div-int/2addr p2, v1

    .line 367
    int-to-float p2, p2

    .line 368
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 369
    .line 370
    div-int/2addr p1, v1

    .line 371
    int-to-float p1, p1

    .line 372
    invoke-virtual {p0, p2, p1}, Landroid/graphics/PointF;->set(FF)V

    .line 373
    .line 374
    .line 375
    return-void
.end method

.method public z0(Lcom/android/launcher3/C2;F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/anim/C;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 p1, 0x3f000000    # 0.5f

    .line 6
    .line 7
    iput p1, p0, Lcom/android/launcher3/anim/C;->J:F

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const v0, 0x7f070192

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    div-float/2addr p1, p2

    .line 22
    iput p1, p0, Lcom/android/launcher3/anim/C;->J:F

    .line 23
    .line 24
    return-void
.end method
