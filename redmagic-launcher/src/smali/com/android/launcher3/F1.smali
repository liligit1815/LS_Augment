.class public Lcom/android/launcher3/F1;
.super Lcom/android/launcher3/r4;
.source "InvariantDeviceProfile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/F1$a;,
        Lcom/android/launcher3/F1$b;,
        Lcom/android/launcher3/F1$d;,
        Lcom/android/launcher3/F1$c;
    }
.end annotation


# static fields
.field public static final L1:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/F1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A1:Ljava/lang/String;

.field public B1:Z

.field private final C0:Lcom/android/launcher3/util/Z;

.field public C1:Z

.field private final D0:Lcom/android/launcher3/util/window/d;

.field public D1:I

.field private final E0:Lcom/android/launcher3/J3;

.field public E1:Ljava/lang/String;

.field private final F0:Ln1/C;

.field public F1:I

.field public G0:I

.field public G1:I

.field public H0:I

.field public H1:[Z

.field public I0:I

.field public I1:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/h0;",
            ">;"
        }
    .end annotation
.end field

.field public J0:[I

.field public J1:Landroid/graphics/Point;

.field public K0:[I

.field private final K1:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$d;",
            ">;"
        }
    .end annotation
.end field

.field public L0:[F

.field public M0:[F

.field public N0:I

.field public O0:I

.field public P0:I

.field public Q0:Lcom/android/launcher3/util/Z$c;

.field public R0:[Landroid/graphics/PointF;

.field public S0:[Landroid/graphics/PointF;

.field public T0:I

.field public U0:I

.field public V0:I

.field public W0:[F

.field public X0:[Landroid/graphics/PointF;

.field public Y0:[F

.field public Z0:[F

.field public a1:[Landroid/graphics/PointF;

.field public b1:[F

.field public c1:[Z

.field public d1:I

.field public e1:I

.field public f1:[F

.field public g1:[F

.field public h1:I

.field public i1:I

.field public j1:I

.field public k1:I

.field protected l1:Z

.field public m1:I

.field public n1:I

.field public o1:I

.field public p1:I

.field public q1:I

.field public r1:I

.field public s1:I

.field public t1:I

.field public u1:I

.field public v1:I

.field public w1:I

.field public x1:I

.field public y1:I

.field public z1:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/m1;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/m1;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/J3;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/window/d;Ln1/C;Lcom/android/launcher3/util/K;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/r4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/F1;->m1:I

    .line 6
    .line 7
    iput v0, p0, Lcom/android/launcher3/F1;->n1:I

    .line 8
    .line 9
    iput v0, p0, Lcom/android/launcher3/F1;->o1:I

    .line 10
    .line 11
    iput v0, p0, Lcom/android/launcher3/F1;->p1:I

    .line 12
    .line 13
    iput v0, p0, Lcom/android/launcher3/F1;->q1:I

    .line 14
    .line 15
    iput v0, p0, Lcom/android/launcher3/F1;->r1:I

    .line 16
    .line 17
    iput v0, p0, Lcom/android/launcher3/F1;->s1:I

    .line 18
    .line 19
    iput v0, p0, Lcom/android/launcher3/F1;->t1:I

    .line 20
    .line 21
    iput v0, p0, Lcom/android/launcher3/F1;->u1:I

    .line 22
    .line 23
    iput v0, p0, Lcom/android/launcher3/F1;->v1:I

    .line 24
    .line 25
    iput v0, p0, Lcom/android/launcher3/F1;->w1:I

    .line 26
    .line 27
    iput v0, p0, Lcom/android/launcher3/F1;->x1:I

    .line 28
    .line 29
    iput v0, p0, Lcom/android/launcher3/F1;->y1:I

    .line 30
    .line 31
    iput v0, p0, Lcom/android/launcher3/F1;->z1:I

    .line 32
    .line 33
    const-string v0, ""

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/F1;->A1:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Lcom/android/launcher3/F1;->B1:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/android/launcher3/F1;->C1:Z

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    new-array v1, v1, [Z

    .line 44
    .line 45
    iput-object v1, p0, Lcom/android/launcher3/F1;->H1:[Z

    .line 46
    .line 47
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 50
    .line 51
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Lcom/android/launcher3/F1;->K1:Ljava/util/List;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/android/launcher3/H5;->q(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object p3, p0, Lcom/android/launcher3/F1;->C0:Lcom/android/launcher3/util/Z;

    .line 62
    .line 63
    iput-object p4, p0, Lcom/android/launcher3/F1;->D0:Lcom/android/launcher3/util/window/d;

    .line 64
    .line 65
    iput-object p2, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 66
    .line 67
    iput-object p5, p0, Lcom/android/launcher3/F1;->F0:Ln1/C;

    .line 68
    .line 69
    sget-object p4, Lcom/android/launcher3/J3;->u:Lcom/android/launcher3/X;

    .line 70
    .line 71
    invoke-virtual {p2, p4}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p4

    .line 75
    check-cast p4, Ljava/lang/String;

    .line 76
    .line 77
    invoke-direct {p0, p1, p4}, Lcom/android/launcher3/F1;->y0(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    new-instance p4, Lcom/android/launcher3/p1;

    .line 81
    .line 82
    invoke-direct {p4, p0}, Lcom/android/launcher3/p1;-><init>(Lcom/android/launcher3/F1;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p3, p4}, Lcom/android/launcher3/util/Z;->S(Lcom/android/launcher3/util/Z$b;)V

    .line 86
    .line 87
    .line 88
    new-instance p4, Lcom/android/launcher3/q1;

    .line 89
    .line 90
    invoke-direct {p4, p3}, Lcom/android/launcher3/q1;-><init>(Lcom/android/launcher3/util/Z;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p6, p4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 94
    .line 95
    .line 96
    new-instance p3, Lcom/android/launcher3/r1;

    .line 97
    .line 98
    invoke-direct {p3, p0, p2, p1}, Lcom/android/launcher3/r1;-><init>(Lcom/android/launcher3/F1;Lcom/android/launcher3/J3;Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    const/4 p4, 0x2

    .line 102
    new-array p4, p4, [Lcom/android/launcher3/H1;

    .line 103
    .line 104
    sget-object p5, Lcom/android/launcher3/J3;->w:Lcom/android/launcher3/X;

    .line 105
    .line 106
    aput-object p5, p4, v0

    .line 107
    .line 108
    sget-object p5, Lcom/android/launcher3/J3;->e:Lcom/android/launcher3/X;

    .line 109
    .line 110
    const/4 v0, 0x1

    .line 111
    aput-object p5, p4, v0

    .line 112
    .line 113
    invoke-virtual {p2, p3, p4}, Lcom/android/launcher3/J3;->d(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 114
    .line 115
    .line 116
    new-instance p4, Lcom/android/launcher3/s1;

    .line 117
    .line 118
    invoke-direct {p4, p2, p3}, Lcom/android/launcher3/s1;-><init>(Lcom/android/launcher3/J3;Lcom/android/launcher3/F3;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p6, p4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 122
    .line 123
    .line 124
    new-instance p2, Lcom/android/launcher3/util/x2;

    .line 125
    .line 126
    sget-object p3, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 127
    .line 128
    new-instance p4, Lcom/android/launcher3/t1;

    .line 129
    .line 130
    invoke-direct {p4, p0, p1}, Lcom/android/launcher3/t1;-><init>(Lcom/android/launcher3/F1;Landroid/content/Context;)V

    .line 131
    .line 132
    .line 133
    invoke-direct {p2, p1, p3, p4}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 134
    .line 135
    .line 136
    const-string p0, "android.intent.action.LOCALE_CHANGED"

    .line 137
    .line 138
    filled-new-array {p0}, [Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    new-instance p0, Lcom/android/launcher3/u1;

    .line 146
    .line 147
    invoke-direct {p0, p2}, Lcom/android/launcher3/u1;-><init>(Lcom/android/launcher3/util/x2;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p6, p0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method private static A0(Lcom/android/launcher3/util/Z$c;Ljava/util/List;I)Lcom/android/launcher3/F1$a;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/Z$c;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$a;",
            ">;I)",
            "Lcom/android/launcher3/F1$a;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7fffffff

    .line 8
    .line 9
    .line 10
    move v2, v1

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/android/launcher3/util/p3;

    .line 22
    .line 23
    invoke-virtual {p0, v3}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    if-ne p2, v5, :cond_0

    .line 31
    .line 32
    iget-object v4, v3, Lcom/android/launcher3/util/p3;->c:Landroid/graphics/Point;

    .line 33
    .line 34
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 35
    .line 36
    div-int/lit8 v4, v4, 0x2

    .line 37
    .line 38
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v3, v3, Lcom/android/launcher3/util/p3;->c:Landroid/graphics/Point;

    .line 43
    .line 44
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 45
    .line 46
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    if-nez v4, :cond_1

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/android/launcher3/util/p3;->b()Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_1

    .line 58
    .line 59
    iget-object v4, v3, Lcom/android/launcher3/util/p3;->c:Landroid/graphics/Point;

    .line 60
    .line 61
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 62
    .line 63
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iget-object v3, v3, Lcom/android/launcher3/util/p3;->c:Landroid/graphics/Point;

    .line 68
    .line 69
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 70
    .line 71
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    iget-object v4, v3, Lcom/android/launcher3/util/p3;->c:Landroid/graphics/Point;

    .line 77
    .line 78
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 79
    .line 80
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    iget-object v3, v3, Lcom/android/launcher3/util/p3;->c:Landroid/graphics/Point;

    .line 85
    .line 86
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 87
    .line 88
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    goto :goto_0

    .line 93
    :cond_2
    int-to-float p2, v1

    .line 94
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->l()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-static {p2, v0}, Lcom/android/launcher3/N5;->j(FI)F

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    int-to-float v0, v2

    .line 103
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->l()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    invoke-static {v0, p0}, Lcom/android/launcher3/N5;->j(FI)F

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    new-instance v0, Lcom/android/launcher3/x1;

    .line 112
    .line 113
    invoke-direct {v0, p2, p0}, Lcom/android/launcher3/x1;-><init>(FF)V

    .line 114
    .line 115
    .line 116
    invoke-interface {p1, v0}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 117
    .line 118
    .line 119
    const/4 v0, 0x0

    .line 120
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Lcom/android/launcher3/F1$a;

    .line 125
    .line 126
    iget-object v2, v1, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 127
    .line 128
    invoke-static {v1}, Lcom/android/launcher3/F1$a;->o(Lcom/android/launcher3/F1$a;)F

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-static {v1}, Lcom/android/launcher3/F1$a;->n(Lcom/android/launcher3/F1$a;)F

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    invoke-static {p2, p0, v3, v4}, Lcom/android/launcher3/F1;->l0(FFFF)F

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    const/4 v4, 0x0

    .line 141
    cmpl-float v3, v3, v4

    .line 142
    .line 143
    if-nez v3, :cond_3

    .line 144
    .line 145
    return-object v1

    .line 146
    :cond_3
    new-instance v3, Lcom/android/launcher3/F1$a;

    .line 147
    .line 148
    invoke-direct {v3, v2}, Lcom/android/launcher3/F1$a;-><init>(Lcom/android/launcher3/F1$b;)V

    .line 149
    .line 150
    .line 151
    move v2, v0

    .line 152
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-ge v2, v5, :cond_4

    .line 157
    .line 158
    int-to-float v5, v2

    .line 159
    const/high16 v6, 0x40400000    # 3.0f

    .line 160
    .line 161
    cmpg-float v5, v5, v6

    .line 162
    .line 163
    if-gez v5, :cond_4

    .line 164
    .line 165
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    check-cast v5, Lcom/android/launcher3/F1$a;

    .line 170
    .line 171
    invoke-static {v5}, Lcom/android/launcher3/F1$a;->o(Lcom/android/launcher3/F1$a;)F

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    invoke-static {v5}, Lcom/android/launcher3/F1$a;->n(Lcom/android/launcher3/F1$a;)F

    .line 176
    .line 177
    .line 178
    move-result v7

    .line 179
    const/high16 v8, 0x40a00000    # 5.0f

    .line 180
    .line 181
    invoke-static {p2, p0, v6, v7, v8}, Lcom/android/launcher3/F1;->T0(FFFFF)F

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    add-float/2addr v4, v6

    .line 186
    new-instance v7, Lcom/android/launcher3/F1$a;

    .line 187
    .line 188
    invoke-direct {v7}, Lcom/android/launcher3/F1$a;-><init>()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v7, v5}, Lcom/android/launcher3/F1$a;->s(Lcom/android/launcher3/F1$a;)Lcom/android/launcher3/F1$a;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    invoke-virtual {v5, v6}, Lcom/android/launcher3/F1$a;->t(F)Lcom/android/launcher3/F1$a;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    invoke-virtual {v3, v5}, Lcom/android/launcher3/F1$a;->s(Lcom/android/launcher3/F1$a;)Lcom/android/launcher3/F1$a;

    .line 200
    .line 201
    .line 202
    add-int/lit8 v2, v2, 0x1

    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_4
    const/high16 p0, 0x3f800000    # 1.0f

    .line 206
    .line 207
    div-float/2addr p0, v4

    .line 208
    invoke-virtual {v3, p0}, Lcom/android/launcher3/F1$a;->t(F)Lcom/android/launcher3/F1$a;

    .line 209
    .line 210
    .line 211
    :goto_2
    const/4 p0, 0x4

    .line 212
    if-ge v0, p0, :cond_5

    .line 213
    .line 214
    invoke-static {v3}, Lcom/android/launcher3/F1$a;->l(Lcom/android/launcher3/F1$a;)[F

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {v3}, Lcom/android/launcher3/F1$a;->l(Lcom/android/launcher3/F1$a;)[F

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    aget p1, p1, v0

    .line 223
    .line 224
    invoke-static {v1}, Lcom/android/launcher3/F1$a;->l(Lcom/android/launcher3/F1$a;)[F

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    aget p2, p2, v0

    .line 229
    .line 230
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    aput p1, p0, v0

    .line 235
    .line 236
    add-int/lit8 v0, v0, 0x1

    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_5
    return-object v3
.end method

.method private synthetic C0(Landroid/content/Context;ZZZZZ)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "forceChangeConfig: forceStop or not"

    .line 10
    .line 11
    const-string v2, "IDP"

    .line 12
    .line 13
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->s0()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    const-string v1, "forceChangeConfig: forceStop!"

    .line 23
    .line 24
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->b0()V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/F1;->L0(Landroid/content/Context;ZZZZZ)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic D0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 0

    .line 1
    and-int/lit8 p2, p3, 0x7c

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/F1;->K0(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic E0(Lcom/android/launcher3/J3;Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/J3;->w:Lcom/android/launcher3/X;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/X;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/android/launcher3/F1;->C1:Z

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eq v1, v0, :cond_1

    .line 26
    .line 27
    const-string p3, "InvariantDeviceProfile#setFixedLandscape"

    .line 28
    .line 29
    invoke-static {p3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-boolean p3, p0, Lcom/android/launcher3/F1;->C1:Z

    .line 33
    .line 34
    if-eqz p3, :cond_0

    .line 35
    .line 36
    sget-object p3, Lcom/android/launcher3/J3;->x:Lcom/android/launcher3/X;

    .line 37
    .line 38
    invoke-virtual {p1, p3}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/F1;->Q0(Landroid/content/Context;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget-object p3, Lcom/android/launcher3/J3;->x:Lcom/android/launcher3/X;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 51
    .line 52
    sget-object v1, Lcom/android/launcher3/J3;->u:Lcom/android/launcher3/X;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, p3, v0}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lcom/android/launcher3/F1;->K0(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    sget-object v0, Lcom/android/launcher3/J3;->e:Lcom/android/launcher3/X;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/android/launcher3/X;->c()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p3

    .line 80
    if-eqz p3, :cond_2

    .line 81
    .line 82
    iget-boolean p3, p0, Lcom/android/launcher3/F1;->B1:Z

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Ljava/lang/Boolean;

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eq p3, p1, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0, p2}, Lcom/android/launcher3/F1;->K0(Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    return-void
.end method

.method private synthetic F0(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    const-string v0, "curUserId"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, v2}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    if-ne p2, v0, :cond_1

    .line 29
    .line 30
    :cond_0
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Ls1/P;->t0()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/android/launcher3/F1;->K0(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 45
    .line 46
    new-instance p2, Lcom/android/launcher3/v1;

    .line 47
    .line 48
    invoke-direct {p2, p1}, Lcom/android/launcher3/v1;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :try_start_0
    invoke-static {}, Lx1/O;->S2()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    invoke-static {}, Lx1/O;->O0()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_2

    .line 65
    .line 66
    invoke-static {}, Lcom/android/launcher3/resource/Q;->f()Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    :cond_2
    invoke-static {}, Lx1/O;->R2()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_3

    .line 74
    .line 75
    invoke-static {}, Lx1/O;->O0()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-nez p0, :cond_3

    .line 80
    .line 81
    invoke-static {}, Lcom/android/launcher3/resource/Q;->f()Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :catch_0
    move-exception p0

    .line 86
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method private synthetic G0(Lcom/android/launcher3/F1$b;)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1;->P0:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/F1$b;->G(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private synthetic H0(Lcom/android/launcher3/F1$b;)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/F1;->P0:I

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/F1;->C1:Z

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/F1$b;->F(IZ)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private synthetic I0(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "InvariantDeviceProfile#setCurrentGrid"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/F1;->K0(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private L0(Landroid/content/Context;ZZZZZ)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/F1;->R0()[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 5
    .line 6
    sget-object v1, Lcom/android/launcher3/J3;->u:Lcom/android/launcher3/X;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/String;

    .line 13
    .line 14
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/F1;->y0(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/F1;->K1:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    move-object v0, p1

    .line 34
    check-cast v0, Lcom/android/launcher3/F1$d;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    move v2, p2

    .line 38
    move v3, p3

    .line 39
    move v4, p4

    .line 40
    move v5, p5

    .line 41
    move v6, p6

    .line 42
    invoke-interface/range {v0 .. v6}, Lcom/android/launcher3/F1$d;->o(ZZZZZZ)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-void
.end method

.method public static M0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/util/Z$c;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$b;",
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
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const v2, 0x7f17000a

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 14
    .line 15
    .line 16
    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    :try_start_1
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->next()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/4 v4, 0x3

    .line 26
    if-ne v3, v4, :cond_1

    .line 27
    .line 28
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-le v4, v2, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    :goto_1
    const/4 v4, 0x1

    .line 38
    if-eq v3, v4, :cond_2

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    if-ne v3, v4, :cond_0

    .line 42
    .line 43
    const-string v3, "grid-option"

    .line 44
    .line 45
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    new-instance v3, Lcom/android/launcher3/F1$b;

    .line 56
    .line 57
    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-direct {v3, p0, v4, p1}, Lcom/android/launcher3/F1$b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/android/launcher3/util/Z$c;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    :try_start_2
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0

    .line 69
    .line 70
    .line 71
    return-object v0

    .line 72
    :goto_2
    if-eqz v1, :cond_3

    .line 73
    .line 74
    :try_start_3
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 75
    .line 76
    .line 77
    goto :goto_3

    .line 78
    :catchall_1
    move-exception p1

    .line 79
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_3
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0

    .line 83
    :catch_0
    move-exception p0

    .line 84
    const-string p1, "IDP"

    .line 85
    .line 86
    const-string v0, "Error parsing device profile"

    .line 87
    .line 88
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    .line 90
    .line 91
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 92
    .line 93
    return-object p0
.end method

.method public static synthetic Q(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic R(ILcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iput p0, p1, Lcom/android/launcher3/h0;->a2:I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->V0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private R0()[Ljava/lang/Object;
    .locals 10

    .line 1
    iget v0, p0, Lcom/android/launcher3/F1;->H0:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v0, p0, Lcom/android/launcher3/F1;->G0:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget v0, p0, Lcom/android/launcher3/F1;->I0:I

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget v0, p0, Lcom/android/launcher3/F1;->e1:I

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    iget v0, p0, Lcom/android/launcher3/F1;->N0:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    iget v0, p0, Lcom/android/launcher3/F1;->O0:I

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    iget v0, p0, Lcom/android/launcher3/F1;->j1:I

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    iget-object v8, p0, Lcom/android/launcher3/F1;->E1:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v9, p0, Lcom/android/launcher3/F1;->A1:Ljava/lang/String;

    .line 46
    .line 47
    filled-new-array/range {v1 .. v9}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public static synthetic S(FFLcom/android/launcher3/F1$a;Lcom/android/launcher3/F1$a;)I
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/F1$a;->o(Lcom/android/launcher3/F1$a;)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Lcom/android/launcher3/F1$a;->n(Lcom/android/launcher3/F1$a;)F

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-static {p0, p1, v0, p2}, Lcom/android/launcher3/F1;->l0(FFFF)F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->o(Lcom/android/launcher3/F1$a;)F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->n(Lcom/android/launcher3/F1$a;)F

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    invoke-static {p0, p1, v0, p3}, Lcom/android/launcher3/F1;->l0(FFFF)F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p2, p0}, Ljava/lang/Float;->compare(FF)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method private static S0(II)F
    .locals 0

    .line 1
    int-to-float p0, p0

    .line 2
    int-to-float p1, p1

    .line 3
    div-float/2addr p0, p1

    .line 4
    const p1, 0x3e9d89d7

    .line 5
    .line 6
    .line 7
    mul-float/2addr p0, p1

    .line 8
    const p1, 0x3f80fc10

    .line 9
    .line 10
    .line 11
    add-float/2addr p0, p1

    .line 12
    return p0
.end method

.method public static synthetic T(Ljava/lang/String;Lcom/android/launcher3/F1$b;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/F1$b;->c(Lcom/android/launcher3/F1$b;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private static T0(FFFFF)F
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/F1;->l0(FFFF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    float-to-double p0, p0

    .line 16
    float-to-double p2, p4

    .line 17
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->pow(DD)D

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    const-wide p2, 0x40f86a0000000000L    # 100000.0

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    div-double/2addr p2, p0

    .line 27
    double-to-float p0, p2

    .line 28
    return p0
.end method

.method public static synthetic U(Lcom/android/launcher3/util/Z;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Z;->S(Lcom/android/launcher3/util/Z$b;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic V(Lcom/android/launcher3/util/x2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Landroid/content/Context;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lx1/O;->c:Landroid/net/Uri;

    .line 6
    .line 7
    const-string v1, "localeChange"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic X(Lcom/android/launcher3/F1;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/F1;->I0(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y(ILcom/android/launcher3/F1$a;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 2
    .line 3
    iget p1, p1, Lcom/android/launcher3/F1$b;->e:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

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

.method public static synthetic Z(Lcom/android/launcher3/F1;Lcom/android/launcher3/J3;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/F1;->E0(Lcom/android/launcher3/J3;Landroid/content/Context;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a0(Lcom/android/launcher3/F1;Landroid/content/Context;ZZZZZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/F1;->C0(Landroid/content/Context;ZZZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b0(Lcom/android/launcher3/h0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c0(Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/h0;->a2:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d0(Lcom/android/launcher3/F1;Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/F1;->F0(Landroid/content/Context;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Lcom/android/launcher3/F1;Lcom/android/launcher3/F1$b;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/F1;->H0(Lcom/android/launcher3/F1$b;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic f0(Lcom/android/launcher3/J3;Lcom/android/launcher3/F3;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Lcom/android/launcher3/H1;

    .line 3
    .line 4
    sget-object v1, Lcom/android/launcher3/J3;->w:Lcom/android/launcher3/X;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput-object v1, v0, v2

    .line 8
    .line 9
    sget-object v1, Lcom/android/launcher3/J3;->e:Lcom/android/launcher3/X;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aput-object v1, v0, v2

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/J3;->x(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic g0(Lcom/android/launcher3/F1;Lcom/android/launcher3/F1$b;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/F1;->G0(Lcom/android/launcher3/F1$b;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic h0(Lcom/android/launcher3/F1;Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/F1;->D0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic i0(Lcom/android/launcher3/util/W1;Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/F1$c;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/F1;->v0(Lcom/android/launcher3/util/W1;Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/F1$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static l0(FFFF)F
    .locals 2

    .line 1
    sub-float/2addr p2, p0

    .line 2
    float-to-double v0, p2

    .line 3
    sub-float/2addr p3, p1

    .line 4
    float-to-double p0, p3

    .line 5
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->hypot(DD)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    double-to-float p0, p0

    .line 10
    return p0
.end method

.method private m0(Ljava/util/List;I)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$a;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$a;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Lcom/android/launcher3/D1;

    .line 6
    .line 7
    invoke-direct {p1, p2}, Lcom/android/launcher3/D1;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/List;

    .line 23
    .line 24
    return-object p0
.end method

.method private static n0(Ljava/util/List;II)Lcom/android/launcher3/F1$c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$c;",
            ">;II)",
            "Lcom/android/launcher3/F1$c;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/F1$c;

    .line 17
    .line 18
    int-to-float v2, p1

    .line 19
    iget v3, v1, Lcom/android/launcher3/F1$c;->c:F

    .line 20
    .line 21
    cmpl-float v2, v2, v3

    .line 22
    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    int-to-float v2, p2

    .line 26
    iget v3, v1, Lcom/android/launcher3/F1$c;->d:F

    .line 27
    .line 28
    cmpl-float v2, v2, v3

    .line 29
    .line 30
    if-ltz v2, :cond_0

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget v2, v0, Lcom/android/launcher3/F1$c;->b:I

    .line 35
    .line 36
    iget v3, v1, Lcom/android/launcher3/F1$c;->b:I

    .line 37
    .line 38
    if-gt v2, v3, :cond_0

    .line 39
    .line 40
    iget v2, v0, Lcom/android/launcher3/F1$c;->a:I

    .line 41
    .line 42
    iget v3, v1, Lcom/android/launcher3/F1$c;->a:I

    .line 43
    .line 44
    if-gt v2, v3, :cond_0

    .line 45
    .line 46
    :cond_1
    move-object v0, v1

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return-object v0
.end method

.method private static o0(Lcom/android/launcher3/util/Z$c;)[I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->j()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const v0, 0x7fffffff

    .line 10
    .line 11
    .line 12
    move v1, v0

    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/android/launcher3/util/window/a;

    .line 24
    .line 25
    iget-object v3, v2, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 26
    .line 27
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v2, v2, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 34
    .line 35
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    filled-new-array {v0, v1}, [I

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method private static p0(Lcom/android/launcher3/F1$b;IZZ)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/F1$b;->G(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/F1$b;->F(IZ)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private static v0(Lcom/android/launcher3/util/W1;Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/F1$c;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/android/launcher3/util/W1;->a()Landroid/content/res/XmlResourceParser;

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    :try_start_1
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->next()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x3

    .line 19
    const/4 v4, 0x1

    .line 20
    if-ne v2, v3, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-le v3, v1, :cond_2

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_2

    .line 31
    :cond_1
    :goto_1
    if-eq v2, v4, :cond_2

    .line 32
    .line 33
    const/4 v3, 0x2

    .line 34
    if-ne v2, v3, :cond_0

    .line 35
    .line 36
    const-string v2, "GridSize"

    .line 37
    .line 38
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    new-instance v2, Lcom/android/launcher3/F1$c;

    .line 49
    .line 50
    invoke-static {p0}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-direct {v2, p1, v3}, Lcom/android/launcher3/F1$c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    :try_start_2
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0

    .line 62
    .line 63
    .line 64
    invoke-static {p2}, Lcom/android/launcher3/F1;->o0(Lcom/android/launcher3/util/Z$c;)[I

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/4 p1, 0x0

    .line 69
    aget p1, p0, p1

    .line 70
    .line 71
    aget p0, p0, v4

    .line 72
    .line 73
    invoke-static {v0, p1, p0}, Lcom/android/launcher3/F1;->n0(Ljava/util/List;II)Lcom/android/launcher3/F1$c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :goto_2
    if-eqz p0, :cond_3

    .line 79
    .line 80
    :try_start_3
    invoke-interface {p0}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :catchall_1
    move-exception p0

    .line 85
    :try_start_4
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_3
    throw p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0

    .line 89
    :catch_0
    move-exception p0

    .line 90
    new-instance p1, Ljava/lang/RuntimeException;

    .line 91
    .line 92
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    throw p1
.end method

.method private static x0(Landroid/content/Context;Ljava/lang/String;Lcom/android/launcher3/util/Z$c;ZZ)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/util/Z$c;",
            "ZZ)",
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$a;",
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
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const v2, 0x7f17000a

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 14
    .line 15
    .line 16
    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    :try_start_1
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    :cond_0
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->next()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/4 v4, 0x3

    .line 26
    if-ne v3, v4, :cond_1

    .line 27
    .line 28
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-le v5, v2, :cond_4

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto/16 :goto_4

    .line 37
    .line 38
    :cond_1
    :goto_0
    const/4 v5, 0x1

    .line 39
    if-eq v3, v5, :cond_4

    .line 40
    .line 41
    const/4 v6, 0x2

    .line 42
    if-ne v3, v6, :cond_0

    .line 43
    .line 44
    const-string v3, "grid-option"

    .line 45
    .line 46
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_0

    .line 55
    .line 56
    new-instance v3, Lcom/android/launcher3/F1$b;

    .line 57
    .line 58
    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    invoke-direct {v3, p0, v7, p2}, Lcom/android/launcher3/F1$b;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/android/launcher3/util/Z$c;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->m()I

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    invoke-static {v3, v7, p3, p4}, Lcom/android/launcher3/F1;->p0(Lcom/android/launcher3/F1$b;IZZ)Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-eqz v7, :cond_0

    .line 74
    .line 75
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    :cond_2
    :goto_1
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->next()I

    .line 80
    .line 81
    .line 82
    move-result v8

    .line 83
    if-ne v8, v4, :cond_3

    .line 84
    .line 85
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 86
    .line 87
    .line 88
    move-result v9

    .line 89
    if-le v9, v7, :cond_0

    .line 90
    .line 91
    :cond_3
    if-eq v8, v5, :cond_0

    .line 92
    .line 93
    if-ne v8, v6, :cond_2

    .line 94
    .line 95
    const-string v8, "display-option"

    .line 96
    .line 97
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v9

    .line 101
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v8

    .line 105
    if-eqz v8, :cond_2

    .line 106
    .line 107
    new-instance v8, Lcom/android/launcher3/F1$a;

    .line 108
    .line 109
    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    invoke-direct {v8, v3, p0, v9}, Lcom/android/launcher3/F1$a;-><init>(Lcom/android/launcher3/F1$b;Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    :try_start_2
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0

    .line 121
    .line 122
    .line 123
    new-instance p0, Ljava/util/ArrayList;

    .line 124
    .line 125
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p4

    .line 132
    if-nez p4, :cond_7

    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 135
    .line 136
    .line 137
    move-result-object p4

    .line 138
    :cond_5
    :goto_2
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-eqz v1, :cond_7

    .line 143
    .line 144
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Lcom/android/launcher3/F1$a;

    .line 149
    .line 150
    iget-object v2, v1, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 151
    .line 152
    iget-object v2, v2, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-eqz v2, :cond_5

    .line 159
    .line 160
    iget-object v2, v1, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 161
    .line 162
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->m()I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    invoke-virtual {v2, v3}, Lcom/android/launcher3/F1$b;->G(I)Z

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-nez v2, :cond_6

    .line 171
    .line 172
    if-eqz p3, :cond_5

    .line 173
    .line 174
    :cond_6
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_7
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-eqz p2, :cond_9

    .line 183
    .line 184
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-eqz p1, :cond_9

    .line 189
    .line 190
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    :cond_8
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-eqz p2, :cond_a

    .line 199
    .line 200
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    check-cast p2, Lcom/android/launcher3/F1$a;

    .line 205
    .line 206
    invoke-static {p2}, Lcom/android/launcher3/F1$a;->h(Lcom/android/launcher3/F1$a;)Z

    .line 207
    .line 208
    .line 209
    move-result p3

    .line 210
    if-eqz p3, :cond_8

    .line 211
    .line 212
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_9
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    if-eqz p1, :cond_a

    .line 221
    .line 222
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 223
    .line 224
    .line 225
    :cond_a
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-nez p1, :cond_b

    .line 230
    .line 231
    return-object p0

    .line 232
    :cond_b
    new-instance p0, Ljava/lang/RuntimeException;

    .line 233
    .line 234
    const-string p1, "No display option with canBeDefault=true"

    .line 235
    .line 236
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    throw p0

    .line 240
    :goto_4
    if-eqz v1, :cond_c

    .line 241
    .line 242
    :try_start_3
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 243
    .line 244
    .line 245
    goto :goto_5

    .line 246
    :catchall_1
    move-exception p1

    .line 247
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 248
    .line 249
    .line 250
    :cond_c
    :goto_5
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0

    .line 251
    :catch_0
    move-exception p0

    .line 252
    new-instance p1, Ljava/lang/RuntimeException;

    .line 253
    .line 254
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 255
    .line 256
    .line 257
    throw p1
.end method

.method private y0(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/F1;->C0:Lcom/android/launcher3/util/Z;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 8
    .line 9
    invoke-static {v1}, LE1/g;->m(Lcom/android/launcher3/J3;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 25
    .line 26
    sget-object v3, Lcom/android/launcher3/J3;->w:Lcom/android/launcher3/X;

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-static {p1, p2, v0, v1, v2}, Lcom/android/launcher3/F1;->x0(Landroid/content/Context;Ljava/lang/String;Lcom/android/launcher3/util/Z$c;ZZ)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Lz1/L0;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 45
    .line 46
    invoke-direct {v2, v3}, Lz1/L0;-><init>(Lcom/android/launcher3/J3;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Lz1/L0;->c()Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-direct {p0, v1, v2}, Lcom/android/launcher3/F1;->m0(Ljava/util/List;I)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_1

    .line 66
    .line 67
    new-instance v2, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    move-object v2, v1

    .line 79
    :goto_1
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z$c;->m()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/F1;->A0(Lcom/android/launcher3/util/Z$c;Ljava/util/List;I)Lcom/android/launcher3/F1$a;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v2, v1, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_2

    .line 96
    .line 97
    iget-object v2, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 98
    .line 99
    sget-object v3, Lcom/android/launcher3/J3;->u:Lcom/android/launcher3/X;

    .line 100
    .line 101
    iget-object v4, v1, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 102
    .line 103
    iget-object v4, v4, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v2, v3, v4}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/F1;->z0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/F1$a;)V

    .line 109
    .line 110
    .line 111
    new-instance p1, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v0, "After initGrid:gridName:"

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p2, ", dbFile:"

    .line 125
    .line 126
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Lcom/android/launcher3/F1;->E1:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p2, ", LauncherPrefs GRID_NAME:"

    .line 135
    .line 136
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-object p2, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 140
    .line 141
    sget-object v0, Lcom/android/launcher3/J3;->u:Lcom/android/launcher3/X;

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    check-cast p2, Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string p2, ", LauncherPrefs DB_FILE:"

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 158
    .line 159
    sget-object p2, Lcom/android/launcher3/J3;->m:Lcom/android/launcher3/X;

    .line 160
    .line 161
    invoke-virtual {p0, p2}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    check-cast p0, Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    const-string p1, "IDP"

    .line 175
    .line 176
    invoke-static {p1, p0}, Lcom/android/launcher3/logging/b;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    iget-object p0, v1, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 180
    .line 181
    iget-object p0, p0, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 182
    .line 183
    return-object p0
.end method

.method private z0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/F1$a;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->h0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/N5;->y(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 16
    .line 17
    sget-object v3, Lcom/android/launcher3/J3;->e:Lcom/android/launcher3/X;

    .line 18
    .line 19
    invoke-virtual {v0, v3}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    move v0, v2

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v0, v1

    .line 34
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/F1;->B1:Z

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/android/launcher3/F1;->A1:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v3, p3, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    if-eqz v4, :cond_1

    .line 71
    .line 72
    invoke-virtual {v4, p1}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    const/4 v4, 0x0

    .line 78
    :goto_1
    if-eqz v4, :cond_2

    .line 79
    .line 80
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 81
    .line 82
    iput v5, p0, Lcom/android/launcher3/F1;->G0:I

    .line 83
    .line 84
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 85
    .line 86
    iput v4, p0, Lcom/android/launcher3/F1;->H0:I

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_2
    iget v4, v3, Lcom/android/launcher3/F1$b;->d:I

    .line 90
    .line 91
    iput v4, p0, Lcom/android/launcher3/F1;->G0:I

    .line 92
    .line 93
    iget v4, v3, Lcom/android/launcher3/F1$b;->e:I

    .line 94
    .line 95
    iput v4, p0, Lcom/android/launcher3/F1;->H0:I

    .line 96
    .line 97
    :goto_2
    iget v4, v3, Lcom/android/launcher3/F1$b;->f:I

    .line 98
    .line 99
    iput v4, p0, Lcom/android/launcher3/F1;->I0:I

    .line 100
    .line 101
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->c(Lcom/android/launcher3/F1$b;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    iput-object v4, p0, Lcom/android/launcher3/F1;->E1:Ljava/lang/String;

    .line 106
    .line 107
    iget v4, v3, Lcom/android/launcher3/F1$b;->h:I

    .line 108
    .line 109
    iput v4, p0, Lcom/android/launcher3/F1;->D1:I

    .line 110
    .line 111
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->d(Lcom/android/launcher3/F1$b;)I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    iput v4, p0, Lcom/android/launcher3/F1;->F1:I

    .line 116
    .line 117
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->e(Lcom/android/launcher3/F1$b;)I

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    iput v4, p0, Lcom/android/launcher3/F1;->G1:I

    .line 122
    .line 123
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->D(Lcom/android/launcher3/F1$b;)[I

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    iput-object v4, p0, Lcom/android/launcher3/F1;->J0:[I

    .line 128
    .line 129
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->C(Lcom/android/launcher3/F1$b;)[I

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    iput-object v4, p0, Lcom/android/launcher3/F1;->K0:[I

    .line 134
    .line 135
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->g(Lcom/android/launcher3/F1$b;)I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    iput v4, p0, Lcom/android/launcher3/F1;->U0:I

    .line 140
    .line 141
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->b(Lcom/android/launcher3/F1$b;)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    iput v4, p0, Lcom/android/launcher3/F1;->V0:I

    .line 146
    .line 147
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->m()I

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    const/4 v5, 0x2

    .line 152
    if-ne v4, v5, :cond_3

    .line 153
    .line 154
    move v4, v1

    .line 155
    goto :goto_3

    .line 156
    :cond_3
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->j(Lcom/android/launcher3/F1$b;)Z

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    :goto_3
    iput-boolean v4, p0, Lcom/android/launcher3/F1;->l1:Z

    .line 161
    .line 162
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->f(Lcom/android/launcher3/F1$b;)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    iput v4, p0, Lcom/android/launcher3/F1;->m1:I

    .line 167
    .line 168
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->x(Lcom/android/launcher3/F1$b;)I

    .line 169
    .line 170
    .line 171
    move-result v4

    .line 172
    iput v4, p0, Lcom/android/launcher3/F1;->n1:I

    .line 173
    .line 174
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->q(Lcom/android/launcher3/F1$b;)I

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    iput v4, p0, Lcom/android/launcher3/F1;->o1:I

    .line 179
    .line 180
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->y(Lcom/android/launcher3/F1$b;)I

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    iput v4, p0, Lcom/android/launcher3/F1;->p1:I

    .line 185
    .line 186
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->m(Lcom/android/launcher3/F1$b;)I

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    iput v4, p0, Lcom/android/launcher3/F1;->q1:I

    .line 191
    .line 192
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->n(Lcom/android/launcher3/F1$b;)I

    .line 193
    .line 194
    .line 195
    move-result v4

    .line 196
    iput v4, p0, Lcom/android/launcher3/F1;->r1:I

    .line 197
    .line 198
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->o(Lcom/android/launcher3/F1$b;)I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    iput v4, p0, Lcom/android/launcher3/F1;->s1:I

    .line 203
    .line 204
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->p(Lcom/android/launcher3/F1$b;)I

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    iput v4, p0, Lcom/android/launcher3/F1;->t1:I

    .line 209
    .line 210
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->r(Lcom/android/launcher3/F1$b;)I

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    iput v4, p0, Lcom/android/launcher3/F1;->u1:I

    .line 215
    .line 216
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->s(Lcom/android/launcher3/F1$b;)I

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    iput v4, p0, Lcom/android/launcher3/F1;->v1:I

    .line 221
    .line 222
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->v(Lcom/android/launcher3/F1$b;)I

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    iput v4, p0, Lcom/android/launcher3/F1;->w1:I

    .line 227
    .line 228
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->w(Lcom/android/launcher3/F1$b;)I

    .line 229
    .line 230
    .line 231
    move-result v4

    .line 232
    iput v4, p0, Lcom/android/launcher3/F1;->x1:I

    .line 233
    .line 234
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->k(Lcom/android/launcher3/F1$b;)I

    .line 235
    .line 236
    .line 237
    move-result v4

    .line 238
    iput v4, p0, Lcom/android/launcher3/F1;->y1:I

    .line 239
    .line 240
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->l(Lcom/android/launcher3/F1$b;)I

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    iput v4, p0, Lcom/android/launcher3/F1;->z1:I

    .line 245
    .line 246
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->u(Lcom/android/launcher3/F1$b;)I

    .line 247
    .line 248
    .line 249
    move-result v4

    .line 250
    iput v4, p0, Lcom/android/launcher3/F1;->i1:I

    .line 251
    .line 252
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->m()I

    .line 253
    .line 254
    .line 255
    move-result v4

    .line 256
    iput v4, p0, Lcom/android/launcher3/F1;->P0:I

    .line 257
    .line 258
    iput-object p2, p0, Lcom/android/launcher3/F1;->Q0:Lcom/android/launcher3/util/Z$c;

    .line 259
    .line 260
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->h(Lcom/android/launcher3/F1$b;)I

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    iput v4, p0, Lcom/android/launcher3/F1;->T0:I

    .line 265
    .line 266
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->l(Lcom/android/launcher3/F1$a;)[F

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    iput-object v4, p0, Lcom/android/launcher3/F1;->L0:[F

    .line 271
    .line 272
    aget v4, v4, v1

    .line 273
    .line 274
    move v5, v2

    .line 275
    :goto_4
    iget-object v6, p0, Lcom/android/launcher3/F1;->L0:[F

    .line 276
    .line 277
    array-length v7, v6

    .line 278
    if-ge v5, v7, :cond_4

    .line 279
    .line 280
    aget v6, v6, v5

    .line 281
    .line 282
    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    .line 283
    .line 284
    .line 285
    move-result v4

    .line 286
    add-int/lit8 v5, v5, 0x1

    .line 287
    .line 288
    goto :goto_4

    .line 289
    :cond_4
    invoke-static {v4, v0}, Lc2/a;->e(FLandroid/util/DisplayMetrics;)I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    iput v0, p0, Lcom/android/launcher3/F1;->N0:I

    .line 294
    .line 295
    invoke-virtual {p0, v0}, Lcom/android/launcher3/F1;->w0(I)I

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    iput v0, p0, Lcom/android/launcher3/F1;->O0:I

    .line 300
    .line 301
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->q(Lcom/android/launcher3/F1$a;)[F

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    iput-object v0, p0, Lcom/android/launcher3/F1;->M0:[F

    .line 306
    .line 307
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->m(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    iput-object v0, p0, Lcom/android/launcher3/F1;->R0:[Landroid/graphics/PointF;

    .line 312
    .line 313
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->g(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    iput-object v0, p0, Lcom/android/launcher3/F1;->S0:[Landroid/graphics/PointF;

    .line 318
    .line 319
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->i(Lcom/android/launcher3/F1$a;)[F

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    iput-object v0, p0, Lcom/android/launcher3/F1;->W0:[F

    .line 324
    .line 325
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->E(Lcom/android/launcher3/F1$b;)I

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    iput v0, p0, Lcom/android/launcher3/F1;->d1:I

    .line 330
    .line 331
    iget v0, p0, Lcom/android/launcher3/F1;->P0:I

    .line 332
    .line 333
    if-ne v0, v2, :cond_5

    .line 334
    .line 335
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->B(Lcom/android/launcher3/F1$b;)I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    goto :goto_5

    .line 340
    :cond_5
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->E(Lcom/android/launcher3/F1$b;)I

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    :goto_5
    iput v0, p0, Lcom/android/launcher3/F1;->e1:I

    .line 345
    .line 346
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->j(Lcom/android/launcher3/F1$a;)[F

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    iput-object v0, p0, Lcom/android/launcher3/F1;->f1:[F

    .line 351
    .line 352
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->k(Lcom/android/launcher3/F1$a;)[F

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    iput-object v0, p0, Lcom/android/launcher3/F1;->g1:[F

    .line 357
    .line 358
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->a(Lcom/android/launcher3/F1$b;)I

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    iput v0, p0, Lcom/android/launcher3/F1;->k1:I

    .line 363
    .line 364
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->z(Lcom/android/launcher3/F1$b;)I

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    iput v0, p0, Lcom/android/launcher3/F1;->h1:I

    .line 369
    .line 370
    iget v0, p0, Lcom/android/launcher3/F1;->P0:I

    .line 371
    .line 372
    if-ne v0, v2, :cond_6

    .line 373
    .line 374
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->A(Lcom/android/launcher3/F1$b;)I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    goto :goto_6

    .line 379
    :cond_6
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->z(Lcom/android/launcher3/F1$b;)I

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    :goto_6
    iput v0, p0, Lcom/android/launcher3/F1;->j1:I

    .line 384
    .line 385
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->d(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    iput-object v0, p0, Lcom/android/launcher3/F1;->X0:[Landroid/graphics/PointF;

    .line 390
    .line 391
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->c(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    iput-object v0, p0, Lcom/android/launcher3/F1;->a1:[Landroid/graphics/PointF;

    .line 396
    .line 397
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->e(Lcom/android/launcher3/F1$a;)[F

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    iput-object v0, p0, Lcom/android/launcher3/F1;->Y0:[F

    .line 402
    .line 403
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->f(Lcom/android/launcher3/F1$a;)[F

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    iput-object v0, p0, Lcom/android/launcher3/F1;->Z0:[F

    .line 408
    .line 409
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->i(Lcom/android/launcher3/F1$b;)[Z

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    iput-object v0, p0, Lcom/android/launcher3/F1;->H1:[Z

    .line 414
    .line 415
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->r(Lcom/android/launcher3/F1$a;)[F

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    iput-object v0, p0, Lcom/android/launcher3/F1;->b1:[F

    .line 420
    .line 421
    invoke-static {p3}, Lcom/android/launcher3/F1$a;->p(Lcom/android/launcher3/F1$a;)[Z

    .line 422
    .line 423
    .line 424
    move-result-object p3

    .line 425
    iput-object p3, p0, Lcom/android/launcher3/F1;->c1:[Z

    .line 426
    .line 427
    invoke-static {v3}, Lcom/android/launcher3/F1$b;->t(Lcom/android/launcher3/F1$b;)Z

    .line 428
    .line 429
    .line 430
    move-result p3

    .line 431
    iput-boolean p3, p0, Lcom/android/launcher3/F1;->C1:Z

    .line 432
    .line 433
    new-instance p3, Ljava/util/ArrayList;

    .line 434
    .line 435
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 436
    .line 437
    .line 438
    new-instance v0, Landroid/graphics/Point;

    .line 439
    .line 440
    iget-object v3, p2, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 441
    .line 442
    invoke-direct {v0, v3}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    .line 443
    .line 444
    .line 445
    iput-object v0, p0, Lcom/android/launcher3/F1;->J1:Landroid/graphics/Point;

    .line 446
    .line 447
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    invoke-super {p0, p0, p1, v0}, Lcom/android/launcher3/r4;->t(Lcom/android/launcher3/F1;Landroid/content/Context;Landroid/util/DisplayMetrics;)V

    .line 456
    .line 457
    .line 458
    new-instance v0, Landroid/util/SparseArray;

    .line 459
    .line 460
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 461
    .line 462
    .line 463
    iget-object v3, p2, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 464
    .line 465
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 466
    .line 467
    .line 468
    move-result-object v3

    .line 469
    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 470
    .line 471
    .line 472
    move-result v4

    .line 473
    if-eqz v4, :cond_9

    .line 474
    .line 475
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    check-cast v4, Lcom/android/launcher3/util/p3;

    .line 480
    .line 481
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/F1;->J0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/h0$a;

    .line 482
    .line 483
    .line 484
    move-result-object v5

    .line 485
    iget v6, p0, Lcom/android/launcher3/F1;->P0:I

    .line 486
    .line 487
    if-ne v6, v2, :cond_7

    .line 488
    .line 489
    move v6, v2

    .line 490
    goto :goto_8

    .line 491
    :cond_7
    move v6, v1

    .line 492
    :goto_8
    invoke-virtual {v5, v6}, Lcom/android/launcher3/h0$a;->d(Z)Lcom/android/launcher3/h0$a;

    .line 493
    .line 494
    .line 495
    move-result-object v5

    .line 496
    invoke-virtual {v5, v4}, Lcom/android/launcher3/h0$a;->i(Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0$a;

    .line 497
    .line 498
    .line 499
    move-result-object v5

    .line 500
    invoke-virtual {v5, v0}, Lcom/android/launcher3/h0$a;->b(Landroid/util/SparseArray;)Lcom/android/launcher3/h0$a;

    .line 501
    .line 502
    .line 503
    move-result-object v5

    .line 504
    invoke-virtual {v5}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 505
    .line 506
    .line 507
    move-result-object v5

    .line 508
    invoke-interface {p3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 509
    .line 510
    .line 511
    iget-object v5, v4, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 512
    .line 513
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 514
    .line 515
    .line 516
    move-result v5

    .line 517
    iget-object v4, v4, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 518
    .line 519
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 520
    .line 521
    .line 522
    move-result v4

    .line 523
    iget-object v6, p0, Lcom/android/launcher3/F1;->J1:Landroid/graphics/Point;

    .line 524
    .line 525
    iget v7, v6, Landroid/graphics/Point;->y:I

    .line 526
    .line 527
    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    .line 528
    .line 529
    .line 530
    move-result v7

    .line 531
    iput v7, v6, Landroid/graphics/Point;->y:I

    .line 532
    .line 533
    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    .line 534
    .line 535
    .line 536
    move-result v6

    .line 537
    int-to-float v6, v6

    .line 538
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->l()I

    .line 539
    .line 540
    .line 541
    move-result v7

    .line 542
    invoke-static {v6, v7}, Lcom/android/launcher3/N5;->j(FI)F

    .line 543
    .line 544
    .line 545
    move-result v6

    .line 546
    const/high16 v7, 0x44340000    # 720.0f

    .line 547
    .line 548
    cmpg-float v6, v6, v7

    .line 549
    .line 550
    if-gez v6, :cond_8

    .line 551
    .line 552
    const/high16 v4, 0x40000000    # 2.0f

    .line 553
    .line 554
    goto :goto_9

    .line 555
    :cond_8
    invoke-static {v5, v4}, Lcom/android/launcher3/F1;->S0(II)F

    .line 556
    .line 557
    .line 558
    move-result v4

    .line 559
    :goto_9
    iget-object v6, p0, Lcom/android/launcher3/F1;->J1:Landroid/graphics/Point;

    .line 560
    .line 561
    iget v7, v6, Landroid/graphics/Point;->x:I

    .line 562
    .line 563
    int-to-float v5, v5

    .line 564
    mul-float/2addr v4, v5

    .line 565
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 566
    .line 567
    .line 568
    move-result v4

    .line 569
    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    .line 570
    .line 571
    .line 572
    move-result v4

    .line 573
    iput v4, v6, Landroid/graphics/Point;->x:I

    .line 574
    .line 575
    goto :goto_7

    .line 576
    :cond_9
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 577
    .line 578
    .line 579
    move-result-object p1

    .line 580
    iput-object p1, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 581
    .line 582
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 583
    .line 584
    .line 585
    move-result-object p1

    .line 586
    new-instance p2, Lcom/android/launcher3/z1;

    .line 587
    .line 588
    invoke-direct {p2}, Lcom/android/launcher3/z1;-><init>()V

    .line 589
    .line 590
    .line 591
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 592
    .line 593
    .line 594
    move-result-object p1

    .line 595
    new-instance p2, Lcom/android/launcher3/A1;

    .line 596
    .line 597
    invoke-direct {p2}, Lcom/android/launcher3/A1;-><init>()V

    .line 598
    .line 599
    .line 600
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 601
    .line 602
    .line 603
    move-result-object p1

    .line 604
    invoke-interface {p1}, Ljava/util/stream/IntStream;->min()Ljava/util/OptionalInt;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    invoke-virtual {p1, v1}, Ljava/util/OptionalInt;->orElse(I)I

    .line 609
    .line 610
    .line 611
    move-result p1

    .line 612
    iget-object p0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 613
    .line 614
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 615
    .line 616
    .line 617
    move-result-object p0

    .line 618
    new-instance p2, Lcom/android/launcher3/B1;

    .line 619
    .line 620
    invoke-direct {p2}, Lcom/android/launcher3/B1;-><init>()V

    .line 621
    .line 622
    .line 623
    invoke-interface {p0, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 624
    .line 625
    .line 626
    move-result-object p0

    .line 627
    new-instance p2, Lcom/android/launcher3/C1;

    .line 628
    .line 629
    invoke-direct {p2, p1}, Lcom/android/launcher3/C1;-><init>(I)V

    .line 630
    .line 631
    .line 632
    invoke-interface {p0, p2}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 633
    .line 634
    .line 635
    return-void
.end method


# virtual methods
.method public B0(I)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/F1;->r0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ne p1, p0, :cond_0

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

.method J0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/h0$a;
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/h0$a;

    .line 2
    .line 3
    iget-object v4, p0, Lcom/android/launcher3/F1;->D0:Lcom/android/launcher3/util/window/d;

    .line 4
    .line 5
    iget-object v5, p0, Lcom/android/launcher3/F1;->F0:Ln1/C;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v3, p2

    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/h0$a;-><init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/window/d;Ln1/C;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public K0(Landroid/content/Context;)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/F1;->L0(Landroid/content/Context;ZZZZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public N0(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/F1$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/F1;->Q0:Lcom/android/launcher3/util/Z$c;

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/android/launcher3/F1;->M0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Lcom/android/launcher3/n1;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/n1;-><init>(Lcom/android/launcher3/F1;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Lcom/android/launcher3/o1;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lcom/android/launcher3/o1;-><init>(Lcom/android/launcher3/F1;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/util/List;

    .line 38
    .line 39
    return-object p0
.end method

.method public O0(Lcom/android/launcher3/F1$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1;->K1:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P0(Landroid/content/Context;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/J3;->u:Lcom/android/launcher3/X;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/F1;->y0(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Q0(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/F1;->E0:Lcom/android/launcher3/J3;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/J3;->u:Lcom/android/launcher3/X;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/y1;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/y1;-><init>(Lcom/android/launcher3/F1;Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public j0(Lcom/android/launcher3/F1$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1;->K1:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k0(Landroid/content/Context;)Lcom/android/launcher3/h0;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/util/Z$c;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/util/Z$c;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/F1;->J0(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/h0$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/h0$a;->d(Z)Lcom/android/launcher3/h0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v2}, Lcom/android/launcher3/h0$a;->f(Z)Lcom/android/launcher3/h0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Lcom/android/launcher3/F1;->D0:Lcom/android/launcher3/util/window/d;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/window/d;->getDisplayInfo(Landroid/content/Context;)Lcom/android/launcher3/util/window/a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p0, p1, v2}, Lcom/android/launcher3/util/window/d;->getRealBounds(Landroid/content/Context;Lcom/android/launcher3/util/window/a;)Lcom/android/launcher3/util/p3;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lcom/android/launcher3/h0$a;->i(Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v1}, Lcom/android/launcher3/h0$a;->g(Z)Lcom/android/launcher3/h0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/h0$a;->a()Lcom/android/launcher3/h0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public q0(Landroid/content/Context;ZZZZZ)V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "forceChangeConfig: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " , "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "IDP"

    .line 45
    .line 46
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 50
    .line 51
    new-instance v1, Lcom/android/launcher3/w1;

    .line 52
    .line 53
    move-object v2, p0

    .line 54
    move-object v3, p1

    .line 55
    move v4, p2

    .line 56
    move v5, p3

    .line 57
    move v6, p4

    .line 58
    move v7, p5

    .line 59
    move v8, p6

    .line 60
    invoke-direct/range {v1 .. v8}, Lcom/android/launcher3/w1;-><init>(Lcom/android/launcher3/F1;Landroid/content/Context;ZZZZZ)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public r0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1;->d1:I

    .line 2
    .line 3
    div-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    return p0
.end method

.method public s0(FFI)Lcom/android/launcher3/h0;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/h0;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/android/launcher3/h0;

    .line 30
    .line 31
    iget v3, v2, Lcom/android/launcher3/h0;->T0:I

    .line 32
    .line 33
    int-to-float v3, v3

    .line 34
    sub-float/2addr v3, p1

    .line 35
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iget v4, v2, Lcom/android/launcher3/h0;->U0:I

    .line 40
    .line 41
    int-to-float v4, v4

    .line 42
    sub-float/2addr v4, p2

    .line 43
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    add-float/2addr v3, v4

    .line 48
    cmpg-float v4, v3, v1

    .line 49
    .line 50
    if-gez v4, :cond_1

    .line 51
    .line 52
    move-object v0, v2

    .line 53
    move v1, v3

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    cmpl-float v3, v3, v1

    .line 56
    .line 57
    if-nez v3, :cond_0

    .line 58
    .line 59
    iget v3, v2, Lcom/android/launcher3/h0;->X0:I

    .line 60
    .line 61
    if-ne v3, p3, :cond_0

    .line 62
    .line 63
    move-object v0, v2

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    return-object v0
.end method

.method public t0(Landroid/content/Context;)Lcom/android/launcher3/h0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/F1;->D0:Lcom/android/launcher3/util/window/d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/window/d;->getCurrentBounds(Landroid/content/Context;)Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/F1;->D0:Lcom/android/launcher3/util/window/d;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-float v0, v0

    .line 23
    invoke-virtual {p0, v1, v0, p1}, Lcom/android/launcher3/F1;->s0(FFI)Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public u0(Landroid/content/Context;Ljava/lang/String;)Lcom/android/launcher3/F1$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/F1;->N0(Landroid/content/Context;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Lcom/android/launcher3/E1;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Lcom/android/launcher3/E1;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/android/launcher3/F1$b;

    .line 28
    .line 29
    return-object p0
.end method

.method w0(I)I
    .locals 5

    .line 1
    const/16 p0, 0x280

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    new-array v0, v0, [I

    .line 5
    .line 6
    fill-array-data v0, :array_0

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x6

    .line 10
    :goto_0
    if-ltz v1, :cond_1

    .line 11
    .line 12
    aget v2, v0, v1

    .line 13
    .line 14
    int-to-float v3, v2

    .line 15
    const/high16 v4, 0x42400000    # 48.0f

    .line 16
    .line 17
    mul-float/2addr v3, v4

    .line 18
    const/high16 v4, 0x43200000    # 160.0f

    .line 19
    .line 20
    div-float/2addr v3, v4

    .line 21
    int-to-float v4, p1

    .line 22
    cmpl-float v3, v3, v4

    .line 23
    .line 24
    if-ltz v3, :cond_0

    .line 25
    .line 26
    move p0, v2

    .line 27
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return p0

    .line 31
    :array_0
    .array-data 4
        0x78
        0xa0
        0xd5
        0xf0
        0x140
        0x1e0
        0x280
    .end array-data
.end method
