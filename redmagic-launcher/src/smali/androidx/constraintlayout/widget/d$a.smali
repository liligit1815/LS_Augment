.class public Landroidx/constraintlayout/widget/d$a;
.super Ljava/lang/Object;
.source "ConstraintSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/widget/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/widget/d$a$a;
    }
.end annotation


# instance fields
.field a:I

.field b:Ljava/lang/String;

.field public final c:Landroidx/constraintlayout/widget/d$d;

.field public final d:Landroidx/constraintlayout/widget/d$c;

.field public final e:Landroidx/constraintlayout/widget/d$b;

.field public final f:Landroidx/constraintlayout/widget/d$e;

.field public g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/widget/a;",
            ">;"
        }
    .end annotation
.end field

.field h:Landroidx/constraintlayout/widget/d$a$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroidx/constraintlayout/widget/d$d;

    .line 5
    .line 6
    invoke-direct {v0}, Landroidx/constraintlayout/widget/d$d;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/constraintlayout/widget/d$a;->c:Landroidx/constraintlayout/widget/d$d;

    .line 10
    .line 11
    new-instance v0, Landroidx/constraintlayout/widget/d$c;

    .line 12
    .line 13
    invoke-direct {v0}, Landroidx/constraintlayout/widget/d$c;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/constraintlayout/widget/d$a;->d:Landroidx/constraintlayout/widget/d$c;

    .line 17
    .line 18
    new-instance v0, Landroidx/constraintlayout/widget/d$b;

    .line 19
    .line 20
    invoke-direct {v0}, Landroidx/constraintlayout/widget/d$b;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 24
    .line 25
    new-instance v0, Landroidx/constraintlayout/widget/d$e;

    .line 26
    .line 27
    invoke-direct {v0}, Landroidx/constraintlayout/widget/d$e;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Landroidx/constraintlayout/widget/d$a;->f:Landroidx/constraintlayout/widget/d$e;

    .line 31
    .line 32
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Landroidx/constraintlayout/widget/d$a;->g:Ljava/util/HashMap;

    .line 38
    .line 39
    return-void
.end method

.method static synthetic a(Landroidx/constraintlayout/widget/d$a;ILandroidx/constraintlayout/widget/ConstraintLayout$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/d$a;->g(ILandroidx/constraintlayout/widget/ConstraintLayout$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic b(Landroidx/constraintlayout/widget/d$a;Landroidx/constraintlayout/widget/b;ILandroidx/constraintlayout/widget/e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/d$a;->i(Landroidx/constraintlayout/widget/b;ILandroidx/constraintlayout/widget/e$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c(Landroidx/constraintlayout/widget/d$a;ILandroidx/constraintlayout/widget/e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/d$a;->h(ILandroidx/constraintlayout/widget/e$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(ILandroidx/constraintlayout/widget/ConstraintLayout$b;)V
    .locals 1

    .line 1
    iput p1, p0, Landroidx/constraintlayout/widget/d$a;->a:I

    .line 2
    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 4
    .line 5
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->e:I

    .line 6
    .line 7
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->j:I

    .line 8
    .line 9
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->f:I

    .line 10
    .line 11
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->k:I

    .line 12
    .line 13
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g:I

    .line 14
    .line 15
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->l:I

    .line 16
    .line 17
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->h:I

    .line 18
    .line 19
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->m:I

    .line 20
    .line 21
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->i:I

    .line 22
    .line 23
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->n:I

    .line 24
    .line 25
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->j:I

    .line 26
    .line 27
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->o:I

    .line 28
    .line 29
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->k:I

    .line 30
    .line 31
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->p:I

    .line 32
    .line 33
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->l:I

    .line 34
    .line 35
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->q:I

    .line 36
    .line 37
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->m:I

    .line 38
    .line 39
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->r:I

    .line 40
    .line 41
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->n:I

    .line 42
    .line 43
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->s:I

    .line 44
    .line 45
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->o:I

    .line 46
    .line 47
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->t:I

    .line 48
    .line 49
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->s:I

    .line 50
    .line 51
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->u:I

    .line 52
    .line 53
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->t:I

    .line 54
    .line 55
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->v:I

    .line 56
    .line 57
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->u:I

    .line 58
    .line 59
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->w:I

    .line 60
    .line 61
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->v:I

    .line 62
    .line 63
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->x:I

    .line 64
    .line 65
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->G:F

    .line 66
    .line 67
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->y:F

    .line 68
    .line 69
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->H:F

    .line 70
    .line 71
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->z:F

    .line 72
    .line 73
    iget-object v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->I:Ljava/lang/String;

    .line 74
    .line 75
    iput-object v0, p1, Landroidx/constraintlayout/widget/d$b;->A:Ljava/lang/String;

    .line 76
    .line 77
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->p:I

    .line 78
    .line 79
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->B:I

    .line 80
    .line 81
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->q:I

    .line 82
    .line 83
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->C:I

    .line 84
    .line 85
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->r:F

    .line 86
    .line 87
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->D:F

    .line 88
    .line 89
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->X:I

    .line 90
    .line 91
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->E:I

    .line 92
    .line 93
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->Y:I

    .line 94
    .line 95
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->F:I

    .line 96
    .line 97
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->Z:I

    .line 98
    .line 99
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->G:I

    .line 100
    .line 101
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->c:F

    .line 102
    .line 103
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->h:F

    .line 104
    .line 105
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:I

    .line 106
    .line 107
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->f:I

    .line 108
    .line 109
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->b:I

    .line 110
    .line 111
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->g:I

    .line 112
    .line 113
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 114
    .line 115
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->d:I

    .line 116
    .line 117
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 118
    .line 119
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->e:I

    .line 120
    .line 121
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 122
    .line 123
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->H:I

    .line 124
    .line 125
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 126
    .line 127
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->I:I

    .line 128
    .line 129
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 130
    .line 131
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->J:I

    .line 132
    .line 133
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 134
    .line 135
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->K:I

    .line 136
    .line 137
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->D:I

    .line 138
    .line 139
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->N:I

    .line 140
    .line 141
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->M:F

    .line 142
    .line 143
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->V:F

    .line 144
    .line 145
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->L:F

    .line 146
    .line 147
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->W:F

    .line 148
    .line 149
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->O:I

    .line 150
    .line 151
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->Y:I

    .line 152
    .line 153
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->N:I

    .line 154
    .line 155
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->X:I

    .line 156
    .line 157
    iget-boolean v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a0:Z

    .line 158
    .line 159
    iput-boolean v0, p1, Landroidx/constraintlayout/widget/d$b;->n0:Z

    .line 160
    .line 161
    iget-boolean v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->b0:Z

    .line 162
    .line 163
    iput-boolean v0, p1, Landroidx/constraintlayout/widget/d$b;->o0:Z

    .line 164
    .line 165
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->P:I

    .line 166
    .line 167
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->Z:I

    .line 168
    .line 169
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->Q:I

    .line 170
    .line 171
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->a0:I

    .line 172
    .line 173
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->T:I

    .line 174
    .line 175
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->b0:I

    .line 176
    .line 177
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->U:I

    .line 178
    .line 179
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->c0:I

    .line 180
    .line 181
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->R:I

    .line 182
    .line 183
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->d0:I

    .line 184
    .line 185
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->S:I

    .line 186
    .line 187
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->e0:I

    .line 188
    .line 189
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->V:F

    .line 190
    .line 191
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->f0:F

    .line 192
    .line 193
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->W:F

    .line 194
    .line 195
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->g0:F

    .line 196
    .line 197
    iget-object v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->c0:Ljava/lang/String;

    .line 198
    .line 199
    iput-object v0, p1, Landroidx/constraintlayout/widget/d$b;->m0:Ljava/lang/String;

    .line 200
    .line 201
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->x:I

    .line 202
    .line 203
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->P:I

    .line 204
    .line 205
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->z:I

    .line 206
    .line 207
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->R:I

    .line 208
    .line 209
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->w:I

    .line 210
    .line 211
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->O:I

    .line 212
    .line 213
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->y:I

    .line 214
    .line 215
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->Q:I

    .line 216
    .line 217
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->A:I

    .line 218
    .line 219
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->T:I

    .line 220
    .line 221
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->B:I

    .line 222
    .line 223
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->S:I

    .line 224
    .line 225
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->C:I

    .line 226
    .line 227
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->U:I

    .line 228
    .line 229
    iget v0, p2, Landroidx/constraintlayout/widget/ConstraintLayout$b;->d0:I

    .line 230
    .line 231
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->q0:I

    .line 232
    .line 233
    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    iput v0, p1, Landroidx/constraintlayout/widget/d$b;->L:I

    .line 238
    .line 239
    iget-object p0, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 240
    .line 241
    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    iput p1, p0, Landroidx/constraintlayout/widget/d$b;->M:I

    .line 246
    .line 247
    return-void
.end method

.method private h(ILandroidx/constraintlayout/widget/e$a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/d$a;->g(ILandroidx/constraintlayout/widget/ConstraintLayout$b;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Landroidx/constraintlayout/widget/d$a;->c:Landroidx/constraintlayout/widget/d$d;

    .line 5
    .line 6
    iget v0, p2, Landroidx/constraintlayout/widget/e$a;->x0:F

    .line 7
    .line 8
    iput v0, p1, Landroidx/constraintlayout/widget/d$d;->d:F

    .line 9
    .line 10
    iget-object p0, p0, Landroidx/constraintlayout/widget/d$a;->f:Landroidx/constraintlayout/widget/d$e;

    .line 11
    .line 12
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->A0:F

    .line 13
    .line 14
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->b:F

    .line 15
    .line 16
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->B0:F

    .line 17
    .line 18
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->c:F

    .line 19
    .line 20
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->C0:F

    .line 21
    .line 22
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->d:F

    .line 23
    .line 24
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->D0:F

    .line 25
    .line 26
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->e:F

    .line 27
    .line 28
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->E0:F

    .line 29
    .line 30
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->f:F

    .line 31
    .line 32
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->F0:F

    .line 33
    .line 34
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->g:F

    .line 35
    .line 36
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->G0:F

    .line 37
    .line 38
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->h:F

    .line 39
    .line 40
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->H0:F

    .line 41
    .line 42
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->j:F

    .line 43
    .line 44
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->I0:F

    .line 45
    .line 46
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->k:F

    .line 47
    .line 48
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->J0:F

    .line 49
    .line 50
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->l:F

    .line 51
    .line 52
    iget p1, p2, Landroidx/constraintlayout/widget/e$a;->z0:F

    .line 53
    .line 54
    iput p1, p0, Landroidx/constraintlayout/widget/d$e;->n:F

    .line 55
    .line 56
    iget-boolean p1, p2, Landroidx/constraintlayout/widget/e$a;->y0:Z

    .line 57
    .line 58
    iput-boolean p1, p0, Landroidx/constraintlayout/widget/d$e;->m:Z

    .line 59
    .line 60
    return-void
.end method

.method private i(Landroidx/constraintlayout/widget/b;ILandroidx/constraintlayout/widget/e$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3}, Landroidx/constraintlayout/widget/d$a;->h(ILandroidx/constraintlayout/widget/e$a;)V

    .line 2
    .line 3
    .line 4
    instance-of p2, p1, Landroidx/constraintlayout/widget/Barrier;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    iput p3, p2, Landroidx/constraintlayout/widget/d$b;->j0:I

    .line 12
    .line 13
    check-cast p1, Landroidx/constraintlayout/widget/Barrier;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/Barrier;->getType()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    iput p3, p2, Landroidx/constraintlayout/widget/d$b;->h0:I

    .line 20
    .line 21
    iget-object p2, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/b;->getReferencedIds()[I

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    iput-object p3, p2, Landroidx/constraintlayout/widget/d$b;->k0:[I

    .line 28
    .line 29
    iget-object p0, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/Barrier;->getMargin()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Landroidx/constraintlayout/widget/d$b;->i0:I

    .line 36
    .line 37
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/d$a;->f()Landroidx/constraintlayout/widget/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Landroidx/constraintlayout/widget/d$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/widget/d$a;->h:Landroidx/constraintlayout/widget/d$a$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/d$a$a;->e(Landroidx/constraintlayout/widget/d$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e(Landroidx/constraintlayout/widget/ConstraintLayout$b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 2
    .line 3
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->j:I

    .line 4
    .line 5
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->e:I

    .line 6
    .line 7
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->k:I

    .line 8
    .line 9
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->f:I

    .line 10
    .line 11
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->l:I

    .line 12
    .line 13
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g:I

    .line 14
    .line 15
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->m:I

    .line 16
    .line 17
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->h:I

    .line 18
    .line 19
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->n:I

    .line 20
    .line 21
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->i:I

    .line 22
    .line 23
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->o:I

    .line 24
    .line 25
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->j:I

    .line 26
    .line 27
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->p:I

    .line 28
    .line 29
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->k:I

    .line 30
    .line 31
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->q:I

    .line 32
    .line 33
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->l:I

    .line 34
    .line 35
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->r:I

    .line 36
    .line 37
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->m:I

    .line 38
    .line 39
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->s:I

    .line 40
    .line 41
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->n:I

    .line 42
    .line 43
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->t:I

    .line 44
    .line 45
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->o:I

    .line 46
    .line 47
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->u:I

    .line 48
    .line 49
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->s:I

    .line 50
    .line 51
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->v:I

    .line 52
    .line 53
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->t:I

    .line 54
    .line 55
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->w:I

    .line 56
    .line 57
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->u:I

    .line 58
    .line 59
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->x:I

    .line 60
    .line 61
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->v:I

    .line 62
    .line 63
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->H:I

    .line 64
    .line 65
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 66
    .line 67
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->I:I

    .line 68
    .line 69
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 70
    .line 71
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->J:I

    .line 72
    .line 73
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 74
    .line 75
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->K:I

    .line 76
    .line 77
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 78
    .line 79
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->T:I

    .line 80
    .line 81
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->A:I

    .line 82
    .line 83
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->S:I

    .line 84
    .line 85
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->B:I

    .line 86
    .line 87
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->P:I

    .line 88
    .line 89
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->x:I

    .line 90
    .line 91
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->R:I

    .line 92
    .line 93
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->z:I

    .line 94
    .line 95
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->y:F

    .line 96
    .line 97
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->G:F

    .line 98
    .line 99
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->z:F

    .line 100
    .line 101
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->H:F

    .line 102
    .line 103
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->B:I

    .line 104
    .line 105
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->p:I

    .line 106
    .line 107
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->C:I

    .line 108
    .line 109
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->q:I

    .line 110
    .line 111
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->D:F

    .line 112
    .line 113
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->r:F

    .line 114
    .line 115
    iget-object v1, v0, Landroidx/constraintlayout/widget/d$b;->A:Ljava/lang/String;

    .line 116
    .line 117
    iput-object v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->I:Ljava/lang/String;

    .line 118
    .line 119
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->E:I

    .line 120
    .line 121
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->X:I

    .line 122
    .line 123
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->F:I

    .line 124
    .line 125
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->Y:I

    .line 126
    .line 127
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->V:F

    .line 128
    .line 129
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->M:F

    .line 130
    .line 131
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->W:F

    .line 132
    .line 133
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->L:F

    .line 134
    .line 135
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->Y:I

    .line 136
    .line 137
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->O:I

    .line 138
    .line 139
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->X:I

    .line 140
    .line 141
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->N:I

    .line 142
    .line 143
    iget-boolean v1, v0, Landroidx/constraintlayout/widget/d$b;->n0:Z

    .line 144
    .line 145
    iput-boolean v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a0:Z

    .line 146
    .line 147
    iget-boolean v1, v0, Landroidx/constraintlayout/widget/d$b;->o0:Z

    .line 148
    .line 149
    iput-boolean v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->b0:Z

    .line 150
    .line 151
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->Z:I

    .line 152
    .line 153
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->P:I

    .line 154
    .line 155
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->a0:I

    .line 156
    .line 157
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->Q:I

    .line 158
    .line 159
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->b0:I

    .line 160
    .line 161
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->T:I

    .line 162
    .line 163
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->c0:I

    .line 164
    .line 165
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->U:I

    .line 166
    .line 167
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->d0:I

    .line 168
    .line 169
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->R:I

    .line 170
    .line 171
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->e0:I

    .line 172
    .line 173
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->S:I

    .line 174
    .line 175
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->f0:F

    .line 176
    .line 177
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->V:F

    .line 178
    .line 179
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->g0:F

    .line 180
    .line 181
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->W:F

    .line 182
    .line 183
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->G:I

    .line 184
    .line 185
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->Z:I

    .line 186
    .line 187
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->h:F

    .line 188
    .line 189
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->c:F

    .line 190
    .line 191
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->f:I

    .line 192
    .line 193
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a:I

    .line 194
    .line 195
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->g:I

    .line 196
    .line 197
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->b:I

    .line 198
    .line 199
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->d:I

    .line 200
    .line 201
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 202
    .line 203
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->e:I

    .line 204
    .line 205
    iput v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 206
    .line 207
    iget-object v1, v0, Landroidx/constraintlayout/widget/d$b;->m0:Ljava/lang/String;

    .line 208
    .line 209
    if-eqz v1, :cond_0

    .line 210
    .line 211
    iput-object v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->c0:Ljava/lang/String;

    .line 212
    .line 213
    :cond_0
    iget v1, v0, Landroidx/constraintlayout/widget/d$b;->q0:I

    .line 214
    .line 215
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->d0:I

    .line 216
    .line 217
    iget v0, v0, Landroidx/constraintlayout/widget/d$b;->M:I

    .line 218
    .line 219
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 223
    .line 224
    iget p0, p0, Landroidx/constraintlayout/widget/d$b;->L:I

    .line 225
    .line 226
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout$b;->b()V

    .line 230
    .line 231
    .line 232
    return-void
.end method

.method public f()Landroidx/constraintlayout/widget/d$a;
    .locals 3

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/d$a;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/constraintlayout/widget/d$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 7
    .line 8
    iget-object v2, p0, Landroidx/constraintlayout/widget/d$a;->e:Landroidx/constraintlayout/widget/d$b;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/widget/d$b;->a(Landroidx/constraintlayout/widget/d$b;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Landroidx/constraintlayout/widget/d$a;->d:Landroidx/constraintlayout/widget/d$c;

    .line 14
    .line 15
    iget-object v2, p0, Landroidx/constraintlayout/widget/d$a;->d:Landroidx/constraintlayout/widget/d$c;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/widget/d$c;->a(Landroidx/constraintlayout/widget/d$c;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, v0, Landroidx/constraintlayout/widget/d$a;->c:Landroidx/constraintlayout/widget/d$d;

    .line 21
    .line 22
    iget-object v2, p0, Landroidx/constraintlayout/widget/d$a;->c:Landroidx/constraintlayout/widget/d$d;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/widget/d$d;->a(Landroidx/constraintlayout/widget/d$d;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, v0, Landroidx/constraintlayout/widget/d$a;->f:Landroidx/constraintlayout/widget/d$e;

    .line 28
    .line 29
    iget-object v2, p0, Landroidx/constraintlayout/widget/d$a;->f:Landroidx/constraintlayout/widget/d$e;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/widget/d$e;->a(Landroidx/constraintlayout/widget/d$e;)V

    .line 32
    .line 33
    .line 34
    iget v1, p0, Landroidx/constraintlayout/widget/d$a;->a:I

    .line 35
    .line 36
    iput v1, v0, Landroidx/constraintlayout/widget/d$a;->a:I

    .line 37
    .line 38
    iget-object p0, p0, Landroidx/constraintlayout/widget/d$a;->h:Landroidx/constraintlayout/widget/d$a$a;

    .line 39
    .line 40
    iput-object p0, v0, Landroidx/constraintlayout/widget/d$a;->h:Landroidx/constraintlayout/widget/d$a$a;

    .line 41
    .line 42
    return-object v0
.end method
