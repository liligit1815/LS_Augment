.class public Landroidx/slice/widget/c;
.super Landroidx/slice/widget/i;
.source "GridContent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/c$a;
    }
.end annotation


# instance fields
.field private f:Z

.field private g:Landroidx/slice/SliceItem;

.field private h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/widget/c$a;",
            ">;"
        }
    .end annotation
.end field

.field private i:Landroidx/slice/SliceItem;

.field private j:I

.field private k:Z

.field private l:I

.field private m:Z

.field private n:Landroidx/slice/SliceItem;


# direct methods
.method public constructor <init>(Landroidx/slice/SliceItem;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/slice/widget/i;-><init>(Landroidx/slice/SliceItem;I)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Landroidx/slice/widget/c;->h:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 p2, 0x5

    .line 12
    iput p2, p0, Landroidx/slice/widget/c;->l:I

    .line 13
    .line 14
    invoke-direct {p0, p1}, Landroidx/slice/widget/c;->p(Landroidx/slice/SliceItem;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private h(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/slice/SliceItem;",
            ">;)",
            "Ljava/util/List<",
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
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_4

    .line 13
    .line 14
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Landroidx/slice/SliceItem;

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    const-string v5, "see_more"

    .line 22
    .line 23
    invoke-static {v3, v4, v5, v4}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const-string v4, "ttl"

    .line 31
    .line 32
    const-string v6, "last_updated"

    .line 33
    .line 34
    const-string v7, "shortcut"

    .line 35
    .line 36
    const-string v8, "keywords"

    .line 37
    .line 38
    filled-new-array {v7, v5, v8, v4, v6}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v3, v4}, Landroidx/slice/SliceItem;->q([Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-eqz v4, :cond_1

    .line 47
    .line 48
    :goto_1
    const/4 v4, 0x1

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    move v4, v1

    .line 51
    :goto_2
    invoke-virtual {v3}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    const-string v6, "content_description"

    .line 56
    .line 57
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-eqz v5, :cond_2

    .line 62
    .line 63
    iput-object v3, p0, Landroidx/slice/widget/i;->d:Landroidx/slice/SliceItem;

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_2
    if-nez v4, :cond_3

    .line 67
    .line 68
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    return-object v0
.end method

.method private p(Landroidx/slice/SliceItem;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "see_more"

    .line 3
    .line 4
    invoke-static {p1, v0, v1, v0}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Landroidx/slice/widget/c;->i:Landroidx/slice/SliceItem;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "slice"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Landroidx/slice/widget/c;->i:Landroidx/slice/SliceItem;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-lez v3, :cond_0

    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroidx/slice/SliceItem;

    .line 48
    .line 49
    iput-object v0, p0, Landroidx/slice/widget/c;->i:Landroidx/slice/SliceItem;

    .line 50
    .line 51
    :cond_0
    const-string v0, "shortcut"

    .line 52
    .line 53
    const-string v3, "title"

    .line 54
    .line 55
    filled-new-array {v0, v3}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v3, "actions"

    .line 60
    .line 61
    filled-new-array {v3}, [Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-static {p1, v2, v0, v3}, Lh0/f;->h(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Landroidx/slice/widget/c;->g:Landroidx/slice/SliceItem;

    .line 70
    .line 71
    const/4 v0, 0x1

    .line 72
    iput-boolean v0, p0, Landroidx/slice/widget/c;->f:Z

    .line 73
    .line 74
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-direct {p0, p1}, Landroidx/slice/widget/c;->h(Ljava/util/List;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-ge v1, v0, :cond_3

    .line 101
    .line 102
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Landroidx/slice/SliceItem;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    const-string v3, "content_description"

    .line 113
    .line 114
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-nez v2, :cond_1

    .line 119
    .line 120
    new-instance v2, Landroidx/slice/widget/c$a;

    .line 121
    .line 122
    invoke-direct {v2, v0}, Landroidx/slice/widget/c$a;-><init>(Landroidx/slice/SliceItem;)V

    .line 123
    .line 124
    .line 125
    invoke-direct {p0, v2}, Landroidx/slice/widget/c;->q(Landroidx/slice/widget/c$a;)V

    .line 126
    .line 127
    .line 128
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_2
    new-instance v0, Landroidx/slice/widget/c$a;

    .line 132
    .line 133
    invoke-direct {v0, p1}, Landroidx/slice/widget/c$a;-><init>(Landroidx/slice/SliceItem;)V

    .line 134
    .line 135
    .line 136
    invoke-direct {p0, v0}, Landroidx/slice/widget/c;->q(Landroidx/slice/widget/c$a;)V

    .line 137
    .line 138
    .line 139
    :cond_3
    invoke-virtual {p0}, Landroidx/slice/widget/c;->g()Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    return p0
.end method

.method private q(Landroidx/slice/widget/c$a;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/slice/widget/c;->n:Landroidx/slice/SliceItem;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->f()Landroidx/slice/SliceItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->f()Landroidx/slice/SliceItem;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Landroidx/slice/widget/c;->n:Landroidx/slice/SliceItem;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/c;->h:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->h()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Landroidx/slice/widget/c;->f:Z

    .line 36
    .line 37
    :cond_1
    iget v0, p0, Landroidx/slice/widget/c;->j:I

    .line 38
    .line 39
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->e()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Landroidx/slice/widget/c;->j:I

    .line 48
    .line 49
    iget-boolean v0, p0, Landroidx/slice/widget/c;->k:Z

    .line 50
    .line 51
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->g()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    or-int/2addr v0, v1

    .line 56
    iput-boolean v0, p0, Landroidx/slice/widget/c;->k:Z

    .line 57
    .line 58
    iget v0, p0, Landroidx/slice/widget/c;->l:I

    .line 59
    .line 60
    const/4 v1, 0x5

    .line 61
    if-ne v0, v1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->d()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-virtual {p1}, Landroidx/slice/widget/c$a;->d()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    :goto_0
    iput p1, p0, Landroidx/slice/widget/c;->l:I

    .line 77
    .line 78
    :cond_3
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/slice/widget/c;->h:Ljava/util/ArrayList;

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

.method public i()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/c;->g:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroidx/slice/widget/c$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/c;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Landroidx/slice/widget/l;Landroidx/slice/widget/n;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    throw p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/slice/widget/c;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public m()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/c;->i:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/slice/widget/c;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/slice/widget/c;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public r(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/c;->m:Z

    .line 2
    .line 3
    return-void
.end method
