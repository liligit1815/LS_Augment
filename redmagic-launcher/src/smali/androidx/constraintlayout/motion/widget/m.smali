.class public Landroidx/constraintlayout/motion/widget/m;
.super Ljava/lang/Object;
.source "MotionController.java"


# instance fields
.field private A:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/d;",
            ">;"
        }
    .end annotation
.end field

.field private B:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lv/d;",
            ">;"
        }
    .end annotation
.end field

.field private C:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lv/c;",
            ">;"
        }
    .end annotation
.end field

.field private D:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lv/b;",
            ">;"
        }
    .end annotation
.end field

.field private E:[Landroidx/constraintlayout/motion/widget/k;

.field private F:I

.field private G:I

.field private H:Landroid/view/View;

.field private I:I

.field private J:F

.field private K:Landroid/view/animation/Interpolator;

.field private L:Z

.field a:Landroid/graphics/Rect;

.field b:Landroid/view/View;

.field c:I

.field d:Z

.field e:Ljava/lang/String;

.field private f:I

.field private g:Landroidx/constraintlayout/motion/widget/q;

.field private h:Landroidx/constraintlayout/motion/widget/q;

.field private i:Landroidx/constraintlayout/motion/widget/l;

.field private j:Landroidx/constraintlayout/motion/widget/l;

.field private k:[Lr/b;

.field private l:Lr/b;

.field m:F

.field n:F

.field o:F

.field p:F

.field q:F

.field private r:[I

.field private s:[D

.field private t:[D

.field private u:[Ljava/lang/String;

.field private v:[I

.field private w:I

.field private x:[F

.field private y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/q;",
            ">;"
        }
    .end annotation
.end field

.field private z:[F


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->a:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/m;->d:Z

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    iput v1, p0, Landroidx/constraintlayout/motion/widget/m;->f:I

    .line 16
    .line 17
    new-instance v1, Landroidx/constraintlayout/motion/widget/q;

    .line 18
    .line 19
    invoke-direct {v1}, Landroidx/constraintlayout/motion/widget/q;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 23
    .line 24
    new-instance v1, Landroidx/constraintlayout/motion/widget/q;

    .line 25
    .line 26
    invoke-direct {v1}, Landroidx/constraintlayout/motion/widget/q;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 30
    .line 31
    new-instance v1, Landroidx/constraintlayout/motion/widget/l;

    .line 32
    .line 33
    invoke-direct {v1}, Landroidx/constraintlayout/motion/widget/l;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->i:Landroidx/constraintlayout/motion/widget/l;

    .line 37
    .line 38
    new-instance v1, Landroidx/constraintlayout/motion/widget/l;

    .line 39
    .line 40
    invoke-direct {v1}, Landroidx/constraintlayout/motion/widget/l;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->j:Landroidx/constraintlayout/motion/widget/l;

    .line 44
    .line 45
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 46
    .line 47
    iput v1, p0, Landroidx/constraintlayout/motion/widget/m;->m:F

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    iput v2, p0, Landroidx/constraintlayout/motion/widget/m;->n:F

    .line 51
    .line 52
    const/high16 v2, 0x3f800000    # 1.0f

    .line 53
    .line 54
    iput v2, p0, Landroidx/constraintlayout/motion/widget/m;->o:F

    .line 55
    .line 56
    const/4 v2, 0x4

    .line 57
    iput v2, p0, Landroidx/constraintlayout/motion/widget/m;->w:I

    .line 58
    .line 59
    new-array v2, v2, [F

    .line 60
    .line 61
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->x:[F

    .line 62
    .line 63
    new-instance v2, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 69
    .line 70
    const/4 v2, 0x1

    .line 71
    new-array v2, v2, [F

    .line 72
    .line 73
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->z:[F

    .line 74
    .line 75
    new-instance v2, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 81
    .line 82
    sget v2, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 83
    .line 84
    iput v2, p0, Landroidx/constraintlayout/motion/widget/m;->F:I

    .line 85
    .line 86
    iput v2, p0, Landroidx/constraintlayout/motion/widget/m;->G:I

    .line 87
    .line 88
    const/4 v3, 0x0

    .line 89
    iput-object v3, p0, Landroidx/constraintlayout/motion/widget/m;->H:Landroid/view/View;

    .line 90
    .line 91
    iput v2, p0, Landroidx/constraintlayout/motion/widget/m;->I:I

    .line 92
    .line 93
    iput v1, p0, Landroidx/constraintlayout/motion/widget/m;->J:F

    .line 94
    .line 95
    iput-object v3, p0, Landroidx/constraintlayout/motion/widget/m;->K:Landroid/view/animation/Interpolator;

    .line 96
    .line 97
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/m;->L:Z

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/m;->t(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private f(F[F)F
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    const/high16 v2, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    aput v2, p2, v1

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v3, p0, Landroidx/constraintlayout/motion/widget/m;->o:F

    .line 11
    .line 12
    float-to-double v4, v3

    .line 13
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 14
    .line 15
    cmpl-double v4, v4, v6

    .line 16
    .line 17
    if-eqz v4, :cond_2

    .line 18
    .line 19
    iget v4, p0, Landroidx/constraintlayout/motion/widget/m;->n:F

    .line 20
    .line 21
    cmpg-float v5, p1, v4

    .line 22
    .line 23
    if-gez v5, :cond_1

    .line 24
    .line 25
    move p1, v0

    .line 26
    :cond_1
    cmpl-float v5, p1, v4

    .line 27
    .line 28
    if-lez v5, :cond_2

    .line 29
    .line 30
    float-to-double v8, p1

    .line 31
    cmpg-double v5, v8, v6

    .line 32
    .line 33
    if-gez v5, :cond_2

    .line 34
    .line 35
    sub-float/2addr p1, v4

    .line 36
    mul-float/2addr p1, v3

    .line 37
    invoke-static {p1, v2}, Ljava/lang/Math;->min(FF)F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    :cond_2
    :goto_0
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 42
    .line 43
    iget-object v3, v3, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 44
    .line 45
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/high16 v4, 0x7fc00000    # Float.NaN

    .line 52
    .line 53
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-eqz v5, :cond_5

    .line 58
    .line 59
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    check-cast v5, Landroidx/constraintlayout/motion/widget/q;

    .line 64
    .line 65
    iget-object v6, v5, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 66
    .line 67
    if-eqz v6, :cond_3

    .line 68
    .line 69
    iget v7, v5, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 70
    .line 71
    cmpg-float v8, v7, p1

    .line 72
    .line 73
    if-gez v8, :cond_4

    .line 74
    .line 75
    move-object v3, v6

    .line 76
    move v0, v7

    .line 77
    goto :goto_1

    .line 78
    :cond_4
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_3

    .line 83
    .line 84
    iget v4, v5, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_5
    if-eqz v3, :cond_8

    .line 88
    .line 89
    invoke-static {v4}, Ljava/lang/Float;->isNaN(F)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_6
    move v2, v4

    .line 97
    :goto_2
    sub-float/2addr p1, v0

    .line 98
    sub-float/2addr v2, v0

    .line 99
    div-float/2addr p1, v2

    .line 100
    float-to-double p0, p1

    .line 101
    invoke-virtual {v3, p0, p1}, Lr/c;->a(D)D

    .line 102
    .line 103
    .line 104
    move-result-wide v4

    .line 105
    double-to-float v4, v4

    .line 106
    mul-float/2addr v4, v2

    .line 107
    add-float/2addr v4, v0

    .line 108
    if-eqz p2, :cond_7

    .line 109
    .line 110
    invoke-virtual {v3, p0, p1}, Lr/c;->b(D)D

    .line 111
    .line 112
    .line 113
    move-result-wide p0

    .line 114
    double-to-float p0, p0

    .line 115
    aput p0, p2, v1

    .line 116
    .line 117
    :cond_7
    return v4

    .line 118
    :cond_8
    return p1
.end method

.method private n()F
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v7, v1, [F

    .line 5
    .line 6
    const/16 v1, 0x63

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    const/high16 v9, 0x3f800000    # 1.0f

    .line 10
    .line 11
    div-float v1, v9, v1

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    move-wide v12, v2

    .line 16
    move-wide v14, v12

    .line 17
    const/4 v2, 0x0

    .line 18
    const/16 v16, 0x0

    .line 19
    .line 20
    :goto_0
    const/16 v3, 0x64

    .line 21
    .line 22
    if-ge v2, v3, :cond_6

    .line 23
    .line 24
    int-to-float v3, v2

    .line 25
    mul-float/2addr v3, v1

    .line 26
    float-to-double v4, v3

    .line 27
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 28
    .line 29
    iget-object v6, v6, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 30
    .line 31
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    const/high16 v17, 0x7fc00000    # Float.NaN

    .line 38
    .line 39
    const/16 v18, 0x0

    .line 40
    .line 41
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v19

    .line 45
    if-eqz v19, :cond_2

    .line 46
    .line 47
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v19

    .line 51
    move-object/from16 v9, v19

    .line 52
    .line 53
    check-cast v9, Landroidx/constraintlayout/motion/widget/q;

    .line 54
    .line 55
    iget-object v10, v9, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 56
    .line 57
    const/16 v20, 0x0

    .line 58
    .line 59
    if-eqz v10, :cond_1

    .line 60
    .line 61
    iget v11, v9, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 62
    .line 63
    cmpg-float v21, v11, v3

    .line 64
    .line 65
    if-gez v21, :cond_0

    .line 66
    .line 67
    move-object v6, v10

    .line 68
    move/from16 v18, v11

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_0
    invoke-static/range {v17 .. v17}, Ljava/lang/Float;->isNaN(F)Z

    .line 72
    .line 73
    .line 74
    move-result v10

    .line 75
    if-eqz v10, :cond_1

    .line 76
    .line 77
    iget v9, v9, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 78
    .line 79
    move/from16 v17, v9

    .line 80
    .line 81
    :cond_1
    :goto_2
    const/high16 v9, 0x3f800000    # 1.0f

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    const/16 v20, 0x0

    .line 85
    .line 86
    if-eqz v6, :cond_4

    .line 87
    .line 88
    invoke-static/range {v17 .. v17}, Ljava/lang/Float;->isNaN(F)Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-eqz v4, :cond_3

    .line 93
    .line 94
    const/high16 v17, 0x3f800000    # 1.0f

    .line 95
    .line 96
    :cond_3
    sub-float v3, v3, v18

    .line 97
    .line 98
    sub-float v17, v17, v18

    .line 99
    .line 100
    div-float v3, v3, v17

    .line 101
    .line 102
    float-to-double v3, v3

    .line 103
    invoke-virtual {v6, v3, v4}, Lr/c;->a(D)D

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    double-to-float v3, v3

    .line 108
    mul-float v3, v3, v17

    .line 109
    .line 110
    add-float v3, v3, v18

    .line 111
    .line 112
    float-to-double v4, v3

    .line 113
    :cond_4
    move-wide v3, v4

    .line 114
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 115
    .line 116
    aget-object v5, v5, v20

    .line 117
    .line 118
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 119
    .line 120
    invoke-virtual {v5, v3, v4, v6}, Lr/b;->d(D[D)V

    .line 121
    .line 122
    .line 123
    move v11, v2

    .line 124
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 125
    .line 126
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 127
    .line 128
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 129
    .line 130
    const/4 v8, 0x0

    .line 131
    invoke-virtual/range {v2 .. v8}, Landroidx/constraintlayout/motion/widget/q;->f(D[I[D[FI)V

    .line 132
    .line 133
    .line 134
    const/4 v2, 0x1

    .line 135
    if-lez v11, :cond_5

    .line 136
    .line 137
    aget v3, v7, v2

    .line 138
    .line 139
    float-to-double v3, v3

    .line 140
    sub-double/2addr v14, v3

    .line 141
    aget v3, v7, v20

    .line 142
    .line 143
    float-to-double v3, v3

    .line 144
    sub-double/2addr v12, v3

    .line 145
    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->hypot(DD)D

    .line 146
    .line 147
    .line 148
    move-result-wide v3

    .line 149
    double-to-float v3, v3

    .line 150
    add-float v16, v16, v3

    .line 151
    .line 152
    :cond_5
    aget v3, v7, v20

    .line 153
    .line 154
    float-to-double v12, v3

    .line 155
    aget v2, v7, v2

    .line 156
    .line 157
    float-to-double v14, v2

    .line 158
    add-int/lit8 v2, v11, 0x1

    .line 159
    .line 160
    const/high16 v9, 0x3f800000    # 1.0f

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_6
    return v16
.end method

.method private p(Landroidx/constraintlayout/motion/widget/q;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, " KeyPath position \""

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget v2, p1, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, "\" outside of range"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "MotionController"

    .line 34
    .line 35
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 39
    .line 40
    neg-int v0, v0

    .line 41
    add-int/lit8 v0, v0, -0x1

    .line 42
    .line 43
    invoke-virtual {p0, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method a(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method b([F[I)I
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 5
    .line 6
    aget-object v1, v1, v0

    .line 7
    .line 8
    invoke-virtual {v1}, Lr/b;->g()[D

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    move v3, v0

    .line 21
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Landroidx/constraintlayout/motion/widget/q;

    .line 32
    .line 33
    add-int/lit8 v5, v3, 0x1

    .line 34
    .line 35
    iget v4, v4, Landroidx/constraintlayout/motion/widget/q;->v:I

    .line 36
    .line 37
    aput v4, p2, v3

    .line 38
    .line 39
    move v3, v5

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move p2, v0

    .line 42
    move v8, p2

    .line 43
    :goto_1
    array-length v2, v1

    .line 44
    if-ge p2, v2, :cond_1

    .line 45
    .line 46
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 47
    .line 48
    aget-object v2, v2, v0

    .line 49
    .line 50
    aget-wide v3, v1, p2

    .line 51
    .line 52
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 53
    .line 54
    invoke-virtual {v2, v3, v4, v5}, Lr/b;->d(D[D)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 58
    .line 59
    aget-wide v3, v1, p2

    .line 60
    .line 61
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 62
    .line 63
    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 64
    .line 65
    move-object v7, p1

    .line 66
    invoke-virtual/range {v2 .. v8}, Landroidx/constraintlayout/motion/widget/q;->f(D[I[D[FI)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 v8, v8, 0x2

    .line 70
    .line 71
    add-int/lit8 p2, p2, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    div-int/lit8 v8, v8, 0x2

    .line 75
    .line 76
    return v8

    .line 77
    :cond_2
    return v0
.end method

.method c([FI)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    add-int/lit8 v2, v1, -0x1

    .line 6
    .line 7
    int-to-float v2, v2

    .line 8
    const/high16 v3, 0x3f800000    # 1.0f

    .line 9
    .line 10
    div-float v2, v3, v2

    .line 11
    .line 12
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 13
    .line 14
    const-string v5, "translationX"

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    move-object v4, v6

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    check-cast v4, Lr/j;

    .line 26
    .line 27
    :goto_0
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 28
    .line 29
    const-string v8, "translationY"

    .line 30
    .line 31
    if-nez v7, :cond_1

    .line 32
    .line 33
    move-object v7, v6

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    check-cast v7, Lr/j;

    .line 40
    .line 41
    :goto_1
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/m;->D:Ljava/util/HashMap;

    .line 42
    .line 43
    if-nez v9, :cond_2

    .line 44
    .line 45
    move-object v5, v6

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    invoke-virtual {v9, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    check-cast v5, Lv/b;

    .line 52
    .line 53
    :goto_2
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/m;->D:Ljava/util/HashMap;

    .line 54
    .line 55
    if-nez v9, :cond_3

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_3
    invoke-virtual {v9, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    check-cast v6, Lv/b;

    .line 63
    .line 64
    :goto_3
    const/4 v9, 0x0

    .line 65
    :goto_4
    if-ge v9, v1, :cond_10

    .line 66
    .line 67
    int-to-float v10, v9

    .line 68
    mul-float/2addr v10, v2

    .line 69
    iget v11, v0, Landroidx/constraintlayout/motion/widget/m;->o:F

    .line 70
    .line 71
    cmpl-float v12, v11, v3

    .line 72
    .line 73
    const/4 v13, 0x0

    .line 74
    if-eqz v12, :cond_5

    .line 75
    .line 76
    iget v12, v0, Landroidx/constraintlayout/motion/widget/m;->n:F

    .line 77
    .line 78
    cmpg-float v14, v10, v12

    .line 79
    .line 80
    if-gez v14, :cond_4

    .line 81
    .line 82
    move v10, v13

    .line 83
    :cond_4
    cmpl-float v14, v10, v12

    .line 84
    .line 85
    if-lez v14, :cond_5

    .line 86
    .line 87
    float-to-double v14, v10

    .line 88
    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    .line 89
    .line 90
    cmpg-double v14, v14, v16

    .line 91
    .line 92
    if-gez v14, :cond_5

    .line 93
    .line 94
    sub-float/2addr v10, v12

    .line 95
    mul-float/2addr v10, v11

    .line 96
    invoke-static {v10, v3}, Ljava/lang/Math;->min(FF)F

    .line 97
    .line 98
    .line 99
    move-result v10

    .line 100
    :cond_5
    float-to-double v11, v10

    .line 101
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 102
    .line 103
    iget-object v14, v14, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 104
    .line 105
    iget-object v15, v0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 108
    .line 109
    .line 110
    move-result-object v15

    .line 111
    const/high16 v16, 0x7fc00000    # Float.NaN

    .line 112
    .line 113
    :goto_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v17

    .line 117
    if-eqz v17, :cond_8

    .line 118
    .line 119
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v17

    .line 123
    move-object/from16 v3, v17

    .line 124
    .line 125
    check-cast v3, Landroidx/constraintlayout/motion/widget/q;

    .line 126
    .line 127
    const/16 v17, 0x0

    .line 128
    .line 129
    iget-object v8, v3, Landroidx/constraintlayout/motion/widget/q;->g:Lr/c;

    .line 130
    .line 131
    if-eqz v8, :cond_7

    .line 132
    .line 133
    iget v1, v3, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 134
    .line 135
    cmpg-float v18, v1, v10

    .line 136
    .line 137
    if-gez v18, :cond_6

    .line 138
    .line 139
    move v13, v1

    .line 140
    move-object v14, v8

    .line 141
    goto :goto_6

    .line 142
    :cond_6
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eqz v1, :cond_7

    .line 147
    .line 148
    iget v1, v3, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 149
    .line 150
    move/from16 v16, v1

    .line 151
    .line 152
    :cond_7
    :goto_6
    move/from16 v1, p2

    .line 153
    .line 154
    const/high16 v3, 0x3f800000    # 1.0f

    .line 155
    .line 156
    goto :goto_5

    .line 157
    :cond_8
    const/16 v17, 0x0

    .line 158
    .line 159
    if-eqz v14, :cond_a

    .line 160
    .line 161
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->isNaN(F)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_9

    .line 166
    .line 167
    const/high16 v16, 0x3f800000    # 1.0f

    .line 168
    .line 169
    :cond_9
    sub-float v1, v10, v13

    .line 170
    .line 171
    sub-float v16, v16, v13

    .line 172
    .line 173
    div-float v1, v1, v16

    .line 174
    .line 175
    float-to-double v11, v1

    .line 176
    invoke-virtual {v14, v11, v12}, Lr/c;->a(D)D

    .line 177
    .line 178
    .line 179
    move-result-wide v11

    .line 180
    double-to-float v1, v11

    .line 181
    mul-float v1, v1, v16

    .line 182
    .line 183
    add-float/2addr v1, v13

    .line 184
    float-to-double v11, v1

    .line 185
    :cond_a
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 186
    .line 187
    aget-object v1, v1, v17

    .line 188
    .line 189
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 190
    .line 191
    invoke-virtual {v1, v11, v12, v3}, Lr/b;->d(D[D)V

    .line 192
    .line 193
    .line 194
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->l:Lr/b;

    .line 195
    .line 196
    if-eqz v1, :cond_b

    .line 197
    .line 198
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 199
    .line 200
    array-length v8, v3

    .line 201
    if-lez v8, :cond_b

    .line 202
    .line 203
    invoke-virtual {v1, v11, v12, v3}, Lr/b;->d(D[D)V

    .line 204
    .line 205
    .line 206
    :cond_b
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 207
    .line 208
    iget-object v3, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 209
    .line 210
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 211
    .line 212
    mul-int/lit8 v24, v9, 0x2

    .line 213
    .line 214
    move-object/from16 v23, p1

    .line 215
    .line 216
    move-object/from16 v18, v1

    .line 217
    .line 218
    move-object/from16 v21, v3

    .line 219
    .line 220
    move-object/from16 v22, v8

    .line 221
    .line 222
    move-wide/from16 v19, v11

    .line 223
    .line 224
    invoke-virtual/range {v18 .. v24}, Landroidx/constraintlayout/motion/widget/q;->f(D[I[D[FI)V

    .line 225
    .line 226
    .line 227
    if-eqz v5, :cond_c

    .line 228
    .line 229
    aget v1, p1, v24

    .line 230
    .line 231
    invoke-virtual {v5, v10}, Lr/e;->a(F)F

    .line 232
    .line 233
    .line 234
    move-result v3

    .line 235
    add-float/2addr v1, v3

    .line 236
    aput v1, p1, v24

    .line 237
    .line 238
    goto :goto_7

    .line 239
    :cond_c
    if-eqz v4, :cond_d

    .line 240
    .line 241
    aget v1, p1, v24

    .line 242
    .line 243
    invoke-virtual {v4, v10}, Lr/j;->a(F)F

    .line 244
    .line 245
    .line 246
    move-result v3

    .line 247
    add-float/2addr v1, v3

    .line 248
    aput v1, p1, v24

    .line 249
    .line 250
    :cond_d
    :goto_7
    if-eqz v6, :cond_e

    .line 251
    .line 252
    add-int/lit8 v24, v24, 0x1

    .line 253
    .line 254
    aget v1, p1, v24

    .line 255
    .line 256
    invoke-virtual {v6, v10}, Lr/e;->a(F)F

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    add-float/2addr v1, v3

    .line 261
    aput v1, p1, v24

    .line 262
    .line 263
    goto :goto_8

    .line 264
    :cond_e
    if-eqz v7, :cond_f

    .line 265
    .line 266
    add-int/lit8 v24, v24, 0x1

    .line 267
    .line 268
    aget v1, p1, v24

    .line 269
    .line 270
    invoke-virtual {v7, v10}, Lr/j;->a(F)F

    .line 271
    .line 272
    .line 273
    move-result v3

    .line 274
    add-float/2addr v1, v3

    .line 275
    aput v1, p1, v24

    .line 276
    .line 277
    :cond_f
    :goto_8
    add-int/lit8 v9, v9, 0x1

    .line 278
    .line 279
    move/from16 v1, p2

    .line 280
    .line 281
    const/high16 v3, 0x3f800000    # 1.0f

    .line 282
    .line 283
    goto/16 :goto_4

    .line 284
    .line 285
    :cond_10
    return-void
.end method

.method d(F[FI)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Landroidx/constraintlayout/motion/widget/m;->f(F[F)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget-object v0, v0, v1

    .line 10
    .line 11
    float-to-double v1, p1

    .line 12
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2, p1}, Lr/b;->d(D[D)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 18
    .line 19
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 20
    .line 21
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 22
    .line 23
    invoke-virtual {p1, v0, p0, p2, p3}, Landroidx/constraintlayout/motion/widget/q;->k([I[D[FI)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method e(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/constraintlayout/motion/widget/a;->c(Landroid/view/View;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "button"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->E:[Landroidx/constraintlayout/motion/widget/k;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    :goto_0
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->E:[Landroidx/constraintlayout/motion/widget/k;

    .line 21
    .line 22
    array-length v2, v1

    .line 23
    if-ge v0, v2, :cond_1

    .line 24
    .line 25
    aget-object v1, v1, v0

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/high16 v2, -0x3d380000    # -100.0f

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    const/high16 v2, 0x42c80000    # 100.0f

    .line 33
    .line 34
    :goto_1
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/m;->b:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v1, v2, v3}, Landroidx/constraintlayout/motion/widget/k;->t(FLandroid/view/View;)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 2
    .line 3
    iget p0, p0, Landroidx/constraintlayout/motion/widget/q;->r:I

    .line 4
    .line 5
    return p0
.end method

.method public h(D[F[F)V
    .locals 9

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v5, v0, [D

    .line 3
    .line 4
    new-array v7, v0, [D

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget-object v0, v0, v1

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2, v5}, Lr/b;->d(D[D)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 15
    .line 16
    aget-object v0, v0, v1

    .line 17
    .line 18
    invoke-virtual {v0, p1, p2, v7}, Lr/b;->f(D[D)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {p4, v0}, Ljava/util/Arrays;->fill([FF)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 26
    .line 27
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 28
    .line 29
    move-wide v2, p1

    .line 30
    move-object v6, p3

    .line 31
    move-object v8, p4

    .line 32
    invoke-virtual/range {v1 .. v8}, Landroidx/constraintlayout/motion/widget/q;->g(D[I[D[F[D[F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public i()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/m;->p:F

    .line 2
    .line 3
    return p0
.end method

.method public j()F
    .locals 0

    .line 1
    iget p0, p0, Landroidx/constraintlayout/motion/widget/m;->q:F

    .line 2
    .line 3
    return p0
.end method

.method k(FFF[F)V
    .locals 11

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->z:[F

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Landroidx/constraintlayout/motion/widget/m;->f(F[F)F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    aget-object v0, v0, v1

    .line 13
    .line 14
    float-to-double v2, p1

    .line 15
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 16
    .line 17
    invoke-virtual {v0, v2, v3, p1}, Lr/b;->f(D[D)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 21
    .line 22
    aget-object p1, p1, v1

    .line 23
    .line 24
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 25
    .line 26
    invoke-virtual {p1, v2, v3, v0}, Lr/b;->d(D[D)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->z:[F

    .line 30
    .line 31
    aget p1, p1, v1

    .line 32
    .line 33
    :goto_0
    iget-object v9, p0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 34
    .line 35
    array-length v0, v9

    .line 36
    if-ge v1, v0, :cond_0

    .line 37
    .line 38
    aget-wide v4, v9, v1

    .line 39
    .line 40
    float-to-double v6, p1

    .line 41
    mul-double/2addr v4, v6

    .line 42
    aput-wide v4, v9, v1

    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->l:Lr/b;

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 52
    .line 53
    array-length v1, v0

    .line 54
    if-lez v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {p1, v2, v3, v0}, Lr/b;->d(D[D)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->l:Lr/b;

    .line 60
    .line 61
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 62
    .line 63
    invoke-virtual {p1, v2, v3, v0}, Lr/b;->f(D[D)V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 67
    .line 68
    iget-object v8, p0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 69
    .line 70
    iget-object v9, p0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 71
    .line 72
    iget-object v10, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 73
    .line 74
    move v5, p2

    .line 75
    move v6, p3

    .line 76
    move-object v7, p4

    .line 77
    invoke-virtual/range {v4 .. v10}, Landroidx/constraintlayout/motion/widget/q;->v(FF[F[I[D[D)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void

    .line 81
    :cond_2
    move v5, p2

    .line 82
    move v6, p3

    .line 83
    move-object v7, p4

    .line 84
    iget-object v4, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 85
    .line 86
    iget-object v8, p0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 87
    .line 88
    iget-object v10, p0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 89
    .line 90
    invoke-virtual/range {v4 .. v10}, Landroidx/constraintlayout/motion/widget/q;->v(FF[F[I[D[D)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    move v5, p2

    .line 95
    move v6, p3

    .line 96
    move-object v7, p4

    .line 97
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 98
    .line 99
    iget p2, p1, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 100
    .line 101
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 102
    .line 103
    iget p3, p0, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 104
    .line 105
    sub-float/2addr p2, p3

    .line 106
    iget p3, p1, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 107
    .line 108
    iget p4, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 109
    .line 110
    sub-float/2addr p3, p4

    .line 111
    iget p4, p1, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 112
    .line 113
    iget v0, p0, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 114
    .line 115
    sub-float/2addr p4, v0

    .line 116
    iget p1, p1, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 117
    .line 118
    iget p0, p0, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 119
    .line 120
    sub-float/2addr p1, p0

    .line 121
    add-float/2addr p4, p2

    .line 122
    add-float/2addr p1, p3

    .line 123
    const/high16 p0, 0x3f800000    # 1.0f

    .line 124
    .line 125
    sub-float v0, p0, v5

    .line 126
    .line 127
    mul-float/2addr p2, v0

    .line 128
    mul-float/2addr p4, v5

    .line 129
    add-float/2addr p2, p4

    .line 130
    aput p2, v7, v1

    .line 131
    .line 132
    sub-float/2addr p0, v6

    .line 133
    mul-float/2addr p3, p0

    .line 134
    mul-float/2addr p1, v6

    .line 135
    add-float/2addr p3, p1

    .line 136
    const/4 p0, 0x1

    .line 137
    aput p3, v7, p0

    .line 138
    .line 139
    return-void
.end method

.method public l()I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 2
    .line 3
    iget v0, v0, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Landroidx/constraintlayout/motion/widget/q;

    .line 22
    .line 23
    iget v2, v2, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 24
    .line 25
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 31
    .line 32
    iget p0, p0, Landroidx/constraintlayout/motion/widget/q;->h:I

    .line 33
    .line 34
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method m(I)Landroidx/constraintlayout/motion/widget/q;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/constraintlayout/motion/widget/q;

    .line 8
    .line 9
    return-object p0
.end method

.method public o()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method q(Landroid/view/View;FJLr/d;)Z
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    move/from16 v3, p2

    .line 7
    .line 8
    invoke-direct {v0, v3, v1}, Landroidx/constraintlayout/motion/widget/m;->f(F[F)F

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    iget v4, v0, Landroidx/constraintlayout/motion/widget/m;->I:I

    .line 13
    .line 14
    sget v5, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 15
    .line 16
    const/high16 v12, 0x3f800000    # 1.0f

    .line 17
    .line 18
    if-eq v4, v5, :cond_3

    .line 19
    .line 20
    int-to-float v4, v4

    .line 21
    div-float v4, v12, v4

    .line 22
    .line 23
    div-float v5, v3, v4

    .line 24
    .line 25
    float-to-double v5, v5

    .line 26
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    .line 27
    .line 28
    .line 29
    move-result-wide v5

    .line 30
    double-to-float v5, v5

    .line 31
    mul-float/2addr v5, v4

    .line 32
    rem-float/2addr v3, v4

    .line 33
    div-float/2addr v3, v4

    .line 34
    iget v6, v0, Landroidx/constraintlayout/motion/widget/m;->J:F

    .line 35
    .line 36
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-nez v6, :cond_0

    .line 41
    .line 42
    iget v6, v0, Landroidx/constraintlayout/motion/widget/m;->J:F

    .line 43
    .line 44
    add-float/2addr v3, v6

    .line 45
    rem-float/2addr v3, v12

    .line 46
    :cond_0
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->K:Landroid/view/animation/Interpolator;

    .line 47
    .line 48
    if-eqz v6, :cond_1

    .line 49
    .line 50
    invoke-interface {v6, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    float-to-double v6, v3

    .line 56
    const-wide/high16 v8, 0x3fe0000000000000L    # 0.5

    .line 57
    .line 58
    cmpl-double v3, v6, v8

    .line 59
    .line 60
    if-lez v3, :cond_2

    .line 61
    .line 62
    move v3, v12

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const/4 v3, 0x0

    .line 65
    :goto_0
    mul-float/2addr v3, v4

    .line 66
    add-float/2addr v3, v5

    .line 67
    :cond_3
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 68
    .line 69
    if-eqz v4, :cond_4

    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    if-eqz v5, :cond_4

    .line 84
    .line 85
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    check-cast v5, Lv/c;

    .line 90
    .line 91
    invoke-virtual {v5, v2, v3}, Lv/c;->g(Landroid/view/View;F)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 96
    .line 97
    const/4 v13, 0x0

    .line 98
    if-eqz v4, :cond_7

    .line 99
    .line 100
    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    move-object v8, v1

    .line 109
    move v9, v13

    .line 110
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_6

    .line 115
    .line 116
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Lv/d;

    .line 121
    .line 122
    instance-of v4, v1, Lv/d$d;

    .line 123
    .line 124
    if-eqz v4, :cond_5

    .line 125
    .line 126
    move-object v8, v1

    .line 127
    check-cast v8, Lv/d$d;

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_5
    move-wide/from16 v4, p3

    .line 131
    .line 132
    move-object/from16 v6, p5

    .line 133
    .line 134
    invoke-virtual/range {v1 .. v6}, Lv/d;->i(Landroid/view/View;FJLr/d;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    or-int/2addr v9, v1

    .line 139
    move-object/from16 v2, p1

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_6
    move v14, v9

    .line 143
    move-object v9, v8

    .line 144
    goto :goto_3

    .line 145
    :cond_7
    move-object v9, v1

    .line 146
    move v14, v13

    .line 147
    :goto_3
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 148
    .line 149
    const/4 v15, 0x1

    .line 150
    if-eqz v1, :cond_13

    .line 151
    .line 152
    aget-object v1, v1, v13

    .line 153
    .line 154
    float-to-double v4, v3

    .line 155
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 156
    .line 157
    invoke-virtual {v1, v4, v5, v2}, Lr/b;->d(D[D)V

    .line 158
    .line 159
    .line 160
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 161
    .line 162
    aget-object v1, v1, v13

    .line 163
    .line 164
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 165
    .line 166
    invoke-virtual {v1, v4, v5, v2}, Lr/b;->f(D[D)V

    .line 167
    .line 168
    .line 169
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->l:Lr/b;

    .line 170
    .line 171
    if-eqz v1, :cond_8

    .line 172
    .line 173
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 174
    .line 175
    array-length v6, v2

    .line 176
    if-lez v6, :cond_8

    .line 177
    .line 178
    invoke-virtual {v1, v4, v5, v2}, Lr/b;->d(D[D)V

    .line 179
    .line 180
    .line 181
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->l:Lr/b;

    .line 182
    .line 183
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 184
    .line 185
    invoke-virtual {v1, v4, v5, v2}, Lr/b;->f(D[D)V

    .line 186
    .line 187
    .line 188
    :cond_8
    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/m;->L:Z

    .line 189
    .line 190
    if-nez v1, :cond_9

    .line 191
    .line 192
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 193
    .line 194
    move-wide v5, v4

    .line 195
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 196
    .line 197
    move-wide v6, v5

    .line 198
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 199
    .line 200
    move-wide v7, v6

    .line 201
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 202
    .line 203
    move-wide/from16 v16, v7

    .line 204
    .line 205
    const/4 v7, 0x0

    .line 206
    iget-boolean v8, v0, Landroidx/constraintlayout/motion/widget/m;->d:Z

    .line 207
    .line 208
    move v2, v3

    .line 209
    move/from16 v18, v12

    .line 210
    .line 211
    move-wide/from16 v11, v16

    .line 212
    .line 213
    const/16 p2, 0x0

    .line 214
    .line 215
    move-object/from16 v3, p1

    .line 216
    .line 217
    invoke-virtual/range {v1 .. v8}, Landroidx/constraintlayout/motion/widget/q;->w(FLandroid/view/View;[I[D[D[DZ)V

    .line 218
    .line 219
    .line 220
    move-object/from16 v19, v3

    .line 221
    .line 222
    move v3, v2

    .line 223
    move-object/from16 v2, v19

    .line 224
    .line 225
    iput-boolean v13, v0, Landroidx/constraintlayout/motion/widget/m;->d:Z

    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_9
    move-object/from16 v2, p1

    .line 229
    .line 230
    move/from16 v18, v12

    .line 231
    .line 232
    const/16 p2, 0x0

    .line 233
    .line 234
    move-wide v11, v4

    .line 235
    :goto_4
    iget v1, v0, Landroidx/constraintlayout/motion/widget/m;->G:I

    .line 236
    .line 237
    sget v4, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 238
    .line 239
    if-eq v1, v4, :cond_b

    .line 240
    .line 241
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->H:Landroid/view/View;

    .line 242
    .line 243
    if-nez v1, :cond_a

    .line 244
    .line 245
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    check-cast v1, Landroid/view/View;

    .line 250
    .line 251
    iget v4, v0, Landroidx/constraintlayout/motion/widget/m;->G:I

    .line 252
    .line 253
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->H:Landroid/view/View;

    .line 258
    .line 259
    :cond_a
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->H:Landroid/view/View;

    .line 260
    .line 261
    if-eqz v1, :cond_b

    .line 262
    .line 263
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->H:Landroid/view/View;

    .line 268
    .line 269
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    .line 270
    .line 271
    .line 272
    move-result v4

    .line 273
    add-int/2addr v1, v4

    .line 274
    int-to-float v1, v1

    .line 275
    const/high16 v4, 0x40000000    # 2.0f

    .line 276
    .line 277
    div-float/2addr v1, v4

    .line 278
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->H:Landroid/view/View;

    .line 279
    .line 280
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    .line 281
    .line 282
    .line 283
    move-result v5

    .line 284
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->H:Landroid/view/View;

    .line 285
    .line 286
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    .line 287
    .line 288
    .line 289
    move-result v6

    .line 290
    add-int/2addr v5, v6

    .line 291
    int-to-float v5, v5

    .line 292
    div-float/2addr v5, v4

    .line 293
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 294
    .line 295
    .line 296
    move-result v4

    .line 297
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 298
    .line 299
    .line 300
    move-result v6

    .line 301
    sub-int/2addr v4, v6

    .line 302
    if-lez v4, :cond_b

    .line 303
    .line 304
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 305
    .line 306
    .line 307
    move-result v4

    .line 308
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 309
    .line 310
    .line 311
    move-result v6

    .line 312
    sub-int/2addr v4, v6

    .line 313
    if-lez v4, :cond_b

    .line 314
    .line 315
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 316
    .line 317
    .line 318
    move-result v4

    .line 319
    int-to-float v4, v4

    .line 320
    sub-float/2addr v5, v4

    .line 321
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 322
    .line 323
    .line 324
    move-result v4

    .line 325
    int-to-float v4, v4

    .line 326
    sub-float/2addr v1, v4

    .line 327
    invoke-virtual {v2, v5}, Landroid/view/View;->setPivotX(F)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v2, v1}, Landroid/view/View;->setPivotY(F)V

    .line 331
    .line 332
    .line 333
    :cond_b
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 334
    .line 335
    if-eqz v1, :cond_d

    .line 336
    .line 337
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 342
    .line 343
    .line 344
    move-result-object v8

    .line 345
    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    if-eqz v1, :cond_d

    .line 350
    .line 351
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    check-cast v1, Lr/j;

    .line 356
    .line 357
    instance-of v4, v1, Lv/c$d;

    .line 358
    .line 359
    if-eqz v4, :cond_c

    .line 360
    .line 361
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 362
    .line 363
    array-length v5, v4

    .line 364
    if-le v5, v15, :cond_c

    .line 365
    .line 366
    check-cast v1, Lv/c$d;

    .line 367
    .line 368
    move-object v6, v4

    .line 369
    aget-wide v4, v6, v13

    .line 370
    .line 371
    aget-wide v6, v6, v15

    .line 372
    .line 373
    invoke-virtual/range {v1 .. v7}, Lv/c$d;->h(Landroid/view/View;FDD)V

    .line 374
    .line 375
    .line 376
    :cond_c
    move-object/from16 v2, p1

    .line 377
    .line 378
    goto :goto_5

    .line 379
    :cond_d
    if-eqz v9, :cond_e

    .line 380
    .line 381
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 382
    .line 383
    aget-wide v7, v1, v13

    .line 384
    .line 385
    aget-wide v1, v1, v15

    .line 386
    .line 387
    move-wide v4, v1

    .line 388
    move-object v1, v9

    .line 389
    move-wide v9, v4

    .line 390
    move-object/from16 v2, p1

    .line 391
    .line 392
    move-wide/from16 v5, p3

    .line 393
    .line 394
    move v4, v3

    .line 395
    move-object/from16 v3, p5

    .line 396
    .line 397
    invoke-virtual/range {v1 .. v10}, Lv/d$d;->j(Landroid/view/View;Lr/d;FJDD)Z

    .line 398
    .line 399
    .line 400
    move-result v1

    .line 401
    move v3, v4

    .line 402
    or-int/2addr v14, v1

    .line 403
    goto :goto_6

    .line 404
    :cond_e
    move-object/from16 v2, p1

    .line 405
    .line 406
    :goto_6
    move v1, v15

    .line 407
    :goto_7
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 408
    .line 409
    array-length v5, v4

    .line 410
    if-ge v1, v5, :cond_f

    .line 411
    .line 412
    aget-object v4, v4, v1

    .line 413
    .line 414
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->x:[F

    .line 415
    .line 416
    invoke-virtual {v4, v11, v12, v5}, Lr/b;->e(D[F)V

    .line 417
    .line 418
    .line 419
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 420
    .line 421
    iget-object v4, v4, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 422
    .line 423
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->u:[Ljava/lang/String;

    .line 424
    .line 425
    add-int/lit8 v6, v1, -0x1

    .line 426
    .line 427
    aget-object v5, v5, v6

    .line 428
    .line 429
    invoke-virtual {v4, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    move-result-object v4

    .line 433
    check-cast v4, Landroidx/constraintlayout/widget/a;

    .line 434
    .line 435
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->x:[F

    .line 436
    .line 437
    invoke-static {v4, v2, v5}, Lv/a;->b(Landroidx/constraintlayout/widget/a;Landroid/view/View;[F)V

    .line 438
    .line 439
    .line 440
    add-int/lit8 v1, v1, 0x1

    .line 441
    .line 442
    goto :goto_7

    .line 443
    :cond_f
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->i:Landroidx/constraintlayout/motion/widget/l;

    .line 444
    .line 445
    iget v4, v1, Landroidx/constraintlayout/motion/widget/l;->h:I

    .line 446
    .line 447
    if-nez v4, :cond_12

    .line 448
    .line 449
    cmpg-float v4, v3, p2

    .line 450
    .line 451
    if-gtz v4, :cond_10

    .line 452
    .line 453
    iget v1, v1, Landroidx/constraintlayout/motion/widget/l;->i:I

    .line 454
    .line 455
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 456
    .line 457
    .line 458
    goto :goto_8

    .line 459
    :cond_10
    cmpl-float v4, v3, v18

    .line 460
    .line 461
    if-ltz v4, :cond_11

    .line 462
    .line 463
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->j:Landroidx/constraintlayout/motion/widget/l;

    .line 464
    .line 465
    iget v1, v1, Landroidx/constraintlayout/motion/widget/l;->i:I

    .line 466
    .line 467
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 468
    .line 469
    .line 470
    goto :goto_8

    .line 471
    :cond_11
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->j:Landroidx/constraintlayout/motion/widget/l;

    .line 472
    .line 473
    iget v4, v4, Landroidx/constraintlayout/motion/widget/l;->i:I

    .line 474
    .line 475
    iget v1, v1, Landroidx/constraintlayout/motion/widget/l;->i:I

    .line 476
    .line 477
    if-eq v4, v1, :cond_12

    .line 478
    .line 479
    invoke-virtual {v2, v13}, Landroid/view/View;->setVisibility(I)V

    .line 480
    .line 481
    .line 482
    :cond_12
    :goto_8
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->E:[Landroidx/constraintlayout/motion/widget/k;

    .line 483
    .line 484
    if-eqz v1, :cond_16

    .line 485
    .line 486
    move v1, v13

    .line 487
    :goto_9
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->E:[Landroidx/constraintlayout/motion/widget/k;

    .line 488
    .line 489
    array-length v5, v4

    .line 490
    if-ge v1, v5, :cond_16

    .line 491
    .line 492
    aget-object v4, v4, v1

    .line 493
    .line 494
    invoke-virtual {v4, v3, v2}, Landroidx/constraintlayout/motion/widget/k;->t(FLandroid/view/View;)V

    .line 495
    .line 496
    .line 497
    add-int/lit8 v1, v1, 0x1

    .line 498
    .line 499
    goto :goto_9

    .line 500
    :cond_13
    move-object/from16 v2, p1

    .line 501
    .line 502
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 503
    .line 504
    iget v4, v1, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 505
    .line 506
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 507
    .line 508
    iget v6, v5, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 509
    .line 510
    sub-float/2addr v6, v4

    .line 511
    mul-float/2addr v6, v3

    .line 512
    add-float/2addr v4, v6

    .line 513
    iget v6, v1, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 514
    .line 515
    iget v7, v5, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 516
    .line 517
    sub-float/2addr v7, v6

    .line 518
    mul-float/2addr v7, v3

    .line 519
    add-float/2addr v6, v7

    .line 520
    iget v7, v1, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 521
    .line 522
    iget v8, v5, Landroidx/constraintlayout/motion/widget/q;->m:F

    .line 523
    .line 524
    sub-float v9, v8, v7

    .line 525
    .line 526
    mul-float/2addr v9, v3

    .line 527
    add-float/2addr v9, v7

    .line 528
    iget v1, v1, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 529
    .line 530
    iget v5, v5, Landroidx/constraintlayout/motion/widget/q;->n:F

    .line 531
    .line 532
    sub-float v10, v5, v1

    .line 533
    .line 534
    mul-float/2addr v10, v3

    .line 535
    add-float/2addr v10, v1

    .line 536
    const/high16 v11, 0x3f000000    # 0.5f

    .line 537
    .line 538
    add-float/2addr v4, v11

    .line 539
    float-to-int v12, v4

    .line 540
    add-float/2addr v6, v11

    .line 541
    float-to-int v11, v6

    .line 542
    add-float/2addr v4, v9

    .line 543
    float-to-int v4, v4

    .line 544
    add-float/2addr v6, v10

    .line 545
    float-to-int v6, v6

    .line 546
    sub-int v9, v4, v12

    .line 547
    .line 548
    sub-int v10, v6, v11

    .line 549
    .line 550
    cmpl-float v7, v8, v7

    .line 551
    .line 552
    if-nez v7, :cond_14

    .line 553
    .line 554
    cmpl-float v1, v5, v1

    .line 555
    .line 556
    if-nez v1, :cond_14

    .line 557
    .line 558
    iget-boolean v1, v0, Landroidx/constraintlayout/motion/widget/m;->d:Z

    .line 559
    .line 560
    if-eqz v1, :cond_15

    .line 561
    .line 562
    :cond_14
    const/high16 v1, 0x40000000    # 2.0f

    .line 563
    .line 564
    invoke-static {v9, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 565
    .line 566
    .line 567
    move-result v5

    .line 568
    invoke-static {v10, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 569
    .line 570
    .line 571
    move-result v1

    .line 572
    invoke-virtual {v2, v5, v1}, Landroid/view/View;->measure(II)V

    .line 573
    .line 574
    .line 575
    iput-boolean v13, v0, Landroidx/constraintlayout/motion/widget/m;->d:Z

    .line 576
    .line 577
    :cond_15
    invoke-virtual {v2, v12, v11, v4, v6}, Landroid/view/View;->layout(IIII)V

    .line 578
    .line 579
    .line 580
    :cond_16
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->D:Ljava/util/HashMap;

    .line 581
    .line 582
    if-eqz v1, :cond_18

    .line 583
    .line 584
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 585
    .line 586
    .line 587
    move-result-object v1

    .line 588
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 589
    .line 590
    .line 591
    move-result-object v8

    .line 592
    :goto_a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 593
    .line 594
    .line 595
    move-result v1

    .line 596
    if-eqz v1, :cond_18

    .line 597
    .line 598
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 599
    .line 600
    .line 601
    move-result-object v1

    .line 602
    check-cast v1, Lv/b;

    .line 603
    .line 604
    instance-of v4, v1, Lv/b$d;

    .line 605
    .line 606
    if-eqz v4, :cond_17

    .line 607
    .line 608
    check-cast v1, Lv/b$d;

    .line 609
    .line 610
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 611
    .line 612
    move-object v6, v4

    .line 613
    aget-wide v4, v6, v13

    .line 614
    .line 615
    aget-wide v6, v6, v15

    .line 616
    .line 617
    invoke-virtual/range {v1 .. v7}, Lv/b$d;->j(Landroid/view/View;FDD)V

    .line 618
    .line 619
    .line 620
    goto :goto_a

    .line 621
    :cond_17
    invoke-virtual {v1, v2, v3}, Lv/b;->i(Landroid/view/View;F)V

    .line 622
    .line 623
    .line 624
    goto :goto_a

    .line 625
    :cond_18
    return v14
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/constraintlayout/motion/widget/m;->d:Z

    .line 3
    .line 4
    return-void
.end method

.method s(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 5
    .line 6
    iput v1, v0, Landroidx/constraintlayout/motion/widget/q;->j:F

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Landroidx/constraintlayout/motion/widget/m;->L:Z

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getY()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    int-to-float v3, v3

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    int-to-float v4, v4

    .line 29
    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/constraintlayout/motion/widget/q;->u(FFFF)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getY()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    int-to-float v3, v3

    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    int-to-float v4, v4

    .line 52
    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/constraintlayout/motion/widget/q;->u(FFFF)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/m;->i:Landroidx/constraintlayout/motion/widget/l;

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/motion/widget/l;->i(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->j:Landroidx/constraintlayout/motion/widget/l;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/motion/widget/l;->i(Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public t(Landroid/view/View;)V
    .locals 1

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Landroidx/constraintlayout/motion/widget/m;->c:I

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    instance-of v0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout$b;->a()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/m;->e:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, " start: x: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 12
    .line 13
    iget v1, v1, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " y: "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 24
    .line 25
    iget v2, v2, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, " end: x: "

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 36
    .line 37
    iget v2, v2, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 46
    .line 47
    iget p0, p0, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public u(IIFJ)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v3, Ljava/util/HashSet;

    .line 19
    .line 20
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v4, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    iget v5, v0, Landroidx/constraintlayout/motion/widget/m;->F:I

    .line 29
    .line 30
    sget v6, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 31
    .line 32
    if-eq v5, v6, :cond_0

    .line 33
    .line 34
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 35
    .line 36
    iput v5, v6, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 37
    .line 38
    :cond_0
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->i:Landroidx/constraintlayout/motion/widget/l;

    .line 39
    .line 40
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->j:Landroidx/constraintlayout/motion/widget/l;

    .line 41
    .line 42
    invoke-virtual {v5, v6, v2}, Landroidx/constraintlayout/motion/widget/l;->f(Landroidx/constraintlayout/motion/widget/l;Ljava/util/HashSet;)V

    .line 43
    .line 44
    .line 45
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 46
    .line 47
    if-eqz v5, :cond_7

    .line 48
    .line 49
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const/4 v7, 0x0

    .line 54
    :cond_1
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    if-eqz v8, :cond_8

    .line 59
    .line 60
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    check-cast v8, Landroidx/constraintlayout/motion/widget/d;

    .line 65
    .line 66
    instance-of v9, v8, Landroidx/constraintlayout/motion/widget/h;

    .line 67
    .line 68
    if-eqz v9, :cond_2

    .line 69
    .line 70
    move-object v13, v8

    .line 71
    check-cast v13, Landroidx/constraintlayout/motion/widget/h;

    .line 72
    .line 73
    new-instance v10, Landroidx/constraintlayout/motion/widget/q;

    .line 74
    .line 75
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 76
    .line 77
    iget-object v15, v0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 78
    .line 79
    move/from16 v11, p1

    .line 80
    .line 81
    move/from16 v12, p2

    .line 82
    .line 83
    invoke-direct/range {v10 .. v15}, Landroidx/constraintlayout/motion/widget/q;-><init>(IILandroidx/constraintlayout/motion/widget/h;Landroidx/constraintlayout/motion/widget/q;Landroidx/constraintlayout/motion/widget/q;)V

    .line 84
    .line 85
    .line 86
    invoke-direct {v0, v10}, Landroidx/constraintlayout/motion/widget/m;->p(Landroidx/constraintlayout/motion/widget/q;)V

    .line 87
    .line 88
    .line 89
    iget v8, v13, Landroidx/constraintlayout/motion/widget/i;->g:I

    .line 90
    .line 91
    sget v9, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 92
    .line 93
    if-eq v8, v9, :cond_1

    .line 94
    .line 95
    iput v8, v0, Landroidx/constraintlayout/motion/widget/m;->f:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    instance-of v9, v8, Landroidx/constraintlayout/motion/widget/f;

    .line 99
    .line 100
    if-eqz v9, :cond_3

    .line 101
    .line 102
    invoke-virtual {v8, v3}, Landroidx/constraintlayout/motion/widget/d;->d(Ljava/util/HashSet;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    instance-of v9, v8, Landroidx/constraintlayout/motion/widget/j;

    .line 107
    .line 108
    if-eqz v9, :cond_4

    .line 109
    .line 110
    invoke-virtual {v8, v1}, Landroidx/constraintlayout/motion/widget/d;->d(Ljava/util/HashSet;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    instance-of v9, v8, Landroidx/constraintlayout/motion/widget/k;

    .line 115
    .line 116
    if-eqz v9, :cond_6

    .line 117
    .line 118
    if-nez v7, :cond_5

    .line 119
    .line 120
    new-instance v7, Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 123
    .line 124
    .line 125
    :cond_5
    check-cast v8, Landroidx/constraintlayout/motion/widget/k;

    .line 126
    .line 127
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_6
    invoke-virtual {v8, v4}, Landroidx/constraintlayout/motion/widget/d;->f(Ljava/util/HashMap;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v8, v2}, Landroidx/constraintlayout/motion/widget/d;->d(Ljava/util/HashSet;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_7
    const/4 v7, 0x0

    .line 139
    :cond_8
    const/4 v5, 0x0

    .line 140
    if-eqz v7, :cond_9

    .line 141
    .line 142
    new-array v8, v5, [Landroidx/constraintlayout/motion/widget/k;

    .line 143
    .line 144
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    check-cast v7, [Landroidx/constraintlayout/motion/widget/k;

    .line 149
    .line 150
    iput-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->E:[Landroidx/constraintlayout/motion/widget/k;

    .line 151
    .line 152
    :cond_9
    invoke-virtual {v2}, Ljava/util/HashSet;->isEmpty()Z

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    const-string v8, ","

    .line 157
    .line 158
    const-string v9, "CUSTOM,"

    .line 159
    .line 160
    const/4 v10, 0x1

    .line 161
    if-nez v7, :cond_14

    .line 162
    .line 163
    new-instance v7, Ljava/util/HashMap;

    .line 164
    .line 165
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 166
    .line 167
    .line 168
    iput-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 169
    .line 170
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 171
    .line 172
    .line 173
    move-result-object v7

    .line 174
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 175
    .line 176
    .line 177
    move-result v11

    .line 178
    if-eqz v11, :cond_f

    .line 179
    .line 180
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v11

    .line 184
    check-cast v11, Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v11, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result v12

    .line 190
    if-eqz v12, :cond_d

    .line 191
    .line 192
    new-instance v12, Landroid/util/SparseArray;

    .line 193
    .line 194
    invoke-direct {v12}, Landroid/util/SparseArray;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v11, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v13

    .line 201
    aget-object v13, v13, v10

    .line 202
    .line 203
    iget-object v14, v0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 204
    .line 205
    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 206
    .line 207
    .line 208
    move-result-object v14

    .line 209
    :cond_a
    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 210
    .line 211
    .line 212
    move-result v15

    .line 213
    if-eqz v15, :cond_c

    .line 214
    .line 215
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v15

    .line 219
    check-cast v15, Landroidx/constraintlayout/motion/widget/d;

    .line 220
    .line 221
    iget-object v6, v15, Landroidx/constraintlayout/motion/widget/d;->e:Ljava/util/HashMap;

    .line 222
    .line 223
    if-nez v6, :cond_b

    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_b
    invoke-virtual {v6, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v6

    .line 230
    check-cast v6, Landroidx/constraintlayout/widget/a;

    .line 231
    .line 232
    if-eqz v6, :cond_a

    .line 233
    .line 234
    iget v15, v15, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 235
    .line 236
    invoke-virtual {v12, v15, v6}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_c
    invoke-static {v11, v12}, Lv/c;->e(Ljava/lang/String;Landroid/util/SparseArray;)Lv/c;

    .line 241
    .line 242
    .line 243
    move-result-object v6

    .line 244
    goto :goto_3

    .line 245
    :cond_d
    invoke-static {v11}, Lv/c;->f(Ljava/lang/String;)Lv/c;

    .line 246
    .line 247
    .line 248
    move-result-object v6

    .line 249
    :goto_3
    if-nez v6, :cond_e

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_e
    invoke-virtual {v6, v11}, Lr/j;->c(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 256
    .line 257
    invoke-virtual {v12, v11, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    goto :goto_1

    .line 261
    :cond_f
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 262
    .line 263
    if-eqz v6, :cond_11

    .line 264
    .line 265
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 266
    .line 267
    .line 268
    move-result-object v6

    .line 269
    :cond_10
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 270
    .line 271
    .line 272
    move-result v7

    .line 273
    if-eqz v7, :cond_11

    .line 274
    .line 275
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v7

    .line 279
    check-cast v7, Landroidx/constraintlayout/motion/widget/d;

    .line 280
    .line 281
    instance-of v11, v7, Landroidx/constraintlayout/motion/widget/e;

    .line 282
    .line 283
    if-eqz v11, :cond_10

    .line 284
    .line 285
    iget-object v11, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 286
    .line 287
    invoke-virtual {v7, v11}, Landroidx/constraintlayout/motion/widget/d;->a(Ljava/util/HashMap;)V

    .line 288
    .line 289
    .line 290
    goto :goto_4

    .line 291
    :cond_11
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->i:Landroidx/constraintlayout/motion/widget/l;

    .line 292
    .line 293
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 294
    .line 295
    invoke-virtual {v6, v7, v5}, Landroidx/constraintlayout/motion/widget/l;->a(Ljava/util/HashMap;I)V

    .line 296
    .line 297
    .line 298
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->j:Landroidx/constraintlayout/motion/widget/l;

    .line 299
    .line 300
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 301
    .line 302
    const/16 v11, 0x64

    .line 303
    .line 304
    invoke-virtual {v6, v7, v11}, Landroidx/constraintlayout/motion/widget/l;->a(Ljava/util/HashMap;I)V

    .line 305
    .line 306
    .line 307
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 308
    .line 309
    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 310
    .line 311
    .line 312
    move-result-object v6

    .line 313
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 314
    .line 315
    .line 316
    move-result-object v6

    .line 317
    :cond_12
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 318
    .line 319
    .line 320
    move-result v7

    .line 321
    if-eqz v7, :cond_14

    .line 322
    .line 323
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v7

    .line 327
    check-cast v7, Ljava/lang/String;

    .line 328
    .line 329
    invoke-virtual {v4, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result v11

    .line 333
    if-eqz v11, :cond_13

    .line 334
    .line 335
    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v11

    .line 339
    check-cast v11, Ljava/lang/Integer;

    .line 340
    .line 341
    if-eqz v11, :cond_13

    .line 342
    .line 343
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 344
    .line 345
    .line 346
    move-result v11

    .line 347
    goto :goto_6

    .line 348
    :cond_13
    move v11, v5

    .line 349
    :goto_6
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/m;->C:Ljava/util/HashMap;

    .line 350
    .line 351
    invoke-virtual {v12, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v7

    .line 355
    check-cast v7, Lr/j;

    .line 356
    .line 357
    if-eqz v7, :cond_12

    .line 358
    .line 359
    invoke-virtual {v7, v11}, Lr/j;->d(I)V

    .line 360
    .line 361
    .line 362
    goto :goto_5

    .line 363
    :cond_14
    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    .line 364
    .line 365
    .line 366
    move-result v6

    .line 367
    if-nez v6, :cond_20

    .line 368
    .line 369
    iget-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 370
    .line 371
    if-nez v6, :cond_15

    .line 372
    .line 373
    new-instance v6, Ljava/util/HashMap;

    .line 374
    .line 375
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 376
    .line 377
    .line 378
    iput-object v6, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 379
    .line 380
    :cond_15
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 385
    .line 386
    .line 387
    move-result v6

    .line 388
    if-eqz v6, :cond_1c

    .line 389
    .line 390
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object v6

    .line 394
    check-cast v6, Ljava/lang/String;

    .line 395
    .line 396
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 397
    .line 398
    invoke-virtual {v7, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    move-result v7

    .line 402
    if-eqz v7, :cond_16

    .line 403
    .line 404
    goto :goto_7

    .line 405
    :cond_16
    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 406
    .line 407
    .line 408
    move-result v7

    .line 409
    if-eqz v7, :cond_1a

    .line 410
    .line 411
    new-instance v7, Landroid/util/SparseArray;

    .line 412
    .line 413
    invoke-direct {v7}, Landroid/util/SparseArray;-><init>()V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v11

    .line 420
    aget-object v11, v11, v10

    .line 421
    .line 422
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 423
    .line 424
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 425
    .line 426
    .line 427
    move-result-object v12

    .line 428
    :cond_17
    :goto_8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 429
    .line 430
    .line 431
    move-result v13

    .line 432
    if-eqz v13, :cond_19

    .line 433
    .line 434
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 435
    .line 436
    .line 437
    move-result-object v13

    .line 438
    check-cast v13, Landroidx/constraintlayout/motion/widget/d;

    .line 439
    .line 440
    iget-object v14, v13, Landroidx/constraintlayout/motion/widget/d;->e:Ljava/util/HashMap;

    .line 441
    .line 442
    if-nez v14, :cond_18

    .line 443
    .line 444
    goto :goto_8

    .line 445
    :cond_18
    invoke-virtual {v14, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v14

    .line 449
    check-cast v14, Landroidx/constraintlayout/widget/a;

    .line 450
    .line 451
    if-eqz v14, :cond_17

    .line 452
    .line 453
    iget v13, v13, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 454
    .line 455
    invoke-virtual {v7, v13, v14}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 456
    .line 457
    .line 458
    goto :goto_8

    .line 459
    :cond_19
    invoke-static {v6, v7}, Lv/d;->g(Ljava/lang/String;Landroid/util/SparseArray;)Lv/d;

    .line 460
    .line 461
    .line 462
    move-result-object v7

    .line 463
    move-wide/from16 v11, p4

    .line 464
    .line 465
    goto :goto_9

    .line 466
    :cond_1a
    move-wide/from16 v11, p4

    .line 467
    .line 468
    invoke-static {v6, v11, v12}, Lv/d;->h(Ljava/lang/String;J)Lv/d;

    .line 469
    .line 470
    .line 471
    move-result-object v7

    .line 472
    :goto_9
    if-nez v7, :cond_1b

    .line 473
    .line 474
    goto :goto_7

    .line 475
    :cond_1b
    invoke-virtual {v7, v6}, Lr/l;->d(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    iget-object v13, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 479
    .line 480
    invoke-virtual {v13, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    goto :goto_7

    .line 484
    :cond_1c
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 485
    .line 486
    if-eqz v1, :cond_1e

    .line 487
    .line 488
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    :cond_1d
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 493
    .line 494
    .line 495
    move-result v6

    .line 496
    if-eqz v6, :cond_1e

    .line 497
    .line 498
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 499
    .line 500
    .line 501
    move-result-object v6

    .line 502
    check-cast v6, Landroidx/constraintlayout/motion/widget/d;

    .line 503
    .line 504
    instance-of v7, v6, Landroidx/constraintlayout/motion/widget/j;

    .line 505
    .line 506
    if-eqz v7, :cond_1d

    .line 507
    .line 508
    check-cast v6, Landroidx/constraintlayout/motion/widget/j;

    .line 509
    .line 510
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 511
    .line 512
    invoke-virtual {v6, v7}, Landroidx/constraintlayout/motion/widget/j;->P(Ljava/util/HashMap;)V

    .line 513
    .line 514
    .line 515
    goto :goto_a

    .line 516
    :cond_1e
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 517
    .line 518
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 519
    .line 520
    .line 521
    move-result-object v1

    .line 522
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 523
    .line 524
    .line 525
    move-result-object v1

    .line 526
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 527
    .line 528
    .line 529
    move-result v6

    .line 530
    if-eqz v6, :cond_20

    .line 531
    .line 532
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 533
    .line 534
    .line 535
    move-result-object v6

    .line 536
    check-cast v6, Ljava/lang/String;

    .line 537
    .line 538
    invoke-virtual {v4, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 539
    .line 540
    .line 541
    move-result v7

    .line 542
    if-eqz v7, :cond_1f

    .line 543
    .line 544
    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    .line 546
    .line 547
    move-result-object v7

    .line 548
    check-cast v7, Ljava/lang/Integer;

    .line 549
    .line 550
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 551
    .line 552
    .line 553
    move-result v7

    .line 554
    goto :goto_c

    .line 555
    :cond_1f
    move v7, v5

    .line 556
    :goto_c
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/m;->B:Ljava/util/HashMap;

    .line 557
    .line 558
    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v6

    .line 562
    check-cast v6, Lv/d;

    .line 563
    .line 564
    invoke-virtual {v6, v7}, Lr/l;->e(I)V

    .line 565
    .line 566
    .line 567
    goto :goto_b

    .line 568
    :cond_20
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 569
    .line 570
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 571
    .line 572
    .line 573
    move-result v1

    .line 574
    add-int/lit8 v4, v1, 0x2

    .line 575
    .line 576
    new-array v6, v4, [Landroidx/constraintlayout/motion/widget/q;

    .line 577
    .line 578
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 579
    .line 580
    aput-object v7, v6, v5

    .line 581
    .line 582
    add-int/2addr v1, v10

    .line 583
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 584
    .line 585
    aput-object v7, v6, v1

    .line 586
    .line 587
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 588
    .line 589
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 590
    .line 591
    .line 592
    move-result v1

    .line 593
    if-lez v1, :cond_21

    .line 594
    .line 595
    iget v1, v0, Landroidx/constraintlayout/motion/widget/m;->f:I

    .line 596
    .line 597
    const/4 v7, -0x1

    .line 598
    if-ne v1, v7, :cond_21

    .line 599
    .line 600
    iput v5, v0, Landroidx/constraintlayout/motion/widget/m;->f:I

    .line 601
    .line 602
    :cond_21
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->y:Ljava/util/ArrayList;

    .line 603
    .line 604
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 605
    .line 606
    .line 607
    move-result-object v1

    .line 608
    move v7, v10

    .line 609
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 610
    .line 611
    .line 612
    move-result v8

    .line 613
    if-eqz v8, :cond_22

    .line 614
    .line 615
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 616
    .line 617
    .line 618
    move-result-object v8

    .line 619
    check-cast v8, Landroidx/constraintlayout/motion/widget/q;

    .line 620
    .line 621
    add-int/lit8 v11, v7, 0x1

    .line 622
    .line 623
    aput-object v8, v6, v7

    .line 624
    .line 625
    move v7, v11

    .line 626
    goto :goto_d

    .line 627
    :cond_22
    new-instance v1, Ljava/util/HashSet;

    .line 628
    .line 629
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 630
    .line 631
    .line 632
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->h:Landroidx/constraintlayout/motion/widget/q;

    .line 633
    .line 634
    iget-object v7, v7, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 635
    .line 636
    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    .line 637
    .line 638
    .line 639
    move-result-object v7

    .line 640
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 641
    .line 642
    .line 643
    move-result-object v7

    .line 644
    :cond_23
    :goto_e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 645
    .line 646
    .line 647
    move-result v8

    .line 648
    if-eqz v8, :cond_24

    .line 649
    .line 650
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 651
    .line 652
    .line 653
    move-result-object v8

    .line 654
    check-cast v8, Ljava/lang/String;

    .line 655
    .line 656
    iget-object v11, v0, Landroidx/constraintlayout/motion/widget/m;->g:Landroidx/constraintlayout/motion/widget/q;

    .line 657
    .line 658
    iget-object v11, v11, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 659
    .line 660
    invoke-virtual {v11, v8}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 661
    .line 662
    .line 663
    move-result v11

    .line 664
    if-eqz v11, :cond_23

    .line 665
    .line 666
    new-instance v11, Ljava/lang/StringBuilder;

    .line 667
    .line 668
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 669
    .line 670
    .line 671
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 672
    .line 673
    .line 674
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 675
    .line 676
    .line 677
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    move-result-object v11

    .line 681
    invoke-virtual {v2, v11}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 682
    .line 683
    .line 684
    move-result v11

    .line 685
    if-nez v11, :cond_23

    .line 686
    .line 687
    invoke-virtual {v1, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 688
    .line 689
    .line 690
    goto :goto_e

    .line 691
    :cond_24
    new-array v2, v5, [Ljava/lang/String;

    .line 692
    .line 693
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 694
    .line 695
    .line 696
    move-result-object v1

    .line 697
    check-cast v1, [Ljava/lang/String;

    .line 698
    .line 699
    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->u:[Ljava/lang/String;

    .line 700
    .line 701
    array-length v1, v1

    .line 702
    new-array v1, v1, [I

    .line 703
    .line 704
    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->v:[I

    .line 705
    .line 706
    move v1, v5

    .line 707
    :goto_f
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->u:[Ljava/lang/String;

    .line 708
    .line 709
    array-length v7, v2

    .line 710
    if-ge v1, v7, :cond_27

    .line 711
    .line 712
    aget-object v2, v2, v1

    .line 713
    .line 714
    iget-object v7, v0, Landroidx/constraintlayout/motion/widget/m;->v:[I

    .line 715
    .line 716
    aput v5, v7, v1

    .line 717
    .line 718
    move v7, v5

    .line 719
    :goto_10
    if-ge v7, v4, :cond_26

    .line 720
    .line 721
    aget-object v8, v6, v7

    .line 722
    .line 723
    iget-object v8, v8, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 724
    .line 725
    invoke-virtual {v8, v2}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 726
    .line 727
    .line 728
    move-result v8

    .line 729
    if-eqz v8, :cond_25

    .line 730
    .line 731
    aget-object v8, v6, v7

    .line 732
    .line 733
    iget-object v8, v8, Landroidx/constraintlayout/motion/widget/q;->u:Ljava/util/LinkedHashMap;

    .line 734
    .line 735
    invoke-virtual {v8, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-result-object v8

    .line 739
    check-cast v8, Landroidx/constraintlayout/widget/a;

    .line 740
    .line 741
    if-eqz v8, :cond_25

    .line 742
    .line 743
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->v:[I

    .line 744
    .line 745
    aget v7, v2, v1

    .line 746
    .line 747
    invoke-virtual {v8}, Landroidx/constraintlayout/widget/a;->g()I

    .line 748
    .line 749
    .line 750
    move-result v8

    .line 751
    add-int/2addr v7, v8

    .line 752
    aput v7, v2, v1

    .line 753
    .line 754
    goto :goto_11

    .line 755
    :cond_25
    add-int/lit8 v7, v7, 0x1

    .line 756
    .line 757
    goto :goto_10

    .line 758
    :cond_26
    :goto_11
    add-int/lit8 v1, v1, 0x1

    .line 759
    .line 760
    goto :goto_f

    .line 761
    :cond_27
    aget-object v1, v6, v5

    .line 762
    .line 763
    iget v1, v1, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 764
    .line 765
    sget v7, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 766
    .line 767
    if-eq v1, v7, :cond_28

    .line 768
    .line 769
    move v1, v10

    .line 770
    goto :goto_12

    .line 771
    :cond_28
    move v1, v5

    .line 772
    :goto_12
    array-length v2, v2

    .line 773
    const/16 v7, 0x12

    .line 774
    .line 775
    add-int/2addr v7, v2

    .line 776
    new-array v2, v7, [Z

    .line 777
    .line 778
    move v8, v10

    .line 779
    :goto_13
    if-ge v8, v4, :cond_29

    .line 780
    .line 781
    aget-object v9, v6, v8

    .line 782
    .line 783
    add-int/lit8 v11, v8, -0x1

    .line 784
    .line 785
    aget-object v11, v6, v11

    .line 786
    .line 787
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/m;->u:[Ljava/lang/String;

    .line 788
    .line 789
    invoke-virtual {v9, v11, v2, v12, v1}, Landroidx/constraintlayout/motion/widget/q;->d(Landroidx/constraintlayout/motion/widget/q;[Z[Ljava/lang/String;Z)V

    .line 790
    .line 791
    .line 792
    add-int/lit8 v8, v8, 0x1

    .line 793
    .line 794
    goto :goto_13

    .line 795
    :cond_29
    move v8, v5

    .line 796
    move v1, v10

    .line 797
    :goto_14
    if-ge v1, v7, :cond_2b

    .line 798
    .line 799
    aget-boolean v9, v2, v1

    .line 800
    .line 801
    if-eqz v9, :cond_2a

    .line 802
    .line 803
    add-int/lit8 v8, v8, 0x1

    .line 804
    .line 805
    :cond_2a
    add-int/lit8 v1, v1, 0x1

    .line 806
    .line 807
    goto :goto_14

    .line 808
    :cond_2b
    new-array v1, v8, [I

    .line 809
    .line 810
    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 811
    .line 812
    const/4 v1, 0x2

    .line 813
    invoke-static {v1, v8}, Ljava/lang/Math;->max(II)I

    .line 814
    .line 815
    .line 816
    move-result v8

    .line 817
    new-array v9, v8, [D

    .line 818
    .line 819
    iput-object v9, v0, Landroidx/constraintlayout/motion/widget/m;->s:[D

    .line 820
    .line 821
    new-array v8, v8, [D

    .line 822
    .line 823
    iput-object v8, v0, Landroidx/constraintlayout/motion/widget/m;->t:[D

    .line 824
    .line 825
    move v9, v5

    .line 826
    move v8, v10

    .line 827
    :goto_15
    if-ge v8, v7, :cond_2d

    .line 828
    .line 829
    aget-boolean v11, v2, v8

    .line 830
    .line 831
    if-eqz v11, :cond_2c

    .line 832
    .line 833
    iget-object v11, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 834
    .line 835
    add-int/lit8 v12, v9, 0x1

    .line 836
    .line 837
    aput v8, v11, v9

    .line 838
    .line 839
    move v9, v12

    .line 840
    :cond_2c
    add-int/lit8 v8, v8, 0x1

    .line 841
    .line 842
    goto :goto_15

    .line 843
    :cond_2d
    iget-object v2, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 844
    .line 845
    array-length v2, v2

    .line 846
    new-array v7, v1, [I

    .line 847
    .line 848
    aput v2, v7, v10

    .line 849
    .line 850
    aput v4, v7, v5

    .line 851
    .line 852
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 853
    .line 854
    invoke-static {v2, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 855
    .line 856
    .line 857
    move-result-object v2

    .line 858
    check-cast v2, [[D

    .line 859
    .line 860
    new-array v7, v4, [D

    .line 861
    .line 862
    move v8, v5

    .line 863
    :goto_16
    if-ge v8, v4, :cond_2e

    .line 864
    .line 865
    aget-object v9, v6, v8

    .line 866
    .line 867
    aget-object v11, v2, v8

    .line 868
    .line 869
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 870
    .line 871
    invoke-virtual {v9, v11, v12}, Landroidx/constraintlayout/motion/widget/q;->e([D[I)V

    .line 872
    .line 873
    .line 874
    aget-object v9, v6, v8

    .line 875
    .line 876
    iget v9, v9, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 877
    .line 878
    float-to-double v11, v9

    .line 879
    aput-wide v11, v7, v8

    .line 880
    .line 881
    add-int/lit8 v8, v8, 0x1

    .line 882
    .line 883
    goto :goto_16

    .line 884
    :cond_2e
    move v8, v5

    .line 885
    :goto_17
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 886
    .line 887
    array-length v11, v9

    .line 888
    if-ge v8, v11, :cond_30

    .line 889
    .line 890
    aget v9, v9, v8

    .line 891
    .line 892
    sget-object v11, Landroidx/constraintlayout/motion/widget/q;->y:[Ljava/lang/String;

    .line 893
    .line 894
    array-length v11, v11

    .line 895
    if-ge v9, v11, :cond_2f

    .line 896
    .line 897
    new-instance v9, Ljava/lang/StringBuilder;

    .line 898
    .line 899
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 900
    .line 901
    .line 902
    sget-object v11, Landroidx/constraintlayout/motion/widget/q;->y:[Ljava/lang/String;

    .line 903
    .line 904
    iget-object v12, v0, Landroidx/constraintlayout/motion/widget/m;->r:[I

    .line 905
    .line 906
    aget v12, v12, v8

    .line 907
    .line 908
    aget-object v11, v11, v12

    .line 909
    .line 910
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 911
    .line 912
    .line 913
    const-string v11, " ["

    .line 914
    .line 915
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 916
    .line 917
    .line 918
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 919
    .line 920
    .line 921
    move-result-object v9

    .line 922
    move v11, v5

    .line 923
    :goto_18
    if-ge v11, v4, :cond_2f

    .line 924
    .line 925
    new-instance v12, Ljava/lang/StringBuilder;

    .line 926
    .line 927
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 928
    .line 929
    .line 930
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 931
    .line 932
    .line 933
    aget-object v9, v2, v11

    .line 934
    .line 935
    aget-wide v13, v9, v8

    .line 936
    .line 937
    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 938
    .line 939
    .line 940
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 941
    .line 942
    .line 943
    move-result-object v9

    .line 944
    add-int/lit8 v11, v11, 0x1

    .line 945
    .line 946
    goto :goto_18

    .line 947
    :cond_2f
    add-int/lit8 v8, v8, 0x1

    .line 948
    .line 949
    goto :goto_17

    .line 950
    :cond_30
    iget-object v8, v0, Landroidx/constraintlayout/motion/widget/m;->u:[Ljava/lang/String;

    .line 951
    .line 952
    array-length v8, v8

    .line 953
    add-int/2addr v8, v10

    .line 954
    new-array v8, v8, [Lr/b;

    .line 955
    .line 956
    iput-object v8, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 957
    .line 958
    move v8, v5

    .line 959
    :goto_19
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/m;->u:[Ljava/lang/String;

    .line 960
    .line 961
    array-length v11, v9

    .line 962
    if-ge v8, v11, :cond_34

    .line 963
    .line 964
    aget-object v9, v9, v8

    .line 965
    .line 966
    move v11, v5

    .line 967
    move v13, v11

    .line 968
    const/4 v12, 0x0

    .line 969
    const/4 v14, 0x0

    .line 970
    :goto_1a
    if-ge v11, v4, :cond_33

    .line 971
    .line 972
    aget-object v15, v6, v11

    .line 973
    .line 974
    invoke-virtual {v15, v9}, Landroidx/constraintlayout/motion/widget/q;->m(Ljava/lang/String;)Z

    .line 975
    .line 976
    .line 977
    move-result v15

    .line 978
    if-eqz v15, :cond_32

    .line 979
    .line 980
    if-nez v14, :cond_31

    .line 981
    .line 982
    new-array v12, v4, [D

    .line 983
    .line 984
    aget-object v14, v6, v11

    .line 985
    .line 986
    invoke-virtual {v14, v9}, Landroidx/constraintlayout/motion/widget/q;->j(Ljava/lang/String;)I

    .line 987
    .line 988
    .line 989
    move-result v14

    .line 990
    new-array v15, v1, [I

    .line 991
    .line 992
    aput v14, v15, v10

    .line 993
    .line 994
    aput v4, v15, v5

    .line 995
    .line 996
    sget-object v14, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 997
    .line 998
    invoke-static {v14, v15}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 999
    .line 1000
    .line 1001
    move-result-object v14

    .line 1002
    check-cast v14, [[D

    .line 1003
    .line 1004
    :cond_31
    aget-object v15, v6, v11

    .line 1005
    .line 1006
    move/from16 p1, v10

    .line 1007
    .line 1008
    iget v10, v15, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 1009
    .line 1010
    move-object/from16 p4, v2

    .line 1011
    .line 1012
    float-to-double v1, v10

    .line 1013
    aput-wide v1, v12, v13

    .line 1014
    .line 1015
    aget-object v1, v14, v13

    .line 1016
    .line 1017
    invoke-virtual {v15, v9, v1, v5}, Landroidx/constraintlayout/motion/widget/q;->i(Ljava/lang/String;[DI)I

    .line 1018
    .line 1019
    .line 1020
    add-int/lit8 v13, v13, 0x1

    .line 1021
    .line 1022
    goto :goto_1b

    .line 1023
    :cond_32
    move-object/from16 p4, v2

    .line 1024
    .line 1025
    move/from16 p1, v10

    .line 1026
    .line 1027
    :goto_1b
    add-int/lit8 v11, v11, 0x1

    .line 1028
    .line 1029
    move/from16 v10, p1

    .line 1030
    .line 1031
    move-object/from16 v2, p4

    .line 1032
    .line 1033
    const/4 v1, 0x2

    .line 1034
    goto :goto_1a

    .line 1035
    :cond_33
    move-object/from16 p4, v2

    .line 1036
    .line 1037
    move/from16 p1, v10

    .line 1038
    .line 1039
    invoke-static {v12, v13}, Ljava/util/Arrays;->copyOf([DI)[D

    .line 1040
    .line 1041
    .line 1042
    move-result-object v1

    .line 1043
    invoke-static {v14, v13}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 1044
    .line 1045
    .line 1046
    move-result-object v2

    .line 1047
    check-cast v2, [[D

    .line 1048
    .line 1049
    iget-object v9, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 1050
    .line 1051
    add-int/lit8 v8, v8, 0x1

    .line 1052
    .line 1053
    iget v10, v0, Landroidx/constraintlayout/motion/widget/m;->f:I

    .line 1054
    .line 1055
    invoke-static {v10, v1, v2}, Lr/b;->a(I[D[[D)Lr/b;

    .line 1056
    .line 1057
    .line 1058
    move-result-object v1

    .line 1059
    aput-object v1, v9, v8

    .line 1060
    .line 1061
    move/from16 v10, p1

    .line 1062
    .line 1063
    move-object/from16 v2, p4

    .line 1064
    .line 1065
    const/4 v1, 0x2

    .line 1066
    goto :goto_19

    .line 1067
    :cond_34
    move-object/from16 p4, v2

    .line 1068
    .line 1069
    move/from16 p1, v10

    .line 1070
    .line 1071
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->k:[Lr/b;

    .line 1072
    .line 1073
    iget v2, v0, Landroidx/constraintlayout/motion/widget/m;->f:I

    .line 1074
    .line 1075
    move-object/from16 v8, p4

    .line 1076
    .line 1077
    invoke-static {v2, v7, v8}, Lr/b;->a(I[D[[D)Lr/b;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v2

    .line 1081
    aput-object v2, v1, v5

    .line 1082
    .line 1083
    aget-object v1, v6, v5

    .line 1084
    .line 1085
    iget v1, v1, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 1086
    .line 1087
    sget v2, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 1088
    .line 1089
    if-eq v1, v2, :cond_36

    .line 1090
    .line 1091
    new-array v1, v4, [I

    .line 1092
    .line 1093
    new-array v2, v4, [D

    .line 1094
    .line 1095
    const/4 v7, 0x2

    .line 1096
    new-array v8, v7, [I

    .line 1097
    .line 1098
    aput v7, v8, p1

    .line 1099
    .line 1100
    aput v4, v8, v5

    .line 1101
    .line 1102
    sget-object v7, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 1103
    .line 1104
    invoke-static {v7, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 1105
    .line 1106
    .line 1107
    move-result-object v7

    .line 1108
    check-cast v7, [[D

    .line 1109
    .line 1110
    move v8, v5

    .line 1111
    :goto_1c
    if-ge v8, v4, :cond_35

    .line 1112
    .line 1113
    aget-object v9, v6, v8

    .line 1114
    .line 1115
    iget v10, v9, Landroidx/constraintlayout/motion/widget/q;->q:I

    .line 1116
    .line 1117
    aput v10, v1, v8

    .line 1118
    .line 1119
    iget v10, v9, Landroidx/constraintlayout/motion/widget/q;->i:F

    .line 1120
    .line 1121
    float-to-double v10, v10

    .line 1122
    aput-wide v10, v2, v8

    .line 1123
    .line 1124
    aget-object v10, v7, v8

    .line 1125
    .line 1126
    iget v11, v9, Landroidx/constraintlayout/motion/widget/q;->k:F

    .line 1127
    .line 1128
    float-to-double v11, v11

    .line 1129
    aput-wide v11, v10, v5

    .line 1130
    .line 1131
    iget v9, v9, Landroidx/constraintlayout/motion/widget/q;->l:F

    .line 1132
    .line 1133
    float-to-double v11, v9

    .line 1134
    aput-wide v11, v10, p1

    .line 1135
    .line 1136
    add-int/lit8 v8, v8, 0x1

    .line 1137
    .line 1138
    goto :goto_1c

    .line 1139
    :cond_35
    invoke-static {v1, v2, v7}, Lr/b;->b([I[D[[D)Lr/b;

    .line 1140
    .line 1141
    .line 1142
    move-result-object v1

    .line 1143
    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->l:Lr/b;

    .line 1144
    .line 1145
    :cond_36
    new-instance v1, Ljava/util/HashMap;

    .line 1146
    .line 1147
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1148
    .line 1149
    .line 1150
    iput-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->D:Ljava/util/HashMap;

    .line 1151
    .line 1152
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 1153
    .line 1154
    if-eqz v1, :cond_3c

    .line 1155
    .line 1156
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 1157
    .line 1158
    .line 1159
    move-result-object v1

    .line 1160
    const/high16 v2, 0x7fc00000    # Float.NaN

    .line 1161
    .line 1162
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 1163
    .line 1164
    .line 1165
    move-result v3

    .line 1166
    if-eqz v3, :cond_39

    .line 1167
    .line 1168
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1169
    .line 1170
    .line 1171
    move-result-object v3

    .line 1172
    check-cast v3, Ljava/lang/String;

    .line 1173
    .line 1174
    invoke-static {v3}, Lv/b;->h(Ljava/lang/String;)Lv/b;

    .line 1175
    .line 1176
    .line 1177
    move-result-object v4

    .line 1178
    if-nez v4, :cond_37

    .line 1179
    .line 1180
    goto :goto_1d

    .line 1181
    :cond_37
    invoke-virtual {v4}, Lr/e;->g()Z

    .line 1182
    .line 1183
    .line 1184
    move-result v5

    .line 1185
    if-eqz v5, :cond_38

    .line 1186
    .line 1187
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    .line 1188
    .line 1189
    .line 1190
    move-result v5

    .line 1191
    if-eqz v5, :cond_38

    .line 1192
    .line 1193
    invoke-direct {v0}, Landroidx/constraintlayout/motion/widget/m;->n()F

    .line 1194
    .line 1195
    .line 1196
    move-result v2

    .line 1197
    :cond_38
    invoke-virtual {v4, v3}, Lr/e;->e(Ljava/lang/String;)V

    .line 1198
    .line 1199
    .line 1200
    iget-object v5, v0, Landroidx/constraintlayout/motion/widget/m;->D:Ljava/util/HashMap;

    .line 1201
    .line 1202
    invoke-virtual {v5, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1203
    .line 1204
    .line 1205
    goto :goto_1d

    .line 1206
    :cond_39
    iget-object v1, v0, Landroidx/constraintlayout/motion/widget/m;->A:Ljava/util/ArrayList;

    .line 1207
    .line 1208
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1209
    .line 1210
    .line 1211
    move-result-object v1

    .line 1212
    :cond_3a
    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 1213
    .line 1214
    .line 1215
    move-result v3

    .line 1216
    if-eqz v3, :cond_3b

    .line 1217
    .line 1218
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1219
    .line 1220
    .line 1221
    move-result-object v3

    .line 1222
    check-cast v3, Landroidx/constraintlayout/motion/widget/d;

    .line 1223
    .line 1224
    instance-of v4, v3, Landroidx/constraintlayout/motion/widget/f;

    .line 1225
    .line 1226
    if-eqz v4, :cond_3a

    .line 1227
    .line 1228
    check-cast v3, Landroidx/constraintlayout/motion/widget/f;

    .line 1229
    .line 1230
    iget-object v4, v0, Landroidx/constraintlayout/motion/widget/m;->D:Ljava/util/HashMap;

    .line 1231
    .line 1232
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/motion/widget/f;->T(Ljava/util/HashMap;)V

    .line 1233
    .line 1234
    .line 1235
    goto :goto_1e

    .line 1236
    :cond_3b
    iget-object v0, v0, Landroidx/constraintlayout/motion/widget/m;->D:Ljava/util/HashMap;

    .line 1237
    .line 1238
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 1239
    .line 1240
    .line 1241
    move-result-object v0

    .line 1242
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 1243
    .line 1244
    .line 1245
    move-result-object v0

    .line 1246
    :goto_1f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1247
    .line 1248
    .line 1249
    move-result v1

    .line 1250
    if-eqz v1, :cond_3c

    .line 1251
    .line 1252
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1253
    .line 1254
    .line 1255
    move-result-object v1

    .line 1256
    check-cast v1, Lv/b;

    .line 1257
    .line 1258
    invoke-virtual {v1, v2}, Lr/e;->f(F)V

    .line 1259
    .line 1260
    .line 1261
    goto :goto_1f

    .line 1262
    :cond_3c
    return-void
.end method
