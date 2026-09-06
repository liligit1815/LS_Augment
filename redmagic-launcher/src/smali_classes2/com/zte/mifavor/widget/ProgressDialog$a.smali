.class Lcom/zte/mifavor/widget/ProgressDialog$a;
.super Landroid/os/Handler;
.source "ProgressDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/ProgressDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/widget/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/ProgressDialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/zte/mifavor/widget/ProgressDialog;->d(Lcom/zte/mifavor/widget/ProgressDialog;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/zte/mifavor/widget/ProgressDialog;->c(Lcom/zte/mifavor/widget/ProgressDialog;)Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/zte/mifavor/widget/ProgressDialog;->c(Lcom/zte/mifavor/widget/ProgressDialog;)Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->getProgress()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDialog;->c(Lcom/zte/mifavor/widget/ProgressDialog;)Lcom/zte/mifavor/widget/ColorProgressBarZTE;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/ColorProgressBarZTE;->getMax()F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/zte/mifavor/widget/ProgressDialog;->e(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/ProgressBar;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/zte/mifavor/widget/ProgressDialog;->e(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/ProgressBar;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDialog;->e(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/ProgressBar;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getMax()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    move p1, v0

    .line 76
    move v1, p1

    .line 77
    :goto_0
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 78
    .line 79
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDialog;->g(Lcom/zte/mifavor/widget/ProgressDialog;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const-string v3, ""

    .line 84
    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 88
    .line 89
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDialog;->b(Lcom/zte/mifavor/widget/ProgressDialog;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_2

    .line 94
    .line 95
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 96
    .line 97
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDialog;->g(Lcom/zte/mifavor/widget/ProgressDialog;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    filled-new-array {v4, v5}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    new-instance v5, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string v6, "update progress. numerator="

    .line 123
    .line 124
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v6, ",progress="

    .line 131
    .line 132
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v6, ",max="

    .line 139
    .line 140
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v6, ",format="

    .line 147
    .line 148
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    const-string v5, "Z#DialogProgress"

    .line 159
    .line 160
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 164
    .line 165
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDialog;->f(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/TextView;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_2
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 174
    .line 175
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDialog;->f(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/TextView;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    :goto_1
    iget-object v2, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 183
    .line 184
    invoke-static {v2}, Lcom/zte/mifavor/widget/ProgressDialog;->i(Lcom/zte/mifavor/widget/ProgressDialog;)Ljava/text/NumberFormat;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    if-eqz v2, :cond_3

    .line 189
    .line 190
    int-to-double v2, p1

    .line 191
    int-to-double v4, v1

    .line 192
    div-double/2addr v2, v4

    .line 193
    new-instance p1, Landroid/text/SpannableString;

    .line 194
    .line 195
    iget-object v1, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 196
    .line 197
    invoke-static {v1}, Lcom/zte/mifavor/widget/ProgressDialog;->i(Lcom/zte/mifavor/widget/ProgressDialog;)Ljava/text/NumberFormat;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-direct {p1, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    new-instance v1, Landroid/text/style/StyleSpan;

    .line 209
    .line 210
    invoke-direct {v1, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1}, Landroid/text/SpannableString;->length()I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    const/16 v3, 0x21

    .line 218
    .line 219
    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 223
    .line 224
    invoke-static {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->h(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/TextView;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_3
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDialog$a;->a:Lcom/zte/mifavor/widget/ProgressDialog;

    .line 233
    .line 234
    invoke-static {p0}, Lcom/zte/mifavor/widget/ProgressDialog;->h(Lcom/zte/mifavor/widget/ProgressDialog;)Landroid/widget/TextView;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    .line 240
    .line 241
    return-void
.end method
