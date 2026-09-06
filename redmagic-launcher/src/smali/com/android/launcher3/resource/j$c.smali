.class Lcom/android/launcher3/resource/j$c;
.super Lcom/android/launcher3/resource/I1;
.source "ConfigResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/resource/j$c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/resource/I1<",
        "Lcom/android/launcher3/resource/j$c$a;",
        ">;"
    }
.end annotation


# instance fields
.field private e:Lcom/android/launcher3/resource/K$d;

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/resource/I1;-><init>(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/resource/I1;-><init>(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    return-void
.end method

.method private l(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;
    .locals 1

    .line 1
    const-string p0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "className"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, "."

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    :cond_0
    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v0, "NullPointerException :"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string p1, "R-Loader"

    .line 61
    .line 62
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return-object p0
.end method

.method private m(Landroid/content/res/XmlResourceParser;)Lcom/android/launcher3/resource/K$d;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/resource/K$d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/resource/K$d;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "tabType"

    .line 7
    .line 8
    invoke-static {p1, v1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/K$d;->i(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/resource/I1;->d:Landroid/content/res/Resources;

    .line 16
    .line 17
    const-string v1, "tabLabel"

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {p1, v1, v2}, Lcom/android/launcher3/resource/I1;->d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lcom/android/launcher3/resource/K$d;->h(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method private n(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/launcher3/resource/K$d;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/launcher3/resource/K$d;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$d;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "tabType"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/K$d;->i(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method private o(Lcom/android/launcher3/resource/K$c;Landroid/content/res/XmlResourceParser;)Lcom/android/launcher3/resource/K$e;
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "wWallpaperSrcUri"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {p2, v1, v2}, Lcom/android/launcher3/resource/I1;->d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, 0x0

    .line 17
    if-eqz v3, :cond_4

    .line 18
    .line 19
    new-instance v3, Lcom/android/launcher3/resource/K$f;

    .line 20
    .line 21
    invoke-direct {v3}, Lcom/android/launcher3/resource/K$f;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, v3, p2}, Lcom/android/launcher3/resource/j$c;->q(Lcom/android/launcher3/resource/K$e;Landroid/content/res/XmlResourceParser;)Lcom/android/launcher3/resource/K$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/android/launcher3/resource/K$f;

    .line 29
    .line 30
    const-string v3, "wallpaper"

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Lcom/android/launcher3/resource/K$e;->G(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, v1, v2}, Lcom/android/launcher3/resource/I1;->d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->d0(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v1, "wIconTextColor"

    .line 47
    .line 48
    invoke-static {p2, v1, v2}, Lcom/android/launcher3/resource/I1;->c(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->E(I)V

    .line 55
    .line 56
    .line 57
    :cond_0
    const-string v1, "wMainColor"

    .line 58
    .line 59
    invoke-static {p2, v1, v2}, Lcom/android/launcher3/resource/I1;->c(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->H(I)V

    .line 66
    .line 67
    .line 68
    :cond_1
    const-string v1, "wStatusForeColor"

    .line 69
    .line 70
    invoke-static {p2, v1, v2}, Lcom/android/launcher3/resource/I1;->c(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->J(I)V

    .line 77
    .line 78
    .line 79
    :cond_2
    const-string v1, "MiFavor_selected_wallpaper"

    .line 80
    .line 81
    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    const-string v0, "itemSelected"

    .line 92
    .line 93
    invoke-static {p2, v0, v2}, Lcom/android/launcher3/resource/I1;->b(Landroid/content/res/XmlResourceParser;Ljava/lang/String;Z)Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_3

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    const/4 v0, 0x1

    .line 104
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->p(Ljava/lang/String;Z)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 126
    .line 127
    .line 128
    :cond_3
    return-object p0

    .line 129
    :cond_4
    return-object v4
.end method

.method private p(Lcom/android/launcher3/resource/K$c;Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/launcher3/resource/K$e;
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->h()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/resource/o0;->v(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "wWallpaperSrcUri"

    .line 10
    .line 11
    invoke-static {p2, v1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    if-nez v2, :cond_4

    .line 21
    .line 22
    new-instance v2, Lcom/android/launcher3/resource/K$f;

    .line 23
    .line 24
    invoke-direct {v2}, Lcom/android/launcher3/resource/K$f;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, v2, p2}, Lcom/android/launcher3/resource/j$c;->r(Lcom/android/launcher3/resource/K$e;Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/launcher3/resource/K$e;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/android/launcher3/resource/K$f;

    .line 32
    .line 33
    const-string v2, "wallpaper"

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lcom/android/launcher3/resource/K$e;->G(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p2, v1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->d0(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :try_start_0
    const-string v1, "wStatusForeColor"

    .line 46
    .line 47
    invoke-static {p2, v1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_0

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->J(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :catch_0
    :cond_0
    :try_start_1
    const-string v1, "wIconTextColor"

    .line 65
    .line 66
    invoke-static {p2, v1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->E(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 81
    .line 82
    .line 83
    :catch_1
    :cond_1
    :try_start_2
    const-string v1, "wMainColor"

    .line 84
    .line 85
    invoke-static {p2, v1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$f;->H(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 100
    .line 101
    .line 102
    :catch_2
    :cond_2
    const-string v1, "MiFavor_selected_wallpaper"

    .line 103
    .line 104
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    :try_start_3
    const-string v1, "itemSelected"

    .line 113
    .line 114
    invoke-static {p2, v1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 123
    .line 124
    .line 125
    move-result p2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 126
    goto :goto_0

    .line 127
    :catch_3
    const/4 p2, 0x0

    .line 128
    :goto_0
    if-eqz v0, :cond_3

    .line 129
    .line 130
    if-eqz p2, :cond_3

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    const/4 v0, 0x1

    .line 137
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->p(Ljava/lang/String;Z)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->k(IZ)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->n(IZ)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/resource/K$c;->q(IZ)V

    .line 159
    .line 160
    .line 161
    :cond_3
    return-object p0

    .line 162
    :cond_4
    return-object v3
.end method

.method private q(Lcom/android/launcher3/resource/K$e;Landroid/content/res/XmlResourceParser;)Lcom/android/launcher3/resource/K$e;
    .locals 2

    .line 1
    const-string v0, "itemId"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Lcom/android/launcher3/resource/K$e;->F(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/resource/I1;->d:Landroid/content/res/Resources;

    .line 11
    .line 12
    const-string v0, "itemLabel"

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/resource/I1;->d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$e;->K(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "itemSample"

    .line 27
    .line 28
    invoke-static {p2, p0, v1}, Lcom/android/launcher3/resource/I1;->d(Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$e;->B(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v1}, Lcom/android/launcher3/resource/K$e;->I(I)V

    .line 40
    .line 41
    .line 42
    return-object p1
.end method

.method private r(Lcom/android/launcher3/resource/K$e;Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/launcher3/resource/K$e;
    .locals 0

    .line 1
    const-string p0, "itemId"

    .line 2
    .line 3
    invoke-static {p2, p0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$e;->F(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "itemSample"

    .line 11
    .line 12
    invoke-static {p2, p0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$e;->B(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-virtual {p1, p0}, Lcom/android/launcher3/resource/K$e;->I(I)V

    .line 21
    .line 22
    .line 23
    return-object p1
.end method


# virtual methods
.method bridge synthetic g(Ljava/lang/Object;Landroid/content/res/XmlResourceParser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    check-cast p1, Lcom/android/launcher3/resource/j$c$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j$c;->j(Lcom/android/launcher3/resource/j$c$a;Landroid/content/res/XmlResourceParser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method bridge synthetic h(Ljava/lang/Object;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    check-cast p1, Lcom/android/launcher3/resource/j$c$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/resource/j$c;->k(Lcom/android/launcher3/resource/j$c$a;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method j(Lcom/android/launcher3/resource/j$c$a;Landroid/content/res/XmlResourceParser;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "menutab"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$c;->m(Landroid/content/res/XmlResourceParser;)Lcom/android/launcher3/resource/K$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/resource/j$c;->e:Lcom/android/launcher3/resource/K$d;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->b(Lcom/android/launcher3/resource/j$c$a;)Lcom/android/launcher3/resource/K$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/android/launcher3/resource/K$a;->a:Ljava/util/List;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/resource/j$c;->e:Lcom/android/launcher3/resource/K$d;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->n0()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    const-string v0, "menuitem"

    .line 45
    .line 46
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p0, v0, p2}, Lcom/android/launcher3/resource/j$c;->o(Lcom/android/launcher3/resource/K$c;Landroid/content/res/XmlResourceParser;)Lcom/android/launcher3/resource/K$e;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/android/launcher3/resource/j$c;->e:Lcom/android/launcher3/resource/K$d;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Lcom/android/launcher3/resource/K$d;->b(Lcom/android/launcher3/resource/K$e;)Z

    .line 75
    .line 76
    .line 77
    :cond_1
    const-string v0, "appHiddens"

    .line 78
    .line 79
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$c;->l(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->a(Lcom/android/launcher3/resource/j$c$a;)Ljava/util/ArrayList;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_2
    const-string v0, "taskHiddens"

    .line 103
    .line 104
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$c;->l(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->c(Lcom/android/launcher3/resource/j$c$a;)Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    :cond_3
    const-string v0, "widgetOrder"

    .line 128
    .line 129
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    new-instance v0, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Lcom/android/launcher3/resource/j$c;->f:Ljava/util/List;

    .line 145
    .line 146
    const-string v0, "packageName"

    .line 147
    .line 148
    invoke-static {p2, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->d(Lcom/android/launcher3/resource/j$c$a;)Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    new-instance v1, Landroid/util/Pair;

    .line 157
    .line 158
    iget-object v2, p0, Lcom/android/launcher3/resource/j$c;->f:Ljava/util/List;

    .line 159
    .line 160
    invoke-direct {v1, v0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    :cond_4
    const-string p1, "widgetClassOrder"

    .line 167
    .line 168
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_5

    .line 177
    .line 178
    iget-object p0, p0, Lcom/android/launcher3/resource/j$c;->f:Ljava/util/List;

    .line 179
    .line 180
    const-string p1, "className"

    .line 181
    .line 182
    invoke-static {p2, p1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    :cond_5
    return-void
.end method

.method k(Lcom/android/launcher3/resource/j$c$a;Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "menutab"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$c;->n(Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/launcher3/resource/K$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/resource/j$c;->e:Lcom/android/launcher3/resource/K$d;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->b(Lcom/android/launcher3/resource/j$c$a;)Lcom/android/launcher3/resource/K$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/android/launcher3/resource/K$a;->a:Ljava/util/List;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/resource/j$c;->e:Lcom/android/launcher3/resource/K$d;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->q()Lcom/android/launcher3/resource/o0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->f()Lcom/android/launcher3/resource/j;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/resource/j;->n0()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    const-string v0, "menuitem"

    .line 45
    .line 46
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->t()Lcom/android/launcher3/resource/K$c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p0, v0, p2}, Lcom/android/launcher3/resource/j$c;->p(Lcom/android/launcher3/resource/K$c;Lorg/xmlpull/v1/XmlPullParser;)Lcom/android/launcher3/resource/K$e;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/android/launcher3/resource/j$c;->e:Lcom/android/launcher3/resource/K$d;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Lcom/android/launcher3/resource/K$d;->b(Lcom/android/launcher3/resource/K$e;)Z

    .line 75
    .line 76
    .line 77
    :cond_1
    const-string v0, "appHiddens"

    .line 78
    .line 79
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$c;->l(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->a(Lcom/android/launcher3/resource/j$c$a;)Ljava/util/ArrayList;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :cond_2
    const-string v0, "taskHiddens"

    .line 103
    .line 104
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    invoke-direct {p0, p2}, Lcom/android/launcher3/resource/j$c;->l(Lorg/xmlpull/v1/XmlPullParser;)Landroid/content/ComponentName;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->c(Lcom/android/launcher3/resource/j$c$a;)Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    :cond_3
    const-string v0, "widgetOrder"

    .line 128
    .line 129
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    new-instance v0, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Lcom/android/launcher3/resource/j$c;->f:Ljava/util/List;

    .line 145
    .line 146
    const-string v0, "packageName"

    .line 147
    .line 148
    invoke-static {p2, v0}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {p1}, Lcom/android/launcher3/resource/j$c$a;->d(Lcom/android/launcher3/resource/j$c$a;)Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    new-instance v1, Landroid/util/Pair;

    .line 157
    .line 158
    iget-object v2, p0, Lcom/android/launcher3/resource/j$c;->f:Ljava/util/List;

    .line 159
    .line 160
    invoke-direct {v1, v0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    :cond_4
    const-string p1, "widgetClassOrder"

    .line 167
    .line 168
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_5

    .line 177
    .line 178
    iget-object p0, p0, Lcom/android/launcher3/resource/j$c;->f:Ljava/util/List;

    .line 179
    .line 180
    const-string p1, "className"

    .line 181
    .line 182
    invoke-static {p2, p1}, Lcom/android/launcher3/resource/I1;->e(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    :cond_5
    return-void
.end method
