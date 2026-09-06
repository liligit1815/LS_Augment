.class public LD0/e;
.super Ljava/lang/Object;
.source "Layer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LD0/e$a;,
        LD0/e$b;
    }
.end annotation


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LC0/c;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lv0/h;

.field private final c:Ljava/lang/String;

.field private final d:J

.field private final e:LD0/e$a;

.field private final f:J

.field private final g:Ljava/lang/String;

.field private final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LC0/h;",
            ">;"
        }
    .end annotation
.end field

.field private final i:LB0/l;

.field private final j:I

.field private final k:I

.field private final l:I

.field private final m:F

.field private final n:F

.field private final o:F

.field private final p:F

.field private final q:LB0/j;

.field private final r:LB0/k;

.field private final s:LB0/b;

.field private final t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LI0/a<",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field

.field private final u:LD0/e$b;

.field private final v:Z

.field private final w:LC0/a;

.field private final x:LF0/j;


# direct methods
.method public constructor <init>(Ljava/util/List;Lv0/h;Ljava/lang/String;JLD0/e$a;JLjava/lang/String;Ljava/util/List;LB0/l;IIIFFFFLB0/j;LB0/k;Ljava/util/List;LD0/e$b;LB0/b;ZLC0/a;LF0/j;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LC0/c;",
            ">;",
            "Lv0/h;",
            "Ljava/lang/String;",
            "J",
            "LD0/e$a;",
            "J",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "LC0/h;",
            ">;",
            "LB0/l;",
            "IIIFFFF",
            "LB0/j;",
            "LB0/k;",
            "Ljava/util/List<",
            "LI0/a<",
            "Ljava/lang/Float;",
            ">;>;",
            "LD0/e$b;",
            "LB0/b;",
            "Z",
            "LC0/a;",
            "LF0/j;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, LD0/e;->a:Ljava/util/List;

    .line 3
    iput-object p2, p0, LD0/e;->b:Lv0/h;

    .line 4
    iput-object p3, p0, LD0/e;->c:Ljava/lang/String;

    .line 5
    iput-wide p4, p0, LD0/e;->d:J

    .line 6
    iput-object p6, p0, LD0/e;->e:LD0/e$a;

    .line 7
    iput-wide p7, p0, LD0/e;->f:J

    .line 8
    iput-object p9, p0, LD0/e;->g:Ljava/lang/String;

    .line 9
    iput-object p10, p0, LD0/e;->h:Ljava/util/List;

    .line 10
    iput-object p11, p0, LD0/e;->i:LB0/l;

    .line 11
    iput p12, p0, LD0/e;->j:I

    .line 12
    iput p13, p0, LD0/e;->k:I

    .line 13
    iput p14, p0, LD0/e;->l:I

    .line 14
    iput p15, p0, LD0/e;->m:F

    move/from16 p1, p16

    .line 15
    iput p1, p0, LD0/e;->n:F

    move/from16 p1, p17

    .line 16
    iput p1, p0, LD0/e;->o:F

    move/from16 p1, p18

    .line 17
    iput p1, p0, LD0/e;->p:F

    move-object/from16 p1, p19

    .line 18
    iput-object p1, p0, LD0/e;->q:LB0/j;

    move-object/from16 p1, p20

    .line 19
    iput-object p1, p0, LD0/e;->r:LB0/k;

    move-object/from16 p1, p21

    .line 20
    iput-object p1, p0, LD0/e;->t:Ljava/util/List;

    move-object/from16 p1, p22

    .line 21
    iput-object p1, p0, LD0/e;->u:LD0/e$b;

    move-object/from16 p1, p23

    .line 22
    iput-object p1, p0, LD0/e;->s:LB0/b;

    move/from16 p1, p24

    .line 23
    iput-boolean p1, p0, LD0/e;->v:Z

    move-object/from16 p1, p25

    .line 24
    iput-object p1, p0, LD0/e;->w:LC0/a;

    move-object/from16 p1, p26

    .line 25
    iput-object p1, p0, LD0/e;->x:LF0/j;

    return-void
.end method


# virtual methods
.method public a()LC0/a;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->w:LC0/a;

    .line 2
    .line 3
    return-object p0
.end method

.method b()Lv0/h;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->b:Lv0/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LF0/j;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->x:LF0/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, LD0/e;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LI0/a<",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LD0/e;->t:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()LD0/e$a;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->e:LD0/e$a;

    .line 2
    .line 3
    return-object p0
.end method

.method g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LC0/h;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LD0/e;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method h()LD0/e$b;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->u:LD0/e$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method j()J
    .locals 2

    .line 1
    iget-wide v0, p0, LD0/e;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method k()F
    .locals 0

    .line 1
    iget p0, p0, LD0/e;->p:F

    .line 2
    .line 3
    return p0
.end method

.method l()F
    .locals 0

    .line 1
    iget p0, p0, LD0/e;->o:F

    .line 2
    .line 3
    return p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method n()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LC0/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LD0/e;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method o()I
    .locals 0

    .line 1
    iget p0, p0, LD0/e;->l:I

    .line 2
    .line 3
    return p0
.end method

.method p()I
    .locals 0

    .line 1
    iget p0, p0, LD0/e;->k:I

    .line 2
    .line 3
    return p0
.end method

.method q()I
    .locals 0

    .line 1
    iget p0, p0, LD0/e;->j:I

    .line 2
    .line 3
    return p0
.end method

.method r()F
    .locals 1

    .line 1
    iget v0, p0, LD0/e;->n:F

    .line 2
    .line 3
    iget-object p0, p0, LD0/e;->b:Lv0/h;

    .line 4
    .line 5
    invoke-virtual {p0}, Lv0/h;->e()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    div-float/2addr v0, p0

    .line 10
    return v0
.end method

.method s()LB0/j;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->q:LB0/j;

    .line 2
    .line 3
    return-object p0
.end method

.method t()LB0/k;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->r:LB0/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, LD0/e;->y(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method u()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->s:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method v()F
    .locals 0

    .line 1
    iget p0, p0, LD0/e;->m:F

    .line 2
    .line 3
    return p0
.end method

.method w()LB0/l;
    .locals 0

    .line 1
    iget-object p0, p0, LD0/e;->i:LB0/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LD0/e;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public y(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, LD0/e;->i()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "\n"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, LD0/e;->b:Lv0/h;

    .line 22
    .line 23
    invoke-virtual {p0}, LD0/e;->j()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    invoke-virtual {v2, v3, v4}, Lv0/h;->t(J)LD0/e;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    const-string v3, "\t\tParents: "

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, LD0/e;->i()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, LD0/e;->b:Lv0/h;

    .line 46
    .line 47
    invoke-virtual {v2}, LD0/e;->j()J

    .line 48
    .line 49
    .line 50
    move-result-wide v4

    .line 51
    invoke-virtual {v3, v4, v5}, Lv0/h;->t(J)LD0/e;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    :goto_0
    if-eqz v2, :cond_0

    .line 56
    .line 57
    const-string v3, "->"

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, LD0/e;->i()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, LD0/e;->b:Lv0/h;

    .line 70
    .line 71
    invoke-virtual {v2}, LD0/e;->j()J

    .line 72
    .line 73
    .line 74
    move-result-wide v4

    .line 75
    invoke-virtual {v3, v4, v5}, Lv0/h;->t(J)LD0/e;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    :cond_1
    invoke-virtual {p0}, LD0/e;->g()Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-nez v2, :cond_2

    .line 95
    .line 96
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v2, "\tMasks: "

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, LD0/e;->g()Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    :cond_2
    invoke-virtual {p0}, LD0/e;->q()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_3

    .line 123
    .line 124
    invoke-virtual {p0}, LD0/e;->p()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_3

    .line 129
    .line 130
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v2, "\tBackground: "

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 139
    .line 140
    invoke-virtual {p0}, LD0/e;->q()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {p0}, LD0/e;->p()I

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {p0}, LD0/e;->o()I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    filled-new-array {v3, v4, v5}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    const-string v4, "%dx%d %X\n"

    .line 169
    .line 170
    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    :cond_3
    iget-object v2, p0, LD0/e;->a:Ljava/util/List;

    .line 178
    .line 179
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    if-nez v2, :cond_4

    .line 184
    .line 185
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string v2, "\tShapes:\n"

    .line 189
    .line 190
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, LD0/e;->a:Ljava/util/List;

    .line 194
    .line 195
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_4

    .line 204
    .line 205
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v3, "\t\t"

    .line 213
    .line 214
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    return-object p0
.end method
