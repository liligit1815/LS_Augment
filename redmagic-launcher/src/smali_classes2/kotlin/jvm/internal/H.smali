.class public Lkotlin/jvm/internal/H;
.super Ljava/lang/Object;
.source "TypeIntrinsics.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 1

    .line 1
    instance-of v0, p0, Lv4/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lv4/b;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "kotlin.collections.MutableCollection"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/H;->l(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p0}, Lkotlin/jvm/internal/H;->e(Ljava/lang/Object;)Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static b(Ljava/lang/Object;)Ljava/lang/Iterable;
    .locals 1

    .line 1
    instance-of v0, p0, Lv4/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lv4/c;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "kotlin.collections.MutableIterable"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/H;->l(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p0}, Lkotlin/jvm/internal/H;->f(Ljava/lang/Object;)Ljava/lang/Iterable;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static c(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1

    .line 1
    instance-of v0, p0, Lv4/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lv4/d;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "kotlin.collections.MutableMap"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lkotlin/jvm/internal/H;->l(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p0}, Lkotlin/jvm/internal/H;->g(Ljava/lang/Object;)Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static d(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p0, p1}, Lkotlin/jvm/internal/H;->i(Ljava/lang/Object;I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "kotlin.jvm.functions.Function"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p0, p1}, Lkotlin/jvm/internal/H;->l(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object p0
.end method

.method public static e(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 0

    .line 1
    :try_start_0
    check-cast p0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :catch_0
    move-exception p0

    .line 5
    invoke-static {p0}, Lkotlin/jvm/internal/H;->k(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    throw p0
.end method

.method public static f(Ljava/lang/Object;)Ljava/lang/Iterable;
    .locals 0

    .line 1
    :try_start_0
    check-cast p0, Ljava/lang/Iterable;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :catch_0
    move-exception p0

    .line 5
    invoke-static {p0}, Lkotlin/jvm/internal/H;->k(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    throw p0
.end method

.method public static g(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0

    .line 1
    :try_start_0
    check-cast p0, Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :catch_0
    move-exception p0

    .line 5
    invoke-static {p0}, Lkotlin/jvm/internal/H;->k(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    throw p0
.end method

.method public static h(Ljava/lang/Object;)I
    .locals 1

    .line 1
    instance-of v0, p0, Lkotlin/jvm/internal/k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lkotlin/jvm/internal/k;

    .line 6
    .line 7
    invoke-interface {p0}, Lkotlin/jvm/internal/k;->getArity()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of v0, p0, Lu4/a;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    instance-of v0, p0, Lu4/l;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_2
    instance-of v0, p0, Lu4/p;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    const/4 p0, 0x2

    .line 29
    return p0

    .line 30
    :cond_3
    instance-of v0, p0, Lu4/q;

    .line 31
    .line 32
    if-eqz v0, :cond_4

    .line 33
    .line 34
    const/4 p0, 0x3

    .line 35
    return p0

    .line 36
    :cond_4
    instance-of v0, p0, Lu4/r;

    .line 37
    .line 38
    if-eqz v0, :cond_5

    .line 39
    .line 40
    const/4 p0, 0x4

    .line 41
    return p0

    .line 42
    :cond_5
    instance-of v0, p0, Lu4/s;

    .line 43
    .line 44
    if-eqz v0, :cond_6

    .line 45
    .line 46
    const/4 p0, 0x5

    .line 47
    return p0

    .line 48
    :cond_6
    instance-of v0, p0, Lu4/t;

    .line 49
    .line 50
    if-eqz v0, :cond_7

    .line 51
    .line 52
    const/4 p0, 0x6

    .line 53
    return p0

    .line 54
    :cond_7
    instance-of v0, p0, Lu4/u;

    .line 55
    .line 56
    if-eqz v0, :cond_8

    .line 57
    .line 58
    const/4 p0, 0x7

    .line 59
    return p0

    .line 60
    :cond_8
    instance-of v0, p0, Lu4/v;

    .line 61
    .line 62
    if-eqz v0, :cond_9

    .line 63
    .line 64
    const/16 p0, 0x8

    .line 65
    .line 66
    return p0

    .line 67
    :cond_9
    instance-of v0, p0, Lu4/w;

    .line 68
    .line 69
    if-eqz v0, :cond_a

    .line 70
    .line 71
    const/16 p0, 0x9

    .line 72
    .line 73
    return p0

    .line 74
    :cond_a
    instance-of v0, p0, Lu4/b;

    .line 75
    .line 76
    if-eqz v0, :cond_b

    .line 77
    .line 78
    const/16 p0, 0xa

    .line 79
    .line 80
    return p0

    .line 81
    :cond_b
    instance-of v0, p0, Lu4/c;

    .line 82
    .line 83
    if-eqz v0, :cond_c

    .line 84
    .line 85
    const/16 p0, 0xb

    .line 86
    .line 87
    return p0

    .line 88
    :cond_c
    instance-of v0, p0, Lu4/d;

    .line 89
    .line 90
    if-eqz v0, :cond_d

    .line 91
    .line 92
    const/16 p0, 0xc

    .line 93
    .line 94
    return p0

    .line 95
    :cond_d
    instance-of v0, p0, Lu4/e;

    .line 96
    .line 97
    if-eqz v0, :cond_e

    .line 98
    .line 99
    const/16 p0, 0xd

    .line 100
    .line 101
    return p0

    .line 102
    :cond_e
    instance-of v0, p0, Lu4/f;

    .line 103
    .line 104
    if-eqz v0, :cond_f

    .line 105
    .line 106
    const/16 p0, 0xe

    .line 107
    .line 108
    return p0

    .line 109
    :cond_f
    instance-of v0, p0, Lu4/g;

    .line 110
    .line 111
    if-eqz v0, :cond_10

    .line 112
    .line 113
    const/16 p0, 0xf

    .line 114
    .line 115
    return p0

    .line 116
    :cond_10
    instance-of v0, p0, Lu4/h;

    .line 117
    .line 118
    if-eqz v0, :cond_11

    .line 119
    .line 120
    const/16 p0, 0x10

    .line 121
    .line 122
    return p0

    .line 123
    :cond_11
    instance-of v0, p0, Lu4/i;

    .line 124
    .line 125
    if-eqz v0, :cond_12

    .line 126
    .line 127
    const/16 p0, 0x11

    .line 128
    .line 129
    return p0

    .line 130
    :cond_12
    instance-of v0, p0, Lu4/j;

    .line 131
    .line 132
    if-eqz v0, :cond_13

    .line 133
    .line 134
    const/16 p0, 0x12

    .line 135
    .line 136
    return p0

    .line 137
    :cond_13
    instance-of v0, p0, Lu4/k;

    .line 138
    .line 139
    if-eqz v0, :cond_14

    .line 140
    .line 141
    const/16 p0, 0x13

    .line 142
    .line 143
    return p0

    .line 144
    :cond_14
    instance-of v0, p0, Lu4/m;

    .line 145
    .line 146
    if-eqz v0, :cond_15

    .line 147
    .line 148
    const/16 p0, 0x14

    .line 149
    .line 150
    return p0

    .line 151
    :cond_15
    instance-of v0, p0, Lu4/n;

    .line 152
    .line 153
    if-eqz v0, :cond_16

    .line 154
    .line 155
    const/16 p0, 0x15

    .line 156
    .line 157
    return p0

    .line 158
    :cond_16
    instance-of p0, p0, Lu4/o;

    .line 159
    .line 160
    if-eqz p0, :cond_17

    .line 161
    .line 162
    const/16 p0, 0x16

    .line 163
    .line 164
    return p0

    .line 165
    :cond_17
    const/4 p0, -0x1

    .line 166
    return p0
.end method

.method public static i(Ljava/lang/Object;I)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lh4/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lkotlin/jvm/internal/H;->h(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private static j(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Throwable;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1
    const-class v0, Lkotlin/jvm/internal/H;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->m(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/Throwable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static k(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;
    .locals 0

    .line 1
    invoke-static {p0}, Lkotlin/jvm/internal/H;->j(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/ClassCastException;

    .line 6
    .line 7
    throw p0
.end method

.method public static l(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "null"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p0, " cannot be cast to "

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lkotlin/jvm/internal/H;->m(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static m(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ClassCastException;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lkotlin/jvm/internal/H;->k(Ljava/lang/ClassCastException;)Ljava/lang/ClassCastException;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    throw p0
.end method
