.class public abstract Lcom/android/launcher3/util/P0;
.super Ljava/lang/Object;
.source "ItemInfoMatcher.java"


# static fields
.field private static final a:Landroid/content/ComponentName;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, v1, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/util/P0;->a:Landroid/content/ComponentName;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ljava/util/function/Predicate;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/p;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1, p0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

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

.method public static synthetic b(Landroid/os/UserHandle;Ljava/util/HashSet;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p2}, Lcom/android/launcher3/util/P0;->o(Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static synthetic c(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Landroid/os/UserHandle;Ljava/util/Set;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p2}, Lcom/android/launcher3/util/P0;->o(Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

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

.method public static synthetic e(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f([Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)Z
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_1

    .line 5
    .line 6
    aget-object v3, p0, v2

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object v4, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 11
    .line 12
    invoke-virtual {v4, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return v1
.end method

.method public static synthetic g(Ljava/util/Set;Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 4
    .line 5
    const/4 v1, 0x6

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, LN1/e;->d(Lcom/android/launcher3/model/data/y;)LN1/e;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static synthetic h(Landroid/os/UserHandle;Ljava/util/Set;Lcom/android/launcher3/model/data/y;)Z
    .locals 5

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 4
    .line 5
    const/4 v1, 0x6

    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "com.zte.mifavor.splitscreengroup"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "shortcut_component_primary"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v2, "shortcut_component_secondary"

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const-string v4, "shortcut_user_primary"

    .line 89
    .line 90
    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    const-string v4, "shortcut_user_secondary"

    .line 119
    .line 120
    invoke-virtual {p2, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v3, v1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3, p2}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {p0, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_0

    .line 153
    .line 154
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_1

    .line 163
    .line 164
    :cond_0
    invoke-virtual {p0, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    if-eqz p0, :cond_2

    .line 169
    .line 170
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-eqz p0, :cond_2

    .line 179
    .line 180
    :cond_1
    const/4 p0, 0x1

    .line 181
    return p0

    .line 182
    :cond_2
    const/4 p0, 0x0

    .line 183
    return p0
.end method

.method public static synthetic i(Lz1/y0;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    if-eqz p2, :cond_3

    .line 2
    .line 3
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 4
    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-object p0, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Lcom/android/launcher3/util/F0;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/android/launcher3/util/F0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    instance-of v1, v0, Lcom/android/launcher3/model/data/p;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 47
    .line 48
    const/16 v1, 0x20

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/4 v0, 0x0

    .line 58
    :goto_0
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget p0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 61
    .line 62
    iget v0, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 63
    .line 64
    if-ne p0, v0, :cond_2

    .line 65
    .line 66
    iget-object p0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_2

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 78
    return p0
.end method

.method public static synthetic j(Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static synthetic k(Lcom/android/launcher3/util/z0;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static synthetic l(Landroid/os/UserHandle;Ljava/lang/String;Landroid/os/UserHandle;Ljava/lang/String;Lcom/android/launcher3/model/data/y;)Z
    .locals 5

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    iget v0, p4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 4
    .line 5
    const/4 v1, 0x6

    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "com.zte.mifavor.splitscreengroup"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "shortcut_component_primary"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v2, "shortcut_component_secondary"

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const-string v4, "shortcut_user_primary"

    .line 89
    .line 90
    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object p4

    .line 106
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v3, v4}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    const-string v4, "shortcut_user_secondary"

    .line 119
    .line 120
    invoke-virtual {p4, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 121
    .line 122
    .line 123
    move-result p4

    .line 124
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v3, v1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v3, p4}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 145
    .line 146
    .line 147
    move-result-object p4

    .line 148
    invoke-virtual {p0, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-eqz v3, :cond_0

    .line 153
    .line 154
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-eqz v3, :cond_0

    .line 163
    .line 164
    invoke-virtual {p2, p4}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    if-eqz v3, :cond_0

    .line 169
    .line 170
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {p3, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    if-nez v3, :cond_1

    .line 179
    .line 180
    :cond_0
    invoke-virtual {p2, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    if-eqz p2, :cond_2

    .line 185
    .line 186
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-virtual {p3, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-eqz p2, :cond_2

    .line 195
    .line 196
    invoke-virtual {p0, p4}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-eqz p0, :cond_2

    .line 201
    .line 202
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    if-eqz p0, :cond_2

    .line 211
    .line 212
    :cond_1
    const/4 p0, 0x1

    .line 213
    return p0

    .line 214
    :cond_2
    const/4 p0, 0x0

    .line 215
    return p0
.end method

.method public static synthetic m(ILcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 4
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

.method public static n(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/H0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/H0;-><init>(Ljava/util/function/Predicate;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static o(Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/android/launcher3/util/P0;->a:Landroid/content/ComponentName;

    .line 9
    .line 10
    return-object p0
.end method

.method public static p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Landroid/content/ComponentName;",
            ">;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/G0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/util/G0;-><init>(Landroid/os/UserHandle;Ljava/util/HashSet;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/z0;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/M0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/M0;-><init>(Lcom/android/launcher3/util/z0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static r(I)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/E0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/E0;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static s(Ljava/util/Collection;)Ljava/util/function/Predicate;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;)",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/z0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/util/O0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lcom/android/launcher3/util/O0;-><init>(Lcom/android/launcher3/util/z0;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0, v1}, Ljava/util/Collection;->forEach(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/launcher3/util/P0;->q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/L0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/util/L0;-><init>(Landroid/os/UserHandle;Ljava/util/Set;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static u(Lz1/y0;Landroid/os/UserHandle;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/y0;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/N0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/util/N0;-><init>(Lz1/y0;Landroid/os/UserHandle;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static v(Ljava/util/Set;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "LN1/e;",
            ">;)",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/K0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/K0;-><init>(Ljava/util/Set;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static w(Ljava/lang/String;Landroid/os/UserHandle;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/C0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0, p3, p2}, Lcom/android/launcher3/util/C0;-><init>(Landroid/os/UserHandle;Ljava/lang/String;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static x(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/D0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/util/D0;-><init>(Landroid/os/UserHandle;Ljava/util/Set;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static y(Landroid/os/UserHandle;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/I0;-><init>(Landroid/os/UserHandle;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static varargs z([Landroid/os/UserHandle;)Ljava/util/function/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/os/UserHandle;",
            ")",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/J0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/util/J0;-><init>([Landroid/os/UserHandle;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
