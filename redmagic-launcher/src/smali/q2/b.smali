.class public final Lq2/b;
.super Ljava/lang/Object;
.source "WidgetPreviewContainerSizes.kt"


# static fields
.field private static final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lq2/a;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lq2/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 20

    .line 1
    new-instance v0, Lq2/a;

    .line 2
    .line 3
    const/4 v8, 0x4

    .line 4
    const/4 v9, 0x3

    .line 5
    invoke-direct {v0, v8, v9}, Lq2/a;-><init>(II)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lq2/a;

    .line 9
    .line 10
    const/4 v10, 0x2

    .line 11
    invoke-direct {v1, v8, v10}, Lq2/a;-><init>(II)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Lq2/a;

    .line 15
    .line 16
    invoke-direct {v2, v10, v9}, Lq2/a;-><init>(II)V

    .line 17
    .line 18
    .line 19
    new-instance v3, Lq2/a;

    .line 20
    .line 21
    invoke-direct {v3, v10, v10}, Lq2/a;-><init>(II)V

    .line 22
    .line 23
    .line 24
    new-instance v4, Lq2/a;

    .line 25
    .line 26
    const/4 v11, 0x1

    .line 27
    invoke-direct {v4, v8, v11}, Lq2/a;-><init>(II)V

    .line 28
    .line 29
    .line 30
    new-instance v5, Lq2/a;

    .line 31
    .line 32
    invoke-direct {v5, v9, v11}, Lq2/a;-><init>(II)V

    .line 33
    .line 34
    .line 35
    new-instance v6, Lq2/a;

    .line 36
    .line 37
    invoke-direct {v6, v10, v11}, Lq2/a;-><init>(II)V

    .line 38
    .line 39
    .line 40
    new-instance v7, Lq2/a;

    .line 41
    .line 42
    invoke-direct {v7, v11, v11}, Lq2/a;-><init>(II)V

    .line 43
    .line 44
    .line 45
    filled-new-array/range {v0 .. v7}, [Lq2/a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lq2/b;->a:Ljava/util/List;

    .line 54
    .line 55
    new-instance v12, Lq2/a;

    .line 56
    .line 57
    invoke-direct {v12, v9, v8}, Lq2/a;-><init>(II)V

    .line 58
    .line 59
    .line 60
    new-instance v13, Lq2/a;

    .line 61
    .line 62
    invoke-direct {v13, v9, v9}, Lq2/a;-><init>(II)V

    .line 63
    .line 64
    .line 65
    new-instance v14, Lq2/a;

    .line 66
    .line 67
    invoke-direct {v14, v9, v10}, Lq2/a;-><init>(II)V

    .line 68
    .line 69
    .line 70
    new-instance v15, Lq2/a;

    .line 71
    .line 72
    invoke-direct {v15, v10, v9}, Lq2/a;-><init>(II)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Lq2/a;

    .line 76
    .line 77
    invoke-direct {v0, v10, v10}, Lq2/a;-><init>(II)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Lq2/a;

    .line 81
    .line 82
    invoke-direct {v1, v9, v11}, Lq2/a;-><init>(II)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Lq2/a;

    .line 86
    .line 87
    invoke-direct {v2, v10, v11}, Lq2/a;-><init>(II)V

    .line 88
    .line 89
    .line 90
    new-instance v3, Lq2/a;

    .line 91
    .line 92
    invoke-direct {v3, v11, v11}, Lq2/a;-><init>(II)V

    .line 93
    .line 94
    .line 95
    move-object/from16 v16, v0

    .line 96
    .line 97
    move-object/from16 v17, v1

    .line 98
    .line 99
    move-object/from16 v18, v2

    .line 100
    .line 101
    move-object/from16 v19, v3

    .line 102
    .line 103
    filled-new-array/range {v12 .. v19}, [Lq2/a;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    sput-object v0, Lq2/b;->b:Ljava/util/List;

    .line 112
    .line 113
    return-void
.end method

.method public static final a()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lq2/a;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lq2/b;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final b()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lq2/a;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lq2/b;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method
