.class final LU/l;
.super Ljava/lang/Object;
.source "FeatureMapping.kt"


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lh4/l<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field

.field private final b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "LU/v;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "LU/v;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
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
    iput-object v0, p0, LU/l;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LU/l;->b:Ljava/util/Set;

    .line 17
    .line 18
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LU/l;->c:Ljava/util/Set;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a(LU/v;LU/v;)V
    .locals 8

    .line 1
    const-string v0, "f1"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "f2"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LU/l;->b:Ljava/util/Set;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p0, LU/l;->c:Ljava/util/Set;

    .line 20
    .line 21
    invoke-interface {v0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, LU/l;->a:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {p1}, LU/v;->b()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    new-instance v3, LU/l$a;

    .line 44
    .line 45
    invoke-direct {v3, v1}, LU/l$a;-><init>(Ljava/lang/Comparable;)V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-static {v0, v1, v2, v3}, Li4/m;->h(Ljava/util/List;IILu4/l;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-gez v0, :cond_3

    .line 54
    .line 55
    neg-int v0, v0

    .line 56
    const/4 v1, 0x1

    .line 57
    sub-int/2addr v0, v1

    .line 58
    iget-object v2, p0, LU/l;->a:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-lt v2, v1, :cond_2

    .line 65
    .line 66
    iget-object v3, p0, LU/l;->a:Ljava/util/List;

    .line 67
    .line 68
    add-int v4, v0, v2

    .line 69
    .line 70
    sub-int/2addr v4, v1

    .line 71
    rem-int/2addr v4, v2

    .line 72
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lh4/l;

    .line 77
    .line 78
    invoke-virtual {v3}, Lh4/l;->a()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Ljava/lang/Number;

    .line 83
    .line 84
    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    invoke-virtual {v3}, Lh4/l;->b()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    check-cast v3, Ljava/lang/Number;

    .line 93
    .line 94
    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    iget-object v5, p0, LU/l;->a:Ljava/util/List;

    .line 99
    .line 100
    rem-int v6, v0, v2

    .line 101
    .line 102
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    check-cast v5, Lh4/l;

    .line 107
    .line 108
    invoke-virtual {v5}, Lh4/l;->a()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    check-cast v6, Ljava/lang/Number;

    .line 113
    .line 114
    invoke-virtual {v6}, Ljava/lang/Number;->floatValue()F

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    invoke-virtual {v5}, Lh4/l;->b()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    check-cast v5, Ljava/lang/Number;

    .line 123
    .line 124
    invoke-virtual {v5}, Ljava/lang/Number;->floatValue()F

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    invoke-virtual {p1}, LU/v;->b()F

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    invoke-static {v7, v4}, LU/j;->b(FF)F

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    const v7, 0x38d1b717    # 1.0E-4f

    .line 137
    .line 138
    .line 139
    cmpg-float v4, v4, v7

    .line 140
    .line 141
    if-ltz v4, :cond_4

    .line 142
    .line 143
    invoke-virtual {p1}, LU/v;->b()F

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    invoke-static {v4, v6}, LU/j;->b(FF)F

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    cmpg-float v4, v4, v7

    .line 152
    .line 153
    if-ltz v4, :cond_4

    .line 154
    .line 155
    invoke-virtual {p2}, LU/v;->b()F

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    invoke-static {v4, v3}, LU/j;->b(FF)F

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    cmpg-float v4, v4, v7

    .line 164
    .line 165
    if-ltz v4, :cond_4

    .line 166
    .line 167
    invoke-virtual {p2}, LU/v;->b()F

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    invoke-static {v4, v5}, LU/j;->b(FF)F

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    cmpg-float v4, v4, v7

    .line 176
    .line 177
    if-gez v4, :cond_1

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_1
    if-le v2, v1, :cond_2

    .line 181
    .line 182
    invoke-virtual {p2}, LU/v;->b()F

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    invoke-static {v1, v3, v5}, LU/j;->c(FFF)Z

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    if-nez v1, :cond_2

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_2
    iget-object v1, p0, LU/l;->a:Ljava/util/List;

    .line 194
    .line 195
    invoke-virtual {p1}, LU/v;->b()F

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-virtual {p2}, LU/v;->b()F

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-static {v2, v3}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-interface {v1, v0, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, LU/l;->b:Ljava/util/Set;

    .line 219
    .line 220
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    iget-object p0, p0, LU/l;->c:Ljava/util/Set;

    .line 224
    .line 225
    invoke-interface {p0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 230
    .line 231
    const-string p1, "There can\'t be two features with the same progress"

    .line 232
    .line 233
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    throw p0

    .line 237
    :cond_4
    :goto_0
    return-void
.end method

.method public final b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lh4/l<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LU/l;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
