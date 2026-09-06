.class public Landroidx/slice/widget/f;
.super Landroidx/slice/widget/i;
.source "RowContent.java"


# instance fields
.field private f:Landroidx/slice/SliceItem;

.field private g:Landroidx/slice/SliceItem;

.field private h:Landroidx/slice/SliceItem;

.field private i:Landroidx/slice/SliceItem;

.field private j:Landroidx/slice/SliceItem;

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field private l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lh0/d;",
            ">;"
        }
    .end annotation
.end field

.field private m:Landroidx/slice/SliceItem;

.field private n:Landroidx/slice/SliceItem;

.field private o:Z

.field private p:I

.field private q:Z

.field private r:Z

.field private s:Z


# direct methods
.method public constructor <init>(Landroidx/slice/SliceItem;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/slice/widget/i;-><init>(Landroidx/slice/SliceItem;I)V

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
    iput-object v0, p0, Landroidx/slice/widget/f;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/slice/widget/f;->l:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Landroidx/slice/widget/f;->p:I

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    :cond_0
    invoke-direct {p0, p1, v0}, Landroidx/slice/widget/f;->t(Landroidx/slice/SliceItem;Z)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private h(Landroidx/slice/SliceItem;)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "title"

    .line 3
    .line 4
    invoke-static {p1, v0, v1, v0}, Lh0/f;->i(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const-string v4, "slice"

    .line 13
    .line 14
    const-string v5, "action"

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    if-lez v3, :cond_2

    .line 18
    .line 19
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Landroidx/slice/SliceItem;

    .line 24
    .line 25
    invoke-virtual {v3}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    const-string v8, "image"

    .line 34
    .line 35
    if-eqz v7, :cond_0

    .line 36
    .line 37
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    check-cast v7, Landroidx/slice/SliceItem;

    .line 42
    .line 43
    invoke-static {v7, v8}, Lh0/f;->f(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    if-nez v7, :cond_1

    .line 48
    .line 49
    :cond_0
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-nez v7, :cond_1

    .line 54
    .line 55
    const-string v7, "long"

    .line 56
    .line 57
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    if-nez v7, :cond_1

    .line 62
    .line 63
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    :cond_1
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Landroidx/slice/SliceItem;

    .line 74
    .line 75
    iput-object v2, p0, Landroidx/slice/widget/f;->g:Landroidx/slice/SliceItem;

    .line 76
    .line 77
    :cond_2
    const-string v2, "shortcut"

    .line 78
    .line 79
    filled-new-array {v2, v1}, [Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {p1, v4, v1, v0}, Lh0/f;->j(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-static {p1, v5, v1, v0}, Lh0/f;->j(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    const/4 v1, 0x1

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-ne v0, v1, :cond_3

    .line 124
    .line 125
    iput-object p1, p0, Landroidx/slice/widget/f;->f:Landroidx/slice/SliceItem;

    .line 126
    .line 127
    return-void

    .line 128
    :cond_3
    iget-object p1, p0, Landroidx/slice/widget/f;->g:Landroidx/slice/SliceItem;

    .line 129
    .line 130
    if-eqz p1, :cond_4

    .line 131
    .line 132
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-le p1, v1, :cond_4

    .line 137
    .line 138
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object v0, p0, Landroidx/slice/widget/f;->g:Landroidx/slice/SliceItem;

    .line 143
    .line 144
    if-ne p1, v0, :cond_4

    .line 145
    .line 146
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Landroidx/slice/SliceItem;

    .line 151
    .line 152
    iput-object p1, p0, Landroidx/slice/widget/f;->f:Landroidx/slice/SliceItem;

    .line 153
    .line 154
    return-void

    .line 155
    :cond_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-lez p1, :cond_5

    .line 160
    .line 161
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    check-cast p1, Landroidx/slice/SliceItem;

    .line 166
    .line 167
    iput-object p1, p0, Landroidx/slice/widget/f;->f:Landroidx/slice/SliceItem;

    .line 168
    .line 169
    :cond_5
    return-void
.end method

.method private static i(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/slice/SliceItem;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroidx/slice/SliceItem;

    .line 29
    .line 30
    invoke-static {p0, v2}, Landroidx/slice/widget/f;->s(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-object v0
.end method

.method private static p(Landroidx/slice/SliceItem;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const-string v0, "partial"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->p()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private static r(Landroidx/slice/SliceItem;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "slice"

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string v1, "action"

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_4

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "see_more"

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const/4 v3, 0x1

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    return v3

    .line 53
    :cond_2
    move v2, v0

    .line 54
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-ge v2, v4, :cond_4

    .line 59
    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Landroidx/slice/SliceItem;

    .line 65
    .line 66
    invoke-static {p0, v4}, Landroidx/slice/widget/f;->s(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_3

    .line 71
    .line 72
    return v3

    .line 73
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    return v0
.end method

.method private static s(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)Z
    .locals 4

    .line 1
    const-string v0, "last_updated"

    .line 2
    .line 3
    const-string v1, "horizontal"

    .line 4
    .line 5
    const-string v2, "keywords"

    .line 6
    .line 7
    const-string v3, "ttl"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Landroidx/slice/SliceItem;->q([Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    const-string v0, "content_description"

    .line 21
    .line 22
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    const-string v0, "selection_option_key"

    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    const-string v0, "selection_option_value"

    .line 45
    .line 46
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "image"

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    const-string v0, "text"

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    const-string v0, "long"

    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_2

    .line 84
    .line 85
    const-string v0, "action"

    .line 86
    .line 87
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    const-string v0, "input"

    .line 94
    .line 95
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_2

    .line 100
    .line 101
    const-string v0, "slice"

    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_2

    .line 108
    .line 109
    const-string v0, "int"

    .line 110
    .line 111
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_1

    .line 116
    .line 117
    const-string p1, "range"

    .line 118
    .line 119
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_1
    return v1

    .line 131
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 132
    return p0

    .line 133
    :cond_3
    :goto_1
    return v1
.end method

.method private t(Landroidx/slice/SliceItem;Z)Z
    .locals 8

    .line 1
    iput-boolean p2, p0, Landroidx/slice/widget/f;->o:Z

    .line 2
    .line 3
    invoke-static {p1}, Landroidx/slice/widget/f;->r(Landroidx/slice/SliceItem;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    const-string p0, "RowContent"

    .line 11
    .line 12
    const-string p1, "Provided SliceItem is invalid for RowContent"

    .line 13
    .line 14
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    invoke-direct {p0, p1}, Landroidx/slice/widget/f;->h(Landroidx/slice/SliceItem;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Landroidx/slice/widget/f;->i(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, "title"

    .line 30
    .line 31
    const-string v3, "action"

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    if-ne v1, v4, :cond_2

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroidx/slice/SliceItem;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Landroidx/slice/SliceItem;

    .line 57
    .line 58
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v5, "slice"

    .line 63
    .line 64
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    :cond_1
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Landroidx/slice/SliceItem;

    .line 75
    .line 76
    const-string v5, "shortcut"

    .line 77
    .line 78
    filled-new-array {v5, v2}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-virtual {v1, v5}, Landroidx/slice/SliceItem;->q([Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_2

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Landroidx/slice/SliceItem;

    .line 93
    .line 94
    invoke-static {v1}, Landroidx/slice/widget/f;->r(Landroidx/slice/SliceItem;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Landroidx/slice/SliceItem;

    .line 105
    .line 106
    invoke-static {p1}, Landroidx/slice/widget/f;->i(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    move v1, v4

    .line 111
    goto :goto_0

    .line 112
    :cond_2
    move v1, v0

    .line 113
    :goto_0
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    const-string v6, "range"

    .line 118
    .line 119
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-eqz v5, :cond_6

    .line 124
    .line 125
    invoke-static {p1, v3, v6}, Lh0/f;->n(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    if-eqz v5, :cond_5

    .line 130
    .line 131
    if-eqz v1, :cond_3

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_3
    iget-object v1, p0, Landroidx/slice/widget/f;->g:Landroidx/slice/SliceItem;

    .line 135
    .line 136
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-ne v1, v4, :cond_4

    .line 144
    .line 145
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, Landroidx/slice/SliceItem;

    .line 150
    .line 151
    invoke-static {v1}, Landroidx/slice/widget/f;->r(Landroidx/slice/SliceItem;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_6

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    check-cast p1, Landroidx/slice/SliceItem;

    .line 162
    .line 163
    invoke-static {p1}, Landroidx/slice/widget/f;->i(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    iput-object p1, p0, Landroidx/slice/widget/f;->m:Landroidx/slice/SliceItem;

    .line 168
    .line 169
    invoke-virtual {p0}, Landroidx/slice/widget/f;->k()Landroidx/slice/SliceItem;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_4
    invoke-static {p1, v3, v6}, Lh0/f;->n(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iput-object v1, p0, Landroidx/slice/widget/f;->m:Landroidx/slice/SliceItem;

    .line 182
    .line 183
    invoke-static {v1}, Landroidx/slice/widget/f;->i(Landroidx/slice/SliceItem;)Ljava/util/ArrayList;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {p0}, Landroidx/slice/widget/f;->k()Landroidx/slice/SliceItem;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    iget-object v5, p0, Landroidx/slice/widget/f;->m:Landroidx/slice/SliceItem;

    .line 195
    .line 196
    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 200
    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_5
    :goto_1
    iput-object p1, p0, Landroidx/slice/widget/f;->m:Landroidx/slice/SliceItem;

    .line 204
    .line 205
    :cond_6
    :goto_2
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    const-string v5, "selection"

    .line 210
    .line 211
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-eqz v1, :cond_7

    .line 216
    .line 217
    iput-object p1, p0, Landroidx/slice/widget/f;->n:Landroidx/slice/SliceItem;

    .line 218
    .line 219
    :cond_7
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    if-lez p1, :cond_16

    .line 224
    .line 225
    iget-object p1, p0, Landroidx/slice/widget/f;->g:Landroidx/slice/SliceItem;

    .line 226
    .line 227
    if-eqz p1, :cond_8

    .line 228
    .line 229
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    :cond_8
    iget-object p1, p0, Landroidx/slice/widget/f;->f:Landroidx/slice/SliceItem;

    .line 233
    .line 234
    if-eqz p1, :cond_9

    .line 235
    .line 236
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    :cond_9
    new-instance p1, Ljava/util/ArrayList;

    .line 240
    .line 241
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 242
    .line 243
    .line 244
    move v1, v0

    .line 245
    :goto_3
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 246
    .line 247
    .line 248
    move-result v5

    .line 249
    if-ge v1, v5, :cond_f

    .line 250
    .line 251
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v5

    .line 255
    check-cast v5, Landroidx/slice/SliceItem;

    .line 256
    .line 257
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v6

    .line 261
    const-string v7, "text"

    .line 262
    .line 263
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v6

    .line 267
    if-eqz v6, :cond_d

    .line 268
    .line 269
    iget-object v6, p0, Landroidx/slice/widget/f;->h:Landroidx/slice/SliceItem;

    .line 270
    .line 271
    const-string v7, "summary"

    .line 272
    .line 273
    if-eqz v6, :cond_a

    .line 274
    .line 275
    invoke-virtual {v6, v2}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 276
    .line 277
    .line 278
    move-result v6

    .line 279
    if-nez v6, :cond_b

    .line 280
    .line 281
    :cond_a
    invoke-virtual {v5, v2}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v6

    .line 285
    if-eqz v6, :cond_b

    .line 286
    .line 287
    invoke-virtual {v5, v7}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v6

    .line 291
    if-nez v6, :cond_b

    .line 292
    .line 293
    iput-object v5, p0, Landroidx/slice/widget/f;->h:Landroidx/slice/SliceItem;

    .line 294
    .line 295
    goto :goto_4

    .line 296
    :cond_b
    iget-object v6, p0, Landroidx/slice/widget/f;->i:Landroidx/slice/SliceItem;

    .line 297
    .line 298
    if-nez v6, :cond_c

    .line 299
    .line 300
    invoke-virtual {v5, v7}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 301
    .line 302
    .line 303
    move-result v6

    .line 304
    if-nez v6, :cond_c

    .line 305
    .line 306
    iput-object v5, p0, Landroidx/slice/widget/f;->i:Landroidx/slice/SliceItem;

    .line 307
    .line 308
    goto :goto_4

    .line 309
    :cond_c
    iget-object v6, p0, Landroidx/slice/widget/f;->j:Landroidx/slice/SliceItem;

    .line 310
    .line 311
    if-nez v6, :cond_e

    .line 312
    .line 313
    invoke-virtual {v5, v7}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 314
    .line 315
    .line 316
    move-result v6

    .line 317
    if-eqz v6, :cond_e

    .line 318
    .line 319
    iput-object v5, p0, Landroidx/slice/widget/f;->j:Landroidx/slice/SliceItem;

    .line 320
    .line 321
    goto :goto_4

    .line 322
    :cond_d
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    :cond_e
    :goto_4
    add-int/lit8 v1, v1, 0x1

    .line 326
    .line 327
    goto :goto_3

    .line 328
    :cond_f
    iget-object p2, p0, Landroidx/slice/widget/f;->h:Landroidx/slice/SliceItem;

    .line 329
    .line 330
    invoke-static {p2}, Landroidx/slice/widget/f;->p(Landroidx/slice/SliceItem;)Z

    .line 331
    .line 332
    .line 333
    move-result p2

    .line 334
    if-eqz p2, :cond_10

    .line 335
    .line 336
    iget p2, p0, Landroidx/slice/widget/f;->p:I

    .line 337
    .line 338
    add-int/2addr p2, v4

    .line 339
    iput p2, p0, Landroidx/slice/widget/f;->p:I

    .line 340
    .line 341
    :cond_10
    iget-object p2, p0, Landroidx/slice/widget/f;->i:Landroidx/slice/SliceItem;

    .line 342
    .line 343
    invoke-static {p2}, Landroidx/slice/widget/f;->p(Landroidx/slice/SliceItem;)Z

    .line 344
    .line 345
    .line 346
    move-result p2

    .line 347
    if-eqz p2, :cond_11

    .line 348
    .line 349
    iget p2, p0, Landroidx/slice/widget/f;->p:I

    .line 350
    .line 351
    add-int/2addr p2, v4

    .line 352
    iput p2, p0, Landroidx/slice/widget/f;->p:I

    .line 353
    .line 354
    :cond_11
    iget-object p2, p0, Landroidx/slice/widget/f;->g:Landroidx/slice/SliceItem;

    .line 355
    .line 356
    const-string v1, "long"

    .line 357
    .line 358
    if-eqz p2, :cond_12

    .line 359
    .line 360
    invoke-virtual {p2}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p2

    .line 364
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    move-result p2

    .line 368
    if-eqz p2, :cond_12

    .line 369
    .line 370
    move p2, v4

    .line 371
    goto :goto_5

    .line 372
    :cond_12
    move p2, v0

    .line 373
    :goto_5
    move v2, v0

    .line 374
    :goto_6
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 375
    .line 376
    .line 377
    move-result v5

    .line 378
    if-ge v2, v5, :cond_16

    .line 379
    .line 380
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object v5

    .line 384
    check-cast v5, Landroidx/slice/SliceItem;

    .line 385
    .line 386
    invoke-static {v5, v3}, Lh0/f;->f(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 387
    .line 388
    .line 389
    move-result-object v6

    .line 390
    if-eqz v6, :cond_13

    .line 391
    .line 392
    move v6, v4

    .line 393
    goto :goto_7

    .line 394
    :cond_13
    move v6, v0

    .line 395
    :goto_7
    invoke-virtual {v5}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v7

    .line 399
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    move-result v7

    .line 403
    if-eqz v7, :cond_14

    .line 404
    .line 405
    if-nez p2, :cond_15

    .line 406
    .line 407
    iget-object p2, p0, Landroidx/slice/widget/f;->k:Ljava/util/ArrayList;

    .line 408
    .line 409
    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move p2, v4

    .line 413
    goto :goto_8

    .line 414
    :cond_14
    invoke-direct {p0, v5, v6}, Landroidx/slice/widget/f;->u(Landroidx/slice/SliceItem;Z)V

    .line 415
    .line 416
    .line 417
    :cond_15
    :goto_8
    add-int/lit8 v2, v2, 0x1

    .line 418
    .line 419
    goto :goto_6

    .line 420
    :cond_16
    invoke-virtual {p0}, Landroidx/slice/widget/f;->g()Z

    .line 421
    .line 422
    .line 423
    move-result p0

    .line 424
    return p0
.end method

.method private u(Landroidx/slice/SliceItem;Z)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance p2, Lh0/e;

    .line 4
    .line 5
    invoke-direct {p2, p1}, Lh0/e;-><init>(Landroidx/slice/SliceItem;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p2}, Lh0/d;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Landroidx/slice/widget/f;->l:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/f;->k:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public g()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/slice/widget/i;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/slice/widget/f;->g:Landroidx/slice/SliceItem;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/slice/widget/f;->f:Landroidx/slice/SliceItem;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/slice/widget/f;->h:Landroidx/slice/SliceItem;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Landroidx/slice/widget/f;->i:Landroidx/slice/SliceItem;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Landroidx/slice/widget/f;->k:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-gtz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Landroidx/slice/widget/f;->m:Landroidx/slice/SliceItem;

    .line 32
    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Landroidx/slice/widget/f;->n:Landroidx/slice/SliceItem;

    .line 36
    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Landroidx/slice/widget/f;->q()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    :cond_0
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public j()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/f;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Landroidx/slice/SliceItem;
    .locals 3

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/f;->m:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ge v0, v1, :cond_1

    .line 19
    .line 20
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroidx/slice/SliceItem;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "image"

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Landroidx/slice/SliceItem;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method public l()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/f;->f:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/f;->m:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/f;->n:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lh0/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/f;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "action"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "see_more"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/slice/Slice;->f(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Landroidx/slice/widget/i;->a:Landroidx/slice/SliceItem;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/f;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/f;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/f;->r:Z

    .line 2
    .line 3
    return-void
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/f;->q:Z

    .line 2
    .line 3
    return-void
.end method
