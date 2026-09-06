.class public Lz1/L0;
.super Ljava/lang/Object;
.source "DeviceGridState.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lz1/L0;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Ljava/lang/String;

.field private final h:I

.field private final i:I

.field private final j:Ljava/lang/String;

.field private final k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 7
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    move-result-object p1

    invoke-direct {p0, p1}, Lz1/L0;-><init>(Lcom/android/launcher3/J3;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/F1;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    iget v1, p1, Lcom/android/launcher3/F1;->H0:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p1, Lcom/android/launcher3/F1;->G0:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%d,%d"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 3
    iget v0, p1, Lcom/android/launcher3/F1;->e1:I

    iput v0, p0, Lz1/L0;->h:I

    .line 4
    iget v0, p1, Lcom/android/launcher3/F1;->P0:I

    iput v0, p0, Lz1/L0;->i:I

    .line 5
    iget-object v0, p1, Lcom/android/launcher3/F1;->E1:Ljava/lang/String;

    iput-object v0, p0, Lz1/L0;->j:Ljava/lang/String;

    .line 6
    iget p1, p1, Lcom/android/launcher3/F1;->D1:I

    iput p1, p0, Lz1/L0;->k:I

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/J3;)V
    .locals 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    sget-object v0, Lcom/android/launcher3/J3;->h:Lcom/android/launcher3/X;

    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 10
    sget-object v0, Lcom/android/launcher3/J3;->i:Lcom/android/launcher3/X;

    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lz1/L0;->h:I

    .line 11
    sget-object v0, Lcom/android/launcher3/J3;->l:Lcom/android/launcher3/X;

    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lz1/L0;->i:I

    .line 12
    sget-object v0, Lcom/android/launcher3/J3;->m:Lcom/android/launcher3/X;

    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lz1/L0;->j:Ljava/lang/String;

    .line 13
    sget-object v0, Lcom/android/launcher3/J3;->n:Lcom/android/launcher3/X;

    invoke-virtual {p1, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lz1/L0;->k:I

    return-void
.end method


# virtual methods
.method public a(Lz1/L0;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lz1/L0;->c()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lz1/L0;->i()Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    mul-int/2addr v0, p0

    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1}, Lz1/L0;->c()Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1}, Lz1/L0;->i()Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    mul-int/2addr v0, p1

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method public c()Ljava/lang/Integer;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, ","

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x0

    .line 24
    aget-object p0, p0, v0

    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lz1/L0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lz1/L0;->a(Lz1/L0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/L0;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Lz1/L0;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lz1/L0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lz1/L0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Ljava/lang/Integer;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, ","

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x1

    .line 24
    aget-object p0, p0, v0

    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public j()Lcom/android/launcher3/logging/StatsLogManager$e;
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_8

    .line 8
    .line 9
    iget-object p0, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    sparse-switch v1, :sswitch_data_0

    .line 20
    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :sswitch_0
    const-string v1, "6,5"

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x7

    .line 34
    goto :goto_0

    .line 35
    :sswitch_1
    const-string v1, "5,6"

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v0, 0x6

    .line 45
    goto :goto_0

    .line 46
    :sswitch_2
    const-string v1, "5,5"

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const/4 v0, 0x5

    .line 56
    goto :goto_0

    .line 57
    :sswitch_3
    const-string v1, "4,6"

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    const/4 v0, 0x4

    .line 67
    goto :goto_0

    .line 68
    :sswitch_4
    const-string v1, "4,5"

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_4

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    const/4 v0, 0x3

    .line 78
    goto :goto_0

    .line 79
    :sswitch_5
    const-string v1, "4,4"

    .line 80
    .line 81
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_5

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    const/4 v0, 0x2

    .line 89
    goto :goto_0

    .line 90
    :sswitch_6
    const-string v1, "3,3"

    .line 91
    .line 92
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_6

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    const/4 v0, 0x1

    .line 100
    goto :goto_0

    .line 101
    :sswitch_7
    const-string v1, "2,2"

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_7

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_7
    const/4 v0, 0x0

    .line 111
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :pswitch_0
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->n1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 116
    .line 117
    return-object p0

    .line 118
    :pswitch_1
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->m1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 119
    .line 120
    return-object p0

    .line 121
    :pswitch_2
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->l1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 122
    .line 123
    return-object p0

    .line 124
    :pswitch_3
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->k1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 125
    .line 126
    return-object p0

    .line 127
    :pswitch_4
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->j1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 128
    .line 129
    return-object p0

    .line 130
    :pswitch_5
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->i1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 131
    .line 132
    return-object p0

    .line 133
    :pswitch_6
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->h1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 134
    .line 135
    return-object p0

    .line 136
    :pswitch_7
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->g1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_8
    :goto_1
    const/4 p0, 0x0

    .line 140
    return-object p0

    .line 141
    :sswitch_data_0
    .sparse-switch
        0xc138 -> :sswitch_7
        0xc4fa -> :sswitch_6
        0xc8bc -> :sswitch_5
        0xc8bd -> :sswitch_4
        0xc8be -> :sswitch_3
        0xcc7e -> :sswitch_2
        0xcc7f -> :sswitch_1
        0xd03f -> :sswitch_0
    .end sparse-switch

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :pswitch_data_0
    .packed-switch 0x0
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

.method public k(Lz1/L0;)Z
    .locals 0

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-nez p1, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_1
    iget-object p0, p0, Lz1/L0;->j:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lz1/L0;->j:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public m(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/android/launcher3/J3;->h:Lcom/android/launcher3/X;

    .line 6
    .line 7
    iget-object v1, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/android/launcher3/J3;->i:Lcom/android/launcher3/X;

    .line 14
    .line 15
    iget v2, p0, Lz1/L0;->h:I

    .line 16
    .line 17
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget-object v2, Lcom/android/launcher3/J3;->l:Lcom/android/launcher3/X;

    .line 26
    .line 27
    iget v3, p0, Lz1/L0;->i:I

    .line 28
    .line 29
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, v3}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    sget-object v3, Lcom/android/launcher3/J3;->m:Lcom/android/launcher3/X;

    .line 38
    .line 39
    iget-object v4, p0, Lz1/L0;->j:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    sget-object v4, Lcom/android/launcher3/J3;->n:Lcom/android/launcher3/X;

    .line 46
    .line 47
    iget p0, p0, Lz1/L0;->k:I

    .line 48
    .line 49
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v4, p0}, Lcom/android/launcher3/H1;->f(Ljava/lang/Object;)Lh4/l;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {v0, v1, v2, v3, p0}, [Lh4/l;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lcom/android/launcher3/J3;->t([Lh4/l;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "DeviceGridState{mGridSizeString=\'"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lz1/L0;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x27

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ", mNumHotseat="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget v1, p0, Lz1/L0;->h:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", mDeviceType="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget v1, p0, Lz1/L0;->i:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, ", mDbFile="

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lz1/L0;->j:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x7d

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method
