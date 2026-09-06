.class public Lx1/r;
.super Ljava/lang/Object;
.source "AppTransferProxy.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# static fields
.field private static final C:Ljava/lang/String; = "r"

.field private static final D:Landroid/net/Uri;

.field private static final E:Landroid/net/Uri;

.field public static final F:[Ljava/lang/String;

.field public static final G:[Ljava/lang/String;

.field public static final H:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lx1/r;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final B:Landroid/database/ContentObserver;

.field private g:Landroid/content/Context;

.field private h:Z

.field private i:Z

.field private j:Z

.field private k:Z

.field private l:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private m:Z

.field private n:Ljava/lang/String;

.field private o:Ljava/lang/String;

.field private p:LQ3/a;

.field private q:Ljava/lang/String;

.field private final r:Landroid/content/BroadcastReceiver;

.field private s:LP3/a;

.field private final t:Landroid/content/ServiceConnection;

.field private u:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private volatile v:Ljava/lang/String;

.field private volatile w:Z

.field private volatile x:I

.field private final y:LP3/b;

.field private z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 76

    .line 1
    const-string v0, "content://com.zte.zteconfigupdate.provider/multi_screen_white_info"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lx1/r;->D:Landroid/net/Uri;

    .line 8
    .line 9
    const-string v0, "content://com.zte.zteconfigupdate.provider/multi_screen_black_info"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lx1/r;->E:Landroid/net/Uri;

    .line 16
    .line 17
    const-string v0, "com.ume.browser"

    .line 18
    .line 19
    const-string v1, "cn.nubia.browser"

    .line 20
    .line 21
    const-string v2, "com.android.gallery3d"

    .line 22
    .line 23
    const-string v3, "zte.com.cn.filer"

    .line 24
    .line 25
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lx1/r;->F:[Ljava/lang/String;

    .line 30
    .line 31
    const-string v74, "com.tencent.mobileqq"

    .line 32
    .line 33
    const-string v75, "com.netease.wdsj.yyxx.nubia"

    .line 34
    .line 35
    const-string v1, "com.android.calendar"

    .line 36
    .line 37
    const-string v2, "zte.com.cn.alarmclock"

    .line 38
    .line 39
    const-string v3, "com.zte.beautify"

    .line 40
    .line 41
    const-string v4, "com.zte.mifavor.theme.resource"

    .line 42
    .line 43
    const-string v5, "com.zte.mifavor.zsearch"

    .line 44
    .line 45
    const-string v6, "com.zte.mifavor.globalzsearch"

    .line 46
    .line 47
    const-string v7, "com.zte.halo.app"

    .line 48
    .line 49
    const-string v8, "com.zte.heartyservice"

    .line 50
    .line 51
    const-string v9, "com.zte.retrieve"

    .line 52
    .line 53
    const-string v10, "com.android.permissioncontroller"

    .line 54
    .line 55
    const-string v11, "com.android.packageinstaller"

    .line 56
    .line 57
    const-string v12, "com.zte.handservice"

    .line 58
    .line 59
    const-string v13, "cuuca.sendfiles.Activity"

    .line 60
    .line 61
    const-string v14, "com.zte.userguide"

    .line 62
    .line 63
    const-string v15, "com.zte.kidszone"

    .line 64
    .line 65
    const-string v16, "com.zte.mifavor.weather"

    .line 66
    .line 67
    const-string v17, "cn.zte.recorder"

    .line 68
    .line 69
    const-string v18, "com.zte.wallet"

    .line 70
    .line 71
    const-string v19, "com.android.calculator2"

    .line 72
    .line 73
    const-string v20, "com.zte.smarthome"

    .line 74
    .line 75
    const-string v21, "com.zte.zmall"

    .line 76
    .line 77
    const-string v22, "com.redmagic.shop"

    .line 78
    .line 79
    const-string v23, "com.android.contacts"

    .line 80
    .line 81
    const-string v24, "com.android.providers.contacts"

    .line 82
    .line 83
    const-string v25, "com.android.messaging"

    .line 84
    .line 85
    const-string v26, "com.android.cellbroadcastreceiver"

    .line 86
    .line 87
    const-string v27, "com.android.providers.telephony"

    .line 88
    .line 89
    const-string v28, "com.android.settings"

    .line 90
    .line 91
    const-string v29, "com.android.providers.settings"

    .line 92
    .line 93
    const-string v30, "com.android.emergency"

    .line 94
    .line 95
    const-string v31, "com.android.htmlviewer"

    .line 96
    .line 97
    const-string v32, "com.zte.manual"

    .line 98
    .line 99
    const-string v33, "com.zte.cn.doubleapp"

    .line 100
    .line 101
    const-string v34, "com.zte.nps"

    .line 102
    .line 103
    const-string v35, "zte.com.market"

    .line 104
    .line 105
    const-string v36, "cn.nubia.neostore"

    .line 106
    .line 107
    const-string v37, "com.zte.quickgame"

    .line 108
    .line 109
    const-string v38, "cn.nubia.neogamecenter"

    .line 110
    .line 111
    const-string v39, "com.UCMobile"

    .line 112
    .line 113
    const-string v40, "com.duowan.kiwi"

    .line 114
    .line 115
    const-string v41, "com.tencent.mtt"

    .line 116
    .line 117
    const-string v42, "com.le123.ysdq"

    .line 118
    .line 119
    const-string v43, "com.eduyun.app.factory.ykt"

    .line 120
    .line 121
    const-string v44, "cn.com.langeasy.LangEasyLexis"

    .line 122
    .line 123
    const-string v45, "com.ct.client"

    .line 124
    .line 125
    const-string v46, "com.leqi.zuimeiphoto"

    .line 126
    .line 127
    const-string v47, "com.tencent.tmgp.pubgmhd"

    .line 128
    .line 129
    const-string v48, "com.minitech.miniworld"

    .line 130
    .line 131
    const-string v49, "com.netease.x19"

    .line 132
    .line 133
    const-string v50, "com.tencent.tmgp.sgame"

    .line 134
    .line 135
    const-string v51, "com.tencent.lolm"

    .line 136
    .line 137
    const-string v52, "com.zentriple3d.mi"

    .line 138
    .line 139
    const-string v53, "com.bairimeng.dmmdzz.uc"

    .line 140
    .line 141
    const-string v54, "com.tencent.tmgp.eyou.eygy"

    .line 142
    .line 143
    const-string v55, "com.miHoYo.Yuanshen"

    .line 144
    .line 145
    const-string v56, "com.tencent.tmgp.cf"

    .line 146
    .line 147
    const-string v57, "com.youzu.hyld.nubia"

    .line 148
    .line 149
    const-string v58, "com.tencent.tmgp.speedmobile"

    .line 150
    .line 151
    const-string v59, "com.tencent.mf.uam"

    .line 152
    .line 153
    const-string v60, "com.tencent.tmgp.pvz2hdtxyyb"

    .line 154
    .line 155
    const-string v61, "com.happyelements.AndroidAnimal"

    .line 156
    .line 157
    const-string v62, "com.tencent.KiHan"

    .line 158
    .line 159
    const-string v63, "com.lemurbrowser.exts"

    .line 160
    .line 161
    const-string v64, "com.happyelements.AndroidAnimal"

    .line 162
    .line 163
    const-string v65, "com.netease.pm02.nubia"

    .line 164
    .line 165
    const-string v66, "com.tencent.tmgp.mhxy.sqsy"

    .line 166
    .line 167
    const-string v67, "com.ledou.mhhy"

    .line 168
    .line 169
    const-string v68, "cmb.pb"

    .line 170
    .line 171
    const-string v69, "com.tencent.tmgp.WePop"

    .line 172
    .line 173
    const-string v70, "com.popcap.pvz2cthdnby"

    .line 174
    .line 175
    const-string v71, "us.pinguo.idcamera"

    .line 176
    .line 177
    const-string v72, "com.tencent.tmgp.supercell.brawlstars"

    .line 178
    .line 179
    const-string v73, "com.doudou.ysvideo"

    .line 180
    .line 181
    filled-new-array/range {v1 .. v75}, [Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    sput-object v0, Lx1/r;->G:[Ljava/lang/String;

    .line 186
    .line 187
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 188
    .line 189
    new-instance v1, Lx1/i;

    .line 190
    .line 191
    invoke-direct {v1}, Lx1/i;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 195
    .line 196
    .line 197
    sput-object v0, Lx1/r;->H:Lcom/android/launcher3/util/I;

    .line 198
    .line 199
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lx1/r$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lx1/r$a;-><init>(Lx1/r;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lx1/r;->r:Landroid/content/BroadcastReceiver;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-object v1, p0, Lx1/r;->s:LP3/a;

    .line 13
    .line 14
    new-instance v2, Lx1/r$b;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Lx1/r$b;-><init>(Lx1/r;)V

    .line 17
    .line 18
    .line 19
    iput-object v2, p0, Lx1/r;->t:Landroid/content/ServiceConnection;

    .line 20
    .line 21
    iput-object v1, p0, Lx1/r;->u:Ljava/util/function/Consumer;

    .line 22
    .line 23
    iput-object v1, p0, Lx1/r;->v:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput v1, p0, Lx1/r;->x:I

    .line 27
    .line 28
    new-instance v2, Lx1/r$c;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Lx1/r$c;-><init>(Lx1/r;)V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lx1/r;->y:LP3/b;

    .line 34
    .line 35
    new-instance v2, Lx1/r$d;

    .line 36
    .line 37
    new-instance v3, Landroid/os/Handler;

    .line 38
    .line 39
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {v2, p0, v3}, Lx1/r$d;-><init>(Lx1/r;Landroid/os/Handler;)V

    .line 47
    .line 48
    .line 49
    iput-object v2, p0, Lx1/r;->B:Landroid/database/ContentObserver;

    .line 50
    .line 51
    iput-object p1, p0, Lx1/r;->g:Landroid/content/Context;

    .line 52
    .line 53
    sget-object v3, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 54
    .line 55
    invoke-virtual {v3, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/android/launcher3/util/p2;

    .line 60
    .line 61
    const-string v4, "service_manager_switch"

    .line 62
    .line 63
    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    new-instance v5, Lx1/l;

    .line 68
    .line 69
    invoke-direct {v5, p0}, Lx1/l;-><init>(Lx1/r;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    iput-boolean v4, p0, Lx1/r;->h:Z

    .line 80
    .line 81
    const-string v4, "app_switch_on"

    .line 82
    .line 83
    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    new-instance v5, Lx1/m;

    .line 88
    .line 89
    invoke-direct {v5, p0}, Lx1/m;-><init>(Lx1/r;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    iput-boolean v3, p0, Lx1/r;->i:Z

    .line 100
    .line 101
    const-string v3, "bluetooth"

    .line 102
    .line 103
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Landroid/bluetooth/BluetoothManager;

    .line 108
    .line 109
    const/4 v3, 0x1

    .line 110
    if-eqz p1, :cond_1

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    if-eqz p1, :cond_0

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_0

    .line 123
    .line 124
    move p1, v3

    .line 125
    goto :goto_0

    .line 126
    :cond_0
    move p1, v1

    .line 127
    :goto_0
    iput-boolean p1, p0, Lx1/r;->j:Z

    .line 128
    .line 129
    :cond_1
    iget-boolean p1, p0, Lx1/r;->i:Z

    .line 130
    .line 131
    if-eqz p1, :cond_2

    .line 132
    .line 133
    iget-boolean p1, p0, Lx1/r;->h:Z

    .line 134
    .line 135
    if-eqz p1, :cond_2

    .line 136
    .line 137
    iget-boolean p1, p0, Lx1/r;->j:Z

    .line 138
    .line 139
    if-eqz p1, :cond_2

    .line 140
    .line 141
    invoke-direct {p0, v3}, Lx1/r;->o0(Z)V

    .line 142
    .line 143
    .line 144
    :cond_2
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 145
    .line 146
    .line 147
    new-instance p1, Landroid/content/IntentFilter;

    .line 148
    .line 149
    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    .line 150
    .line 151
    .line 152
    const-string v3, "com.zte.multscr.ACTION_CAST_CONNECTION_CHANGE"

    .line 153
    .line 154
    invoke-virtual {p1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    sget-boolean v3, Lx1/O;->T:Z

    .line 158
    .line 159
    if-nez v3, :cond_3

    .line 160
    .line 161
    const-string v4, "com.zte.multscr.ACTION_CAST_FAIL"

    .line 162
    .line 163
    invoke-virtual {p1, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    const-string v4, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 167
    .line 168
    invoke-virtual {p1, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_3
    iget-object v4, p0, Lx1/r;->g:Landroid/content/Context;

    .line 172
    .line 173
    const/4 v5, 0x2

    .line 174
    invoke-virtual {v4, v0, p1, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 175
    .line 176
    .line 177
    if-nez v3, :cond_4

    .line 178
    .line 179
    invoke-direct {p0}, Lx1/r;->t0()V

    .line 180
    .line 181
    .line 182
    :try_start_0
    iget-object p1, p0, Lx1/r;->g:Landroid/content/Context;

    .line 183
    .line 184
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    sget-object v0, Lx1/r;->D:Landroid/net/Uri;

    .line 189
    .line 190
    invoke-virtual {p1, v0, v1, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Lx1/r;->g:Landroid/content/Context;

    .line 194
    .line 195
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    sget-object p1, Lx1/r;->E:Landroid/net/Uri;

    .line 200
    .line 201
    invoke-virtual {p0, p1, v1, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :catch_0
    move-exception p0

    .line 206
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 207
    .line 208
    .line 209
    :cond_4
    return-void
.end method

.method static bridge synthetic A(Lx1/r;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/r;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic A0(Landroid/net/Uri;Ljava/util/List;Ljava/util/List;)V
    .locals 1

    .line 1
    sget-object v0, Lx1/r;->D:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lx1/r;->z:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lx1/r;->z:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p3}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v0, Lx1/r;->E:Landroid/net/Uri;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Lx1/r;->A:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lx1/r;->A:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p0, p3}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method static bridge synthetic B(Lx1/r;)LP3/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->y:LP3/b;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic B0(Landroid/net/Uri;)V
    .locals 10

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v2, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Lx1/r;->g:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    const/4 v8, 0x0

    .line 23
    const/4 v9, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v7, 0x0

    .line 27
    move-object v5, p1

    .line 28
    :try_start_0
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 29
    .line 30
    .line 31
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    :cond_0
    :goto_0
    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 33
    .line 34
    .line 35
    move-result v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    const-string v7, "version"

    .line 37
    .line 38
    if-eqz v6, :cond_3

    .line 39
    .line 40
    :try_start_2
    const-string v6, "pkg_name"

    .line 41
    .line 42
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    if-ltz v6, :cond_0

    .line 47
    .line 48
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    const-string v8, "action"

    .line 53
    .line 54
    invoke-interface {p1, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    if-ltz v8, :cond_2

    .line 59
    .line 60
    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const-string v9, "add"

    .line 65
    .line 66
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    if-eqz v9, :cond_1

    .line 71
    .line 72
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    move-object p0, v0

    .line 78
    move-object v3, p1

    .line 79
    goto/16 :goto_7

    .line 80
    .line 81
    :catch_0
    move-exception v0

    .line 82
    move-object v3, p1

    .line 83
    goto/16 :goto_3

    .line 84
    .line 85
    :cond_1
    const-string v9, "delete"

    .line 86
    .line 87
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    if-eqz v8, :cond_2

    .line 92
    .line 93
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_1
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    if-ltz v6, :cond_0

    .line 101
    .line 102
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    if-nez v7, :cond_0

    .line 111
    .line 112
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    if-nez v6, :cond_6

    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-interface {v0}, Ljava/util/stream/Stream;->distinct()Ljava/util/stream/Stream;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v6, Lcom/android/launcher3/q2;

    .line 131
    .line 132
    invoke-direct {v6}, Lcom/android/launcher3/q2;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {v6}, Ljava/util/stream/Collectors;->toCollection(Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    invoke-interface {v0, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Ljava/util/ArrayList;

    .line 144
    .line 145
    new-instance v6, Landroid/os/Bundle;

    .line 146
    .line 147
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v6, v7, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 151
    .line 152
    .line 153
    sget-object v0, Lx1/r;->D:Landroid/net/Uri;

    .line 154
    .line 155
    invoke-virtual {v0, v5}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 159
    const-string v7, "module"

    .line 160
    .line 161
    if-eqz v0, :cond_4

    .line 162
    .line 163
    :try_start_3
    const-string v0, "multiScreenWhiteList"

    .line 164
    .line 165
    invoke-virtual {v6, v7, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_4
    sget-object v0, Lx1/r;->E:Landroid/net/Uri;

    .line 170
    .line 171
    invoke-virtual {v0, v5}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_5

    .line 176
    .line 177
    const-string v0, "multiScreenBlackList"

    .line 178
    .line 179
    invoke-virtual {v6, v7, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    :cond_5
    :goto_2
    const-string v0, "versionList"

    .line 183
    .line 184
    invoke-virtual {v4, v5, v0, v3, v6}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    sget-object v3, Lx1/r;->C:Ljava/lang/String;

    .line 189
    .line 190
    new-instance v4, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .line 194
    .line 195
    const-string v7, "updateBlackWhiteList: call back result: "

    .line 196
    .line 197
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v0, ", bundle: "

    .line 204
    .line 205
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 216
    .line 217
    .line 218
    :cond_6
    invoke-static {p1}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 219
    .line 220
    .line 221
    goto :goto_4

    .line 222
    :catchall_1
    move-exception v0

    .line 223
    move-object p0, v0

    .line 224
    goto :goto_7

    .line 225
    :catch_1
    move-exception v0

    .line 226
    :goto_3
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 227
    .line 228
    .line 229
    invoke-static {v3}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 230
    .line 231
    .line 232
    :goto_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v0, "uri "

    .line 238
    .line 239
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v0, " appTransferAddList:"

    .line 246
    .line 247
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    const-string v4, " "

    .line 259
    .line 260
    if-eqz v3, :cond_7

    .line 261
    .line 262
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    check-cast v3, Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    goto :goto_5

    .line 275
    :cond_7
    const-string v0, "-appTransferDelList: "

    .line 276
    .line 277
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    if-eqz v3, :cond_8

    .line 289
    .line 290
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    check-cast v3, Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    goto :goto_6

    .line 303
    :cond_8
    sget-object v0, Lx1/r;->C:Ljava/lang/String;

    .line 304
    .line 305
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 313
    .line 314
    new-instance v0, Lx1/q;

    .line 315
    .line 316
    invoke-direct {v0, p0, v5, v1, v2}, Lx1/q;-><init>(Lx1/r;Landroid/net/Uri;Ljava/util/List;Ljava/util/List;)V

    .line 317
    .line 318
    .line 319
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 320
    .line 321
    .line 322
    return-void

    .line 323
    :goto_7
    invoke-static {v3}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 324
    .line 325
    .line 326
    throw p0
.end method

.method static bridge synthetic C(Lx1/r;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic D(Lx1/r;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/r;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic E(Lx1/r;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic F(Lx1/r;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic I(Lx1/r;)I
    .locals 0

    .line 1
    iget p0, p0, Lx1/r;->x:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic J(Lx1/r;)LP3/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->s:LP3/a;

    .line 2
    .line 3
    return-object p0
.end method

.method private J0(Landroid/net/Uri;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lx1/p;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lx1/p;-><init>(Lx1/r;Landroid/net/Uri;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic L(Lx1/r;)Ljava/util/function/Consumer;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->u:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic M(Lx1/r;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/r;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic P(Lx1/r;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/r;->l:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic T(Lx1/r;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lx1/r;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic U(Lx1/r;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/r;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic a0(Lx1/r;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lx1/r;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic b(Lx1/r;Landroid/net/Uri;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lx1/r;->A0(Landroid/net/Uri;Ljava/util/List;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b0(Lx1/r;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/r;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic c(Lx1/r;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lx1/r;->x0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c0(Lx1/r;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/r;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic d(Lx1/r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lx1/r;->v0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d0(Lx1/r;I)V
    .locals 0

    .line 1
    iput p1, p0, Lx1/r;->x:I

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic e(Lx1/r;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lx1/r;->z0(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e0(Lx1/r;LP3/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/r;->s:LP3/a;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f0(Lx1/r;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/r;->u:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic g(Lx1/r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lx1/r;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g0(Lx1/r;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lx1/r;->o0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic h0(Lx1/r;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lx1/r;->p0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic i0(Lx1/r;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lx1/r;->J0(Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lx1/r;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lx1/r;->w0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic j0()Landroid/net/Uri;
    .locals 1

    .line 1
    sget-object v0, Lx1/r;->E:Landroid/net/Uri;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic k0()Landroid/net/Uri;
    .locals 1

    .line 1
    sget-object v0, Lx1/r;->D:Landroid/net/Uri;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic l0()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lx1/r;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic n(Lx1/r;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lx1/r;->B0(Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private o0(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lx1/r;->g:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Lx1/r;->C:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "connectRelayService "

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    :try_start_0
    iget-object p1, p0, Lx1/r;->g:Landroid/content/Context;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v1, Lx1/x;

    .line 42
    .line 43
    new-instance v2, Lx1/o;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Lx1/o;-><init>(Lx1/r;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {v1, v2, v0}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v1}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1, v0}, Lx1/r;->G0(Landroid/app/TaskInfo;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lx1/r;->g:Landroid/content/Context;

    .line 60
    .line 61
    iget-object v1, p0, Lx1/r;->t:Landroid/content/ServiceConnection;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lx1/r;->s:LP3/a;

    .line 67
    .line 68
    iput-object p1, p0, Lx1/r;->v:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    return-void

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    :goto_0
    return-void
.end method

.method private p0(I)Z
    .locals 0

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    if-eq p1, p0, :cond_1

    .line 4
    .line 5
    const/4 p0, 0x7

    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public static synthetic t(Lx1/r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lx1/r;->y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t0()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lx1/r;->z:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lx1/r;->A:Ljava/util/List;

    .line 14
    .line 15
    :try_start_0
    iget-object v0, p0, Lx1/r;->z:Ljava/util/List;

    .line 16
    .line 17
    sget-object v1, Lx1/r;->F:[Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lx1/r;->A:Ljava/util/List;

    .line 23
    .line 24
    sget-object v1, Lx1/r;->G:[Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Lx1/r;->A:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Lx1/r;->g:Landroid/content/Context;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lx1/r;->g:Landroid/content/Context;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Lx1/x;

    .line 58
    .line 59
    new-instance v2, Lx1/n;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Lx1/n;-><init>(Lx1/r;)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    invoke-direct {v1, v2, p0}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private synthetic u0()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "com.zte.distservice.relayservice.IRelayService"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "com.zte.distservice.relayservice"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lx1/r;->g:Landroid/content/Context;

    .line 14
    .line 15
    iget-object p0, p0, Lx1/r;->t:Landroid/content/ServiceConnection;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, v0, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    sget-object v0, Lx1/r;->C:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "bind relayService "

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method static bridge synthetic v(Lx1/r;)Ljava/util/function/Consumer;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->l:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic v0()V
    .locals 1

    .line 1
    sget-object v0, Lx1/r;->D:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lx1/r;->J0(Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lx1/r;->E:Landroid/net/Uri;

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lx1/r;->J0(Landroid/net/Uri;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method static bridge synthetic w(Lx1/r;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/r;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic w0(Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lx1/r;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lx1/r;->i:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Lx1/r;->j:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    move v0, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-boolean v3, p0, Lx1/r;->i:Z

    .line 21
    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    iget-boolean v3, p0, Lx1/r;->j:Z

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    move v1, v2

    .line 29
    :cond_1
    if-eq v0, v1, :cond_2

    .line 30
    .line 31
    invoke-direct {p0, p1}, Lx1/r;->o0(Z)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iput-boolean p1, p0, Lx1/r;->h:Z

    .line 35
    .line 36
    sget-object p1, Lx1/r;->C:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v1, "onServiceManagerSwitchUriChangeListener = "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean p0, p0, Lx1/r;->h:Z

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private synthetic x0(Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lx1/r;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v3, p0, Lx1/r;->i:Z

    .line 8
    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    iget-boolean v3, p0, Lx1/r;->j:Z

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    move v3, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v3, v1

    .line 18
    :goto_0
    if-eqz v0, :cond_1

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-boolean v0, p0, Lx1/r;->j:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    move v1, v2

    .line 27
    :cond_1
    if-eq v3, v1, :cond_2

    .line 28
    .line 29
    invoke-direct {p0, p1}, Lx1/r;->o0(Z)V

    .line 30
    .line 31
    .line 32
    :cond_2
    iput-boolean p1, p0, Lx1/r;->i:Z

    .line 33
    .line 34
    sget-object p1, Lx1/r;->C:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v1, "onServiceManagerSwitchUriChangeListener = "

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-boolean p0, p0, Lx1/r;->i:Z

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private synthetic y0()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lx1/r;->s:LP3/a;

    .line 2
    .line 3
    invoke-interface {v0}, LP3/a;->X0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput-boolean v0, p0, Lx1/r;->w:Z

    .line 8
    .line 9
    sget-object v0, Lx1/r;->C:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "mIsAppFlowTurnOn "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-boolean p0, p0, Lx1/r;->w:Z

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic z0(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    iget-object v1, p0, Lx1/r;->s:LP3/a;

    .line 4
    .line 5
    if-eqz v1, :cond_7

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const-string v3, "relay_service_type_app_flow"

    .line 9
    .line 10
    const-string v4, ""

    .line 11
    .line 12
    const/4 v5, 0x0

    .line 13
    if-nez p1, :cond_2

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    :try_start_0
    iget-boolean p1, p0, Lx1/r;->k:Z

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    new-instance p1, LQ3/a;

    .line 23
    .line 24
    iget-object p2, p0, Lx1/r;->g:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-array v0, v5, [B

    .line 31
    .line 32
    invoke-direct {p1, p2, v3, v5, v0}, LQ3/a;-><init>(Ljava/lang/String;Ljava/lang/String;I[B)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v1, v4, p1}, LP3/a;->r1(Ljava/lang/String;LQ3/a;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iput-boolean v2, p0, Lx1/r;->k:Z

    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    :goto_0
    if-eqz p1, :cond_3

    .line 42
    .line 43
    invoke-static {p1}, Lx1/O;->J(Landroid/graphics/drawable/Drawable;)[B

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    goto :goto_1

    .line 48
    :cond_3
    const/4 p1, 0x0

    .line 49
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    array-length v6, v1

    .line 54
    const v7, 0xffff

    .line 55
    .line 56
    .line 57
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz p1, :cond_4

    .line 62
    .line 63
    array-length v7, p1

    .line 64
    goto :goto_2

    .line 65
    :cond_4
    move v7, v5

    .line 66
    :goto_2
    add-int/2addr v7, v6

    .line 67
    const/4 v8, 0x2

    .line 68
    add-int/2addr v7, v8

    .line 69
    new-array v9, v7, [B

    .line 70
    .line 71
    and-int/lit16 v10, v6, 0xff

    .line 72
    .line 73
    int-to-byte v10, v10

    .line 74
    aput-byte v10, v9, v5

    .line 75
    .line 76
    shr-int/lit8 v10, v6, 0x8

    .line 77
    .line 78
    and-int/lit16 v10, v10, 0xff

    .line 79
    .line 80
    int-to-byte v10, v10

    .line 81
    aput-byte v10, v9, v2

    .line 82
    .line 83
    array-length v2, v1

    .line 84
    invoke-static {v1, v5, v9, v8, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    .line 86
    .line 87
    if-eqz p1, :cond_5

    .line 88
    .line 89
    add-int/2addr v6, v8

    .line 90
    array-length v1, p1

    .line 91
    invoke-static {p1, v5, v9, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    .line 93
    .line 94
    :cond_5
    new-instance v1, LQ3/a;

    .line 95
    .line 96
    iget-object v2, p0, Lx1/r;->g:Landroid/content/Context;

    .line 97
    .line 98
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-direct {v1, v2, v3, v7, v9}, LQ3/a;-><init>(Ljava/lang/String;Ljava/lang/String;I[B)V

    .line 103
    .line 104
    .line 105
    iput-object v1, p0, Lx1/r;->p:LQ3/a;

    .line 106
    .line 107
    sget-object v1, Lx1/r;->C:Ljava/lang/String;

    .line 108
    .line 109
    new-instance v2, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v3, "sendIconToPad, appIcon.length: "

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    if-eqz p1, :cond_6

    .line 120
    .line 121
    array-length p1, p1

    .line 122
    goto :goto_3

    .line 123
    :cond_6
    move p1, v5

    .line 124
    :goto_3
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lx1/r;->p:LQ3/a;

    .line 131
    .line 132
    invoke-virtual {p1}, LQ3/a;->describeContents()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Lx1/r;->s:LP3/a;

    .line 153
    .line 154
    iget-object p2, p0, Lx1/r;->p:LQ3/a;

    .line 155
    .line 156
    invoke-interface {p1, v4, p2}, LP3/a;->r1(Ljava/lang/String;LQ3/a;)V

    .line 157
    .line 158
    .line 159
    iput-boolean v5, p0, Lx1/r;->k:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    .line 161
    return-void

    .line 162
    :catch_0
    move-exception p0

    .line 163
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 164
    .line 165
    .line 166
    :cond_7
    return-void
.end method


# virtual methods
.method public C0()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "com.zte.mifavor.launcher.ACTION_RESUME"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "com.zte.multscr"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const/high16 v1, 0x1000000

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lx1/r;->g:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public D0(Ljava/util/function/Consumer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lx1/r;->v:Ljava/lang/String;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lx1/r;->w:Z

    .line 6
    .line 7
    iget-object v0, p0, Lx1/r;->s:LP3/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    :try_start_0
    iget-object v1, p0, Lx1/r;->g:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "187f8000-0000-1000-8000-ceb574815500"

    .line 18
    .line 19
    iget-object v3, p0, Lx1/r;->y:LP3/b;

    .line 20
    .line 21
    invoke-interface {v0, v1, v2, v3}, LP3/a;->U(Ljava/lang/String;Ljava/lang/String;LP3/b;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lx1/r;->u:Ljava/util/function/Consumer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public E0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lx1/r;->w:Z

    .line 3
    .line 4
    iget-object v1, p0, Lx1/r;->s:LP3/a;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance v1, Lx1/j;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lx1/j;-><init>(Lx1/r;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iput-boolean v0, p0, Lx1/r;->w:Z

    .line 20
    .line 21
    return-void
.end method

.method public F0(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lx1/r;->C:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "sendIconToPad, mRelayService: "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lx1/r;->s:LP3/a;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, " "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v2, 0x0

    .line 37
    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 48
    .line 49
    new-instance v1, Lx1/k;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1, p2}, Lx1/k;-><init>(Lx1/r;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public G0(Landroid/app/TaskInfo;Z)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_7

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_7

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    if-nez v1, :cond_7

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lx1/r;->q0()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->t2()[I

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const/4 v2, 0x0

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    array-length v1, v1

    .line 39
    const/4 v3, 0x2

    .line 40
    if-ge v1, v3, :cond_6

    .line 41
    .line 42
    :cond_1
    if-eqz p1, :cond_6

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/android/launcher3/C2;->h1(Landroid/app/TaskInfo;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_6

    .line 49
    .line 50
    iget-object v0, p1, Landroid/app/TaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 51
    .line 52
    if-eqz v0, :cond_6

    .line 53
    .line 54
    if-nez p2, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Lx1/r;->q0()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_6

    .line 61
    .line 62
    :cond_2
    iget-object v0, p1, Landroid/app/TaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 69
    .line 70
    invoke-direct {v1, p1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 71
    .line 72
    .line 73
    const/4 v3, 0x0

    .line 74
    invoke-static {v1, p1, v3}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p0, v1, p1}, Lx1/r;->n0(Lcom/android/systemui/shared/recents/model/Task;Landroid/app/TaskInfo;)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-nez v3, :cond_3

    .line 83
    .line 84
    invoke-virtual {p0, v2, v2}, Lx1/r;->F0(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    if-eqz v0, :cond_4

    .line 89
    .line 90
    iget-object v3, p0, Lx1/r;->q:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_4

    .line 97
    .line 98
    if-nez p2, :cond_4

    .line 99
    .line 100
    sget-object p2, Lx1/r;->C:Ljava/lang/String;

    .line 101
    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v2, "Same package "

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    iget-object p2, p0, Lx1/r;->g:Landroid/content/Context;

    .line 124
    .line 125
    invoke-static {p2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    iget p2, p2, Lcom/android/launcher3/F1;->O0:I

    .line 130
    .line 131
    iget-object v3, p0, Lx1/r;->g:Landroid/content/Context;

    .line 132
    .line 133
    const-class v4, Landroid/content/pm/LauncherApps;

    .line 134
    .line 135
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    check-cast v3, Landroid/content/pm/LauncherApps;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 142
    .line 143
    iget-object v4, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseIntent:Landroid/content/Intent;

    .line 144
    .line 145
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 146
    .line 147
    invoke-static {v1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v3, v4, v1}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    if-eqz v1, :cond_5

    .line 156
    .line 157
    iget-object v2, p0, Lx1/r;->g:Landroid/content/Context;

    .line 158
    .line 159
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->g()Ls1/V;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-virtual {v1}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {v2, v1, v3, p2}, Ls1/T;->k(Landroid/content/pm/LauncherActivityInfo;Landroid/content/pm/ComponentInfo;I)Landroid/graphics/drawable/Drawable;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    :cond_5
    invoke-virtual {p0, v2, v0}, Lx1/r;->F0(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :goto_0
    iget-object p1, p1, Landroid/app/TaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 179
    .line 180
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lx1/r;->q:Ljava/lang/String;

    .line 185
    .line 186
    return-void

    .line 187
    :cond_6
    if-nez p1, :cond_7

    .line 188
    .line 189
    iget-object p1, p0, Lx1/r;->q:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz p1, :cond_7

    .line 192
    .line 193
    iput-object v2, p0, Lx1/r;->q:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {p0, v2, v2}, Lx1/r;->F0(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :cond_7
    :goto_1
    return-void
.end method

.method public H0(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lx1/r;->l:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-void
.end method

.method public I0(Landroid/app/ActivityManager$RunningTaskInfo;I)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lx1/r;->G0(Landroid/app/TaskInfo;Z)V

    .line 3
    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget-object v0, Lx1/r;->C:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "startTranferApp: "

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    new-instance v0, Landroid/content/Intent;

    .line 38
    .line 39
    const-string v1, "com.zte.multscr.ACTION_START_CAST"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v1, "com.zte.multscr"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    const-string v1, "cast_type"

    .line 50
    .line 51
    const-string v2, "recent"

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    const-string v1, "com.zte.multscr.intent.extra.CAST_APP"

    .line 57
    .line 58
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    const-string p1, "com.zte.multscr.intent.extra.CAST_ROLE"

    .line 62
    .line 63
    const-string v1, "source"

    .line 64
    .line 65
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    const-string p1, "com.zte.multscr.intent.extra.CAST_APP_ROTATION"

    .line 69
    .line 70
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    const/high16 p1, 0x1000000

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lx1/r;->g:Landroid/content/Context;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    return-void
.end method

.method public m0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lx1/r;->l:Ljava/util/function/Consumer;

    .line 3
    .line 4
    iput-object v0, p0, Lx1/r;->o:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lx1/r;->u:Ljava/util/function/Consumer;

    .line 7
    .line 8
    return-void
.end method

.method public n0(Lcom/android/systemui/shared/recents/model/Task;Landroid/app/TaskInfo;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_8

    .line 3
    .line 4
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 5
    .line 6
    if-eqz v1, :cond_8

    .line 7
    .line 8
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/16 v2, 0x3e7

    .line 13
    .line 14
    if-ne v1, v2, :cond_8

    .line 15
    .line 16
    :cond_0
    if-nez p2, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object p2, p2, Landroid/app/TaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 20
    .line 21
    if-nez p2, :cond_2

    .line 22
    .line 23
    return v0

    .line 24
    :cond_2
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    new-instance v1, Lcom/android/launcher3/util/J1;

    .line 29
    .line 30
    iget-object v2, p0, Lx1/r;->g:Landroid/content/Context;

    .line 31
    .line 32
    invoke-direct {v1, v2}, Lcom/android/launcher3/util/J1;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 36
    .line 37
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 38
    .line 39
    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {v1, p2, p1, v0}, Lcom/android/launcher3/util/J1;->e(Ljava/lang/String;Landroid/os/UserHandle;I)Landroid/content/pm/ApplicationInfo;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 v1, 0x1

    .line 48
    if-eqz p1, :cond_5

    .line 49
    .line 50
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 51
    .line 52
    and-int/lit8 v2, p1, 0x1

    .line 53
    .line 54
    if-nez v2, :cond_3

    .line 55
    .line 56
    and-int/lit16 p1, p1, 0x80

    .line 57
    .line 58
    if-eqz p1, :cond_5

    .line 59
    .line 60
    :cond_3
    iget-object p0, p0, Lx1/r;->z:Ljava/util/List;

    .line 61
    .line 62
    if-eqz p0, :cond_4

    .line 63
    .line 64
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    return v1

    .line 71
    :cond_4
    return v0

    .line 72
    :cond_5
    iget-object p0, p0, Lx1/r;->A:Ljava/util/List;

    .line 73
    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_6

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_6
    return v0

    .line 84
    :cond_7
    :goto_0
    return v1

    .line 85
    :cond_8
    :goto_1
    return v0
.end method

.method public q0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/r;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public r0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/r;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public s0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/r;->v:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
