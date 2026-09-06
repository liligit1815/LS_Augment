.class LF0/m;
.super Ljava/lang/Object;
.source "FontCharacterParser.java"


# static fields
.field private static final a:LG0/c$a;

.field private static final b:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-string v4, "fFamily"

    .line 2
    .line 3
    const-string v5, "data"

    .line 4
    .line 5
    const-string v0, "ch"

    .line 6
    .line 7
    const-string v1, "size"

    .line 8
    .line 9
    const-string v2, "w"

    .line 10
    .line 11
    const-string v3, "style"

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, LF0/m;->a:LG0/c$a;

    .line 22
    .line 23
    const-string v0, "shapes"

    .line 24
    .line 25
    filled-new-array {v0}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, LF0/m;->b:LG0/c$a;

    .line 34
    .line 35
    return-void
.end method

.method static a(LG0/c;Lv0/h;)LA0/d;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LG0/c;->d()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    move-wide v5, v2

    .line 14
    move-object v7, v4

    .line 15
    move-object v8, v7

    .line 16
    move v2, v0

    .line 17
    move-wide v3, v5

    .line 18
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 19
    .line 20
    .line 21
    move-result v9

    .line 22
    if-eqz v9, :cond_9

    .line 23
    .line 24
    sget-object v9, LF0/m;->a:LG0/c$a;

    .line 25
    .line 26
    invoke-virtual {p0, v9}, LG0/c;->F(LG0/c$a;)I

    .line 27
    .line 28
    .line 29
    move-result v9

    .line 30
    if-eqz v9, :cond_8

    .line 31
    .line 32
    const/4 v10, 0x1

    .line 33
    if-eq v9, v10, :cond_7

    .line 34
    .line 35
    const/4 v10, 0x2

    .line 36
    if-eq v9, v10, :cond_6

    .line 37
    .line 38
    const/4 v10, 0x3

    .line 39
    if-eq v9, v10, :cond_5

    .line 40
    .line 41
    const/4 v10, 0x4

    .line 42
    if-eq v9, v10, :cond_4

    .line 43
    .line 44
    const/4 v10, 0x5

    .line 45
    if-eq v9, v10, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, LG0/c;->I()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, LG0/c;->J()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {p0}, LG0/c;->d()V

    .line 55
    .line 56
    .line 57
    :goto_1
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 58
    .line 59
    .line 60
    move-result v9

    .line 61
    if-eqz v9, :cond_3

    .line 62
    .line 63
    sget-object v9, LF0/m;->b:LG0/c$a;

    .line 64
    .line 65
    invoke-virtual {p0, v9}, LG0/c;->F(LG0/c$a;)I

    .line 66
    .line 67
    .line 68
    move-result v9

    .line 69
    if-eqz v9, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, LG0/c;->I()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, LG0/c;->J()V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    invoke-virtual {p0}, LG0/c;->c()V

    .line 79
    .line 80
    .line 81
    :goto_2
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    if-eqz v9, :cond_2

    .line 86
    .line 87
    invoke-static {p0, p1}, LF0/h;->a(LG0/c;Lv0/h;)LC0/c;

    .line 88
    .line 89
    .line 90
    move-result-object v9

    .line 91
    check-cast v9, LC0/p;

    .line 92
    .line 93
    invoke-interface {v1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    invoke-virtual {p0}, LG0/c;->e()V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    invoke-virtual {p0}, LG0/c;->g()V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_4
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    goto :goto_0

    .line 110
    :cond_5
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    goto :goto_0

    .line 115
    :cond_6
    invoke-virtual {p0}, LG0/c;->v()D

    .line 116
    .line 117
    .line 118
    move-result-wide v5

    .line 119
    goto :goto_0

    .line 120
    :cond_7
    invoke-virtual {p0}, LG0/c;->v()D

    .line 121
    .line 122
    .line 123
    move-result-wide v3

    .line 124
    goto :goto_0

    .line 125
    :cond_8
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    goto :goto_0

    .line 134
    :cond_9
    invoke-virtual {p0}, LG0/c;->g()V

    .line 135
    .line 136
    .line 137
    new-instance v0, LA0/d;

    .line 138
    .line 139
    invoke-direct/range {v0 .. v8}, LA0/d;-><init>(Ljava/util/List;CDDLjava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-object v0
.end method
