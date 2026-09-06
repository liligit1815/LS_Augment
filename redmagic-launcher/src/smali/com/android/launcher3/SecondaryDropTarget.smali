.class public Lcom/android/launcher3/SecondaryDropTarget;
.super Lcom/android/launcher3/ButtonDropTarget;
.source "SecondaryDropTarget.java"

# interfaces
.implements Lcom/android/launcher3/L4;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/SecondaryDropTarget$a;
    }
.end annotation


# instance fields
.field private final G:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/os/UserHandle;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final H:Lcom/android/launcher3/logging/StatsLogManager;

.field private final I:Lcom/android/launcher3/c;

.field private J:Z

.field protected K:I

.field private L:Z

.field private M:Lcom/android/launcher3/BubbleTextView;

.field private N:Lcom/android/launcher3/n0$a;

.field private O:Lcom/android/launcher3/folder/Folder;

.field private P:Lcom/android/launcher3/folder/Folder;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/SecondaryDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/util/ArrayMap;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/util/ArrayMap;-><init>(I)V

    iput-object p2, p0, Lcom/android/launcher3/SecondaryDropTarget;->G:Landroid/util/ArrayMap;

    const/4 p2, -0x1

    .line 4
    iput p2, p0, Lcom/android/launcher3/SecondaryDropTarget;->K:I

    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/SecondaryDropTarget;->L:Z

    .line 6
    new-instance p2, Lcom/android/launcher3/c;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 7
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->H:Lcom/android/launcher3/logging/StatsLogManager;

    return-void
.end method

.method public static synthetic E(Lcom/zte/mifavor/launcher/adapter/compat/c;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x3e7

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method static bridge synthetic H(Lcom/android/launcher3/SecondaryDropTarget;)Lcom/android/launcher3/n0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/SecondaryDropTarget;->N:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    return-object p0
.end method

.method private K(Lcom/android/launcher3/logging/d;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->H:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget p0, p0, Lcom/android/launcher3/SecondaryDropTarget;->K:I

    .line 17
    .line 18
    const p2, 0x7f0b0068

    .line 19
    .line 20
    .line 21
    if-ne p0, p2, :cond_1

    .line 22
    .line 23
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->H:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 24
    .line 25
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const p2, 0x7f0b004e

    .line 30
    .line 31
    .line 32
    if-ne p0, p2, :cond_2

    .line 33
    .line 34
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->G:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 35
    .line 36
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method private L(Lcom/android/launcher3/model/data/y;Landroid/view/View;)I
    .locals 5

    .line 1
    instance-of v0, p2, Landroid/appwidget/AppWidgetHostView;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-direct {p0, p2}, Lcom/android/launcher3/SecondaryDropTarget;->M(Landroid/view/View;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const p0, 0x7f0b005f

    .line 13
    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    return v1

    .line 17
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->isPredictedItem()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_3

    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/y0;->W()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    const p0, 0x7f0b004e

    .line 31
    .line 32
    .line 33
    return p0

    .line 34
    :cond_3
    const p2, 0x7f0b0068

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p2}, Lcom/android/launcher3/SecondaryDropTarget;->setupUi(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->G:Landroid/util/ArrayMap;

    .line 41
    .line 42
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ljava/lang/Boolean;

    .line 49
    .line 50
    if-nez v0, :cond_6

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v2, "user"

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Landroid/os/UserManager;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/os/UserManager;->getUserRestrictions(Landroid/os/UserHandle;)Landroid/os/Bundle;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v2, "no_control_apps"

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_4

    .line 78
    .line 79
    const-string v2, "no_uninstall_apps"

    .line 80
    .line 81
    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_5

    .line 86
    .line 87
    :cond_4
    const/4 v3, 0x1

    .line 88
    :cond_5
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v2, p0, Lcom/android/launcher3/SecondaryDropTarget;->G:Landroid/util/ArrayMap;

    .line 93
    .line 94
    iget-object v3, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 95
    .line 96
    invoke-virtual {v2, v3, v0}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    :cond_6
    iget-object v2, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 100
    .line 101
    const-wide/16 v3, 0x1388

    .line 102
    .line 103
    invoke-virtual {v2, v3, v4}, Lcom/android/launcher3/c;->d(J)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 107
    .line 108
    invoke-virtual {v2, p0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_7

    .line 116
    .line 117
    return v1

    .line 118
    :cond_7
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_8

    .line 123
    .line 124
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v0}, LD1/t;->k(Landroid/content/Context;)LD1/t;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v2, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 133
    .line 134
    invoke-virtual {v0, v2}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lcom/android/launcher3/util/N2;->d()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_8

    .line 143
    .line 144
    return v1

    .line 145
    :cond_8
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 146
    .line 147
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_b

    .line 160
    .line 161
    instance-of v0, p1, Lcom/android/launcher3/model/data/p;

    .line 162
    .line 163
    if-eqz v0, :cond_9

    .line 164
    .line 165
    return p2

    .line 166
    :cond_9
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 167
    .line 168
    if-eqz v0, :cond_f

    .line 169
    .line 170
    move-object v0, p1

    .line 171
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 172
    .line 173
    iget v2, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 174
    .line 175
    if-nez v2, :cond_a

    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_a

    .line 182
    .line 183
    return p2

    .line 184
    :cond_a
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->n(Lcom/android/launcher3/model/data/y;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_f

    .line 189
    .line 190
    return p2

    .line 191
    :cond_b
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 192
    .line 193
    if-eqz v0, :cond_d

    .line 194
    .line 195
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 196
    .line 197
    if-nez v0, :cond_d

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Lcom/android/launcher3/SecondaryDropTarget;->k(Lcom/android/launcher3/model/data/y;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_d

    .line 204
    .line 205
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 206
    .line 207
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    sget-object v2, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 212
    .line 213
    invoke-virtual {v0, v2}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_d

    .line 218
    .line 219
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->t()Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_c

    .line 230
    .line 231
    goto :goto_0

    .line 232
    :cond_c
    return v1

    .line 233
    :cond_d
    :goto_0
    instance-of v0, p1, Lcom/android/launcher3/model/data/z;

    .line 234
    .line 235
    if-eqz v0, :cond_f

    .line 236
    .line 237
    move-object v0, p1

    .line 238
    check-cast v0, Lcom/android/launcher3/model/data/z;

    .line 239
    .line 240
    iget v0, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 241
    .line 242
    and-int/lit16 v2, v0, 0xc0

    .line 243
    .line 244
    if-eqz v2, :cond_f

    .line 245
    .line 246
    and-int/lit16 v0, v0, 0x80

    .line 247
    .line 248
    if-nez v0, :cond_f

    .line 249
    .line 250
    invoke-virtual {p0, p1}, Lcom/android/launcher3/SecondaryDropTarget;->k(Lcom/android/launcher3/model/data/y;)Z

    .line 251
    .line 252
    .line 253
    move-result p0

    .line 254
    if-eqz p0, :cond_e

    .line 255
    .line 256
    return p2

    .line 257
    :cond_e
    return v1

    .line 258
    :cond_f
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-static {p0, p1}, Lcom/android/launcher3/SecondaryDropTarget;->N(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    if-nez p0, :cond_10

    .line 267
    .line 268
    return v1

    .line 269
    :cond_10
    return p2
.end method

.method private M(Landroid/view/View;)I
    .locals 3

    .line 1
    instance-of v0, p1, Landroid/appwidget/AppWidgetHostView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Landroid/appwidget/AppWidgetHostView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v2, v0, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->u()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    and-int/lit8 p0, p0, 0x1

    .line 33
    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    return v1

    .line 37
    :cond_2
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_3
    :goto_0
    return v1
.end method

.method public static N(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget v1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object p1, v0

    .line 16
    move-object v1, p1

    .line 17
    :goto_0
    if-eqz v1, :cond_1

    .line 18
    .line 19
    const-class v2, Landroid/content/pm/LauncherApps;

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Landroid/content/pm/LauncherApps;

    .line 26
    .line 27
    invoke-virtual {p0, v1, p1}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 38
    .line 39
    and-int/lit8 p1, p1, 0x1

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_1
    return-object v0
.end method

.method private O(Lcom/android/launcher3/model/data/y;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/q0;->c(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private P()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->r()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static R(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;
    .locals 6

    .line 1
    const-string v0, "SecondaryDropTarget"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const p1, 0x7f140467

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 15
    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    const v3, 0x7f14017c

    .line 19
    .line 20
    .line 21
    :try_start_0
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {v3, v2}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "package"

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-static {v3, v4, v5}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "android.intent.extra.USER"

    .line 48
    .line 49
    iget-object v4, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 50
    .line 51
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v2, "start uninstall activity from drop target "

    .line 64
    .line 65
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v0, p0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    return-object p1

    .line 83
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string p1, "Failed to parse intent to start drop target uninstall activity for item="

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    return-object v1
.end method

.method private S(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;
    .locals 4

    .line 1
    instance-of v0, p3, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const p0, 0x7f1400e9

    .line 8
    .line 9
    .line 10
    invoke-static {p1, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 15
    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    invoke-virtual {p0, p3}, Lcom/android/launcher3/ButtonDropTarget;->n(Lcom/android/launcher3/model/data/y;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_1
    instance-of v0, p3, Lcom/android/launcher3/model/data/I;

    .line 26
    .line 27
    if-eqz v0, :cond_b

    .line 28
    .line 29
    if-eqz p3, :cond_2

    .line 30
    .line 31
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    move-object v0, v1

    .line 37
    :goto_0
    if-nez p2, :cond_3

    .line 38
    .line 39
    invoke-static {p1, v0}, Lcom/android/launcher3/util/J1;->k(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    const p0, 0x7f140467

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 53
    .line 54
    .line 55
    return-object v1

    .line 56
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->M:Lcom/android/launcher3/BubbleTextView;

    .line 57
    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_4
    iget p1, p3, Lcom/android/launcher3/model/data/y;->container:I

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    if-lez p1, :cond_5

    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/launcher3/SecondaryDropTarget;->O:Lcom/android/launcher3/folder/Folder;

    .line 71
    .line 72
    if-eqz v1, :cond_5

    .line 73
    .line 74
    iget-object v3, v1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 75
    .line 76
    iget v3, v3, Lcom/android/launcher3/model/data/y;->id:I

    .line 77
    .line 78
    if-ne p1, v3, :cond_5

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-gt p1, v0, :cond_5

    .line 85
    .line 86
    iget-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->O:Lcom/android/launcher3/folder/Folder;

    .line 87
    .line 88
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->setSuppressFolderDeletion(Z)V

    .line 91
    .line 92
    .line 93
    :cond_5
    instance-of p1, p3, Lcom/android/launcher3/model/data/I;

    .line 94
    .line 95
    if-eqz p1, :cond_6

    .line 96
    .line 97
    move-object p1, p3

    .line 98
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {v1, p1}, Lcom/android/launcher3/util/J1;->o(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    goto :goto_1

    .line 111
    :cond_6
    move p1, v2

    .line 112
    :goto_1
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    if-eqz v1, :cond_7

    .line 117
    .line 118
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    new-instance v3, Lcom/android/launcher3/I5;

    .line 123
    .line 124
    invoke-direct {v3, v1, p3}, Lcom/android/launcher3/I5;-><init>(Lcom/zte/mifavor/launcher/adapter/compat/c;Lcom/android/launcher3/model/data/y;)V

    .line 125
    .line 126
    .line 127
    iget-object p3, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 128
    .line 129
    invoke-virtual {v1, p3}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 130
    .line 131
    .line 132
    move-result p3

    .line 133
    const/16 v1, 0x3e7

    .line 134
    .line 135
    if-eq p3, v1, :cond_7

    .line 136
    .line 137
    iget-object p3, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 138
    .line 139
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 140
    .line 141
    .line 142
    move-result-object p3

    .line 143
    invoke-virtual {p3}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 144
    .line 145
    .line 146
    move-result-object p3

    .line 147
    invoke-virtual {p3}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    invoke-static {p3}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 152
    .line 153
    .line 154
    move-result-object p3

    .line 155
    invoke-interface {p3, v3}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    if-eqz p3, :cond_7

    .line 160
    .line 161
    move v2, v0

    .line 162
    :cond_7
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object p3

    .line 166
    const v0, 0x7f1402d3

    .line 167
    .line 168
    .line 169
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    if-eqz p1, :cond_8

    .line 178
    .line 179
    const v1, 0x7f1403da

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_8
    if-eqz v2, :cond_9

    .line 184
    .line 185
    const v1, 0x7f1400aa

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_9
    const v1, 0x7f1400a8

    .line 190
    .line 191
    .line 192
    :goto_2
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    if-eqz p1, :cond_a

    .line 197
    .line 198
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    const v1, 0x7f1400a6

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    goto :goto_3

    .line 210
    :cond_a
    const-string p1, ""

    .line 211
    .line 212
    :goto_3
    iget-object v1, p0, Lcom/android/launcher3/SecondaryDropTarget;->N:Lcom/android/launcher3/n0$a;

    .line 213
    .line 214
    invoke-virtual {p0, p3, v0, p1, v1}, Lcom/android/launcher3/ButtonDropTarget;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/n0$a;)V

    .line 215
    .line 216
    .line 217
    return-object p2

    .line 218
    :cond_b
    return-object v1
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->N:Lcom/android/launcher3/n0$a;

    .line 5
    .line 6
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Lcom/android/launcher3/Workspace;->c1(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->M:Lcom/android/launcher3/BubbleTextView;

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->O:Lcom/android/launcher3/folder/Folder;

    .line 27
    .line 28
    new-instance p1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string p2, "completeDrop: mRemoveBubbleTextView="

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/android/launcher3/SecondaryDropTarget;->M:Lcom/android/launcher3/BubbleTextView;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "SecondaryDropTarget"

    .line 48
    .line 49
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    iget-boolean p1, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 53
    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    iget-boolean p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->L:Z

    .line 57
    .line 58
    if-nez p1, :cond_0

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/android/launcher3/SecondaryDropTarget;->P()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const p2, 0x7f1400a0

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 78
    .line 79
    const p1, 0x7f080d8c

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    const/4 p1, 0x1

    .line 91
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method

.method protected Q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->K:I

    .line 2
    .line 3
    const v1, 0x7f0b005f

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/android/launcher3/SecondaryDropTarget;->M(Landroid/view/View;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/q0;->i(ILcom/android/launcher3/model/data/y;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0, p2}, Lcom/android/launcher3/SecondaryDropTarget;->N(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p0, p1, v0, p2}, Lcom/android/launcher3/SecondaryDropTarget;->S(Landroid/content/Context;Landroid/content/ComponentName;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public a(Lcom/android/launcher3/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/SecondaryDropTarget;->G:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/ArrayMap;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getAccessibilityAction()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/SecondaryDropTarget;->K:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 8
    .line 9
    instance-of p1, p0, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/SecondaryDropTarget$a;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->N:Lcom/android/launcher3/n0$a;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lcom/android/launcher3/SecondaryDropTarget;->O(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/SecondaryDropTarget;->Q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 34
    .line 35
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/q0;->g(Landroid/content/ComponentName;Lcom/android/launcher3/n0$a;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method protected k(Lcom/android/launcher3/model/data/y;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lx1/O;->Q3(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->k(Lcom/android/launcher3/model/data/y;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-static {v0}, Lh2/c;->c(Landroid/content/Context;)Lh2/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lh2/c;->k()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lh2/c;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x1

    .line 28
    const/4 v3, 0x0

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lh2/c;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move v0, v3

    .line 39
    goto :goto_1

    .line 40
    :cond_2
    :goto_0
    move v0, v2

    .line 41
    :goto_1
    invoke-super {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->k(Lcom/android/launcher3/model/data/y;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    return v2

    .line 50
    :cond_3
    return v3
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->J:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 9
    .line 10
    const-wide/16 v1, 0x1388

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/c;->d(J)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->J:Z

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/c;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/c;->b()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->I:Lcom/android/launcher3/c;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->J:Z

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/ButtonDropTarget;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0068

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/SecondaryDropTarget;->setupUi(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/logging/f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p0, v0, p2}, Lcom/android/launcher3/SecondaryDropTarget;->K(Lcom/android/launcher3/logging/d;Lcom/android/launcher3/model/data/y;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/SecondaryDropTarget;->Q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method protected r(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 2
    .line 3
    instance-of v0, p1, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/SecondaryDropTarget$a;->b()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const-string p1, "SecondaryDropTarget"

    .line 22
    .line 23
    const-string v0, "onDialogNegativeClicked set mWaitingUninstallFolder null"

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method protected s(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "onDialogPositiveClicked mWaitingUninstallFolder != null, getItemCount="

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v1, "SecondaryDropTarget"

    .line 30
    .line 31
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v1, 0x1

    .line 41
    if-gt p1, v1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->setSuppressFolderDeletion(Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->L0()V

    .line 51
    .line 52
    .line 53
    :cond_0
    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->P:Lcom/android/launcher3/folder/Folder;

    .line 55
    .line 56
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const v1, 0x7f1400c6

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-array v1, v0, [Ljava/lang/Object;

    .line 86
    .line 87
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 92
    .line 93
    invoke-static {v1, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/Workspace;->E2(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method protected setupItemInfo(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/SecondaryDropTarget;->O(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/SecondaryDropTarget;->L(Lcom/android/launcher3/model/data/y;Landroid/view/View;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, -0x1

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/SecondaryDropTarget;->setupUi(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method protected setupUi(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->K:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->K:I

    .line 7
    .line 8
    const v0, 0x7f0b0068

    .line 9
    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    const p1, 0x7f080d8c

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->m()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 24
    .line 25
    .line 26
    const p1, 0x7f140463

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->B(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const v0, 0x7f0b004e

    .line 34
    .line 35
    .line 36
    if-ne p1, v0, :cond_2

    .line 37
    .line 38
    const p1, 0x7f080cfc

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 42
    .line 43
    .line 44
    const p1, 0x7f140192

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->B(I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    const v0, 0x7f0b005f

    .line 52
    .line 53
    .line 54
    if-ne p1, v0, :cond_3

    .line 55
    .line 56
    const p1, 0x7f080d6d

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 60
    .line 61
    .line 62
    const p1, 0x7f1401ce

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->B(I)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_0
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/ButtonDropTarget;->v()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->O:Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->O:Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public x(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/SecondaryDropTarget;->L(Lcom/android/launcher3/model/data/y;Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, -0x1

    .line 6
    if-eq p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method protected y(Lcom/android/launcher3/model/data/y;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v2, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 39
    .line 40
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 41
    .line 42
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget-object v2, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/SecondaryDropTarget;->O(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/SecondaryDropTarget;->x(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iput-boolean p1, p0, Lcom/android/launcher3/SecondaryDropTarget;->L:Z

    .line 72
    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    return v1

    .line 76
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/SecondaryDropTarget;->P()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iget-boolean v0, p0, Lcom/android/launcher3/SecondaryDropTarget;->L:Z

    .line 81
    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->q()Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_3

    .line 97
    .line 98
    const/4 p0, 0x1

    .line 99
    return p0

    .line 100
    :cond_3
    :goto_0
    return v1
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/SecondaryDropTarget$a;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, p0, v1, v2}, Lcom/android/launcher3/SecondaryDropTarget$a;-><init>(Lcom/android/launcher3/SecondaryDropTarget;Lcom/android/launcher3/m0;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 13
    .line 14
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/SecondaryDropTarget;->K(Lcom/android/launcher3/logging/d;Lcom/android/launcher3/model/data/y;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
