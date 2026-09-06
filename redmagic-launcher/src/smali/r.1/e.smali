.class public abstract Lr/e;
.super Ljava/lang/Object;
.source "KeyCycleOscillator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lr/e$c;,
        Lr/e$b;
    }
.end annotation


# instance fields
.field private a:Lr/b;

.field private b:Lr/e$b;

.field private c:Ljava/lang/String;

.field private d:I

.field private e:Ljava/lang/String;

.field public f:I

.field g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lr/e$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lr/e;->d:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lr/e;->e:Ljava/lang/String;

    .line 9
    .line 10
    iput v0, p0, Lr/e;->f:I

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lr/e;->g:Ljava/util/ArrayList;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(F)F
    .locals 0

    .line 1
    iget-object p0, p0, Lr/e;->b:Lr/e$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lr/e$b;->a(F)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    double-to-float p0, p0

    .line 8
    return p0
.end method

.method protected b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(IILjava/lang/String;IFFFF)V
    .locals 7

    .line 1
    iget-object v0, p0, Lr/e;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Lr/e$c;

    .line 4
    .line 5
    move v2, p1

    .line 6
    move v3, p5

    .line 7
    move v4, p6

    .line 8
    move v5, p7

    .line 9
    move v6, p8

    .line 10
    invoke-direct/range {v1 .. v6}, Lr/e$c;-><init>(IFFFF)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const/4 p1, -0x1

    .line 17
    if-eq p4, p1, :cond_0

    .line 18
    .line 19
    iput p4, p0, Lr/e;->f:I

    .line 20
    .line 21
    :cond_0
    iput p2, p0, Lr/e;->d:I

    .line 22
    .line 23
    iput-object p3, p0, Lr/e;->e:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public d(IILjava/lang/String;IFFFFLjava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lr/e;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Lr/e$c;

    .line 4
    .line 5
    move v2, p1

    .line 6
    move v3, p5

    .line 7
    move v4, p6

    .line 8
    move v5, p7

    .line 9
    move v6, p8

    .line 10
    invoke-direct/range {v1 .. v6}, Lr/e$c;-><init>(IFFFF)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const/4 p1, -0x1

    .line 17
    if-eq p4, p1, :cond_0

    .line 18
    .line 19
    iput p4, p0, Lr/e;->f:I

    .line 20
    .line 21
    :cond_0
    iput p2, p0, Lr/e;->d:I

    .line 22
    .line 23
    move-object/from16 p1, p9

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lr/e;->b(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iput-object p3, p0, Lr/e;->e:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lr/e;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public f(F)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lr/e;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v2, v0, Lr/e;->g:Ljava/util/ArrayList;

    .line 13
    .line 14
    new-instance v3, Lr/e$a;

    .line 15
    .line 16
    invoke-direct {v3, v0}, Lr/e$a;-><init>(Lr/e;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 20
    .line 21
    .line 22
    new-array v2, v1, [D

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    new-array v4, v3, [I

    .line 26
    .line 27
    const/4 v5, 0x1

    .line 28
    const/4 v6, 0x3

    .line 29
    aput v6, v4, v5

    .line 30
    .line 31
    const/4 v6, 0x0

    .line 32
    aput v1, v4, v6

    .line 33
    .line 34
    sget-object v7, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 35
    .line 36
    invoke-static {v7, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, [[D

    .line 41
    .line 42
    new-instance v7, Lr/e$b;

    .line 43
    .line 44
    iget v8, v0, Lr/e;->d:I

    .line 45
    .line 46
    iget-object v9, v0, Lr/e;->e:Ljava/lang/String;

    .line 47
    .line 48
    iget v10, v0, Lr/e;->f:I

    .line 49
    .line 50
    invoke-direct {v7, v8, v9, v10, v1}, Lr/e$b;-><init>(ILjava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    iput-object v7, v0, Lr/e;->b:Lr/e$b;

    .line 54
    .line 55
    iget-object v1, v0, Lr/e;->g:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    move v8, v6

    .line 62
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    if-eqz v7, :cond_1

    .line 67
    .line 68
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    check-cast v7, Lr/e$c;

    .line 73
    .line 74
    iget v10, v7, Lr/e$c;->d:F

    .line 75
    .line 76
    float-to-double v11, v10

    .line 77
    const-wide v13, 0x3f847ae147ae147bL    # 0.01

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    mul-double/2addr v11, v13

    .line 83
    aput-wide v11, v2, v8

    .line 84
    .line 85
    aget-object v9, v4, v8

    .line 86
    .line 87
    iget v13, v7, Lr/e$c;->b:F

    .line 88
    .line 89
    float-to-double v11, v13

    .line 90
    aput-wide v11, v9, v6

    .line 91
    .line 92
    iget v11, v7, Lr/e$c;->c:F

    .line 93
    .line 94
    float-to-double v14, v11

    .line 95
    aput-wide v14, v9, v5

    .line 96
    .line 97
    iget v12, v7, Lr/e$c;->e:F

    .line 98
    .line 99
    float-to-double v14, v12

    .line 100
    aput-wide v14, v9, v3

    .line 101
    .line 102
    iget-object v9, v0, Lr/e;->b:Lr/e$b;

    .line 103
    .line 104
    iget v7, v7, Lr/e$c;->a:I

    .line 105
    .line 106
    move-object/from16 v16, v9

    .line 107
    .line 108
    move v9, v7

    .line 109
    move-object/from16 v7, v16

    .line 110
    .line 111
    invoke-virtual/range {v7 .. v13}, Lr/e$b;->b(IIFFFF)V

    .line 112
    .line 113
    .line 114
    add-int/2addr v8, v5

    .line 115
    goto :goto_0

    .line 116
    :cond_1
    iget-object v1, v0, Lr/e;->b:Lr/e$b;

    .line 117
    .line 118
    move/from16 v3, p1

    .line 119
    .line 120
    invoke-virtual {v1, v3}, Lr/e$b;->c(F)V

    .line 121
    .line 122
    .line 123
    invoke-static {v6, v2, v4}, Lr/b;->a(I[D[[D)Lr/b;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iput-object v1, v0, Lr/e;->a:Lr/b;

    .line 128
    .line 129
    return-void
.end method

.method public g()Z
    .locals 1

    .line 1
    iget p0, p0, Lr/e;->f:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Lr/e;->c:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/text/DecimalFormat;

    .line 4
    .line 5
    const-string v2, "##.##"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lr/e;->g:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lr/e$c;

    .line 27
    .line 28
    new-instance v3, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, "["

    .line 37
    .line 38
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v0, v2, Lr/e$c;->a:I

    .line 42
    .line 43
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v0, " , "

    .line 47
    .line 48
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v0, v2, Lr/e$c;->b:F

    .line 52
    .line 53
    float-to-double v4, v0

    .line 54
    invoke-virtual {v1, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, "] "

    .line 62
    .line 63
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    return-object v0
.end method
