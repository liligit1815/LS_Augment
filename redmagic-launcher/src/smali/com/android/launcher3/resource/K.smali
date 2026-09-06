.class Lcom/android/launcher3/resource/K;
.super Ljava/lang/Object;
.source "MenuResource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/resource/K$a;,
        Lcom/android/launcher3/resource/K$c;,
        Lcom/android/launcher3/resource/K$d;,
        Lcom/android/launcher3/resource/K$e;,
        Lcom/android/launcher3/resource/K$f;,
        Lcom/android/launcher3/resource/K$b;
    }
.end annotation


# static fields
.field private static g:Lcom/android/launcher3/resource/K;


# instance fields
.field private a:Landroid/content/Context;

.field private volatile b:Lcom/android/launcher3/resource/K$a;

.field private final c:Ljava/lang/Object;

.field private volatile d:Z

.field private e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/resource/o0;",
            ">;"
        }
    .end annotation
.end field

.field private f:Lcom/android/launcher3/H5$f;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/android/launcher3/resource/K$a;Lcom/android/launcher3/resource/o0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/resource/K;->c:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/resource/K;->d:Z

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 17
    .line 18
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    return-void
.end method

.method private C(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/high16 v1, 0x428a0000    # 69.0f

    .line 12
    .line 13
    invoke-static {v1, v0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/android/launcher3/resource/o0;

    .line 24
    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    return-object p1

    .line 28
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const v3, 0x7f081a6a

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v2}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-static {v2, v1, v3}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isMutable()Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    const/4 v5, 0x1

    .line 53
    if-nez v4, :cond_1

    .line 54
    .line 55
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 56
    .line 57
    invoke-virtual {v2, v4, v5}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    :cond_1
    invoke-static {p1}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    if-eqz v4, :cond_3

    .line 66
    .line 67
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    if-eqz v6, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    sget-object p1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 75
    .line 76
    invoke-virtual {v4, p1, v5}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1, v1, v3}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1, v2}, Lcom/android/launcher3/resource/t;->n(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object v2, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 89
    .line 90
    invoke-static {v2, p1}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p0, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const v2, 0x7f080e17

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    filled-new-array {p1, p0}, [Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const/high16 p1, 0x41a00000    # 20.0f

    .line 112
    .line 113
    invoke-static {p1, v0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    const/high16 v2, 0x40000000    # 2.0f

    .line 118
    .line 119
    invoke-static {v2, v0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    new-instance v3, Landroid/graphics/drawable/LayerDrawable;

    .line 124
    .line 125
    invoke-direct {v3, p0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 126
    .line 127
    .line 128
    sub-int/2addr v1, p1

    .line 129
    sub-int v5, v1, v7

    .line 130
    .line 131
    const/4 v12, 0x0

    .line 132
    const/4 v13, 0x0

    .line 133
    const/4 v9, 0x0

    .line 134
    const/4 v10, 0x0

    .line 135
    const/4 v11, 0x0

    .line 136
    move-object v8, v3

    .line 137
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 138
    .line 139
    .line 140
    const/4 v4, 0x1

    .line 141
    move v6, v5

    .line 142
    move v8, v7

    .line 143
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 144
    .line 145
    .line 146
    return-object v3

    .line 147
    :cond_3
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .line 151
    .line 152
    const-string v0, "processThumb, bitmap is null or recycled, bitmap: "

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const-string v0, "R-Loader"

    .line 165
    .line 166
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    return-object p1
.end method

.method static E(Landroid/content/Context;)Lcom/android/launcher3/resource/K$c;
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "shallowLoader start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/launcher3/resource/K;->I(Landroid/content/Context;)Lcom/android/launcher3/resource/K$c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "syncMenuItems, mMenu is null"

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 14
    .line 15
    const-string v0, "wallpaper"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-string p0, "syncMenuItems no item to sync "

    .line 24
    .line 25
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$d;->f()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/android/launcher3/resource/K$e;

    .line 48
    .line 49
    :try_start_0
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$e;->o()Landroid/database/Cursor;

    .line 50
    .line 51
    .line 52
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    :try_start_1
    check-cast v0, Lcom/android/launcher3/resource/K$f;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$f;->W()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    check-cast v0, Lcom/android/launcher3/resource/K$f;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/K$f;->A(Landroid/database/Cursor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .line 67
    .line 68
    :goto_1
    invoke-static {v1}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catchall_1
    move-exception p0

    .line 73
    const/4 v1, 0x0

    .line 74
    :goto_2
    invoke-static {v1}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 75
    .line 76
    .line 77
    throw p0

    .line 78
    :cond_3
    return-void
.end method

.method static I(Landroid/content/Context;)Lcom/android/launcher3/resource/K$c;
    .locals 9

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/K$c;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/resource/K$c;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_6

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    const-string v4, "MiFavor_current_theme"

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    const/4 v7, 0x1

    .line 28
    const/4 v8, 0x0

    .line 29
    if-nez v6, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0, v4, v8}, Lcom/android/launcher3/resource/K$c;->o(Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->m()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v0, v4, v7}, Lcom/android/launcher3/resource/K$c;->o(Ljava/lang/String;Z)V

    .line 40
    .line 41
    .line 42
    :goto_0
    const-string v4, "MiFavor_selected_wallpaper"

    .line 43
    .line 44
    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-nez v5, :cond_1

    .line 53
    .line 54
    invoke-virtual {v0, v4, v8}, Lcom/android/launcher3/resource/K$c;->p(Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v6, "syncMenuState-- MIFAVOR_SELECTED_WALLPAPER "

    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    const-string v5, "R-Loader"

    .line 75
    .line 76
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_2

    .line 88
    .line 89
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string v4, "MiFavor_is_current_wallpaper"

    .line 94
    .line 95
    invoke-interface {p0, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-virtual {v0, p0, v8}, Lcom/android/launcher3/resource/K$c;->l(ZZ)V

    .line 100
    .line 101
    .line 102
    :cond_2
    const-string p0, "MiFavor_current_forecolor"

    .line 103
    .line 104
    invoke-interface {v1, p0, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_3

    .line 109
    .line 110
    invoke-virtual {v0, p0, v8}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v4, "syncMenuState-- getForeColor "

    .line 119
    .line 120
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$c;->c()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    :cond_3
    const-string p0, "MiFavor_current_maincolor"

    .line 138
    .line 139
    invoke-interface {v1, p0, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-eqz p0, :cond_4

    .line 144
    .line 145
    invoke-virtual {v0, p0, v8}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 146
    .line 147
    .line 148
    :cond_4
    const-string p0, "MiFavor_current_statusforecolor"

    .line 149
    .line 150
    invoke-interface {v1, p0, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-eqz p0, :cond_5

    .line 155
    .line 156
    invoke-virtual {v0, p0, v8}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 157
    .line 158
    .line 159
    new-instance p0, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    const-string v1, "syncMenuState-- setStatusForeColor "

    .line 165
    .line 166
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$c;->i()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    const-string v1, "loadMenuState finish "

    .line 189
    .line 190
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 194
    .line 195
    .line 196
    move-result-wide v6

    .line 197
    sub-long/2addr v6, v2

    .line 198
    invoke-virtual {p0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    :cond_6
    return-object v0
.end method

.method public static synthetic a(Lcom/android/launcher3/resource/K$f;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K$e;->d(Landroid/graphics/Bitmap;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/resource/K;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/K;->s(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/resource/K;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/K;->t(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/resource/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/resource/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/resource/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/resource/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static k(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 5

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "R-Loader"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_5

    .line 9
    .line 10
    const-string v0, "../"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_7

    .line 19
    .line 20
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string p0, "getFileInZip src not exist "

    .line 32
    .line 33
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    new-array p0, v2, [B

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    :try_start_0
    new-instance v3, Ljava/util/zip/ZipInputStream;

    .line 41
    .line 42
    new-instance v4, Ljava/io/FileInputStream;

    .line 43
    .line 44
    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v3, v4}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 48
    .line 49
    .line 50
    :try_start_1
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :goto_0
    if-eqz p0, :cond_4

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    const/4 v0, -0x1

    .line 65
    if-eq p0, v0, :cond_3

    .line 66
    .line 67
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    .line 68
    .line 69
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 70
    .line 71
    .line 72
    const/16 p1, 0x64

    .line 73
    .line 74
    new-array v0, p1, [B

    .line 75
    .line 76
    :goto_1
    invoke-virtual {v3, v0, v2, p1}, Ljava/util/zip/ZipInputStream;->read([BII)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-lez v4, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0, v0, v2, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :catchall_0
    move-exception p0

    .line 87
    move-object v0, v3

    .line 88
    goto :goto_6

    .line 89
    :catch_0
    move-exception p0

    .line 90
    move-object v0, v3

    .line 91
    goto :goto_2

    .line 92
    :catch_1
    move-exception p0

    .line 93
    move-object v0, v3

    .line 94
    goto :goto_4

    .line 95
    :cond_2
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 96
    .line 97
    .line 98
    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    invoke-static {v3}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 100
    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_3
    :try_start_2
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    .line 104
    .line 105
    .line 106
    move-result-object p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    goto :goto_0

    .line 108
    :cond_4
    invoke-static {v3}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 109
    .line 110
    .line 111
    goto :goto_5

    .line 112
    :catchall_1
    move-exception p0

    .line 113
    goto :goto_6

    .line 114
    :catch_2
    move-exception p0

    .line 115
    goto :goto_2

    .line 116
    :catch_3
    move-exception p0

    .line 117
    goto :goto_4

    .line 118
    :goto_2
    :try_start_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v3, "getFileInZip Exception: "

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 140
    .line 141
    .line 142
    :goto_3
    invoke-static {v0}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 143
    .line 144
    .line 145
    goto :goto_5

    .line 146
    :goto_4
    :try_start_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .line 150
    .line 151
    const-string v3, "getFileInZip IOException: "

    .line 152
    .line 153
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 168
    .line 169
    .line 170
    goto :goto_3

    .line 171
    :goto_5
    new-array p0, v2, [B

    .line 172
    .line 173
    return-object p0

    .line 174
    :goto_6
    invoke-static {v0}, Lx1/O;->z(Ljava/io/Closeable;)V

    .line 175
    .line 176
    .line 177
    throw p0

    .line 178
    :cond_5
    :goto_7
    const-string p0, " getFileInZip path is empty "

    .line 179
    .line 180
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    new-array p0, v2, [B

    .line 184
    .line 185
    return-object p0
.end method

.method static l(Landroid/content/Context;Lcom/android/launcher3/resource/K$a;Lcom/android/launcher3/resource/o0;)Lcom/android/launcher3/resource/K;
    .locals 2

    .line 1
    const-class v0, Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 5
    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    iget-object v1, v1, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eq p2, v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    sget-object p0, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/resource/K$a;->a:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 35
    .line 36
    const/4 p2, 0x0

    .line 37
    iput-object p2, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_3

    .line 42
    :cond_1
    :goto_0
    sget-object p0, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    :goto_1
    new-instance v1, Lcom/android/launcher3/resource/K;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/resource/K;-><init>(Landroid/content/Context;Lcom/android/launcher3/resource/K$a;Lcom/android/launcher3/resource/o0;)V

    .line 50
    .line 51
    .line 52
    sput-object v1, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 53
    .line 54
    :goto_2
    sget-object p0, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return-object p0

    .line 58
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method static n()Lcom/android/launcher3/resource/K;
    .locals 2

    .line 1
    const-class v0, Lcom/android/launcher3/resource/K;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/android/launcher3/resource/K;->g:Lcom/android/launcher3/resource/K;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw v1
.end method

.method private p()Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 3
    .line 4
    const-string v1, "activity"

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/app/ActivityManager;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 31
    .line 32
    iget-object v1, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "com.zte.beautify"

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    return v0

    .line 43
    :catch_0
    move-exception p0

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return p0

    .line 47
    :goto_0
    const-string v1, "R-Loader"

    .line 48
    .line 49
    const-string v2, "isZteThemeProcessExists: get theme process failed. "

    .line 50
    .line 51
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    .line 53
    .line 54
    return v0
.end method

.method private synthetic q()V
    .locals 7

    .line 1
    const-string v0, "checkOnlineSrcValidity ----entre!"

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 19
    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    const-string p0, "checkOnlineSrcValidity, mMenu is null"

    .line 23
    .line 24
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 29
    .line 30
    const-string v4, "wallpaper"

    .line 31
    .line 32
    invoke-virtual {v3, v4}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    const-string p0, "checkOnlineSrcValidity wallpaperTab is null"

    .line 39
    .line 40
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-virtual {v3}, Lcom/android/launcher3/resource/K$d;->f()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const/4 v5, 0x1

    .line 60
    if-eqz v3, :cond_5

    .line 61
    .line 62
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/android/launcher3/resource/K$e;

    .line 67
    .line 68
    invoke-static {v3}, Lcom/android/launcher3/resource/K$e;->b(Lcom/android/launcher3/resource/K$e;)I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-eq v6, v5, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    instance-of v5, v3, Lcom/android/launcher3/resource/K$f;

    .line 76
    .line 77
    if-eqz v5, :cond_2

    .line 78
    .line 79
    move-object v5, v3

    .line 80
    check-cast v5, Lcom/android/launcher3/resource/K$f;

    .line 81
    .line 82
    invoke-static {v5}, Lcom/android/launcher3/resource/K$f;->V(Lcom/android/launcher3/resource/K$f;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    if-nez v6, :cond_2

    .line 91
    .line 92
    const-string v6, "../"

    .line 93
    .line 94
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    if-eqz v6, :cond_4

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    new-instance v6, Ljava/io/File;

    .line 102
    .line 103
    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-nez v5, :cond_2

    .line 111
    .line 112
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    if-eqz v2, :cond_6

    .line 121
    .line 122
    iget-object v2, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 123
    .line 124
    invoke-virtual {v2, v4}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    new-instance v3, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    const-string v4, "checkOnlineSrcValidity --removeWallpapers--"

    .line 134
    .line 135
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2, v0}, Lcom/android/launcher3/resource/K$d;->d(Ljava/util/List;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v5}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 156
    .line 157
    .line 158
    :cond_6
    return-void
.end method

.method private synthetic r()V
    .locals 2

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const-string v1, "computeColorOfWallpaperOnRunnable start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->U()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->o()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->F()V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->H()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->i()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic s(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K;->f:Lcom/android/launcher3/H5$f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/launcher3/H5$f;->a(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic t(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/resource/o0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->c:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_0
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/android/launcher3/resource/z;->j()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x2

    .line 23
    if-eq v3, v2, :cond_0

    .line 24
    .line 25
    monitor-exit v1

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    const-string v2, "R-Loader"

    .line 30
    .line 31
    const-string v3, "onMenuDataChange"

    .line 32
    .line 33
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->e()Lcom/android/launcher3/H5$i;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 v0, 0x0

    .line 44
    :goto_0
    if-eqz v0, :cond_2

    .line 45
    .line 46
    new-instance v2, Lcom/android/launcher3/resource/G;

    .line 47
    .line 48
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/resource/G;-><init>(Lcom/android/launcher3/resource/K;Z)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0, v2}, Lcom/android/launcher3/H5$i;->j(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    monitor-exit v1

    .line 55
    return-void

    .line 56
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw p0
.end method

.method private synthetic u()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/resource/K;->d:Z

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "startComputeColorOfWallpaper-- loadBasicMenu is not ready! "

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string p0, "startComputeColorOfWallpaper, mMenu is null"

    .line 18
    .line 19
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 24
    .line 25
    const-string v2, "wallpaper"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-static {v0}, Lcom/android/launcher3/resource/K$d;->a(Lcom/android/launcher3/resource/K$d;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_4

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/android/launcher3/resource/K$e;

    .line 52
    .line 53
    instance-of v2, v1, Lcom/android/launcher3/resource/K$f;

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    check-cast v1, Lcom/android/launcher3/resource/K$f;

    .line 58
    .line 59
    new-instance v2, Lcom/android/launcher3/resource/I;

    .line 60
    .line 61
    invoke-direct {v2, v1}, Lcom/android/launcher3/resource/I;-><init>(Lcom/android/launcher3/resource/K$f;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    const-string v0, "startComputeColorOfWallpaper-- MenuResource.MenuTab is null"

    .line 69
    .line 70
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    :cond_4
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->p2()Lcom/android/launcher3/resource/G1;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lcom/android/launcher3/resource/G1;->I()V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private synthetic v()V
    .locals 3

    .line 1
    const-string v0, "startLoaderDataOnRunnable start"

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->U()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->o()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$a;->j()Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$a;->i()Z

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$a;->f()Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->p()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->x()V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->z()V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->y()Z

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->w()V

    .line 55
    .line 56
    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    const-string v0, "startLoaderDataOnRunnable: clear zte theme process."

    .line 60
    .line 61
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v2, "com.zte.beautify"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcom/android/launcher3/resource/g0;->r(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    const-string v2, "startLoaderDataOnRunnable: stop zte theme process failed. "

    .line 76
    .line 77
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->H()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->F()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K;->i()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private w()V
    .locals 7

    .line 1
    const-string v0, "wallpaper"

    .line 2
    .line 3
    const-string v1, "/persist/factoryinfo/customfolder/desktop_wallpaper_thumbnail.jpg"

    .line 4
    .line 5
    const-string v2, "/persist/factoryinfo/customfolder/desktop_wallpaper.jpg"

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 8
    .line 9
    const-string v4, "R-Loader"

    .line 10
    .line 11
    if-nez v3, :cond_0

    .line 12
    .line 13
    const-string p0, "loadCustomWallpaper mMenu is null"

    .line 14
    .line 15
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Lcom/android/launcher3/resource/g0;->y0()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    const-string v3, "loadCustomWallpaper"

    .line 30
    .line 31
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    :try_start_0
    new-instance v3, Ljava/io/File;

    .line 35
    .line 36
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v5, Ljava/io/File;

    .line 40
    .line 41
    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    const-string v3, "loadCustomWallpaper file exit"

    .line 57
    .line 58
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 62
    .line 63
    invoke-virtual {v3, v0}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    new-instance v5, Lcom/android/launcher3/resource/K$f;

    .line 70
    .line 71
    invoke-direct {v5}, Lcom/android/launcher3/resource/K$f;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v6, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 75
    .line 76
    invoke-static {v6, v1}, Lcom/android/launcher3/resource/ResourceOnline;->o(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const-string v6, "custom_wallpaper"

    .line 81
    .line 82
    invoke-virtual {v5, v6}, Lcom/android/launcher3/resource/K$e;->F(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v5, v0}, Lcom/android/launcher3/resource/K$e;->G(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const/4 v0, 0x1

    .line 89
    invoke-virtual {v5, v0}, Lcom/android/launcher3/resource/K$e;->I(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5, v2}, Lcom/android/launcher3/resource/K$f;->d0(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v5, v1}, Lcom/android/launcher3/resource/K$e;->C(Landroid/graphics/drawable/Drawable;)V

    .line 96
    .line 97
    .line 98
    const-wide/16 v1, 0x0

    .line 99
    .line 100
    invoke-virtual {v5, v1, v2}, Lcom/android/launcher3/resource/K$e;->D(J)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3, v5}, Lcom/android/launcher3/resource/K$d;->b(Lcom/android/launcher3/resource/K$e;)Z

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K;->B(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :catch_0
    move-exception p0

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v1, "loadCustomWallpaper error:"

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    :cond_1
    return-void
.end method

.method private x()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$a;->j()Z

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
    new-instance v0, Lcom/android/launcher3/resource/ResourceOnline;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/resource/o0;

    .line 23
    .line 24
    invoke-direct {v0, v1}, Lcom/android/launcher3/resource/ResourceOnline;-><init>(Lcom/android/launcher3/resource/o0;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/resource/ResourceOnline;->w(Landroid/content/Context;Lcom/android/launcher3/resource/K$a;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void

    .line 42
    :cond_2
    :goto_0
    const-string p0, "R-Loader"

    .line 43
    .line 44
    const-string v0, "abroad no online source to load!"

    .line 45
    .line 46
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private y()Z
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->P2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    iget-object v0, v1, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    new-instance v0, Landroid/content/Intent;

    .line 26
    .line 27
    const-string v6, "android.service.wallpaper.WallpaperService"

    .line 28
    .line 29
    invoke-direct {v0, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/16 v7, 0x80

    .line 33
    .line 34
    invoke-virtual {v5, v0, v7}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    if-nez v7, :cond_2

    .line 45
    .line 46
    :cond_1
    move/from16 v16, v2

    .line 47
    .line 48
    goto/16 :goto_6

    .line 49
    .line 50
    :cond_2
    iget-object v7, v1, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 51
    .line 52
    const-string v8, "R-Loader"

    .line 53
    .line 54
    if-nez v7, :cond_3

    .line 55
    .line 56
    const-string v0, "loadMenuItemFromSys, mMenu is null"

    .line 57
    .line 58
    invoke-static {v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    return v2

    .line 62
    :cond_3
    iget-object v7, v1, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 63
    .line 64
    const-string v9, "wallpaper"

    .line 65
    .line 66
    invoke-virtual {v7, v9}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    if-eqz v7, :cond_8

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v11

    .line 76
    move v12, v2

    .line 77
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_7

    .line 82
    .line 83
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    move-object v13, v0

    .line 88
    check-cast v13, Landroid/content/pm/ResolveInfo;

    .line 89
    .line 90
    :try_start_0
    new-instance v0, Landroid/app/WallpaperInfo;

    .line 91
    .line 92
    iget-object v14, v1, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 93
    .line 94
    invoke-direct {v0, v14, v13}, Landroid/app/WallpaperInfo;-><init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v5}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    .line 98
    .line 99
    .line 100
    move-result-object v14

    .line 101
    new-instance v15, Landroid/content/Intent;

    .line 102
    .line 103
    invoke-direct {v15, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v10

    .line 110
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v15, v10, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iget-object v10, v1, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 122
    .line 123
    invoke-virtual {v10}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v10

    .line 127
    check-cast v10, Lcom/android/launcher3/resource/o0;

    .line 128
    .line 129
    if-eqz v10, :cond_4

    .line 130
    .line 131
    invoke-virtual {v10}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 132
    .line 133
    .line 134
    move-result-object v10

    .line 135
    invoke-virtual {v10, v2}, Lcom/android/launcher3/resource/j;->c0(Landroid/content/ComponentName;)Z

    .line 136
    .line 137
    .line 138
    move-result v10

    .line 139
    goto :goto_1

    .line 140
    :cond_4
    const/4 v10, 0x0

    .line 141
    :goto_1
    if-eqz v10, :cond_5

    .line 142
    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v2, "Skipping wallpaper this one should be filtered Out "

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget-object v2, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-static {v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    goto/16 :goto_3

    .line 166
    .line 167
    :cond_5
    new-instance v10, Lcom/android/launcher3/resource/K$f;

    .line 168
    .line 169
    invoke-direct {v10}, Lcom/android/launcher3/resource/K$f;-><init>()V

    .line 170
    .line 171
    .line 172
    if-nez v14, :cond_6

    .line 173
    .line 174
    invoke-static {}, Lcom/android/launcher3/resource/w;->m()Landroid/graphics/drawable/Drawable;

    .line 175
    .line 176
    .line 177
    move-result-object v14

    .line 178
    :cond_6
    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v10, v2}, Lcom/android/launcher3/resource/K$e;->F(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-direct {v1, v14}, Lcom/android/launcher3/resource/K;->C(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v10, v2}, Lcom/android/launcher3/resource/K$e;->C(Landroid/graphics/drawable/Drawable;)V

    .line 190
    .line 191
    .line 192
    const/4 v2, 0x2

    .line 193
    invoke-virtual {v10, v2}, Lcom/android/launcher3/resource/K$e;->I(I)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v10, v9}, Lcom/android/launcher3/resource/K$e;->G(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0, v5}, Landroid/app/WallpaperInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v10, v2}, Lcom/android/launcher3/resource/K$e;->K(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :try_start_1
    invoke-virtual {v0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    const/4 v2, 0x0

    .line 215
    invoke-virtual {v5, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    iget-wide v14, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 220
    .line 221
    invoke-virtual {v10, v14, v15}, Lcom/android/launcher3/resource/K$e;->D(J)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :catch_0
    move-exception v0

    .line 226
    new-instance v2, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 229
    .line 230
    .line 231
    const-string v12, "can not get wallpaper apk\'s install time "

    .line 232
    .line 233
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    iget-object v12, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 237
    .line 238
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-static {v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 256
    .line 257
    .line 258
    move-result-wide v12

    .line 259
    invoke-virtual {v10, v12, v13}, Lcom/android/launcher3/resource/K$e;->D(J)V

    .line 260
    .line 261
    .line 262
    :goto_2
    invoke-virtual {v10}, Lcom/android/launcher3/resource/K$f;->e0()V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v7, v10}, Lcom/android/launcher3/resource/K$d;->b(Lcom/android/launcher3/resource/K$e;)Z

    .line 266
    .line 267
    .line 268
    const/4 v2, 0x0

    .line 269
    const/4 v12, 0x1

    .line 270
    goto/16 :goto_0

    .line 271
    .line 272
    :catch_1
    move-exception v0

    .line 273
    new-instance v2, Ljava/lang/StringBuilder;

    .line 274
    .line 275
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 276
    .line 277
    .line 278
    const-string v10, "Skipping wallpaper "

    .line 279
    .line 280
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    iget-object v10, v13, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 284
    .line 285
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-static {v8, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 293
    .line 294
    .line 295
    :goto_3
    const/4 v2, 0x0

    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :cond_7
    move v2, v12

    .line 299
    goto :goto_4

    .line 300
    :cond_8
    const/4 v2, 0x0

    .line 301
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 302
    .line 303
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .line 305
    .line 306
    const-string v5, "Time spent on loadMenuItemFromSys is "

    .line 307
    .line 308
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 312
    .line 313
    .line 314
    move-result-wide v5

    .line 315
    sub-long/2addr v5, v3

    .line 316
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    const-string v3, "/"

    .line 320
    .line 321
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    .line 333
    .line 334
    if-eqz v2, :cond_9

    .line 335
    .line 336
    const/4 v2, 0x1

    .line 337
    invoke-virtual {v1, v2}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 338
    .line 339
    .line 340
    goto :goto_5

    .line 341
    :cond_9
    const/4 v2, 0x1

    .line 342
    :goto_5
    return v2

    .line 343
    :goto_6
    return v16
.end method

.method private z()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$a;->j()Z

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
    new-instance v0, Lcom/android/launcher3/resource/ResourceOnline;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/resource/o0;

    .line 23
    .line 24
    invoke-direct {v0, v1}, Lcom/android/launcher3/resource/ResourceOnline;-><init>(Lcom/android/launcher3/resource/o0;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/resource/ResourceOnline;->t(Landroid/content/Context;Lcom/android/launcher3/resource/K$a;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->R2()V

    .line 48
    .line 49
    .line 50
    :cond_1
    const/4 v0, 0x1

    .line 51
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void

    .line 55
    :cond_3
    :goto_0
    const-string p0, "R-Loader"

    .line 56
    .line 57
    const-string v0, "abroad no online source to load!"

    .line 58
    .line 59
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method A()V
    .locals 12

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/resource/g0;->Q0()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Landroid/content/Intent;

    .line 22
    .line 23
    const-string v3, "android.service.wallpaper.WallpaperService"

    .line 24
    .line 25
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/16 v4, 0x80

    .line 29
    .line 30
    invoke-virtual {v1, v2, v4}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_9

    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-nez v4, :cond_1

    .line 41
    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/4 v4, 0x0

    .line 49
    move v5, v4

    .line 50
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    const/4 v7, 0x1

    .line 55
    if-eqz v6, :cond_8

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    check-cast v6, Landroid/content/pm/ResolveInfo;

    .line 62
    .line 63
    :try_start_0
    new-instance v8, Landroid/app/WallpaperInfo;

    .line 64
    .line 65
    iget-object v9, p0, Lcom/android/launcher3/resource/K;->a:Landroid/content/Context;

    .line 66
    .line 67
    invoke-direct {v8, v9, v6}, Landroid/app/WallpaperInfo;-><init>(Landroid/content/Context;Landroid/content/pm/ResolveInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    new-instance v9, Landroid/content/Intent;

    .line 71
    .line 72
    invoke-direct {v9, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v8}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    invoke-virtual {v8}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v11

    .line 83
    invoke-virtual {v9, v10, v11}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v8}, Landroid/app/WallpaperInfo;->getComponent()Landroid/content/ComponentName;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    iget-object v10, p0, Lcom/android/launcher3/resource/K;->e:Ljava/lang/ref/WeakReference;

    .line 91
    .line 92
    invoke-virtual {v10}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v10

    .line 96
    check-cast v10, Lcom/android/launcher3/resource/o0;

    .line 97
    .line 98
    if-eqz v10, :cond_3

    .line 99
    .line 100
    invoke-virtual {v10}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 101
    .line 102
    .line 103
    move-result-object v10

    .line 104
    invoke-virtual {v10, v9}, Lcom/android/launcher3/resource/j;->c0(Landroid/content/ComponentName;)Z

    .line 105
    .line 106
    .line 107
    move-result v10

    .line 108
    goto :goto_1

    .line 109
    :cond_3
    move v10, v4

    .line 110
    :goto_1
    if-eqz v10, :cond_4

    .line 111
    .line 112
    new-instance v7, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v8, "Skipping wallpaper this one should be filtered Out "

    .line 118
    .line 119
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget-object v6, v6, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 123
    .line 124
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    invoke-static {v0, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_4
    invoke-virtual {v8, v1}, Landroid/app/WallpaperInfo;->loadThumbnail(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    if-nez v6, :cond_5

    .line 140
    .line 141
    invoke-static {}, Lcom/android/launcher3/resource/w;->m()Landroid/graphics/drawable/Drawable;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    :cond_5
    iget-object v8, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 146
    .line 147
    if-eqz v8, :cond_2

    .line 148
    .line 149
    iget-object v8, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 150
    .line 151
    const-string v10, "wallpaper"

    .line 152
    .line 153
    invoke-virtual {v8, v10}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 154
    .line 155
    .line 156
    move-result-object v8

    .line 157
    if-nez v8, :cond_6

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_6
    iget-object v8, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 161
    .line 162
    invoke-virtual {v8, v10}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 163
    .line 164
    .line 165
    move-result-object v8

    .line 166
    invoke-virtual {v9}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v9

    .line 170
    invoke-virtual {v8, v9}, Lcom/android/launcher3/resource/K$d;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$e;

    .line 171
    .line 172
    .line 173
    move-result-object v8

    .line 174
    if-nez v8, :cond_7

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_7
    invoke-direct {p0, v6}, Lcom/android/launcher3/resource/K;->C(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    invoke-virtual {v8, v5}, Lcom/android/launcher3/resource/K$e;->C(Landroid/graphics/drawable/Drawable;)V

    .line 182
    .line 183
    .line 184
    move v5, v7

    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :catch_0
    move-exception v7

    .line 188
    new-instance v8, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    const-string v9, "Skipping wallpaper "

    .line 194
    .line 195
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-object v6, v6, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    .line 199
    .line 200
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    invoke-static {v0, v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 208
    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :cond_8
    if-eqz v5, :cond_9

    .line 213
    .line 214
    invoke-virtual {p0, v7}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 215
    .line 216
    .line 217
    :cond_9
    :goto_2
    return-void
.end method

.method B(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/C;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/resource/C;-><init>(Lcom/android/launcher3/resource/K;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->R(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method D(Lcom/android/launcher3/H5$f;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->f:Lcom/android/launcher3/H5$f;

    .line 5
    .line 6
    if-eq v1, p1, :cond_0

    .line 7
    .line 8
    const-string v1, "R-Loader"

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v3, "getMenuTabConfig-- add callback! --"

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/android/launcher3/resource/K;->f:Lcom/android/launcher3/H5$f;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method F()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/H;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/H;-><init>(Lcom/android/launcher3/resource/K;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method G()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/F;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/F;-><init>(Lcom/android/launcher3/resource/K;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method varargs h([Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "checkMenuItem, mMenu is null"

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 14
    .line 15
    const-string v2, "wallpaper"

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lcom/android/launcher3/resource/K$a;->e(Ljava/lang/String;)Lcom/android/launcher3/resource/K$d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const-string p0, "checkMenuItem wallpaperTab is null"

    .line 24
    .line 25
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/resource/K$d;->f()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const/4 v3, 0x0

    .line 43
    move v4, v3

    .line 44
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    const/4 v6, 0x1

    .line 49
    if-eqz v5, :cond_3

    .line 50
    .line 51
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    check-cast v5, Lcom/android/launcher3/resource/K$e;

    .line 56
    .line 57
    invoke-virtual {v5}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    const/4 v8, 0x2

    .line 62
    if-ne v7, v8, :cond_2

    .line 63
    .line 64
    invoke-static {v5}, Lcom/android/launcher3/resource/K$e;->a(Lcom/android/launcher3/resource/K$e;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-static {v7, p1}, Lcom/android/launcher3/resource/o0;->I(Ljava/lang/String;[Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    if-eqz v7, :cond_2

    .line 73
    .line 74
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move v4, v6

    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_4

    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_4

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Lcom/android/launcher3/resource/K$e;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Lcom/android/launcher3/resource/K$d;->c(Lcom/android/launcher3/resource/K$e;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    invoke-direct {p0}, Lcom/android/launcher3/resource/K;->y()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    or-int/2addr v0, v4

    .line 110
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 111
    .line 112
    invoke-static {v1}, Lcom/android/launcher3/resource/K$a;->d(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    const/4 v2, 0x0

    .line 121
    if-nez v1, :cond_7

    .line 122
    .line 123
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 124
    .line 125
    invoke-static {v1}, Lcom/android/launcher3/resource/K$a;->d(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {v1, p1}, Lcom/android/launcher3/resource/o0;->I(Ljava/lang/String;[Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_7

    .line 134
    .line 135
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 136
    .line 137
    iget-object p1, p1, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 138
    .line 139
    if-nez p1, :cond_5

    .line 140
    .line 141
    move p1, v6

    .line 142
    goto :goto_2

    .line 143
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    :goto_2
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 156
    .line 157
    invoke-static {v1}, Lcom/android/launcher3/resource/K$a;->d(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    iget-object v4, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 162
    .line 163
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$a;->j()Z

    .line 164
    .line 165
    .line 166
    iget-object v4, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 167
    .line 168
    iget-object v4, v4, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 169
    .line 170
    if-eq p1, v4, :cond_6

    .line 171
    .line 172
    move p1, v6

    .line 173
    goto :goto_3

    .line 174
    :cond_6
    move p1, v3

    .line 175
    :goto_3
    iget-object v4, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 176
    .line 177
    invoke-static {v4}, Lcom/android/launcher3/resource/K$a;->d(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    xor-int/2addr v1, v6

    .line 186
    or-int/2addr p1, v1

    .line 187
    or-int/2addr v0, p1

    .line 188
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 189
    .line 190
    iput-object v2, p1, Lcom/android/launcher3/resource/K$a;->c:Ljava/lang/Boolean;

    .line 191
    .line 192
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 193
    .line 194
    invoke-static {p1}, Lcom/android/launcher3/resource/K$a;->c(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    if-nez p1, :cond_b

    .line 203
    .line 204
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 205
    .line 206
    iget-object p1, p1, Lcom/android/launcher3/resource/K$a;->e:Ljava/lang/Boolean;

    .line 207
    .line 208
    if-nez p1, :cond_8

    .line 209
    .line 210
    move p1, v6

    .line 211
    goto :goto_4

    .line 212
    :cond_8
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 213
    .line 214
    iget-object p1, p1, Lcom/android/launcher3/resource/K$a;->e:Ljava/lang/Boolean;

    .line 215
    .line 216
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    :goto_4
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget-object v1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 225
    .line 226
    invoke-static {v1}, Lcom/android/launcher3/resource/K$a;->c(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    iget-object v4, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 231
    .line 232
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$a;->i()Z

    .line 233
    .line 234
    .line 235
    iget-object v4, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 236
    .line 237
    iget-object v4, v4, Lcom/android/launcher3/resource/K$a;->e:Ljava/lang/Boolean;

    .line 238
    .line 239
    if-ne p1, v4, :cond_9

    .line 240
    .line 241
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 242
    .line 243
    invoke-static {p1}, Lcom/android/launcher3/resource/K$a;->c(Lcom/android/launcher3/resource/K$a;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    if-nez p1, :cond_a

    .line 252
    .line 253
    :cond_9
    move v3, v6

    .line 254
    :cond_a
    or-int/2addr v0, v3

    .line 255
    iget-object p1, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 256
    .line 257
    iput-object v2, p1, Lcom/android/launcher3/resource/K$a;->e:Ljava/lang/Boolean;

    .line 258
    .line 259
    :cond_b
    if-eqz v0, :cond_c

    .line 260
    .line 261
    invoke-virtual {p0, v6}, Lcom/android/launcher3/resource/K;->B(Z)V

    .line 262
    .line 263
    .line 264
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->p2()Lcom/android/launcher3/resource/G1;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-virtual {p0}, Lcom/android/launcher3/resource/G1;->I()V

    .line 273
    .line 274
    .line 275
    :cond_c
    return-void
.end method

.method i()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->n0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "R-Loader"

    .line 16
    .line 17
    const-string v0, "checkOnlineSrcValidity, no need check online"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 24
    .line 25
    new-instance v1, Lcom/android/launcher3/resource/E;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/android/launcher3/resource/E;-><init>(Lcom/android/launcher3/resource/K;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method j()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/D;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/resource/D;-><init>(Lcom/android/launcher3/resource/K;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->P(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method m()Lcom/android/launcher3/resource/K$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K;->b:Lcom/android/launcher3/resource/K$a;

    .line 2
    .line 3
    return-object p0
.end method

.method o()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/g0;->p2()Lcom/android/launcher3/resource/G1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/G1;->s(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
