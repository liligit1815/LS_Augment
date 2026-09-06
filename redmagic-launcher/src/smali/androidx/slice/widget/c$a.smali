.class public Landroidx/slice/widget/c$a;
.super Ljava/lang/Object;
.source "GridContent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Landroidx/slice/SliceItem;

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field private c:Landroidx/slice/SliceItem;

.field private d:I

.field private e:Z

.field private f:I

.field private g:Landroidx/slice/SliceItem;


# direct methods
.method public constructor <init>(Landroidx/slice/SliceItem;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Landroidx/slice/widget/c$a;->f:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroidx/slice/widget/c$a;->k(Landroidx/slice/SliceItem;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private j(Landroidx/slice/SliceItem;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "content_description"

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const-string v0, "ttl"

    .line 18
    .line 19
    const-string v1, "last_updated"

    .line 20
    .line 21
    const-string v2, "keywords"

    .line 22
    .line 23
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Landroidx/slice/SliceItem;->q([Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string p1, "text"

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    const-string p1, "long"

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    const-string p1, "image"

    .line 51
    .line 52
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    :cond_1
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 61
    return p0
.end method


# virtual methods
.method public a()Ljava/util/ArrayList;
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
    iget-object p0, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/c$a;->c:Landroidx/slice/SliceItem;

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

.method public c()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/c$a;->a:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/slice/widget/c$a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/slice/widget/c$a;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public f()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/c$a;->g:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/slice/widget/c$a;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroidx/slice/SliceItem;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "image"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    return v2

    .line 32
    :cond_0
    return v1
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x3

    .line 16
    if-gt p0, v0, :cond_0

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

.method public k(Landroidx/slice/SliceItem;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "shortcut"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_9

    .line 12
    .line 13
    const-string v1, "slice"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-string v3, "action"

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_9

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    const/4 v5, 0x1

    .line 42
    const/4 v6, 0x0

    .line 43
    if-ne v4, v5, :cond_2

    .line 44
    .line 45
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Landroidx/slice/SliceItem;

    .line 50
    .line 51
    invoke-virtual {v4}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-nez v4, :cond_1

    .line 60
    .line 61
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Landroidx/slice/SliceItem;

    .line 66
    .line 67
    invoke-virtual {v4}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    :cond_1
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Landroidx/slice/SliceItem;

    .line 82
    .line 83
    iput-object v1, p0, Landroidx/slice/widget/c$a;->a:Landroidx/slice/SliceItem;

    .line 84
    .line 85
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Landroidx/slice/SliceItem;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    :cond_2
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    iput-object p1, p0, Landroidx/slice/widget/c$a;->a:Landroidx/slice/SliceItem;

    .line 106
    .line 107
    :cond_3
    iput v6, p0, Landroidx/slice/widget/c$a;->d:I

    .line 108
    .line 109
    move p1, v6

    .line 110
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-ge v6, v0, :cond_a

    .line 115
    .line 116
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Landroidx/slice/SliceItem;

    .line 121
    .line 122
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v3, "content_description"

    .line 127
    .line 128
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eqz v3, :cond_4

    .line 137
    .line 138
    iput-object v0, p0, Landroidx/slice/widget/c$a;->c:Landroidx/slice/SliceItem;

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    iget v3, p0, Landroidx/slice/widget/c$a;->d:I

    .line 142
    .line 143
    const/4 v4, 0x2

    .line 144
    if-ge v3, v4, :cond_7

    .line 145
    .line 146
    const-string v3, "text"

    .line 147
    .line 148
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-nez v3, :cond_5

    .line 153
    .line 154
    const-string v3, "long"

    .line 155
    .line 156
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_7

    .line 161
    .line 162
    :cond_5
    iget v1, p0, Landroidx/slice/widget/c$a;->d:I

    .line 163
    .line 164
    add-int/2addr v1, v5

    .line 165
    iput v1, p0, Landroidx/slice/widget/c$a;->d:I

    .line 166
    .line 167
    iget-object v1, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    iget-object v1, p0, Landroidx/slice/widget/c$a;->g:Landroidx/slice/SliceItem;

    .line 173
    .line 174
    if-eqz v1, :cond_6

    .line 175
    .line 176
    const-string v3, "title"

    .line 177
    .line 178
    invoke-virtual {v1, v3}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-nez v1, :cond_8

    .line 183
    .line 184
    invoke-virtual {v0, v3}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_8

    .line 189
    .line 190
    :cond_6
    iput-object v0, p0, Landroidx/slice/widget/c$a;->g:Landroidx/slice/SliceItem;

    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_7
    if-ge p1, v5, :cond_8

    .line 194
    .line 195
    const-string v1, "image"

    .line 196
    .line 197
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_8

    .line 206
    .line 207
    invoke-static {v0}, Landroidx/slice/b;->a(Landroidx/slice/SliceItem;)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    iput v1, p0, Landroidx/slice/widget/c$a;->f:I

    .line 212
    .line 213
    add-int/lit8 p1, p1, 0x1

    .line 214
    .line 215
    iput-boolean v5, p0, Landroidx/slice/widget/c$a;->e:Z

    .line 216
    .line 217
    iget-object v1, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 218
    .line 219
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    :cond_8
    :goto_1
    add-int/lit8 v6, v6, 0x1

    .line 223
    .line 224
    goto :goto_0

    .line 225
    :cond_9
    invoke-direct {p0, p1}, Landroidx/slice/widget/c$a;->j(Landroidx/slice/SliceItem;)Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_a

    .line 230
    .line 231
    iget-object v0, p0, Landroidx/slice/widget/c$a;->b:Ljava/util/ArrayList;

    .line 232
    .line 233
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    :cond_a
    invoke-virtual {p0}, Landroidx/slice/widget/c$a;->i()Z

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    return p0
.end method
