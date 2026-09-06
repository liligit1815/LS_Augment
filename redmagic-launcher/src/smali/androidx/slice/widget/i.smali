.class public Landroidx/slice/widget/i;
.super Ljava/lang/Object;
.source "SliceContent.java"


# instance fields
.field protected a:Landroidx/slice/SliceItem;

.field protected b:Landroidx/slice/SliceItem;

.field protected c:Landroidx/slice/SliceItem;

.field protected d:Landroidx/slice/SliceItem;

.field protected e:I


# direct methods
.method public constructor <init>(Landroidx/slice/Slice;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    return-void

    .line 2
    :cond_0
    new-instance v0, Landroidx/slice/SliceItem;

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroidx/slice/Slice;->b()Ljava/util/List;

    move-result-object v2

    const-string v3, "slice"

    invoke-direct {v0, p1, v3, v1, v2}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    invoke-direct {p0, v0}, Landroidx/slice/widget/i;->f(Landroidx/slice/SliceItem;)V

    const/4 p1, -0x1

    .line 3
    iput p1, p0, Landroidx/slice/widget/i;->e:I

    return-void
.end method

.method public constructor <init>(Landroidx/slice/SliceItem;I)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    return-void

    .line 5
    :cond_0
    invoke-direct {p0, p1}, Landroidx/slice/widget/i;->f(Landroidx/slice/SliceItem;)V

    .line 6
    iput p2, p0, Landroidx/slice/widget/i;->e:I

    return-void
.end method

.method private a(Landroid/content/Context;Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;ILandroidx/slice/SliceItem;)Lh0/d;
    .locals 9

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    const-string v0, "slice"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {p0, v0, v1, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroidx/slice/Slice;->e()Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    invoke-virtual {p3}, Landroidx/slice/SliceItem;->i()Landroidx/core/graphics/drawable/IconCompat;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object p3, v1

    .line 29
    :goto_0
    if-eqz p2, :cond_2

    .line 30
    .line 31
    invoke-virtual {p2}, Landroidx/slice/SliceItem;->p()Ljava/lang/CharSequence;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    goto :goto_1

    .line 36
    :cond_2
    move-object p2, v1

    .line 37
    :goto_1
    const/4 v0, 0x0

    .line 38
    if-eqz p1, :cond_6

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3, v0}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    iget-object v3, v3, Landroid/content/pm/ProviderInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    move-object v3, v1

    .line 58
    :goto_2
    if-eqz v3, :cond_6

    .line 59
    .line 60
    if-nez p3, :cond_4

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getApplicationIcon(Landroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-static {p3}, Landroidx/slice/widget/o;->a(Landroid/graphics/drawable/Drawable;)Landroidx/core/graphics/drawable/IconCompat;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    const/4 p4, 0x2

    .line 71
    :cond_4
    if-nez p2, :cond_5

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    :cond_5
    if-nez p5, :cond_6

    .line 78
    .line 79
    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    if-eqz v2, :cond_6

    .line 86
    .line 87
    new-instance v3, Landroidx/slice/SliceItem;

    .line 88
    .line 89
    invoke-static {p1, v0, v2, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    new-instance p5, Landroidx/slice/Slice$a;

    .line 94
    .line 95
    invoke-direct {p5, p0}, Landroidx/slice/Slice$a;-><init>(Landroid/net/Uri;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p5}, Landroidx/slice/Slice$a;->a()Landroidx/slice/Slice;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    const/4 v7, 0x0

    .line 103
    new-array v8, v0, [Ljava/lang/String;

    .line 104
    .line 105
    const-string v6, "action"

    .line 106
    .line 107
    invoke-direct/range {v3 .. v8}, Landroidx/slice/SliceItem;-><init>(Landroid/app/PendingIntent;Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    move-object p5, v3

    .line 111
    :cond_6
    if-nez p5, :cond_7

    .line 112
    .line 113
    new-instance p0, Landroid/content/Intent;

    .line 114
    .line 115
    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {p1, v0, p0, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    new-instance v2, Landroidx/slice/SliceItem;

    .line 123
    .line 124
    const/4 v6, 0x0

    .line 125
    const/4 v7, 0x0

    .line 126
    const/4 v4, 0x0

    .line 127
    const-string v5, "action"

    .line 128
    .line 129
    invoke-direct/range {v2 .. v7}, Landroidx/slice/SliceItem;-><init>(Landroid/app/PendingIntent;Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    move-object p5, v2

    .line 133
    :cond_7
    if-eqz p2, :cond_8

    .line 134
    .line 135
    if-eqz p3, :cond_8

    .line 136
    .line 137
    new-instance p0, Lh0/e;

    .line 138
    .line 139
    invoke-virtual {p5}, Landroidx/slice/SliceItem;->g()Landroid/app/PendingIntent;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-direct {p0, p1, p3, p4, p2}, Lh0/e;-><init>(Landroid/app/PendingIntent;Landroidx/core/graphics/drawable/IconCompat;ILjava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    return-object p0

    .line 147
    :cond_8
    return-object v1
.end method

.method private f(Landroidx/slice/SliceItem;)V
    .locals 4

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "slice"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "action"

    .line 16
    .line 17
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "color"

    .line 32
    .line 33
    const-string v2, "int"

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-static {v0, v2, v1, v3, v3}, Lh0/f;->o(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Landroidx/slice/widget/i;->b:Landroidx/slice/SliceItem;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "layout_direction"

    .line 47
    .line 48
    invoke-static {v0, v2, v1, v3, v3}, Lh0/f;->o(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Landroidx/slice/widget/i;->c:Landroidx/slice/SliceItem;

    .line 53
    .line 54
    :cond_1
    const-string v0, "text"

    .line 55
    .line 56
    const-string v1, "content_description"

    .line 57
    .line 58
    invoke-static {p1, v0, v1}, Lh0/f;->n(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Landroidx/slice/widget/i;->d:Landroidx/slice/SliceItem;

    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/i;->d:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->p()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/i;->c:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->j()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Landroidx/slice/widget/o;->f(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public d(Landroid/content/Context;)Lh0/d;
    .locals 14

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

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
    const-string v2, "shortcut"

    .line 8
    .line 9
    const-string v3, "title"

    .line 10
    .line 11
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v4, "action"

    .line 16
    .line 17
    invoke-static {v0, v4, v2, v1}, Lh0/f;->h(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v2, "text"

    .line 22
    .line 23
    const-string v5, "image"

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {v0, v5, v3, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    invoke-static {v0, v2, v1, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move-object v6, v1

    .line 37
    move-object v7, v6

    .line 38
    :goto_0
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 41
    .line 42
    invoke-static {v0, v4, v1, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :cond_2
    move-object v13, v0

    .line 47
    if-nez v6, :cond_3

    .line 48
    .line 49
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 50
    .line 51
    invoke-static {v0, v5, v3, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    :cond_3
    if-nez v7, :cond_4

    .line 56
    .line 57
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 58
    .line 59
    invoke-static {v0, v2, v3, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    :cond_4
    if-nez v6, :cond_5

    .line 64
    .line 65
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 66
    .line 67
    invoke-static {v0, v5, v1, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    :cond_5
    move-object v11, v6

    .line 72
    if-nez v7, :cond_6

    .line 73
    .line 74
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 75
    .line 76
    invoke-static {v0, v2, v1, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    :cond_6
    move-object v10, v7

    .line 81
    if-eqz v11, :cond_7

    .line 82
    .line 83
    invoke-static {v11}, Landroidx/slice/b;->a(Landroidx/slice/SliceItem;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    :goto_1
    move v12, v0

    .line 88
    goto :goto_2

    .line 89
    :cond_7
    const/4 v0, 0x5

    .line 90
    goto :goto_1

    .line 91
    :goto_2
    if-eqz p1, :cond_8

    .line 92
    .line 93
    move-object v8, p0

    .line 94
    move-object v9, p1

    .line 95
    invoke-direct/range {v8 .. v13}, Landroidx/slice/widget/i;->a(Landroid/content/Context;Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;ILandroidx/slice/SliceItem;)Lh0/d;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_8
    if-eqz v11, :cond_9

    .line 101
    .line 102
    if-eqz v13, :cond_9

    .line 103
    .line 104
    if-eqz v10, :cond_9

    .line 105
    .line 106
    new-instance p0, Lh0/e;

    .line 107
    .line 108
    invoke-virtual {v13}, Landroidx/slice/SliceItem;->g()Landroid/app/PendingIntent;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {v11}, Landroidx/slice/SliceItem;->i()Landroidx/core/graphics/drawable/IconCompat;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v10}, Landroidx/slice/SliceItem;->p()Ljava/lang/CharSequence;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-direct {p0, p1, v0, v12, v1}, Lh0/e;-><init>(Landroid/app/PendingIntent;Landroidx/core/graphics/drawable/IconCompat;ILjava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    return-object p0

    .line 124
    :cond_9
    return-object v1
.end method

.method public e()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
