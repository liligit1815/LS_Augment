.class public final Lx3/c;
.super Ljava/lang/Object;
.source "MSDLRepositoryImpl.kt"

# interfaces
.implements Lx3/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lx3/c$t;
    }
.end annotation


# static fields
.field public static final a:Lx3/c$t;

.field private static final b:[J

.field private static final c:[I

.field private static final d:[J

.field private static final e:[I

.field private static final f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lw3/d;",
            "Lx3/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 1
    new-instance v0, Lx3/c$t;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lx3/c$t;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lx3/c;->a:Lx3/c$t;

    .line 8
    .line 9
    const/4 v0, 0x7

    .line 10
    new-array v1, v0, [J

    .line 11
    .line 12
    fill-array-data v1, :array_0

    .line 13
    .line 14
    .line 15
    sput-object v1, Lx3/c;->b:[J

    .line 16
    .line 17
    new-array v0, v0, [I

    .line 18
    .line 19
    fill-array-data v0, :array_1

    .line 20
    .line 21
    .line 22
    sput-object v0, Lx3/c;->c:[I

    .line 23
    .line 24
    const-wide/16 v2, 0x38

    .line 25
    .line 26
    invoke-static {v1, v2, v3}, Li4/g;->v([JJ)[J

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-static {v4, v1}, Li4/g;->w([J[J)[J

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-static {v4, v2, v3}, Li4/g;->v([JJ)[J

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v2, v1}, Li4/g;->w([J[J)[J

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sput-object v1, Lx3/c;->d:[J

    .line 43
    .line 44
    const/16 v1, 0xa

    .line 45
    .line 46
    invoke-static {v0, v1}, Li4/g;->t([II)[I

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2, v0}, Li4/g;->u([I[I)[I

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2, v1}, Li4/g;->t([II)[I

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1, v0}, Li4/g;->u([I[I)[I

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sput-object v0, Lx3/c;->e:[I

    .line 63
    .line 64
    sget-object v0, Lw3/d;->g:Lw3/d;

    .line 65
    .line 66
    sget-object v1, Lx3/c$k;->a:Lx3/c$k;

    .line 67
    .line 68
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    sget-object v0, Lw3/d;->h:Lw3/d;

    .line 73
    .line 74
    sget-object v1, Lx3/c$l;->a:Lx3/c$l;

    .line 75
    .line 76
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    sget-object v0, Lw3/d;->i:Lw3/d;

    .line 81
    .line 82
    sget-object v1, Lx3/c$m;->a:Lx3/c$m;

    .line 83
    .line 84
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    sget-object v0, Lw3/d;->j:Lw3/d;

    .line 89
    .line 90
    sget-object v1, Lx3/c$n;->a:Lx3/c$n;

    .line 91
    .line 92
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    sget-object v0, Lw3/d;->k:Lw3/d;

    .line 97
    .line 98
    sget-object v1, Lx3/c$o;->a:Lx3/c$o;

    .line 99
    .line 100
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    sget-object v0, Lw3/d;->l:Lw3/d;

    .line 105
    .line 106
    sget-object v1, Lx3/c$p;->a:Lx3/c$p;

    .line 107
    .line 108
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    sget-object v0, Lw3/d;->m:Lw3/d;

    .line 113
    .line 114
    sget-object v1, Lx3/c$q;->a:Lx3/c$q;

    .line 115
    .line 116
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    sget-object v0, Lw3/d;->n:Lw3/d;

    .line 121
    .line 122
    sget-object v1, Lx3/c$r;->a:Lx3/c$r;

    .line 123
    .line 124
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 125
    .line 126
    .line 127
    move-result-object v9

    .line 128
    sget-object v0, Lw3/d;->o:Lw3/d;

    .line 129
    .line 130
    sget-object v1, Lx3/c$s;->a:Lx3/c$s;

    .line 131
    .line 132
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 133
    .line 134
    .line 135
    move-result-object v10

    .line 136
    sget-object v0, Lw3/d;->p:Lw3/d;

    .line 137
    .line 138
    sget-object v1, Lx3/c$a;->a:Lx3/c$a;

    .line 139
    .line 140
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 141
    .line 142
    .line 143
    move-result-object v11

    .line 144
    sget-object v0, Lw3/d;->q:Lw3/d;

    .line 145
    .line 146
    sget-object v1, Lx3/c$b;->a:Lx3/c$b;

    .line 147
    .line 148
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 149
    .line 150
    .line 151
    move-result-object v12

    .line 152
    sget-object v0, Lw3/d;->r:Lw3/d;

    .line 153
    .line 154
    sget-object v1, Lx3/c$c;->a:Lx3/c$c;

    .line 155
    .line 156
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 157
    .line 158
    .line 159
    move-result-object v13

    .line 160
    sget-object v0, Lw3/d;->s:Lw3/d;

    .line 161
    .line 162
    sget-object v1, Lx3/c$d;->a:Lx3/c$d;

    .line 163
    .line 164
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 165
    .line 166
    .line 167
    move-result-object v14

    .line 168
    sget-object v0, Lw3/d;->t:Lw3/d;

    .line 169
    .line 170
    sget-object v1, Lx3/c$e;->a:Lx3/c$e;

    .line 171
    .line 172
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 173
    .line 174
    .line 175
    move-result-object v15

    .line 176
    sget-object v0, Lw3/d;->u:Lw3/d;

    .line 177
    .line 178
    sget-object v1, Lx3/c$f;->a:Lx3/c$f;

    .line 179
    .line 180
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 181
    .line 182
    .line 183
    move-result-object v16

    .line 184
    sget-object v0, Lw3/d;->v:Lw3/d;

    .line 185
    .line 186
    sget-object v1, Lx3/c$g;->a:Lx3/c$g;

    .line 187
    .line 188
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 189
    .line 190
    .line 191
    move-result-object v17

    .line 192
    sget-object v0, Lw3/d;->w:Lw3/d;

    .line 193
    .line 194
    sget-object v1, Lx3/c$h;->a:Lx3/c$h;

    .line 195
    .line 196
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 197
    .line 198
    .line 199
    move-result-object v18

    .line 200
    sget-object v0, Lw3/d;->x:Lw3/d;

    .line 201
    .line 202
    sget-object v1, Lx3/c$i;->a:Lx3/c$i;

    .line 203
    .line 204
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 205
    .line 206
    .line 207
    move-result-object v19

    .line 208
    sget-object v0, Lw3/d;->y:Lw3/d;

    .line 209
    .line 210
    sget-object v1, Lx3/c$j;->a:Lx3/c$j;

    .line 211
    .line 212
    invoke-static {v0, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 213
    .line 214
    .line 215
    move-result-object v20

    .line 216
    filled-new-array/range {v2 .. v20}, [Lh4/l;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-static {v0}, Li4/F;->e([Lh4/l;)Ljava/util/Map;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    sput-object v0, Lx3/c;->f:Ljava/util/Map;

    .line 225
    .line 226
    return-void

    .line 227
    :array_0
    .array-data 8
        0x14
        0x14
        0x3
        0x2b
        0x14
        0x14
        0x3
    .end array-data

    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    :array_1
    .array-data 4
        0x28
        0x50
        0x28
        0x0
        0x28
        0x50
        0x28
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic c()[I
    .locals 1

    .line 1
    sget-object v0, Lx3/c;->e:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d()[J
    .locals 1

    .line 1
    sget-object v0, Lx3/c;->d:[J

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Lw3/d;)Lx3/a;
    .locals 0

    .line 1
    const-string p0, "hapticToken"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lx3/c;->f:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lx3/a;

    .line 13
    .line 14
    return-object p0
.end method

.method public b(Lw3/f;)Lx3/d;
    .locals 0

    .line 1
    const-string p0, "soundToken"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method
