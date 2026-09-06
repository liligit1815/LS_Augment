.class public Lcom/android/launcher3/taskbar/g3;
.super Ljava/lang/Object;
.source "TaskbarManager.java"

# interfaces
.implements Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/g3$g;,
        Lcom/android/launcher3/taskbar/g3$f;
    }
.end annotation


# static fields
.field private static final I:Landroid/net/Uri;

.field private static final J:Landroid/net/Uri;


# instance fields
.field private A:Z

.field private final B:Lcom/android/launcher3/util/x2;

.field private final C:Lcom/android/launcher3/util/x2;

.field private final D:Lcom/android/quickstep/AllAppsActionManager;

.field private final E:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

.field private final F:Ljava/lang/Runnable;

.field G:LC2/i$a;

.field private final H:Lcom/android/launcher3/X3$b;

.field private final a:Landroid/content/Context;

.field private final b:I

.field private final c:Lcom/android/launcher3/taskbar/l3$a;

.field private final d:Landroid/content/Context;

.field private final e:Landroid/view/WindowManager;

.field private f:Lcom/android/launcher3/taskbar/l3;

.field private g:Landroid/content/ComponentCallbacks;

.field private final h:Lcom/android/launcher3/util/x2;

.field private final i:LF2/i;

.field private final j:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/taskbar/I1;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/widget/FrameLayout;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Landroid/util/SparseBooleanArray;

.field private final n:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/taskbar/l3;",
            ">;"
        }
    .end annotation
.end field

.field private final o:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/content/ComponentCallbacks;",
            ">;"
        }
    .end annotation
.end field

.field private final p:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/h0;",
            ">;"
        }
    .end annotation
.end field

.field private q:Lcom/android/launcher3/statemanager/h;

.field private r:Lcom/android/quickstep/views/RecentsViewContainer;

.field private s:Z

.field private t:Z

.field private final u:Lcom/android/launcher3/taskbar/J3;

.field private final v:Lcom/android/launcher3/taskbar/g3$g;

.field private w:Z

.field private final x:Lcom/android/launcher3/util/p2$a;

.field private y:Lcom/android/launcher3/taskbar/g3$f;

.field private final z:LP1/k$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "user_setup_complete"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/g3;->I:Landroid/net/Uri;

    .line 8
    .line 9
    const-string v0, "nav_bar_kids_mode"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/android/launcher3/taskbar/g3;->J:Landroid/net/Uri;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/AllAppsActionManager;Lcom/android/launcher3/taskbar/l3$a;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lb2/a;

    .line 5
    .line 6
    invoke-direct {v0}, Lb2/a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->i:LF2/i;

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 17
    .line 18
    new-instance v0, Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->k:Landroid/util/SparseArray;

    .line 24
    .line 25
    new-instance v0, Landroid/util/SparseArray;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 31
    .line 32
    new-instance v0, Landroid/util/SparseBooleanArray;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->m:Landroid/util/SparseBooleanArray;

    .line 38
    .line 39
    new-instance v0, Landroid/util/SparseArray;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->n:Landroid/util/SparseArray;

    .line 45
    .line 46
    new-instance v0, Landroid/util/SparseArray;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->o:Landroid/util/SparseArray;

    .line 52
    .line 53
    new-instance v0, Landroid/util/SparseArray;

    .line 54
    .line 55
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->p:Landroid/util/SparseArray;

    .line 59
    .line 60
    new-instance v0, Lcom/android/launcher3/taskbar/J3;

    .line 61
    .line 62
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/J3;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 66
    .line 67
    new-instance v0, Lcom/android/launcher3/taskbar/g3$g;

    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/taskbar/g3$g;-><init>(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/taskbar/h3;)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->v:Lcom/android/launcher3/taskbar/g3$g;

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/g3;->w:Z

    .line 77
    .line 78
    new-instance v2, Lcom/android/launcher3/taskbar/Y2;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/Y2;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 81
    .line 82
    .line 83
    iput-object v2, p0, Lcom/android/launcher3/taskbar/g3;->x:Lcom/android/launcher3/util/p2$a;

    .line 84
    .line 85
    new-instance v3, Lcom/android/launcher3/taskbar/g3$a;

    .line 86
    .line 87
    invoke-direct {v3, p0}, Lcom/android/launcher3/taskbar/g3$a;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 88
    .line 89
    .line 90
    iput-object v3, p0, Lcom/android/launcher3/taskbar/g3;->z:LP1/k$d;

    .line 91
    .line 92
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/g3;->A:Z

    .line 93
    .line 94
    new-instance v0, Lcom/android/launcher3/taskbar/g3$b;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/g3$b;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->F:Ljava/lang/Runnable;

    .line 100
    .line 101
    new-instance v0, Lcom/android/launcher3/taskbar/g3$c;

    .line 102
    .line 103
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/g3$c;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->G:LC2/i$a;

    .line 107
    .line 108
    new-instance v0, Lcom/android/launcher3/taskbar/Z2;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/Z2;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 111
    .line 112
    .line 113
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->H:Lcom/android/launcher3/X3$b;

    .line 114
    .line 115
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/content/Context;->getDisplayId()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iput v0, p0, Lcom/android/launcher3/taskbar/g3;->b:I

    .line 122
    .line 123
    iput-object p2, p0, Lcom/android/launcher3/taskbar/g3;->D:Lcom/android/quickstep/AllAppsActionManager;

    .line 124
    .line 125
    iput-object p3, p0, Lcom/android/launcher3/taskbar/g3;->c:Lcom/android/launcher3/taskbar/l3$a;

    .line 126
    .line 127
    iput-object p4, p0, Lcom/android/launcher3/taskbar/g3;->E:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 128
    .line 129
    const-string p2, "TaskbarManager constructor"

    .line 130
    .line 131
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->N(I)Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    iput-object p2, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 143
    .line 144
    const-class p3, Landroid/view/WindowManager;

    .line 145
    .line 146
    invoke-virtual {p2, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    check-cast p3, Landroid/view/WindowManager;

    .line 151
    .line 152
    iput-object p3, p0, Lcom/android/launcher3/taskbar/g3;->e:Landroid/view/WindowManager;

    .line 153
    .line 154
    sget-object p3, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 155
    .line 156
    invoke-virtual {p3, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p3

    .line 160
    check-cast p3, LP1/k;

    .line 161
    .line 162
    invoke-virtual {p3, v3}, LP1/k;->N(LP1/k$d;)V

    .line 163
    .line 164
    .line 165
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 166
    .line 167
    .line 168
    move-result p3

    .line 169
    invoke-direct {p0, p3}, Lcom/android/launcher3/taskbar/g3;->K(I)V

    .line 170
    .line 171
    .line 172
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    invoke-direct {p0, p3}, Lcom/android/launcher3/taskbar/g3;->I(I)V

    .line 177
    .line 178
    .line 179
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 180
    .line 181
    .line 182
    move-result p3

    .line 183
    invoke-direct {p0, p3}, Lcom/android/launcher3/taskbar/g3;->F(I)V

    .line 184
    .line 185
    .line 186
    sget-object p3, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 187
    .line 188
    invoke-virtual {p3, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p4

    .line 192
    check-cast p4, Lcom/android/launcher3/util/p2;

    .line 193
    .line 194
    sget-object v0, Lcom/android/launcher3/taskbar/g3;->I:Landroid/net/Uri;

    .line 195
    .line 196
    invoke-virtual {p4, v0, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p3, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object p3

    .line 203
    check-cast p3, Lcom/android/launcher3/util/p2;

    .line 204
    .line 205
    sget-object p4, Lcom/android/launcher3/taskbar/g3;->J:Landroid/net/Uri;

    .line 206
    .line 207
    invoke-virtual {p3, p4, v2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 208
    .line 209
    .line 210
    invoke-static {}, Lcom/android/quickstep/SystemDecorationChangeObserver;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 211
    .line 212
    .line 213
    move-result-object p3

    .line 214
    invoke-virtual {p3, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object p3

    .line 218
    check-cast p3, Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 219
    .line 220
    invoke-virtual {p3, p0}, Lcom/android/quickstep/SystemDecorationChangeObserver;->registerDisplayDecorationListener(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;)V

    .line 221
    .line 222
    .line 223
    new-instance p3, Lcom/android/launcher3/util/x2;

    .line 224
    .line 225
    sget-object p4, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 226
    .line 227
    new-instance v0, Lcom/android/launcher3/taskbar/a3;

    .line 228
    .line 229
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/a3;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 230
    .line 231
    .line 232
    invoke-direct {p3, p2, p4, v0}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 233
    .line 234
    .line 235
    iput-object p3, p0, Lcom/android/launcher3/taskbar/g3;->h:Lcom/android/launcher3/util/x2;

    .line 236
    .line 237
    new-instance v0, Lcom/android/launcher3/util/x2;

    .line 238
    .line 239
    new-instance v2, Lcom/android/launcher3/taskbar/b3;

    .line 240
    .line 241
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/b3;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 242
    .line 243
    .line 244
    invoke-direct {v0, p2, p4, v2}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 245
    .line 246
    .line 247
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->B:Lcom/android/launcher3/util/x2;

    .line 248
    .line 249
    const-string v0, "android.intent.action.ACTION_SHUTDOWN"

    .line 250
    .line 251
    filled-new-array {v0}, [Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    invoke-static {}, Lcom/android/launcher3/y0;->y()Z

    .line 259
    .line 260
    .line 261
    move-result p3

    .line 262
    if-eqz p3, :cond_0

    .line 263
    .line 264
    new-instance p3, Lcom/android/launcher3/util/x2;

    .line 265
    .line 266
    new-instance v0, Lcom/android/launcher3/taskbar/c3;

    .line 267
    .line 268
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/c3;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 269
    .line 270
    .line 271
    invoke-direct {p3, p2, p4, v0}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 272
    .line 273
    .line 274
    iput-object p3, p0, Lcom/android/launcher3/taskbar/g3;->C:Lcom/android/launcher3/util/x2;

    .line 275
    .line 276
    const-string p2, "com.android.launcher3.growth.BROADCAST_SHOW_NUDGE"

    .line 277
    .line 278
    filled-new-array {p2}, [Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p2

    .line 282
    const-string v0, "com.android.growth.permission.GROWTH_NUDGE_PERMISSION android:protectionLevel=\"signature|preinstalled\""

    .line 283
    .line 284
    const/4 v2, 0x2

    .line 285
    invoke-virtual {p3, v1, v0, v2, p2}, Lcom/android/launcher3/util/x2;->o(Ljava/lang/Runnable;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    goto :goto_0

    .line 289
    :cond_0
    iput-object v1, p0, Lcom/android/launcher3/taskbar/g3;->C:Lcom/android/launcher3/util/x2;

    .line 290
    .line 291
    :goto_0
    new-instance p2, Lcom/android/launcher3/taskbar/d3;

    .line 292
    .line 293
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/d3;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p4, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->g0()Landroid/content/Context;

    .line 300
    .line 301
    .line 302
    move-result-object p2

    .line 303
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 304
    .line 305
    .line 306
    move-result-object p2

    .line 307
    const-string p3, "android.hardware.type.pc"

    .line 308
    .line 309
    invoke-virtual {p2, p3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 310
    .line 311
    .line 312
    move-result p2

    .line 313
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/g3;->s:Z

    .line 314
    .line 315
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->e0()Z

    .line 316
    .line 317
    .line 318
    move-result p2

    .line 319
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/g3;->t:Z

    .line 320
    .line 321
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->X()Z

    .line 322
    .line 323
    .line 324
    move-result p2

    .line 325
    if-eqz p2, :cond_1

    .line 326
    .line 327
    new-instance p2, Lcom/android/launcher3/taskbar/g3$f;

    .line 328
    .line 329
    invoke-direct {p2, p0, v1}, Lcom/android/launcher3/taskbar/g3$f;-><init>(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/taskbar/h3;)V

    .line 330
    .line 331
    .line 332
    iput-object p2, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 333
    .line 334
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 335
    .line 336
    .line 337
    move-result-object p2

    .line 338
    iget-object p3, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 339
    .line 340
    invoke-virtual {p2, p3}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 341
    .line 342
    .line 343
    goto :goto_1

    .line 344
    :cond_1
    iput-object v1, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 345
    .line 346
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 347
    .line 348
    .line 349
    const-string p2, "TaskbarManager created"

    .line 350
    .line 351
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 355
    .line 356
    .line 357
    move-result-object p0

    .line 358
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 359
    .line 360
    .line 361
    move-result-object p0

    .line 362
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->u0()V

    .line 363
    .line 364
    .line 365
    return-void
.end method

.method private A(I)V
    .locals 4

    .line 1
    const-string v0, "addTaskbarRootViewToWindow:"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lf1/a;->d()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_6

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->d0(I)Landroid/view/Display;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    const-string v0, "addTaskbarRootViewToWindow: display null"

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->q0(I)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_5

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->i0(I)Landroid/widget/FrameLayout;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->m0(I)Landroid/view/WindowManager;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getWindowLayoutParams()Landroid/view/WindowManager$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v2, v1, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->m:Landroid/util/SparseBooleanArray;

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    if-nez v1, :cond_3

    .line 64
    .line 65
    const-string v0, "rootLayout is NULL!"

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    const-string v0, "rootLayout exists!"

    .line 69
    .line 70
    :goto_0
    if-nez v2, :cond_4

    .line 71
    .line 72
    const-string v1, "windowManager is NULL!"

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    const-string v1, "windowManager exists!"

    .line 76
    .line 77
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v3, "addTaskbarRootViewToWindow: \n\t"

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v0, "\n\t"

    .line 91
    .line 92
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_5
    const-string v0, "addTaskbarRootViewToWindow: rootLayout already added!"

    .line 107
    .line 108
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_6
    :goto_2
    const-string v0, "addTaskbarRootViewToWindow: taskbar null"

    .line 113
    .line 114
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method private B(ILcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->contains(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private C(ILandroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->k:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->contains(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->k:Landroid/util/SparseArray;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private D0(II)V
    .locals 8

    .line 1
    const-string v0, "recreateTaskbarForDisplay: "

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    const-string v0, "recreateTaskbarForDisplay"

    .line 7
    .line 8
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    const-string v0, "recreateTaskbarForDisplay: getting device profile"

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->c0(I)Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-boolean v3, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 25
    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    move v3, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v3, v2

    .line 31
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/taskbar/g3;->D:Lcom/android/quickstep/AllAppsActionManager;

    .line 32
    .line 33
    invoke-virtual {v4, v3}, Lcom/android/quickstep/AllAppsActionManager;->setTaskbarPresent(Z)V

    .line 34
    .line 35
    .line 36
    const-string v4, "recreateTaskbarForDisplay: destroying taskbar"

    .line 37
    .line 38
    invoke-virtual {p0, v4, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->U(I)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->d0(I)Landroid/view/Display;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    move v4, v1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move v4, v2

    .line 53
    :goto_1
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/g3;->p0(Lcom/android/launcher3/h0;)Z

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    if-eqz v5, :cond_2

    .line 60
    .line 61
    sget-object v5, Lf1/a;->G:Lf1/a$a;

    .line 62
    .line 63
    invoke-virtual {v5}, Lf1/a$a;->c()Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-eqz v5, :cond_2

    .line 68
    .line 69
    move v5, v1

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    move v5, v2

    .line 72
    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v7, "recreateTaskbarForDisplay: isTaskbarEnabled="

    .line 78
    .line 79
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v7, " [dp != null (i.e. mUserUnlocked)]="

    .line 86
    .line 87
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    move v7, v1

    .line 93
    goto :goto_3

    .line 94
    :cond_3
    move v7, v2

    .line 95
    :goto_3
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v7, " FLAG_HIDE_NAVBAR_WINDOW="

    .line 99
    .line 100
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    sget-boolean v7, Lf1/a;->g:Z

    .line 104
    .line 105
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v7, " dp.isTaskbarPresent="

    .line 109
    .line 110
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    if-nez v0, :cond_4

    .line 114
    .line 115
    const-string v7, "null"

    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_4
    iget-boolean v7, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 119
    .line 120
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    :goto_4
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v7, " displayExists="

    .line 128
    .line 129
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    invoke-virtual {p0, v6, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 140
    .line 141
    .line 142
    if-eqz v5, :cond_5

    .line 143
    .line 144
    if-eqz v3, :cond_5

    .line 145
    .line 146
    if-nez v4, :cond_6

    .line 147
    .line 148
    :cond_5
    sget-object v6, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 149
    .line 150
    iget-object v7, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 151
    .line 152
    invoke-virtual {v6, v7}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    check-cast v6, Lcom/android/quickstep/SystemUiProxy;

    .line 157
    .line 158
    invoke-virtual {v6, v2, v2}, Lcom/android/quickstep/SystemUiProxy;->notifyTaskbarStatus(ZZ)V

    .line 159
    .line 160
    .line 161
    if-eqz v5, :cond_f

    .line 162
    .line 163
    if-nez v4, :cond_6

    .line 164
    .line 165
    goto/16 :goto_a

    .line 166
    .line 167
    :cond_6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    invoke-static {}, Lf1/a;->d()Z

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    if-nez v5, :cond_8

    .line 176
    .line 177
    if-nez v4, :cond_7

    .line 178
    .line 179
    goto :goto_5

    .line 180
    :cond_7
    const-string v5, "recreateTaskbarForDisplay: updating taskbar device profile"

    .line 181
    .line 182
    invoke-virtual {p0, v5, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v4, v0}, Lcom/android/launcher3/taskbar/I1;->B2(Lcom/android/launcher3/h0;)V

    .line 186
    .line 187
    .line 188
    goto :goto_6

    .line 189
    :cond_8
    :goto_5
    const-string v4, "recreateTaskbarForDisplay: creating taskbar"

    .line 190
    .line 191
    invoke-virtual {p0, v4, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 192
    .line 193
    .line 194
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->J(Lcom/android/launcher3/h0;I)Lcom/android/launcher3/taskbar/I1;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    if-nez v4, :cond_9

    .line 199
    .line 200
    const-string p2, "recreateTaskbarForDisplay: new taskbar instance is null!"

    .line 201
    .line 202
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    .line 204
    .line 205
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_9
    :goto_6
    :try_start_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 210
    .line 211
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    iput-boolean v5, v0, Lcom/android/launcher3/taskbar/J3;->u:Z

    .line 216
    .line 217
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 218
    .line 219
    iget-boolean v5, v0, Lcom/android/launcher3/taskbar/J3;->n:Z

    .line 220
    .line 221
    if-eqz v5, :cond_a

    .line 222
    .line 223
    if-eqz v3, :cond_a

    .line 224
    .line 225
    goto :goto_7

    .line 226
    :cond_a
    move v1, v2

    .line 227
    :goto_7
    iput-boolean v1, v0, Lcom/android/launcher3/taskbar/J3;->n:Z

    .line 228
    .line 229
    invoke-virtual {v4, v0, p2}, Lcom/android/launcher3/taskbar/I1;->N0(Lcom/android/launcher3/taskbar/J3;I)V

    .line 230
    .line 231
    .line 232
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 233
    .line 234
    .line 235
    move-result p2

    .line 236
    if-nez p2, :cond_b

    .line 237
    .line 238
    sget-object p2, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 239
    .line 240
    invoke-virtual {p2}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 241
    .line 242
    .line 243
    move-result p2

    .line 244
    if-eqz p2, :cond_b

    .line 245
    .line 246
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->L(I)Lcom/android/launcher3/taskbar/o4;

    .line 247
    .line 248
    .line 249
    move-result-object p2

    .line 250
    invoke-virtual {v4, p2}, Lcom/android/launcher3/taskbar/I1;->n2(Lcom/android/launcher3/taskbar/o4;)V

    .line 251
    .line 252
    .line 253
    goto :goto_8

    .line 254
    :cond_b
    iget-object p2, p0, Lcom/android/launcher3/taskbar/g3;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 255
    .line 256
    if-eqz p2, :cond_c

    .line 257
    .line 258
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->M(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/taskbar/o4;

    .line 259
    .line 260
    .line 261
    move-result-object p2

    .line 262
    invoke-virtual {v4, p2}, Lcom/android/launcher3/taskbar/I1;->n2(Lcom/android/launcher3/taskbar/o4;)V

    .line 263
    .line 264
    .line 265
    :cond_c
    :goto_8
    invoke-static {}, Lf1/a;->d()Z

    .line 266
    .line 267
    .line 268
    move-result p2

    .line 269
    if-eqz p2, :cond_e

    .line 270
    .line 271
    const-string p2, "recreateTaskbarForDisplay: adding rootView"

    .line 272
    .line 273
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 274
    .line 275
    .line 276
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->A(I)V

    .line 277
    .line 278
    .line 279
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->i0(I)Landroid/widget/FrameLayout;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    if-eqz p2, :cond_d

    .line 284
    .line 285
    const-string v0, "recreateTaskbarForDisplay: adding root layout"

    .line 286
    .line 287
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-virtual {p2, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->O1()V

    .line 301
    .line 302
    .line 303
    goto :goto_9

    .line 304
    :cond_d
    const-string p2, "recreateTaskbarForDisplay: taskbarRootLayout is null!"

    .line 305
    .line 306
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 307
    .line 308
    .line 309
    :cond_e
    :goto_9
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_f
    :goto_a
    :try_start_2
    const-string p2, "recreateTaskbarForDisplay: exiting bc (!isTaskbarEnabled || !displayExists)"

    .line 314
    .line 315
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 316
    .line 317
    .line 318
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :catchall_0
    move-exception p0

    .line 323
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 324
    .line 325
    .line 326
    throw p0
.end method

.method private F(I)V
    .locals 2

    .line 1
    const-string v0, "createAndRegisterComponentCallbacks"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/taskbar/g3$d;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/taskbar/g3$d;-><init>(Lcom/android/launcher3/taskbar/g3;I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    sget-object v1, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->o:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->g:Landroid/content/ComponentCallbacks;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private F0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->H:Lcom/android/launcher3/X3$b;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "unregistering activity lifecycle callbacks"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->F:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/v;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/g3;->k0(Lcom/android/launcher3/statemanager/h;)LC2/i;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->G:LC2/i$a;

    .line 32
    .line 33
    invoke-interface {v0, p0}, LF2/d;->removeCallback(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private G(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/g3;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    :goto_0
    return-void

    .line 22
    :cond_2
    invoke-virtual {v0, v1}, Lcom/android/launcher3/F1;->k0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->p:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private G0(I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->o:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/content/ComponentCallbacks;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->o:Landroid/util/SparseArray;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->g:Landroid/content/ComponentCallbacks;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private H0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->p:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private I(I)V
    .locals 13

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    move v2, p1

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    new-instance v1, Lcom/android/launcher3/taskbar/l3;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/android/launcher3/taskbar/g3;->c:Lcom/android/launcher3/taskbar/l3$a;

    .line 20
    .line 21
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    move-object v4, v0

    .line 30
    check-cast v4, Lcom/android/quickstep/SystemUiProxy;

    .line 31
    .line 32
    new-instance v5, Landroid/os/Handler;

    .line 33
    .line 34
    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v6, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 40
    .line 41
    invoke-direct {v6, v0}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    move v2, p1

    .line 45
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/taskbar/l3;-><init>(ILcom/android/launcher3/taskbar/l3$a;Lcom/android/quickstep/SystemUiProxy;Landroid/os/Handler;Lcom/android/quickstep/util/ContextualSearchInvoker;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->n:Landroid/util/SparseArray;

    .line 49
    .line 50
    invoke-virtual {p0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :goto_0
    new-instance v7, Lcom/android/launcher3/taskbar/l3;

    .line 55
    .line 56
    iget-object v9, p0, Lcom/android/launcher3/taskbar/g3;->c:Lcom/android/launcher3/taskbar/l3$a;

    .line 57
    .line 58
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    move-object v10, p1

    .line 67
    check-cast v10, Lcom/android/quickstep/SystemUiProxy;

    .line 68
    .line 69
    new-instance v11, Landroid/os/Handler;

    .line 70
    .line 71
    invoke-direct {v11}, Landroid/os/Handler;-><init>()V

    .line 72
    .line 73
    .line 74
    new-instance v12, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 77
    .line 78
    invoke-direct {v12, p1}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    move v8, v2

    .line 82
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/taskbar/l3;-><init>(ILcom/android/launcher3/taskbar/l3$a;Lcom/android/quickstep/SystemUiProxy;Landroid/os/Handler;Lcom/android/quickstep/util/ContextualSearchInvoker;)V

    .line 83
    .line 84
    .line 85
    iput-object v7, p0, Lcom/android/launcher3/taskbar/g3;->f:Lcom/android/launcher3/taskbar/l3;

    .line 86
    .line 87
    return-void
.end method

.method private I0(I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->n:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3;->f:Lcom/android/launcher3/taskbar/l3;

    .line 24
    .line 25
    return-void
.end method

.method private J(Lcom/android/launcher3/h0;I)Lcom/android/launcher3/taskbar/I1;
    .locals 10

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->d0(I)Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p1, "createTaskbarActivityContext: display null"

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    sget-boolean v2, Lf1/a;->g:Z

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 19
    .line 20
    const/16 v3, 0x7e8

    .line 21
    .line 22
    invoke-virtual {v2, v0, v3, v1}, Landroid/content/Context;->createWindowContext(Landroid/view/Display;ILandroid/os/Bundle;)Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :cond_1
    move-object v4, v1

    .line 27
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    const/4 v0, 0x0

    .line 43
    :goto_0
    move v8, v0

    .line 44
    goto :goto_2

    .line 45
    :cond_3
    :goto_1
    const/4 v0, 0x1

    .line 46
    goto :goto_0

    .line 47
    :goto_2
    new-instance v2, Lcom/android/launcher3/taskbar/I1;

    .line 48
    .line 49
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->f0(I)Lcom/android/launcher3/taskbar/l3;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    iget-object v7, p0, Lcom/android/launcher3/taskbar/g3;->i:LF2/i;

    .line 58
    .line 59
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    move-object v9, v0

    .line 68
    check-cast v9, Lcom/android/quickstep/SystemUiProxy;

    .line 69
    .line 70
    move-object v5, p1

    .line 71
    invoke-direct/range {v2 .. v9}, Lcom/android/launcher3/taskbar/I1;-><init>(Landroid/content/Context;Landroid/content/Context;Lcom/android/launcher3/h0;Lcom/android/launcher3/taskbar/l3;LF2/i;ZLcom/android/quickstep/SystemUiProxy;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0, p2, v2}, Lcom/android/launcher3/taskbar/g3;->B(ILcom/android/launcher3/taskbar/I1;)V

    .line 75
    .line 76
    .line 77
    return-object v2
.end method

.method private J0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private K(I)V
    .locals 2

    .line 1
    const-string v0, "createTaskbarRootLayout: "

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lf1/a;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Lcom/android/launcher3/taskbar/g3$e;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/taskbar/g3$e;-><init>(Lcom/android/launcher3/taskbar/g3;Landroid/content/Context;I)V

    .line 20
    .line 21
    .line 22
    const-string v1, "createTaskbarRootLayout: adding to map"

    .line 23
    .line 24
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/g3;->z(ILandroid/widget/FrameLayout;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private K0(I)V
    .locals 2

    .line 1
    const-string v0, "removeTaskbarRootLayoutFromMap:"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->contains(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->m:Landroid/util/SparseBooleanArray;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v1, "removeTaskbarRootLayoutFromMap: finished! mRootLayouts.size="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private L(I)Lcom/android/launcher3/taskbar/o4;
    .locals 1

    .line 1
    const-string v0, "createTaskbarUIControllerForNonDefaultDisplay"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->E:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->M(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/taskbar/o4;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance p0, Lcom/android/launcher3/taskbar/o4;

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/o4;-><init>()V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method private L0(I)V
    .locals 3

    .line 1
    const-string v0, "removeTaskbarRootViewFromWindow"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->i0(I)Landroid/widget/FrameLayout;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lf1/a;->d()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->m0(I)Landroid/view/WindowManager;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->q0(I)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v1, v0}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->m:Landroid/util/SparseBooleanArray;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, p1, v1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->K0(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    const-string v0, "removeTaskbarRootViewFromWindow: WindowManager is null"

    .line 45
    .line 46
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method private M(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/taskbar/o4;
    .locals 1

    .line 1
    const-string v0, "createTaskbarUIControllerForRecentsViewContainer"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 7
    .line 8
    instance-of v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 13
    .line 14
    new-instance p1, Lcom/android/launcher3/taskbar/V;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/V;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 17
    .line 18
    .line 19
    return-object p1

    .line 20
    :cond_0
    instance-of p0, p1, Lcom/android/quickstep/RecentsActivity;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lcom/android/quickstep/RecentsActivity;

    .line 25
    .line 26
    new-instance p0, Lcom/android/launcher3/taskbar/e;

    .line 27
    .line 28
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/e;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 29
    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    instance-of p0, p1, Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 33
    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    check-cast p1, Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 37
    .line 38
    new-instance p0, Lcom/android/launcher3/taskbar/e;

    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/e;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_2
    sget-object p0, Lcom/android/launcher3/taskbar/o4;->i:Lcom/android/launcher3/taskbar/o4;

    .line 45
    .line 46
    return-object p0
.end method

.method private M0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->k:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->contains(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->k:Landroid/util/SparseArray;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private N(I)Landroid/content/Context;
    .locals 6

    .line 1
    const-string v0, "createWindowContext: "

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->d0(I)Landroid/view/Display;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "createWindowContext: display null!"

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_0
    sget-boolean v2, Lf1/a;->g:Z

    .line 20
    .line 21
    const/16 v3, 0x7e3

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    move v2, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/16 v2, 0x7e8

    .line 34
    .line 35
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v5, "createWindowContext: windowType="

    .line 41
    .line 42
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    if-ne v2, v3, :cond_2

    .line 46
    .line 47
    const-string v3, "TYPE_NAVIGATION_BAR"

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const-string v3, "TYPE_NAVIGATION_BAR_PANEL"

    .line 51
    .line 52
    :goto_1
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 63
    .line 64
    invoke-virtual {p0, v0, v2, v1}, Landroid/content/Context;->createWindowContext(Landroid/view/Display;ILandroid/os/Bundle;)Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method private R0(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "com.android.launcher3.growth.BROADCAST_SHOW_NUDGE"

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "Growth Framework"

    .line 21
    .line 22
    const-string p1, "Intent received"

    .line 23
    .line 24
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method private S0(Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-string v0, "destroyTaskbarForDisplay"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "ACTION_SHOW_TASKBAR"

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->t2()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private T()V
    .locals 3

    .line 1
    const-string v0, "destroyAllTaskbars"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v2, "destroyAllTaskbars: call destroyTaskbarForDisplay"

    .line 22
    .line 23
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/g3;->U(I)V

    .line 27
    .line 28
    .line 29
    const-string v2, "destroyAllTaskbars: call removeTaskbarRootViewFromWindow"

    .line 30
    .line 31
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/g3;->L0(I)V

    .line 35
    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method private U(I)V
    .locals 1

    .line 1
    const-string v0, "destroyTaskbarForDisplay"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->Q1()V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->J0(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v0, "destroyTaskbarForDisplay: taskbar is NULL!"

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->c0(I)Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/g3;->p0(Lcom/android/launcher3/h0;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    return-void

    .line 38
    :cond_2
    :goto_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->L0(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private X()Z
    .locals 1

    .line 1
    invoke-static {}, Lt2/c;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/g3;->s:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/g3;->t:Z

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private Z(Ljava/util/StringJoiner;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    move v0, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v2

    .line 18
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 19
    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    const-string p0, "windowContext is null!"

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/g3;->A:Z

    .line 29
    .line 30
    if-eqz v4, :cond_3

    .line 31
    .line 32
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->c0(I)Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    if-eqz p2, :cond_2

    .line 37
    .line 38
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->p3:Z

    .line 39
    .line 40
    if-eqz p2, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_1
    move v2, v1

    .line 45
    :cond_3
    if-ne v0, v2, :cond_4

    .line 46
    .line 47
    new-instance p0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string p2, "mActivity and mWindowContext agree taskbarIsPresent="

    .line 53
    .line 54
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 65
    .line 66
    .line 67
    const-string p0, "TaskbarManager"

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    const-string p2, "mActivity & mWindowContext device profiles have different values, add more logs."

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 80
    .line 81
    .line 82
    const-string p2, "\tmActivity logs:"

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 85
    .line 86
    .line 87
    new-instance p2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v1, "\t\tmActivity="

    .line 93
    .line 94
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 98
    .line 99
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 107
    .line 108
    .line 109
    iget-object p2, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 110
    .line 111
    if-eqz p2, :cond_5

    .line 112
    .line 113
    new-instance p2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v1, "\t\tmActivity.getResources().getConfiguration()="

    .line 119
    .line 120
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 124
    .line 125
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 141
    .line 142
    .line 143
    new-instance p2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v1, "\t\tmActivity.getDeviceProfile().isTaskbarPresent="

    .line 149
    .line 150
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 161
    .line 162
    .line 163
    :cond_5
    const-string p2, "\tWindowContext logs:"

    .line 164
    .line 165
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 166
    .line 167
    .line 168
    new-instance p2, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    const-string v0, "\t\tWindowContext="

    .line 174
    .line 175
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 186
    .line 187
    .line 188
    new-instance p2, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    const-string v0, "\t\tWindowContext.getResources().getConfiguration()="

    .line 194
    .line 195
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-virtual {p1, p2}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 214
    .line 215
    .line 216
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/g3;->A:Z

    .line 217
    .line 218
    if-eqz p0, :cond_6

    .line 219
    .line 220
    new-instance p0, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    const-string p2, "\t\tgetDeviceProfile(mPrimaryWindowContext).isTaskbarPresent="

    .line 226
    .line 227
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-virtual {p1, p0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :cond_6
    const-string p0, "\t\tCouldn\'t get DeviceProfile because !mUserUnlocked"

    .line 242
    .line 243
    invoke-virtual {p1, p0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 244
    .line 245
    .line 246
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/g3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->R0(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->u0(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/g3;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/g3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->S0(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c0(I)Lcom/android/launcher3/h0;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/g3;->A:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    sget-object v1, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->p:Landroid/util/SparseArray;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/android/launcher3/h0;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->t0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d0(I)Landroid/view/Display;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/hardware/display/DisplayManager;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/hardware/display/DisplayManager;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string v0, "cannot get DisplayManager"

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_0
    invoke-virtual {v0, p1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    const-string v0, "Cannot get display!"

    .line 27
    .line 28
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_1
    invoke-virtual {v0, p1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/g3;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->r0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->g0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "android.software.freeform_window_management"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/g3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->s0(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f0(I)Lcom/android/launcher3/taskbar/l3;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->n:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/android/launcher3/taskbar/l3;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->f:Lcom/android/launcher3/taskbar/l3;

    .line 26
    .line 27
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/statemanager/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/X3$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->H:Lcom/android/launcher3/X3$b;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/g3;)Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method private i0(I)Landroid/widget/FrameLayout;
    .locals 1

    .line 1
    const-string v0, "getTaskbarRootLayoutForDisplay:"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/widget/FrameLayout;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const-string v0, "getTaskbarRootLayoutForDisplay: rootLayout is null!"

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/taskbar/J3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/taskbar/g3;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/g3;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method private k0(Lcom/android/launcher3/statemanager/h;)LC2/i;
    .locals 1

    .line 1
    const-string v0, "getUnfoldTransitionProgressProviderForActivity"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->i0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    instance-of p0, p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->C5()LC2/i;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_1
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->getUnfoldTransitionProvider()Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/taskbar/g3$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 2
    .line 3
    return-object p0
.end method

.method private l0(I)Landroid/content/Context;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->k:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Landroid/content/Context;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 26
    .line 27
    return-object p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/taskbar/g3;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method private m0(I)Landroid/view/WindowManager;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    const-string v0, "cannot get externalDisplayContext"

    .line 23
    .line 24
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0

    .line 29
    :cond_1
    const-class p0, Landroid/view/WindowManager;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroid/view/WindowManager;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    :goto_0
    const-string v0, "cannot get mPrimaryWindowManager"

    .line 39
    .line 40
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->e:Landroid/view/WindowManager;

    .line 44
    .line 45
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/taskbar/g3;)LF2/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->i:LF2/i;

    .line 2
    .line 3
    return-object p0
.end method

.method private n0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/g3;->t:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->X()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/taskbar/g3$f;

    .line 19
    .line 20
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/taskbar/g3$f;-><init>(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/taskbar/h3;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 24
    .line 25
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/g3$f;->a()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method static bridge synthetic o(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/statemanager/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 2
    .line 3
    return-void
.end method

.method private o0(I)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    return-void
.end method

.method private p0(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    sget-boolean p0, Lf1/a;->g:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p1, Lcom/android/launcher3/h0;->p3:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method static bridge synthetic q(Lcom/android/launcher3/taskbar/g3;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/g3;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method private q0(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->m:Landroid/util/SparseBooleanArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method static bridge synthetic r(Lcom/android/launcher3/taskbar/g3;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->U(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic r0(Z)V
    .locals 0

    .line 1
    const-string p1, "Settings changed! Recreating Taskbar!"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method static bridge synthetic s(Lcom/android/launcher3/taskbar/g3;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic s0(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic t(Lcom/android/launcher3/taskbar/g3;I)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->c0(I)Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic t0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 4
    .line 5
    new-instance v2, Landroid/content/Intent;

    .line 6
    .line 7
    const-string v3, "ACTION_SHOW_TASKBAR"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v4, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual {v2, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/high16 v4, 0xc000000

    .line 23
    .line 24
    const/16 v5, 0x1f3

    .line 25
    .line 26
    invoke-static {v1, v5, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/android/launcher3/taskbar/J3;->s:Landroid/app/PendingIntent;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->B:Lcom/android/launcher3/util/x2;

    .line 33
    .line 34
    const/4 v0, 0x4

    .line 35
    filled-new-array {v3}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/util/x2;->m(I[Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method static bridge synthetic u(Lcom/android/launcher3/taskbar/g3;I)Landroid/content/Context;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic u0(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    const-string p1, "mActivity onDeviceProfileChanged"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/g3;->P(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method static bridge synthetic v(Lcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->n0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic w(Lcom/android/launcher3/taskbar/g3;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic x(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->p0(Lcom/android/launcher3/h0;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic y(Lcom/android/launcher3/taskbar/g3;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/g3;->D0(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private z(ILandroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    const-string v0, "addTaskbarRootLayoutToMap: "

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->contains(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v0, "addTaskbarRootLayoutToMap: finished! mRootLayouts.size()="

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->l:Landroid/util/SparseArray;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public A0(JI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput-wide p1, v0, Lcom/android/launcher3/taskbar/J3;->b:J

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/I1;->C2(JZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public B0(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/taskbar/J3;->i:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->c2(IZ)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public C0()V
    .locals 3

    .line 1
    const-string v0, "onUserUnlocked"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/g3;->A:Z

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->v:Lcom/android/launcher3/taskbar/g3$g;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/Z;->o(Lcom/android/launcher3/util/Z$b;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "onUserUnlocked: recreating all taskbars!"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-ge v0, v1, :cond_0

    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const-string v2, "onUserUnlocked: addTaskbarRootViewToWindow()"

    .line 48
    .line 49
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/g3;->A(I)V

    .line 53
    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method

.method public D(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->a0(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public E(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->f0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public declared-synchronized E0()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "recreateTaskbars"

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-string v0, "recreateTaskbars: create primary taskbar"

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/g3;->D0(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    move v0, v1

    .line 37
    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-ge v0, v2, :cond_1

    .line 44
    .line 45
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 46
    .line 47
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const-string v3, "recreateTaskbars: create external taskbar"

    .line 52
    .line 53
    invoke-virtual {p0, v3, v2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, v2, v1}, Lcom/android/launcher3/taskbar/g3;->D0(II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    .line 59
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    monitor-exit p0

    .line 63
    return-void

    .line 64
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    throw v0
.end method

.method public H(I)Lcom/android/launcher3/anim/q;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->i0(I)Lcom/android/launcher3/anim/q;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public N0(Lcom/android/launcher3/statemanager/h;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setActivity: mActivity="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 24
    .line 25
    if-ne v0, p1, :cond_0

    .line 26
    .line 27
    const-string p1, "setActivity: No need to set activity!"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->F0()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->H:Lcom/android/launcher3/X3$b;

    .line 39
    .line 40
    invoke-interface {p1, v0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "setActivity: registering activity lifecycle callbacks."

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 49
    .line 50
    const/4 v1, 0x3

    .line 51
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->F:Ljava/lang/Runnable;

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/v;->addEventCallback(ILjava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->k0(Lcom/android/launcher3/statemanager/h;)LC2/i;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->G:LC2/i$a;

    .line 63
    .line 64
    invoke-interface {v0, v1}, LF2/d;->addCallback(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->i:LF2/i;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, LF2/i;->k(LC2/i;)V

    .line 70
    .line 71
    .line 72
    instance-of v0, p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->O0(Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public O(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/g3;->R(Ljava/lang/String;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public O0(Lcom/android/quickstep/views/RecentsViewContainer;)V
    .locals 2

    .line 1
    const-string v0, "setRecentsViewContainer"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 7
    .line 8
    if-ne v0, p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->F:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    :cond_1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 29
    .line 30
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/g3;->M(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/taskbar/o4;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/I1;->n2(Lcom/android/launcher3/taskbar/o4;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    :goto_0
    return-void
.end method

.method public P(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/launcher3/taskbar/g3;->R(Ljava/lang/String;IZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput-boolean p1, v0, Lcom/android/launcher3/taskbar/J3;->l:Z

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->D:Lcom/android/quickstep/AllAppsActionManager;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/android/quickstep/AllAppsActionManager;->setSetupUiVisible(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->h2(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public Q(Ljava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v1, "\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p1, " displayId="

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " isDefaultDisplay="

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 41
    .line 42
    .line 43
    const-string p0, "TaskbarManager"

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public Q0(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput-boolean p2, v0, Lcom/android/launcher3/taskbar/J3;->m:Z

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/I1;->o2(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public R(Ljava/lang/String;IZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v1, "\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p1, " displayId="

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " isDefaultDisplay="

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Ljava/util/StringJoiner;->add(Ljava/lang/CharSequence;)Ljava/util/StringJoiner;

    .line 41
    .line 42
    .line 43
    if-eqz p3, :cond_0

    .line 44
    .line 45
    invoke-direct {p0, v0, p2}, Lcom/android/launcher3/taskbar/g3;->Z(Ljava/util/StringJoiner;I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    const-string p0, "TaskbarManager"

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public S()V
    .locals 5

    .line 1
    const-string v0, "TaskbarManager#destroy()"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->r:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 8
    .line 9
    const-string v1, "destroy: removing activity callbacks"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, LP1/k;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->z:LP1/k$d;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, LP1/k;->X(LP1/k$d;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->F0()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->B:Lcom/android/launcher3/util/x2;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/util/x2;->v()V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->C:Lcom/android/launcher3/util/x2;

    .line 38
    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/android/launcher3/util/x2;->v()V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/g3;->A:Z

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    sget-object v1, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/android/launcher3/util/Z;

    .line 57
    .line 58
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->v:Lcom/android/launcher3/taskbar/g3$g;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/Z;->P(Lcom/android/launcher3/util/Z$b;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    sget-object v1, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/android/launcher3/util/p2;

    .line 72
    .line 73
    sget-object v3, Lcom/android/launcher3/taskbar/g3;->I:Landroid/net/Uri;

    .line 74
    .line 75
    iget-object v4, p0, Lcom/android/launcher3/taskbar/g3;->x:Lcom/android/launcher3/util/p2$a;

    .line 76
    .line 77
    invoke-virtual {v2, v3, v4}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 78
    .line 79
    .line 80
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/android/launcher3/util/p2;

    .line 87
    .line 88
    sget-object v2, Lcom/android/launcher3/taskbar/g3;->J:Landroid/net/Uri;

    .line 89
    .line 90
    iget-object v3, p0, Lcom/android/launcher3/taskbar/g3;->x:Lcom/android/launcher3/util/p2$a;

    .line 91
    .line 92
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lcom/android/quickstep/SystemDecorationChangeObserver;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 106
    .line 107
    invoke-virtual {v1, p0}, Lcom/android/quickstep/SystemDecorationChangeObserver;->unregisterDisplayDecorationListener(Lcom/android/quickstep/SystemDecorationChangeObserver$DisplayDecorationListener;)V

    .line 108
    .line 109
    .line 110
    const-string v1, "destroy: unregistering component callbacks"

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/g3;->G0(I)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->h:Lcom/android/launcher3/util/x2;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/android/launcher3/util/x2;->v()V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->y:Lcom/android/launcher3/taskbar/g3$f;

    .line 128
    .line 129
    if-eqz v1, :cond_2

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/g3$f;->a()V

    .line 132
    .line 133
    .line 134
    :cond_2
    const-string v1, "destroy: destroying all taskbars!"

    .line 135
    .line 136
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->T()V

    .line 140
    .line 141
    .line 142
    const-string v1, "destroy: finished!"

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/g3;->O(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iput-object v0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 148
    .line 149
    return-void
.end method

.method public T0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->q:Lcom/android/launcher3/statemanager/h;

    .line 13
    .line 14
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast p0, Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Lcom/android/launcher3/C2;->N4(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->r0()Lcom/android/launcher3/taskbar/R1;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/o4;->R(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public U0(IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/I1;->x2(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public V(IIIZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/taskbar/J3;->c:I

    .line 4
    .line 5
    iput p2, v0, Lcom/android/launcher3/taskbar/J3;->d:I

    .line 6
    .line 7
    iput p3, v0, Lcom/android/launcher3/taskbar/J3;->e:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/I1;->j0(IIIZ)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public V0(IIZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/taskbar/I1;->y2(IZ)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public W(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarManager:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-ge v0, v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 37
    .line 38
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/android/launcher3/taskbar/I1;

    .line 43
    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v4, "\tTaskbar at display "

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, ":"

    .line 61
    .line 62
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    if-nez v2, :cond_0

    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, "\t\tTaskbarActivityContext: null"

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v3, "\t\t"

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v2, v1, p2}, Lcom/android/launcher3/taskbar/I1;->k0(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 113
    .line 114
    .line 115
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    return-void
.end method

.method public Y(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->o0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public a0()Lcom/android/launcher3/taskbar/I1;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public g0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->d:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(I)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    return-object p0
.end method

.method public j0(I)Lcom/android/launcher3/taskbar/o4;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->j:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->contains(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->r0()Lcom/android/launcher3/taskbar/R1;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 20
    .line 21
    return-object p0
.end method

.method public onDisplayAddSystemDecorations(I)V
    .locals 4

    .line 1
    const-string v0, "onDisplayAddSystemDecorations: "

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->d0(I)Landroid/view/Display;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "onDisplayAddSystemDecorations: can\'t find display!"

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_7

    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :cond_1
    const-string v0, "onDisplayAddSystemDecorations: creating new windowContext!"

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->N(I)Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_6

    .line 44
    .line 45
    const-string v1, "onDisplayAddSystemDecorations: add new windowContext to map!"

    .line 46
    .line 47
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/g3;->C(ILandroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->m0(I)Landroid/view/WindowManager;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-interface {v0, p1}, Landroid/view/WindowManager;->shouldShowSystemDecors(I)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const-string v0, "onDisplayAddSystemDecorations: creating RootLayout!"

    .line 68
    .line 69
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->G(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->K(I)V

    .line 79
    .line 80
    .line 81
    const-string v0, "onDisplayAddSystemDecorations: creating NavButtonController!"

    .line 82
    .line 83
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->I(I)V

    .line 87
    .line 88
    .line 89
    const-string v0, "onDisplayAddSystemDecorations: createAndRegisterComponentCallbacks!"

    .line 90
    .line 91
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->F(I)V

    .line 95
    .line 96
    .line 97
    const-string v0, "onDisplayAddSystemDecorations: recreateTaskbarForDisplay!"

    .line 98
    .line 99
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 100
    .line 101
    .line 102
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/taskbar/g3;->D0(II)V

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_3
    :goto_0
    if-nez v0, :cond_4

    .line 107
    .line 108
    const-string v2, "WindowManager is null!"

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    const-string v2, "WindowManager exists"

    .line 112
    .line 113
    :goto_1
    if-eqz v0, :cond_5

    .line 114
    .line 115
    invoke-interface {v0, p1}, Landroid/view/WindowManager;->shouldShowSystemDecors(I)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    const/4 v1, 0x1

    .line 122
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v3, "onDisplayAddSystemDecorations:\n\t"

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v2, "\n\tshowSystemDecors="

    .line 136
    .line 137
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_6
    const-string v0, "onDisplayAddSystemDecorations: newWindowContext is NULL!"

    .line 152
    .line 153
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 154
    .line 155
    .line 156
    :goto_2
    const-string v0, "onDisplayAddSystemDecorations: finished!"

    .line 157
    .line 158
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_7
    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string v2, "onDisplayAddSystemDecorations: not an external display! | ENABLE_TASKBAR_CONNECTED_DISPLAYS="

    .line 168
    .line 169
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string v0, " isDefaultDisplay="

    .line 180
    .line 181
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public onDisplayRemoveSystemDecorations(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->onDisplayRemoved(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDisplayRemoved(I)V
    .locals 3

    .line 1
    const-string v0, "onDisplayRemoved: "

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->l0(I)Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "onDisplayRemoved: removing NavButtonController!"

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->I0(I)V

    .line 33
    .line 34
    .line 35
    const-string v0, "onDisplayRemoved: removeAndUnregisterComponentCallbacks!"

    .line 36
    .line 37
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->G0(I)V

    .line 41
    .line 42
    .line 43
    const-string v0, "onDisplayRemoved: removing DeviceProfile from map!"

    .line 44
    .line 45
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->H0(I)V

    .line 49
    .line 50
    .line 51
    const-string v0, "onDisplayRemoved: destroying Taskbar!"

    .line 52
    .line 53
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->U(I)V

    .line 57
    .line 58
    .line 59
    const-string v0, "onDisplayRemoved: removing WindowContext from map!"

    .line 60
    .line 61
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->M0(I)V

    .line 65
    .line 66
    .line 67
    const-string v0, "onDisplayRemoved: finished!"

    .line 68
    .line 69
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v2, "onDisplayRemoved: not an external display! | ENABLE_TASKBAR_CONNECTED_DISPLAYS="

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v0, " isDefaultDisplay="

    .line 95
    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3;->o0(I)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public v0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3;->f:Lcom/android/launcher3/taskbar/l3;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/l3;->u(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public w0(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/taskbar/J3;->h:F

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->T1(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public x0(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/taskbar/J3;->j:I

    .line 4
    .line 5
    iput-boolean p2, v0, Lcom/android/launcher3/taskbar/J3;->k:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->U1(IZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public y0(IZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/g3;->b0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->X1(IZ)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public z0(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3;->u:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    iput p1, v0, Lcom/android/launcher3/taskbar/J3;->f:I

    .line 4
    .line 5
    iput p2, v0, Lcom/android/launcher3/taskbar/J3;->g:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/I1;->Z1(II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
