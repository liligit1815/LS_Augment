.class public Lcom/android/launcher3/settings/HomeScreenLayoutActivity;
.super LK1/p;
.source "HomeScreenLayoutActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private D:Landroid/widget/TextView;

.field private E:Landroid/widget/TextView;

.field private F:Landroid/widget/TextView;

.field private G:Landroid/widget/TextView;

.field private H:Landroid/widget/TextView;

.field private I:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private J:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private K:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private L:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private M:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private N:Landroid/widget/ImageView;

.field private O:Landroid/widget/ImageView;

.field private P:Landroid/widget/ImageView;

.field private Q:Landroid/widget/ImageView;

.field private R:Landroid/widget/ImageView;

.field private S:Landroid/widget/TextView;

.field private T:Landroid/widget/TextView;

.field private U:Landroid/widget/TextView;

.field private V:Landroid/widget/TextView;

.field private W:Landroid/widget/TextView;

.field private X:Landroid/widget/LinearLayout;

.field private Y:Landroid/widget/LinearLayout;

.field private Z:Landroid/widget/LinearLayout;

.field private a0:Landroid/widget/LinearLayout;

.field private b0:Landroid/widget/LinearLayout;

.field private c0:Z

.field private d0:Z

.field private e0:Z

.field private f0:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/p;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private init()V
    .locals 15

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iput-boolean v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 25
    .line 26
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 37
    .line 38
    iput-boolean v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 39
    .line 40
    const/4 v7, 0x0

    .line 41
    const/4 v8, 0x0

    .line 42
    const/4 v4, 0x0

    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x1

    .line 45
    move-object v3, p0

    .line 46
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->y0(ZZZZZ)V

    .line 47
    .line 48
    .line 49
    move-object v9, v3

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move-object v9, p0

    .line 52
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    iput-boolean v2, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 63
    .line 64
    iput-boolean v1, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 65
    .line 66
    const/4 v13, 0x0

    .line 67
    const/4 v14, 0x1

    .line 68
    const/4 v10, 0x0

    .line 69
    const/4 v11, 0x0

    .line 70
    const/4 v12, 0x0

    .line 71
    invoke-direct/range {v9 .. v14}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->y0(ZZZZZ)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    iput-boolean v2, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 76
    .line 77
    iput-boolean v2, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 78
    .line 79
    iget-boolean p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 80
    .line 81
    if-eqz p0, :cond_3

    .line 82
    .line 83
    const/4 v13, 0x0

    .line 84
    const/4 v14, 0x0

    .line 85
    const/4 v10, 0x0

    .line 86
    const/4 v11, 0x1

    .line 87
    const/4 v12, 0x0

    .line 88
    invoke-direct/range {v9 .. v14}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->y0(ZZZZZ)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    const/4 v13, 0x0

    .line 93
    const/4 v14, 0x0

    .line 94
    const/4 v10, 0x1

    .line 95
    const/4 v11, 0x0

    .line 96
    const/4 v12, 0x0

    .line 97
    invoke-direct/range {v9 .. v14}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->y0(ZZZZZ)V

    .line 98
    .line 99
    .line 100
    :goto_1
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->g:Z

    .line 113
    .line 114
    const/4 v0, 0x0

    .line 115
    const/16 v1, 0x8

    .line 116
    .line 117
    if-nez p0, :cond_5

    .line 118
    .line 119
    iget-boolean p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 120
    .line 121
    if-eqz p0, :cond_4

    .line 122
    .line 123
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 124
    .line 125
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 131
    .line 132
    .line 133
    iput-object v0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->J:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_4
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 137
    .line 138
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 142
    .line 143
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 144
    .line 145
    .line 146
    iput-object v0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_5
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    .line 153
    .line 154
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 155
    .line 156
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    .line 158
    .line 159
    :goto_2
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const-string v2, "com.zte.easymode"

    .line 164
    .line 165
    invoke-static {p0, v2}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_6

    .line 170
    .line 171
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->G0()Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-eqz p0, :cond_6

    .line 184
    .line 185
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 186
    .line 187
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_6
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 192
    .line 193
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 194
    .line 195
    .line 196
    iput-object v0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->K:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 197
    .line 198
    :goto_3
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    const-string v2, "com.zte.mifavor.elderlylauncher"

    .line 203
    .line 204
    invoke-static {p0, v2}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    if-eqz p0, :cond_7

    .line 209
    .line 210
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->G0()Z

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    if-eqz p0, :cond_7

    .line 223
    .line 224
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 225
    .line 226
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 227
    .line 228
    .line 229
    goto :goto_4

    .line 230
    :cond_7
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 231
    .line 232
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 233
    .line 234
    .line 235
    iput-object v0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->L:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 236
    .line 237
    :goto_4
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-nez p0, :cond_9

    .line 242
    .line 243
    invoke-static {}, Lx1/O;->A3()Ljava/lang/Boolean;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-nez p0, :cond_8

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_8
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 255
    .line 256
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    .line 258
    .line 259
    return-void

    .line 260
    :cond_9
    :goto_5
    iget-object p0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 261
    .line 262
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 263
    .line 264
    .line 265
    iput-object v0, v9, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 266
    .line 267
    return-void
.end method

.method static bridge synthetic p0(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic q0(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->v0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic r0(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->w0(ZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic s0(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;ZZZZZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->y0(ZZZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-eqz v1, :cond_5

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_3

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    move v1, v3

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v1, v2

    .line 29
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->J:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    move v1, v3

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    move v1, v2

    .line 47
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->K:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    move v1, v3

    .line 63
    goto :goto_2

    .line 64
    :cond_3
    move v1, v2

    .line 65
    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 71
    .line 72
    if-eqz p0, :cond_4

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/widget/RadioButton;->isChecked()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    move v2, v3

    .line 81
    :cond_4
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 82
    .line 83
    .line 84
    :cond_5
    :goto_3
    return-void
.end method

.method private u0(Landroid/content/Intent;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->K:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/RadioButton;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    if-eqz p1, :cond_2

    .line 15
    .line 16
    const-string v0, "EasyModeCommand"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "easyModeCommand="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "HomeScreenLayoutActivity"

    .line 40
    .line 41
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    const-string v0, "open"

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    iget-boolean v6, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    const/4 v3, 0x0

    .line 63
    const/4 v4, 0x1

    .line 64
    move-object v1, p0

    .line 65
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->y0(ZZZZZ)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    move-object v1, p0

    .line 70
    const-string p0, "close"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    const/4 v11, 0x0

    .line 79
    iget-boolean v12, v1, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 80
    .line 81
    const/4 v8, 0x0

    .line 82
    const/4 v9, 0x1

    .line 83
    const/4 v10, 0x0

    .line 84
    move-object v7, v1

    .line 85
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->y0(ZZZZZ)V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_0
    return-void
.end method

.method private v0()V
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lx1/O;->I4(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "content://com.zte.easymode.settings.SettingsProvider"

    .line 9
    .line 10
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v1, "feature_mode_set"

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    const-string v0, "HomeScreenLayoutActivity"

    .line 27
    .line 28
    const-string v1, "Error switching to feature home mode"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private w0(ZZZ)V
    .locals 7

    .line 1
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lx1/C;->h()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string p0, "HomeScreenLayoutActivity"

    .line 18
    .line 19
    const-string p1, "switchHomeLayout--loadingToast is show"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->s1()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lx1/C;->j()V

    .line 45
    .line 46
    .line 47
    iget-boolean v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 48
    .line 49
    if-eq v0, p1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, p1}, Lcom/android/launcher3/H5;->w1(Z)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/B;->e(Z)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 74
    .line 75
    if-eq p1, p3, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1, p3}, Lh1/a;->p(Landroid/content/Context;Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, p3}, Lcom/android/launcher3/H5;->l1(Z)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1, p3}, Lcom/android/launcher3/resource/B;->b(Z)V

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 107
    .line 108
    if-eq p1, p2, :cond_3

    .line 109
    .line 110
    :try_start_0
    const-string p1, "content://com.zte.easymode.settings.SettingsProvider"

    .line 111
    .line 112
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 121
    .line 122
    .line 123
    move-result-object p3

    .line 124
    const-string v0, "ease_mode_set"

    .line 125
    .line 126
    const-string v1, "mfvLauncher"

    .line 127
    .line 128
    const/4 v2, 0x0

    .line 129
    invoke-virtual {p3, p1, v0, v1, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :catch_0
    move-exception v0

    .line 134
    move-object p1, v0

    .line 135
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 136
    .line 137
    .line 138
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p1, p2}, Lcom/android/launcher3/resource/B;->c(Z)V

    .line 143
    .line 144
    .line 145
    :cond_3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->d()V

    .line 150
    .line 151
    .line 152
    invoke-static {}, Lx1/O;->z5()Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-eqz p1, :cond_4

    .line 157
    .line 158
    const/4 p1, 0x2

    .line 159
    const-wide/16 p2, 0xbb8

    .line 160
    .line 161
    const-string v0, "com.zte.mifavor.launcher"

    .line 162
    .line 163
    invoke-static {v0, p1, p2, p3}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 164
    .line 165
    .line 166
    :cond_4
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    move-object v0, p1

    .line 177
    check-cast v0, Lcom/android/launcher3/F1;

    .line 178
    .line 179
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->q()Z

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    const/4 v6, 0x0

    .line 192
    const/4 v2, 0x1

    .line 193
    const/4 v3, 0x0

    .line 194
    const/4 v4, 0x1

    .line 195
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/F1;->q0(Landroid/content/Context;ZZZZZ)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method private x0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iput-boolean v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iput-boolean v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 25
    .line 26
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iput-boolean v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iput-boolean v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 40
    .line 41
    :goto_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iput-boolean v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    iput-boolean v1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 55
    .line 56
    return-void
.end method

.method private y0(ZZZZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->J:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->K:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {v0, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 20
    .line 21
    .line 22
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->L:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0, p4}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 27
    .line 28
    .line 29
    :cond_3
    iget-object p4, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 30
    .line 31
    if-eqz p4, :cond_4

    .line 32
    .line 33
    invoke-virtual {p4, p5}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 34
    .line 35
    .line 36
    :cond_4
    const/4 p4, 0x1

    .line 37
    const/4 v0, 0x0

    .line 38
    if-eqz p1, :cond_6

    .line 39
    .line 40
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 41
    .line 42
    if-nez p1, :cond_5

    .line 43
    .line 44
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 45
    .line 46
    if-nez p1, :cond_5

    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual {p1, p4}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 57
    .line 58
    .line 59
    :cond_6
    :goto_0
    if-eqz p2, :cond_8

    .line 60
    .line 61
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->e0:Z

    .line 62
    .line 63
    if-eqz p1, :cond_7

    .line 64
    .line 65
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 66
    .line 67
    if-nez p1, :cond_7

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 76
    .line 77
    invoke-virtual {p1, p4}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 78
    .line 79
    .line 80
    :cond_8
    :goto_1
    if-eqz p3, :cond_a

    .line 81
    .line 82
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->c0:Z

    .line 83
    .line 84
    if-eqz p1, :cond_9

    .line 85
    .line 86
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_9
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 93
    .line 94
    invoke-virtual {p1, p4}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 95
    .line 96
    .line 97
    :cond_a
    :goto_2
    if-eqz p5, :cond_c

    .line 98
    .line 99
    iget-boolean p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->d0:Z

    .line 100
    .line 101
    if-eqz p1, :cond_b

    .line 102
    .line 103
    iget-object p0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_b
    iget-object p0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 110
    .line 111
    invoke-virtual {p0, p4}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 112
    .line 113
    .line 114
    :cond_c
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const v0, 0x7f14038f

    .line 6
    .line 7
    .line 8
    const v1, 0x7f140392

    .line 9
    .line 10
    .line 11
    const v2, 0x7f140398

    .line 12
    .line 13
    .line 14
    packed-switch p1, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    :pswitch_0
    goto/16 :goto_0

    .line 18
    .line 19
    :pswitch_1
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lx1/e;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const v2, 0x7f140396

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v2, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$e;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$e;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v1, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$d;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$d;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    goto/16 :goto_1

    .line 68
    .line 69
    :pswitch_2
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->L:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 70
    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_0

    .line 78
    .line 79
    new-instance p1, Lx1/e;

    .line 80
    .line 81
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const v2, 0x7f140395

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance v2, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$i;

    .line 96
    .line 97
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$i;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance v1, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$h;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$h;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    goto/16 :goto_1

    .line 118
    .line 119
    :pswitch_3
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->K:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 120
    .line 121
    if-eqz p1, :cond_0

    .line 122
    .line 123
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_0

    .line 128
    .line 129
    new-instance p1, Lx1/e;

    .line 130
    .line 131
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    const v2, 0x7f140394

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance v2, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$g;

    .line 146
    .line 147
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$g;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    new-instance v1, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$f;

    .line 155
    .line 156
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$f;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    goto :goto_1

    .line 168
    :pswitch_4
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->J:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 169
    .line 170
    if-eqz p1, :cond_0

    .line 171
    .line 172
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-nez p1, :cond_0

    .line 177
    .line 178
    new-instance p1, Lx1/e;

    .line 179
    .line 180
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    const v2, 0x7f140393

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    new-instance v2, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$c;

    .line 195
    .line 196
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$c;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    new-instance v1, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$b;

    .line 204
    .line 205
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$b;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    goto :goto_1

    .line 217
    :pswitch_5
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 218
    .line 219
    if-eqz p1, :cond_0

    .line 220
    .line 221
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-nez p1, :cond_0

    .line 226
    .line 227
    new-instance p1, Lx1/e;

    .line 228
    .line 229
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    const v2, 0x7f140391

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    new-instance v2, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$a;

    .line 244
    .line 245
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$a;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    new-instance v1, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$j;

    .line 253
    .line 254
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity$j;-><init>(Lcom/android/launcher3/settings/HomeScreenLayoutActivity;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    goto :goto_1

    .line 266
    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 267
    :goto_1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_1

    .line 272
    .line 273
    if-eqz p1, :cond_1

    .line 274
    .line 275
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    const v0, 0x7f070ab2

    .line 284
    .line 285
    .line 286
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 287
    .line 288
    .line 289
    move-result p0

    .line 290
    const/4 v0, -0x2

    .line 291
    invoke-virtual {p1, p0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 292
    .line 293
    .line 294
    :cond_1
    return-void

    .line 295
    :pswitch_data_0
    .packed-switch 0x7f0b0342
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, LK1/p;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->getReferrer()Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v3, ""

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const-string v3, "isFromSettings"

    .line 53
    .line 54
    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    const-string v0, "android-app://com.android.settings.intelligence"

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_0

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    move v0, v1

    .line 70
    goto :goto_1

    .line 71
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 72
    :goto_1
    iput-boolean v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->f0:Z

    .line 73
    .line 74
    :cond_2
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v2, 0x0

    .line 79
    const v3, 0x7f0e01fd

    .line 80
    .line 81
    .line 82
    const v4, 0x7f140399

    .line 83
    .line 84
    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    iget-boolean v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->f0:Z

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p0, v0, v3, v2}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-boolean v4, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 104
    .line 105
    if-eqz v4, :cond_4

    .line 106
    .line 107
    const v3, 0x7f0e01fe

    .line 108
    .line 109
    .line 110
    :cond_4
    invoke-virtual {p0, v0, v3, v2}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 111
    .line 112
    .line 113
    :goto_2
    const v0, 0x7f0b0350

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Landroid/widget/TextView;

    .line 121
    .line 122
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->D:Landroid/widget/TextView;

    .line 123
    .line 124
    const v0, 0x7f0b034c

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Landroid/widget/TextView;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->E:Landroid/widget/TextView;

    .line 134
    .line 135
    const v0, 0x7f0b034d

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Landroid/widget/TextView;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->F:Landroid/widget/TextView;

    .line 145
    .line 146
    const v0, 0x7f0b02e1

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Landroid/widget/TextView;

    .line 154
    .line 155
    iput-object v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->G:Landroid/widget/TextView;

    .line 156
    .line 157
    const v2, 0x7f0b02de

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    check-cast v3, Landroid/widget/TextView;

    .line 165
    .line 166
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->H:Landroid/widget/TextView;

    .line 167
    .line 168
    const v3, 0x7f0b04b8

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    check-cast v3, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 176
    .line 177
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 178
    .line 179
    const v3, 0x7f0b04b2

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    check-cast v3, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 187
    .line 188
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->J:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 189
    .line 190
    const v3, 0x7f0b04b3

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    check-cast v3, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 198
    .line 199
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->K:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 200
    .line 201
    const v3, 0x7f0b04b4

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    check-cast v3, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 209
    .line 210
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->L:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 211
    .line 212
    const v3, 0x7f0b04b1

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    check-cast v3, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 220
    .line 221
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 222
    .line 223
    const v3, 0x7f0b02dd

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    check-cast v3, Landroid/widget/ImageView;

    .line 231
    .line 232
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->N:Landroid/widget/ImageView;

    .line 233
    .line 234
    const v3, 0x7f0b02da

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    check-cast v3, Landroid/widget/ImageView;

    .line 242
    .line 243
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->O:Landroid/widget/ImageView;

    .line 244
    .line 245
    const v3, 0x7f0b02db

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    check-cast v3, Landroid/widget/ImageView;

    .line 253
    .line 254
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->P:Landroid/widget/ImageView;

    .line 255
    .line 256
    const v3, 0x7f0b02dc

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    check-cast v3, Landroid/widget/ImageView;

    .line 264
    .line 265
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Q:Landroid/widget/ImageView;

    .line 266
    .line 267
    const v3, 0x7f0b02d9

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    check-cast v3, Landroid/widget/ImageView;

    .line 275
    .line 276
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->R:Landroid/widget/ImageView;

    .line 277
    .line 278
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->P:Landroid/widget/ImageView;

    .line 279
    .line 280
    invoke-static {}, Lm1/a;->d()Z

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    if-eqz v4, :cond_5

    .line 285
    .line 286
    const v4, 0x7f081260

    .line 287
    .line 288
    .line 289
    goto :goto_3

    .line 290
    :cond_5
    const v4, 0x7f080cbb

    .line 291
    .line 292
    .line 293
    :goto_3
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 294
    .line 295
    .line 296
    invoke-static {}, Lm1/a;->c()Z

    .line 297
    .line 298
    .line 299
    move-result v3

    .line 300
    if-eqz v3, :cond_6

    .line 301
    .line 302
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->P:Landroid/widget/ImageView;

    .line 303
    .line 304
    const v4, 0x7f081261

    .line 305
    .line 306
    .line 307
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 308
    .line 309
    .line 310
    :cond_6
    const v3, 0x7f0b02e2

    .line 311
    .line 312
    .line 313
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    check-cast v3, Landroid/widget/TextView;

    .line 318
    .line 319
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->S:Landroid/widget/TextView;

    .line 320
    .line 321
    const v3, 0x7f0b02df

    .line 322
    .line 323
    .line 324
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 325
    .line 326
    .line 327
    move-result-object v3

    .line 328
    check-cast v3, Landroid/widget/TextView;

    .line 329
    .line 330
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->T:Landroid/widget/TextView;

    .line 331
    .line 332
    const v3, 0x7f0b02e0

    .line 333
    .line 334
    .line 335
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    check-cast v3, Landroid/widget/TextView;

    .line 340
    .line 341
    iput-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->U:Landroid/widget/TextView;

    .line 342
    .line 343
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    check-cast v0, Landroid/widget/TextView;

    .line 348
    .line 349
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->V:Landroid/widget/TextView;

    .line 350
    .line 351
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    check-cast v0, Landroid/widget/TextView;

    .line 356
    .line 357
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->W:Landroid/widget/TextView;

    .line 358
    .line 359
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->U:Landroid/widget/TextView;

    .line 360
    .line 361
    invoke-static {}, Lm1/a;->d()Z

    .line 362
    .line 363
    .line 364
    move-result v2

    .line 365
    if-eqz v2, :cond_7

    .line 366
    .line 367
    const v2, 0x7f140388

    .line 368
    .line 369
    .line 370
    goto :goto_4

    .line 371
    :cond_7
    const v2, 0x7f140389

    .line 372
    .line 373
    .line 374
    :goto_4
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 375
    .line 376
    .line 377
    const v0, 0x7f0b0349

    .line 378
    .line 379
    .line 380
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    check-cast v0, Landroid/widget/LinearLayout;

    .line 385
    .line 386
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 387
    .line 388
    const v0, 0x7f0b0344

    .line 389
    .line 390
    .line 391
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    check-cast v0, Landroid/widget/LinearLayout;

    .line 396
    .line 397
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 398
    .line 399
    const v0, 0x7f0b0345

    .line 400
    .line 401
    .line 402
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    check-cast v0, Landroid/widget/LinearLayout;

    .line 407
    .line 408
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 409
    .line 410
    const v0, 0x7f0b0346

    .line 411
    .line 412
    .line 413
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    check-cast v0, Landroid/widget/LinearLayout;

    .line 418
    .line 419
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 420
    .line 421
    const v0, 0x7f0b0342

    .line 422
    .line 423
    .line 424
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    check-cast v0, Landroid/widget/LinearLayout;

    .line 429
    .line 430
    iput-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 431
    .line 432
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 433
    .line 434
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 435
    .line 436
    .line 437
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 438
    .line 439
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    .line 441
    .line 442
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 443
    .line 444
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 445
    .line 446
    .line 447
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 448
    .line 449
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 450
    .line 451
    .line 452
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 453
    .line 454
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 455
    .line 456
    .line 457
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 458
    .line 459
    .line 460
    move-result v0

    .line 461
    if-eqz v0, :cond_b

    .line 462
    .line 463
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 464
    .line 465
    if-eqz v0, :cond_8

    .line 466
    .line 467
    iget-boolean v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->f0:Z

    .line 468
    .line 469
    if-nez v0, :cond_8

    .line 470
    .line 471
    const v0, 0x7f0b0348

    .line 472
    .line 473
    .line 474
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    check-cast v0, Landroid/widget/LinearLayout;

    .line 479
    .line 480
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 481
    .line 482
    .line 483
    move-result-object v2

    .line 484
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 485
    .line 486
    .line 487
    move-result-object v3

    .line 488
    const v4, 0x7f07048d

    .line 489
    .line 490
    .line 491
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 492
    .line 493
    .line 494
    move-result v3

    .line 495
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 496
    .line 497
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 498
    .line 499
    .line 500
    :cond_8
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 501
    .line 502
    if-nez v0, :cond_9

    .line 503
    .line 504
    iget-boolean v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->f0:Z

    .line 505
    .line 506
    if-eqz v0, :cond_9

    .line 507
    .line 508
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->N:Landroid/widget/ImageView;

    .line 509
    .line 510
    const v2, 0x7f080cbf

    .line 511
    .line 512
    .line 513
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 514
    .line 515
    .line 516
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->N:Landroid/widget/ImageView;

    .line 517
    .line 518
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 523
    .line 524
    .line 525
    move-result-object v2

    .line 526
    const v3, 0x7f0704d7

    .line 527
    .line 528
    .line 529
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 530
    .line 531
    .line 532
    move-result v2

    .line 533
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 534
    .line 535
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 536
    .line 537
    .line 538
    move-result-object v2

    .line 539
    const v4, 0x7f0704d6

    .line 540
    .line 541
    .line 542
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 543
    .line 544
    .line 545
    move-result v2

    .line 546
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 547
    .line 548
    iget-object v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->N:Landroid/widget/ImageView;

    .line 549
    .line 550
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 551
    .line 552
    .line 553
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->O:Landroid/widget/ImageView;

    .line 554
    .line 555
    const v2, 0x7f080cba

    .line 556
    .line 557
    .line 558
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 559
    .line 560
    .line 561
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->O:Landroid/widget/ImageView;

    .line 562
    .line 563
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 564
    .line 565
    .line 566
    move-result-object v0

    .line 567
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 568
    .line 569
    .line 570
    move-result-object v2

    .line 571
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 572
    .line 573
    .line 574
    move-result v2

    .line 575
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 576
    .line 577
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 578
    .line 579
    .line 580
    move-result-object v2

    .line 581
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 582
    .line 583
    .line 584
    move-result v2

    .line 585
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 586
    .line 587
    iget-object v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->O:Landroid/widget/ImageView;

    .line 588
    .line 589
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 590
    .line 591
    .line 592
    :cond_9
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 593
    .line 594
    if-eqz p1, :cond_a

    .line 595
    .line 596
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 597
    .line 598
    .line 599
    move-result-object p1

    .line 600
    const v0, 0x7f0707b1

    .line 601
    .line 602
    .line 603
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 604
    .line 605
    .line 606
    move-result p1

    .line 607
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->N:Landroid/widget/ImageView;

    .line 608
    .line 609
    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingTop()I

    .line 610
    .line 611
    .line 612
    move-result v2

    .line 613
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->N:Landroid/widget/ImageView;

    .line 614
    .line 615
    invoke-virtual {v3}, Landroid/widget/ImageView;->getPaddingBottom()I

    .line 616
    .line 617
    .line 618
    move-result v3

    .line 619
    invoke-virtual {v0, p1, v2, p1, v3}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 620
    .line 621
    .line 622
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->O:Landroid/widget/ImageView;

    .line 623
    .line 624
    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingTop()I

    .line 625
    .line 626
    .line 627
    move-result v2

    .line 628
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->O:Landroid/widget/ImageView;

    .line 629
    .line 630
    invoke-virtual {v3}, Landroid/widget/ImageView;->getPaddingBottom()I

    .line 631
    .line 632
    .line 633
    move-result v3

    .line 634
    invoke-virtual {v0, p1, v2, p1, v3}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 635
    .line 636
    .line 637
    :cond_a
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 638
    .line 639
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 640
    .line 641
    .line 642
    move-result v0

    .line 643
    iget-object v2, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 644
    .line 645
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 646
    .line 647
    .line 648
    move-result v2

    .line 649
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 650
    .line 651
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 652
    .line 653
    .line 654
    move-result v3

    .line 655
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 656
    .line 657
    .line 658
    move-result-object v4

    .line 659
    const v5, 0x7f0709ae

    .line 660
    .line 661
    .line 662
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 663
    .line 664
    .line 665
    move-result v4

    .line 666
    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 667
    .line 668
    .line 669
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 670
    .line 671
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 672
    .line 673
    .line 674
    move-result-object p1

    .line 675
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 676
    .line 677
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 678
    .line 679
    .line 680
    move-result-object v0

    .line 681
    const v2, 0x7f0709aa

    .line 682
    .line 683
    .line 684
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 685
    .line 686
    .line 687
    move-result v0

    .line 688
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 689
    .line 690
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->X:Landroid/widget/LinearLayout;

    .line 691
    .line 692
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 693
    .line 694
    .line 695
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->S:Landroid/widget/TextView;

    .line 696
    .line 697
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 698
    .line 699
    .line 700
    move-result-object v0

    .line 701
    const v2, 0x7f07036b

    .line 702
    .line 703
    .line 704
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 705
    .line 706
    .line 707
    move-result v0

    .line 708
    int-to-float v0, v0

    .line 709
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 710
    .line 711
    .line 712
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 713
    .line 714
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 715
    .line 716
    .line 717
    move-result v0

    .line 718
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 719
    .line 720
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 721
    .line 722
    .line 723
    move-result v3

    .line 724
    iget-object v4, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 725
    .line 726
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 727
    .line 728
    .line 729
    move-result v4

    .line 730
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 731
    .line 732
    .line 733
    move-result-object v6

    .line 734
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 735
    .line 736
    .line 737
    move-result v6

    .line 738
    invoke-virtual {p1, v0, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 739
    .line 740
    .line 741
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->T:Landroid/widget/TextView;

    .line 742
    .line 743
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 744
    .line 745
    .line 746
    move-result-object v0

    .line 747
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 748
    .line 749
    .line 750
    move-result v0

    .line 751
    int-to-float v0, v0

    .line 752
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 753
    .line 754
    .line 755
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 756
    .line 757
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 758
    .line 759
    .line 760
    move-result-object p1

    .line 761
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 762
    .line 763
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 764
    .line 765
    .line 766
    move-result-object v0

    .line 767
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 768
    .line 769
    .line 770
    move-result v0

    .line 771
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 772
    .line 773
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Y:Landroid/widget/LinearLayout;

    .line 774
    .line 775
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 776
    .line 777
    .line 778
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 779
    .line 780
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 781
    .line 782
    .line 783
    move-result v0

    .line 784
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 785
    .line 786
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 787
    .line 788
    .line 789
    move-result v3

    .line 790
    iget-object v4, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 791
    .line 792
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 793
    .line 794
    .line 795
    move-result v4

    .line 796
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 797
    .line 798
    .line 799
    move-result-object v6

    .line 800
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 801
    .line 802
    .line 803
    move-result v6

    .line 804
    invoke-virtual {p1, v0, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 805
    .line 806
    .line 807
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->U:Landroid/widget/TextView;

    .line 808
    .line 809
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 810
    .line 811
    .line 812
    move-result-object v0

    .line 813
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 814
    .line 815
    .line 816
    move-result v0

    .line 817
    int-to-float v0, v0

    .line 818
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 819
    .line 820
    .line 821
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 822
    .line 823
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 824
    .line 825
    .line 826
    move-result-object p1

    .line 827
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 828
    .line 829
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 830
    .line 831
    .line 832
    move-result-object v0

    .line 833
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 834
    .line 835
    .line 836
    move-result v0

    .line 837
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 838
    .line 839
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->Z:Landroid/widget/LinearLayout;

    .line 840
    .line 841
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 842
    .line 843
    .line 844
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 845
    .line 846
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 847
    .line 848
    .line 849
    move-result v0

    .line 850
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 851
    .line 852
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 853
    .line 854
    .line 855
    move-result v3

    .line 856
    iget-object v4, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 857
    .line 858
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 859
    .line 860
    .line 861
    move-result v4

    .line 862
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 863
    .line 864
    .line 865
    move-result-object v6

    .line 866
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 867
    .line 868
    .line 869
    move-result v6

    .line 870
    invoke-virtual {p1, v0, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 871
    .line 872
    .line 873
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->V:Landroid/widget/TextView;

    .line 874
    .line 875
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 876
    .line 877
    .line 878
    move-result-object v0

    .line 879
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 880
    .line 881
    .line 882
    move-result v0

    .line 883
    int-to-float v0, v0

    .line 884
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 885
    .line 886
    .line 887
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 888
    .line 889
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 890
    .line 891
    .line 892
    move-result-object p1

    .line 893
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 894
    .line 895
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 896
    .line 897
    .line 898
    move-result-object v0

    .line 899
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 900
    .line 901
    .line 902
    move-result v0

    .line 903
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 904
    .line 905
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->a0:Landroid/widget/LinearLayout;

    .line 906
    .line 907
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 908
    .line 909
    .line 910
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 911
    .line 912
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 913
    .line 914
    .line 915
    move-result v0

    .line 916
    iget-object v3, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 917
    .line 918
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 919
    .line 920
    .line 921
    move-result v3

    .line 922
    iget-object v4, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 923
    .line 924
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 925
    .line 926
    .line 927
    move-result v4

    .line 928
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 929
    .line 930
    .line 931
    move-result-object v6

    .line 932
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 933
    .line 934
    .line 935
    move-result v6

    .line 936
    invoke-virtual {p1, v0, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 937
    .line 938
    .line 939
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->W:Landroid/widget/TextView;

    .line 940
    .line 941
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 942
    .line 943
    .line 944
    move-result-object v0

    .line 945
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 946
    .line 947
    .line 948
    move-result v0

    .line 949
    int-to-float v0, v0

    .line 950
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 951
    .line 952
    .line 953
    iget-object p1, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 954
    .line 955
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 956
    .line 957
    .line 958
    move-result-object p1

    .line 959
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 960
    .line 961
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 962
    .line 963
    .line 964
    move-result-object v0

    .line 965
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 966
    .line 967
    .line 968
    move-result v0

    .line 969
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 970
    .line 971
    iget-object v0, p0, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->b0:Landroid/widget/LinearLayout;

    .line 972
    .line 973
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 974
    .line 975
    .line 976
    :cond_b
    invoke-direct {p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->init()V

    .line 977
    .line 978
    .line 979
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 980
    .line 981
    .line 982
    move-result-object p1

    .line 983
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->u0(Landroid/content/Intent;)V

    .line 984
    .line 985
    .line 986
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/h;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->u0(Landroid/content/Intent;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string p1, "HomeScreenLayoutActivity"

    .line 7
    .line 8
    const-string v0, "restoreButtonState"

    .line 9
    .line 10
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->t0()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, LW3/b;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->x0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->init()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/settings/HomeScreenLayoutActivity;->t0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
