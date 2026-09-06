.class public final LY1/k;
.super Ljava/lang/Object;
.source "TaskbarIconSpecs.kt"


# static fields
.field public static final a:LY1/k;

.field private static final b:LY1/j;

.field private static final c:LY1/j;

.field private static final d:LY1/j;

.field private static final e:LY1/j;

.field private static final f:[LY1/j;

.field private static final g:LY1/j;

.field private static final h:LY1/j;

.field private static final i:LY1/j;

.field private static final j:LY1/i;

.field private static final k:LY1/i;

.field private static final l:LY1/j;

.field private static final m:LY1/j;

.field private static final n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "LY1/m;",
            "LY1/j;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    new-instance v0, LY1/k;

    .line 2
    .line 3
    invoke-direct {v0}, LY1/k;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LY1/k;->a:LY1/k;

    .line 7
    .line 8
    new-instance v0, LY1/j;

    .line 9
    .line 10
    const/16 v1, 0x2c

    .line 11
    .line 12
    invoke-direct {v0, v1}, LY1/j;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, LY1/k;->b:LY1/j;

    .line 16
    .line 17
    new-instance v1, LY1/j;

    .line 18
    .line 19
    const/16 v2, 0x30

    .line 20
    .line 21
    invoke-direct {v1, v2}, LY1/j;-><init>(I)V

    .line 22
    .line 23
    .line 24
    sput-object v1, LY1/k;->c:LY1/j;

    .line 25
    .line 26
    new-instance v3, LY1/j;

    .line 27
    .line 28
    const/16 v4, 0x34

    .line 29
    .line 30
    invoke-direct {v3, v4}, LY1/j;-><init>(I)V

    .line 31
    .line 32
    .line 33
    sput-object v3, LY1/k;->d:LY1/j;

    .line 34
    .line 35
    new-instance v4, LY1/j;

    .line 36
    .line 37
    const/16 v5, 0x39

    .line 38
    .line 39
    invoke-direct {v4, v5}, LY1/j;-><init>(I)V

    .line 40
    .line 41
    .line 42
    sput-object v4, LY1/k;->e:LY1/j;

    .line 43
    .line 44
    filled-new-array {v1, v3, v4}, [LY1/j;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    sput-object v5, LY1/k;->f:[LY1/j;

    .line 49
    .line 50
    sput-object v0, LY1/k;->g:LY1/j;

    .line 51
    .line 52
    sput-object v1, LY1/k;->h:LY1/j;

    .line 53
    .line 54
    sput-object v0, LY1/k;->i:LY1/j;

    .line 55
    .line 56
    new-instance v0, LY1/i;

    .line 57
    .line 58
    const/4 v5, 0x6

    .line 59
    invoke-direct {v0, v5}, LY1/i;-><init>(I)V

    .line 60
    .line 61
    .line 62
    sput-object v0, LY1/k;->j:LY1/i;

    .line 63
    .line 64
    new-instance v0, LY1/i;

    .line 65
    .line 66
    const/16 v6, 0xc

    .line 67
    .line 68
    invoke-direct {v0, v6}, LY1/i;-><init>(I)V

    .line 69
    .line 70
    .line 71
    sput-object v0, LY1/k;->k:LY1/i;

    .line 72
    .line 73
    new-instance v0, LY1/j;

    .line 74
    .line 75
    invoke-direct {v0, v2}, LY1/j;-><init>(I)V

    .line 76
    .line 77
    .line 78
    sput-object v0, LY1/k;->l:LY1/j;

    .line 79
    .line 80
    sput-object v4, LY1/k;->m:LY1/j;

    .line 81
    .line 82
    new-instance v0, LY1/m;

    .line 83
    .line 84
    const/4 v2, 0x5

    .line 85
    const/4 v6, 0x0

    .line 86
    invoke-direct {v0, v5, v2, v6}, LY1/m;-><init>(IIZ)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, v4}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    new-instance v0, LY1/m;

    .line 94
    .line 95
    const/4 v8, 0x1

    .line 96
    invoke-direct {v0, v5, v2, v8}, LY1/m;-><init>(IIZ)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v4}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v5, LY1/m;

    .line 104
    .line 105
    const/4 v9, 0x4

    .line 106
    invoke-direct {v5, v9, v9, v6}, LY1/m;-><init>(IIZ)V

    .line 107
    .line 108
    .line 109
    invoke-static {v5, v3}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    new-instance v10, LY1/m;

    .line 114
    .line 115
    invoke-direct {v10, v9, v9, v8}, LY1/m;-><init>(IIZ)V

    .line 116
    .line 117
    .line 118
    invoke-static {v10, v4}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 119
    .line 120
    .line 121
    move-result-object v10

    .line 122
    new-instance v4, LY1/m;

    .line 123
    .line 124
    invoke-direct {v4, v9, v2, v6}, LY1/m;-><init>(IIZ)V

    .line 125
    .line 126
    .line 127
    invoke-static {v4, v3}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 128
    .line 129
    .line 130
    move-result-object v11

    .line 131
    new-instance v4, LY1/m;

    .line 132
    .line 133
    invoke-direct {v4, v9, v2, v8}, LY1/m;-><init>(IIZ)V

    .line 134
    .line 135
    .line 136
    invoke-static {v4, v3}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 137
    .line 138
    .line 139
    move-result-object v12

    .line 140
    new-instance v3, LY1/m;

    .line 141
    .line 142
    invoke-direct {v3, v2, v2, v6}, LY1/m;-><init>(IIZ)V

    .line 143
    .line 144
    .line 145
    invoke-static {v3, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 146
    .line 147
    .line 148
    move-result-object v13

    .line 149
    new-instance v3, LY1/m;

    .line 150
    .line 151
    invoke-direct {v3, v2, v2, v8}, LY1/m;-><init>(IIZ)V

    .line 152
    .line 153
    .line 154
    invoke-static {v3, v1}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 155
    .line 156
    .line 157
    move-result-object v14

    .line 158
    move-object v8, v0

    .line 159
    move-object v9, v5

    .line 160
    filled-new-array/range {v7 .. v14}, [Lh4/l;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v0}, Li4/F;->e([Lh4/l;)Ljava/util/Map;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    sput-object v0, LY1/k;->n:Ljava/util/Map;

    .line 169
    .line 170
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()LY1/i;
    .locals 0

    .line 1
    sget-object p0, LY1/k;->j:LY1/i;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()LY1/j;
    .locals 0

    .line 1
    sget-object p0, LY1/k;->g:LY1/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()LY1/i;
    .locals 0

    .line 1
    sget-object p0, LY1/k;->k:LY1/i;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()LY1/j;
    .locals 0

    .line 1
    sget-object p0, LY1/k;->h:LY1/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()LY1/j;
    .locals 0

    .line 1
    sget-object p0, LY1/k;->e:LY1/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()LY1/j;
    .locals 0

    .line 1
    sget-object p0, LY1/k;->m:LY1/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "LY1/m;",
            "LY1/j;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, LY1/k;->n:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method
