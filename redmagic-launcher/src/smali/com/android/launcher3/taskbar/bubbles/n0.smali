.class public Lcom/android/launcher3/taskbar/bubbles/n0;
.super Ljava/lang/Object;
.source "BubbleCreator.java"


# static fields
.field private static final d:Ljava/lang/String; = "n0"


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/content/pm/LauncherApps;

.field private final c:Ls1/f;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->a:Landroid/content/Context;

    .line 5
    .line 6
    const-class v0, Landroid/content/pm/LauncherApps;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->b:Landroid/content/pm/LauncherApps;

    .line 15
    .line 16
    new-instance v1, Ls1/f;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const v2, 0x7f07016d

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const v2, 0x7f070155

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const v2, 0x7f06026d

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const v2, 0x10501b6

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    move-object v2, p1

    .line 63
    invoke-direct/range {v1 .. v6}, Ls1/f;-><init>(Landroid/content/Context;IIII)V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->c:Ls1/f;

    .line 67
    .line 68
    return-void
.end method

.method private b()Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const v1, 0x7f0808ff

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->a:Landroid/content/Context;

    .line 11
    .line 12
    const v2, 0x7f060444

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->a:Landroid/content/Context;

    .line 20
    .line 21
    const v3, 0x7f060454

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v3}, Landroid/content/Context;->getColor(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->a:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const v3, 0x7f070173

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    new-instance v3, Landroid/graphics/drawable/InsetDrawable;

    .line 45
    .line 46
    invoke-direct {v3, v0, v1}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 50
    .line 51
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 52
    .line 53
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-direct {v0, v1, v3}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->c:Ls1/f;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ls1/b;->d(Landroid/graphics/drawable/Drawable;)Ls1/d;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 66
    .line 67
    return-object p0
.end method

.method private c(LN2/A;)LW1/m;
    .locals 3
    .param p1    # LN2/A;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/Nullable;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, LN2/A;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, LN2/A;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, LW1/m;

    .line 14
    .line 15
    invoke-virtual {p1}, LN2/A;->a()Landroid/graphics/drawable/Icon;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {p1, p0}, LN2/z;->a(Landroid/graphics/drawable/Icon;Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, ""

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    move-object v0, p1

    .line 30
    :cond_1
    if-nez v1, :cond_2

    .line 31
    .line 32
    move-object v1, p1

    .line 33
    :cond_2
    invoke-direct {v2, p0, v0, v1}, LW1/m;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v2
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)Lcom/android/launcher3/taskbar/bubbles/x;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/n0;->b()Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/n0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const v1, 0x7f0e007d

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 20
    .line 21
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/x;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/x;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u(Lcom/android/launcher3/taskbar/bubbles/x;Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public d(Landroid/content/Context;LN2/k;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/bubbles/b;)Lcom/android/launcher3/taskbar/bubbles/b;
    .locals 18
    .param p4    # Lcom/android/launcher3/taskbar/bubbles/b;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    invoke-virtual/range {p2 .. p2}, LN2/k;->t()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    new-instance v4, LN1/f;

    .line 12
    .line 13
    new-instance v5, Landroid/os/UserHandle;

    .line 14
    .line 15
    invoke-virtual/range {p2 .. p2}, LN2/k;->r()I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    invoke-direct {v5, v6}, Landroid/os/UserHandle;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v4, v1, v5}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual/range {p2 .. p2}, LN2/k;->h()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-virtual/range {p2 .. p2}, LN2/k;->l()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    filled-new-array {v6}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-virtual {v4, v5, v6}, LN1/f;->c(Ljava/lang/String;[Ljava/lang/String;)LN1/f;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    const/16 v5, 0xc11

    .line 42
    .line 43
    invoke-virtual {v4, v5}, LN1/f;->d(I)LN1/f$a;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    const/4 v6, 0x0

    .line 52
    const/4 v7, 0x0

    .line 53
    if-lez v5, :cond_0

    .line 54
    .line 55
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Landroid/content/pm/ShortcutInfo;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move-object v4, v6

    .line 63
    :goto_0
    if-nez v4, :cond_1

    .line 64
    .line 65
    sget-object v5, Lcom/android/launcher3/taskbar/bubbles/n0;->d:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v8, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v9, "No shortcutInfo found for bubble: "

    .line 73
    .line 74
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual/range {p2 .. p2}, LN2/k;->g()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v9, " with shortcutId: "

    .line 85
    .line 86
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual/range {p2 .. p2}, LN2/k;->l()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v9

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v8

    .line 100
    invoke-static {v5, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    :cond_1
    :try_start_0
    iget-object v5, v0, Lcom/android/launcher3/taskbar/bubbles/n0;->b:Landroid/content/pm/LauncherApps;

    .line 104
    .line 105
    invoke-virtual/range {p2 .. p2}, LN2/k;->h()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    new-instance v9, Landroid/os/UserHandle;

    .line 110
    .line 111
    invoke-virtual/range {p2 .. p2}, LN2/k;->r()I

    .line 112
    .line 113
    .line 114
    move-result v10

    .line 115
    invoke-direct {v9, v10}, Landroid/os/UserHandle;-><init>(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v5, v8, v7, v9}, Landroid/content/pm/LauncherApps;->getApplicationInfo(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;

    .line 119
    .line 120
    .line 121
    move-result-object v5
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    if-nez v5, :cond_2

    .line 123
    .line 124
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/n0;->d:Ljava/lang/String;

    .line 125
    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v2, "Unable to find appInfo: "

    .line 132
    .line 133
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual/range {p2 .. p2}, LN2/k;->h()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    return-object v6

    .line 151
    :cond_2
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    invoke-virtual {v5, v6}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 156
    .line 157
    .line 158
    move-result-object v8

    .line 159
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v16

    .line 163
    invoke-virtual {v5, v6}, Landroid/content/pm/ApplicationInfo;->loadUnbadgedIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    new-instance v8, Landroid/os/UserHandle;

    .line 168
    .line 169
    invoke-virtual/range {p2 .. p2}, LN2/k;->r()I

    .line 170
    .line 171
    .line 172
    move-result v9

    .line 173
    invoke-direct {v8, v9}, Landroid/os/UserHandle;-><init>(I)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v6, v5, v8}, Landroid/content/pm/PackageManager;->getUserBadgedIcon(Landroid/graphics/drawable/Drawable;Landroid/os/UserHandle;)Landroid/graphics/drawable/Drawable;

    .line 177
    .line 178
    .line 179
    move-result-object v6

    .line 180
    iget-object v8, v0, Lcom/android/launcher3/taskbar/bubbles/n0;->c:Ls1/f;

    .line 181
    .line 182
    invoke-virtual/range {p2 .. p2}, LN2/k;->e()Landroid/graphics/drawable/Icon;

    .line 183
    .line 184
    .line 185
    move-result-object v9

    .line 186
    invoke-virtual {v8, v1, v4, v9}, Ls1/f;->q0(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;Landroid/graphics/drawable/Icon;)Landroid/graphics/drawable/Drawable;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    if-nez v4, :cond_3

    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_3
    move-object v5, v4

    .line 194
    :goto_1
    iget-object v4, v0, Lcom/android/launcher3/taskbar/bubbles/n0;->c:Ls1/f;

    .line 195
    .line 196
    invoke-virtual {v4, v6, v3}, Ls1/f;->o0(Landroid/graphics/drawable/Drawable;Z)Ls1/d;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    iget-object v12, v3, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 201
    .line 202
    const/4 v4, 0x1

    .line 203
    new-array v4, v4, [F

    .line 204
    .line 205
    iget-object v6, v0, Lcom/android/launcher3/taskbar/bubbles/n0;->c:Ls1/f;

    .line 206
    .line 207
    invoke-virtual {v6, v5, v4}, Ls1/f;->p0(Landroid/graphics/drawable/Drawable;[F)Landroid/graphics/Bitmap;

    .line 208
    .line 209
    .line 210
    move-result-object v13

    .line 211
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    const v6, 0x1040294

    .line 216
    .line 217
    .line 218
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v5

    .line 222
    invoke-static {v5}, Landroid/util/PathParser;->createPathFromPathData(Ljava/lang/String;)Landroid/graphics/Path;

    .line 223
    .line 224
    .line 225
    move-result-object v15

    .line 226
    new-instance v5, Landroid/graphics/Matrix;

    .line 227
    .line 228
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 229
    .line 230
    .line 231
    aget v4, v4, v7

    .line 232
    .line 233
    const/high16 v6, 0x42480000    # 50.0f

    .line 234
    .line 235
    invoke-virtual {v5, v4, v4, v6, v6}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v15, v5}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 239
    .line 240
    .line 241
    iget v3, v3, Ls1/d;->b:I

    .line 242
    .line 243
    const/4 v4, -0x1

    .line 244
    const v5, 0x3f0a8a8b

    .line 245
    .line 246
    .line 247
    invoke-static {v3, v4, v5}, Lcom/android/internal/graphics/ColorUtils;->blendARGB(IIF)I

    .line 248
    .line 249
    .line 250
    move-result v14

    .line 251
    invoke-virtual/range {p2 .. p2}, LN2/k;->j()LN2/A;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-direct {v0, v3}, Lcom/android/launcher3/taskbar/bubbles/n0;->c(LN2/A;)LW1/m;

    .line 256
    .line 257
    .line 258
    move-result-object v17

    .line 259
    if-nez v2, :cond_4

    .line 260
    .line 261
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    const v1, 0x7f0e0081

    .line 266
    .line 267
    .line 268
    move-object/from16 v2, p3

    .line 269
    .line 270
    invoke-virtual {v0, v1, v2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    move-object v11, v0

    .line 275
    check-cast v11, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 276
    .line 277
    new-instance v9, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 278
    .line 279
    move-object/from16 v10, p2

    .line 280
    .line 281
    invoke-direct/range {v9 .. v17}, Lcom/android/launcher3/taskbar/bubbles/b;-><init>(LN2/k;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;ILandroid/graphics/Path;Ljava/lang/String;LW1/m;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v11, v9}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setBubble(Lcom/android/launcher3/taskbar/bubbles/b;)V

    .line 285
    .line 286
    .line 287
    return-object v9

    .line 288
    :cond_4
    move-object/from16 v10, p2

    .line 289
    .line 290
    move-object/from16 v0, v16

    .line 291
    .line 292
    move-object/from16 v1, v17

    .line 293
    .line 294
    invoke-virtual {v2, v10}, Lcom/android/launcher3/taskbar/bubbles/b;->o(LN2/k;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v2, v12}, Lcom/android/launcher3/taskbar/bubbles/b;->j(Landroid/graphics/Bitmap;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v2, v13}, Lcom/android/launcher3/taskbar/bubbles/b;->n(Landroid/graphics/Bitmap;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v2, v14}, Lcom/android/launcher3/taskbar/bubbles/b;->k(I)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v2, v15}, Lcom/android/launcher3/taskbar/bubbles/b;->l(Landroid/graphics/Path;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v2, v0}, Lcom/android/launcher3/taskbar/bubbles/b;->i(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v2, v1}, Lcom/android/launcher3/taskbar/bubbles/b;->m(LW1/m;)V

    .line 313
    .line 314
    .line 315
    return-object v2

    .line 316
    :catch_0
    move-object/from16 v10, p2

    .line 317
    .line 318
    sget-object v0, Lcom/android/launcher3/taskbar/bubbles/n0;->d:Ljava/lang/String;

    .line 319
    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 323
    .line 324
    .line 325
    const-string v2, "Unable to find packageName: "

    .line 326
    .line 327
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v10}, LN2/k;->h()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    .line 343
    .line 344
    return-object v6
.end method
