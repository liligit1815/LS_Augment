.class public Lf0/a;
.super Ljava/lang/Object;
.source "SliceMetadata.java"


# instance fields
.field private a:Landroidx/slice/Slice;

.field private b:Landroid/content/Context;

.field private c:J

.field private d:J

.field private e:Landroidx/slice/widget/d;

.field private f:Landroidx/slice/widget/f;

.field private g:Lh0/d;

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lh0/d;",
            ">;"
        }
    .end annotation
.end field

.field private i:I


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroidx/slice/Slice;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lf0/a;->a:Landroidx/slice/Slice;

    .line 5
    .line 6
    iput-object p1, p0, Lf0/a;->b:Landroid/content/Context;

    .line 7
    .line 8
    const-string p1, "long"

    .line 9
    .line 10
    const-string v0, "ttl"

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {p2, p1, v0, v1}, Lh0/f;->d(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->k()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    iput-wide v2, p0, Lf0/a;->c:J

    .line 24
    .line 25
    :cond_0
    const-string v0, "last_updated"

    .line 26
    .line 27
    invoke-static {p2, p1, v0, v1}, Lh0/f;->d(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->k()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iput-wide v0, p0, Lf0/a;->d:J

    .line 38
    .line 39
    :cond_1
    new-instance p1, Landroidx/slice/widget/d;

    .line 40
    .line 41
    invoke-direct {p1, p2}, Landroidx/slice/widget/d;-><init>(Landroidx/slice/Slice;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lf0/a;->e:Landroidx/slice/widget/d;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroidx/slice/widget/d;->j()Landroidx/slice/widget/f;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lf0/a;->f:Landroidx/slice/widget/f;

    .line 51
    .line 52
    iget-object p1, p0, Lf0/a;->e:Landroidx/slice/widget/d;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroidx/slice/widget/d;->k()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Lf0/a;->i:I

    .line 59
    .line 60
    iget-object p1, p0, Lf0/a;->e:Landroidx/slice/widget/d;

    .line 61
    .line 62
    iget-object p2, p0, Lf0/a;->b:Landroid/content/Context;

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroidx/slice/widget/d;->d(Landroid/content/Context;)Lh0/d;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lf0/a;->g:Lh0/d;

    .line 69
    .line 70
    iget-object p1, p0, Lf0/a;->e:Landroidx/slice/widget/d;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroidx/slice/widget/d;->o()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lf0/a;->h:Ljava/util/List;

    .line 77
    .line 78
    if-nez p1, :cond_4

    .line 79
    .line 80
    iget-object p1, p0, Lf0/a;->f:Landroidx/slice/widget/f;

    .line 81
    .line 82
    if-eqz p1, :cond_4

    .line 83
    .line 84
    invoke-virtual {p1}, Landroidx/slice/widget/i;->e()Landroidx/slice/SliceItem;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const-string p2, "list_item"

    .line 89
    .line 90
    filled-new-array {p2}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-static {p1, p2}, Lh0/f;->q(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    iget-object p1, p0, Lf0/a;->f:Landroidx/slice/widget/f;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroidx/slice/widget/f;->j()Ljava/util/ArrayList;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    new-instance p2, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .line 110
    .line 111
    const/4 v0, 0x0

    .line 112
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-ge v0, v1, :cond_3

    .line 117
    .line 118
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Landroidx/slice/SliceItem;

    .line 123
    .line 124
    const-string v2, "action"

    .line 125
    .line 126
    invoke-static {v1, v2}, Lh0/f;->f(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    if-eqz v1, :cond_2

    .line 131
    .line 132
    new-instance v1, Lh0/e;

    .line 133
    .line 134
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    check-cast v2, Landroidx/slice/SliceItem;

    .line 139
    .line 140
    invoke-direct {v1, v2}, Lh0/e;-><init>(Landroidx/slice/SliceItem;)V

    .line 141
    .line 142
    .line 143
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_3
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-lez p1, :cond_4

    .line 154
    .line 155
    iput-object p2, p0, Lf0/a;->h:Ljava/util/List;

    .line 156
    .line 157
    :cond_4
    return-void
.end method

.method public static a(Landroid/content/Context;Landroidx/slice/Slice;)Lf0/a;
    .locals 1

    .line 1
    new-instance v0, Lf0/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lf0/a;-><init>(Landroid/content/Context;Landroidx/slice/Slice;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static f(Landroidx/slice/Slice;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/slice/Slice;",
            ")",
            "Ljava/util/List<",
            "Lh0/d;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "slice"

    .line 2
    .line 3
    const-string v1, "actions"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p0, v0, v1, v2}, Lh0/f;->d(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v3, "shortcut"

    .line 11
    .line 12
    filled-new-array {v1, v3}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-static {p0, v0, v1, v2}, Lh0/f;->j(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object p0, v2

    .line 24
    :goto_0
    if-eqz p0, :cond_2

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-ge v1, v2, :cond_1

    .line 41
    .line 42
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Landroidx/slice/SliceItem;

    .line 47
    .line 48
    new-instance v3, Lh0/e;

    .line 49
    .line 50
    invoke-direct {v3, v2}, Lh0/e;-><init>(Landroidx/slice/SliceItem;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    return-object v0

    .line 60
    :cond_2
    return-object v2
.end method


# virtual methods
.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lf0/a;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()Landroidx/slice/widget/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lf0/a;->e:Landroidx/slice/widget/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 3

    .line 1
    iget-object v0, p0, Lf0/a;->a:Landroidx/slice/Slice;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "partial"

    .line 5
    .line 6
    invoke-static {v0, v1, v2, v1}, Lh0/f;->d(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move v0, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    iget-object p0, p0, Lf0/a;->e:Landroidx/slice/widget/d;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/slice/widget/d;->g()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    if-eqz v0, :cond_2

    .line 27
    .line 28
    return v2

    .line 29
    :cond_2
    const/4 p0, 0x2

    .line 30
    return p0
.end method

.method public e()Ljava/util/List;
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
    iget-object p0, p0, Lf0/a;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()J
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lf0/a;->c:J

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    cmp-long p0, v2, v4

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const-wide/16 v6, -0x1

    .line 14
    .line 15
    cmp-long p0, v2, v6

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    cmp-long p0, v0, v2

    .line 20
    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sub-long/2addr v2, v0

    .line 25
    return-wide v2

    .line 26
    :cond_1
    :goto_0
    return-wide v4
.end method

.method public h()Z
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lf0/a;->c:J

    .line 6
    .line 7
    const-wide/16 v4, 0x0

    .line 8
    .line 9
    cmp-long p0, v2, v4

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-wide/16 v4, -0x1

    .line 14
    .line 15
    cmp-long p0, v2, v4

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    cmp-long p0, v0, v2

    .line 20
    .line 21
    if-lez p0, :cond_0

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

.method public i()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lf0/a;->a:Landroidx/slice/Slice;

    .line 2
    .line 3
    const-string v0, "permission_request"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/slice/Slice;->f(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public j()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lf0/a;->c:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
