.class Lcom/zte/mifavor/widget/NumberPickerZTE$h;
.super Landroid/text/method/NumberKeyListener;
.source "NumberPickerZTE.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/NumberPickerZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "h"
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/NumberPickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/NumberPickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/method/NumberKeyListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j(Lcom/zte/mifavor/widget/NumberPickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE$l;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->j(Lcom/zte/mifavor/widget/NumberPickerZTE;)Lcom/zte/mifavor/widget/NumberPickerZTE$l;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$l;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->c(Lcom/zte/mifavor/widget/NumberPickerZTE;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    const-string v2, ""

    .line 26
    .line 27
    if-nez v0, :cond_5

    .line 28
    .line 29
    invoke-super/range {p0 .. p6}, Landroid/text/method/NumberKeyListener;->filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {p4, v1, p5}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-interface {p4}, Landroid/text/Spanned;->length()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-interface {p4, p6, p2}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_2

    .line 78
    .line 79
    return-object p1

    .line 80
    :cond_2
    iget-object p2, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 81
    .line 82
    invoke-static {p2, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->s(Lcom/zte/mifavor/widget/NumberPickerZTE;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 87
    .line 88
    invoke-static {p3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->g(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 89
    .line 90
    .line 91
    move-result p3

    .line 92
    if-gt p2, p3, :cond_4

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 99
    .line 100
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->g(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-le p1, p0, :cond_3

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_3
    return-object v0

    .line 116
    :cond_4
    :goto_0
    return-object v2

    .line 117
    :cond_5
    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-eqz p2, :cond_6

    .line 130
    .line 131
    return-object v2

    .line 132
    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-interface {p4, v1, p5}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p3

    .line 145
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-interface {p4}, Landroid/text/Spanned;->length()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    invoke-interface {p4, p6, p1}, Landroid/text/Spanned;->subSequence(II)Ljava/lang/CharSequence;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 171
    .line 172
    .line 173
    move-result-object p3

    .line 174
    invoke-virtual {p2, p3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    iget-object p3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 179
    .line 180
    invoke-static {p3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->c(Lcom/zte/mifavor/widget/NumberPickerZTE;)[Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p3

    .line 184
    array-length p4, p3

    .line 185
    :goto_1
    if-ge v1, p4, :cond_8

    .line 186
    .line 187
    aget-object p6, p3, v1

    .line 188
    .line 189
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {p6, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_7

    .line 202
    .line 203
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$h;->g:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    invoke-virtual {p6}, Ljava/lang/String;->length()I

    .line 210
    .line 211
    .line 212
    move-result p2

    .line 213
    invoke-static {p0, p1, p2}, Lcom/zte/mifavor/widget/NumberPickerZTE;->w(Lcom/zte/mifavor/widget/NumberPickerZTE;II)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p6}, Ljava/lang/String;->length()I

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    invoke-virtual {p6, p5, p0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    return-object p0

    .line 225
    :cond_7
    add-int/lit8 v1, v1, 0x1

    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_8
    return-object v2
.end method

.method protected getAcceptedChars()[C
    .locals 0

    .line 1
    invoke-static {}, Lcom/zte/mifavor/widget/NumberPickerZTE;->z()[C

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getInputType()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
