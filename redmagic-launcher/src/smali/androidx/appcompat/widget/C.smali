.class Landroidx/appcompat/widget/C;
.super Ljava/lang/Object;
.source "AppCompatTextHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/C$f;,
        Landroidx/appcompat/widget/C$c;,
        Landroidx/appcompat/widget/C$d;,
        Landroidx/appcompat/widget/C$e;
    }
.end annotation


# instance fields
.field private final a:Landroid/widget/TextView;

.field private b:Landroidx/appcompat/widget/Y;

.field private c:Landroidx/appcompat/widget/Y;

.field private d:Landroidx/appcompat/widget/Y;

.field private e:Landroidx/appcompat/widget/Y;

.field private f:Landroidx/appcompat/widget/Y;

.field private g:Landroidx/appcompat/widget/Y;

.field private h:Landroidx/appcompat/widget/Y;

.field private final i:Landroidx/appcompat/widget/D;

.field private j:I

.field private k:I

.field private l:Landroid/graphics/Typeface;

.field private m:Z


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Landroidx/appcompat/widget/C;->k:I

    .line 9
    .line 10
    iput-object p1, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 11
    .line 12
    new-instance v0, Landroidx/appcompat/widget/D;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Landroidx/appcompat/widget/D;-><init>(Landroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 18
    .line 19
    return-void
.end method

.method private B(IF)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/D;->t(IF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private C(Landroid/content/Context;Landroidx/appcompat/widget/a0;)V
    .locals 8

    .line 1
    sget v0, Lf/j;->V2:I

    .line 2
    .line 3
    iget v1, p0, Landroidx/appcompat/widget/C;->j:I

    .line 4
    .line 5
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/a0;->k(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 10
    .line 11
    sget v0, Lf/j;->Y2:I

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/a0;->k(II)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Landroidx/appcompat/widget/C;->k:I

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    iget v0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 24
    .line 25
    and-int/2addr v0, v2

    .line 26
    iput v0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 27
    .line 28
    :cond_0
    sget v0, Lf/j;->X2:I

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const/4 v4, 0x1

    .line 35
    const/4 v5, 0x0

    .line 36
    if-nez v3, :cond_5

    .line 37
    .line 38
    sget v3, Lf/j;->Z2:I

    .line 39
    .line 40
    invoke-virtual {p2, v3}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    sget p1, Lf/j;->U2:I

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_e

    .line 54
    .line 55
    iput-boolean v5, p0, Landroidx/appcompat/widget/C;->m:Z

    .line 56
    .line 57
    invoke-virtual {p2, p1, v4}, Landroidx/appcompat/widget/a0;->k(II)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eq p1, v4, :cond_4

    .line 62
    .line 63
    if-eq p1, v2, :cond_3

    .line 64
    .line 65
    const/4 p2, 0x3

    .line 66
    if-eq p1, p2, :cond_2

    .line 67
    .line 68
    goto/16 :goto_5

    .line 69
    .line 70
    :cond_2
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    .line 71
    .line 72
    iput-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    .line 76
    .line 77
    iput-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 81
    .line 82
    iput-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 83
    .line 84
    return-void

    .line 85
    :cond_5
    :goto_0
    const/4 v3, 0x0

    .line 86
    iput-object v3, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 87
    .line 88
    sget v3, Lf/j;->Z2:I

    .line 89
    .line 90
    invoke-virtual {p2, v3}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_6

    .line 95
    .line 96
    move v0, v3

    .line 97
    :cond_6
    iget v3, p0, Landroidx/appcompat/widget/C;->k:I

    .line 98
    .line 99
    iget v6, p0, Landroidx/appcompat/widget/C;->j:I

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_b

    .line 106
    .line 107
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 108
    .line 109
    iget-object v7, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 110
    .line 111
    invoke-direct {p1, v7}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    new-instance v7, Landroidx/appcompat/widget/C$a;

    .line 115
    .line 116
    invoke-direct {v7, p0, v3, v6, p1}, Landroidx/appcompat/widget/C$a;-><init>(Landroidx/appcompat/widget/C;IILjava/lang/ref/WeakReference;)V

    .line 117
    .line 118
    .line 119
    :try_start_0
    iget p1, p0, Landroidx/appcompat/widget/C;->j:I

    .line 120
    .line 121
    invoke-virtual {p2, v0, p1, v7}, Landroidx/appcompat/widget/a0;->j(IILA/h$f;)Landroid/graphics/Typeface;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    if-eqz p1, :cond_9

    .line 126
    .line 127
    iget v3, p0, Landroidx/appcompat/widget/C;->k:I

    .line 128
    .line 129
    if-eq v3, v1, :cond_8

    .line 130
    .line 131
    invoke-static {p1, v5}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iget v3, p0, Landroidx/appcompat/widget/C;->k:I

    .line 136
    .line 137
    iget v6, p0, Landroidx/appcompat/widget/C;->j:I

    .line 138
    .line 139
    and-int/2addr v6, v2

    .line 140
    if-eqz v6, :cond_7

    .line 141
    .line 142
    move v6, v4

    .line 143
    goto :goto_1

    .line 144
    :cond_7
    move v6, v5

    .line 145
    :goto_1
    invoke-static {p1, v3, v6}, Landroidx/appcompat/widget/C$f;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iput-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_8
    iput-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 153
    .line 154
    :cond_9
    :goto_2
    iget-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 155
    .line 156
    if-nez p1, :cond_a

    .line 157
    .line 158
    move p1, v4

    .line 159
    goto :goto_3

    .line 160
    :cond_a
    move p1, v5

    .line 161
    :goto_3
    iput-boolean p1, p0, Landroidx/appcompat/widget/C;->m:Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .line 163
    :catch_0
    :cond_b
    iget-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 164
    .line 165
    if-nez p1, :cond_e

    .line 166
    .line 167
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/a0;->o(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    if-eqz p1, :cond_e

    .line 172
    .line 173
    iget p2, p0, Landroidx/appcompat/widget/C;->k:I

    .line 174
    .line 175
    if-eq p2, v1, :cond_d

    .line 176
    .line 177
    invoke-static {p1, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iget p2, p0, Landroidx/appcompat/widget/C;->k:I

    .line 182
    .line 183
    iget v0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 184
    .line 185
    and-int/2addr v0, v2

    .line 186
    if-eqz v0, :cond_c

    .line 187
    .line 188
    goto :goto_4

    .line 189
    :cond_c
    move v4, v5

    .line 190
    :goto_4
    invoke-static {p1, p2, v4}, Landroidx/appcompat/widget/C$f;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    iput-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 195
    .line 196
    goto :goto_5

    .line 197
    :cond_d
    iget p2, p0, Landroidx/appcompat/widget/C;->j:I

    .line 198
    .line 199
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    iput-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 204
    .line 205
    :cond_e
    :goto_5
    return-void
.end method

.method private a(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/TextView;->getDrawableState()[I

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p2, p0}, Landroidx/appcompat/widget/k;->i(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;[I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static d(Landroid/content/Context;Landroidx/appcompat/widget/k;I)Landroidx/appcompat/widget/Y;
    .locals 0

    .line 1
    invoke-virtual {p1, p0, p2}, Landroidx/appcompat/widget/k;->f(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p1, Landroidx/appcompat/widget/Y;

    .line 8
    .line 9
    invoke-direct {p1}, Landroidx/appcompat/widget/Y;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    iput-boolean p2, p1, Landroidx/appcompat/widget/Y;->d:Z

    .line 14
    .line 15
    iput-object p0, p1, Landroidx/appcompat/widget/Y;->a:Landroid/content/res/ColorStateList;

    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method private y(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x2

    .line 5
    if-nez p5, :cond_b

    .line 6
    .line 7
    if-eqz p6, :cond_0

    .line 8
    .line 9
    goto :goto_8

    .line 10
    :cond_0
    if-nez p1, :cond_2

    .line 11
    .line 12
    if-nez p2, :cond_2

    .line 13
    .line 14
    if-nez p3, :cond_2

    .line 15
    .line 16
    if-eqz p4, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return-void

    .line 20
    :cond_2
    :goto_0
    iget-object p5, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-static {p5}, Landroidx/appcompat/widget/C$c;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p5

    .line 26
    aget-object p6, p5, v2

    .line 27
    .line 28
    if-nez p6, :cond_8

    .line 29
    .line 30
    aget-object v4, p5, v3

    .line 31
    .line 32
    if-eqz v4, :cond_3

    .line 33
    .line 34
    goto :goto_5

    .line 35
    :cond_3
    iget-object p5, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-virtual {p5}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p5

    .line 41
    iget-object p0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 42
    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_4
    aget-object p1, p5, v2

    .line 47
    .line 48
    :goto_1
    if-eqz p2, :cond_5

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_5
    aget-object p2, p5, v1

    .line 52
    .line 53
    :goto_2
    if-eqz p3, :cond_6

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_6
    aget-object p3, p5, v3

    .line 57
    .line 58
    :goto_3
    if-eqz p4, :cond_7

    .line 59
    .line 60
    goto :goto_4

    .line 61
    :cond_7
    aget-object p4, p5, v0

    .line 62
    .line 63
    :goto_4
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_8
    :goto_5
    iget-object p0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 68
    .line 69
    if-eqz p2, :cond_9

    .line 70
    .line 71
    goto :goto_6

    .line 72
    :cond_9
    aget-object p2, p5, v1

    .line 73
    .line 74
    :goto_6
    aget-object p1, p5, v3

    .line 75
    .line 76
    if-eqz p4, :cond_a

    .line 77
    .line 78
    goto :goto_7

    .line 79
    :cond_a
    aget-object p4, p5, v0

    .line 80
    .line 81
    :goto_7
    invoke-static {p0, p6, p2, p1, p4}, Landroidx/appcompat/widget/C$c;->b(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_b
    :goto_8
    iget-object p1, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 86
    .line 87
    invoke-static {p1}, Landroidx/appcompat/widget/C$c;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object p0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 92
    .line 93
    if-eqz p5, :cond_c

    .line 94
    .line 95
    goto :goto_9

    .line 96
    :cond_c
    aget-object p5, p1, v2

    .line 97
    .line 98
    :goto_9
    if-eqz p2, :cond_d

    .line 99
    .line 100
    goto :goto_a

    .line 101
    :cond_d
    aget-object p2, p1, v1

    .line 102
    .line 103
    :goto_a
    if-eqz p6, :cond_e

    .line 104
    .line 105
    goto :goto_b

    .line 106
    :cond_e
    aget-object p6, p1, v3

    .line 107
    .line 108
    :goto_b
    if-eqz p4, :cond_f

    .line 109
    .line 110
    goto :goto_c

    .line 111
    :cond_f
    aget-object p4, p1, v0

    .line 112
    .line 113
    :goto_c
    invoke-static {p0, p5, p2, p6, p4}, Landroidx/appcompat/widget/C$c;->b(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method private z()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 2
    .line 3
    iput-object v0, p0, Landroidx/appcompat/widget/C;->b:Landroidx/appcompat/widget/Y;

    .line 4
    .line 5
    iput-object v0, p0, Landroidx/appcompat/widget/C;->c:Landroidx/appcompat/widget/Y;

    .line 6
    .line 7
    iput-object v0, p0, Landroidx/appcompat/widget/C;->d:Landroidx/appcompat/widget/Y;

    .line 8
    .line 9
    iput-object v0, p0, Landroidx/appcompat/widget/C;->e:Landroidx/appcompat/widget/Y;

    .line 10
    .line 11
    iput-object v0, p0, Landroidx/appcompat/widget/C;->f:Landroidx/appcompat/widget/Y;

    .line 12
    .line 13
    iput-object v0, p0, Landroidx/appcompat/widget/C;->g:Landroidx/appcompat/widget/Y;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method A(IF)V
    .locals 1

    .line 1
    sget-boolean v0, Landroidx/appcompat/widget/h0;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/C;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/C;->B(IF)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method b()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/C;->b:Landroidx/appcompat/widget/Y;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/appcompat/widget/C;->c:Landroidx/appcompat/widget/Y;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/appcompat/widget/C;->d:Landroidx/appcompat/widget/Y;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/appcompat/widget/C;->e:Landroidx/appcompat/widget/Y;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    aget-object v3, v0, v2

    .line 26
    .line 27
    iget-object v4, p0, Landroidx/appcompat/widget/C;->b:Landroidx/appcompat/widget/Y;

    .line 28
    .line 29
    invoke-direct {p0, v3, v4}, Landroidx/appcompat/widget/C;->a(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;)V

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    aget-object v3, v0, v3

    .line 34
    .line 35
    iget-object v4, p0, Landroidx/appcompat/widget/C;->c:Landroidx/appcompat/widget/Y;

    .line 36
    .line 37
    invoke-direct {p0, v3, v4}, Landroidx/appcompat/widget/C;->a(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;)V

    .line 38
    .line 39
    .line 40
    aget-object v3, v0, v1

    .line 41
    .line 42
    iget-object v4, p0, Landroidx/appcompat/widget/C;->d:Landroidx/appcompat/widget/Y;

    .line 43
    .line 44
    invoke-direct {p0, v3, v4}, Landroidx/appcompat/widget/C;->a(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;)V

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x3

    .line 48
    aget-object v0, v0, v3

    .line 49
    .line 50
    iget-object v3, p0, Landroidx/appcompat/widget/C;->e:Landroidx/appcompat/widget/Y;

    .line 51
    .line 52
    invoke-direct {p0, v0, v3}, Landroidx/appcompat/widget/C;->a(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/widget/C;->f:Landroidx/appcompat/widget/Y;

    .line 56
    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Landroidx/appcompat/widget/C;->g:Landroidx/appcompat/widget/Y;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void

    .line 65
    :cond_3
    :goto_0
    iget-object v0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-static {v0}, Landroidx/appcompat/widget/C$c;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    aget-object v2, v0, v2

    .line 72
    .line 73
    iget-object v3, p0, Landroidx/appcompat/widget/C;->f:Landroidx/appcompat/widget/Y;

    .line 74
    .line 75
    invoke-direct {p0, v2, v3}, Landroidx/appcompat/widget/C;->a(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;)V

    .line 76
    .line 77
    .line 78
    aget-object v0, v0, v1

    .line 79
    .line 80
    iget-object v1, p0, Landroidx/appcompat/widget/C;->g:Landroidx/appcompat/widget/Y;

    .line 81
    .line 82
    invoke-direct {p0, v0, v1}, Landroidx/appcompat/widget/C;->a(Landroid/graphics/drawable/Drawable;Landroidx/appcompat/widget/Y;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method c()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/D;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method e()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/D;->f()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method f()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/D;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method g()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/D;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method h()[I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/D;->i()[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method i()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/D;->j()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method j()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/Y;->a:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method k()Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/Y;->b:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/D;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method m(Landroid/util/AttributeSet;I)V
    .locals 17
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v4, p1

    .line 4
    .line 5
    move/from16 v6, p2

    .line 6
    .line 7
    iget-object v1, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v8

    .line 13
    invoke-static {}, Landroidx/appcompat/widget/k;->b()Landroidx/appcompat/widget/k;

    .line 14
    .line 15
    .line 16
    move-result-object v9

    .line 17
    sget-object v3, Lf/j;->Y:[I

    .line 18
    .line 19
    const/4 v10, 0x0

    .line 20
    invoke-static {v8, v4, v3, v6, v10}, Landroidx/appcompat/widget/a0;->v(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/a0;

    .line 21
    .line 22
    .line 23
    move-result-object v11

    .line 24
    iget-object v1, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v11}, Landroidx/appcompat/widget/a0;->r()Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    const/4 v7, 0x0

    .line 35
    invoke-static/range {v1 .. v7}, LJ/I;->h0(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 36
    .line 37
    .line 38
    sget v1, Lf/j;->Z:I

    .line 39
    .line 40
    const/4 v7, -0x1

    .line 41
    invoke-virtual {v11, v1, v7}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    sget v2, Lf/j;->c0:I

    .line 46
    .line 47
    invoke-virtual {v11, v2}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    invoke-virtual {v11, v2, v10}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-static {v8, v9, v2}, Landroidx/appcompat/widget/C;->d(Landroid/content/Context;Landroidx/appcompat/widget/k;I)Landroidx/appcompat/widget/Y;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iput-object v2, v0, Landroidx/appcompat/widget/C;->b:Landroidx/appcompat/widget/Y;

    .line 62
    .line 63
    :cond_0
    sget v2, Lf/j;->a0:I

    .line 64
    .line 65
    invoke-virtual {v11, v2}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_1

    .line 70
    .line 71
    invoke-virtual {v11, v2, v10}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-static {v8, v9, v2}, Landroidx/appcompat/widget/C;->d(Landroid/content/Context;Landroidx/appcompat/widget/k;I)Landroidx/appcompat/widget/Y;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iput-object v2, v0, Landroidx/appcompat/widget/C;->c:Landroidx/appcompat/widget/Y;

    .line 80
    .line 81
    :cond_1
    sget v2, Lf/j;->d0:I

    .line 82
    .line 83
    invoke-virtual {v11, v2}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_2

    .line 88
    .line 89
    invoke-virtual {v11, v2, v10}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-static {v8, v9, v2}, Landroidx/appcompat/widget/C;->d(Landroid/content/Context;Landroidx/appcompat/widget/k;I)Landroidx/appcompat/widget/Y;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iput-object v2, v0, Landroidx/appcompat/widget/C;->d:Landroidx/appcompat/widget/Y;

    .line 98
    .line 99
    :cond_2
    sget v2, Lf/j;->b0:I

    .line 100
    .line 101
    invoke-virtual {v11, v2}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_3

    .line 106
    .line 107
    invoke-virtual {v11, v2, v10}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    invoke-static {v8, v9, v2}, Landroidx/appcompat/widget/C;->d(Landroid/content/Context;Landroidx/appcompat/widget/k;I)Landroidx/appcompat/widget/Y;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iput-object v2, v0, Landroidx/appcompat/widget/C;->e:Landroidx/appcompat/widget/Y;

    .line 116
    .line 117
    :cond_3
    sget v2, Lf/j;->e0:I

    .line 118
    .line 119
    invoke-virtual {v11, v2}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    if-eqz v3, :cond_4

    .line 124
    .line 125
    invoke-virtual {v11, v2, v10}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    invoke-static {v8, v9, v2}, Landroidx/appcompat/widget/C;->d(Landroid/content/Context;Landroidx/appcompat/widget/k;I)Landroidx/appcompat/widget/Y;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    iput-object v2, v0, Landroidx/appcompat/widget/C;->f:Landroidx/appcompat/widget/Y;

    .line 134
    .line 135
    :cond_4
    sget v2, Lf/j;->f0:I

    .line 136
    .line 137
    invoke-virtual {v11, v2}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-eqz v3, :cond_5

    .line 142
    .line 143
    invoke-virtual {v11, v2, v10}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    invoke-static {v8, v9, v2}, Landroidx/appcompat/widget/C;->d(Landroid/content/Context;Landroidx/appcompat/widget/k;I)Landroidx/appcompat/widget/Y;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    iput-object v2, v0, Landroidx/appcompat/widget/C;->g:Landroidx/appcompat/widget/Y;

    .line 152
    .line 153
    :cond_5
    invoke-virtual {v11}, Landroidx/appcompat/widget/a0;->w()V

    .line 154
    .line 155
    .line 156
    iget-object v2, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 157
    .line 158
    invoke-virtual {v2}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    instance-of v2, v2, Landroid/text/method/PasswordTransformationMethod;

    .line 163
    .line 164
    const/4 v3, 0x1

    .line 165
    const/4 v11, 0x0

    .line 166
    if-eq v1, v7, :cond_9

    .line 167
    .line 168
    sget-object v5, Lf/j;->S2:[I

    .line 169
    .line 170
    invoke-static {v8, v1, v5}, Landroidx/appcompat/widget/a0;->t(Landroid/content/Context;I[I)Landroidx/appcompat/widget/a0;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    if-nez v2, :cond_6

    .line 175
    .line 176
    sget v5, Lf/j;->b3:I

    .line 177
    .line 178
    invoke-virtual {v1, v5}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 179
    .line 180
    .line 181
    move-result v12

    .line 182
    if-eqz v12, :cond_6

    .line 183
    .line 184
    invoke-virtual {v1, v5, v10}, Landroidx/appcompat/widget/a0;->a(IZ)Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    move v12, v3

    .line 189
    goto :goto_0

    .line 190
    :cond_6
    move v5, v10

    .line 191
    move v12, v5

    .line 192
    :goto_0
    invoke-direct {v0, v8, v1}, Landroidx/appcompat/widget/C;->C(Landroid/content/Context;Landroidx/appcompat/widget/a0;)V

    .line 193
    .line 194
    .line 195
    sget v13, Lf/j;->c3:I

    .line 196
    .line 197
    invoke-virtual {v1, v13}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 198
    .line 199
    .line 200
    move-result v14

    .line 201
    if-eqz v14, :cond_7

    .line 202
    .line 203
    invoke-virtual {v1, v13}, Landroidx/appcompat/widget/a0;->o(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v13

    .line 207
    goto :goto_1

    .line 208
    :cond_7
    move-object v13, v11

    .line 209
    :goto_1
    sget v14, Lf/j;->a3:I

    .line 210
    .line 211
    invoke-virtual {v1, v14}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 212
    .line 213
    .line 214
    move-result v15

    .line 215
    if-eqz v15, :cond_8

    .line 216
    .line 217
    invoke-virtual {v1, v14}, Landroidx/appcompat/widget/a0;->o(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v14

    .line 221
    goto :goto_2

    .line 222
    :cond_8
    move-object v14, v11

    .line 223
    :goto_2
    invoke-virtual {v1}, Landroidx/appcompat/widget/a0;->w()V

    .line 224
    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_9
    move v5, v10

    .line 228
    move v12, v5

    .line 229
    move-object v13, v11

    .line 230
    move-object v14, v13

    .line 231
    :goto_3
    sget-object v1, Lf/j;->S2:[I

    .line 232
    .line 233
    invoke-static {v8, v4, v1, v6, v10}, Landroidx/appcompat/widget/a0;->v(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroidx/appcompat/widget/a0;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    if-nez v2, :cond_a

    .line 238
    .line 239
    sget v15, Lf/j;->b3:I

    .line 240
    .line 241
    invoke-virtual {v1, v15}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 242
    .line 243
    .line 244
    move-result v16

    .line 245
    if-eqz v16, :cond_a

    .line 246
    .line 247
    invoke-virtual {v1, v15, v10}, Landroidx/appcompat/widget/a0;->a(IZ)Z

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    goto :goto_4

    .line 252
    :cond_a
    move v3, v12

    .line 253
    :goto_4
    sget v12, Lf/j;->c3:I

    .line 254
    .line 255
    invoke-virtual {v1, v12}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 256
    .line 257
    .line 258
    move-result v15

    .line 259
    if-eqz v15, :cond_b

    .line 260
    .line 261
    invoke-virtual {v1, v12}, Landroidx/appcompat/widget/a0;->o(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v13

    .line 265
    :cond_b
    sget v12, Lf/j;->a3:I

    .line 266
    .line 267
    invoke-virtual {v1, v12}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 268
    .line 269
    .line 270
    move-result v15

    .line 271
    if-eqz v15, :cond_c

    .line 272
    .line 273
    invoke-virtual {v1, v12}, Landroidx/appcompat/widget/a0;->o(I)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v14

    .line 277
    :cond_c
    sget v12, Lf/j;->T2:I

    .line 278
    .line 279
    invoke-virtual {v1, v12}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 280
    .line 281
    .line 282
    move-result v15

    .line 283
    if-eqz v15, :cond_d

    .line 284
    .line 285
    invoke-virtual {v1, v12, v7}, Landroidx/appcompat/widget/a0;->f(II)I

    .line 286
    .line 287
    .line 288
    move-result v12

    .line 289
    if-nez v12, :cond_d

    .line 290
    .line 291
    iget-object v12, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 292
    .line 293
    const/4 v15, 0x0

    .line 294
    invoke-virtual {v12, v10, v15}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 295
    .line 296
    .line 297
    :cond_d
    invoke-direct {v0, v8, v1}, Landroidx/appcompat/widget/C;->C(Landroid/content/Context;Landroidx/appcompat/widget/a0;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v1}, Landroidx/appcompat/widget/a0;->w()V

    .line 301
    .line 302
    .line 303
    if-nez v2, :cond_e

    .line 304
    .line 305
    if-eqz v3, :cond_e

    .line 306
    .line 307
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/C;->s(Z)V

    .line 308
    .line 309
    .line 310
    :cond_e
    iget-object v1, v0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 311
    .line 312
    if-eqz v1, :cond_10

    .line 313
    .line 314
    iget v2, v0, Landroidx/appcompat/widget/C;->k:I

    .line 315
    .line 316
    if-ne v2, v7, :cond_f

    .line 317
    .line 318
    iget-object v2, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 319
    .line 320
    iget v3, v0, Landroidx/appcompat/widget/C;->j:I

    .line 321
    .line 322
    invoke-virtual {v2, v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 323
    .line 324
    .line 325
    goto :goto_5

    .line 326
    :cond_f
    iget-object v2, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 327
    .line 328
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 329
    .line 330
    .line 331
    :cond_10
    :goto_5
    if-eqz v14, :cond_11

    .line 332
    .line 333
    iget-object v1, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 334
    .line 335
    invoke-static {v1, v14}, Landroidx/appcompat/widget/C$e;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 336
    .line 337
    .line 338
    :cond_11
    if-eqz v13, :cond_12

    .line 339
    .line 340
    iget-object v1, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 341
    .line 342
    invoke-static {v13}, Landroidx/appcompat/widget/C$d;->a(Ljava/lang/String;)Landroid/os/LocaleList;

    .line 343
    .line 344
    .line 345
    move-result-object v2

    .line 346
    invoke-static {v1, v2}, Landroidx/appcompat/widget/C$d;->b(Landroid/widget/TextView;Landroid/os/LocaleList;)V

    .line 347
    .line 348
    .line 349
    :cond_12
    iget-object v1, v0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 350
    .line 351
    invoke-virtual {v1, v4, v6}, Landroidx/appcompat/widget/D;->o(Landroid/util/AttributeSet;I)V

    .line 352
    .line 353
    .line 354
    sget-boolean v1, Landroidx/appcompat/widget/h0;->b:Z

    .line 355
    .line 356
    if-eqz v1, :cond_14

    .line 357
    .line 358
    iget-object v1, v0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 359
    .line 360
    invoke-virtual {v1}, Landroidx/appcompat/widget/D;->j()I

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    if-eqz v1, :cond_14

    .line 365
    .line 366
    iget-object v1, v0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 367
    .line 368
    invoke-virtual {v1}, Landroidx/appcompat/widget/D;->i()[I

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    array-length v2, v1

    .line 373
    if-lez v2, :cond_14

    .line 374
    .line 375
    iget-object v2, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 376
    .line 377
    invoke-static {v2}, Landroidx/appcompat/widget/C$e;->a(Landroid/widget/TextView;)I

    .line 378
    .line 379
    .line 380
    move-result v2

    .line 381
    int-to-float v2, v2

    .line 382
    const/high16 v3, -0x40800000    # -1.0f

    .line 383
    .line 384
    cmpl-float v2, v2, v3

    .line 385
    .line 386
    if-eqz v2, :cond_13

    .line 387
    .line 388
    iget-object v1, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 389
    .line 390
    iget-object v2, v0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 391
    .line 392
    invoke-virtual {v2}, Landroidx/appcompat/widget/D;->g()I

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    iget-object v3, v0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 397
    .line 398
    invoke-virtual {v3}, Landroidx/appcompat/widget/D;->f()I

    .line 399
    .line 400
    .line 401
    move-result v3

    .line 402
    iget-object v5, v0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 403
    .line 404
    invoke-virtual {v5}, Landroidx/appcompat/widget/D;->h()I

    .line 405
    .line 406
    .line 407
    move-result v5

    .line 408
    invoke-static {v1, v2, v3, v5, v10}, Landroidx/appcompat/widget/C$e;->b(Landroid/widget/TextView;IIII)V

    .line 409
    .line 410
    .line 411
    goto :goto_6

    .line 412
    :cond_13
    iget-object v2, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 413
    .line 414
    invoke-static {v2, v1, v10}, Landroidx/appcompat/widget/C$e;->c(Landroid/widget/TextView;[II)V

    .line 415
    .line 416
    .line 417
    :cond_14
    :goto_6
    sget-object v1, Lf/j;->g0:[I

    .line 418
    .line 419
    invoke-static {v8, v4, v1}, Landroidx/appcompat/widget/a0;->u(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroidx/appcompat/widget/a0;

    .line 420
    .line 421
    .line 422
    move-result-object v10

    .line 423
    sget v1, Lf/j;->o0:I

    .line 424
    .line 425
    invoke-virtual {v10, v1, v7}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    if-eq v1, v7, :cond_15

    .line 430
    .line 431
    invoke-virtual {v9, v8, v1}, Landroidx/appcompat/widget/k;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    goto :goto_7

    .line 436
    :cond_15
    move-object v1, v11

    .line 437
    :goto_7
    sget v2, Lf/j;->t0:I

    .line 438
    .line 439
    invoke-virtual {v10, v2, v7}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 440
    .line 441
    .line 442
    move-result v2

    .line 443
    if-eq v2, v7, :cond_16

    .line 444
    .line 445
    invoke-virtual {v9, v8, v2}, Landroidx/appcompat/widget/k;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 446
    .line 447
    .line 448
    move-result-object v2

    .line 449
    goto :goto_8

    .line 450
    :cond_16
    move-object v2, v11

    .line 451
    :goto_8
    sget v3, Lf/j;->p0:I

    .line 452
    .line 453
    invoke-virtual {v10, v3, v7}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 454
    .line 455
    .line 456
    move-result v3

    .line 457
    if-eq v3, v7, :cond_17

    .line 458
    .line 459
    invoke-virtual {v9, v8, v3}, Landroidx/appcompat/widget/k;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 460
    .line 461
    .line 462
    move-result-object v3

    .line 463
    goto :goto_9

    .line 464
    :cond_17
    move-object v3, v11

    .line 465
    :goto_9
    sget v4, Lf/j;->m0:I

    .line 466
    .line 467
    invoke-virtual {v10, v4, v7}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 468
    .line 469
    .line 470
    move-result v4

    .line 471
    if-eq v4, v7, :cond_18

    .line 472
    .line 473
    invoke-virtual {v9, v8, v4}, Landroidx/appcompat/widget/k;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 474
    .line 475
    .line 476
    move-result-object v4

    .line 477
    goto :goto_a

    .line 478
    :cond_18
    move-object v4, v11

    .line 479
    :goto_a
    sget v5, Lf/j;->q0:I

    .line 480
    .line 481
    invoke-virtual {v10, v5, v7}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 482
    .line 483
    .line 484
    move-result v5

    .line 485
    if-eq v5, v7, :cond_19

    .line 486
    .line 487
    invoke-virtual {v9, v8, v5}, Landroidx/appcompat/widget/k;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 488
    .line 489
    .line 490
    move-result-object v5

    .line 491
    goto :goto_b

    .line 492
    :cond_19
    move-object v5, v11

    .line 493
    :goto_b
    sget v6, Lf/j;->n0:I

    .line 494
    .line 495
    invoke-virtual {v10, v6, v7}, Landroidx/appcompat/widget/a0;->n(II)I

    .line 496
    .line 497
    .line 498
    move-result v6

    .line 499
    if-eq v6, v7, :cond_1a

    .line 500
    .line 501
    invoke-virtual {v9, v8, v6}, Landroidx/appcompat/widget/k;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 502
    .line 503
    .line 504
    move-result-object v6

    .line 505
    goto :goto_c

    .line 506
    :cond_1a
    move-object v6, v11

    .line 507
    :goto_c
    invoke-direct/range {v0 .. v6}, Landroidx/appcompat/widget/C;->y(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 508
    .line 509
    .line 510
    sget v1, Lf/j;->r0:I

    .line 511
    .line 512
    invoke-virtual {v10, v1}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 513
    .line 514
    .line 515
    move-result v2

    .line 516
    if-eqz v2, :cond_1b

    .line 517
    .line 518
    invoke-virtual {v10, v1}, Landroidx/appcompat/widget/a0;->c(I)Landroid/content/res/ColorStateList;

    .line 519
    .line 520
    .line 521
    move-result-object v1

    .line 522
    iget-object v2, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 523
    .line 524
    invoke-static {v2, v1}, Landroidx/core/widget/i;->h(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 525
    .line 526
    .line 527
    :cond_1b
    sget v1, Lf/j;->s0:I

    .line 528
    .line 529
    invoke-virtual {v10, v1}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 530
    .line 531
    .line 532
    move-result v2

    .line 533
    if-eqz v2, :cond_1c

    .line 534
    .line 535
    invoke-virtual {v10, v1, v7}, Landroidx/appcompat/widget/a0;->k(II)I

    .line 536
    .line 537
    .line 538
    move-result v1

    .line 539
    invoke-static {v1, v11}, Landroidx/appcompat/widget/H;->d(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    iget-object v2, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 544
    .line 545
    invoke-static {v2, v1}, Landroidx/core/widget/i;->i(Landroid/widget/TextView;Landroid/graphics/PorterDuff$Mode;)V

    .line 546
    .line 547
    .line 548
    :cond_1c
    sget v1, Lf/j;->v0:I

    .line 549
    .line 550
    invoke-virtual {v10, v1, v7}, Landroidx/appcompat/widget/a0;->f(II)I

    .line 551
    .line 552
    .line 553
    move-result v1

    .line 554
    sget v2, Lf/j;->w0:I

    .line 555
    .line 556
    invoke-virtual {v10, v2, v7}, Landroidx/appcompat/widget/a0;->f(II)I

    .line 557
    .line 558
    .line 559
    move-result v2

    .line 560
    sget v3, Lf/j;->x0:I

    .line 561
    .line 562
    invoke-virtual {v10, v3, v7}, Landroidx/appcompat/widget/a0;->f(II)I

    .line 563
    .line 564
    .line 565
    move-result v3

    .line 566
    invoke-virtual {v10}, Landroidx/appcompat/widget/a0;->w()V

    .line 567
    .line 568
    .line 569
    if-eq v1, v7, :cond_1d

    .line 570
    .line 571
    iget-object v4, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 572
    .line 573
    invoke-static {v4, v1}, Landroidx/core/widget/i;->k(Landroid/widget/TextView;I)V

    .line 574
    .line 575
    .line 576
    :cond_1d
    if-eq v2, v7, :cond_1e

    .line 577
    .line 578
    iget-object v1, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 579
    .line 580
    invoke-static {v1, v2}, Landroidx/core/widget/i;->l(Landroid/widget/TextView;I)V

    .line 581
    .line 582
    .line 583
    :cond_1e
    if-eq v3, v7, :cond_1f

    .line 584
    .line 585
    iget-object v0, v0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 586
    .line 587
    invoke-static {v0, v3}, Landroidx/core/widget/i;->m(Landroid/widget/TextView;I)V

    .line 588
    .line 589
    .line 590
    :cond_1f
    return-void
.end method

.method n(Ljava/lang/ref/WeakReference;Landroid/graphics/Typeface;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;",
            "Landroid/graphics/Typeface;",
            ")V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/C;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iput-object p2, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, LJ/I;->N(Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget v0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 22
    .line 23
    new-instance v1, Landroidx/appcompat/widget/C$b;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1, p2, v0}, Landroidx/appcompat/widget/C$b;-><init>(Landroidx/appcompat/widget/C;Landroid/widget/TextView;Landroid/graphics/Typeface;I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget p0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 33
    .line 34
    invoke-virtual {p1, p2, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method o(ZIIII)V
    .locals 0

    .line 1
    sget-boolean p1, Landroidx/appcompat/widget/h0;->b:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/C;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method p()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/C;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method q(Landroid/content/Context;I)V
    .locals 3

    .line 1
    sget-object v0, Lf/j;->S2:[I

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Landroidx/appcompat/widget/a0;->t(Landroid/content/Context;I[I)Landroidx/appcompat/widget/a0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Lf/j;->b3:I

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2, v0, v2}, Landroidx/appcompat/widget/a0;->a(IZ)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/C;->s(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget v0, Lf/j;->T2:I

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/a0;->f(II)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/C;->C(Landroid/content/Context;Landroidx/appcompat/widget/a0;)V

    .line 45
    .line 46
    .line 47
    sget p1, Lf/j;->a3:I

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/a0;->s(I)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/a0;->o(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-static {v0, p1}, Landroidx/appcompat/widget/C$e;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    :cond_2
    invoke-virtual {p2}, Landroidx/appcompat/widget/a0;->w()V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Landroidx/appcompat/widget/C;->l:Landroid/graphics/Typeface;

    .line 70
    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    iget-object p2, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 74
    .line 75
    iget p0, p0, Landroidx/appcompat/widget/C;->j:I

    .line 76
    .line 77
    invoke-virtual {p2, p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 78
    .line 79
    .line 80
    :cond_3
    return-void
.end method

.method r(Landroid/widget/TextView;Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)V
    .locals 0

    .line 1
    return-void
.end method

.method s(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method t(IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/D;->p(IIII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method u([II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/widget/D;->q([II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method v(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/widget/C;->i:Landroidx/appcompat/widget/D;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/D;->r(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method w(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/Y;

    .line 6
    .line 7
    invoke-direct {v0}, Landroidx/appcompat/widget/Y;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 13
    .line 14
    iput-object p1, v0, Landroidx/appcompat/widget/Y;->a:Landroid/content/res/ColorStateList;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, v0, Landroidx/appcompat/widget/Y;->d:Z

    .line 22
    .line 23
    invoke-direct {p0}, Landroidx/appcompat/widget/C;->z()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method x(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/appcompat/widget/Y;

    .line 6
    .line 7
    invoke-direct {v0}, Landroidx/appcompat/widget/Y;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/widget/C;->h:Landroidx/appcompat/widget/Y;

    .line 13
    .line 14
    iput-object p1, v0, Landroidx/appcompat/widget/Y;->b:Landroid/graphics/PorterDuff$Mode;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, v0, Landroidx/appcompat/widget/Y;->c:Z

    .line 22
    .line 23
    invoke-direct {p0}, Landroidx/appcompat/widget/C;->z()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
