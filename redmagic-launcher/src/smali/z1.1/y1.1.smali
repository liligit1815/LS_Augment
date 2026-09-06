.class public Lz1/y1;
.super Landroid/database/CursorWrapper;
.source "LoaderCursor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/y1$a;
    }
.end annotation


# instance fields
.field private final A:I

.field private final B:I

.field private final C:I

.field private final D:I

.field private final E:I

.field private final F:I

.field private final G:I

.field private final H:I

.field private final I:I

.field private J:Landroid/content/pm/LauncherActivityInfo;

.field public K:J

.field public L:Landroid/os/UserHandle;

.field public M:I

.field public N:I

.field public O:I

.field public P:I

.field private final Q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Landroid/content/Context;

.field private final i:Lcom/android/launcher3/D3;

.field private final j:Lcom/android/launcher3/util/J1;

.field private final k:Ls1/P;

.field private final l:Lcom/android/launcher3/F1;

.field private final m:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

.field private final n:Lcom/android/launcher3/util/x0;

.field private final o:Lcom/android/launcher3/util/x0;

.field private final p:Lcom/android/launcher3/util/A0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/util/t0;",
            ">;"
        }
    .end annotation
.end field

.field private final q:Lcom/android/launcher3/util/A0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/m;",
            ">;"
        }
    .end annotation
.end field

.field private final r:I

.field public final s:I

.field private final t:I

.field private final u:I

.field private final v:I

.field private final w:I

.field private final x:I

.field private final y:I

.field private final z:I


# direct methods
.method public constructor <init>(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;Landroid/content/Context;Ls1/P;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lcom/android/launcher3/util/J1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/util/x0;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lz1/y1;->n:Lcom/android/launcher3/util/x0;

    .line 10
    .line 11
    new-instance p1, Lcom/android/launcher3/util/x0;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lz1/y1;->o:Lcom/android/launcher3/util/x0;

    .line 17
    .line 18
    new-instance p1, Lcom/android/launcher3/util/A0;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/android/launcher3/util/A0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lz1/y1;->p:Lcom/android/launcher3/util/A0;

    .line 24
    .line 25
    new-instance p1, Lcom/android/launcher3/util/A0;

    .line 26
    .line 27
    invoke-direct {p1}, Lcom/android/launcher3/util/A0;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lz1/y1;->q:Lcom/android/launcher3/util/A0;

    .line 31
    .line 32
    new-instance p1, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lz1/y1;->Q:Ljava/util/HashMap;

    .line 38
    .line 39
    iput-object p4, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 40
    .line 41
    iput-object p5, p0, Lz1/y1;->k:Ls1/P;

    .line 42
    .line 43
    iput-object p6, p0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 44
    .line 45
    iput-object p7, p0, Lz1/y1;->i:Lcom/android/launcher3/D3;

    .line 46
    .line 47
    iput-object p8, p0, Lz1/y1;->j:Lcom/android/launcher3/util/J1;

    .line 48
    .line 49
    iget-object p1, p2, Lz1/L4;->a:Landroid/util/LongSparseArray;

    .line 50
    .line 51
    iput-object p1, p0, Lz1/y1;->g:Landroid/util/LongSparseArray;

    .line 52
    .line 53
    iput-object p3, p0, Lz1/y1;->m:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 54
    .line 55
    const-string p1, "icon"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, p0, Lz1/y1;->r:I

    .line 62
    .line 63
    const-string p1, "title"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, p0, Lz1/y1;->s:I

    .line 70
    .line 71
    const-string p1, "_id"

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iput p1, p0, Lz1/y1;->t:I

    .line 78
    .line 79
    const-string p1, "container"

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lz1/y1;->u:I

    .line 86
    .line 87
    const-string p1, "itemType"

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iput p1, p0, Lz1/y1;->v:I

    .line 94
    .line 95
    const-string p1, "screen"

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iput p1, p0, Lz1/y1;->w:I

    .line 102
    .line 103
    const-string p1, "cellX"

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput p1, p0, Lz1/y1;->x:I

    .line 110
    .line 111
    const-string p1, "cellY"

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput p1, p0, Lz1/y1;->y:I

    .line 118
    .line 119
    const-string p1, "profileId"

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iput p1, p0, Lz1/y1;->z:I

    .line 126
    .line 127
    const-string p1, "restored"

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iput p1, p0, Lz1/y1;->A:I

    .line 134
    .line 135
    const-string p1, "intent"

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    iput p1, p0, Lz1/y1;->B:I

    .line 142
    .line 143
    const-string p1, "appWidgetId"

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    iput p1, p0, Lz1/y1;->C:I

    .line 150
    .line 151
    const-string p1, "appWidgetProvider"

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    iput p1, p0, Lz1/y1;->D:I

    .line 158
    .line 159
    const-string p1, "spanX"

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    iput p1, p0, Lz1/y1;->E:I

    .line 166
    .line 167
    const-string p1, "spanY"

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    iput p1, p0, Lz1/y1;->F:I

    .line 174
    .line 175
    const-string p1, "rank"

    .line 176
    .line 177
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    iput p1, p0, Lz1/y1;->G:I

    .line 182
    .line 183
    const-string p1, "options"

    .line 184
    .line 185
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    iput p1, p0, Lz1/y1;->H:I

    .line 190
    .line 191
    const-string p1, "appWidgetSource"

    .line 192
    .line 193
    invoke-virtual {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    iput p1, p0, Lz1/y1;->I:I

    .line 198
    .line 199
    return-void
.end method

.method private E()Lcom/android/launcher3/b0;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private i0(Lcom/android/launcher3/b0;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const-string p0, "LoaderCursor"

    .line 5
    .line 6
    const-string p1, "setRowsAndColumnsWhenError--esktopGrid == null"

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    iget-object v1, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lcom/android/launcher3/b0;->k(Landroid/content/Context;)Landroid/graphics/Point;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 21
    .line 22
    iget v0, p1, Landroid/graphics/Point;->y:I

    .line 23
    .line 24
    iput v0, p0, Lcom/android/launcher3/F1;->H0:I

    .line 25
    .line 26
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 27
    .line 28
    iput p1, p0, Lcom/android/launcher3/F1;->G0:I

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    return v0
.end method


# virtual methods
.method public A(Landroid/content/Intent;ZZZ)Lcom/android/launcher3/model/data/I;
    .locals 5

    .line 1
    iget-object v0, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 2
    .line 3
    const-string v1, "LoaderCursor"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p0, "Null user found in getShortcutInfo"

    .line 9
    .line 10
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    return-object v2

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    const-string p0, "Missing component found in getShortcutInfo"

    .line 21
    .line 22
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    return-object v2

    .line 26
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 27
    .line 28
    const-string v3, "android.intent.action.MAIN"

    .line 29
    .line 30
    invoke-direct {v0, v3, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 31
    .line 32
    .line 33
    const-string v3, "android.intent.category.LAUNCHER"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 42
    .line 43
    const-class v4, Landroid/content/pm/LauncherApps;

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Landroid/content/pm/LauncherApps;

    .line 50
    .line 51
    iget-object v4, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 52
    .line 53
    invoke-virtual {v3, v0, v4}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iput-object v3, p0, Lz1/y1;->J:Landroid/content/pm/LauncherActivityInfo;

    .line 58
    .line 59
    if-nez v3, :cond_2

    .line 60
    .line 61
    if-nez p2, :cond_2

    .line 62
    .line 63
    iget-object p2, p0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 64
    .line 65
    iget-object v3, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 66
    .line 67
    invoke-virtual {p2, p1, v3}, Lcom/android/launcher3/r4;->y(Landroid/content/ComponentName;Landroid/content/Context;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-nez p2, :cond_2

    .line 72
    .line 73
    new-instance p0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string p2, "Missing activity found in getShortcutInfo: "

    .line 79
    .line 80
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return-object v2

    .line 94
    :cond_2
    new-instance p2, Lcom/android/launcher3/model/data/I;

    .line 95
    .line 96
    invoke-direct {p2}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 100
    .line 101
    iput-object v1, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 102
    .line 103
    iput-object v0, p2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 104
    .line 105
    iget-object v0, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 106
    .line 107
    invoke-static {v0}, LD1/t;->k(Landroid/content/Context;)LD1/t;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v1, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 112
    .line 113
    invoke-virtual {v0, v1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v1, p0, Lz1/y1;->J:Landroid/content/pm/LauncherActivityInfo;

    .line 118
    .line 119
    if-eqz v1, :cond_3

    .line 120
    .line 121
    sget-object v2, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 122
    .line 123
    iget-object v3, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 124
    .line 125
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Lcom/android/launcher3/util/f;

    .line 130
    .line 131
    iget-object v3, p0, Lz1/y1;->j:Lcom/android/launcher3/util/J1;

    .line 132
    .line 133
    invoke-static {p2, v1, v0, v2, v3}, Lcom/android/launcher3/model/data/d;->T(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lcom/android/launcher3/util/N2;Lcom/android/launcher3/util/f;Lcom/android/launcher3/util/J1;)Z

    .line 134
    .line 135
    .line 136
    :cond_3
    invoke-virtual {p0, p3, p4, p2}, Lz1/y1;->e0(ZZLcom/android/launcher3/model/data/I;)V

    .line 137
    .line 138
    .line 139
    iget-object p3, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 140
    .line 141
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    if-eqz p3, :cond_5

    .line 146
    .line 147
    if-eqz p4, :cond_4

    .line 148
    .line 149
    invoke-virtual {p0}, Lz1/y1;->U()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    iput-object p3, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 154
    .line 155
    if-nez p3, :cond_5

    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_4
    const-string p1, ""

    .line 165
    .line 166
    iput-object p1, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 167
    .line 168
    :cond_5
    :goto_0
    iget-object p0, p0, Lz1/y1;->k:Ls1/P;

    .line 169
    .line 170
    iget-object p1, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 171
    .line 172
    iget-object p3, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 173
    .line 174
    invoke-virtual {p0, p1, p3}, Lt1/f;->D(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    iput-object p0, p2, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 179
    .line 180
    return-object p2
.end method

.method public B()I
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->C:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public C()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->D:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public D()I
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->I:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public F()[B
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->r:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getBlob(I)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public I()Landroid/content/pm/LauncherActivityInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/y1;->J:Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public J()I
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->H:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public L()I
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->G:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public M(Landroid/content/Intent;Z)Lcom/android/launcher3/model/data/I;
    .locals 5

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 9
    .line 10
    iput-object p1, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 11
    .line 12
    iget-object v1, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->f0()Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x2

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lz1/y1;->a0(I)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_0

    .line 40
    .line 41
    invoke-static {v1}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0, v0}, Lz1/y1;->c0(Lcom/android/launcher3/model/data/I;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v3, "loadIconFromDb failed, getting from cache - intent="

    .line 60
    .line 61
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v1, "LoaderCursor"

    .line 72
    .line 73
    invoke-static {v1, p1}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lz1/y1;->k:Ls1/P;

    .line 77
    .line 78
    sget-object v1, Lt1/g;->d:Lt1/g;

    .line 79
    .line 80
    invoke-virtual {p1, v0, v1}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    iget-object p1, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 85
    .line 86
    invoke-static {p1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object v1, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object v3, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 101
    .line 102
    iget-object v3, v3, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 103
    .line 104
    invoke-virtual {v1, v3}, Lcom/android/launcher3/H5;->b0(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    if-eqz v1, :cond_2

    .line 109
    .line 110
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-nez v3, :cond_2

    .line 115
    .line 116
    iget-object v3, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 117
    .line 118
    invoke-static {v3, v1}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    new-instance v3, Ls1/b$c;

    .line 123
    .line 124
    invoke-direct {v3}, Ls1/b$c;-><init>()V

    .line 125
    .line 126
    .line 127
    iget-object v4, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 128
    .line 129
    invoke-virtual {v3, v4}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    const/4 v4, 0x0

    .line 134
    invoke-virtual {v3, v4}, Ls1/b$c;->b(Z)Ls1/b$c;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {p1, v1, v3}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iput-object v1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 143
    .line 144
    :cond_2
    invoke-virtual {p1}, Ls1/X;->n0()V

    .line 145
    .line 146
    .line 147
    :goto_0
    const/4 p1, 0x1

    .line 148
    invoke-virtual {p0, p1}, Lz1/y1;->a0(I)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-nez p1, :cond_5

    .line 153
    .line 154
    if-eqz p2, :cond_3

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_3
    invoke-virtual {p0, v2}, Lz1/y1;->a0(I)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_4

    .line 162
    .line 163
    iget-object p1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 164
    .line 165
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-eqz p1, :cond_6

    .line 170
    .line 171
    invoke-virtual {p0}, Lz1/y1;->U()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iput-object p1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_4
    new-instance p1, Ljava/security/InvalidParameterException;

    .line 179
    .line 180
    new-instance p2, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    const-string v0, "Invalid restoreType "

    .line 186
    .line 187
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget p0, p0, Lz1/y1;->P:I

    .line 191
    .line 192
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-direct {p1, p0}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    throw p1

    .line 203
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lz1/y1;->U()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-nez v1, :cond_6

    .line 212
    .line 213
    invoke-static {p1}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iput-object p1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 218
    .line 219
    :cond_6
    :goto_2
    iget-object p1, p0, Lz1/y1;->k:Ls1/P;

    .line 220
    .line 221
    iget-object v1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 222
    .line 223
    iget-object v2, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 224
    .line 225
    invoke-virtual {p1, v1, v2}, Lt1/f;->D(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iput-object p1, v0, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 230
    .line 231
    iget p1, p0, Lz1/y1;->O:I

    .line 232
    .line 233
    iput p1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 234
    .line 235
    iget p0, p0, Lz1/y1;->P:I

    .line 236
    .line 237
    iput p0, v0, Lcom/android/launcher3/model/data/I;->m:I

    .line 238
    .line 239
    if-eqz p2, :cond_7

    .line 240
    .line 241
    iget p0, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 242
    .line 243
    or-int/lit16 p0, p0, 0x4000

    .line 244
    .line 245
    iput p0, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 246
    .line 247
    :cond_7
    return-object v0
.end method

.method public P()I
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->E:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public T()I
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->F:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public U()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->s:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public a0(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lz1/y1;->P:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/y1;->Q:Ljava/util/HashMap;

    .line 2
    .line 3
    iget p0, p0, Lz1/y1;->M:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b0()Z
    .locals 1

    .line 1
    iget p0, p0, Lz1/y1;->N:I

    .line 2
    .line 3
    const/16 v0, -0x64

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, -0x65

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public c(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget v0, p0, Lz1/y1;->M:I

    .line 2
    .line 3
    iput v0, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 4
    .line 5
    iget v0, p0, Lz1/y1;->N:I

    .line 6
    .line 7
    iput v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 8
    .line 9
    iget v0, p0, Lz1/y1;->w:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 16
    .line 17
    iget v0, p0, Lz1/y1;->x:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 24
    .line 25
    iget v0, p0, Lz1/y1;->y:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    iput p0, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 32
    .line 33
    return-void
.end method

.method protected c0(Lcom/android/launcher3/model/data/I;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lz1/y1;->t(Lcom/android/launcher3/model/data/I;Z)Lcom/android/launcher3/model/data/q;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iget-object p0, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/launcher3/model/data/q;->a(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public d(Lcom/android/launcher3/model/data/y;Lz1/y0;Lz1/B1;)V
    .locals 6

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, LN1/e;->d(Lcom/android/launcher3/model/data/y;)LN1/e;

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 21
    .line 22
    const/4 v3, 0x5

    .line 23
    if-ne v0, v3, :cond_2

    .line 24
    .line 25
    iget-object v0, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    move v0, v2

    .line 34
    :goto_0
    iget-object v3, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 35
    .line 36
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-ge v0, v3, :cond_2

    .line 41
    .line 42
    iget-object v3, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 43
    .line 44
    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 49
    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    new-instance v4, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v5, "#custom-widget-"

    .line 64
    .line 65
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-class v5, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidget;

    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eqz v3, :cond_1

    .line 94
    .line 95
    move v0, v2

    .line 96
    goto :goto_1

    .line 97
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    const/4 v0, 0x1

    .line 101
    :goto_1
    iget-boolean v3, p2, Lz1/y0;->h:Z

    .line 102
    .line 103
    invoke-virtual {p0, p1, v3}, Lz1/y1;->e(Lcom/android/launcher3/model/data/y;Z)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_6

    .line 108
    .line 109
    if-eqz v0, :cond_6

    .line 110
    .line 111
    if-eqz p3, :cond_3

    .line 112
    .line 113
    const-string v0, "Adding item to ID map: %s"

    .line 114
    .line 115
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const/4 v3, 0x0

    .line 124
    const/4 v4, 0x3

    .line 125
    const-string v5, "LoaderCursor"

    .line 126
    .line 127
    invoke-virtual {p3, v4, v5, v0, v3}, Lz1/B1;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 128
    .line 129
    .line 130
    :cond_3
    iget-object p3, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 131
    .line 132
    invoke-virtual {p2, p3, p1, v2}, Lz1/y0;->k(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Z)V

    .line 133
    .line 134
    .line 135
    iget p3, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 136
    .line 137
    const/16 v0, 0xa

    .line 138
    .line 139
    if-eq p3, v0, :cond_4

    .line 140
    .line 141
    if-eq p3, v1, :cond_4

    .line 142
    .line 143
    if-nez p3, :cond_5

    .line 144
    .line 145
    :cond_4
    iget p3, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 146
    .line 147
    const/16 v0, -0x64

    .line 148
    .line 149
    if-eq p3, v0, :cond_5

    .line 150
    .line 151
    const/16 v0, -0x65

    .line 152
    .line 153
    if-eq p3, v0, :cond_5

    .line 154
    .line 155
    invoke-virtual {p0, p3, p2}, Lz1/y1;->v(ILz1/y0;)Lcom/android/launcher3/model/data/m;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {p2, p1}, Lcom/android/launcher3/model/data/m;->v(Lcom/android/launcher3/model/data/y;)V

    .line 160
    .line 161
    .line 162
    :cond_5
    iget-object p1, p0, Lz1/y1;->m:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 163
    .line 164
    if-eqz p1, :cond_7

    .line 165
    .line 166
    iget p0, p0, Lz1/y1;->O:I

    .line 167
    .line 168
    invoke-virtual {p1, p0}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->logSingleFavoritesItemRestored(I)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_6
    const-string p3, "Item position overlap"

    .line 173
    .line 174
    const-string v0, "overlapping_item"

    .line 175
    .line 176
    invoke-virtual {p0, p3, v0}, Lz1/y1;->f0(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    instance-of p0, p1, Lcom/android/launcher3/model/data/p;

    .line 180
    .line 181
    if-eqz p0, :cond_7

    .line 182
    .line 183
    iget-object p0, p2, Lz1/y0;->i:Ljava/util/ArrayList;

    .line 184
    .line 185
    check-cast p1, Lcom/android/launcher3/model/data/p;

    .line 186
    .line 187
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    :cond_7
    return-void
.end method

.method public d0()Lcom/android/launcher3/model/data/I;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/content/Intent;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 12
    .line 13
    iget-object v1, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 16
    .line 17
    iget v1, p0, Lz1/y1;->O:I

    .line 18
    .line 19
    iput v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 20
    .line 21
    invoke-virtual {p0}, Lz1/y1;->U()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lz1/y1;->c0(Lcom/android/launcher3/model/data/I;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lz1/y1;->k:Ls1/P;

    .line 34
    .line 35
    iget-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_0
    iget-object v1, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 45
    .line 46
    invoke-static {v1}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object p0, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 51
    .line 52
    iget-object v2, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 53
    .line 54
    iget-object v2, v2, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 55
    .line 56
    invoke-static {p0, v2}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-virtual {v1, p0, v2}, Ls1/b;->w(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iput-object p0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 70
    .line 71
    invoke-virtual {v1}, Ls1/X;->n0()V

    .line 72
    .line 73
    .line 74
    return-object v0
.end method

.method protected e(Lcom/android/launcher3/model/data/y;Z)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {}, Lx1/O;->k1()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x1

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    return v3

    .line 13
    :cond_0
    iget v2, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 14
    .line 15
    iget v4, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 16
    .line 17
    const-string v5, ") already occupied"

    .line 18
    .line 19
    const-string v6, ")"

    .line 20
    .line 21
    const-string v7, "Error loading shortcut "

    .line 22
    .line 23
    const/16 v8, -0x65

    .line 24
    .line 25
    const-string v9, ":"

    .line 26
    .line 27
    const-string v10, "LoaderCursor"

    .line 28
    .line 29
    const-string v11, ","

    .line 30
    .line 31
    const/4 v12, 0x0

    .line 32
    if-ne v4, v8, :cond_5

    .line 33
    .line 34
    sget-object v2, Lf1/a;->x:Lf1/a$a;

    .line 35
    .line 36
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const-string v4, " into position ("

    .line 41
    .line 42
    const-string v13, "Error loading shortcut into hotseat "

    .line 43
    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    iget-object v2, v0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 47
    .line 48
    iget v14, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 49
    .line 50
    invoke-virtual {v2, v14}, Lcom/android/launcher3/F1;->B0(I)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget v2, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget v1, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v1, ") occupied by all apps"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    return v12

    .line 104
    :cond_1
    iget-object v2, v0, Lz1/y1;->p:Lcom/android/launcher3/util/A0;

    .line 105
    .line 106
    invoke-virtual {v2, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Lcom/android/launcher3/util/t0;

    .line 111
    .line 112
    iget v14, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 113
    .line 114
    iget-object v15, v0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 115
    .line 116
    iget v15, v15, Lcom/android/launcher3/F1;->e1:I

    .line 117
    .line 118
    if-lt v14, v15, :cond_2

    .line 119
    .line 120
    new-instance v2, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v4, " into hotseat position "

    .line 132
    .line 133
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget v1, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 137
    .line 138
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v1, ", position out of bounds: (0 to "

    .line 142
    .line 143
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-object v0, v0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 147
    .line 148
    iget v0, v0, Lcom/android/launcher3/F1;->e1:I

    .line 149
    .line 150
    sub-int/2addr v0, v3

    .line 151
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    return v12

    .line 165
    :cond_2
    if-eqz v2, :cond_4

    .line 166
    .line 167
    iget-object v0, v2, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 168
    .line 169
    aget-object v0, v0, v14

    .line 170
    .line 171
    aget-boolean v2, v0, v12

    .line 172
    .line 173
    if-eqz v2, :cond_3

    .line 174
    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    iget v2, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 190
    .line 191
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 198
    .line 199
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    iget v1, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-static {v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    return v12

    .line 221
    :cond_3
    aput-boolean v3, v0, v12

    .line 222
    .line 223
    return v3

    .line 224
    :cond_4
    new-instance v2, Lcom/android/launcher3/util/t0;

    .line 225
    .line 226
    invoke-direct {v2, v15, v3}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 227
    .line 228
    .line 229
    iget-object v4, v2, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 230
    .line 231
    iget v1, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 232
    .line 233
    aget-object v1, v4, v1

    .line 234
    .line 235
    aput-boolean v3, v1, v12

    .line 236
    .line 237
    iget-object v0, v0, Lz1/y1;->p:Lcom/android/launcher3/util/A0;

    .line 238
    .line 239
    invoke-virtual {v0, v8, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    return v3

    .line 243
    :cond_5
    const/16 v8, -0x64

    .line 244
    .line 245
    if-eq v4, v8, :cond_6

    .line 246
    .line 247
    return v3

    .line 248
    :cond_6
    iget-object v4, v0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 249
    .line 250
    iget v13, v4, Lcom/android/launcher3/F1;->H0:I

    .line 251
    .line 252
    iget v4, v4, Lcom/android/launcher3/F1;->G0:I

    .line 253
    .line 254
    invoke-direct {v0}, Lz1/y1;->E()Lcom/android/launcher3/b0;

    .line 255
    .line 256
    .line 257
    move-result-object v14

    .line 258
    invoke-virtual {v14}, Lcom/android/launcher3/b0;->l()Z

    .line 259
    .line 260
    .line 261
    move-result v14

    .line 262
    const-string v15, "-"

    .line 263
    .line 264
    move/from16 p2, v12

    .line 265
    .line 266
    const-string v12, " into cell ("

    .line 267
    .line 268
    if-nez v14, :cond_c

    .line 269
    .line 270
    iget v14, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 271
    .line 272
    if-ne v14, v8, :cond_7

    .line 273
    .line 274
    iget v8, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 275
    .line 276
    if-ltz v8, :cond_8

    .line 277
    .line 278
    :cond_7
    iget v8, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 279
    .line 280
    if-ltz v8, :cond_8

    .line 281
    .line 282
    iget v14, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 283
    .line 284
    iget v3, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 285
    .line 286
    add-int/2addr v14, v3

    .line 287
    if-gt v14, v13, :cond_8

    .line 288
    .line 289
    iget v3, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 290
    .line 291
    add-int/2addr v8, v3

    .line 292
    if-le v8, v4, :cond_c

    .line 293
    .line 294
    :cond_8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    iget v2, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 315
    .line 316
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 323
    .line 324
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 331
    .line 332
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    const-string v2, ") out of screen bounds ( "

    .line 336
    .line 337
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    const-string v2, "x"

    .line 344
    .line 345
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    invoke-static {v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    .line 360
    .line 361
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 362
    .line 363
    if-ltz v2, :cond_b

    .line 364
    .line 365
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 366
    .line 367
    if-gez v2, :cond_9

    .line 368
    .line 369
    goto :goto_0

    .line 370
    :cond_9
    invoke-direct {v0}, Lz1/y1;->E()Lcom/android/launcher3/b0;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    invoke-direct {v0, v2}, Lz1/y1;->i0(Lcom/android/launcher3/b0;)Z

    .line 375
    .line 376
    .line 377
    move-result v2

    .line 378
    if-eqz v2, :cond_a

    .line 379
    .line 380
    invoke-direct {v0}, Lz1/y1;->E()Lcom/android/launcher3/b0;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    invoke-virtual {v0, v1}, Lcom/android/launcher3/b0;->b(Lcom/android/launcher3/model/data/y;)V

    .line 385
    .line 386
    .line 387
    :cond_a
    return v2

    .line 388
    :cond_b
    :goto_0
    return p2

    .line 389
    :cond_c
    iget-object v3, v0, Lz1/y1;->p:Lcom/android/launcher3/util/A0;

    .line 390
    .line 391
    iget v6, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 392
    .line 393
    invoke-virtual {v3, v6}, Lcom/android/launcher3/util/A0;->n(I)Z

    .line 394
    .line 395
    .line 396
    move-result v3

    .line 397
    if-nez v3, :cond_d

    .line 398
    .line 399
    new-instance v3, Lcom/android/launcher3/util/t0;

    .line 400
    .line 401
    invoke-direct {v3, v13, v4}, Lcom/android/launcher3/util/t0;-><init>(II)V

    .line 402
    .line 403
    .line 404
    iget v4, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 405
    .line 406
    iget-object v6, v0, Lz1/y1;->p:Lcom/android/launcher3/util/A0;

    .line 407
    .line 408
    invoke-virtual {v6, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 409
    .line 410
    .line 411
    :cond_d
    iget-object v3, v0, Lz1/y1;->p:Lcom/android/launcher3/util/A0;

    .line 412
    .line 413
    iget v4, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 414
    .line 415
    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 416
    .line 417
    .line 418
    move-result-object v3

    .line 419
    check-cast v3, Lcom/android/launcher3/util/t0;

    .line 420
    .line 421
    invoke-direct {v0}, Lz1/y1;->E()Lcom/android/launcher3/b0;

    .line 422
    .line 423
    .line 424
    move-result-object v4

    .line 425
    invoke-virtual {v4}, Lcom/android/launcher3/b0;->l()Z

    .line 426
    .line 427
    .line 428
    move-result v4

    .line 429
    if-eqz v4, :cond_e

    .line 430
    .line 431
    invoke-direct {v0}, Lz1/y1;->E()Lcom/android/launcher3/b0;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    iget-object v4, v0, Lz1/y1;->h:Landroid/content/Context;

    .line 436
    .line 437
    iget-object v0, v0, Lz1/y1;->l:Lcom/android/launcher3/F1;

    .line 438
    .line 439
    invoke-virtual {v2, v4, v0, v1, v3}, Lcom/android/launcher3/b0;->u(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/t0;)Z

    .line 440
    .line 441
    .line 442
    move-result v0

    .line 443
    return v0

    .line 444
    :cond_e
    iget v4, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 445
    .line 446
    iget v6, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 447
    .line 448
    iget v8, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 449
    .line 450
    iget v13, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 451
    .line 452
    invoke-virtual {v3, v4, v6, v8, v13}, Lcom/android/launcher3/util/t0;->d(IIII)Z

    .line 453
    .line 454
    .line 455
    move-result v4

    .line 456
    if-eqz v4, :cond_f

    .line 457
    .line 458
    const/4 v4, 0x1

    .line 459
    invoke-virtual {v3, v1, v4}, Lcom/android/launcher3/util/t0;->g(Lcom/android/launcher3/model/data/y;Z)V

    .line 460
    .line 461
    .line 462
    return v4

    .line 463
    :cond_f
    new-instance v3, Ljava/lang/StringBuilder;

    .line 464
    .line 465
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    iget v2, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 484
    .line 485
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 492
    .line 493
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    iget v2, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 500
    .line 501
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    iget v2, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 508
    .line 509
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    iget v1, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 516
    .line 517
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 518
    .line 519
    .line 520
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 521
    .line 522
    .line 523
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    invoke-static {v10, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    .line 529
    .line 530
    invoke-direct {v0}, Lz1/y1;->E()Lcom/android/launcher3/b0;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    invoke-direct {v0, v1}, Lz1/y1;->i0(Lcom/android/launcher3/b0;)Z

    .line 535
    .line 536
    .line 537
    move-result v0

    .line 538
    return v0
.end method

.method e0(ZZLcom/android/launcher3/model/data/I;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "LoaderCursor"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->C0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/z;->B()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v2, Lcom/android/launcher3/J3;->r:Lcom/android/launcher3/X;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0, p3}, Lz1/y1;->c0(Lcom/android/launcher3/model/data/I;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    new-instance p2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v0, "loadIconFromDb failed for pre-archived icon, loading from cache. Component="

    .line 53
    .line 54
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lz1/y1;->k:Ls1/P;

    .line 72
    .line 73
    iget-object p0, p0, Lz1/y1;->J:Landroid/content/pm/LauncherActivityInfo;

    .line 74
    .line 75
    sget-object v0, Lt1/g;->d:Lt1/g;

    .line 76
    .line 77
    invoke-virtual {v0, p1}, Lt1/g;->k(Z)Lt1/g;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p2, p3, p0, p1}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    if-eqz p2, :cond_1

    .line 86
    .line 87
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/z;->B()Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-nez p2, :cond_1

    .line 92
    .line 93
    iget-object p2, p0, Lz1/y1;->k:Ls1/P;

    .line 94
    .line 95
    iget-object v0, p0, Lz1/y1;->J:Landroid/content/pm/LauncherActivityInfo;

    .line 96
    .line 97
    sget-object v2, Lt1/g;->d:Lt1/g;

    .line 98
    .line 99
    invoke-virtual {v2, p1}, Lt1/g;->k(Z)Lt1/g;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p2, p3, v0, p1}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lz1/y1;->k:Ls1/P;

    .line 107
    .line 108
    iget-object p2, p3, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 109
    .line 110
    iget-object v0, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 111
    .line 112
    invoke-virtual {p1, p2, v0}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_1

    .line 117
    .line 118
    new-instance p1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string p2, "Default Icon found in cache, trying DB instead.  Component="

    .line 124
    .line 125
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, p3}, Lz1/y1;->c0(Lcom/android/launcher3/model/data/I;)Z

    .line 143
    .line 144
    .line 145
    :cond_1
    return-void
.end method

.method public f0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "LoaderCursor"

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lz1/y1;->n:Lcom/android/launcher3/util/x0;

    .line 7
    .line 8
    iget v0, p0, Lz1/y1;->M:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lz1/y1;->m:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget p0, p0, Lz1/y1;->O:I

    .line 18
    .line 19
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->logSingleFavoritesItemRestoreFailed(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public g()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/y1;->n:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lz1/y1;->i:Lcom/android/launcher3/D3;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "_id"

    .line 16
    .line 17
    iget-object p0, p0, Lz1/y1;->n:Lcom/android/launcher3/util/x0;

    .line 18
    .line 19
    invoke-static {v1, p0}, Lcom/android/launcher3/N5;->g(Ljava/lang/String;Lcom/android/launcher3/util/x0;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, p0, v1}, Lz1/k2;->m(Ljava/lang/String;[Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public g0()V
    .locals 2

    .line 1
    iget v0, p0, Lz1/y1;->P:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lz1/y1;->o:Lcom/android/launcher3/util/x0;

    .line 6
    .line 7
    iget v1, p0, Lz1/y1;->M:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lz1/y1;->P:I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public h0()Landroid/content/Intent;
    .locals 2

    .line 1
    iget v0, p0, Lz1/y1;->B:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/database/CursorWrapper;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    invoke-static {p0, v1}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    const-string p0, "LoaderCursor"

    .line 22
    .line 23
    const-string v1, "Error parsing Intent"

    .line 24
    .line 25
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public j()V
    .locals 4

    .line 1
    iget-object v0, p0, Lz1/y1;->o:Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/content/ContentValues;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "restored"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lz1/y1;->i:Lcom/android/launcher3/D3;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "_id"

    .line 31
    .line 32
    iget-object v3, p0, Lz1/y1;->o:Lcom/android/launcher3/util/x0;

    .line 33
    .line 34
    invoke-static {v2, v3}, Lcom/android/launcher3/N5;->g(Ljava/lang/String;Lcom/android/launcher3/util/x0;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v1, v0, v2, v3}, Lz1/k2;->m0(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Lz1/y1;->m:Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;->reportLauncherRestoreResults()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method j0()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lz1/y1;->E()Lcom/android/launcher3/b0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lz1/y1;->p:Lcom/android/launcher3/util/A0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/b0;->s(Lcom/android/launcher3/util/A0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k0(Lcom/android/launcher3/model/data/I;Z)V
    .locals 2

    .line 1
    iget-object p2, p0, Lz1/y1;->k:Ls1/P;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 8
    .line 9
    invoke-virtual {p2, v0, v1}, Lt1/f;->L(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lt1/f$a;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lz1/y1;->k:Ls1/P;

    .line 13
    .line 14
    sget-object p2, Lt1/g;->d:Lt1/g;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public l0()Lcom/android/launcher3/util/G;
    .locals 5

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/y1;->h:Landroid/content/Context;

    .line 4
    .line 5
    new-instance v2, Lcom/android/launcher3/util/G$a;

    .line 6
    .line 7
    iget-object v3, p0, Lz1/y1;->i:Lcom/android/launcher3/D3;

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget p0, p0, Lz1/y1;->M:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {p0}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v4, "_id= ?"

    .line 24
    .line 25
    invoke-direct {v2, v3, v4, p0}, Lcom/android/launcher3/util/G$a;-><init>(Lz1/k2;Ljava/lang/String;[Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/G$a;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public moveToNext()Z
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/database/CursorWrapper;->moveToNext()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lz1/y1;->J:Landroid/content/pm/LauncherActivityInfo;

    .line 9
    .line 10
    iget v1, p0, Lz1/y1;->v:I

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Lz1/y1;->O:I

    .line 17
    .line 18
    iget v1, p0, Lz1/y1;->u:I

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, p0, Lz1/y1;->N:I

    .line 25
    .line 26
    iget v1, p0, Lz1/y1;->t:I

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, p0, Lz1/y1;->M:I

    .line 33
    .line 34
    iget v1, p0, Lz1/y1;->z:I

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    int-to-long v1, v1

    .line 41
    iput-wide v1, p0, Lz1/y1;->K:J

    .line 42
    .line 43
    iget-object v3, p0, Lz1/y1;->g:Landroid/util/LongSparseArray;

    .line 44
    .line 45
    invoke-virtual {v3, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Landroid/os/UserHandle;

    .line 50
    .line 51
    iput-object v1, p0, Lz1/y1;->L:Landroid/os/UserHandle;

    .line 52
    .line 53
    iget v1, p0, Lz1/y1;->A:I

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Landroid/database/CursorWrapper;->getInt(I)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput v1, p0, Lz1/y1;->P:I

    .line 60
    .line 61
    :cond_0
    return v0
.end method

.method public n()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lz1/y1;->Q:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lz1/y1;->Q:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/util/Map$Entry;

    .line 30
    .line 31
    new-instance v2, Landroid/content/ContentValues;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ljava/lang/String;

    .line 41
    .line 42
    const-string v4, "title"

    .line 43
    .line 44
    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Lz1/y1;->i:Lcom/android/launcher3/D3;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    filled-new-array {v1}, [Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v4, "_id =?"

    .line 66
    .line 67
    invoke-virtual {v3, v2, v4, v1}, Lz1/k2;->m0(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :cond_1
    const/4 p0, 0x0

    .line 74
    return p0
.end method

.method public t(Lcom/android/launcher3/model/data/I;Z)Lcom/android/launcher3/model/data/q;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/I;",
            "Z)",
            "Lcom/android/launcher3/model/data/q<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation

    .line 1
    iget v0, p0, Lz1/y1;->O:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lz1/y1;->P:I

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->B()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/y0;->C0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lz1/y1;->F()[B

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_1
    new-instance v1, Lcom/android/launcher3/model/data/q;

    .line 30
    .line 31
    iget-object p0, p0, Lz1/y1;->J:Landroid/content/pm/LauncherActivityInfo;

    .line 32
    .line 33
    invoke-direct {v1, p1, p0, v0, p2}, Lcom/android/launcher3/model/data/q;-><init>(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;[BZ)V

    .line 34
    .line 35
    .line 36
    return-object v1
.end method

.method public v(ILz1/y0;)Lcom/android/launcher3/model/data/m;
    .locals 1

    .line 1
    iget-object p2, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    instance-of v0, p2, Lcom/android/launcher3/model/data/m;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p2, Lcom/android/launcher3/model/data/m;

    .line 14
    .line 15
    return-object p2

    .line 16
    :cond_0
    iget-object p2, p0, Lz1/y1;->q:Lcom/android/launcher3/util/A0;

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Lcom/android/launcher3/model/data/m;

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    return-object p2

    .line 27
    :cond_1
    new-instance p2, Lcom/android/launcher3/model/data/p;

    .line 28
    .line 29
    invoke-direct {p2}, Lcom/android/launcher3/model/data/p;-><init>()V

    .line 30
    .line 31
    .line 32
    iput p1, p2, Lcom/android/launcher3/model/data/y;->id:I

    .line 33
    .line 34
    iget-object p0, p0, Lz1/y1;->q:Lcom/android/launcher3/util/A0;

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-object p2
.end method

.method public w(Landroid/content/Intent;ZZ)Lcom/android/launcher3/model/data/I;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lz1/y1;->A(Landroid/content/Intent;ZZZ)Lcom/android/launcher3/model/data/I;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method
