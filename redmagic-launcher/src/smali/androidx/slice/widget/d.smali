.class public Landroidx/slice/widget/d;
.super Landroidx/slice/widget/i;
.source "ListContent.java"


# instance fields
.field private f:Lh0/d;

.field private g:Landroidx/slice/widget/f;

.field private h:Landroidx/slice/widget/f;

.field private i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/widget/i;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lh0/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/slice/Slice;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/slice/widget/i;-><init>(Landroidx/slice/Slice;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0, p1}, Landroidx/slice/widget/d;->q(Landroidx/slice/Slice;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private static h(Landroidx/slice/Slice;)Landroidx/slice/SliceItem;
    .locals 8

    .line 1
    const-string v6, "horizontal"

    .line 2
    .line 3
    const-string v7, "selection_option"

    .line 4
    .line 5
    const-string v0, "list_item"

    .line 6
    .line 7
    const-string v1, "shortcut"

    .line 8
    .line 9
    const-string v2, "actions"

    .line 10
    .line 11
    const-string v3, "keywords"

    .line 12
    .line 13
    const-string v4, "ttl"

    .line 14
    .line 15
    const-string v5, "last_updated"

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "slice"

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-static {p0, v1, v2, v0}, Lh0/f;->e(Landroidx/slice/Slice;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-static {p0}, Landroidx/slice/widget/d;->p(Landroidx/slice/SliceItem;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    return-object v2
.end method

.method private i()Lh0/d;
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroidx/slice/widget/f;->l()Landroidx/slice/SliceItem;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v0, v1

    .line 12
    :goto_0
    const-string v2, "action"

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, "shortcut"

    .line 17
    .line 18
    const-string v3, "title"

    .line 19
    .line 20
    filled-new-array {v0, v3}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v3, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 25
    .line 26
    invoke-static {v3, v2, v0, v1}, Lh0/f;->h(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :cond_1
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 33
    .line 34
    invoke-static {p0, v2, v1, v1}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :cond_2
    if-eqz v0, :cond_3

    .line 39
    .line 40
    new-instance p0, Lh0/e;

    .line 41
    .line 42
    invoke-direct {p0, v0}, Lh0/e;-><init>(Landroidx/slice/SliceItem;)V

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    return-object v1
.end method

.method public static m(Landroidx/slice/widget/i;ZLjava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/slice/widget/i;",
            "Z",
            "Ljava/util/List<",
            "Lh0/d;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_9

    .line 3
    .line 4
    instance-of v1, p0, Landroidx/slice/widget/c;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    check-cast p0, Landroidx/slice/widget/f;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/slice/widget/f;->l()Landroidx/slice/SliceItem;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    new-instance v2, Lh0/e;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Lh0/e;-><init>(Landroidx/slice/SliceItem;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v2, 0x0

    .line 25
    :goto_0
    invoke-virtual {p0}, Landroidx/slice/widget/f;->m()Landroidx/slice/SliceItem;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/slice/widget/f;->m()Landroidx/slice/SliceItem;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "action"

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    const/4 p0, 0x4

    .line 48
    return p0

    .line 49
    :cond_2
    const/4 p0, 0x5

    .line 50
    return p0

    .line 51
    :cond_3
    invoke-virtual {p0}, Landroidx/slice/widget/f;->n()Landroidx/slice/SliceItem;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    if-eqz v1, :cond_4

    .line 56
    .line 57
    const/4 p0, 0x6

    .line 58
    return p0

    .line 59
    :cond_4
    const/4 v1, 0x3

    .line 60
    if-eqz v2, :cond_5

    .line 61
    .line 62
    invoke-interface {v2}, Lh0/d;->a()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_5

    .line 67
    .line 68
    return v1

    .line 69
    :cond_5
    if-eqz p1, :cond_8

    .line 70
    .line 71
    if-eqz p2, :cond_8

    .line 72
    .line 73
    move p0, v0

    .line 74
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-ge p0, p1, :cond_7

    .line 79
    .line 80
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Lh0/d;

    .line 85
    .line 86
    invoke-interface {p1}, Lh0/d;->a()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_6

    .line 91
    .line 92
    return v1

    .line 93
    :cond_6
    add-int/lit8 p0, p0, 0x1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_7
    return v0

    .line 97
    :cond_8
    invoke-virtual {p0}, Landroidx/slice/widget/f;->o()Ljava/util/ArrayList;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-lez p0, :cond_9

    .line 106
    .line 107
    return v1

    .line 108
    :cond_9
    return v0
.end method

.method private static n(Landroidx/slice/Slice;)Landroidx/slice/SliceItem;
    .locals 4

    .line 1
    const-string v0, "see_more"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v1, v1, v0, v1}, Lh0/f;->o(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "slice"

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x1

    .line 39
    if-ne v1, v2, :cond_0

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Landroidx/slice/SliceItem;

    .line 47
    .line 48
    invoke-virtual {v2}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const-string v3, "action"

    .line 53
    .line 54
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Landroidx/slice/SliceItem;

    .line 65
    .line 66
    :cond_0
    return-object p0

    .line 67
    :cond_1
    return-object v1
.end method

.method private static p(Landroidx/slice/SliceItem;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "slice"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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
    const-string v0, "keywords"

    .line 15
    .line 16
    const-string v2, "see_more"

    .line 17
    .line 18
    const-string v3, "actions"

    .line 19
    .line 20
    filled-new-array {v3, v0, v2}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Landroidx/slice/SliceItem;->q([Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    const-string v0, "text"

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-static {p0, v0, v2, v2}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_0
    return v1
.end method

.method private q(Landroidx/slice/Slice;)V
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Lf0/a;->f(Landroidx/slice/Slice;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Landroidx/slice/widget/d;->j:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {p1}, Landroidx/slice/widget/d;->h(Landroidx/slice/Slice;)Landroidx/slice/SliceItem;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    new-instance v2, Landroidx/slice/widget/f;

    .line 18
    .line 19
    invoke-direct {v2, v0, v1}, Landroidx/slice/widget/f;-><init>(Landroidx/slice/SliceItem;I)V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 23
    .line 24
    iget-object v0, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-static {p1}, Landroidx/slice/widget/d;->n(Landroidx/slice/Slice;)Landroidx/slice/SliceItem;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    new-instance v2, Landroidx/slice/widget/f;

    .line 36
    .line 37
    const/4 v3, -0x1

    .line 38
    invoke-direct {v2, v0, v3}, Landroidx/slice/widget/f;-><init>(Landroidx/slice/SliceItem;I)V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Landroidx/slice/widget/d;->h:Landroidx/slice/widget/f;

    .line 42
    .line 43
    :cond_2
    invoke-virtual {p1}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    move v0, v1

    .line 48
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-ge v0, v2, :cond_7

    .line 53
    .line 54
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Landroidx/slice/SliceItem;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const-string v4, "ttl"

    .line 65
    .line 66
    const-string v5, "last_updated"

    .line 67
    .line 68
    const-string v6, "actions"

    .line 69
    .line 70
    const-string v7, "see_more"

    .line 71
    .line 72
    const-string v8, "keywords"

    .line 73
    .line 74
    filled-new-array {v6, v7, v8, v4, v5}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v2, v4}, Landroidx/slice/SliceItem;->q([Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-nez v4, :cond_6

    .line 83
    .line 84
    const-string v4, "action"

    .line 85
    .line 86
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-nez v4, :cond_3

    .line 91
    .line 92
    const-string v4, "slice"

    .line 93
    .line 94
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-eqz v3, :cond_6

    .line 99
    .line 100
    :cond_3
    iget-object v3, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 101
    .line 102
    const-string v4, "list_item"

    .line 103
    .line 104
    if-nez v3, :cond_4

    .line 105
    .line 106
    invoke-virtual {v2, v4}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-nez v3, :cond_4

    .line 111
    .line 112
    new-instance v3, Landroidx/slice/widget/f;

    .line 113
    .line 114
    invoke-direct {v3, v2, v1}, Landroidx/slice/widget/f;-><init>(Landroidx/slice/SliceItem;I)V

    .line 115
    .line 116
    .line 117
    iput-object v3, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 118
    .line 119
    iget-object v2, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-virtual {v2, v1, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_4
    invoke-virtual {v2, v4}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-eqz v3, :cond_6

    .line 130
    .line 131
    const-string v3, "horizontal"

    .line 132
    .line 133
    invoke-virtual {v2, v3}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_5

    .line 138
    .line 139
    iget-object v3, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 140
    .line 141
    new-instance v4, Landroidx/slice/widget/c;

    .line 142
    .line 143
    invoke-direct {v4, v2, v0}, Landroidx/slice/widget/c;-><init>(Landroidx/slice/SliceItem;I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_5
    iget-object v3, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 151
    .line 152
    new-instance v4, Landroidx/slice/widget/f;

    .line 153
    .line 154
    invoke-direct {v4, v2, v0}, Landroidx/slice/widget/f;-><init>(Landroidx/slice/SliceItem;I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    :cond_6
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_7
    iget-object p1, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 164
    .line 165
    const/4 v0, 0x1

    .line 166
    if-nez p1, :cond_8

    .line 167
    .line 168
    iget-object p1, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 169
    .line 170
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-lt p1, v0, :cond_8

    .line 175
    .line 176
    iget-object p1, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 177
    .line 178
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    check-cast p1, Landroidx/slice/widget/f;

    .line 183
    .line 184
    iput-object p1, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Landroidx/slice/widget/f;->v(Z)V

    .line 187
    .line 188
    .line 189
    :cond_8
    iget-object p1, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-lez p1, :cond_9

    .line 196
    .line 197
    iget-object p1, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    sub-int/2addr v1, v0

    .line 204
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    instance-of p1, p1, Landroidx/slice/widget/c;

    .line 209
    .line 210
    if-eqz p1, :cond_9

    .line 211
    .line 212
    iget-object p1, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    sub-int/2addr v1, v0

    .line 219
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    check-cast p1, Landroidx/slice/widget/c;

    .line 224
    .line 225
    invoke-virtual {p1, v0}, Landroidx/slice/widget/c;->r(Z)V

    .line 226
    .line 227
    .line 228
    :cond_9
    invoke-direct {p0}, Landroidx/slice/widget/d;->i()Lh0/d;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Landroidx/slice/widget/d;->f:Lh0/d;

    .line 233
    .line 234
    return-void
.end method


# virtual methods
.method public d(Landroid/content/Context;)Lh0/d;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/d;->f:Lh0/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-super {p0, p1}, Landroidx/slice/widget/i;->d(Landroid/content/Context;)Lh0/d;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public g()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/slice/widget/i;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public j()Landroidx/slice/widget/f;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Landroidx/slice/widget/d;->j:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0, v1, p0}, Landroidx/slice/widget/d;->m(Landroidx/slice/widget/i;ZLjava/util/List;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public l(Landroidx/slice/widget/l;Landroidx/slice/widget/n;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public o()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lh0/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/d;->j:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroidx/slice/widget/i;

    .line 18
    .line 19
    instance-of v1, v0, Landroidx/slice/widget/f;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    check-cast v0, Landroidx/slice/widget/f;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroidx/slice/widget/f;->w(Z)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-void
.end method

.method public s(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/slice/widget/d;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroidx/slice/widget/f;->x(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/d;->g:Landroidx/slice/widget/f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/slice/widget/f;->y(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
