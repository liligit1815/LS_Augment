.class public final Lo/b;
.super Ljava/lang/Object;
.source "ArraySet.jvm.kt"

# interfaces
.implements Ljava/util/Collection;
.implements Ljava/util/Set;
.implements Lv4/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Collection<",
        "TE;>;",
        "Ljava/util/Set<",
        "TE;>;",
        "Lv4/b;"
    }
.end annotation


# instance fields
.field private g:[I

.field private h:[Ljava/lang/Object;

.field private i:I


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 1
    invoke-direct {p0, v2, v0, v1}, Lo/b;-><init>(IILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    sget-object v0, Lp/a;->a:[I

    iput-object v0, p0, Lo/b;->g:[I

    .line 4
    sget-object v0, Lp/a;->c:[Ljava/lang/Object;

    iput-object v0, p0, Lo/b;->h:[Ljava/lang/Object;

    if-lez p1, :cond_0

    .line 5
    invoke-static {p0, p1}, Lo/d;->a(Lo/b;I)V

    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(IILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1}, Lo/b;-><init>(I)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Lo/b;->n()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lo/d;->d(Lo/b;)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    move v5, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-static {v0, v1, v4}, Lo/d;->c(Lo/b;Ljava/lang/Object;I)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    move/from16 v16, v5

    .line 27
    .line 28
    move v5, v4

    .line 29
    move/from16 v4, v16

    .line 30
    .line 31
    :goto_0
    if-ltz v4, :cond_1

    .line 32
    .line 33
    return v3

    .line 34
    :cond_1
    not-int v4, v4

    .line 35
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    array-length v6, v6

    .line 40
    const/4 v7, 0x1

    .line 41
    if-lt v2, v6, :cond_6

    .line 42
    .line 43
    const/16 v6, 0x8

    .line 44
    .line 45
    if-lt v2, v6, :cond_2

    .line 46
    .line 47
    shr-int/lit8 v6, v2, 0x1

    .line 48
    .line 49
    add-int/2addr v6, v2

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const/4 v8, 0x4

    .line 52
    if-lt v2, v8, :cond_3

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    move v6, v8

    .line 56
    :goto_1
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    invoke-virtual {v0}, Lo/b;->g()[Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v15

    .line 64
    invoke-static {v0, v6}, Lo/d;->a(Lo/b;I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Lo/b;->n()I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    if-ne v2, v6, :cond_5

    .line 72
    .line 73
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    array-length v6, v6

    .line 78
    if-nez v6, :cond_4

    .line 79
    .line 80
    move v3, v7

    .line 81
    :cond_4
    if-nez v3, :cond_6

    .line 82
    .line 83
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 84
    .line 85
    .line 86
    move-result-object v9

    .line 87
    array-length v12, v8

    .line 88
    const/4 v13, 0x6

    .line 89
    const/4 v14, 0x0

    .line 90
    const/4 v10, 0x0

    .line 91
    const/4 v11, 0x0

    .line 92
    invoke-static/range {v8 .. v14}, Li4/g;->k([I[IIIIILjava/lang/Object;)[I

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Lo/b;->g()[Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v10

    .line 99
    array-length v13, v15

    .line 100
    const/4 v14, 0x6

    .line 101
    move-object v9, v15

    .line 102
    const/4 v15, 0x0

    .line 103
    const/4 v12, 0x0

    .line 104
    invoke-static/range {v9 .. v15}, Li4/g;->l([Ljava/lang/Object;[Ljava/lang/Object;IIIILjava/lang/Object;)[Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_5
    new-instance v0, Ljava/util/ConcurrentModificationException;

    .line 109
    .line 110
    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    .line 111
    .line 112
    .line 113
    throw v0

    .line 114
    :cond_6
    :goto_2
    if-ge v4, v2, :cond_7

    .line 115
    .line 116
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    add-int/lit8 v8, v4, 0x1

    .line 125
    .line 126
    invoke-static {v3, v6, v8, v4, v2}, Li4/g;->f([I[IIII)[I

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Lo/b;->g()[Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v0}, Lo/b;->g()[Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-static {v3, v6, v8, v4, v2}, Li4/g;->h([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    :cond_7
    invoke-virtual {v0}, Lo/b;->n()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-ne v2, v3, :cond_8

    .line 145
    .line 146
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    array-length v2, v2

    .line 151
    if-ge v4, v2, :cond_8

    .line 152
    .line 153
    invoke-virtual {v0}, Lo/b;->j()[I

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    aput v5, v2, v4

    .line 158
    .line 159
    invoke-virtual {v0}, Lo/b;->g()[Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    aput-object v1, v2, v4

    .line 164
    .line 165
    invoke-virtual {v0}, Lo/b;->n()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    add-int/2addr v1, v7

    .line 170
    invoke-virtual {v0, v1}, Lo/b;->r(I)V

    .line 171
    .line 172
    .line 173
    return v7

    .line 174
    :cond_8
    new-instance v0, Ljava/util/ConcurrentModificationException;

    .line 175
    .line 176
    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    .line 177
    .line 178
    .line 179
    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+TE;>;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "elements"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lo/b;->n()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/2addr v0, v1

    .line 15
    invoke-virtual {p0, v0}, Lo/b;->e(I)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x0

    .line 23
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0, v1}, Lo/b;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    or-int/2addr v0, v1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return v0
.end method

.method public clear()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lo/b;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lp/a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lo/b;->q([I)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lp/a;->c:[Ljava/lang/Object;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lo/b;->p([Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Lo/b;->r(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lo/b;->n()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    new-instance p0, Ljava/util/ConcurrentModificationException;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    .line 31
    .line 32
    .line 33
    throw p0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lo/b;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ltz p0, :cond_0

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

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "elements"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lo/b;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public final e(I)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lo/b;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    array-length v1, v1

    .line 10
    if-ge v1, p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {p0, p1}, Lo/d;->a(Lo/b;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lo/b;->n()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-lez p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {p0}, Lo/b;->n()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    const/4 v7, 0x6

    .line 38
    const/4 v8, 0x0

    .line 39
    const/4 v4, 0x0

    .line 40
    const/4 v5, 0x0

    .line 41
    invoke-static/range {v2 .. v8}, Li4/g;->k([I[IIIIILjava/lang/Object;)[I

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {p0}, Lo/b;->n()I

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    const/4 v8, 0x6

    .line 53
    const/4 v9, 0x0

    .line 54
    const/4 v6, 0x0

    .line 55
    move-object v3, v1

    .line 56
    invoke-static/range {v3 .. v9}, Li4/g;->l([Ljava/lang/Object;[Ljava/lang/Object;IIIILjava/lang/Object;)[Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-virtual {p0}, Lo/b;->n()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-ne p0, v0, :cond_1

    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    new-instance p0, Ljava/util/ConcurrentModificationException;

    .line 67
    .line 68
    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    .line 69
    .line 70
    .line 71
    throw p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ljava/util/Set;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_4

    .line 9
    .line 10
    invoke-virtual {p0}, Lo/b;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    move-object v3, p1

    .line 15
    check-cast v3, Ljava/util/Set;

    .line 16
    .line 17
    invoke-interface {v3}, Ljava/util/Set;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eq v1, v3, :cond_1

    .line 22
    .line 23
    return v2

    .line 24
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lo/b;->n()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    move v3, v2

    .line 29
    :goto_0
    if-ge v3, v1, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0, v3}, Lo/b;->s(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    move-object v5, p1

    .line 36
    check-cast v5, Ljava/util/Set;

    .line 37
    .line 38
    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v4
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    return v2

    .line 45
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    return v0

    .line 49
    :catch_0
    :cond_4
    return v2
.end method

.method public final g()[Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lo/b;->h:[Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lo/b;->n()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v1, 0x0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    if-ge v1, p0, :cond_0

    .line 12
    .line 13
    aget v3, v0, v1

    .line 14
    .line 15
    add-int/2addr v2, v3

    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return v2
.end method

.method public final indexOf(Ljava/lang/Object;)I
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Lo/d;->d(Lo/b;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {p0, p1, v0}, Lo/d;->c(Lo/b;Ljava/lang/Object;I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public isEmpty()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lo/b;->n()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-gtz p0, :cond_0

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

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lo/b$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lo/b$a;-><init>(Lo/b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final j()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lo/b;->g:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Lo/b;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public final n()I
    .locals 0

    .line 1
    iget p0, p0, Lo/b;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public final o(I)Ljava/lang/Object;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lo/b;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    aget-object v1, v1, p1

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-gt v0, v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lo/b;->clear()V

    .line 15
    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    add-int/lit8 v3, v0, -0x1

    .line 19
    .line 20
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    array-length v4, v4

    .line 25
    const/16 v5, 0x8

    .line 26
    .line 27
    if-le v4, v5, :cond_3

    .line 28
    .line 29
    invoke-virtual {p0}, Lo/b;->n()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    array-length v6, v6

    .line 38
    div-int/lit8 v6, v6, 0x3

    .line 39
    .line 40
    if-ge v4, v6, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Lo/b;->n()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-le v4, v5, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Lo/b;->n()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {p0}, Lo/b;->n()I

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    shr-int/lit8 v2, v5, 0x1

    .line 57
    .line 58
    add-int v5, v4, v2

    .line 59
    .line 60
    :cond_1
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {p0, v5}, Lo/d;->a(Lo/b;I)V

    .line 69
    .line 70
    .line 71
    if-lez p1, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    const/4 v11, 0x6

    .line 78
    const/4 v12, 0x0

    .line 79
    const/4 v8, 0x0

    .line 80
    const/4 v9, 0x0

    .line 81
    move v10, p1

    .line 82
    invoke-static/range {v6 .. v12}, Li4/g;->k([I[IIIIILjava/lang/Object;)[I

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    const/4 v12, 0x6

    .line 90
    const/4 v13, 0x0

    .line 91
    move v11, v10

    .line 92
    const/4 v10, 0x0

    .line 93
    move-object v7, v2

    .line 94
    invoke-static/range {v7 .. v13}, Li4/g;->l([Ljava/lang/Object;[Ljava/lang/Object;IIIILjava/lang/Object;)[Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move v10, v11

    .line 98
    goto :goto_0

    .line 99
    :cond_2
    move v10, p1

    .line 100
    move-object v7, v2

    .line 101
    :goto_0
    if-ge v10, v3, :cond_5

    .line 102
    .line 103
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    add-int/lit8 v2, v10, 0x1

    .line 108
    .line 109
    invoke-static {v6, p1, v10, v2, v0}, Li4/g;->f([I[IIII)[I

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {v7, p1, v10, v2, v0}, Li4/g;->h([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    move v10, p1

    .line 121
    if-ge v10, v3, :cond_4

    .line 122
    .line 123
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p0}, Lo/b;->j()[I

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    add-int/lit8 v4, v10, 0x1

    .line 132
    .line 133
    invoke-static {p1, v2, v10, v4, v0}, Li4/g;->f([I[IIII)[I

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {p1, v2, v10, v4, v0}, Li4/g;->h([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    :cond_4
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    const/4 v2, 0x0

    .line 152
    aput-object v2, p1, v3

    .line 153
    .line 154
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lo/b;->n()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-ne v0, p1, :cond_6

    .line 159
    .line 160
    invoke-virtual {p0, v3}, Lo/b;->r(I)V

    .line 161
    .line 162
    .line 163
    return-object v1

    .line 164
    :cond_6
    new-instance p0, Ljava/util/ConcurrentModificationException;

    .line 165
    .line 166
    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    .line 167
    .line 168
    .line 169
    throw p0
.end method

.method public final p([Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo/b;->h:[Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public final q([I)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo/b;->g:[I

    .line 7
    .line 8
    return-void
.end method

.method public final r(I)V
    .locals 0

    .line 1
    iput p1, p0, Lo/b;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lo/b;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lo/b;->o(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "elements"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v1}, Lo/b;->remove(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    or-int/2addr v0, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v0, "elements"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lo/b;->n()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    const/4 v3, -0x1

    .line 14
    if-ge v3, v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    aget-object v3, v3, v0

    .line 21
    .line 22
    invoke-static {p1, v3}, Li4/m;->Q(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-nez v3, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lo/b;->o(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move v2, v1

    .line 32
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v2
.end method

.method public final s(I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lo/b;->g()[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    aget-object p0, p0, p1

    .line 6
    .line 7
    return-object p0
.end method

.method public final bridge size()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lo/b;->m()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final toArray()[Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lo/b;->h:[Ljava/lang/Object;

    const/4 v1, 0x0

    iget p0, p0, Lo/b;->i:I

    invoke-static {v0, v1, p0}, Li4/g;->o([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    const-string v0, "array"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    iget v0, p0, Lo/b;->i:I

    invoke-static {p1, v0}, Lo/c;->a([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lo/b;->h:[Ljava/lang/Object;

    const/4 v1, 0x0

    iget p0, p0, Lo/b;->i:I

    invoke-static {v0, p1, v1, v1, p0}, Li4/g;->h([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 4
    const-string p0, "result"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lo/b;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "{}"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lo/b;->n()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    mul-int/lit8 v0, v0, 0xe

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 19
    .line 20
    .line 21
    const/16 v0, 0x7b

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lo/b;->n()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v2, 0x0

    .line 31
    :goto_0
    if-ge v2, v0, :cond_3

    .line 32
    .line 33
    if-lez v2, :cond_1

    .line 34
    .line 35
    const-string v3, ", "

    .line 36
    .line 37
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0, v2}, Lo/b;->s(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    if-eq v3, p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const-string v3, "(this Set)"

    .line 51
    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    const/16 p0, 0x7d

    .line 59
    .line 60
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v0, "StringBuilder(capacity).\u2026builderAction).toString()"

    .line 68
    .line 69
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-object p0
.end method
