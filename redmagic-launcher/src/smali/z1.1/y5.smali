.class public final Lz1/y5;
.super Ljava/lang/Object;
.source "WorkspaceItemProcessor.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/y5$a;
    }
.end annotation


# static fields
.field public static final z:Lz1/y5$a;


# instance fields
.field private final a:Lz1/y1;

.field private final b:Lz1/B1;

.field private final c:LD1/t;

.field private final d:Lz1/L4;

.field private final e:Landroid/content/pm/LauncherApps;

.field private final f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/L1;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Landroid/content/Context;

.field private final i:Lcom/android/launcher3/F1;

.field private final j:Ls1/P;

.field private final k:Z

.field private final l:Lz1/y0;

.field private final m:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final n:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/L1;",
            "Landroid/content/pm/PackageInstaller$SessionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final o:Z

.field private final p:Lcom/android/launcher3/widget/V0;

.field private final q:Lcom/android/launcher3/util/J1;

.field private final r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "Lcom/android/launcher3/model/data/I;",
            ">;>;"
        }
    .end annotation
.end field

.field private final s:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ls1/h;",
            ">;"
        }
    .end annotation
.end field

.field private final u:Lcom/android/launcher3/util/L1;

.field private final v:Z

.field private w:Lz1/c2;

.field private x:Landroid/os/UserManager;

.field private final y:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lz1/y5$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lz1/y5$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lz1/y5;->z:Lz1/y5$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lz1/y1;Lz1/B1;LD1/t;Lz1/L4;Landroid/content/pm/LauncherApps;Ljava/util/Set;Ljava/util/Map;Landroid/content/Context;Lcom/android/launcher3/F1;Ls1/P;ZLz1/y0;Ljava/util/Map;Ljava/util/HashMap;ZLcom/android/launcher3/widget/V0;Lcom/android/launcher3/util/J1;Ljava/util/List;Landroid/util/LongSparseArray;Ljava/util/List;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/y1;",
            "Lz1/B1;",
            "LD1/t;",
            "Lz1/L4;",
            "Landroid/content/pm/LauncherApps;",
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/L1;",
            ">;",
            "Ljava/util/Map<",
            "LN1/e;",
            "Landroid/content/pm/ShortcutInfo;",
            ">;",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/F1;",
            "Ls1/P;",
            "Z",
            "Lz1/y0;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/E;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;",
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/L1;",
            "Landroid/content/pm/PackageInstaller$SessionInfo;",
            ">;Z",
            "Lcom/android/launcher3/widget/V0;",
            "Lcom/android/launcher3/util/J1;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/q<",
            "Lcom/android/launcher3/model/data/I;",
            ">;>;",
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/List<",
            "Ls1/h;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move-object/from16 v10, p12

    move-object/from16 v11, p13

    move-object/from16 v12, p14

    move-object/from16 v13, p16

    move-object/from16 v14, p17

    move-object/from16 v15, p18

    const-string v0, "c"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "userCache"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "userManagerState"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "launcherApps"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pendingPackages"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "shortcutKeyToPinnedShortcuts"

    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "idp"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "iconCache"

    invoke-static {v9, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bgDataModel"

    invoke-static {v10, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "widgetProvidersMap"

    invoke-static {v11, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "installingPkgs"

    invoke-static {v12, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "widgetInflater"

    invoke-static {v13, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pmHelper"

    invoke-static {v14, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "iconRequestInfos"

    invoke-static {v15, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "unlockedUsers"

    move-object/from16 v15, p19

    invoke-static {v15, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "allDeepShortcuts"

    move-object/from16 v15, p20

    invoke-static {v15, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v0, p0

    .line 2
    iput-object v1, v0, Lz1/y5;->a:Lz1/y1;

    move-object/from16 v1, p2

    .line 3
    iput-object v1, v0, Lz1/y5;->b:Lz1/B1;

    .line 4
    iput-object v2, v0, Lz1/y5;->c:LD1/t;

    .line 5
    iput-object v3, v0, Lz1/y5;->d:Lz1/L4;

    .line 6
    iput-object v4, v0, Lz1/y5;->e:Landroid/content/pm/LauncherApps;

    .line 7
    iput-object v5, v0, Lz1/y5;->f:Ljava/util/Set;

    .line 8
    iput-object v6, v0, Lz1/y5;->g:Ljava/util/Map;

    .line 9
    iput-object v7, v0, Lz1/y5;->h:Landroid/content/Context;

    .line 10
    iput-object v8, v0, Lz1/y5;->i:Lcom/android/launcher3/F1;

    .line 11
    iput-object v9, v0, Lz1/y5;->j:Ls1/P;

    move/from16 v1, p11

    .line 12
    iput-boolean v1, v0, Lz1/y5;->k:Z

    .line 13
    iput-object v10, v0, Lz1/y5;->l:Lz1/y0;

    .line 14
    iput-object v11, v0, Lz1/y5;->m:Ljava/util/Map;

    .line 15
    iput-object v12, v0, Lz1/y5;->n:Ljava/util/HashMap;

    move/from16 v1, p15

    .line 16
    iput-boolean v1, v0, Lz1/y5;->o:Z

    .line 17
    iput-object v13, v0, Lz1/y5;->p:Lcom/android/launcher3/widget/V0;

    .line 18
    iput-object v14, v0, Lz1/y5;->q:Lcom/android/launcher3/util/J1;

    move-object/from16 v1, p18

    .line 19
    iput-object v1, v0, Lz1/y5;->r:Ljava/util/List;

    move-object/from16 v1, p19

    .line 20
    iput-object v1, v0, Lz1/y5;->s:Landroid/util/LongSparseArray;

    .line 21
    iput-object v15, v0, Lz1/y5;->t:Ljava/util/List;

    .line 22
    new-instance v1, Lcom/android/launcher3/util/L1;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    iput-object v1, v0, Lz1/y5;->u:Lcom/android/launcher3/util/L1;

    const/4 v1, 0x2

    .line 23
    iput v1, v0, Lz1/y5;->y:I

    return-void
.end method

.method private final a(Lz1/y1;Lcom/android/launcher3/model/data/p;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lz1/y1;->C()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget v0, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 6
    .line 7
    iput v0, p2, Lcom/android/launcher3/model/data/p;->k:I

    .line 8
    .line 9
    iget v0, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 10
    .line 11
    iput v0, p2, Lcom/android/launcher3/model/data/p;->l:I

    .line 12
    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_a

    .line 18
    .line 19
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, LD4/f;

    .line 23
    .line 24
    const-string v1, ";"

    .line 25
    .line 26
    invoke-direct {v0, v1}, LD4/f;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, p1, v1}, LD4/f;->a(Ljava/lang/CharSequence;I)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v2, 0x1

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-interface {p1, v0}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    :goto_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Ljava/lang/String;

    .line 60
    .line 61
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-nez v3, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    invoke-interface {v0}, Ljava/util/ListIterator;->nextIndex()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr v0, v2

    .line 73
    invoke-static {p1, v0}, Li4/m;->z0(Ljava/lang/Iterable;I)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    goto :goto_1

    .line 78
    :cond_1
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    :goto_1
    new-array v0, v1, [Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, [Ljava/lang/String;

    .line 89
    .line 90
    array-length v0, p1

    .line 91
    move v3, v1

    .line 92
    :goto_2
    if-ge v3, v0, :cond_8

    .line 93
    .line 94
    aget-object v4, p1, v3

    .line 95
    .line 96
    new-instance v5, LD4/f;

    .line 97
    .line 98
    const-string v6, ":"

    .line 99
    .line 100
    invoke-direct {v5, v6}, LD4/f;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5, v4, v1}, LD4/f;->a(Ljava/lang/CharSequence;I)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    if-nez v5, :cond_3

    .line 112
    .line 113
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    invoke-interface {v4, v5}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    :goto_3
    invoke-interface {v5}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-eqz v6, :cond_3

    .line 126
    .line 127
    invoke-interface {v5}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    check-cast v6, Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    if-nez v6, :cond_2

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_2
    invoke-interface {v5}, Ljava/util/ListIterator;->nextIndex()I

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    add-int/2addr v5, v2

    .line 145
    invoke-static {v4, v5}, Li4/m;->z0(Ljava/lang/Iterable;I)Ljava/util/List;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    goto :goto_4

    .line 150
    :cond_3
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    :goto_4
    new-array v5, v1, [Ljava/lang/String;

    .line 155
    .line 156
    invoke-interface {v4, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    check-cast v4, [Ljava/lang/String;

    .line 161
    .line 162
    array-length v5, v4

    .line 163
    iget v6, p0, Lz1/y5;->y:I

    .line 164
    .line 165
    if-ne v5, v6, :cond_7

    .line 166
    .line 167
    :try_start_0
    aget-object v5, v4, v1

    .line 168
    .line 169
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    sparse-switch v6, :sswitch_data_0

    .line 174
    .line 175
    .line 176
    goto :goto_5

    .line 177
    :sswitch_0
    const-string v6, "backgroundColor"

    .line 178
    .line 179
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-nez v5, :cond_4

    .line 184
    .line 185
    goto :goto_5

    .line 186
    :cond_4
    aget-object v4, v4, v2

    .line 187
    .line 188
    const/16 v5, 0x10

    .line 189
    .line 190
    invoke-static {v4, v5}, Ljava/lang/Integer;->parseUnsignedInt(Ljava/lang/String;I)I

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    iput v4, p2, Lcom/android/launcher3/model/data/p;->o:I

    .line 195
    .line 196
    invoke-virtual {p2, v4}, Lcom/android/launcher3/model/data/p;->O(I)V

    .line 197
    .line 198
    .line 199
    goto :goto_7

    .line 200
    :catch_0
    move-exception v4

    .line 201
    goto :goto_6

    .line 202
    :sswitch_1
    const-string v6, "innerGridY"

    .line 203
    .line 204
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    if-nez v5, :cond_5

    .line 209
    .line 210
    goto :goto_5

    .line 211
    :cond_5
    aget-object v4, v4, v2

    .line 212
    .line 213
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    iput v4, p2, Lcom/android/launcher3/model/data/p;->l:I

    .line 218
    .line 219
    goto :goto_7

    .line 220
    :sswitch_2
    const-string v6, "innerGridX"

    .line 221
    .line 222
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v5

    .line 226
    if-nez v5, :cond_6

    .line 227
    .line 228
    :goto_5
    const-string v5, "WorkspaceItemProcessor"

    .line 229
    .line 230
    aget-object v4, v4, v1

    .line 231
    .line 232
    new-instance v6, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v7, "getFolderExtraInfo: Unexpected value: "

    .line 238
    .line 239
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v4

    .line 249
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    .line 251
    .line 252
    goto :goto_7

    .line 253
    :cond_6
    aget-object v4, v4, v2

    .line 254
    .line 255
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 256
    .line 257
    .line 258
    move-result v4

    .line 259
    iput v4, p2, Lcom/android/launcher3/model/data/p;->k:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    .line 261
    goto :goto_7

    .line 262
    :goto_6
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 263
    .line 264
    .line 265
    :cond_7
    :goto_7
    add-int/lit8 v3, v3, 0x1

    .line 266
    .line 267
    goto/16 :goto_2

    .line 268
    .line 269
    :cond_8
    iget p0, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 270
    .line 271
    if-ne p0, v2, :cond_a

    .line 272
    .line 273
    iget p0, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 274
    .line 275
    if-ne p0, v2, :cond_a

    .line 276
    .line 277
    iget p0, p2, Lcom/android/launcher3/model/data/p;->k:I

    .line 278
    .line 279
    if-le p0, v2, :cond_9

    .line 280
    .line 281
    iput v2, p2, Lcom/android/launcher3/model/data/p;->k:I

    .line 282
    .line 283
    :cond_9
    iget p0, p2, Lcom/android/launcher3/model/data/p;->l:I

    .line 284
    .line 285
    if-le p0, v2, :cond_a

    .line 286
    .line 287
    iput v2, p2, Lcom/android/launcher3/model/data/p;->l:I

    .line 288
    .line 289
    :cond_a
    iget p0, p2, Lcom/android/launcher3/model/data/p;->k:I

    .line 290
    .line 291
    iget p1, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 292
    .line 293
    if-ne p0, p1, :cond_b

    .line 294
    .line 295
    iget p0, p2, Lcom/android/launcher3/model/data/p;->l:I

    .line 296
    .line 297
    iget p1, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 298
    .line 299
    if-ne p0, p1, :cond_b

    .line 300
    .line 301
    const/4 p0, 0x2

    .line 302
    goto :goto_8

    .line 303
    :cond_b
    const/4 p0, 0x3

    .line 304
    :goto_8
    iput p0, p2, Lcom/android/launcher3/model/data/p;->n:I

    .line 305
    .line 306
    iput p0, p2, Lcom/android/launcher3/model/data/p;->m:I

    .line 307
    .line 308
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 309
    .line 310
    .line 311
    move-result p0

    .line 312
    if-eqz p0, :cond_c

    .line 313
    .line 314
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    invoke-static {p0, p2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->E1(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/p;)V

    .line 319
    .line 320
    .line 321
    :cond_c
    return-void

    .line 322
    nop

    .line 323
    :sswitch_data_0
    .sparse-switch
        0x2fc4251c -> :sswitch_2
        0x2fc4251d -> :sswitch_1
        0x4cb7f6d5 -> :sswitch_0
    .end sparse-switch
.end method

.method private final b(Landroid/content/Context;I)I
    .locals 1

    .line 1
    sget-object p0, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/J3$a;->g(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "CloudFolder-"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 p2, -0x1

    .line 25
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method private final c()V
    .locals 19
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    move-object/from16 v1, p0

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v1, v0, Lz1/y1;->M:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "concise item id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "concise_other_item"

    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 3
    :cond_0
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->h0()Landroid/content/Intent;

    move-result-object v2

    if-nez v2, :cond_1

    .line 4
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v1, v0, Lz1/y1;->M:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Null intent from db for item id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "app_no_db_intent"

    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 5
    :cond_1
    iget-object v0, v1, Lz1/y5;->d:Lz1/L4;

    iget-object v3, v1, Lz1/y5;->a:Lz1/y1;

    iget-wide v3, v3, Lz1/y1;->K:J

    invoke-virtual {v0, v3, v4}, Lz1/L4;->c(J)Z

    move-result v0

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    const/16 v0, 0x8

    move v4, v0

    goto :goto_0

    :cond_2
    move v4, v3

    .line 6
    :goto_0
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 7
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    goto :goto_2

    :cond_3
    :goto_1
    move-object v6, v0

    goto :goto_3

    :cond_4
    :goto_2
    invoke-virtual {v2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 8
    :goto_3
    const-string v7, "app_no_target_package"

    if-eqz v6, :cond_44

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_1e

    .line 9
    :cond_5
    new-instance v8, Lcom/android/launcher3/util/k;

    iget-object v0, v1, Lz1/y5;->h:Landroid/content/Context;

    iget-object v9, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v9, v9, Lz1/y1;->L:Landroid/os/UserHandle;

    const-string v10, "user"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v8, v0, v6, v9}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 10
    iget-object v0, v1, Lz1/y5;->e:Landroid/content/pm/LauncherApps;

    iget-object v9, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v9, v9, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v0, v6, v9}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v0

    .line 11
    sget-object v9, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    iget-object v10, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v9, v10}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v9

    iget-object v10, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v9, v5, v10}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    move-result v9

    const/4 v10, 0x1

    if-eqz v9, :cond_6

    move v9, v10

    goto :goto_4

    :cond_6
    move v9, v0

    .line 12
    :goto_4
    const-string v11, ", user="

    const/4 v13, 0x6

    const-string v14, "WorkspaceItemProcessor"

    if-eqz v5, :cond_13

    if-eqz v9, :cond_13

    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v15, v0, Lz1/y1;->O:I

    if-eq v15, v13, :cond_13

    .line 13
    :try_start_0
    iget-object v15, v1, Lz1/y5;->e:Landroid/content/pm/LauncherApps;

    iget-object v0, v0, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v15, v5, v0}, Landroid/content/pm/LauncherApps;->isActivityEnabled(Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    .line 14
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "processAppOrDeepShortcut cn:"

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, " -- "

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v3

    .line 15
    :goto_5
    const-string v12, "intent"

    if-nez v0, :cond_c

    invoke-static {v5}, Lx1/O;->q3(Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-static {v0, v5}, Lcom/android/launcher3/N5;->B(Landroid/content/Context;Landroid/content/ComponentName;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 16
    :cond_7
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    iget-object v15, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v0, v15}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v0

    iget-object v15, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v0, v5, v15}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_8

    goto/16 :goto_9

    .line 17
    :cond_8
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v2, v0, Lz1/y1;->M:I

    iget-object v0, v0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 18
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Activity not enabled for id="

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", component="

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ". Will attempt to find fallback Activity for targetPkg="

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 19
    invoke-static {v14, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    iget-object v0, v1, Lz1/y5;->q:Lcom/android/launcher3/util/J1;

    iget-object v13, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v13, v13, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v0, v6, v13}, Lcom/android/launcher3/util/J1;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    move-result-object v0

    .line 21
    iget-object v13, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v13, :cond_9

    invoke-virtual {v13}, Lz1/c2;->J()Z

    move-result v13

    if-ne v13, v10, :cond_9

    move v13, v10

    goto :goto_6

    :cond_9
    move v13, v3

    :goto_6
    if-eqz v13, :cond_a

    const-string v13, "com.android.contacts"

    invoke-static {v13, v6}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    const/4 v13, 0x0

    goto :goto_7

    :cond_a
    move-object v13, v0

    :goto_7
    if-eqz v13, :cond_b

    .line 22
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iput v3, v0, Lz1/y1;->P:I

    .line 23
    invoke-virtual {v0}, Lz1/y1;->l0()Lcom/android/launcher3/util/G;

    move-result-object v0

    .line 24
    invoke-virtual {v13, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v2

    .line 25
    invoke-virtual {v0, v12, v2}, Lcom/android/launcher3/util/G;->t(Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/G;

    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->b()I

    .line 27
    :try_start_1
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_8

    :catch_1
    move-exception v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_8
    move-object v2, v13

    goto/16 :goto_b

    .line 29
    :cond_b
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 30
    iget v3, v0, Lz1/y1;->M:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No Activities found for id="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", targetPkg="

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ". Unable to create launch Intent."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 31
    const-string v3, "app_no_launch_intent"

    .line 32
    invoke-virtual {v0, v2, v3}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    iget-object v0, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v0, :cond_41

    iget-object v1, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0, v5, v1}, Lz1/c2;->w0(Landroid/content/ComponentName;Lz1/y1;)V

    goto/16 :goto_1d

    .line 34
    :cond_c
    :goto_9
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v0, v0, Lz1/y1;->P:I

    if-eqz v0, :cond_f

    .line 35
    const-string v0, "cn.nubia.gamelauncher"

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 36
    iget-object v0, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v0, :cond_f

    invoke-virtual {v0, v10}, Lz1/c2;->q0(Z)V

    goto :goto_a

    .line 37
    :cond_d
    const-string v0, "cn.nubia.redmagickyi"

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 38
    iget-object v0, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v0, :cond_f

    invoke-virtual {v0, v10}, Lz1/c2;->s0(Z)V

    goto :goto_a

    .line 39
    :cond_e
    const-string v0, "cn.nubia.inspiredwallpaper"

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 40
    iget-object v0, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v0, :cond_f

    invoke-virtual {v0, v10}, Lz1/c2;->r0(Z)V

    .line 41
    :cond_f
    :goto_a
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v0, v0, Lz1/y1;->P:I

    if-nez v0, :cond_10

    sget-object v0, Lcom/android/launcher3/resource/g0;->O:[Ljava/lang/String;

    const-string v13, "sCheckMainEntrance"

    invoke-static {v0, v13}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, Li4/g;->Y([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 42
    invoke-interface {v0, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 43
    :cond_10
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v0, v0, Lz1/y1;->O:I

    if-nez v0, :cond_12

    .line 44
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    iget-object v13, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v0, v13}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v13

    invoke-virtual {v13}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    move-result-object v13

    invoke-static {v13}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    iget-object v15, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v0, v15}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v0

    invoke-virtual {v13, v0, v5}, Lcom/android/launcher3/H5;->D0(Lcom/android/launcher3/P2;Landroid/content/ComponentName;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 45
    iget-object v0, v1, Lz1/y5;->q:Lcom/android/launcher3/util/J1;

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v13, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v13, v13, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v0, v2, v13}, Lcom/android/launcher3/util/J1;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    move-result-object v2

    .line 46
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v13, v0, Lz1/y1;->P:I

    if-eqz v13, :cond_11

    if-eqz v2, :cond_11

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "processAppOrDeepShortcut: update intent: "

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->l0()Lcom/android/launcher3/util/G;

    move-result-object v0

    .line 49
    invoke-virtual {v2, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v12, v13}, Lcom/android/launcher3/util/G;->t(Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/G;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/launcher3/util/G;->b()I

    .line 50
    :try_start_2
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_b

    :catch_2
    move-exception v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_b

    .line 52
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "activity has no category launcher removed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 53
    const-string v2, "no_main_launcher"

    .line 54
    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 55
    :cond_12
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->g0()V

    .line 56
    :cond_13
    :goto_b
    invoke-virtual {v2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_14

    .line 57
    invoke-virtual {v2, v6}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    :cond_14
    invoke-static {}, Lcom/android/launcher3/y0;->D0()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 59
    invoke-virtual {v8}, Lcom/android/launcher3/util/k;->j()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 60
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v12, v0, Lz1/y1;->O:I

    const/4 v13, 0x6

    if-ne v12, v13, :cond_15

    .line 61
    iget v0, v0, Lz1/y1;->P:I

    if-eqz v0, :cond_15

    move v12, v10

    goto :goto_c

    :cond_15
    move v12, v3

    .line 62
    :goto_c
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v13, ", restoreFlag="

    const-string v3, ", itemType="

    if-nez v0, :cond_16

    if-eqz v9, :cond_17

    if-eqz v12, :cond_16

    goto :goto_d

    :cond_16
    move/from16 v18, v4

    goto/16 :goto_12

    :cond_17
    :goto_d
    if-eqz v5, :cond_18

    .line 63
    iget-object v0, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v15

    iget-object v10, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v10, v10, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-static {v0, v15, v10}, Lcom/android/launcher3/c1;->i(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 64
    :cond_18
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v10, v0, Lz1/y1;->P:I

    if-nez v10, :cond_1d

    if-eqz v12, :cond_19

    goto :goto_f

    .line 65
    :cond_19
    invoke-virtual {v8}, Lcom/android/launcher3/util/k;->l()Z

    move-result v0

    if-eqz v0, :cond_1b

    or-int/lit8 v4, v4, 0x2

    .line 66
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    const/4 v10, 0x1

    invoke-virtual {v0, v2, v10, v10}, Lz1/y1;->w(Landroid/content/Intent;ZZ)Lcom/android/launcher3/model/data/I;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 67
    new-instance v10, Lcom/android/launcher3/H5$a;

    iget-object v15, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-direct {v10, v15, v0}, Lcom/android/launcher3/H5$a;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V

    .line 68
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    iget-object v15, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v0, v15}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v0, v10}, Lcom/android/launcher3/H5;->k1(Lcom/android/launcher3/H5$a;)V

    :cond_1a
    :goto_e
    const/4 v0, 0x1

    goto/16 :goto_13

    .line 69
    :cond_1b
    iget-boolean v0, v1, Lz1/y5;->o:Z

    if-nez v0, :cond_1c

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Missing package, will check later: "

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    iget-object v0, v1, Lz1/y5;->f:Ljava/util/Set;

    new-instance v10, Lcom/android/launcher3/util/L1;

    iget-object v15, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v15, v15, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-direct {v10, v6, v15}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    invoke-interface {v0, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 72
    :cond_1c
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid package removed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 74
    const-string v2, "app_not_installed_external_media"

    .line 75
    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 76
    :cond_1d
    :goto_f
    iget v0, v0, Lz1/y1;->O:I

    .line 77
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v18, v4

    const-string v4, "package not yet restored: "

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", isPreArchivedShortcut="

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 78
    invoke-static {v14, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget-object v0, v1, Lz1/y5;->u:Lcom/android/launcher3/util/L1;

    iget-object v4, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v4, v4, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v0, v6, v4}, Lcom/android/launcher3/util/L1;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 80
    iget-object v0, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Lz1/c2;->G()I

    move-result v0

    if-nez v0, :cond_1e

    const/4 v0, 0x1

    goto :goto_10

    :cond_1e
    const/4 v0, 0x0

    :goto_10
    if-eqz v0, :cond_1f

    .line 81
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UnRestored app, removed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 83
    invoke-virtual {v0, v1, v7}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 84
    :cond_1f
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Lz1/y1;->a0(I)Z

    move-result v0

    if-nez v0, :cond_23

    .line 85
    iget-object v0, v1, Lz1/y5;->n:Ljava/util/HashMap;

    iget-object v4, v1, Lz1/y5;->u:Lcom/android/launcher3/util/L1;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    if-eqz v12, :cond_20

    goto :goto_11

    .line 86
    :cond_20
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Lz1/y1;->a0(I)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 87
    const-string v0, "processAppOrDeepShortcut: autoinstall app can not delete"

    invoke-static {v14, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12

    .line 88
    :cond_21
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removing app that is not restored and not installing. package: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 90
    const-string v2, "app_not_restored_or_installed"

    .line 91
    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 92
    :cond_22
    :goto_11
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 93
    iget v4, v0, Lz1/y1;->P:I

    const/16 v16, 0x4

    or-int/lit8 v4, v4, 0x4

    .line 94
    iput v4, v0, Lz1/y1;->P:I

    .line 95
    iget v0, v0, Lz1/y1;->O:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "restore started for installing app: "

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 96
    invoke-static {v14, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->l0()Lcom/android/launcher3/util/G;

    move-result-object v0

    iget-object v4, v1, Lz1/y5;->a:Lz1/y1;

    iget v4, v4, Lz1/y1;->P:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v10, "restored"

    invoke-virtual {v0, v10, v4}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->b()I

    .line 99
    :try_start_3
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_12

    :catch_3
    move-exception v0

    .line 100
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_23
    :goto_12
    move/from16 v4, v18

    const/4 v0, 0x0

    .line 101
    :goto_13
    iget-object v10, v1, Lz1/y5;->a:Lz1/y1;

    iget v15, v10, Lz1/y1;->P:I

    and-int/lit8 v18, v15, 0x8

    if-eqz v18, :cond_24

    .line 102
    iget v9, v10, Lz1/y1;->O:I

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v18, v4

    const-string v4, "restore flag set AND WorkspaceItemInfo.FLAG_SUPPORTS_WEB_UI != 0, setting valid target to false: "

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 103
    invoke-static {v14, v4}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v9, 0x0

    goto :goto_14

    :cond_24
    move/from16 v18, v4

    :goto_14
    if-eqz v9, :cond_25

    if-nez v12, :cond_25

    .line 104
    iget-object v4, v1, Lz1/y5;->a:Lz1/y1;

    iget v9, v4, Lz1/y1;->O:I

    iget v4, v4, Lz1/y1;->P:I

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "valid target true, marking restored: "

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 105
    invoke-static {v14, v3}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    iget-object v3, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v3}, Lz1/y1;->g0()V

    .line 107
    :cond_25
    iget-object v3, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v3}, Lz1/y1;->b0()Z

    move-result v3

    const/16 v17, 0x1

    xor-int/lit8 v3, v3, 0x1

    .line 108
    iget-object v4, v1, Lz1/y5;->a:Lz1/y1;

    iget v9, v4, Lz1/y1;->P:I

    if-eqz v9, :cond_26

    .line 109
    invoke-virtual {v4, v2, v12}, Lz1/y1;->M(Landroid/content/Intent;Z)Lcom/android/launcher3/model/data/I;

    move-result-object v0

    move/from16 v4, v18

    const/4 v10, 0x0

    goto/16 :goto_18

    .line 110
    :cond_26
    iget v9, v4, Lz1/y1;->O:I

    if-nez v9, :cond_27

    const/4 v10, 0x0

    .line 111
    invoke-virtual {v4, v2, v0, v3, v10}, Lz1/y1;->A(Landroid/content/Intent;ZZZ)Lcom/android/launcher3/model/data/I;

    move-result-object v0

    :goto_15
    move/from16 v4, v18

    goto/16 :goto_18

    :cond_27
    const/4 v10, 0x0

    const/4 v13, 0x6

    if-ne v9, v13, :cond_2d

    .line 112
    iget-object v0, v4, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-static {v2, v0}, LN1/e;->c(Landroid/content/Intent;Landroid/os/UserHandle;)LN1/e;

    move-result-object v0

    .line 113
    iget-object v4, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v4}, Lz1/y1;->J()I

    move-result v4

    and-int/lit8 v4, v4, 0x10

    if-nez v4, :cond_28

    const/4 v4, 0x1

    goto :goto_16

    :cond_28
    move v4, v10

    .line 114
    :goto_16
    iget-object v9, v1, Lz1/y5;->s:Landroid/util/LongSparseArray;

    iget-object v12, v1, Lz1/y5;->a:Lz1/y1;

    iget-wide v12, v12, Lz1/y1;->K:J

    invoke-virtual {v9, v12, v13}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_2c

    .line 115
    iget-object v2, v1, Lz1/y5;->g:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ShortcutInfo;

    if-nez v2, :cond_29

    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-direct {v1, v0}, Lz1/y5;->g(LN1/e;)Landroid/content/pm/ShortcutInfo;

    move-result-object v2

    :cond_29
    if-nez v2, :cond_2a

    .line 116
    iget-object v2, v1, Lz1/y5;->a:Lz1/y1;

    .line 117
    invoke-virtual {v0}, LN1/e;->f()Ljava/lang/String;

    move-result-object v0

    iget-object v1, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v1, v1, Lz1/y1;->L:Landroid/os/UserHandle;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Pinned shortcut not found from request. package="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 118
    const-string v1, "shortcut_not_found"

    .line 119
    invoke-virtual {v2, v0, v1}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 120
    :cond_2a
    invoke-virtual {v2}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    move-result-object v0

    .line 121
    invoke-virtual {v2}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    move-result-object v9

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "processAppOrDeepShortcut pinnedShortcut = ["

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "]/"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    invoke-static {v14, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    const-string v0, "needShowBadge"

    invoke-static {v2, v0, v4}, Lcom/android/launcher3/H5;->a1(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;Z)V

    .line 124
    new-instance v0, Lcom/android/launcher3/model/data/I;

    iget-object v9, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-direct {v0, v2, v9}, Lcom/android/launcher3/model/data/I;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 125
    invoke-virtual {v0, v4}, Lcom/android/launcher3/model/data/z;->H(Z)V

    .line 126
    new-instance v4, Ls1/h;

    invoke-direct {v4, v2, v8}, Ls1/h;-><init>(Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/util/k;)V

    .line 127
    iget-object v2, v1, Lz1/y5;->j:Ls1/P;

    iget-object v9, v1, Lz1/y5;->a:Lz1/y1;

    new-instance v11, Lz1/x5;

    invoke-direct {v11, v9}, Lz1/x5;-><init>(Lz1/y1;)V

    invoke-virtual {v2, v0, v4, v11}, Ls1/P;->C0(Lcom/android/launcher3/model/data/z;Ls1/h;Ljava/util/function/Predicate;)V

    .line 128
    invoke-virtual {v8}, Lcom/android/launcher3/util/k;->m()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 129
    iget v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    const/16 v16, 0x4

    or-int/lit8 v2, v2, 0x4

    .line 130
    iput v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 131
    :cond_2b
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 132
    iget-object v9, v1, Lz1/y5;->t:Ljava/util/List;

    invoke-interface {v9, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_15

    .line 133
    :cond_2c
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->d0()Lcom/android/launcher3/model/data/I;

    move-result-object v0

    .line 134
    iget v9, v0, Lcom/android/launcher3/model/data/z;->h:I

    or-int/lit8 v9, v9, 0x20

    .line 135
    iput v9, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 136
    invoke-virtual {v0, v4}, Lcom/android/launcher3/model/data/z;->H(Z)V

    goto/16 :goto_15

    .line 137
    :cond_2d
    invoke-virtual {v4}, Lz1/y1;->d0()Lcom/android/launcher3/model/data/I;

    move-result-object v0

    .line 138
    invoke-virtual {v8}, Lcom/android/launcher3/util/k;->m()Z

    move-result v4

    if-eqz v4, :cond_2e

    or-int/lit8 v4, v18, 0x4

    goto :goto_17

    :cond_2e
    move/from16 v4, v18

    .line 139
    :goto_17
    iget-object v9, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v9}, Lz1/y1;->J()I

    move-result v9

    iput v9, v0, Lcom/android/launcher3/model/data/I;->o:I

    .line 140
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_2f

    .line 141
    invoke-virtual {v2}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v9

    if-eqz v9, :cond_2f

    .line 142
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v11, "android.intent.action.MAIN"

    invoke-static {v9, v11}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2f

    .line 143
    invoke-virtual {v2}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v9

    const-string v11, "android.intent.category.LAUNCHER"

    invoke-interface {v9, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2f

    const/high16 v9, 0x10200000

    .line 144
    invoke-virtual {v2, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_2f
    :goto_18
    if-eqz v0, :cond_42

    .line 145
    iget-object v7, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v7}, Lz1/y1;->J()I

    move-result v7

    and-int/lit16 v7, v7, 0x100

    if-eqz v7, :cond_30

    const/4 v7, 0x1

    .line 146
    invoke-virtual {v0, v7}, Lcom/android/launcher3/model/data/y;->setShortcutAddFromOtherApp(Z)V

    .line 147
    :cond_30
    iget v7, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    const/4 v13, 0x6

    if-eq v7, v13, :cond_31

    .line 148
    iget-object v7, v1, Lz1/y5;->r:Ljava/util/List;

    iget-object v9, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v9, v0, v3}, Lz1/y1;->t(Lcom/android/launcher3/model/data/I;Z)Lcom/android/launcher3/model/data/q;

    move-result-object v9

    const-string v11, "createIconRequestInfo(...)"

    invoke-static {v9, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    :cond_31
    iget-object v7, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v7, v0}, Lz1/y1;->c(Lcom/android/launcher3/model/data/y;)V

    .line 150
    iput-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 151
    iget-object v2, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v2}, Lz1/y1;->L()I

    move-result v2

    iput v2, v0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 152
    iget-object v2, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v2}, Lz1/y1;->P()I

    move-result v2

    iput v2, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 153
    iget-object v2, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v2}, Lz1/y1;->T()I

    move-result v2

    iput v2, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 154
    iget v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    or-int/2addr v2, v4

    iput v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 155
    iget-boolean v2, v1, Lz1/y5;->k:Z

    if-eqz v2, :cond_32

    invoke-virtual {v8}, Lcom/android/launcher3/util/k;->n()Z

    move-result v2

    if-nez v2, :cond_32

    .line 156
    iget v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    const/16 v17, 0x1

    or-int/lit8 v2, v2, 0x1

    .line 157
    iput v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 158
    :cond_32
    iget-object v2, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v2}, Lz1/y1;->I()Landroid/content/pm/LauncherActivityInfo;

    move-result-object v2

    if-eqz v2, :cond_33

    .line 159
    iget-object v4, v1, Lz1/y5;->c:LD1/t;

    iget-object v7, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v7, v7, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v4, v7}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    move-result-object v4

    .line 160
    sget-object v7, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    iget-object v8, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v7, v8}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/launcher3/util/f;

    .line 161
    iget-object v8, v1, Lz1/y5;->q:Lcom/android/launcher3/util/J1;

    .line 162
    invoke-static {v0, v2, v4, v7, v8}, Lcom/android/launcher3/model/data/d;->T(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;)Z

    .line 163
    :cond_33
    iget-object v4, v1, Lz1/y5;->a:Lz1/y1;

    iget v4, v4, Lz1/y1;->P:I

    if-nez v4, :cond_34

    .line 164
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    move-result v4

    if-eqz v4, :cond_37

    if-eqz v2, :cond_37

    .line 165
    invoke-virtual {v2}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-boolean v4, v4, Landroid/content/pm/ApplicationInfo;->isArchived:Z

    if-eqz v4, :cond_37

    :cond_34
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_37

    .line 166
    iget-object v4, v1, Lz1/y5;->u:Lcom/android/launcher3/util/L1;

    iget-object v7, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v7, v7, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v4, v6, v7}, Lcom/android/launcher3/util/L1;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 167
    iget-object v4, v1, Lz1/y5;->n:Ljava/util/HashMap;

    iget-object v6, v1, Lz1/y5;->u:Lcom/android/launcher3/util/L1;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/PackageInstaller$SessionInfo;

    if-nez v4, :cond_35

    .line 168
    iget v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    and-int/lit16 v2, v2, -0x401

    .line 169
    iput v2, v0, Lcom/android/launcher3/model/data/z;->h:I

    goto :goto_19

    :cond_35
    if-eqz v2, :cond_36

    .line 170
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    move-result v6

    if-eqz v6, :cond_37

    .line 171
    invoke-virtual {v2}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-boolean v2, v2, Landroid/content/pm/ApplicationInfo;->isArchived:Z

    if-eqz v2, :cond_37

    .line 172
    :cond_36
    invoke-virtual {v4}, Landroid/content/pm/PackageInstaller$SessionInfo;->getProgress()F

    move-result v2

    const/16 v4, 0x64

    int-to-float v4, v4

    mul-float/2addr v2, v4

    float-to-int v2, v2

    const/4 v7, 0x1

    .line 173
    invoke-virtual {v0, v2, v7}, Lcom/android/launcher3/model/data/z;->J(II)V

    .line 174
    :cond_37
    :goto_19
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_40

    .line 175
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "getPackageName(...)"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 176
    iget-object v4, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-static {v4}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/android/launcher3/H5;->w0(Ljava/lang/String;)Z

    move-result v4

    const/4 v7, 0x1

    if-eqz v4, :cond_38

    .line 177
    iput-boolean v7, v0, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 178
    :cond_38
    sget-object v4, Lcom/android/launcher3/P2;->h:Lcom/android/launcher3/util/I;

    iget-object v6, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher3/P2;

    invoke-virtual {v4}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/android/launcher3/D3;->r0(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 179
    iput-boolean v7, v0, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 180
    :cond_39
    iget-object v4, v1, Lz1/y5;->h:Landroid/content/Context;

    iget-object v6, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-static {v4, v2, v6}, Lcom/android/launcher3/util/D1;->f(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 181
    iput-boolean v7, v0, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 182
    iget-object v4, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v4, :cond_3a

    invoke-virtual {v4}, Lz1/c2;->H()Ljava/util/HashMap;

    move-result-object v4

    if-eqz v4, :cond_3a

    iget-object v6, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    invoke-virtual {v4, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/UserHandle;

    .line 183
    :cond_3a
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    iget-boolean v4, v0, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    iget-object v6, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "packageName: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " info.isNewApp: "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ",info.user: "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v14, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_3b
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_3c

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    goto :goto_1a

    :cond_3c
    const/4 v2, 0x0

    :goto_1a
    const-string v4, "com.jiutian.yidonglingxi"

    invoke-static {v4, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    iget v2, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    const/4 v13, 0x6

    if-ne v2, v13, :cond_3d

    goto :goto_1b

    :cond_3d
    move v7, v10

    .line 185
    :goto_1b
    iget-object v2, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v2, :cond_3e

    invoke-virtual {v2}, Lz1/c2;->B()Lz1/m;

    move-result-object v2

    if-eqz v2, :cond_3e

    sget-object v4, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    iget-object v6, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v4, v6}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v4

    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v6

    iget-object v8, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v8, v8, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v2, v4, v6, v8}, Lz1/m;->v(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    goto :goto_1c

    :cond_3e
    const/4 v12, 0x0

    :goto_1c
    invoke-static {v12}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const-string v4, "hidden_app"

    if-nez v2, :cond_3f

    if-nez v7, :cond_3f

    .line 186
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    const-string v1, "hidden special app"

    invoke-virtual {v0, v1, v4}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 187
    :cond_3f
    iget-object v2, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v2, v2, Lz1/y1;->L:Landroid/os/UserHandle;

    iget-object v6, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-static {v5, v2, v6}, Lx1/O;->n2(Landroid/content/ComponentName;Landroid/os/UserHandle;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 188
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    const-string v1, "hidden special app for hide"

    invoke-virtual {v0, v1, v4}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 189
    :cond_40
    iget-object v2, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v4, v1, Lz1/y5;->l:Lz1/y0;

    iget-object v6, v1, Lz1/y5;->b:Lz1/B1;

    invoke-virtual {v2, v0, v4, v6}, Lz1/y1;->d(Lcom/android/launcher3/model/data/y;Lz1/y0;Lz1/B1;)V

    .line 190
    sget-object v2, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    iget-object v4, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v2, v4}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v2

    iget-object v4, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v2, v5, v4}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 191
    iget-object v1, v1, Lz1/y5;->a:Lz1/y1;

    iget v2, v1, Lz1/y1;->O:I

    if-nez v2, :cond_41

    .line 192
    invoke-virtual {v1, v0, v3}, Lz1/y1;->k0(Lcom/android/launcher3/model/data/I;Z)V

    :cond_41
    :goto_1d
    return-void

    .line 193
    :cond_42
    invoke-static {v5}, Lx1/O;->q3(Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 194
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    const-string v2, "Missing activity found"

    invoke-virtual {v0, v2, v7}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    iget-object v0, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v0, :cond_43

    iget-object v1, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0, v5, v1}, Lz1/c2;->w0(Landroid/content/ComponentName;Lz1/y1;)V

    .line 196
    :cond_43
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unexpected null WorkspaceItemInfo"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_44
    :goto_1e
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 198
    iget v1, v0, Lz1/y1;->M:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No target package for item id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 199
    invoke-virtual {v0, v1, v7}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private final d()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lz1/y5;->a:Lz1/y1;

    .line 14
    .line 15
    iget v1, v0, Lz1/y1;->M:I

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v3, "concise item id="

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "concise_other_item"

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object v1, v0, Lz1/y5;->a:Lz1/y1;

    .line 41
    .line 42
    iget v2, v1, Lz1/y1;->M:I

    .line 43
    .line 44
    iget-object v3, v0, Lz1/y5;->l:Lz1/y0;

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3}, Lz1/y1;->v(ILz1/y0;)Lcom/android/launcher3/model/data/m;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v2, v0, Lz1/y5;->a:Lz1/y1;

    .line 51
    .line 52
    iget v2, v2, Lz1/y1;->O:I

    .line 53
    .line 54
    const/16 v3, 0xa

    .line 55
    .line 56
    if-ne v2, v3, :cond_2

    .line 57
    .line 58
    instance-of v2, v1, Lcom/android/launcher3/model/data/p;

    .line 59
    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    new-instance v2, Lcom/android/launcher3/model/data/l;

    .line 63
    .line 64
    invoke-direct {v2}, Lcom/android/launcher3/model/data/l;-><init>()V

    .line 65
    .line 66
    .line 67
    check-cast v1, Lcom/android/launcher3/model/data/p;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const-string v3, "getContents(...)"

    .line 74
    .line 75
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-eqz v3, :cond_1

    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Lcom/android/launcher3/model/data/l;->v(Lcom/android/launcher3/model/data/y;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    move-object v1, v2

    .line 99
    :cond_2
    iget-object v2, v0, Lz1/y5;->a:Lz1/y1;

    .line 100
    .line 101
    invoke-virtual {v2, v1}, Lz1/y1;->c(Lcom/android/launcher3/model/data/y;)V

    .line 102
    .line 103
    .line 104
    iget-object v2, v0, Lz1/y5;->a:Lz1/y1;

    .line 105
    .line 106
    iget v3, v2, Lz1/y1;->s:I

    .line 107
    .line 108
    invoke-virtual {v2, v3}, Landroid/database/CursorWrapper;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    iput-object v2, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 113
    .line 114
    const/4 v2, 0x1

    .line 115
    iput v2, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 116
    .line 117
    iput v2, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 118
    .line 119
    iget-object v3, v0, Lz1/y5;->a:Lz1/y1;

    .line 120
    .line 121
    iget v4, v3, Lz1/y1;->s:I

    .line 122
    .line 123
    invoke-virtual {v3, v4}, Landroid/database/CursorWrapper;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    sget-object v4, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 128
    .line 129
    iget-object v5, v0, Lz1/y5;->h:Landroid/content/Context;

    .line 130
    .line 131
    invoke-virtual {v4, v5}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-virtual {v5}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-static {v5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    iget-object v6, v0, Lz1/y5;->a:Lz1/y1;

    .line 143
    .line 144
    iget v6, v6, Lz1/y1;->M:I

    .line 145
    .line 146
    invoke-virtual {v5, v6}, Lcom/android/launcher3/H5;->P(I)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    new-instance v6, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    const-string v7, "processFolderOrAppPair: title = "

    .line 156
    .line 157
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v7, ",titleSaved = "

    .line 164
    .line 165
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    const-string v7, "WorkspaceItemProcessor"

    .line 176
    .line 177
    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    if-nez v6, :cond_3

    .line 185
    .line 186
    invoke-static {v5, v3, v2}, LD4/g;->o(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 187
    .line 188
    .line 189
    move-result v6

    .line 190
    if-nez v6, :cond_3

    .line 191
    .line 192
    iget-object v3, v0, Lz1/y5;->a:Lz1/y1;

    .line 193
    .line 194
    invoke-virtual {v3, v5}, Lz1/y1;->b(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    iget-object v3, v0, Lz1/y5;->a:Lz1/y1;

    .line 198
    .line 199
    iget v3, v3, Lz1/y1;->M:I

    .line 200
    .line 201
    new-instance v6, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .line 205
    .line 206
    const-string v8, "title change"

    .line 207
    .line 208
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string v8, " folder-id "

    .line 215
    .line 216
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-static {v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    move-object v3, v5

    .line 230
    :cond_3
    iput-object v3, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 231
    .line 232
    iget-object v3, v0, Lz1/y5;->a:Lz1/y1;

    .line 233
    .line 234
    invoke-virtual {v3}, Lz1/y1;->P()I

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    iput v3, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 239
    .line 240
    iget-object v3, v0, Lz1/y5;->a:Lz1/y1;

    .line 241
    .line 242
    invoke-virtual {v3}, Lz1/y1;->T()I

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    iput v3, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 247
    .line 248
    instance-of v3, v1, Lcom/android/launcher3/model/data/p;

    .line 249
    .line 250
    if-eqz v3, :cond_4

    .line 251
    .line 252
    move-object v5, v1

    .line 253
    check-cast v5, Lcom/android/launcher3/model/data/p;

    .line 254
    .line 255
    iget-object v6, v0, Lz1/y5;->a:Lz1/y1;

    .line 256
    .line 257
    invoke-virtual {v6}, Lz1/y1;->J()I

    .line 258
    .line 259
    .line 260
    move-result v6

    .line 261
    iput v6, v5, Lcom/android/launcher3/model/data/p;->g:I

    .line 262
    .line 263
    goto :goto_1

    .line 264
    :cond_4
    iget-object v5, v0, Lz1/y5;->a:Lz1/y1;

    .line 265
    .line 266
    invoke-virtual {v5}, Lz1/y1;->L()I

    .line 267
    .line 268
    .line 269
    move-result v5

    .line 270
    iput v5, v1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 271
    .line 272
    :goto_1
    iget-object v5, v0, Lz1/y5;->a:Lz1/y1;

    .line 273
    .line 274
    iget v6, v5, Lz1/y1;->O:I

    .line 275
    .line 276
    const/4 v8, 0x2

    .line 277
    const/16 v9, 0x8

    .line 278
    .line 279
    if-ne v6, v8, :cond_6

    .line 280
    .line 281
    if-eqz v3, :cond_6

    .line 282
    .line 283
    move-object v6, v1

    .line 284
    check-cast v6, Lcom/android/launcher3/model/data/p;

    .line 285
    .line 286
    iget-object v10, v0, Lz1/y5;->h:Landroid/content/Context;

    .line 287
    .line 288
    iget v5, v5, Lz1/y1;->M:I

    .line 289
    .line 290
    invoke-direct {v0, v10, v5}, Lz1/y5;->b(Landroid/content/Context;I)I

    .line 291
    .line 292
    .line 293
    move-result v5

    .line 294
    iput v5, v6, Lcom/android/launcher3/model/data/p;->j:I

    .line 295
    .line 296
    invoke-virtual {v6, v9}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 297
    .line 298
    .line 299
    move-result v5

    .line 300
    if-nez v5, :cond_5

    .line 301
    .line 302
    iget-object v5, v0, Lz1/y5;->a:Lz1/y1;

    .line 303
    .line 304
    iget v5, v5, Lz1/y1;->P:I

    .line 305
    .line 306
    if-eqz v5, :cond_5

    .line 307
    .line 308
    iget v5, v6, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 309
    .line 310
    const/4 v10, -0x1

    .line 311
    if-ne v5, v10, :cond_5

    .line 312
    .line 313
    iget v5, v6, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 314
    .line 315
    if-ne v5, v10, :cond_5

    .line 316
    .line 317
    invoke-static {}, Lx1/O;->L()Z

    .line 318
    .line 319
    .line 320
    move-result v5

    .line 321
    if-eqz v5, :cond_5

    .line 322
    .line 323
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 324
    .line 325
    .line 326
    move-result-object v5

    .line 327
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 328
    .line 329
    .line 330
    move-result-object v5

    .line 331
    invoke-virtual {v6, v9, v2, v5}, Lcom/android/launcher3/model/data/p;->P(IZLz1/J3;)V

    .line 332
    .line 333
    .line 334
    const-string v2, "restore hide folder--add option to hide folder"

    .line 335
    .line 336
    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    .line 338
    .line 339
    :cond_5
    iget-object v2, v0, Lz1/y5;->a:Lz1/y1;

    .line 340
    .line 341
    invoke-direct {v0, v2, v6}, Lz1/y5;->a(Lz1/y1;Lcom/android/launcher3/model/data/p;)V

    .line 342
    .line 343
    .line 344
    iget-object v2, v6, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 345
    .line 346
    iget v5, v6, Lcom/android/launcher3/model/data/y;->id:I

    .line 347
    .line 348
    iget v10, v6, Lcom/android/launcher3/model/data/p;->k:I

    .line 349
    .line 350
    iget v11, v6, Lcom/android/launcher3/model/data/p;->l:I

    .line 351
    .line 352
    iget v12, v6, Lcom/android/launcher3/model/data/p;->o:I

    .line 353
    .line 354
    invoke-static {v12}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v12

    .line 358
    iget v13, v6, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 359
    .line 360
    iget v14, v6, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 361
    .line 362
    iget v15, v6, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 363
    .line 364
    iget v9, v6, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 365
    .line 366
    iget v8, v6, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 367
    .line 368
    iget v6, v6, Lcom/android/launcher3/model/data/p;->m:I

    .line 369
    .line 370
    move/from16 v16, v3

    .line 371
    .line 372
    new-instance v3, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 375
    .line 376
    .line 377
    move-object/from16 v17, v1

    .line 378
    .line 379
    const-string v1, "processFolderOrAppPair: folder: "

    .line 380
    .line 381
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string v1, ", folder id: "

    .line 388
    .line 389
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    const-string v1, ", gridColumn: "

    .line 396
    .line 397
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    const-string v1, ", gridRow: "

    .line 404
    .line 405
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    const-string v1, ", color: "

    .line 412
    .line 413
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    const-string v1, ", screenId: "

    .line 420
    .line 421
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v1, ", cellX: "

    .line 428
    .line 429
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    const-string v1, ", cellY: "

    .line 436
    .line 437
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    const-string v1, ", spanX: "

    .line 444
    .line 445
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    const-string v1, ", spanY: "

    .line 452
    .line 453
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 457
    .line 458
    .line 459
    const-string v1, ", maxGridValueX="

    .line 460
    .line 461
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 465
    .line 466
    .line 467
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object v1

    .line 471
    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    .line 473
    .line 474
    goto :goto_2

    .line 475
    :cond_6
    move-object/from16 v17, v1

    .line 476
    .line 477
    move/from16 v16, v3

    .line 478
    .line 479
    :goto_2
    iget-object v1, v0, Lz1/y5;->a:Lz1/y1;

    .line 480
    .line 481
    invoke-virtual {v1}, Lz1/y1;->g0()V

    .line 482
    .line 483
    .line 484
    iget-object v1, v0, Lz1/y5;->a:Lz1/y1;

    .line 485
    .line 486
    iget v1, v1, Lz1/y1;->O:I

    .line 487
    .line 488
    const/4 v2, 0x2

    .line 489
    if-ne v1, v2, :cond_7

    .line 490
    .line 491
    if-eqz v16, :cond_7

    .line 492
    .line 493
    move-object/from16 v1, v17

    .line 494
    .line 495
    check-cast v1, Lcom/android/launcher3/model/data/p;

    .line 496
    .line 497
    const/16 v2, 0x8

    .line 498
    .line 499
    invoke-virtual {v1, v2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 500
    .line 501
    .line 502
    move-result v2

    .line 503
    if-eqz v2, :cond_7

    .line 504
    .line 505
    iget-object v2, v0, Lz1/y5;->h:Landroid/content/Context;

    .line 506
    .line 507
    invoke-virtual {v4, v2}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 512
    .line 513
    .line 514
    move-result-object v2

    .line 515
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 516
    .line 517
    .line 518
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->M0()Z

    .line 519
    .line 520
    .line 521
    move-result v2

    .line 522
    if-eqz v2, :cond_7

    .line 523
    .line 524
    invoke-static {}, Lx1/O;->L()Z

    .line 525
    .line 526
    .line 527
    move-result v2

    .line 528
    if-eqz v2, :cond_7

    .line 529
    .line 530
    iget-object v2, v0, Lz1/y5;->h:Landroid/content/Context;

    .line 531
    .line 532
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 533
    .line 534
    .line 535
    move-result-object v2

    .line 536
    const v3, 0x7f140005

    .line 537
    .line 538
    .line 539
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v2

    .line 543
    iput-object v2, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 544
    .line 545
    iget-object v1, v0, Lz1/y5;->l:Lz1/y0;

    .line 546
    .line 547
    iget-object v0, v0, Lz1/y5;->h:Landroid/content/Context;

    .line 548
    .line 549
    const/4 v2, 0x0

    .line 550
    move-object/from16 v3, v17

    .line 551
    .line 552
    invoke-virtual {v1, v0, v3, v2}, Lz1/y0;->k(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Z)V

    .line 553
    .line 554
    .line 555
    return-void

    .line 556
    :cond_7
    move-object/from16 v3, v17

    .line 557
    .line 558
    iget-object v1, v0, Lz1/y5;->a:Lz1/y1;

    .line 559
    .line 560
    iget-object v2, v0, Lz1/y5;->l:Lz1/y0;

    .line 561
    .line 562
    iget-object v0, v0, Lz1/y5;->b:Lz1/B1;

    .line 563
    .line 564
    invoke-virtual {v1, v3, v2, v0}, Lz1/y1;->d(Lcom/android/launcher3/model/data/y;Lz1/y0;Lz1/B1;)V

    .line 565
    .line 566
    .line 567
    return-void
.end method

.method private final f()V
    .locals 18

    move-object/from16 v1, p0

    .line 1
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->C()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 2
    new-instance v3, Lcom/android/launcher3/model/data/A;

    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->B()I

    move-result v0

    invoke-direct {v3, v0, v2}, Lcom/android/launcher3/model/data/A;-><init>(ILandroid/content/ComponentName;)V

    .line 3
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0, v3}, Lz1/y1;->c(Lcom/android/launcher3/model/data/y;)V

    .line 4
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->P()I

    move-result v0

    iput v0, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 5
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->T()I

    move-result v0

    iput v0, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 6
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->J()I

    move-result v0

    iput v0, v3, Lcom/android/launcher3/model/data/A;->l:I

    .line 7
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v4, v0, Lz1/y1;->L:Landroid/os/UserHandle;

    iput-object v4, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 8
    invoke-virtual {v0}, Lz1/y1;->D()I

    move-result v0

    iput v0, v3, Lcom/android/launcher3/model/data/A;->o:I

    .line 9
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v0, v0, Lz1/y1;->P:I

    iput v0, v3, Lcom/android/launcher3/model/data/A;->i:I

    .line 10
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 11
    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-class v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidget;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "#custom-widget-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 12
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v1, v0, Lz1/y1;->M:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "concise item id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "concise_other_item"

    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 13
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->G()Z

    move-result v0

    const-string v4, "widgets_disabled"

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t()Z

    move-result v0

    if-nez v0, :cond_1

    .line 14
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->m()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 15
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget v1, v0, Lz1/y1;->M:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AiFuture current not enabled, item id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v4}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 16
    :cond_1
    iget v0, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    const-string v5, ",, component="

    const-string v6, ",, appWidgetId="

    const-string v7, "x"

    if-lez v0, :cond_15

    iget v8, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    if-gtz v8, :cond_2

    goto/16 :goto_8

    .line 17
    :cond_2
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->b0()Z

    move-result v0

    if-nez v0, :cond_3

    .line 18
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 19
    iget v3, v0, Lz1/y1;->M:I

    .line 20
    invoke-virtual {v0}, Lz1/y1;->B()I

    move-result v4

    .line 21
    iget-object v1, v1, Lz1/y5;->a:Lz1/y1;

    iget v1, v1, Lz1/y1;->N:I

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processWidget: invalid Widget container != CONTAINER_DESKTOP nor CONTAINER_HOTSEAT. id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ",, container="

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 22
    const-string v2, "invalid_widget_container"

    .line 23
    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 24
    :cond_3
    iget-object v0, v1, Lz1/y5;->x:Landroid/os/UserManager;

    const/4 v5, -0x2

    const-string v6, "WorkspaceItemProcessor"

    if-eqz v0, :cond_13

    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object v8

    invoke-virtual {v0, v8}, Landroid/os/UserManager;->isUserUnlocked(Landroid/os/UserHandle;)Z

    move-result v0

    const/4 v8, 0x1

    if-ne v0, v8, :cond_13

    .line 25
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->B()I

    move-result v0

    const-string v9, "appWidgetId"

    const-string v10, "newInstance(...)"

    if-ne v0, v5, :cond_6

    .line 26
    iget-object v0, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-static {v0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    .line 27
    iget-object v5, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-static {v5}, Lcom/android/launcher3/widget/l0;->L(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;

    move-result-object v5

    invoke-static {v5, v10}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    invoke-virtual {v5}, Lcom/android/launcher3/widget/l0;->r()I

    move-result v11

    .line 29
    invoke-virtual {v0, v11, v2}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    move-result v0

    const-string v12, " providerName:"

    if-nez v0, :cond_5

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " processWidget not allowed bind , Removing invalid widget: oldId is -2, newAppWidgetId:"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->B()I

    move-result v0

    invoke-virtual {v5, v0}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 32
    new-instance v0, Lcom/android/launcher3/widget/Y0;

    iget-object v4, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-direct {v0, v4}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 33
    iget-object v4, v3, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 34
    iget-object v5, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 35
    invoke-virtual {v0, v4, v5}, Lcom/android/launcher3/widget/Y0;->d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;

    move-result-object v0

    .line 36
    invoke-static {v0}, Lz1/c2;->K(Landroid/appwidget/AppWidgetProviderInfo;)Z

    move-result v0

    .line 37
    iget-boolean v4, v1, Lz1/y5;->k:Z

    if-nez v4, :cond_4

    iget-object v4, v1, Lz1/y5;->w:Lz1/c2;

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Lz1/c2;->G()I

    move-result v4

    if-nez v4, :cond_4

    if-nez v0, :cond_4

    .line 38
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deleting widget that isn\'t installed anymore: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 40
    const-string v2, "missing_widget_provider"

    .line 41
    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 42
    :cond_4
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v2, v1, Lz1/y5;->l:Lz1/y0;

    iget-object v1, v1, Lz1/y5;->b:Lz1/B1;

    invoke-virtual {v0, v3, v2, v1}, Lz1/y1;->d(Lcom/android/launcher3/model/data/y;Lz1/y0;Lz1/B1;)V

    .line 43
    iget v0, v3, Lcom/android/launcher3/model/data/A;->g:I

    iget v1, v3, Lcom/android/launcher3/model/data/y;->id:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processWidget appWidgetId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "  id:"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 44
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "processWidget allowed bind, oldId is -2, newAppWidgetId:"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->l0()Lcom/android/launcher3/util/G;

    move-result-object v0

    .line 46
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 47
    invoke-virtual {v0, v9, v5}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    move-result-object v5

    .line 48
    invoke-virtual {v5}, Lcom/android/launcher3/util/G;->b()I

    .line 49
    :try_start_0
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 50
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 51
    :cond_6
    :goto_0
    iget-object v0, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/launcher3/widget/l0;->L(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;

    move-result-object v0

    invoke-static {v0, v10}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v5, 0x20

    .line 52
    invoke-virtual {v3, v5}, Lcom/android/launcher3/model/data/A;->y(I)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 53
    iget-object v5, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v5}, Lz1/y1;->h0()Landroid/content/Intent;

    move-result-object v5

    iput-object v5, v3, Lcom/android/launcher3/model/data/A;->k:Landroid/content/Intent;

    .line 54
    :cond_7
    iget-object v5, v1, Lz1/y5;->p:Lcom/android/launcher3/widget/V0;

    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    move-result-object v10

    const-string v11, "getModelWriter(...)"

    invoke-static {v10, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5, v3, v0, v10}, Lcom/android/launcher3/widget/V0;->b(Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/l0;Lz1/J3;)Lcom/android/launcher3/widget/V0$b;

    move-result-object v5

    .line 55
    invoke-virtual {v5}, Lcom/android/launcher3/widget/V0$b;->i()Z

    move-result v0

    .line 56
    invoke-virtual {v5}, Lcom/android/launcher3/widget/V0$b;->h()Lcom/android/launcher3/widget/U;

    move-result-object v10

    .line 57
    iget-object v11, v1, Lz1/y5;->a:Lz1/y1;

    iget v12, v11, Lz1/y1;->M:I

    .line 58
    invoke-virtual {v11}, Lz1/y1;->B()I

    move-result v11

    .line 59
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "processWidget: id="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ", appWidgetId="

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ", inflationResult="

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 60
    invoke-static {v6, v11}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-virtual {v5}, Lcom/android/launcher3/widget/V0$b;->g()I

    move-result v11

    if-eqz v11, :cond_12

    const-string v13, ", component="

    if-eq v11, v8, :cond_9

    const/4 v4, 0x2

    if-eq v11, v4, :cond_8

    goto :goto_1

    .line 62
    :cond_8
    iget v4, v3, Lcom/android/launcher3/model/data/A;->g:I

    .line 63
    iget-object v11, v1, Lz1/y5;->h:Landroid/content/Context;

    .line 64
    iget v12, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 65
    iget v14, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 66
    invoke-static {v4, v10, v11, v12, v14}, Lr2/b;->j(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/content/Context;II)V

    :goto_1
    move-object/from16 v17, v5

    goto/16 :goto_5

    .line 67
    :cond_9
    iget-object v11, v1, Lz1/y5;->u:Lcom/android/launcher3/util/L1;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v14

    iget-object v15, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v15, v15, Lz1/y1;->L:Landroid/os/UserHandle;

    invoke-virtual {v11, v14, v15}, Lcom/android/launcher3/util/L1;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 68
    iget-object v11, v1, Lz1/y5;->n:Ljava/util/HashMap;

    iget-object v14, v1, Lz1/y5;->u:Lcom/android/launcher3/util/L1;

    invoke-virtual {v11, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/pm/PackageInstaller$SessionInfo;

    .line 69
    new-instance v14, Lcom/android/launcher3/util/k;

    iget-object v15, v1, Lz1/y5;->h:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    move/from16 v16, v0

    const-string v0, "getPackageName(...)"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v0, v0, Lz1/y1;->L:Landroid/os/UserHandle;

    move-object/from16 v17, v5

    const-string v5, "user"

    invoke-static {v0, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v14, v15, v8, v0}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    invoke-virtual {v14}, Lcom/android/launcher3/util/k;->j()Z

    move-result v0

    .line 70
    iget-object v5, v1, Lz1/y5;->a:Lz1/y1;

    const/16 v8, 0x8

    invoke-virtual {v5, v8}, Lz1/y1;->a0(I)Z

    move-result v5

    if-nez v5, :cond_a

    .line 71
    iget-boolean v5, v1, Lz1/y5;->k:Z

    if-nez v5, :cond_a

    if-nez v11, :cond_a

    if-nez v10, :cond_a

    if-nez v0, :cond_a

    .line 72
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 73
    iget v3, v0, Lz1/y1;->M:I

    .line 74
    invoke-virtual {v0}, Lz1/y1;->B()I

    move-result v4

    .line 75
    iget-object v1, v1, Lz1/y5;->a:Lz1/y1;

    iget v1, v1, Lz1/y1;->P:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "processWidget: Unrestored Pending widget removed: id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", restoreFlag:="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 76
    const-string v2, "unrestored_pending_widget"

    .line 77
    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 78
    :cond_a
    iget-object v5, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v5, v8}, Lz1/y1;->a0(I)Z

    move-result v5

    if-nez v5, :cond_b

    if-eqz v11, :cond_b

    .line 79
    iget v4, v3, Lcom/android/launcher3/model/data/A;->i:I

    or-int/2addr v4, v8

    .line 80
    iput v4, v3, Lcom/android/launcher3/model/data/A;->i:I

    const/16 v16, 0x1

    goto :goto_2

    .line 81
    :cond_b
    iget-boolean v5, v1, Lz1/y5;->v:Z

    if-eqz v5, :cond_c

    iget-boolean v5, v1, Lz1/y5;->k:Z

    if-nez v5, :cond_c

    .line 82
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UnRestored widget removed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 84
    invoke-virtual {v0, v1, v4}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_c
    :goto_2
    const/4 v4, 0x0

    if-nez v11, :cond_d

    move v5, v4

    goto :goto_3

    .line 85
    :cond_d
    invoke-virtual {v11}, Landroid/content/pm/PackageInstaller$SessionInfo;->getProgress()F

    move-result v5

    const/16 v8, 0x64

    int-to-float v8, v8

    mul-float/2addr v5, v8

    float-to-int v5, v5

    .line 86
    :goto_3
    iput v5, v3, Lcom/android/launcher3/model/data/A;->j:I

    .line 87
    iget-object v5, v1, Lz1/y5;->h:Landroid/content/Context;

    .line 88
    iget-object v8, v3, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 89
    iget-object v11, v3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 90
    invoke-static {v5, v8, v11}, Lz1/u5;->r(Landroid/content/Context;Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/B;

    move-result-object v5

    .line 91
    iput-object v5, v3, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    if-eqz v0, :cond_e

    .line 92
    invoke-static {}, Lcom/android/launcher3/y0;->C0()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 93
    sget-object v0, Lt1/g;->d:Lt1/g;

    const/4 v5, 0x0

    const/4 v8, 0x1

    invoke-static {v0, v4, v8, v5}, Lt1/g;->i(Lt1/g;ZILjava/lang/Object;)Lt1/g;

    move-result-object v0

    goto :goto_4

    .line 94
    :cond_e
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 95
    :goto_4
    iget-object v4, v1, Lz1/y5;->j:Ls1/P;

    iget-object v5, v3, Lcom/android/launcher3/model/data/A;->m:Lcom/android/launcher3/model/data/B;

    invoke-virtual {v4, v5, v0}, Ls1/P;->I0(Lcom/android/launcher3/model/data/B;Lt1/g;)V

    move/from16 v0, v16

    :goto_5
    if-eqz v0, :cond_f

    .line 96
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->l0()Lcom/android/launcher3/util/G;

    move-result-object v0

    .line 97
    const-string v4, "appWidgetProvider"

    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/android/launcher3/util/G;->t(Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/G;

    move-result-object v4

    .line 98
    iget v5, v3, Lcom/android/launcher3/model/data/A;->g:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v9, v5}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    move-result-object v4

    .line 99
    iget v5, v3, Lcom/android/launcher3/model/data/A;->i:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const-string v8, "restored"

    invoke-virtual {v4, v8, v5}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    move-result-object v4

    .line 100
    invoke-virtual {v4}, Lcom/android/launcher3/util/G;->b()I

    .line 101
    :try_start_1
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_6

    :catch_1
    move-exception v0

    .line 102
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_f
    :goto_6
    if-eqz v10, :cond_11

    .line 103
    iget-object v0, v1, Lz1/y5;->m:Ljava/util/Map;

    new-instance v4, Lcom/android/launcher3/util/E;

    iget-object v5, v10, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    invoke-virtual {v10}, Lcom/android/launcher3/widget/U;->e()Landroid/os/UserHandle;

    move-result-object v8

    invoke-direct {v4, v5, v8}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    invoke-virtual/range {v17 .. v17}, Lcom/android/launcher3/widget/V0$b;->h()Lcom/android/launcher3/widget/U;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    iget v0, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    iget v4, v10, Lcom/android/launcher3/widget/U;->i:I

    if-lt v0, v4, :cond_10

    iget v0, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    iget v4, v10, Lcom/android/launcher3/widget/U;->j:I

    if-ge v0, v4, :cond_11

    .line 105
    :cond_10
    invoke-virtual {v10}, Lcom/android/launcher3/widget/U;->g()Landroid/content/ComponentName;

    move-result-object v0

    iget v4, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    iget v5, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    iget v8, v10, Lcom/android/launcher3/widget/U;->i:I

    iget v9, v10, Lcom/android/launcher3/widget/U;->j:I

    .line 106
    iget-object v11, v1, Lz1/y5;->a:Lz1/y1;

    iget v12, v11, Lz1/y1;->M:I

    .line 107
    invoke-virtual {v11}, Lz1/y1;->B()I

    move-result v11

    .line 108
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " processWidget: Widget "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " minSizes not met: span="

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " minSpan="

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", id: "

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", appWidgetId: "

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    invoke-static {v6, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    sget-object v0, Lz1/y5;->z:Lz1/y5$a;

    iget-object v2, v1, Lz1/y5;->i:Lcom/android/launcher3/F1;

    invoke-static {v0, v2, v10}, Lz1/y5$a;->a(Lz1/y5$a;Lcom/android/launcher3/F1;Lcom/android/launcher3/widget/U;)V

    .line 111
    :cond_11
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v2, v1, Lz1/y5;->l:Lz1/y0;

    iget-object v4, v1, Lz1/y5;->b:Lz1/B1;

    invoke-virtual {v0, v3, v2, v4}, Lz1/y1;->d(Lcom/android/launcher3/model/data/y;Lz1/y0;Lz1/B1;)V

    .line 112
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual {v0}, Lz1/y1;->J()I

    move-result v0

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_14

    const/4 v8, 0x1

    .line 113
    invoke-virtual {v3, v8}, Lcom/android/launcher3/model/data/y;->setShortcutAddFromOtherApp(Z)V

    goto :goto_7

    :cond_12
    move-object/from16 v17, v5

    .line 114
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    invoke-virtual/range {v17 .. v17}, Lcom/android/launcher3/widget/V0$b;->e()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {v17 .. v17}, Lcom/android/launcher3/widget/V0$b;->f()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 115
    :cond_13
    iget-object v0, v1, Lz1/y5;->a:Lz1/y1;

    iget-object v2, v1, Lz1/y5;->l:Lz1/y0;

    iget-object v1, v1, Lz1/y5;->b:Lz1/B1;

    invoke-virtual {v0, v3, v2, v1}, Lz1/y1;->d(Lcom/android/launcher3/model/data/y;Lz1/y0;Lz1/B1;)V

    .line 116
    iget v0, v3, Lcom/android/launcher3/model/data/A;->g:I

    if-ne v0, v5, :cond_14

    .line 117
    iget-object v0, v3, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processWidget appWidgetId -2, providerName:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_14
    :goto_7
    return-void

    .line 118
    :cond_15
    :goto_8
    iget-object v1, v1, Lz1/y5;->a:Lz1/y1;

    .line 119
    iget v3, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 120
    iget v4, v1, Lz1/y1;->M:I

    .line 121
    invoke-virtual {v1}, Lz1/y1;->B()I

    move-result v8

    .line 122
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "processWidget: Widget has invalid size: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", id="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 123
    const-string v2, "invalid_widget_size"

    .line 124
    invoke-virtual {v1, v0, v2}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private final g(LN1/e;)Landroid/content/pm/ShortcutInfo;
    .locals 4

    .line 1
    invoke-virtual {p1}, LN1/e;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, LN1/e;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v3, "retryDeepShortcutById: package="

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, ", shortcutId="

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "WorkspaceItemProcessor"

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lz1/y5;->e:Landroid/content/pm/LauncherApps;

    .line 40
    .line 41
    new-instance v0, Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 42
    .line 43
    invoke-direct {v0}, Landroid/content/pm/LauncherApps$ShortcutQuery;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, LN1/e;->f()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/content/pm/LauncherApps$ShortcutQuery;->setPackage(Ljava/lang/String;)Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, LN1/e;->e()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/content/pm/LauncherApps$ShortcutQuery;->setShortcutIds(Ljava/util/List;)Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 62
    .line 63
    .line 64
    const/16 v1, 0xb

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/pm/LauncherApps$ShortcutQuery;->setQueryFlags(I)Landroid/content/pm/LauncherApps$ShortcutQuery;

    .line 67
    .line 68
    .line 69
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 70
    .line 71
    invoke-virtual {p0, v0, p1}, Landroid/content/pm/LauncherApps;->getShortcuts(Landroid/content/pm/LauncherApps$ShortcutQuery;Landroid/os/UserHandle;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    if-eqz p0, :cond_0

    .line 76
    .line 77
    invoke-static {p0}, Li4/m;->d0(Ljava/util/List;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, Landroid/content/pm/ShortcutInfo;

    .line 82
    .line 83
    return-object p0

    .line 84
    :cond_0
    const/4 p0, 0x0

    .line 85
    return-object p0
.end method


# virtual methods
.method public final e()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lz1/y5;->a:Lz1/y1;

    .line 2
    .line 3
    iget-object v1, v0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget p0, v0, Lz1/y1;->M:I

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "User has been deleted for item id="

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v1, "user_profile_deleted"

    .line 27
    .line 28
    invoke-virtual {v0, p0, v1}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget v1, v0, Lz1/y1;->O:I

    .line 33
    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    if-eq v1, v2, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x2

    .line 40
    if-eq v1, v0, :cond_2

    .line 41
    .line 42
    const/4 v0, 0x4

    .line 43
    if-eq v1, v0, :cond_1

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    if-eq v1, v0, :cond_1

    .line 47
    .line 48
    const/4 v0, 0x6

    .line 49
    if-eq v1, v0, :cond_4

    .line 50
    .line 51
    const/16 v0, 0xa

    .line 52
    .line 53
    if-eq v1, v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-direct {p0}, Lz1/y5;->f()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    invoke-direct {p0}, Lz1/y5;->d()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    iget p0, v0, Lz1/y1;->M:I

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v2, "item type is shortcut, id="

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string v1, "item_type_shortcut"

    .line 84
    .line 85
    invoke-virtual {v0, p0, v1}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    invoke-direct {p0}, Lz1/y5;->c()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catch_0
    move-exception p0

    .line 94
    const-string v0, "WorkspaceItemProcessor"

    .line 95
    .line 96
    const-string v1, "Desktop items loading interrupted"

    .line 97
    .line 98
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    .line 100
    .line 101
    :goto_0
    return-void
.end method

.method public final h(Lz1/c2;)V
    .locals 1

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lz1/y5;->w:Lz1/c2;

    .line 7
    .line 8
    return-void
.end method

.method public final i(Landroid/os/UserManager;)V
    .locals 1

    .line 1
    const-string v0, "um"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lz1/y5;->x:Landroid/os/UserManager;

    .line 7
    .line 8
    return-void
.end method
