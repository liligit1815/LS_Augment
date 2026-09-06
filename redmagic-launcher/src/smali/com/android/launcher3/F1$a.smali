.class final Lcom/android/launcher3/F1$a;
.super Lcom/android/launcher3/r4$a;
.source "InvariantDeviceProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/F1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field public final b:Lcom/android/launcher3/F1$b;

.field private final c:F

.field private final d:F

.field private final e:Z

.field private final f:[Landroid/graphics/PointF;

.field private final g:[Landroid/graphics/PointF;

.field private final h:[F

.field private final i:[F

.field private final j:[F

.field private final k:[F

.field private final l:[F

.field private final m:[Landroid/graphics/PointF;

.field private final n:[F

.field private final o:[F

.field private final p:[Landroid/graphics/PointF;

.field private final q:[F

.field private final r:[Z


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 121
    invoke-direct {p0, v0}, Lcom/android/launcher3/F1$a;-><init>(Lcom/android/launcher3/F1$b;)V

    return-void
.end method

.method constructor <init>(Lcom/android/launcher3/F1$b;)V
    .locals 5

    .line 122
    invoke-direct {p0}, Lcom/android/launcher3/r4$a;-><init>()V

    const/4 v0, 0x4

    .line 123
    new-array v1, v0, [Landroid/graphics/PointF;

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->f:[Landroid/graphics/PointF;

    .line 124
    new-array v1, v0, [Landroid/graphics/PointF;

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->g:[Landroid/graphics/PointF;

    .line 125
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->h:[F

    .line 126
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->i:[F

    .line 127
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->j:[F

    .line 128
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->k:[F

    .line 129
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->l:[F

    .line 130
    new-array v1, v0, [Landroid/graphics/PointF;

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->m:[Landroid/graphics/PointF;

    .line 131
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->n:[F

    .line 132
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->o:[F

    .line 133
    new-array v1, v0, [Landroid/graphics/PointF;

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->p:[Landroid/graphics/PointF;

    .line 134
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->q:[F

    .line 135
    new-array v1, v0, [Z

    iput-object v1, p0, Lcom/android/launcher3/F1$a;->r:[Z

    .line 136
    iput-object p1, p0, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    const/4 p1, 0x0

    .line 137
    iput p1, p0, Lcom/android/launcher3/F1$a;->c:F

    .line 138
    iput p1, p0, Lcom/android/launcher3/F1$a;->d:F

    const/4 v1, 0x0

    .line 139
    iput-boolean v1, p0, Lcom/android/launcher3/F1$a;->e:Z

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 140
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->k:[F

    aput p1, v3, v2

    .line 141
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->l:[F

    aput p1, v3, v2

    .line 142
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->g:[Landroid/graphics/PointF;

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4}, Landroid/graphics/PointF;-><init>()V

    aput-object v4, v3, v2

    .line 143
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->f:[Landroid/graphics/PointF;

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4}, Landroid/graphics/PointF;-><init>()V

    aput-object v4, v3, v2

    .line 144
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->m:[Landroid/graphics/PointF;

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4}, Landroid/graphics/PointF;-><init>()V

    aput-object v4, v3, v2

    .line 145
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->n:[F

    aput p1, v3, v2

    .line 146
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->o:[F

    aput p1, v3, v2

    .line 147
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->p:[Landroid/graphics/PointF;

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4}, Landroid/graphics/PointF;-><init>()V

    aput-object v4, v3, v2

    .line 148
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->q:[F

    aput p1, v3, v2

    .line 149
    iget-object v3, p0, Lcom/android/launcher3/F1$a;->r:[Z

    aput-boolean v1, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method constructor <init>(Lcom/android/launcher3/F1$b;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 23

    move-object/from16 v0, p0

    .line 1
    invoke-direct {v0}, Lcom/android/launcher3/r4$a;-><init>()V

    const/4 v1, 0x4

    .line 2
    new-array v2, v1, [Landroid/graphics/PointF;

    iput-object v2, v0, Lcom/android/launcher3/F1$a;->f:[Landroid/graphics/PointF;

    .line 3
    new-array v3, v1, [Landroid/graphics/PointF;

    iput-object v3, v0, Lcom/android/launcher3/F1$a;->g:[Landroid/graphics/PointF;

    .line 4
    new-array v4, v1, [F

    iput-object v4, v0, Lcom/android/launcher3/F1$a;->h:[F

    .line 5
    new-array v5, v1, [F

    iput-object v5, v0, Lcom/android/launcher3/F1$a;->i:[F

    .line 6
    new-array v6, v1, [F

    iput-object v6, v0, Lcom/android/launcher3/F1$a;->j:[F

    .line 7
    new-array v7, v1, [F

    iput-object v7, v0, Lcom/android/launcher3/F1$a;->k:[F

    .line 8
    new-array v8, v1, [F

    iput-object v8, v0, Lcom/android/launcher3/F1$a;->l:[F

    .line 9
    new-array v9, v1, [Landroid/graphics/PointF;

    iput-object v9, v0, Lcom/android/launcher3/F1$a;->m:[Landroid/graphics/PointF;

    .line 10
    new-array v10, v1, [F

    iput-object v10, v0, Lcom/android/launcher3/F1$a;->n:[F

    .line 11
    new-array v11, v1, [F

    iput-object v11, v0, Lcom/android/launcher3/F1$a;->o:[F

    .line 12
    new-array v12, v1, [Landroid/graphics/PointF;

    iput-object v12, v0, Lcom/android/launcher3/F1$a;->p:[Landroid/graphics/PointF;

    .line 13
    new-array v13, v1, [F

    iput-object v13, v0, Lcom/android/launcher3/F1$a;->q:[F

    .line 14
    new-array v14, v1, [Z

    iput-object v14, v0, Lcom/android/launcher3/F1$a;->r:[Z

    move-object/from16 v15, p1

    .line 15
    iput-object v15, v0, Lcom/android/launcher3/F1$a;->b:Lcom/android/launcher3/F1$b;

    .line 16
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    .line 17
    sget-object v1, Lcom/android/launcher3/x5;->q2:[I

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    const/16 v2, 0x45

    const/4 v3, 0x0

    .line 18
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v0, Lcom/android/launcher3/F1$a;->c:F

    const/16 v2, 0x44

    .line 19
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, v0, Lcom/android/launcher3/F1$a;->d:F

    const/16 v2, 0x27

    const/4 v3, 0x0

    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, v0, Lcom/android/launcher3/F1$a;->e:Z

    const/16 v0, 0x40

    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    move/from16 p2, v3

    const/16 v3, 0x3c

    .line 22
    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 23
    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v2, v16, p2

    const/16 v0, 0x41

    .line 24
    iget v2, v2, Landroid/graphics/PointF;->x:F

    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 25
    aget-object v2, v16, p2

    iget v2, v2, Landroid/graphics/PointF;->y:F

    const/16 v3, 0x3d

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    .line 26
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v0, 0x1

    aput-object v3, v16, v0

    .line 27
    aget-object v2, v16, p2

    iget v2, v2, Landroid/graphics/PointF;->x:F

    const/16 v3, 0x43

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    .line 28
    aget-object v3, v16, p2

    iget v3, v3, Landroid/graphics/PointF;->y:F

    move/from16 p0, v0

    const/16 v0, 0x3f

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 29
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v2, v0}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v0, 0x2

    aput-object v3, v16, v0

    .line 30
    aget-object v2, v16, p2

    iget v2, v2, Landroid/graphics/PointF;->x:F

    const/16 v3, 0x42

    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    .line 31
    aget-object v3, v16, p2

    iget v3, v3, Landroid/graphics/PointF;->y:F

    move/from16 p3, v0

    const/16 v0, 0x3e

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 32
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v2, v0}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v0, 0x3

    aput-object v3, v16, v0

    const/16 v2, 0x1b

    const/4 v3, 0x0

    .line 33
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    const/16 v3, 0x1d

    .line 34
    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    move/from16 v18, v0

    const/16 v0, 0x23

    .line 35
    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    move-object/from16 v19, v4

    const/16 v4, 0x20

    .line 36
    invoke-virtual {v1, v4, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    move-object/from16 v20, v5

    const/16 v5, 0x1c

    .line 37
    invoke-virtual {v1, v5, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    move-object/from16 v21, v6

    const/16 v6, 0x26

    .line 38
    invoke-virtual {v1, v6, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v6

    move-object/from16 v22, v7

    .line 39
    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v7, v17, p2

    const/16 v5, 0x1e

    .line 40
    invoke-virtual {v1, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    const/16 v6, 0x1f

    .line 41
    invoke-virtual {v1, v6, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 42
    new-instance v6, Landroid/graphics/PointF;

    invoke-direct {v6, v5, v3}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v6, v17, p0

    const/16 v3, 0x24

    .line 43
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    const/16 v5, 0x25

    .line 44
    invoke-virtual {v1, v5, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 45
    new-instance v5, Landroid/graphics/PointF;

    invoke-direct {v5, v3, v0}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v5, v17, p3

    const/16 v0, 0x21

    .line 46
    invoke-virtual {v1, v0, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v3, 0x22

    .line 47
    invoke-virtual {v1, v3, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 48
    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v4, v17, v18

    .line 49
    aget-object v0, v16, p2

    iget v0, v0, Landroid/graphics/PointF;->x:F

    const/16 v3, 0x10

    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 50
    aget-object v3, v16, p2

    iget v3, v3, Landroid/graphics/PointF;->y:F

    const/16 v4, 0xc

    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 51
    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v4, v9, p2

    const/16 v0, 0x11

    .line 52
    iget v3, v4, Landroid/graphics/PointF;->x:F

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 53
    aget-object v3, v9, p2

    iget v3, v3, Landroid/graphics/PointF;->y:F

    const/16 v4, 0xd

    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 54
    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v4, v9, p0

    .line 55
    aget-object v0, v9, p2

    iget v0, v0, Landroid/graphics/PointF;->x:F

    const/16 v3, 0x13

    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 56
    aget-object v3, v9, p2

    iget v3, v3, Landroid/graphics/PointF;->y:F

    const/16 v4, 0xf

    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 57
    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v4, v9, p3

    .line 58
    aget-object v0, v9, p2

    iget v0, v0, Landroid/graphics/PointF;->x:F

    const/16 v3, 0x12

    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 59
    aget-object v3, v9, p2

    iget v3, v3, Landroid/graphics/PointF;->y:F

    const/16 v4, 0xe

    invoke-virtual {v1, v4, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 60
    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v4, v9, v18

    move/from16 v0, p2

    .line 61
    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    move/from16 v3, p3

    .line 62
    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    const/16 v3, 0x8

    .line 63
    invoke-virtual {v1, v3, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    const/4 v5, 0x5

    .line 64
    invoke-virtual {v1, v5, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    move/from16 v6, p0

    .line 65
    invoke-virtual {v1, v6, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v7

    const/16 v9, 0xb

    .line 66
    invoke-virtual {v1, v9, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    .line 67
    new-instance v9, Landroid/graphics/PointF;

    invoke-direct {v9, v7, v2}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v9, v12, v0

    move/from16 v0, v18

    .line 68
    invoke-virtual {v1, v0, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    const/4 v0, 0x4

    .line 69
    invoke-virtual {v1, v0, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 70
    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v2, v0}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v4, v12, v6

    const/16 v0, 0x9

    .line 71
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v2, 0xa

    .line 72
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    .line 73
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v0, 0x2

    aput-object v3, v12, v0

    const/4 v0, 0x6

    .line 74
    invoke-virtual {v1, v0, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v2, 0x7

    .line 75
    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    .line 76
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    const/16 v18, 0x3

    aput-object v3, v12, v18

    const/16 v0, 0x34

    const/4 v2, 0x0

    .line 77
    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v2, 0x0

    aput v0, v22, v2

    const/16 v3, 0x35

    .line 78
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v6, 0x1

    aput v0, v22, v6

    const/16 v0, 0x37

    .line 79
    aget v3, v22, v2

    .line 80
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v22, v3

    const/16 v0, 0x36

    .line 81
    aget v3, v22, v2

    .line 82
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v18, 0x3

    aput v0, v22, v18

    const/16 v0, 0x14

    .line 83
    aget v3, v22, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v10, v2

    const/16 v3, 0x15

    .line 84
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v6, 0x1

    aput v0, v10, v6

    const/16 v0, 0x17

    .line 85
    aget v3, v10, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v10, v3

    const/16 v0, 0x16

    .line 86
    aget v3, v10, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v18, 0x3

    aput v0, v10, v18

    const/16 v0, 0x38

    const/4 v3, 0x0

    .line 87
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v8, v2

    const/16 v3, 0x39

    .line 88
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v6, 0x1

    aput v0, v8, v6

    const/16 v0, 0x3b

    .line 89
    aget v3, v8, v2

    .line 90
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v8, v3

    const/16 v0, 0x3a

    .line 91
    aget v3, v8, v2

    .line 92
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v18, 0x3

    aput v0, v8, v18

    const/16 v0, 0x18

    .line 93
    aget v3, v8, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v11, v2

    const/4 v6, 0x1

    .line 94
    aput v0, v11, v6

    const/16 v3, 0x1a

    .line 95
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v11, v3

    const/16 v0, 0x19

    .line 96
    aget v3, v11, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v18, 0x3

    aput v0, v11, v18

    const/16 v0, 0x28

    const/4 v3, 0x0

    .line 97
    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v19, v2

    const/16 v3, 0x29

    .line 98
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v6, 0x1

    aput v0, v19, v6

    const/16 v0, 0x2a

    .line 99
    aget v3, v19, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v19, v18

    const/16 v0, 0x2b

    .line 100
    aget v3, v19, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v19, v3

    const v0, 0x7f070492

    .line 101
    invoke-static {v15, v0}, LA/h;->g(Landroid/content/res/Resources;I)F

    move-result v0

    const/16 v3, 0x2c

    .line 102
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v20, v2

    const/16 v3, 0x2d

    .line 103
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v6, 0x1

    aput v0, v20, v6

    const/16 v0, 0x2e

    .line 104
    aget v3, v20, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v18, 0x3

    aput v0, v20, v18

    const/16 v0, 0x2f

    .line 105
    aget v3, v20, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v20, v3

    const v0, 0x7f070496

    .line 106
    invoke-static {v15, v0}, LA/h;->g(Landroid/content/res/Resources;I)F

    move-result v0

    const/16 v3, 0x30

    .line 107
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v21, v2

    const/16 v3, 0x31

    .line 108
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v6, 0x1

    aput v0, v21, v6

    const/16 v0, 0x32

    .line 109
    aget v3, v21, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v18, 0x3

    aput v0, v21, v18

    const/16 v0, 0x33

    .line 110
    aget v3, v21, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v21, v3

    const v0, 0x7f070b9a

    .line 111
    invoke-static {v15, v0}, LA/h;->g(Landroid/content/res/Resources;I)F

    move-result v0

    const/16 v3, 0x4b

    .line 112
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    aput v0, v13, v2

    const/16 v3, 0x4c

    .line 113
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v6, 0x1

    aput v0, v13, v6

    const/16 v0, 0x4d

    .line 114
    aget v3, v13, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/16 v18, 0x3

    aput v0, v13, v18

    const/16 v0, 0x4e

    .line 115
    aget v3, v13, v2

    invoke-virtual {v1, v0, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    const/4 v3, 0x2

    aput v0, v13, v3

    const/16 v0, 0x47

    .line 116
    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    aput-boolean v0, v14, v2

    const/16 v3, 0x48

    .line 117
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    const/4 v6, 0x1

    aput-boolean v0, v14, v6

    const/16 v3, 0x49

    .line 118
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    const/16 v18, 0x3

    aput-boolean v0, v14, v18

    const/16 v0, 0x4a

    .line 119
    aget-boolean v2, v14, v2

    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    const/4 v3, 0x2

    aput-boolean v0, v14, v3

    .line 120
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->p:[Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->m:[Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->n:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->o:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->g:[Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/F1$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/F1$a;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->h:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->i:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->j:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->k:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/F1$a;)[Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->f:[Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/F1$a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$a;->d:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/F1$a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$a;->c:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/F1$a;)[Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->r:[Z

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic q(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->l:[F

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic r(Lcom/android/launcher3/F1$a;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$a;->q:[F

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method s(Lcom/android/launcher3/F1$a;)Lcom/android/launcher3/F1$a;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x4

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->k:[F

    .line 6
    .line 7
    aget v2, v1, v0

    .line 8
    .line 9
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->k:[F

    .line 10
    .line 11
    aget v3, v3, v0

    .line 12
    .line 13
    add-float/2addr v2, v3

    .line 14
    aput v2, v1, v0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->l:[F

    .line 17
    .line 18
    aget v2, v1, v0

    .line 19
    .line 20
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->l:[F

    .line 21
    .line 22
    aget v3, v3, v0

    .line 23
    .line 24
    add-float/2addr v2, v3

    .line 25
    aput v2, v1, v0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->g:[Landroid/graphics/PointF;

    .line 28
    .line 29
    aget-object v1, v1, v0

    .line 30
    .line 31
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 32
    .line 33
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->g:[Landroid/graphics/PointF;

    .line 34
    .line 35
    aget-object v3, v3, v0

    .line 36
    .line 37
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 38
    .line 39
    add-float/2addr v2, v4

    .line 40
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 41
    .line 42
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 45
    .line 46
    add-float/2addr v2, v3

    .line 47
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->f:[Landroid/graphics/PointF;

    .line 50
    .line 51
    aget-object v1, v1, v0

    .line 52
    .line 53
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 54
    .line 55
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->f:[Landroid/graphics/PointF;

    .line 56
    .line 57
    aget-object v3, v3, v0

    .line 58
    .line 59
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 60
    .line 61
    add-float/2addr v2, v4

    .line 62
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 63
    .line 64
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 65
    .line 66
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 67
    .line 68
    add-float/2addr v2, v3

    .line 69
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 70
    .line 71
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->h:[F

    .line 72
    .line 73
    aget v2, v1, v0

    .line 74
    .line 75
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->h:[F

    .line 76
    .line 77
    aget v3, v3, v0

    .line 78
    .line 79
    add-float/2addr v2, v3

    .line 80
    aput v2, v1, v0

    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->i:[F

    .line 83
    .line 84
    aget v2, v1, v0

    .line 85
    .line 86
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->i:[F

    .line 87
    .line 88
    aget v3, v3, v0

    .line 89
    .line 90
    add-float/2addr v2, v3

    .line 91
    aput v2, v1, v0

    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->j:[F

    .line 94
    .line 95
    aget v2, v1, v0

    .line 96
    .line 97
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->j:[F

    .line 98
    .line 99
    aget v3, v3, v0

    .line 100
    .line 101
    add-float/2addr v2, v3

    .line 102
    aput v2, v1, v0

    .line 103
    .line 104
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->m:[Landroid/graphics/PointF;

    .line 105
    .line 106
    aget-object v1, v1, v0

    .line 107
    .line 108
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 109
    .line 110
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->m:[Landroid/graphics/PointF;

    .line 111
    .line 112
    aget-object v3, v3, v0

    .line 113
    .line 114
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 115
    .line 116
    add-float/2addr v2, v4

    .line 117
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 118
    .line 119
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 120
    .line 121
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 122
    .line 123
    add-float/2addr v2, v3

    .line 124
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 125
    .line 126
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->n:[F

    .line 127
    .line 128
    aget v2, v1, v0

    .line 129
    .line 130
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->n:[F

    .line 131
    .line 132
    aget v3, v3, v0

    .line 133
    .line 134
    add-float/2addr v2, v3

    .line 135
    aput v2, v1, v0

    .line 136
    .line 137
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->o:[F

    .line 138
    .line 139
    aget v2, v1, v0

    .line 140
    .line 141
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->o:[F

    .line 142
    .line 143
    aget v3, v3, v0

    .line 144
    .line 145
    add-float/2addr v2, v3

    .line 146
    aput v2, v1, v0

    .line 147
    .line 148
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->p:[Landroid/graphics/PointF;

    .line 149
    .line 150
    aget-object v1, v1, v0

    .line 151
    .line 152
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 153
    .line 154
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->p:[Landroid/graphics/PointF;

    .line 155
    .line 156
    aget-object v3, v3, v0

    .line 157
    .line 158
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 159
    .line 160
    add-float/2addr v2, v4

    .line 161
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 162
    .line 163
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 164
    .line 165
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 166
    .line 167
    add-float/2addr v2, v3

    .line 168
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 169
    .line 170
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->q:[F

    .line 171
    .line 172
    aget v2, v1, v0

    .line 173
    .line 174
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->q:[F

    .line 175
    .line 176
    aget v3, v3, v0

    .line 177
    .line 178
    add-float/2addr v2, v3

    .line 179
    aput v2, v1, v0

    .line 180
    .line 181
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->r:[Z

    .line 182
    .line 183
    aget-boolean v2, v1, v0

    .line 184
    .line 185
    iget-object v3, p1, Lcom/android/launcher3/F1$a;->r:[Z

    .line 186
    .line 187
    aget-boolean v3, v3, v0

    .line 188
    .line 189
    or-int/2addr v2, v3

    .line 190
    aput-boolean v2, v1, v0

    .line 191
    .line 192
    invoke-super {p0, p1}, Lcom/android/launcher3/r4$a;->a(Lcom/android/launcher3/r4$a;)Lcom/android/launcher3/r4$a;

    .line 193
    .line 194
    .line 195
    add-int/lit8 v0, v0, 0x1

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :cond_0
    return-object p0
.end method

.method t(F)Lcom/android/launcher3/F1$a;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x4

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->k:[F

    .line 6
    .line 7
    aget v2, v1, v0

    .line 8
    .line 9
    mul-float/2addr v2, p1

    .line 10
    aput v2, v1, v0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->l:[F

    .line 13
    .line 14
    aget v2, v1, v0

    .line 15
    .line 16
    mul-float/2addr v2, p1

    .line 17
    aput v2, v1, v0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->g:[Landroid/graphics/PointF;

    .line 20
    .line 21
    aget-object v1, v1, v0

    .line 22
    .line 23
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 24
    .line 25
    mul-float/2addr v2, p1

    .line 26
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 27
    .line 28
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 29
    .line 30
    mul-float/2addr v2, p1

    .line 31
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->f:[Landroid/graphics/PointF;

    .line 34
    .line 35
    aget-object v1, v1, v0

    .line 36
    .line 37
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 38
    .line 39
    mul-float/2addr v2, p1

    .line 40
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 41
    .line 42
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    mul-float/2addr v2, p1

    .line 45
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->h:[F

    .line 48
    .line 49
    aget v2, v1, v0

    .line 50
    .line 51
    mul-float/2addr v2, p1

    .line 52
    aput v2, v1, v0

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->i:[F

    .line 55
    .line 56
    aget v2, v1, v0

    .line 57
    .line 58
    mul-float/2addr v2, p1

    .line 59
    aput v2, v1, v0

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->j:[F

    .line 62
    .line 63
    aget v2, v1, v0

    .line 64
    .line 65
    mul-float/2addr v2, p1

    .line 66
    aput v2, v1, v0

    .line 67
    .line 68
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->m:[Landroid/graphics/PointF;

    .line 69
    .line 70
    aget-object v1, v1, v0

    .line 71
    .line 72
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 73
    .line 74
    mul-float/2addr v2, p1

    .line 75
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 76
    .line 77
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 78
    .line 79
    mul-float/2addr v2, p1

    .line 80
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->n:[F

    .line 83
    .line 84
    aget v2, v1, v0

    .line 85
    .line 86
    mul-float/2addr v2, p1

    .line 87
    aput v2, v1, v0

    .line 88
    .line 89
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->o:[F

    .line 90
    .line 91
    aget v2, v1, v0

    .line 92
    .line 93
    mul-float/2addr v2, p1

    .line 94
    aput v2, v1, v0

    .line 95
    .line 96
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->p:[Landroid/graphics/PointF;

    .line 97
    .line 98
    aget-object v1, v1, v0

    .line 99
    .line 100
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 101
    .line 102
    mul-float/2addr v2, p1

    .line 103
    iput v2, v1, Landroid/graphics/PointF;->x:F

    .line 104
    .line 105
    iget v2, v1, Landroid/graphics/PointF;->y:F

    .line 106
    .line 107
    mul-float/2addr v2, p1

    .line 108
    iput v2, v1, Landroid/graphics/PointF;->y:F

    .line 109
    .line 110
    iget-object v1, p0, Lcom/android/launcher3/F1$a;->q:[F

    .line 111
    .line 112
    aget v2, v1, v0

    .line 113
    .line 114
    mul-float/2addr v2, p1

    .line 115
    aput v2, v1, v0

    .line 116
    .line 117
    invoke-super {p0, p1}, Lcom/android/launcher3/r4$a;->b(F)Lcom/android/launcher3/r4$a;

    .line 118
    .line 119
    .line 120
    add-int/lit8 v0, v0, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_0
    return-object p0
.end method
