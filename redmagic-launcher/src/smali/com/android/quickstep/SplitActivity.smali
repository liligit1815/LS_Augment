.class public Lcom/android/quickstep/SplitActivity;
.super Lcom/android/launcher3/v;
.source "SplitActivity.java"

# interfaces
.implements Lcom/android/launcher3/H5$h;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/SplitActivity$AppLaunchAnimationRunner;
    }
.end annotation


# static fields
.field private static final CONTROL_REMOTE_APP_TRANSITION_PERMISSION:Ljava/lang/String; = "android.permission.CONTROL_REMOTE_APP_TRANSITION_ANIMATIONS"

.field public static final FINISH_SPLIT_TASK_DELAY:I = 0x64

.field private static final SYSTEMUI_DRAG_PACKAGENAME:Ljava/lang/String; = "dragPackageName"

.field private static final TAG:Ljava/lang/String; = "SplitActivity"


# instance fields
.field public adapter:Lcom/android/quickstep/util/SplitGridAdapter;

.field private exitSplitScreenButton:Landroid/widget/TextView;

.field layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

.field private mAppLaunchRunner:Lcom/android/launcher3/M2$b;

.field final mHandler:Landroid/os/Handler;

.field private mSystemUIDragPackagename:Ljava/lang/String;

.field recyclerView:Lcom/android/quickstep/views/SplitAppsRecyclerView;

.field private splitAppsListView:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/v;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity;->mHandler:Landroid/os/Handler;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b0(Lcom/android/quickstep/SplitActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/SplitActivity;->lambda$onStart$1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c0(Lcom/android/quickstep/SplitActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/SplitActivity;->lambda$onCreate$0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getActivityLaunchOptions(Landroid/view/View;)Lcom/android/launcher3/util/b;
    .locals 9

    .line 8
    new-instance v0, Lcom/android/launcher3/util/Y1;

    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 9
    new-instance v1, Lcom/android/quickstep/SplitActivity$AppLaunchAnimationRunner;

    invoke-direct {v1, p0, p1, v0}, Lcom/android/quickstep/SplitActivity$AppLaunchAnimationRunner;-><init>(Lcom/android/quickstep/SplitActivity;Landroid/view/View;Lcom/android/launcher3/util/Y1;)V

    iput-object v1, p0, Lcom/android/quickstep/SplitActivity;->mAppLaunchRunner:Lcom/android/launcher3/M2$b;

    .line 10
    new-instance v3, Lcom/android/launcher3/M2;

    iget-object p1, p0, Lcom/android/quickstep/SplitActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/quickstep/SplitActivity;->mAppLaunchRunner:Lcom/android/launcher3/M2$b;

    const/4 v2, 0x1

    invoke-direct {v3, p1, v1, v2}, Lcom/android/launcher3/M2;-><init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V

    .line 11
    sget-wide v4, Lcom/android/launcher3/q5;->V:J

    const-wide/16 v1, 0xd8

    sub-long v6, v4, v1

    .line 12
    new-instance v2, Landroid/view/RemoteAnimationAdapter;

    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIApplicationThread()Landroid/app/IApplicationThread;

    move-result-object v8

    invoke-direct/range {v2 .. v8}, Landroid/view/RemoteAnimationAdapter;-><init>(Landroid/view/IRemoteAnimationRunner;JJLandroid/app/IApplicationThread;)V

    .line 14
    new-instance p0, Lcom/android/launcher3/util/b;

    .line 15
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object p1

    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    return-object p0
.end method

.method private getPortraitDeviceProfile(Landroid/content/Context;)Lcom/android/launcher3/h0;
    .locals 3

    .line 1
    sget-object p0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/F1;

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    .line 32
    .line 33
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 34
    .line 35
    iget v2, v0, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 42
    .line 43
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 44
    .line 45
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-float v1, v1

    .line 50
    int-to-float v0, v0

    .line 51
    invoke-virtual {p0, v1, v0, p1}, Lcom/android/launcher3/F1;->s0(FFI)Lcom/android/launcher3/h0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method private getSplitApps()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, LF1/b;

    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->G0:Z

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v2, v3

    .line 30
    :goto_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const-string v5, "SplitActivity"

    .line 35
    .line 36
    if-eqz v4, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->d0()Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v4, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v6, "allAppInfos: "

    .line 60
    .line 61
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_8

    .line 87
    .line 88
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    check-cast v4, Lcom/android/launcher3/model/data/d;

    .line 93
    .line 94
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    new-instance v7, Lcom/android/launcher3/f;

    .line 99
    .line 100
    invoke-direct {v7, p0}, Lcom/android/launcher3/f;-><init>(Landroid/content/Context;)V

    .line 101
    .line 102
    .line 103
    if-eqz v6, :cond_1

    .line 104
    .line 105
    invoke-static {p0, v4, v2}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkItemSupportSplit(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Z)Z

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    if-eqz v8, :cond_1

    .line 110
    .line 111
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    invoke-static {p0, v8}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkPackageInWindow(Landroid/content/Context;Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    if-nez v8, :cond_1

    .line 120
    .line 121
    invoke-static {v6}, Lx1/O;->q3(Landroid/content/ComponentName;)Z

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    if-nez v8, :cond_1

    .line 126
    .line 127
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    iget-object v9, p0, Lcom/android/quickstep/SplitActivity;->mSystemUIDragPackagename:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v8

    .line 137
    if-nez v8, :cond_1

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object v8

    .line 143
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 144
    .line 145
    .line 146
    move-result-object v8

    .line 147
    iget-object v9, v4, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 148
    .line 149
    iget-object v10, v4, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 150
    .line 151
    invoke-virtual {v7, v8, v9, v10}, Lcom/android/launcher3/f;->b(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 152
    .line 153
    .line 154
    move-result v7

    .line 155
    if-nez v7, :cond_1

    .line 156
    .line 157
    invoke-static {}, Lx1/O;->r2()Z

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    if-eqz v7, :cond_2

    .line 162
    .line 163
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    invoke-static {p0, v6}, Lx1/O;->x1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    if-eqz v6, :cond_1

    .line 172
    .line 173
    :cond_2
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    invoke-static {p0, v6}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->isInMultiWindowMode(Landroid/content/Context;Ljava/lang/String;)Z

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    if-nez v6, :cond_1

    .line 182
    .line 183
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_3
    sget-object v4, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 188
    .line 189
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 190
    .line 191
    .line 192
    move-result-object v6

    .line 193
    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    check-cast v4, LD1/t;

    .line 198
    .line 199
    invoke-virtual {v4}, LD1/t;->p()Ljava/util/List;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    :cond_4
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 208
    .line 209
    .line 210
    move-result v6

    .line 211
    if-eqz v6, :cond_8

    .line 212
    .line 213
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    check-cast v6, Landroid/os/UserHandle;

    .line 218
    .line 219
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 220
    .line 221
    .line 222
    move-result-object v7

    .line 223
    const-class v8, Landroid/content/pm/LauncherApps;

    .line 224
    .line 225
    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    check-cast v7, Landroid/content/pm/LauncherApps;

    .line 230
    .line 231
    const/4 v8, 0x0

    .line 232
    invoke-virtual {v7, v8, v6}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 233
    .line 234
    .line 235
    move-result-object v7

    .line 236
    if-eqz v7, :cond_4

    .line 237
    .line 238
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 239
    .line 240
    .line 241
    move-result v8

    .line 242
    if-eqz v8, :cond_5

    .line 243
    .line 244
    goto :goto_2

    .line 245
    :cond_5
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 246
    .line 247
    .line 248
    move-result-object v7

    .line 249
    :cond_6
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 250
    .line 251
    .line 252
    move-result v8

    .line 253
    if-eqz v8, :cond_4

    .line 254
    .line 255
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v8

    .line 259
    check-cast v8, Landroid/content/pm/LauncherActivityInfo;

    .line 260
    .line 261
    new-instance v9, Lcom/android/launcher3/model/data/d;

    .line 262
    .line 263
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 264
    .line 265
    .line 266
    move-result-object v10

    .line 267
    invoke-direct {v9, v10, v8, v6}, Lcom/android/launcher3/model/data/d;-><init>(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;Landroid/os/UserHandle;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/d;->getTargetComponent()Landroid/content/ComponentName;

    .line 271
    .line 272
    .line 273
    move-result-object v8

    .line 274
    if-eqz v8, :cond_6

    .line 275
    .line 276
    invoke-static {p0, v9, v2}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkItemSupportSplit(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Z)Z

    .line 277
    .line 278
    .line 279
    move-result v10

    .line 280
    if-eqz v10, :cond_6

    .line 281
    .line 282
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v10

    .line 286
    invoke-static {p0, v10}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkPackageInWindow(Landroid/content/Context;Ljava/lang/String;)Z

    .line 287
    .line 288
    .line 289
    move-result v10

    .line 290
    if-nez v10, :cond_6

    .line 291
    .line 292
    invoke-static {v8}, Lx1/O;->q3(Landroid/content/ComponentName;)Z

    .line 293
    .line 294
    .line 295
    move-result v10

    .line 296
    if-nez v10, :cond_6

    .line 297
    .line 298
    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v10

    .line 302
    invoke-virtual {v0}, LF1/b;->b()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v11

    .line 306
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v10

    .line 310
    if-eqz v10, :cond_7

    .line 311
    .line 312
    iget-object v10, v9, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 313
    .line 314
    invoke-virtual {v0}, LF1/b;->c()Landroid/os/UserHandle;

    .line 315
    .line 316
    .line 317
    move-result-object v11

    .line 318
    invoke-virtual {v10, v11}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result v10

    .line 322
    if-nez v10, :cond_6

    .line 323
    .line 324
    :cond_7
    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v8

    .line 328
    iget-object v10, p0, Lcom/android/quickstep/SplitActivity;->mSystemUIDragPackagename:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result v8

    .line 334
    if-nez v8, :cond_6

    .line 335
    .line 336
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 337
    .line 338
    .line 339
    move-result-object v8

    .line 340
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 341
    .line 342
    .line 343
    move-result-object v8

    .line 344
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 345
    .line 346
    .line 347
    move-result-object v8

    .line 348
    invoke-virtual {v8}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 349
    .line 350
    .line 351
    move-result-object v8

    .line 352
    if-eqz v8, :cond_6

    .line 353
    .line 354
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 355
    .line 356
    .line 357
    move-result-object v8

    .line 358
    invoke-static {v8}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 359
    .line 360
    .line 361
    move-result-object v8

    .line 362
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 363
    .line 364
    .line 365
    move-result-object v8

    .line 366
    invoke-virtual {v8}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 367
    .line 368
    .line 369
    move-result-object v8

    .line 370
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/d;->getIntent()Landroid/content/Intent;

    .line 371
    .line 372
    .line 373
    move-result-object v10

    .line 374
    invoke-virtual {v8, v10, v6}, Lcom/android/launcher3/c1;->r(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;

    .line 375
    .line 376
    .line 377
    move-result-object v8

    .line 378
    if-eqz v8, :cond_6

    .line 379
    .line 380
    iget-object v10, v8, LI/d;->a:Ljava/lang/Object;

    .line 381
    .line 382
    check-cast v10, Ljava/lang/CharSequence;

    .line 383
    .line 384
    iput-object v10, v9, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 385
    .line 386
    iget-object v8, v8, LI/d;->b:Ljava/lang/Object;

    .line 387
    .line 388
    check-cast v8, Landroid/graphics/Bitmap;

    .line 389
    .line 390
    invoke-static {v8}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 391
    .line 392
    .line 393
    move-result-object v8

    .line 394
    iput-object v8, v9, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 395
    .line 396
    invoke-interface {v1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    goto/16 :goto_3

    .line 400
    .line 401
    :cond_8
    new-instance v0, Lcom/android/launcher3/allapps/N;

    .line 402
    .line 403
    invoke-direct {v0, p0}, Lcom/android/launcher3/allapps/N;-><init>(Landroid/content/Context;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v0, v3}, Lcom/android/launcher3/allapps/N;->b(I)V

    .line 407
    .line 408
    .line 409
    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 410
    .line 411
    .line 412
    new-instance p0, Ljava/lang/StringBuilder;

    .line 413
    .line 414
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 415
    .line 416
    .line 417
    const-string v0, "apps: "

    .line 418
    .line 419
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    .line 435
    .line 436
    return-object v1
.end method

.method private synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "SplitActivity"

    .line 2
    .line 3
    const-string v0, "click button exit split screen"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic lambda$onStart$1(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "SplitActivity"

    .line 2
    .line 3
    const-string v0, "click button exit split screen"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private setExitSplitScreenButtonBackground(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-static {p1}, Lx1/O;->y1(I)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const v1, 0x7f0601eb

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 30
    .line 31
    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const v1, 0x7f0601ea

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 47
    .line 48
    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public bridge synthetic addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic applyOverwritesToLogItem(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->applyOverwritesToLogItem(Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic asContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic canUseMultipleShadesForPopup()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->canUseMultipleShadesForPopup()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic dispatchDeviceProfileChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->dispatchDeviceProfileChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic finishAppClosingAnim(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/views/k;->finishAppClosingAnim(ZLjava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic finishFolderAnim()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->finishFolderAnim()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/SplitActivity;->hasControlRemoteAppTransitionPermission()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-direct {p0, p1}, Lcom/android/quickstep/SplitActivity;->getActivityLaunchOptions(Landroid/view/View;)Lcom/android/launcher3/util/b;

    move-result-object p0

    goto :goto_0

    .line 3
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/v;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    move-result-object p0

    .line 4
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 5
    iget-object p2, p0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    if-eqz p1, :cond_1

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result p1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    .line 7
    :goto_1
    invoke-virtual {p2, p1}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    return-object p0
.end method

.method public bridge synthetic getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAlphaColor(FI)I
    .locals 1

    .line 1
    const/high16 p0, 0x437f0000    # 255.0f

    .line 2
    .line 3
    mul-float/2addr p1, p0

    .line 4
    float-to-int p0, p1

    .line 5
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {p0, p1, v0, p2}, Landroid/graphics/Color;->argb(IIII)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public bridge synthetic getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getCellPosMapper()Lc1/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getContent()Lcom/android/launcher3/util/Y0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getContent()Lcom/android/launcher3/util/Y0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public bridge synthetic getDropTargetHandler()Lcom/android/launcher3/q0;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getDropTargetHandler()Lcom/android/launcher3/q0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getFolderBoundingBox()Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getFolderBoundingBox()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getForeColor()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public bridge synthetic getIfIgnorestylusGesture()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getIfIgnorestylusGesture()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getOpeningWindowAnimatorsWithOutIcon([Landroid/view/RemoteAnimationTarget;F)Landroid/animation/Animator;
    .locals 3

    .line 1
    new-instance p2, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    new-array v0, v0, [F

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Lcom/android/launcher3/anim/C;->Q:I

    .line 17
    .line 18
    int-to-long v1, v1

    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    new-instance v1, Lcom/android/quickstep/SplitActivity$1;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1, p2}, Lcom/android/quickstep/SplitActivity$1;-><init>(Lcom/android/quickstep/SplitActivity;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 28
    .line 29
    .line 30
    return-object v0

    .line 31
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public bridge synthetic getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getRootView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getStringCache()Lz1/G4;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getStringCache()Lz1/G4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getWidgetPickerDataProvider()Ln2/c;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic handleIncorrectSplitTargetSelection()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->handleIncorrectSplitTargetSelection()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic hasBubbles()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hasBubbles()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public hasControlRemoteAppTransitionPermission()Z
    .locals 1

    .line 1
    const-string v0, "android.permission.CONTROL_REMOTE_APP_TRANSITION_ANIMATIONS"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->checkSelfPermission(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public bridge synthetic hideKeyboard()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic isBubbleBarEnabled()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isBubbleBarEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isHardwareKeyboard()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isHardwareKeyboard()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSoftwareKeyboardHidden()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSoftwareKeyboardHidden()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isSplitSelectionActive()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->isSplitSelectionActive()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public noOtherApps()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "hover_drag_package_name"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity;->mSystemUIDragPackagename:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/SplitActivity;->getSplitApps()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne v0, v2, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/SplitActivity;->mSystemUIDragPackagename:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/SplitActivity;->getSplitApps()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lcom/android/launcher3/model/data/d;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    move v0, v2

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move v0, v1

    .line 50
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/SplitActivity;->getSplitApps()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_2

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    return v1

    .line 64
    :cond_2
    :goto_1
    return v2
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->finishAndRemoveTask()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 14
    .line 15
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    const/4 v2, 0x1

    .line 19
    const/4 v3, 0x0

    .line 20
    if-ne p1, v1, :cond_1

    .line 21
    .line 22
    move p1, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move p1, v3

    .line 25
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    move v1, v2

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move v1, v3

    .line 36
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v5, "onConfigurationChanged isLandscape = "

    .line 42
    .line 43
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v5, " ,isTablet = "

    .line 50
    .line 51
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    const-string v5, "SplitActivity"

    .line 62
    .line 63
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    const v4, 0x800005

    .line 67
    .line 68
    .line 69
    const v5, 0x800003

    .line 70
    .line 71
    .line 72
    const v6, 0x7f070300

    .line 73
    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eq p1, v2, :cond_4

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    const/4 v1, 0x3

    .line 104
    if-ne p1, v1, :cond_3

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_4
    :goto_2
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 111
    .line 112
    :goto_3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const v1, 0x7f070302

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    float-to-int p1, p1

    .line 124
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    float-to-int v1, v1

    .line 133
    invoke-virtual {v0, v3, p1, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 134
    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_5
    if-eqz p1, :cond_6

    .line 138
    .line 139
    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 140
    .line 141
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    const v1, 0x7f070301

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    float-to-int p1, p1

    .line 153
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    float-to-int v1, v1

    .line 162
    invoke-virtual {v0, v3, p1, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 163
    .line 164
    .line 165
    goto :goto_4

    .line 166
    :cond_6
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    const v1, 0x7f0702ff

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    float-to-int p1, p1

    .line 180
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    float-to-int v1, v1

    .line 189
    invoke-virtual {v0, v3, p1, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 190
    .line 191
    .line 192
    :goto_4
    iget-object p0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 193
    .line 194
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/v;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string v1, "SplitActivity"

    .line 12
    .line 13
    const-string v2, "onCreate--set draglayer alpha 0 and go to normal"

    .line 14
    .line 15
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, p0}, Lcom/android/launcher3/q4;->k0(Lcom/android/launcher3/H5$h;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-direct {p0, v1}, Lcom/android/quickstep/SplitActivity;->getPortraitDeviceProfile(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 51
    .line 52
    invoke-static {}, Lx1/O;->r2()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/quickstep/SplitActivity;->noOtherApps()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    const p1, 0x7f0e0171

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const v1, 0x7f0e020a

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v1}, Landroid/app/Activity;->setContentView(I)V

    .line 75
    .line 76
    .line 77
    new-instance v1, Lcom/android/quickstep/util/SplitGridAdapter;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/SplitGridAdapter;-><init>(Lcom/android/quickstep/SplitActivity;)V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/android/quickstep/SplitActivity;->adapter:Lcom/android/quickstep/util/SplitGridAdapter;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitGridAdapter;->getGridLayoutMgr()Landroidx/recyclerview/widget/GridLayoutManager;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, p0, Lcom/android/quickstep/SplitActivity;->layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 89
    .line 90
    const v1, 0x7f0b0578

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 98
    .line 99
    const/4 v3, 0x0

    .line 100
    invoke-virtual {p0, v2, v3}, Lcom/android/quickstep/SplitActivity;->setup(Lcom/android/quickstep/views/SplitAppsRecyclerView;Lcom/android/launcher3/util/P0;)V

    .line 101
    .line 102
    .line 103
    const v2, 0x7f0b0258

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Landroid/widget/TextView;

    .line 111
    .line 112
    iput-object v2, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 113
    .line 114
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 119
    .line 120
    iput-object v1, p0, Lcom/android/quickstep/SplitActivity;->splitAppsListView:Landroidx/recyclerview/widget/RecyclerView;

    .line 121
    .line 122
    if-eqz p1, :cond_2

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getForeColor()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    invoke-direct {p0, p1}, Lcom/android/quickstep/SplitActivity;->setExitSplitScreenButtonBackground(I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 132
    .line 133
    new-instance v1, Lcom/android/quickstep/C4;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Lcom/android/quickstep/C4;-><init>(Lcom/android/quickstep/SplitActivity;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 142
    .line 143
    if-eqz p1, :cond_5

    .line 144
    .line 145
    iget-object v1, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 146
    .line 147
    if-eqz v1, :cond_5

    .line 148
    .line 149
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 150
    .line 151
    if-eqz p1, :cond_5

    .line 152
    .line 153
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    const/4 v2, 0x1

    .line 172
    if-eq v1, v2, :cond_4

    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    const/4 v2, 0x3

    .line 187
    if-ne v1, v2, :cond_3

    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_3
    const v1, 0x800005

    .line 191
    .line 192
    .line 193
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_4
    :goto_1
    const v1, 0x800003

    .line 197
    .line 198
    .line 199
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 200
    .line 201
    :goto_2
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    const v2, 0x7f070302

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    float-to-int v1, v1

    .line 213
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    const v3, 0x7f070300

    .line 218
    .line 219
    .line 220
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    float-to-int v2, v2

    .line 225
    invoke-virtual {p1, v0, v1, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 229
    .line 230
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    .line 232
    .line 233
    :cond_5
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/q4;->k0(Lcom/android/launcher3/H5$h;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onForeColorChanged(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SplitActivity;->adapter:Lcom/android/quickstep/util/SplitGridAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/SplitGridAdapter;->onForeColorChanged(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/quickstep/SplitActivity;->setExitSplitScreenButtonBackground(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onLowMemInit(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/v;->onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const-string v0, "SplitActivity"

    .line 11
    .line 12
    const-string v1, "onPause--set draglayer alpha 1"

    .line 13
    .line 14
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 7

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/SplitActivity;->adapter:Lcom/android/quickstep/util/SplitGridAdapter;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/SplitActivity;->getSplitApps()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/SplitGridAdapter;->setData(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 16
    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 20
    .line 21
    if-eqz v1, :cond_5

    .line 22
    .line 23
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 24
    .line 25
    if-eqz v0, :cond_5

    .line 26
    .line 27
    const v0, 0x1020002

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    const/4 v4, 0x0

    .line 46
    if-ne v1, v2, :cond_1

    .line 47
    .line 48
    move v1, v3

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move v1, v4

    .line 51
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v5, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 56
    .line 57
    iget-object v5, v5, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 58
    .line 59
    iget v5, v5, Lcom/android/launcher3/r4;->Q:I

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    move v1, v4

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 72
    .line 73
    iget v1, v1, Lcom/android/launcher3/r4;->R:I

    .line 74
    .line 75
    :goto_1
    invoke-virtual {v0, v2, v5, v6, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eq v1, v3, :cond_4

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    const/4 v2, 0x3

    .line 113
    if-ne v1, v2, :cond_3

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_3
    const v1, 0x800005

    .line 117
    .line 118
    .line 119
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_4
    :goto_2
    const v1, 0x800003

    .line 123
    .line 124
    .line 125
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 126
    .line 127
    :goto_3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const v2, 0x7f070302

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    float-to-int v1, v1

    .line 139
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    const v3, 0x7f070300

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    float-to-int v2, v2

    .line 151
    invoke-virtual {v0, v4, v1, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 155
    .line 156
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    .line 158
    .line 159
    :cond_5
    return-void
.end method

.method protected onStart()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "hover_drag_package_name"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity;->mSystemUIDragPackagename:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "onStart SystemUIDragPackagename = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/quickstep/SplitActivity;->mSystemUIDragPackagename:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "SplitActivity"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lx1/O;->r2()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/SplitActivity;->noOtherApps()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    const v0, 0x7f0e0171

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    const v0, 0x7f0e020a

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(I)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Lcom/android/quickstep/util/SplitGridAdapter;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/SplitGridAdapter;-><init>(Lcom/android/quickstep/SplitActivity;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity;->adapter:Lcom/android/quickstep/util/SplitGridAdapter;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitGridAdapter;->getGridLayoutMgr()Landroidx/recyclerview/widget/GridLayoutManager;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity;->layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 77
    .line 78
    const v0, 0x7f0b0578

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-virtual {p0, v1, v2}, Lcom/android/quickstep/SplitActivity;->setup(Lcom/android/quickstep/views/SplitAppsRecyclerView;Lcom/android/launcher3/util/P0;)V

    .line 89
    .line 90
    .line 91
    const v1, 0x7f0b0258

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Landroid/widget/TextView;

    .line 99
    .line 100
    iput-object v1, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity;->splitAppsListView:Landroidx/recyclerview/widget/RecyclerView;

    .line 109
    .line 110
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-direct {p0, v0}, Lcom/android/quickstep/SplitActivity;->setExitSplitScreenButtonBackground(I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/android/quickstep/SplitActivity;->exitSplitScreenButton:Landroid/widget/TextView;

    .line 128
    .line 129
    new-instance v1, Lcom/android/quickstep/E4;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Lcom/android/quickstep/E4;-><init>(Lcom/android/quickstep/SplitActivity;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    :cond_1
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/v;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->r2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/SplitActivity;->noOtherApps()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const p1, 0x7f0b0418

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/ViewRootImpl;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Landroid/view/SurfaceControl$Transaction;

    .line 36
    .line 37
    invoke-direct {v1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 38
    .line 39
    .line 40
    const/16 v2, 0x1e

    .line 41
    .line 42
    invoke-virtual {v1, v0, v2}, Landroid/view/SurfaceControl$Transaction;->setBackgroundBlurRadius(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {v1, v0, v2}, Landroid/view/SurfaceControl$Transaction;->setOpaque(Landroid/view/SurfaceControl;Z)Landroid/view/SurfaceControl$Transaction;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getRootSurfaceControl()Landroid/view/AttachedSurfaceControl;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    invoke-interface {p1, v0}, Landroid/view/AttachedSurfaceControl;->applyTransactionOnDraw(Landroid/view/SurfaceControl$Transaction;)Z

    .line 58
    .line 59
    .line 60
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/SplitActivity;->updateTipsState()V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public bridge synthetic removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic resetDraglayer()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/k;->resetDraglayer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/views/k;->sendPendingIntentWithAnimation(Landroid/view/View;Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method setup(Lcom/android/quickstep/views/SplitAppsRecyclerView;Lcom/android/launcher3/util/P0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/SplitActivity;->recyclerView:Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/quickstep/SplitActivity;->layoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/SplitActivity;->recyclerView:Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/android/quickstep/SplitActivity;->adapter:Lcom/android/quickstep/util/SplitGridAdapter;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/quickstep/SplitActivity;->recyclerView:Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 16
    .line 17
    const/4 p2, 0x1

    .line 18
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/quickstep/SplitActivity;->recyclerView:Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 22
    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Lv1/b;

    .line 28
    .line 29
    iget-object p2, p0, Lcom/android/quickstep/SplitActivity;->recyclerView:Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 30
    .line 31
    invoke-direct {p1, p2}, Lv1/b;-><init>(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/android/quickstep/SplitActivity;->recyclerView:Lcom/android/quickstep/views/SplitAppsRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/quickstep/SplitActivity;->adapter:Lcom/android/quickstep/util/SplitGridAdapter;

    .line 40
    .line 41
    invoke-virtual {p1}, Lv1/b;->a()Landroid/view/View$OnFocusChangeListener;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SplitGridAdapter;->setIconFocusListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    const/high16 v2, 0x10200000

    .line 6
    .line 7
    move-object/from16 v5, p2

    .line 8
    .line 9
    invoke-virtual {v5, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    move-object v3, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v3, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 18
    .line 19
    :goto_0
    const/4 v9, 0x1

    .line 20
    if-eqz v3, :cond_2

    .line 21
    .line 22
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v3, v4}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 38
    .line 39
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v0, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    array-length v0, v0

    .line 56
    const/4 v4, 0x2

    .line 57
    if-lt v0, v4, :cond_4

    .line 58
    .line 59
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    instance-of v0, v0, Lcom/android/quickstep/views/RecentsView;

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    iget-object v8, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    const/high16 v6, 0x2000000

    .line 71
    .line 72
    const/4 v7, 0x0

    .line 73
    invoke-static/range {v3 .. v8}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    .line 74
    .line 75
    .line 76
    move-result-object v11

    .line 77
    const/high16 v0, 0x10a0000

    .line 78
    .line 79
    const v4, 0x10a0001

    .line 80
    .line 81
    .line 82
    invoke-static {v3, v0, v4}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 87
    .line 88
    .line 89
    move-result-object v15

    .line 90
    invoke-static {}, Lcom/android/quickstep/util/LogUtils;->getShellShareableInstanceId()Landroid/util/Pair;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v4, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 95
    .line 96
    invoke-virtual {v4, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    move-object v10, v3

    .line 101
    check-cast v10, Lcom/android/quickstep/SystemUiProxy;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 104
    .line 105
    invoke-virtual {v1}, Landroid/os/UserHandle;->getIdentifier()I

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    new-instance v13, Landroid/content/Intent;

    .line 110
    .line 111
    invoke-direct {v13}, Landroid/content/Intent;-><init>()V

    .line 112
    .line 113
    .line 114
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 115
    .line 116
    move-object/from16 v16, v0

    .line 117
    .line 118
    check-cast v16, Lcom/android/internal/logging/InstanceId;

    .line 119
    .line 120
    const/4 v14, 0x1

    .line 121
    invoke-virtual/range {v10 .. v16}, Lcom/android/quickstep/SystemUiProxy;->startIntent(Landroid/app/PendingIntent;ILandroid/content/Intent;ILandroid/os/Bundle;Lcom/android/internal/logging/InstanceId;)V

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_2
    :goto_1
    invoke-super/range {p0 .. p3}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 126
    .line 127
    .line 128
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 129
    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 133
    .line 134
    invoke-virtual {v0, v9}, Lcom/android/launcher3/BubbleTextView;->setStayPressed(Z)V

    .line 135
    .line 136
    .line 137
    :cond_3
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    new-instance v1, Lcom/android/quickstep/D4;

    .line 144
    .line 145
    move-object/from16 v3, p0

    .line 146
    .line 147
    invoke-direct {v1, v3}, Lcom/android/quickstep/D4;-><init>(Lcom/android/quickstep/SplitActivity;)V

    .line 148
    .line 149
    .line 150
    const-wide/16 v3, 0x64

    .line 151
    .line 152
    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 153
    .line 154
    .line 155
    :cond_4
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string v1, "startActivitySafely res is "

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-string v1, "SplitActivity"

    .line 173
    .line 174
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    return-object v2
.end method

.method public bridge synthetic startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/k;->startSplitSelection(Lcom/android/launcher3/util/y2$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic updateOpenFolderPosition([ILandroid/graphics/Rect;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/views/k;->updateOpenFolderPosition([ILandroid/graphics/Rect;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public updateTipsState()V
    .locals 7

    .line 1
    invoke-static {}, Lx1/O;->r2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/SplitActivity;->noOtherApps()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const v0, 0x7f0b00dd

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/widget/ImageView;

    .line 22
    .line 23
    const v1, 0x7f0b0416

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/widget/TextView;

    .line 31
    .line 32
    const v2, 0x7f0b0417

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/widget/TextView;

    .line 40
    .line 41
    const v3, 0x7f0b0415

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Landroid/widget/Button;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-static {v5}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    const v6, 0x7f040781

    .line 63
    .line 64
    .line 65
    invoke-static {v4, v6, v5}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 70
    .line 71
    .line 72
    const v0, 0x3f333333    # 0.7f

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0, v4}, Lcom/android/quickstep/SplitActivity;->getAlphaColor(FI)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    const v0, 0x3f0a3d71    # 0.54f

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0, v4}, Lcom/android/quickstep/SplitActivity;->getAlphaColor(FI)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    const v0, 0x3df5c28f    # 0.12f

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0, v4}, Lcom/android/quickstep/SplitActivity;->getAlphaColor(FI)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    new-instance v0, Lcom/android/quickstep/SplitActivity$2;

    .line 110
    .line 111
    invoke-direct {v0, p0}, Lcom/android/quickstep/SplitActivity$2;-><init>(Lcom/android/quickstep/SplitActivity;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    :goto_0
    return-void
.end method
