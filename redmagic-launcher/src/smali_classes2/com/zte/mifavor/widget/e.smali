.class public final Lcom/zte/mifavor/widget/e;
.super Ljava/util/GregorianCalendar;
.source "ChineseCalendar.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "WrongConstant"
    }
.end annotation


# static fields
.field private static final A:[[C

.field private static final B:[C

.field private static final C:[C

.field private static final o:[Ljava/lang/String;

.field private static final p:[Ljava/lang/String;

.field private static final q:[Ljava/lang/String;

.field private static final r:[Ljava/lang/String;

.field private static final s:[Ljava/lang/String;

.field private static final t:[Ljava/lang/String;

.field private static final u:[Ljava/lang/String;

.field private static final v:[Ljava/lang/String;

.field private static final w:[I

.field private static final x:[[C

.field private static final y:[[C

.field private static final z:[[C


# instance fields
.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:Z

.field private m:Z

.field private n:Z


# direct methods
.method static constructor <clinit>()V
    .locals 32

    .line 1
    const-string v6, "\u661f\u671f\u4e94"

    const-string v7, "\u661f\u671f\u516d"

    const-string v0, ""

    const-string v1, "\u661f\u671f\u65e5"

    const-string v2, "\u661f\u671f\u4e00"

    const-string v3, "\u661f\u671f\u4e8c"

    const-string v4, "\u661f\u671f\u4e09"

    const-string v5, "\u661f\u671f\u56db"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->o:[Ljava/lang/String;

    .line 2
    const-string v12, "\u5341\u4e00"

    const-string v13, "\u5341\u4e8c"

    const-string v1, ""

    const-string v2, "\u6b63"

    const-string v3, "\u4e8c"

    const-string v4, "\u4e09"

    const-string v5, "\u56db"

    const-string v6, "\u4e94"

    const-string v7, "\u516d"

    const-string v8, "\u4e03"

    const-string v9, "\u516b"

    const-string v10, "\u4e5d"

    const-string v11, "\u5341"

    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->p:[Ljava/lang/String;

    .line 3
    const-string v30, "\u5eff\u4e5d"

    const-string v31, "\u4e09\u5341"

    const-string v1, ""

    const-string v2, "\u521d\u4e00"

    const-string v3, "\u521d\u4e8c"

    const-string v4, "\u521d\u4e09"

    const-string v5, "\u521d\u56db"

    const-string v6, "\u521d\u4e94"

    const-string v7, "\u521d\u516d"

    const-string v8, "\u521d\u4e03"

    const-string v9, "\u521d\u516b"

    const-string v10, "\u521d\u4e5d"

    const-string v11, "\u521d\u5341"

    const-string v12, "\u5341\u4e00"

    const-string v13, "\u5341\u4e8c"

    const-string v14, "\u5341\u4e09"

    const-string v15, "\u5341\u56db"

    const-string v16, "\u5341\u4e94"

    const-string v17, "\u5341\u516d"

    const-string v18, "\u5341\u4e03"

    const-string v19, "\u5341\u516b"

    const-string v20, "\u5341\u4e5d"

    const-string v21, "\u4e8c\u5341"

    const-string v22, "\u5eff\u4e00"

    const-string v23, "\u5eff\u4e8c"

    const-string v24, "\u5eff\u4e09"

    const-string v25, "\u5eff\u56db"

    const-string v26, "\u5eff\u4e94"

    const-string v27, "\u5eff\u516d"

    const-string v28, "\u5eff\u4e03"

    const-string v29, "\u5eff\u516b"

    filled-new-array/range {v1 .. v31}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->q:[Ljava/lang/String;

    .line 4
    const-string v11, "\u5c0f\u96ea"

    const-string v12, "\u51ac\u81f3"

    const-string v1, "\u5927\u5bd2"

    const-string v2, "\u96e8\u6c34"

    const-string v3, "\u6625\u5206"

    const-string v4, "\u8c37\u96e8"

    const-string v5, "\u590f\u6ee1"

    const-string v6, "\u590f\u81f3"

    const-string v7, "\u5927\u6691"

    const-string v8, "\u5904\u6691"

    const-string v9, "\u79cb\u5206"

    const-string v10, "\u971c\u964d"

    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->r:[Ljava/lang/String;

    .line 5
    const-string v11, "\u7acb\u51ac"

    const-string v12, "\u5927\u96ea"

    const-string v1, "\u5c0f\u5bd2"

    const-string v2, "\u7acb\u6625"

    const-string v3, "\u60ca\u86f0"

    const-string v4, "\u6e05\u660e"

    const-string v5, "\u7acb\u590f"

    const-string v6, "\u8292\u79cd"

    const-string v7, "\u5c0f\u6691"

    const-string v8, "\u7acb\u79cb"

    const-string v9, "\u767d\u9732"

    const-string v10, "\u5bd2\u9732"

    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->s:[Ljava/lang/String;

    .line 6
    const-string v10, "\u58ec"

    const-string v11, "\u7678"

    const-string v1, ""

    const-string v2, "\u7532"

    const-string v3, "\u4e59"

    const-string v4, "\u4e19"

    const-string v5, "\u4e01"

    const-string v6, "\u620a"

    const-string v7, "\u5df1"

    const-string v8, "\u5e9a"

    const-string v9, "\u8f9b"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->t:[Ljava/lang/String;

    .line 7
    const-string v12, "\u620c"

    const-string v13, "\u4ea5"

    const-string v1, ""

    const-string v2, "\u5b50"

    const-string v3, "\u4e11"

    const-string v4, "\u5bc5"

    const-string v5, "\u536f"

    const-string v6, "\u8fb0"

    const-string v7, "\u5df3"

    const-string v8, "\u5348"

    const-string v9, "\u672a"

    const-string v10, "\u7533"

    const-string v11, "\u9149"

    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->u:[Ljava/lang/String;

    .line 8
    const-string v12, "\u72d7"

    const-string v13, "\u732a"

    const-string v1, ""

    const-string v2, "\u9f20"

    const-string v3, "\u725b"

    const-string v4, "\u864e"

    const-string v5, "\u5154"

    const-string v6, "\u9f99"

    const-string v7, "\u86c7"

    const-string v8, "\u9a6c"

    const-string v9, "\u7f8a"

    const-string v10, "\u7334"

    const-string v11, "\u9e21"

    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->v:[Ljava/lang/String;

    const/16 v0, 0x14

    .line 9
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/zte/mifavor/widget/e;->w:[I

    const/4 v0, 0x7

    const/16 v1, 0x1c

    .line 10
    new-array v2, v1, [C

    fill-array-data v2, :array_1

    new-array v3, v1, [C

    fill-array-data v3, :array_2

    const/16 v1, 0x1d

    new-array v4, v1, [C

    fill-array-data v4, :array_3

    new-array v5, v1, [C

    fill-array-data v5, :array_4

    new-array v6, v1, [C

    fill-array-data v6, :array_5

    const/16 v7, 0x21

    new-array v7, v7, [C

    fill-array-data v7, :array_6

    const/16 v14, 0x8

    new-array v8, v1, [C

    fill-array-data v8, :array_7

    const/16 v15, 0x9

    const/16 v9, 0x21

    new-array v9, v9, [C

    fill-array-data v9, :array_8

    new-array v10, v1, [C

    fill-array-data v10, :array_9

    new-array v11, v1, [C

    fill-array-data v11, :array_a

    new-array v12, v1, [C

    fill-array-data v12, :array_b

    new-array v13, v1, [C

    fill-array-data v13, :array_c

    filled-new-array/range {v2 .. v13}, [[C

    move-result-object v2

    sput-object v2, Lcom/zte/mifavor/widget/e;->x:[[C

    .line 11
    new-array v2, v15, [C

    fill-array-data v2, :array_d

    new-array v3, v15, [C

    fill-array-data v3, :array_e

    new-array v4, v15, [C

    fill-array-data v4, :array_f

    new-array v5, v15, [C

    fill-array-data v5, :array_10

    new-array v6, v15, [C

    fill-array-data v6, :array_11

    new-array v7, v15, [C

    fill-array-data v7, :array_12

    new-array v8, v15, [C

    fill-array-data v8, :array_13

    new-array v9, v15, [C

    fill-array-data v9, :array_14

    new-array v10, v15, [C

    fill-array-data v10, :array_15

    new-array v11, v15, [C

    fill-array-data v11, :array_16

    new-array v12, v15, [C

    fill-array-data v12, :array_17

    new-array v13, v15, [C

    fill-array-data v13, :array_18

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    move-object/from16 v22, v8

    move-object/from16 v23, v9

    move-object/from16 v24, v10

    move-object/from16 v25, v11

    move-object/from16 v26, v12

    move-object/from16 v27, v13

    filled-new-array/range {v16 .. v27}, [[C

    move-result-object v2

    sput-object v2, Lcom/zte/mifavor/widget/e;->y:[[C

    const/16 v2, 0x1c

    .line 12
    new-array v15, v2, [C

    fill-array-data v15, :array_19

    new-array v2, v2, [C

    fill-array-data v2, :array_1a

    new-array v3, v1, [C

    fill-array-data v3, :array_1b

    new-array v4, v1, [C

    fill-array-data v4, :array_1c

    new-array v5, v1, [C

    fill-array-data v5, :array_1d

    new-array v6, v1, [C

    fill-array-data v6, :array_1e

    new-array v7, v1, [C

    fill-array-data v7, :array_1f

    new-array v8, v1, [C

    fill-array-data v8, :array_20

    new-array v9, v1, [C

    fill-array-data v9, :array_21

    new-array v10, v1, [C

    fill-array-data v10, :array_22

    new-array v11, v1, [C

    fill-array-data v11, :array_23

    new-array v1, v1, [C

    fill-array-data v1, :array_24

    move-object/from16 v26, v1

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    move-object/from16 v22, v8

    move-object/from16 v23, v9

    move-object/from16 v24, v10

    move-object/from16 v25, v11

    filled-new-array/range {v15 .. v26}, [[C

    move-result-object v1

    sput-object v1, Lcom/zte/mifavor/widget/e;->z:[[C

    .line 13
    new-array v2, v0, [C

    fill-array-data v2, :array_25

    new-array v3, v0, [C

    fill-array-data v3, :array_26

    new-array v4, v14, [C

    fill-array-data v4, :array_27

    new-array v5, v14, [C

    fill-array-data v5, :array_28

    new-array v6, v14, [C

    fill-array-data v6, :array_29

    new-array v7, v14, [C

    fill-array-data v7, :array_2a

    new-array v8, v14, [C

    fill-array-data v8, :array_2b

    new-array v9, v14, [C

    fill-array-data v9, :array_2c

    new-array v10, v14, [C

    fill-array-data v10, :array_2d

    new-array v11, v14, [C

    fill-array-data v11, :array_2e

    new-array v12, v14, [C

    fill-array-data v12, :array_2f

    new-array v13, v14, [C

    fill-array-data v13, :array_30

    filled-new-array/range {v2 .. v13}, [[C

    move-result-object v0

    sput-object v0, Lcom/zte/mifavor/widget/e;->A:[[C

    const/16 v0, 0xc

    .line 14
    new-array v0, v0, [C

    fill-array-data v0, :array_31

    sput-object v0, Lcom/zte/mifavor/widget/e;->B:[C

    const/16 v0, 0x192

    .line 15
    new-array v0, v0, [C

    fill-array-data v0, :array_32

    sput-object v0, Lcom/zte/mifavor/widget/e;->C:[C

    return-void

    nop

    :array_0
    .array-data 4
        0x6
        0xe
        0x13
        0x19
        0x21
        0x24
        0x26
        0x29
        0x2c
        0x34
        0x37
        0x4f
        0x75
        0x88
        0x93
        0x96
        0x9b
        0x9e
        0xb9
        0xc1
    .end array-data

    :array_1
    .array-data 2
        0x7s
        0x6s
        0x6s
        0x6s
        0x6s
        0x6s
        0x6s
        0x6s
        0x6s
        0x5s
        0x6s
        0x6s
        0x6s
        0x5s
        0x5s
        0x6s
        0x6s
        0x5s
        0x5s
        0x5s
        0x5s
        0x5s
        0x5s
        0x5s
        0x5s
        0x4s
        0x5s
        0x5s
    .end array-data

    :array_2
    .array-data 2
        0x5s
        0x4s
        0x5s
        0x5s
        0x5s
        0x4s
        0x4s
        0x5s
        0x5s
        0x4s
        0x4s
        0x4s
        0x4s
        0x4s
        0x4s
        0x4s
        0x4s
        0x3s
        0x4s
        0x4s
        0x4s
        0x3s
        0x3s
        0x4s
        0x4s
        0x3s
        0x3s
        0x3s
    .end array-data

    :array_3
    .array-data 2
        0x6s
        0x6s
        0x6s
        0x7s
        0x6s
        0x6s
        0x6s
        0x6s
        0x5s
        0x6s
        0x6s
        0x6s
        0x5s
        0x5s
        0x6s
        0x6s
        0x5s
        0x5s
        0x5s
        0x6s
        0x5s
        0x5s
        0x5s
        0x5s
        0x4s
        0x5s
        0x5s
        0x5s
        0x5s
    .end array-data

    nop

    :array_4
    .array-data 2
        0x5s
        0x5s
        0x6s
        0x6s
        0x5s
        0x5s
        0x5s
        0x6s
        0x5s
        0x5s
        0x5s
        0x5s
        0x4s
        0x5s
        0x5s
        0x5s
        0x4s
        0x4s
        0x5s
        0x5s
        0x4s
        0x4s
        0x4s
        0x5s
        0x4s
        0x4s
        0x4s
        0x4s
        0x5s
    .end array-data

    nop

    :array_5
    .array-data 2
        0x6s
        0x6s
        0x6s
        0x7s
        0x6s
        0x6s
        0x6s
        0x6s
        0x5s
        0x6s
        0x6s
        0x6s
        0x5s
        0x5s
        0x6s
        0x6s
        0x5s
        0x5s
        0x5s
        0x6s
        0x5s
        0x5s
        0x5s
        0x5s
        0x4s
        0x5s
        0x5s
        0x5s
        0x5s
    .end array-data

    nop

    :array_6
    .array-data 2
        0x6s
        0x6s
        0x7s
        0x7s
        0x6s
        0x6s
        0x6s
        0x7s
        0x6s
        0x6s
        0x6s
        0x6s
        0x5s
        0x6s
        0x6s
        0x6s
        0x5s
        0x5s
        0x6s
        0x6s
        0x5s
        0x5s
        0x5s
        0x6s
        0x5s
        0x5s
        0x5s
        0x5s
        0x4s
        0x5s
        0x5s
        0x5s
        0x5s
    .end array-data

    nop

    :array_7
    .array-data 2
        0x7s
        0x8s
        0x8s
        0x8s
        0x7s
        0x7s
        0x8s
        0x8s
        0x7s
        0x7s
        0x7s
        0x8s
        0x7s
        0x7s
        0x7s
        0x7s
        0x6s
        0x7s
        0x7s
        0x7s
        0x6s
        0x6s
        0x7s
        0x7s
        0x6s
        0x6s
        0x6s
        0x7s
        0x7s
    .end array-data

    nop

    :array_8
    .array-data 2
        0x8s
        0x8s
        0x8s
        0x9s
        0x8s
        0x8s
        0x8s
        0x8s
        0x7s
        0x8s
        0x8s
        0x8s
        0x7s
        0x7s
        0x8s
        0x8s
        0x7s
        0x7s
        0x7s
        0x8s
        0x7s
        0x7s
        0x7s
        0x7s
        0x6s
        0x7s
        0x7s
        0x7s
        0x6s
        0x6s
        0x7s
        0x7s
        0x7s
    .end array-data

    nop

    :array_9
    .array-data 2
        0x8s
        0x8s
        0x8s
        0x9s
        0x8s
        0x8s
        0x8s
        0x8s
        0x7s
        0x8s
        0x8s
        0x8s
        0x7s
        0x7s
        0x8s
        0x8s
        0x7s
        0x7s
        0x7s
        0x8s
        0x7s
        0x7s
        0x7s
        0x7s
        0x6s
        0x7s
        0x7s
        0x7s
        0x7s
    .end array-data

    nop

    :array_a
    .array-data 2
        0x9s
        0x9s
        0x9s
        0x9s
        0x8s
        0x9s
        0x9s
        0x9s
        0x8s
        0x8s
        0x9s
        0x9s
        0x8s
        0x8s
        0x8s
        0x9s
        0x8s
        0x8s
        0x8s
        0x8s
        0x7s
        0x8s
        0x8s
        0x8s
        0x7s
        0x7s
        0x8s
        0x8s
        0x8s
    .end array-data

    nop

    :array_b
    .array-data 2
        0x8s
        0x8s
        0x8s
        0x8s
        0x7s
        0x8s
        0x8s
        0x8s
        0x7s
        0x7s
        0x8s
        0x8s
        0x7s
        0x7s
        0x7s
        0x8s
        0x7s
        0x7s
        0x7s
        0x7s
        0x6s
        0x7s
        0x7s
        0x7s
        0x6s
        0x6s
        0x7s
        0x7s
        0x7s
    .end array-data

    nop

    :array_c
    .array-data 2
        0x7s
        0x8s
        0x8s
        0x8s
        0x7s
        0x7s
        0x8s
        0x8s
        0x7s
        0x7s
        0x7s
        0x8s
        0x7s
        0x7s
        0x7s
        0x7s
        0x6s
        0x7s
        0x7s
        0x7s
        0x6s
        0x6s
        0x7s
        0x7s
        0x6s
        0x6s
        0x6s
        0x7s
        0x7s
    .end array-data

    nop

    :array_d
    .array-data 2
        0xds
        0x31s
        0x55s
        0x75s
        0x95s
        0xb9s
        0xc9s
        0xfas
        0xfas
    .end array-data

    nop

    :array_e
    .array-data 2
        0xds
        0x2ds
        0x51s
        0x75s
        0x95s
        0xb9s
        0xc9s
        0xfas
        0xfas
    .end array-data

    nop

    :array_f
    .array-data 2
        0xds
        0x30s
        0x54s
        0x70s
        0x94s
        0xb8s
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_10
    .array-data 2
        0xds
        0x2ds
        0x4cs
        0x6cs
        0x8cs
        0xacs
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_11
    .array-data 2
        0xds
        0x2cs
        0x48s
        0x68s
        0x84s
        0xa8s
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_12
    .array-data 2
        0x5s
        0x21s
        0x44s
        0x60s
        0x7cs
        0x98s
        0xbcs
        0xc8s
        0xc9s
    .end array-data

    nop

    :array_13
    .array-data 2
        0x1ds
        0x39s
        0x55s
        0x78s
        0x94s
        0xb0s
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_14
    .array-data 2
        0xds
        0x30s
        0x4cs
        0x68s
        0x84s
        0xa8s
        0xc4s
        0xc8s
        0xc9s
    .end array-data

    nop

    :array_15
    .array-data 2
        0x19s
        0x3cs
        0x58s
        0x78s
        0x94s
        0xb8s
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_16
    .array-data 2
        0x10s
        0x2cs
        0x4cs
        0x6cs
        0x90s
        0xacs
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_17
    .array-data 2
        0x1cs
        0x3cs
        0x5cs
        0x7cs
        0xa0s
        0xc0s
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_18
    .array-data 2
        0x11s
        0x35s
        0x55s
        0x7cs
        0x9cs
        0xbcs
        0xc8s
        0xc9s
        0xfas
    .end array-data

    nop

    :array_19
    .array-data 2
        0x15s
        0x15s
        0x15s
        0x15s
        0x15s
        0x14s
        0x15s
        0x15s
        0x15s
        0x14s
        0x14s
        0x15s
        0x15s
        0x14s
        0x14s
        0x14s
        0x14s
        0x14s
        0x14s
        0x14s
        0x14s
        0x13s
        0x14s
        0x14s
        0x14s
        0x13s
        0x13s
        0x14s
    .end array-data

    :array_1a
    .array-data 2
        0x14s
        0x13s
        0x13s
        0x14s
        0x14s
        0x13s
        0x13s
        0x13s
        0x13s
        0x13s
        0x13s
        0x13s
        0x13s
        0x12s
        0x13s
        0x13s
        0x13s
        0x12s
        0x12s
        0x13s
        0x13s
        0x12s
        0x12s
        0x12s
        0x12s
        0x12s
        0x12s
        0x12s
    .end array-data

    :array_1b
    .array-data 2
        0x15s
        0x15s
        0x15s
        0x16s
        0x15s
        0x15s
        0x15s
        0x15s
        0x14s
        0x15s
        0x15s
        0x15s
        0x14s
        0x14s
        0x15s
        0x15s
        0x14s
        0x14s
        0x14s
        0x15s
        0x14s
        0x14s
        0x14s
        0x14s
        0x13s
        0x14s
        0x14s
        0x14s
        0x14s
    .end array-data

    nop

    :array_1c
    .array-data 2
        0x14s
        0x15s
        0x15s
        0x15s
        0x14s
        0x14s
        0x15s
        0x15s
        0x14s
        0x14s
        0x14s
        0x15s
        0x14s
        0x14s
        0x14s
        0x14s
        0x13s
        0x14s
        0x14s
        0x14s
        0x13s
        0x13s
        0x14s
        0x14s
        0x13s
        0x13s
        0x13s
        0x14s
        0x14s
    .end array-data

    nop

    :array_1d
    .array-data 2
        0x15s
        0x16s
        0x16s
        0x16s
        0x15s
        0x15s
        0x16s
        0x16s
        0x15s
        0x15s
        0x15s
        0x16s
        0x15s
        0x15s
        0x15s
        0x15s
        0x14s
        0x15s
        0x15s
        0x15s
        0x14s
        0x14s
        0x15s
        0x15s
        0x14s
        0x14s
        0x14s
        0x15s
        0x15s
    .end array-data

    nop

    :array_1e
    .array-data 2
        0x16s
        0x16s
        0x16s
        0x16s
        0x15s
        0x16s
        0x16s
        0x16s
        0x15s
        0x15s
        0x16s
        0x16s
        0x15s
        0x15s
        0x15s
        0x16s
        0x15s
        0x15s
        0x15s
        0x15s
        0x14s
        0x15s
        0x15s
        0x15s
        0x14s
        0x14s
        0x15s
        0x15s
        0x15s
    .end array-data

    nop

    :array_1f
    .array-data 2
        0x17s
        0x17s
        0x18s
        0x18s
        0x17s
        0x17s
        0x17s
        0x18s
        0x17s
        0x17s
        0x17s
        0x17s
        0x16s
        0x17s
        0x17s
        0x17s
        0x16s
        0x16s
        0x17s
        0x17s
        0x16s
        0x16s
        0x16s
        0x17s
        0x16s
        0x16s
        0x16s
        0x16s
        0x17s
    .end array-data

    nop

    :array_20
    .array-data 2
        0x17s
        0x18s
        0x18s
        0x18s
        0x17s
        0x17s
        0x18s
        0x18s
        0x17s
        0x17s
        0x17s
        0x18s
        0x17s
        0x17s
        0x17s
        0x17s
        0x16s
        0x17s
        0x17s
        0x17s
        0x16s
        0x16s
        0x17s
        0x17s
        0x16s
        0x16s
        0x16s
        0x17s
        0x17s
    .end array-data

    nop

    :array_21
    .array-data 2
        0x17s
        0x18s
        0x18s
        0x18s
        0x17s
        0x17s
        0x18s
        0x18s
        0x17s
        0x17s
        0x17s
        0x18s
        0x17s
        0x17s
        0x17s
        0x17s
        0x16s
        0x17s
        0x17s
        0x17s
        0x16s
        0x16s
        0x17s
        0x17s
        0x16s
        0x16s
        0x16s
        0x17s
        0x17s
    .end array-data

    nop

    :array_22
    .array-data 2
        0x18s
        0x18s
        0x18s
        0x18s
        0x17s
        0x18s
        0x18s
        0x18s
        0x17s
        0x17s
        0x18s
        0x18s
        0x17s
        0x17s
        0x17s
        0x18s
        0x17s
        0x17s
        0x17s
        0x17s
        0x16s
        0x17s
        0x17s
        0x17s
        0x16s
        0x16s
        0x17s
        0x17s
        0x17s
    .end array-data

    nop

    :array_23
    .array-data 2
        0x17s
        0x17s
        0x17s
        0x17s
        0x16s
        0x17s
        0x17s
        0x17s
        0x16s
        0x16s
        0x17s
        0x17s
        0x16s
        0x16s
        0x16s
        0x17s
        0x16s
        0x16s
        0x16s
        0x16s
        0x15s
        0x16s
        0x16s
        0x16s
        0x15s
        0x15s
        0x16s
        0x16s
        0x16s
    .end array-data

    nop

    :array_24
    .array-data 2
        0x16s
        0x16s
        0x17s
        0x17s
        0x16s
        0x16s
        0x16s
        0x17s
        0x16s
        0x16s
        0x16s
        0x16s
        0x15s
        0x16s
        0x16s
        0x16s
        0x15s
        0x15s
        0x16s
        0x16s
        0x15s
        0x15s
        0x15s
        0x16s
        0x15s
        0x15s
        0x15s
        0x15s
        0x16s
    .end array-data

    nop

    :array_25
    .array-data 2
        0xds
        0x2ds
        0x51s
        0x71s
        0x95s
        0xb9s
        0xc9s
    .end array-data

    nop

    :array_26
    .array-data 2
        0x15s
        0x39s
        0x5ds
        0x7ds
        0xa1s
        0xc1s
        0xc9s
    .end array-data

    nop

    :array_27
    .array-data 2
        0x15s
        0x38s
        0x58s
        0x78s
        0x98s
        0xbcs
        0xc8s
        0xc9s
    .end array-data

    :array_28
    .array-data 2
        0x15s
        0x31s
        0x51s
        0x74s
        0x90s
        0xb0s
        0xc8s
        0xc9s
    .end array-data

    :array_29
    .array-data 2
        0x11s
        0x31s
        0x4ds
        0x70s
        0x8cs
        0xa8s
        0xc8s
        0xc9s
    .end array-data

    :array_2a
    .array-data 2
        0x1cs
        0x3cs
        0x58s
        0x74s
        0x94s
        0xb4s
        0xc8s
        0xc9s
    .end array-data

    :array_2b
    .array-data 2
        0x19s
        0x35s
        0x54s
        0x70s
        0x90s
        0xacs
        0xc8s
        0xc9s
    .end array-data

    :array_2c
    .array-data 2
        0x1ds
        0x39s
        0x59s
        0x78s
        0x94s
        0xb4s
        0xc8s
        0xc9s
    .end array-data

    :array_2d
    .array-data 2
        0x11s
        0x2ds
        0x49s
        0x6cs
        0x8cs
        0xa8s
        0xc8s
        0xc9s
    .end array-data

    :array_2e
    .array-data 2
        0x1cs
        0x3cs
        0x5cs
        0x7cs
        0xa0s
        0xc0s
        0xc8s
        0xc9s
    .end array-data

    :array_2f
    .array-data 2
        0x10s
        0x2cs
        0x50s
        0x70s
        0x94s
        0xb4s
        0xc8s
        0xc9s
    .end array-data

    :array_30
    .array-data 2
        0x11s
        0x35s
        0x58s
        0x78s
        0x9cs
        0xbcs
        0xc8s
        0xc9s
    .end array-data

    :array_31
    .array-data 2
        0x1fs
        0x1cs
        0x1fs
        0x1es
        0x1fs
        0x1es
        0x1fs
        0x1fs
        0x1es
        0x1fs
        0x1es
        0x1fs
    .end array-data

    :array_32
    .array-data 2
        0x0s
        0x4s
        0xads
        0x8s
        0x5as
        0x1s
        0xd5s
        0x54s
        0xb4s
        0x9s
        0x64s
        0x5s
        0x59s
        0x45s
        0x95s
        0xas
        0xa6s
        0x4s
        0x55s
        0x24s
        0xads
        0x8s
        0x5as
        0x62s
        0xdas
        0x4s
        0xb4s
        0x5s
        0xb4s
        0x55s
        0x52s
        0xds
        0x94s
        0xas
        0x4as
        0x2as
        0x56s
        0x2s
        0x6ds
        0x71s
        0x6ds
        0x1s
        0xdas
        0x2s
        0xd2s
        0x52s
        0xa9s
        0x5s
        0x49s
        0xds
        0x2as
        0x45s
        0x2bs
        0x9s
        0x56s
        0x1s
        0xb5s
        0x20s
        0x6ds
        0x1s
        0x59s
        0x69s
        0xd4s
        0xas
        0xa8s
        0x5s
        0xa9s
        0x56s
        0xa5s
        0x4s
        0x2bs
        0x9s
        0x9es
        0x38s
        0xb6s
        0x8s
        0xecs
        0x74s
        0x6cs
        0x5s
        0xd4s
        0xas
        0xe4s
        0x6as
        0x52s
        0x5s
        0x95s
        0xas
        0x5as
        0x42s
        0x5bs
        0x4s
        0xb6s
        0x4s
        0xb4s
        0x22s
        0x6as
        0x5s
        0x52s
        0x75s
        0xc9s
        0xas
        0x52s
        0x5s
        0x35s
        0x55s
        0x4ds
        0xas
        0x5as
        0x2s
        0x5ds
        0x31s
        0xb5s
        0x2s
        0x6as
        0x8as
        0x68s
        0x5s
        0xa9s
        0xas
        0x8as
        0x6as
        0x2as
        0x5s
        0x2ds
        0x9s
        0xaas
        0x48s
        0x5as
        0x1s
        0xb5s
        0x9s
        0xb0s
        0x39s
        0x64s
        0x5s
        0x25s
        0x75s
        0x95s
        0xas
        0x96s
        0x4s
        0x4ds
        0x54s
        0xads
        0x4s
        0xdas
        0x4s
        0xd4s
        0x44s
        0xb4s
        0x5s
        0x54s
        0x85s
        0x52s
        0xds
        0x92s
        0xas
        0x56s
        0x6as
        0x56s
        0x2s
        0x6ds
        0x2s
        0x6as
        0x41s
        0xdas
        0x2s
        0xb2s
        0xa1s
        0xa9s
        0x5s
        0x49s
        0xds
        0xas
        0x6ds
        0x2as
        0x9s
        0x56s
        0x1s
        0xads
        0x50s
        0x6ds
        0x1s
        0xd9s
        0x2s
        0xd1s
        0x3as
        0xa8s
        0x5s
        0x29s
        0x85s
        0xa5s
        0xcs
        0x2as
        0x9s
        0x96s
        0x54s
        0xb6s
        0x8s
        0x6cs
        0x9s
        0x64s
        0x45s
        0xd4s
        0xas
        0xa4s
        0x5s
        0x51s
        0x25s
        0x95s
        0xas
        0x2as
        0x72s
        0x5bs
        0x4s
        0xb6s
        0x4s
        0xacs
        0x52s
        0x6as
        0x5s
        0xd2s
        0xas
        0xa2s
        0x4as
        0x4as
        0x5s
        0x55s
        0x94s
        0x2ds
        0xas
        0x5as
        0x2s
        0x75s
        0x61s
        0xb5s
        0x2s
        0x6as
        0x3s
        0x61s
        0x45s
        0xa9s
        0xas
        0x4as
        0x5s
        0x25s
        0x25s
        0x2ds
        0x9s
        0x9as
        0x68s
        0xdas
        0x8s
        0xb4s
        0x9s
        0xa8s
        0x59s
        0x54s
        0x3s
        0xa5s
        0xas
        0x91s
        0x3as
        0x96s
        0x4s
        0xads
        0xb0s
        0xads
        0x4s
        0xdas
        0x4s
        0xf4s
        0x62s
        0xb4s
        0x5s
        0x54s
        0xbs
        0x44s
        0x5ds
        0x52s
        0xas
        0x95s
        0x4s
        0x55s
        0x22s
        0x6ds
        0x2s
        0x5as
        0x71s
        0xdas
        0x2s
        0xaas
        0x5s
        0xb2s
        0x55s
        0x49s
        0xbs
        0x4as
        0xas
        0x2ds
        0x39s
        0x36s
        0x1s
        0x6ds
        0x80s
        0x6ds
        0x1s
        0xd9s
        0x2s
        0xe9s
        0x6as
        0xa8s
        0x5s
        0x29s
        0xbs
        0x9as
        0x4cs
        0xaas
        0x8s
        0xb6s
        0x8s
        0xb4s
        0x38s
        0x6cs
        0x9s
        0x54s
        0x75s
        0xd4s
        0xas
        0xa4s
        0x5s
        0x45s
        0x55s
        0x95s
        0xas
        0x9as
        0x4s
        0x55s
        0x44s
        0xb5s
        0x4s
        0x6as
        0x82s
        0x6as
        0x5s
        0xd2s
        0xas
        0x92s
        0x6as
        0x4as
        0x5s
        0x55s
        0xas
        0x2as
        0x4as
        0x5as
        0x2s
        0xb5s
        0x2s
        0xb2s
        0x31s
        0x69s
        0x3s
        0x31s
        0x73s
        0xa9s
        0xas
        0x4as
        0x5s
        0x2ds
        0x55s
        0x2ds
        0x9s
        0x5as
        0x1s
        0xd5s
        0x48s
        0xb4s
        0x9s
        0x68s
        0x89s
        0x54s
        0xbs
        0xa4s
        0xas
        0xa5s
        0x6as
        0x95s
        0x4s
        0xads
        0x8s
        0x6as
        0x44s
        0xdas
        0x4s
        0x74s
        0x5s
        0xb0s
        0x25s
        0x54s
        0x3s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/GregorianCalendar;-><init>()V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Ljava/util/GregorianCalendar;-><init>(III)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Calendar;)V
    .locals 0

    .line 4
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;-><init>(Ljava/util/Date;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 3
    invoke-super {p0, p1}, Ljava/util/GregorianCalendar;->setTime(Ljava/util/Date;)V

    return-void
.end method

.method public constructor <init>(ZIII)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/util/GregorianCalendar;-><init>()V

    if-eqz p1, :cond_0

    const/16 p1, 0x321

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/zte/mifavor/widget/e;->set(II)V

    const/16 p1, 0x322

    .line 8
    invoke-virtual {p0, p1, p3}, Lcom/zte/mifavor/widget/e;->set(II)V

    const/16 p1, 0x323

    .line 9
    invoke-virtual {p0, p1, p4}, Lcom/zte/mifavor/widget/e;->set(II)V

    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Ljava/util/GregorianCalendar;->set(III)V

    return-void
.end method

.method private a()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x2

    .line 7
    invoke-virtual {p0, v2}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int/2addr v2, v0

    .line 12
    const/4 v3, 0x5

    .line 13
    invoke-virtual {p0, v3}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/16 v4, 0x76d

    .line 18
    .line 19
    if-lt v1, v4, :cond_6

    .line 20
    .line 21
    const/16 v5, 0x834

    .line 22
    .line 23
    if-le v1, v5, :cond_0

    .line 24
    .line 25
    goto :goto_5

    .line 26
    :cond_0
    const/16 v5, 0x7d0

    .line 27
    .line 28
    const/16 v6, 0xb

    .line 29
    .line 30
    if-ge v1, v5, :cond_1

    .line 31
    .line 32
    const/16 v5, 0x76c

    .line 33
    .line 34
    iput v5, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 35
    .line 36
    iput v6, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 37
    .line 38
    iput v6, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/16 v4, 0x7cf

    .line 42
    .line 43
    iput v4, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 44
    .line 45
    iput v6, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 46
    .line 47
    const/16 v4, 0x19

    .line 48
    .line 49
    iput v4, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 50
    .line 51
    move v4, v5

    .line 52
    :goto_0
    const/4 v5, 0x0

    .line 53
    :goto_1
    if-ge v4, v1, :cond_3

    .line 54
    .line 55
    invoke-static {v4}, Lcom/zte/mifavor/widget/e;->w(I)Z

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    if-eqz v6, :cond_2

    .line 60
    .line 61
    add-int/lit16 v5, v5, 0x16e

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    add-int/lit16 v5, v5, 0x16d

    .line 65
    .line 66
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    move v4, v0

    .line 70
    :goto_3
    if-ge v4, v2, :cond_4

    .line 71
    .line 72
    add-int/lit8 v6, v4, -0x1

    .line 73
    .line 74
    invoke-static {v1, v6}, Lcom/zte/mifavor/widget/e;->m(II)I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    add-int/2addr v5, v6

    .line 79
    add-int/lit8 v4, v4, 0x1

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_4
    sub-int/2addr v3, v0

    .line 83
    add-int/2addr v5, v3

    .line 84
    iget v1, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 85
    .line 86
    add-int/2addr v1, v5

    .line 87
    iput v1, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 88
    .line 89
    iget v1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 90
    .line 91
    iget v2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 92
    .line 93
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    :goto_4
    iget v2, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 98
    .line 99
    if-le v2, v1, :cond_6

    .line 100
    .line 101
    sub-int/2addr v2, v1

    .line 102
    iput v2, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 103
    .line 104
    iget v1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 105
    .line 106
    iget v2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 107
    .line 108
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/e;->x(II)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    iput v1, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 113
    .line 114
    if-ne v1, v0, :cond_5

    .line 115
    .line 116
    iget v2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 117
    .line 118
    add-int/2addr v2, v0

    .line 119
    iput v2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 120
    .line 121
    :cond_5
    iget v2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 122
    .line 123
    invoke-static {v2, v1}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    goto :goto_4

    .line 128
    :cond_6
    :goto_5
    return-void
.end method

.method private d()V
    .locals 9

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 2
    .line 3
    iget v1, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 4
    .line 5
    iget v2, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 9
    .line 10
    iput-boolean v3, p0, Ljava/util/GregorianCalendar;->areFieldsSet:Z

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    iput-boolean v4, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 14
    .line 15
    const/16 v5, 0x76c

    .line 16
    .line 17
    const/16 v6, 0x834

    .line 18
    .line 19
    if-ge v0, v5, :cond_0

    .line 20
    .line 21
    const/16 v0, 0x76b

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-le v0, v6, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x835

    .line 27
    .line 28
    :cond_1
    :goto_0
    const/16 v5, -0xc

    .line 29
    .line 30
    const/16 v7, 0xc

    .line 31
    .line 32
    if-ge v1, v5, :cond_2

    .line 33
    .line 34
    move v1, v5

    .line 35
    goto :goto_1

    .line 36
    :cond_2
    if-le v1, v7, :cond_3

    .line 37
    .line 38
    move v1, v7

    .line 39
    :cond_3
    :goto_1
    if-ge v2, v3, :cond_4

    .line 40
    .line 41
    move v2, v3

    .line 42
    goto :goto_2

    .line 43
    :cond_4
    const/16 v5, 0x1e

    .line 44
    .line 45
    if-le v2, v5, :cond_5

    .line 46
    .line 47
    move v2, v5

    .line 48
    :cond_5
    :goto_2
    mul-int/lit16 v5, v0, 0x2710

    .line 49
    .line 50
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    mul-int/lit8 v8, v8, 0x64

    .line 55
    .line 56
    add-int/2addr v5, v8

    .line 57
    add-int/2addr v5, v2

    .line 58
    const v8, 0x121ef17

    .line 59
    .line 60
    .line 61
    if-ge v5, v8, :cond_6

    .line 62
    .line 63
    const/16 v0, 0x76d

    .line 64
    .line 65
    invoke-virtual {p0, v0, v4, v3}, Ljava/util/GregorianCalendar;->set(III)V

    .line 66
    .line 67
    .line 68
    invoke-super {p0}, Ljava/util/GregorianCalendar;->complete()V

    .line 69
    .line 70
    .line 71
    goto :goto_5

    .line 72
    :cond_6
    const v8, 0x14073f1

    .line 73
    .line 74
    .line 75
    if-le v5, v8, :cond_7

    .line 76
    .line 77
    const/16 v0, 0xb

    .line 78
    .line 79
    const/16 v1, 0x1f

    .line 80
    .line 81
    invoke-virtual {p0, v6, v0, v1}, Ljava/util/GregorianCalendar;->set(III)V

    .line 82
    .line 83
    .line 84
    invoke-super {p0}, Ljava/util/GregorianCalendar;->complete()V

    .line 85
    .line 86
    .line 87
    goto :goto_5

    .line 88
    :cond_7
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-le v5, v7, :cond_8

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_8
    move v7, v1

    .line 96
    :goto_3
    invoke-static {v0, v7}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_9

    .line 101
    .line 102
    neg-int v7, v7

    .line 103
    invoke-static {v0, v7}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    :cond_9
    if-le v2, v1, :cond_a

    .line 108
    .line 109
    move v2, v1

    .line 110
    :cond_a
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    sub-int/2addr v1, v3

    .line 115
    invoke-virtual {p0, v0, v1, v2}, Ljava/util/GregorianCalendar;->set(III)V

    .line 116
    .line 117
    .line 118
    invoke-direct {p0}, Lcom/zte/mifavor/widget/e;->a()V

    .line 119
    .line 120
    .line 121
    :cond_b
    :goto_4
    iget v1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 122
    .line 123
    if-ne v1, v0, :cond_d

    .line 124
    .line 125
    iget v5, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 126
    .line 127
    if-eq v5, v7, :cond_c

    .line 128
    .line 129
    goto :goto_6

    .line 130
    :cond_c
    iget v0, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 131
    .line 132
    sub-int/2addr v2, v0

    .line 133
    add-int/2addr v4, v2

    .line 134
    const/4 v0, 0x5

    .line 135
    invoke-super {p0, v0, v4}, Ljava/util/GregorianCalendar;->add(II)V

    .line 136
    .line 137
    .line 138
    :goto_5
    invoke-direct {p0}, Lcom/zte/mifavor/widget/e;->a()V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_d
    :goto_6
    iget v5, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 143
    .line 144
    invoke-static {v1, v5}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v4, v1

    .line 149
    iget v1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 150
    .line 151
    iget v5, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 152
    .line 153
    invoke-static {v1, v5}, Lcom/zte/mifavor/widget/e;->x(II)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    iput v1, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 158
    .line 159
    if-ne v1, v3, :cond_b

    .line 160
    .line 161
    iget v1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 162
    .line 163
    add-int/2addr v1, v3

    .line 164
    iput v1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 165
    .line 166
    goto :goto_4
.end method

.method private f(I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->u(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-super {p0}, Ljava/util/GregorianCalendar;->complete()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/zte/mifavor/widget/e;->a()V

    .line 21
    .line 22
    .line 23
    iput-boolean v2, p0, Ljava/util/GregorianCalendar;->areFieldsSet:Z

    .line 24
    .line 25
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 28
    .line 29
    :cond_0
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->v(I)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/zte/mifavor/widget/e;->i()V

    .line 40
    .line 41
    .line 42
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-boolean p1, p0, Ljava/util/GregorianCalendar;->areFieldsSet:Z

    .line 50
    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/zte/mifavor/widget/e;->d()V

    .line 54
    .line 55
    .line 56
    invoke-super {p0}, Ljava/util/GregorianCalendar;->complete()V

    .line 57
    .line 58
    .line 59
    iput-boolean v2, p0, Ljava/util/GregorianCalendar;->areFieldsSet:Z

    .line 60
    .line 61
    iput-boolean v2, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method private i()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-virtual {p0, v1}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/16 v2, 0x76d

    .line 12
    .line 13
    if-lt v0, v2, :cond_1

    .line 14
    .line 15
    const/16 v2, 0x834

    .line 16
    .line 17
    if-le v0, v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/e;->z(II)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iput v2, p0, Lcom/zte/mifavor/widget/e;->j:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/e;->y(II)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/zte/mifavor/widget/e;->k:I

    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public static k(II)I
    .locals 5

    .line 1
    add-int/lit16 p0, p0, -0x76c

    .line 2
    .line 3
    const/16 v0, 0x1d

    .line 4
    .line 5
    const/16 v1, 0x1e

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-gt v2, p1, :cond_0

    .line 9
    .line 10
    const/16 v3, 0x8

    .line 11
    .line 12
    if-gt p1, v3, :cond_0

    .line 13
    .line 14
    sget-object v3, Lcom/zte/mifavor/widget/e;->C:[C

    .line 15
    .line 16
    mul-int/lit8 p0, p0, 0x2

    .line 17
    .line 18
    aget-char p0, v3, p0

    .line 19
    .line 20
    sub-int/2addr p1, v2

    .line 21
    shr-int/2addr p0, p1

    .line 22
    and-int/2addr p0, v2

    .line 23
    if-ne p0, v2, :cond_1

    .line 24
    .line 25
    return v0

    .line 26
    :cond_0
    const/16 v3, 0x9

    .line 27
    .line 28
    if-gt v3, p1, :cond_2

    .line 29
    .line 30
    const/16 v4, 0xc

    .line 31
    .line 32
    if-gt p1, v4, :cond_2

    .line 33
    .line 34
    sget-object v4, Lcom/zte/mifavor/widget/e;->C:[C

    .line 35
    .line 36
    mul-int/lit8 p0, p0, 0x2

    .line 37
    .line 38
    add-int/2addr p0, v2

    .line 39
    aget-char p0, v4, p0

    .line 40
    .line 41
    sub-int/2addr p1, v3

    .line 42
    shr-int/2addr p0, p1

    .line 43
    and-int/2addr p0, v2

    .line 44
    if-ne p0, v2, :cond_1

    .line 45
    .line 46
    return v0

    .line 47
    :cond_1
    return v1

    .line 48
    :cond_2
    sget-object v3, Lcom/zte/mifavor/widget/e;->C:[C

    .line 49
    .line 50
    mul-int/lit8 v4, p0, 0x2

    .line 51
    .line 52
    add-int/2addr v4, v2

    .line 53
    aget-char v2, v3, v4

    .line 54
    .line 55
    shr-int/lit8 v2, v2, 0x4

    .line 56
    .line 57
    and-int/lit8 v2, v2, 0xf

    .line 58
    .line 59
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    const/4 v3, 0x0

    .line 64
    if-eq v2, p1, :cond_3

    .line 65
    .line 66
    return v3

    .line 67
    :cond_3
    :goto_0
    sget-object p1, Lcom/zte/mifavor/widget/e;->w:[I

    .line 68
    .line 69
    array-length v2, p1

    .line 70
    if-ge v3, v2, :cond_5

    .line 71
    .line 72
    aget p1, p1, v3

    .line 73
    .line 74
    if-ne p1, p0, :cond_4

    .line 75
    .line 76
    return v1

    .line 77
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    return v0
.end method

.method public static m(II)I
    .locals 2

    .line 1
    sget-object v0, Lcom/zte/mifavor/widget/e;->B:[C

    .line 2
    .line 3
    aget-char v0, v0, p1

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne p1, v1, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Lcom/zte/mifavor/widget/e;->w(I)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    :cond_0
    return v0
.end method

.method public static s(I)I
    .locals 1

    .line 1
    add-int/lit16 p0, p0, -0x76c

    .line 2
    .line 3
    sget-object v0, Lcom/zte/mifavor/widget/e;->C:[C

    .line 4
    .line 5
    mul-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    aget-char p0, v0, p0

    .line 10
    .line 11
    shr-int/lit8 p0, p0, 0x4

    .line 12
    .line 13
    and-int/lit8 p0, p0, 0xf

    .line 14
    .line 15
    neg-int p0, p0

    .line 16
    return p0
.end method

.method private u(I)Z
    .locals 0

    .line 1
    const/16 p0, 0x378

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    packed-switch p1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    :pswitch_0
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    nop

    .line 13
    :pswitch_data_0
    .packed-switch 0x321
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private v(I)Z
    .locals 0

    .line 1
    const/16 p0, 0x324

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x325

    .line 6
    .line 7
    if-eq p1, p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x378

    .line 10
    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public static w(I)Z
    .locals 4

    .line 1
    rem-int/lit8 v0, p0, 0x4

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move v0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v2

    .line 10
    :goto_0
    rem-int/lit8 v3, p0, 0x64

    .line 11
    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    move v2, v0

    .line 16
    :goto_1
    rem-int/lit16 p0, p0, 0x190

    .line 17
    .line 18
    if-nez p0, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    return v2
.end method

.method public static x(II)I
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    add-int/2addr v0, v1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    add-int/lit16 p0, p0, -0x76c

    .line 10
    .line 11
    sget-object v2, Lcom/zte/mifavor/widget/e;->C:[C

    .line 12
    .line 13
    mul-int/lit8 p0, p0, 0x2

    .line 14
    .line 15
    add-int/2addr p0, v1

    .line 16
    aget-char p0, v2, p0

    .line 17
    .line 18
    shr-int/lit8 p0, p0, 0x4

    .line 19
    .line 20
    and-int/lit8 p0, p0, 0xf

    .line 21
    .line 22
    if-ne p0, p1, :cond_0

    .line 23
    .line 24
    neg-int v0, p1

    .line 25
    :cond_0
    const/16 p0, 0xd

    .line 26
    .line 27
    if-ne v0, p0, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    return v0
.end method

.method public static y(II)I
    .locals 3

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    const/16 v1, 0x76d

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt p0, v1, :cond_4

    .line 7
    .line 8
    const/16 v1, 0x834

    .line 9
    .line 10
    if-le p0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    add-int/lit16 p0, p0, -0x76c

    .line 14
    .line 15
    :goto_0
    sget-object v1, Lcom/zte/mifavor/widget/e;->A:[[C

    .line 16
    .line 17
    aget-object v1, v1, p1

    .line 18
    .line 19
    aget-char v1, v1, v2

    .line 20
    .line 21
    if-lt p0, v1, :cond_1

    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget-object v1, Lcom/zte/mifavor/widget/e;->z:[[C

    .line 27
    .line 28
    aget-object p1, v1, p1

    .line 29
    .line 30
    mul-int/lit8 v2, v2, 0x4

    .line 31
    .line 32
    rem-int/lit8 v1, p0, 0x4

    .line 33
    .line 34
    add-int/2addr v2, v1

    .line 35
    aget-char p1, p1, v2

    .line 36
    .line 37
    const/16 v1, 0xab

    .line 38
    .line 39
    const/16 v2, 0x15

    .line 40
    .line 41
    if-ne p0, v1, :cond_2

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    move p1, v2

    .line 47
    :cond_2
    const/16 v1, 0xb5

    .line 48
    .line 49
    if-ne p0, v1, :cond_3

    .line 50
    .line 51
    const/4 p0, 0x5

    .line 52
    if-ne v0, p0, :cond_3

    .line 53
    .line 54
    return v2

    .line 55
    :cond_3
    return p1

    .line 56
    :cond_4
    :goto_1
    return v2
.end method

.method public static z(II)I
    .locals 4

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    const/16 v1, 0x76d

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt p0, v1, :cond_5

    .line 7
    .line 8
    const/16 v1, 0x834

    .line 9
    .line 10
    if-le p0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    add-int/lit16 p0, p0, -0x76c

    .line 14
    .line 15
    :goto_0
    sget-object v1, Lcom/zte/mifavor/widget/e;->y:[[C

    .line 16
    .line 17
    aget-object v1, v1, p1

    .line 18
    .line 19
    aget-char v1, v1, v2

    .line 20
    .line 21
    if-lt p0, v1, :cond_1

    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget-object v1, Lcom/zte/mifavor/widget/e;->x:[[C

    .line 27
    .line 28
    aget-object p1, v1, p1

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    mul-int/2addr v2, v1

    .line 32
    rem-int/lit8 v3, p0, 0x4

    .line 33
    .line 34
    add-int/2addr v2, v3

    .line 35
    aget-char p1, p1, v2

    .line 36
    .line 37
    const/16 v2, 0x79

    .line 38
    .line 39
    const/4 v3, 0x5

    .line 40
    if-ne p0, v2, :cond_2

    .line 41
    .line 42
    if-ne v0, v1, :cond_2

    .line 43
    .line 44
    move p1, v3

    .line 45
    :cond_2
    const/16 v2, 0x84

    .line 46
    .line 47
    if-ne p0, v2, :cond_3

    .line 48
    .line 49
    if-ne v0, v1, :cond_3

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    move v3, p1

    .line 53
    :goto_1
    const/16 p1, 0xc2

    .line 54
    .line 55
    if-ne p0, p1, :cond_4

    .line 56
    .line 57
    const/4 p0, 0x6

    .line 58
    if-ne v0, p0, :cond_4

    .line 59
    .line 60
    return p0

    .line 61
    :cond_4
    return v3

    .line 62
    :cond_5
    :goto_2
    return v2
.end method


# virtual methods
.method public add(II)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->f(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->u(I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2}, Ljava/util/GregorianCalendar;->add(II)V

    .line 12
    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    packed-switch p1, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 26
    .line 27
    new-instance p2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v0, "\u4e0d\u652f\u6301\u7684field\uff1a"

    .line 33
    .line 34
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p0

    .line 48
    :pswitch_0
    iget p1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 49
    .line 50
    iget v2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 51
    .line 52
    invoke-static {p1, v2}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    move v2, v1

    .line 57
    :goto_0
    if-ge v2, p2, :cond_4

    .line 58
    .line 59
    iget v3, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 60
    .line 61
    add-int/2addr v3, v0

    .line 62
    iput v3, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 63
    .line 64
    if-le v3, p1, :cond_2

    .line 65
    .line 66
    iput v0, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 67
    .line 68
    iget p1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 69
    .line 70
    iget v3, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 71
    .line 72
    invoke-static {p1, v3}, Lcom/zte/mifavor/widget/e;->x(II)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput p1, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 77
    .line 78
    if-ne p1, v0, :cond_1

    .line 79
    .line 80
    iget v3, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 81
    .line 82
    add-int/2addr v3, v0

    .line 83
    iput v3, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 84
    .line 85
    :cond_1
    iget v3, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 86
    .line 87
    invoke-static {v3, p1}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :pswitch_1
    move p1, v1

    .line 95
    :goto_1
    if-ge p1, p2, :cond_4

    .line 96
    .line 97
    iget v2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 98
    .line 99
    iget v3, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 100
    .line 101
    invoke-static {v2, v3}, Lcom/zte/mifavor/widget/e;->x(II)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    iput v2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 106
    .line 107
    if-ne v2, v0, :cond_3

    .line 108
    .line 109
    iget v2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 110
    .line 111
    add-int/2addr v2, v0

    .line 112
    iput v2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 113
    .line 114
    :cond_3
    add-int/lit8 p1, p1, 0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :pswitch_2
    iget p1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 118
    .line 119
    add-int/2addr p1, p2

    .line 120
    iput p1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 121
    .line 122
    :cond_4
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 123
    .line 124
    iput-boolean v1, p0, Ljava/util/GregorianCalendar;->areFieldsSet:Z

    .line 125
    .line 126
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 127
    .line 128
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 129
    .line 130
    return-void

    .line 131
    :pswitch_data_0
    .packed-switch 0x321
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c(III)Ljava/util/Calendar;
    .locals 9

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x834

    .line 6
    .line 7
    const/16 v2, 0x76c

    .line 8
    .line 9
    if-ge p1, v2, :cond_0

    .line 10
    .line 11
    const/16 p1, 0x76b

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    if-le p1, v1, :cond_1

    .line 15
    .line 16
    const/16 p1, 0x835

    .line 17
    .line 18
    :cond_1
    :goto_0
    const/16 v3, -0xc

    .line 19
    .line 20
    const/16 v4, 0xc

    .line 21
    .line 22
    if-ge p2, v3, :cond_2

    .line 23
    .line 24
    move p2, v3

    .line 25
    goto :goto_1

    .line 26
    :cond_2
    if-le p2, v4, :cond_3

    .line 27
    .line 28
    move p2, v4

    .line 29
    :cond_3
    :goto_1
    const/4 v3, 0x1

    .line 30
    if-ge p3, v3, :cond_4

    .line 31
    .line 32
    move p3, v3

    .line 33
    goto :goto_2

    .line 34
    :cond_4
    const/16 v5, 0x1e

    .line 35
    .line 36
    if-le p3, v5, :cond_5

    .line 37
    .line 38
    move p3, v5

    .line 39
    :cond_5
    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v6, "chinese: y:  "

    .line 45
    .line 46
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v6, "  m:   "

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v6, "     d:  "

    .line 61
    .line 62
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    const-string v6, "wweer"

    .line 73
    .line 74
    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    mul-int/lit16 v5, p1, 0x2710

    .line 78
    .line 79
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    mul-int/lit8 v6, v6, 0x64

    .line 84
    .line 85
    add-int/2addr v5, v6

    .line 86
    add-int/2addr v5, p3

    .line 87
    const v6, 0x121ef17

    .line 88
    .line 89
    .line 90
    const/4 v7, 0x0

    .line 91
    const/4 v8, 0x5

    .line 92
    if-ge v5, v6, :cond_6

    .line 93
    .line 94
    const/16 p1, 0x76d

    .line 95
    .line 96
    invoke-virtual {p0, p1, v7, v3}, Ljava/util/GregorianCalendar;->set(III)V

    .line 97
    .line 98
    .line 99
    invoke-super {p0}, Ljava/util/GregorianCalendar;->complete()V

    .line 100
    .line 101
    .line 102
    goto :goto_6

    .line 103
    :cond_6
    const v6, 0x14073f1

    .line 104
    .line 105
    .line 106
    if-le v5, v6, :cond_7

    .line 107
    .line 108
    const/16 p1, 0xb

    .line 109
    .line 110
    const/16 p2, 0x1f

    .line 111
    .line 112
    invoke-virtual {p0, v1, p1, p2}, Ljava/util/GregorianCalendar;->set(III)V

    .line 113
    .line 114
    .line 115
    invoke-super {p0}, Ljava/util/GregorianCalendar;->complete()V

    .line 116
    .line 117
    .line 118
    goto :goto_6

    .line 119
    :cond_7
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-le v5, v4, :cond_8

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_8
    move v4, p2

    .line 127
    :goto_3
    invoke-static {p1, v4}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    if-nez p2, :cond_9

    .line 132
    .line 133
    neg-int v4, v4

    .line 134
    invoke-static {p1, v4}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    :cond_9
    if-le p3, p2, :cond_a

    .line 139
    .line 140
    move p3, p2

    .line 141
    :cond_a
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    sub-int/2addr p2, v3

    .line 146
    invoke-virtual {p0, p1, p2, p3}, Ljava/util/GregorianCalendar;->set(III)V

    .line 147
    .line 148
    .line 149
    invoke-direct {p0}, Lcom/zte/mifavor/widget/e;->a()V

    .line 150
    .line 151
    .line 152
    :cond_b
    :goto_4
    iget p2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 153
    .line 154
    if-ne p2, p1, :cond_c

    .line 155
    .line 156
    iget v5, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 157
    .line 158
    if-eq v5, v4, :cond_e

    .line 159
    .line 160
    :cond_c
    if-lt p2, v2, :cond_e

    .line 161
    .line 162
    if-le p2, v1, :cond_d

    .line 163
    .line 164
    goto :goto_5

    .line 165
    :cond_d
    iget v5, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 166
    .line 167
    invoke-static {p2, v5}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    add-int/2addr v7, p2

    .line 172
    iget p2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 173
    .line 174
    iget v5, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 175
    .line 176
    invoke-static {p2, v5}, Lcom/zte/mifavor/widget/e;->x(II)I

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    iput p2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 181
    .line 182
    if-ne p2, v3, :cond_b

    .line 183
    .line 184
    iget p2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 185
    .line 186
    add-int/2addr p2, v3

    .line 187
    iput p2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_e
    :goto_5
    iget p1, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 191
    .line 192
    sub-int/2addr p3, p1

    .line 193
    add-int/2addr v7, p3

    .line 194
    invoke-super {p0, v8, v7}, Ljava/util/GregorianCalendar;->add(II)V

    .line 195
    .line 196
    .line 197
    :goto_6
    invoke-virtual {p0, v3}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    const/4 p2, 0x2

    .line 202
    invoke-virtual {p0, p2}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 203
    .line 204
    .line 205
    move-result p3

    .line 206
    invoke-virtual {p0, v8}, Ljava/util/GregorianCalendar;->internalGet(I)I

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    invoke-virtual {v0, v3, p1}, Ljava/util/Calendar;->set(II)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->set(II)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, v8, p0}, Ljava/util/Calendar;->set(II)V

    .line 217
    .line 218
    .line 219
    return-object v0
.end method

.method public get(I)I
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->f(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->u(I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-super {p0, p1}, Ljava/util/GregorianCalendar;->get(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    const/16 v0, 0x378

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    packed-switch p1, :pswitch_data_0

    .line 21
    .line 22
    .line 23
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "\u4e0d\u652f\u6301\u7684field\u83b7\u53d6\uff1a"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw p0

    .line 46
    :pswitch_0
    iget p0, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 47
    .line 48
    add-int/lit8 p0, p0, -0x4

    .line 49
    .line 50
    rem-int/lit8 p0, p0, 0xc

    .line 51
    .line 52
    :goto_0
    add-int/2addr p0, v1

    .line 53
    return p0

    .line 54
    :pswitch_1
    iget p0, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 55
    .line 56
    add-int/lit8 p0, p0, -0x4

    .line 57
    .line 58
    rem-int/lit8 p0, p0, 0xa

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :pswitch_2
    iget p0, p0, Lcom/zte/mifavor/widget/e;->k:I

    .line 62
    .line 63
    return p0

    .line 64
    :pswitch_3
    iget p0, p0, Lcom/zte/mifavor/widget/e;->j:I

    .line 65
    .line 66
    return p0

    .line 67
    :pswitch_4
    iget p0, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 68
    .line 69
    return p0

    .line 70
    :pswitch_5
    iget p0, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 71
    .line 72
    return p0

    .line 73
    :pswitch_6
    iget p0, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 74
    .line 75
    return p0

    .line 76
    :cond_1
    const/4 p1, 0x5

    .line 77
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const/16 v2, 0x324

    .line 82
    .line 83
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-ne v0, v3, :cond_2

    .line 88
    .line 89
    return v2

    .line 90
    :cond_2
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    const/16 v0, 0x325

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-ne p1, v2, :cond_3

    .line 101
    .line 102
    return v0

    .line 103
    :cond_3
    const/16 p1, 0x323

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-ne p0, v1, :cond_4

    .line 110
    .line 111
    const/16 p0, 0x322

    .line 112
    .line 113
    return p0

    .line 114
    :cond_4
    return p1

    .line 115
    :pswitch_data_0
    .packed-switch 0x321
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public n(I)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->f(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x7

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    const/16 v0, 0x378

    .line 8
    .line 9
    if-eq p1, v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v1, "\u4e0d\u652f\u6301\u7684field\u4e2d\u6587\u83b7\u53d6\uff1a"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p0

    .line 38
    :pswitch_0
    sget-object v0, Lcom/zte/mifavor/widget/e;->v:[Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    aget-object p0, v0, p0

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_1
    sget-object v0, Lcom/zte/mifavor/widget/e;->u:[Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    aget-object p0, v0, p0

    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_2
    sget-object v0, Lcom/zte/mifavor/widget/e;->t:[Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    aget-object p0, v0, p0

    .line 63
    .line 64
    return-object p0

    .line 65
    :pswitch_3
    sget-object p1, Lcom/zte/mifavor/widget/e;->r:[Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    aget-object p0, p1, p0

    .line 72
    .line 73
    return-object p0

    .line 74
    :pswitch_4
    sget-object p1, Lcom/zte/mifavor/widget/e;->s:[Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    aget-object p0, p1, p0

    .line 81
    .line 82
    return-object p0

    .line 83
    :pswitch_5
    sget-object p1, Lcom/zte/mifavor/widget/e;->q:[Ljava/lang/String;

    .line 84
    .line 85
    iget p0, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 86
    .line 87
    aget-object p0, p1, p0

    .line 88
    .line 89
    return-object p0

    .line 90
    :pswitch_6
    iget p1, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 91
    .line 92
    const-string v0, "\u6708"

    .line 93
    .line 94
    if-lez p1, :cond_0

    .line 95
    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    sget-object v1, Lcom/zte/mifavor/widget/e;->p:[Ljava/lang/String;

    .line 102
    .line 103
    iget p0, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 104
    .line 105
    aget-object p0, v1, p0

    .line 106
    .line 107
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0

    .line 118
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v1, "\u95f0"

    .line 124
    .line 125
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    sget-object v1, Lcom/zte/mifavor/widget/e;->p:[Ljava/lang/String;

    .line 129
    .line 130
    iget p0, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 131
    .line 132
    neg-int p0, p0

    .line 133
    aget-object p0, v1, p0

    .line 134
    .line 135
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    return-object p0

    .line 146
    :pswitch_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .line 150
    .line 151
    const/16 v0, 0x326

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const/16 v0, 0x327

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0

    .line 174
    :cond_1
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    return-object p0

    .line 183
    :cond_2
    sget-object v0, Lcom/zte/mifavor/widget/e;->o:[Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    aget-object p0, v0, p0

    .line 190
    .line 191
    return-object p0

    .line 192
    nop

    .line 193
    :pswitch_data_0
    .packed-switch 0x321
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public o()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x321

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 13
    .line 14
    .line 15
    const/16 v1, 0x322

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 22
    .line 23
    .line 24
    const/16 v1, 0x323

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 12
    .line 13
    .line 14
    const-string v1, "\u5e74"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 17
    .line 18
    .line 19
    const/16 v1, 0x322

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 26
    .line 27
    .line 28
    const/16 v1, 0x323

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 35
    .line 36
    .line 37
    const-string v1, " "

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x7

    .line 43
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string v0, "\u5341\u4e00\u6708"

    .line 55
    .line 56
    const-string v1, "\u51ac\u6708"

    .line 57
    .line 58
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "\u5341\u4e8c\u6708"

    .line 63
    .line 64
    const-string v1, "\u814a\u6708"

    .line 65
    .line 66
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public roll(II)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->f(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->u(I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2}, Ljava/util/GregorianCalendar;->roll(II)V

    .line 12
    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    packed-switch p1, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 26
    .line 27
    new-instance p2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v0, "\u4e0d\u652f\u6301\u7684field\uff1a"

    .line 33
    .line 34
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p0

    .line 48
    :pswitch_0
    iget p1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 49
    .line 50
    iget v2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 51
    .line 52
    invoke-static {p1, v2}, Lcom/zte/mifavor/widget/e;->k(II)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    move v2, v1

    .line 57
    :goto_0
    if-ge v2, p2, :cond_2

    .line 58
    .line 59
    iget v3, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 60
    .line 61
    add-int/2addr v3, v0

    .line 62
    iput v3, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 63
    .line 64
    if-le v3, p1, :cond_1

    .line 65
    .line 66
    iput v0, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 67
    .line 68
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :pswitch_1
    move p1, v1

    .line 72
    :goto_1
    if-ge p1, p2, :cond_2

    .line 73
    .line 74
    iget v2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 75
    .line 76
    iget v3, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 77
    .line 78
    invoke-static {v2, v3}, Lcom/zte/mifavor/widget/e;->x(II)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    iput v2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 83
    .line 84
    add-int/lit8 p1, p1, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :pswitch_2
    iget p1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 88
    .line 89
    add-int/2addr p1, p2

    .line 90
    iput p1, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 91
    .line 92
    :cond_2
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 93
    .line 94
    iput-boolean v1, p0, Ljava/util/GregorianCalendar;->areFieldsSet:Z

    .line 95
    .line 96
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 97
    .line 98
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 99
    .line 100
    return-void

    .line 101
    :pswitch_data_0
    .packed-switch 0x321
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public set(II)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SwitchIntDef"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->f(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/e;->u(I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 15
    .line 16
    new-instance p2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v0, "\u4e0d\u652f\u6301\u7684field\u8bbe\u7f6e\uff1a"

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p0

    .line 37
    :pswitch_0
    iput p2, p0, Lcom/zte/mifavor/widget/e;->i:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :pswitch_1
    iput p2, p0, Lcom/zte/mifavor/widget/e;->h:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :pswitch_2
    iput p2, p0, Lcom/zte/mifavor/widget/e;->g:I

    .line 44
    .line 45
    :goto_0
    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    invoke-super {p0, p1, p2}, Ljava/util/GregorianCalendar;->set(II)V

    .line 50
    .line 51
    .line 52
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->n:Z

    .line 53
    .line 54
    :goto_1
    iput-boolean v1, p0, Ljava/util/GregorianCalendar;->areFieldsSet:Z

    .line 55
    .line 56
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->l:Z

    .line 57
    .line 58
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/e;->m:Z

    .line 59
    .line 60
    return-void

    .line 61
    :pswitch_data_0
    .packed-switch 0x321
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public t()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 12
    .line 13
    .line 14
    const-string v2, "-"

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 17
    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    invoke-virtual {p0, v3}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    add-int/2addr v3, v1

    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x5

    .line 32
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/e;->t()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    .line 12
    .line 13
    const-string v1, " | "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x7

    .line 19
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 24
    .line 25
    .line 26
    const-string v1, " | [\u519c\u5386]"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/e;->o()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 36
    .line 37
    .line 38
    const-string v1, " "

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 41
    .line 42
    .line 43
    const/16 v2, 0x328

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 50
    .line 51
    .line 52
    const-string v2, "\u5e74 "

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    .line 56
    .line 57
    const/16 v2, 0x324

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 64
    .line 65
    .line 66
    const-string v3, "\u65e5"

    .line 67
    .line 68
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v2}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 79
    .line 80
    .line 81
    const/16 v1, 0x325

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->get(I)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/e;->n(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method
