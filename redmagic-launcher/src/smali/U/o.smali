.class public final LU/o;
.super Ljava/lang/Object;
.source "Morph.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU/o$a;
    }
.end annotation


# static fields
.field public static final d:LU/o$a;


# instance fields
.field private final a:LU/x;

.field private final b:LU/x;

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lh4/l<",
            "LU/c;",
            "LU/c;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LU/o$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LU/o$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LU/o;->d:LU/o$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(LU/x;LU/x;)V
    .locals 1

    .line 1
    const-string v0, "start"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "end"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, LU/o;->a:LU/x;

    .line 15
    .line 16
    iput-object p2, p0, LU/o;->b:LU/x;

    .line 17
    .line 18
    sget-object v0, LU/o;->d:LU/o$a;

    .line 19
    .line 20
    invoke-virtual {v0, p1, p2}, LU/o$a;->a(LU/x;LU/x;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, LU/o;->c:Ljava/util/List;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a(F)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Ljava/util/List<",
            "LU/c;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v0, LU/o;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x0

    .line 15
    move-object v5, v3

    .line 16
    move v6, v4

    .line 17
    :goto_0
    if-ge v6, v2, :cond_3

    .line 18
    .line 19
    const/16 v7, 0x8

    .line 20
    .line 21
    new-array v8, v7, [F

    .line 22
    .line 23
    move v9, v4

    .line 24
    :goto_1
    if-ge v9, v7, :cond_0

    .line 25
    .line 26
    iget-object v10, v0, LU/o;->c:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v10

    .line 32
    check-cast v10, Lh4/l;

    .line 33
    .line 34
    invoke-virtual {v10}, Lh4/l;->c()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v10

    .line 38
    check-cast v10, LU/c;

    .line 39
    .line 40
    invoke-virtual {v10}, LU/c;->j()[F

    .line 41
    .line 42
    .line 43
    move-result-object v10

    .line 44
    aget v10, v10, v9

    .line 45
    .line 46
    iget-object v11, v0, LU/o;->c:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v11, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v11

    .line 52
    check-cast v11, Lh4/l;

    .line 53
    .line 54
    invoke-virtual {v11}, Lh4/l;->d()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v11

    .line 58
    check-cast v11, LU/c;

    .line 59
    .line 60
    invoke-virtual {v11}, LU/c;->j()[F

    .line 61
    .line 62
    .line 63
    move-result-object v11

    .line 64
    aget v11, v11, v9

    .line 65
    .line 66
    move/from16 v12, p1

    .line 67
    .line 68
    invoke-static {v10, v11, v12}, LU/C;->e(FFF)F

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    aput v10, v8, v9

    .line 73
    .line 74
    add-int/lit8 v9, v9, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_0
    move/from16 v12, p1

    .line 78
    .line 79
    new-instance v7, LU/c;

    .line 80
    .line 81
    invoke-direct {v7, v8}, LU/c;-><init>([F)V

    .line 82
    .line 83
    .line 84
    if-nez v5, :cond_1

    .line 85
    .line 86
    move-object v5, v7

    .line 87
    :cond_1
    if-eqz v3, :cond_2

    .line 88
    .line 89
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 93
    .line 94
    move-object v3, v7

    .line 95
    goto :goto_0

    .line 96
    :cond_3
    if-eqz v3, :cond_4

    .line 97
    .line 98
    if-eqz v5, :cond_4

    .line 99
    .line 100
    invoke-virtual {v3}, LU/c;->b()F

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    invoke-virtual {v3}, LU/c;->c()F

    .line 105
    .line 106
    .line 107
    move-result v9

    .line 108
    invoke-virtual {v3}, LU/c;->f()F

    .line 109
    .line 110
    .line 111
    move-result v10

    .line 112
    invoke-virtual {v3}, LU/c;->g()F

    .line 113
    .line 114
    .line 115
    move-result v11

    .line 116
    invoke-virtual {v3}, LU/c;->h()F

    .line 117
    .line 118
    .line 119
    move-result v12

    .line 120
    invoke-virtual {v3}, LU/c;->i()F

    .line 121
    .line 122
    .line 123
    move-result v13

    .line 124
    invoke-virtual {v5}, LU/c;->b()F

    .line 125
    .line 126
    .line 127
    move-result v14

    .line 128
    invoke-virtual {v5}, LU/c;->c()F

    .line 129
    .line 130
    .line 131
    move-result v15

    .line 132
    invoke-static/range {v8 .. v15}, LU/d;->a(FFFFFFFF)LU/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    :cond_4
    invoke-static {v1}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    return-object v0
.end method
