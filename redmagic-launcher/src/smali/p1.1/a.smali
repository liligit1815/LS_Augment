.class public Lp1/a;
.super Ljava/lang/Object;
.source "HotseatDivideAnimation.java"


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Lcom/android/launcher3/C2;

.field private h:Lcom/android/launcher3/c;

.field private final i:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lp1/a;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lp1/a;->b:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lp1/a;->c:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lp1/a;->d:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lp1/a;->e:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lp1/a;->f:Z

    .line 16
    .line 17
    new-instance v0, Lp1/a$a;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lp1/a$a;-><init>(Lp1/a;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lp1/a;->i:Ljava/util/Comparator;

    .line 23
    .line 24
    iput-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    iput-object p2, p0, Lp1/a;->h:Lcom/android/launcher3/c;

    .line 27
    .line 28
    return-void
.end method

.method private a(Lcom/android/launcher3/K5;Landroid/view/View;ZZ)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    if-ne v3, p2, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object p0, p0, Lp1/a;->i:Ljava/util/Comparator;

    .line 36
    .line 37
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 38
    .line 39
    .line 40
    if-eqz p3, :cond_8

    .line 41
    .line 42
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-ge v1, p0, :cond_a

    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Landroid/view/View;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    check-cast p2, Lc1/b;

    .line 59
    .line 60
    if-eqz p4, :cond_3

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iput v1, p2, Lc1/b;->n:I

    .line 65
    .line 66
    invoke-virtual {p2, v1}, Lc1/b;->i(I)V

    .line 67
    .line 68
    .line 69
    iget p3, p2, Lc1/b;->n:I

    .line 70
    .line 71
    invoke-virtual {p2, p3}, Lc1/b;->g(I)V

    .line 72
    .line 73
    .line 74
    instance-of p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 75
    .line 76
    if-eqz p2, :cond_7

    .line 77
    .line 78
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 81
    .line 82
    iput v1, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 83
    .line 84
    iput v1, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_2
    iput v1, p2, Lc1/b;->m:I

    .line 88
    .line 89
    invoke-virtual {p2, v1}, Lc1/b;->h(I)V

    .line 90
    .line 91
    .line 92
    iget p3, p2, Lc1/b;->m:I

    .line 93
    .line 94
    invoke-virtual {p2, p3}, Lc1/b;->e(I)V

    .line 95
    .line 96
    .line 97
    instance-of p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 98
    .line 99
    if-eqz p2, :cond_7

    .line 100
    .line 101
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 104
    .line 105
    iput v1, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 106
    .line 107
    iput v1, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_3
    const/4 p0, -0x1

    .line 111
    if-eqz p1, :cond_5

    .line 112
    .line 113
    iget p3, p2, Lc1/b;->n:I

    .line 114
    .line 115
    if-ne p3, p0, :cond_4

    .line 116
    .line 117
    invoke-virtual {p2}, Lc1/b;->b()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    iput p0, p2, Lc1/b;->n:I

    .line 122
    .line 123
    :cond_4
    invoke-virtual {p2, v1}, Lc1/b;->i(I)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, v1}, Lc1/b;->g(I)V

    .line 127
    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_5
    iget p3, p2, Lc1/b;->m:I

    .line 131
    .line 132
    if-ne p3, p0, :cond_6

    .line 133
    .line 134
    invoke-virtual {p2}, Lc1/b;->a()I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    iput p0, p2, Lc1/b;->m:I

    .line 139
    .line 140
    :cond_6
    invoke-virtual {p2, v1}, Lc1/b;->h(I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2, v1}, Lc1/b;->e(I)V

    .line 144
    .line 145
    .line 146
    :cond_7
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_8
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-ge v1, p0, :cond_a

    .line 154
    .line 155
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Landroid/view/View;

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    check-cast p0, Lc1/b;

    .line 166
    .line 167
    if-eqz p1, :cond_9

    .line 168
    .line 169
    iget p2, p0, Lc1/b;->n:I

    .line 170
    .line 171
    invoke-virtual {p0, p2}, Lc1/b;->i(I)V

    .line 172
    .line 173
    .line 174
    iget p2, p0, Lc1/b;->n:I

    .line 175
    .line 176
    invoke-virtual {p0, p2}, Lc1/b;->g(I)V

    .line 177
    .line 178
    .line 179
    goto :goto_5

    .line 180
    :cond_9
    iget p2, p0, Lc1/b;->m:I

    .line 181
    .line 182
    invoke-virtual {p0, p2}, Lc1/b;->h(I)V

    .line 183
    .line 184
    .line 185
    iget p2, p0, Lc1/b;->m:I

    .line 186
    .line 187
    invoke-virtual {p0, p2}, Lc1/b;->e(I)V

    .line 188
    .line 189
    .line 190
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_a
    return-void
.end method

.method private c(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V
    .locals 7

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-static {v0}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const v1, 0x7f0b04c0

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2, v1, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->W()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 40
    .line 41
    const v2, 0x7f0b032d

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v2, "enterHotseatLayout cellFromHotseat:"

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v2, ",  isChangeHotseatCountXY:"

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v2, "HotseatUtils-divide"

    .line 73
    .line 74
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    const-string v0, ",countY:"

    .line 78
    .line 79
    const v3, 0x7f0b0264

    .line 80
    .line 81
    .line 82
    const/4 v4, 0x1

    .line 83
    if-eqz p3, :cond_6

    .line 84
    .line 85
    invoke-static {}, Lx1/O;->C3()Z

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    if-eqz p3, :cond_2

    .line 90
    .line 91
    iget-object p3, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 92
    .line 93
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    const v5, 0x7f0b04c1

    .line 98
    .line 99
    .line 100
    invoke-virtual {p3, v5}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    instance-of v6, p3, Ljava/lang/Boolean;

    .line 105
    .line 106
    if-eqz v6, :cond_1

    .line 107
    .line 108
    check-cast p3, Ljava/lang/Boolean;

    .line 109
    .line 110
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 111
    .line 112
    .line 113
    move-result p3

    .line 114
    if-nez p3, :cond_1

    .line 115
    .line 116
    iget-object p3, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 117
    .line 118
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 119
    .line 120
    .line 121
    move-result-object p3

    .line 122
    const v6, 0x7f0b04c2

    .line 123
    .line 124
    .line 125
    invoke-virtual {p3, v6, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    :cond_1
    iget-object p3, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 129
    .line 130
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    invoke-virtual {p3, v5, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    :cond_2
    if-eqz p2, :cond_5

    .line 138
    .line 139
    invoke-direct {p0, v4}, Lp1/a;->m(Z)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {p2}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-eqz p2, :cond_3

    .line 151
    .line 152
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    goto :goto_0

    .line 157
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    add-int/2addr p2, v4

    .line 162
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 163
    .line 164
    .line 165
    move-result-object p3

    .line 166
    invoke-static {p3}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 167
    .line 168
    .line 169
    move-result p3

    .line 170
    if-eqz p3, :cond_4

    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    add-int/2addr p3, v4

    .line 177
    goto :goto_1

    .line 178
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 179
    .line 180
    .line 181
    move-result p3

    .line 182
    :goto_1
    iget-object v1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 183
    .line 184
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    invoke-virtual {v1, v3, v4}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1, p2, p3}, Lcom/android/launcher3/CellLayout;->s(II)V

    .line 196
    .line 197
    .line 198
    const/4 v1, 0x0

    .line 199
    invoke-virtual {p1, v1}, Lcom/android/launcher3/CellLayout;->setChangeHotseatCountXY(Z)V

    .line 200
    .line 201
    .line 202
    iput-boolean v1, p0, Lp1/a;->f:Z

    .line 203
    .line 204
    new-instance p0, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    const-string p1, "enterHotseatLayout cellFromHotseat countX:"

    .line 210
    .line 211
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_5
    iput-boolean v4, p0, Lp1/a;->f:Z

    .line 232
    .line 233
    return-void

    .line 234
    :cond_6
    if-nez p2, :cond_d

    .line 235
    .line 236
    invoke-direct {p0, v4}, Lp1/a;->m(Z)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 244
    .line 245
    .line 246
    move-result p2

    .line 247
    iget-object p3, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 248
    .line 249
    invoke-virtual {p3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 250
    .line 251
    .line 252
    move-result-object p3

    .line 253
    invoke-static {p3}, Lp1/f;->g(Landroid/content/Context;)I

    .line 254
    .line 255
    .line 256
    move-result p3

    .line 257
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-static {v1}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-eqz v1, :cond_7

    .line 266
    .line 267
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    goto :goto_2

    .line 272
    :cond_7
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 277
    .line 278
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 279
    .line 280
    .line 281
    const-string v6, "enterHotseatLayout childCount:"

    .line 282
    .line 283
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    const-string v6, ",countXY:"

    .line 290
    .line 291
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    const-string v6, " maxChildCount:"

    .line 298
    .line 299
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    if-nez p2, :cond_8

    .line 313
    .line 314
    if-ne v1, v4, :cond_8

    .line 315
    .line 316
    invoke-static {}, Lx1/O;->C3()Z

    .line 317
    .line 318
    .line 319
    move-result v5

    .line 320
    if-nez v5, :cond_8

    .line 321
    .line 322
    goto :goto_5

    .line 323
    :cond_8
    if-eq v1, p2, :cond_9

    .line 324
    .line 325
    goto :goto_5

    .line 326
    :cond_9
    if-lt v1, p3, :cond_a

    .line 327
    .line 328
    goto :goto_5

    .line 329
    :cond_a
    invoke-direct {p0, p1}, Lp1/a;->l(Lcom/android/launcher3/CellLayout;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 333
    .line 334
    .line 335
    move-result-object p2

    .line 336
    invoke-static {p2}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 337
    .line 338
    .line 339
    move-result p2

    .line 340
    if-eqz p2, :cond_b

    .line 341
    .line 342
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 343
    .line 344
    .line 345
    move-result p2

    .line 346
    goto :goto_3

    .line 347
    :cond_b
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 348
    .line 349
    .line 350
    move-result p2

    .line 351
    add-int/2addr p2, v4

    .line 352
    :goto_3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 353
    .line 354
    .line 355
    move-result-object p3

    .line 356
    invoke-static {p3}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 357
    .line 358
    .line 359
    move-result p3

    .line 360
    if-eqz p3, :cond_c

    .line 361
    .line 362
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 363
    .line 364
    .line 365
    move-result p3

    .line 366
    add-int/2addr p3, v4

    .line 367
    goto :goto_4

    .line 368
    :cond_c
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 369
    .line 370
    .line 371
    move-result p3

    .line 372
    :goto_4
    iget-object p0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 373
    .line 374
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 375
    .line 376
    .line 377
    move-result-object p0

    .line 378
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    invoke-virtual {p0, v3, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 383
    .line 384
    .line 385
    invoke-virtual {p1, p2, p3}, Lcom/android/launcher3/CellLayout;->s(II)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {p1, v4}, Lcom/android/launcher3/CellLayout;->setChangeHotseatCountXY(Z)V

    .line 389
    .line 390
    .line 391
    new-instance p0, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 394
    .line 395
    .line 396
    const-string p1, "enterHotseatLayout cellNotFromHotseat countX:"

    .line 397
    .line 398
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object p0

    .line 414
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    .line 416
    .line 417
    :cond_d
    :goto_5
    return-void
.end method

.method private e(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V
    .locals 9

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const v2, 0x7f0b04bd

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const v2, 0x7f0b04c0

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const v2, 0x7f0b032d

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->W()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v2, "leaveHotseatLayout cellFromHotseat:"

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v2, ",  isChangeHotseatCountXY:"

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const-string v2, "HotseatUtils-divide"

    .line 74
    .line 75
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    const-string v1, ",countY:"

    .line 79
    .line 80
    const v3, 0x7f0b0264

    .line 81
    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    const/4 v5, 0x1

    .line 85
    if-eqz p3, :cond_8

    .line 86
    .line 87
    invoke-static {}, Lx1/O;->C3()Z

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    if-eqz p3, :cond_1

    .line 92
    .line 93
    iget-object p3, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 94
    .line 95
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 100
    .line 101
    const v7, 0x7f0b04c1

    .line 102
    .line 103
    .line 104
    invoke-virtual {p3, v7, v6}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :cond_1
    if-nez v0, :cond_b

    .line 108
    .line 109
    invoke-direct {p0, v4}, Lp1/a;->m(Z)V

    .line 110
    .line 111
    .line 112
    iget-object p3, p0, Lp1/a;->h:Lcom/android/launcher3/c;

    .line 113
    .line 114
    invoke-virtual {p3}, Lcom/android/launcher3/c;->a()Z

    .line 115
    .line 116
    .line 117
    move-result p3

    .line 118
    if-eqz p3, :cond_2

    .line 119
    .line 120
    iget-boolean p3, p0, Lp1/a;->f:Z

    .line 121
    .line 122
    if-eqz p3, :cond_3

    .line 123
    .line 124
    :cond_2
    invoke-virtual {p1, v5}, Lcom/android/launcher3/CellLayout;->setItemPlacementDirty(Z)V

    .line 125
    .line 126
    .line 127
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 128
    .line 129
    .line 130
    move-result-object p3

    .line 131
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    invoke-static {v6}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-eqz v6, :cond_4

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    goto :goto_0

    .line 150
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    :goto_0
    if-ne v6, v5, :cond_5

    .line 155
    .line 156
    if-ne v6, v0, :cond_5

    .line 157
    .line 158
    invoke-static {}, Lx1/O;->C3()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_5

    .line 163
    .line 164
    const-string p0, "leaveHotseatLayout, countXY is 1"

    .line 165
    .line 166
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-static {v0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_6

    .line 179
    .line 180
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    goto :goto_1

    .line 185
    :cond_6
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    sub-int/2addr v0, v5

    .line 190
    :goto_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 191
    .line 192
    .line 193
    move-result-object v6

    .line 194
    invoke-static {v6}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    if-eqz v6, :cond_7

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 201
    .line 202
    .line 203
    move-result v6

    .line 204
    sub-int/2addr v6, v5

    .line 205
    goto :goto_2

    .line 206
    :cond_7
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 207
    .line 208
    .line 209
    move-result v6

    .line 210
    :goto_2
    iget-object v7, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 211
    .line 212
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 213
    .line 214
    .line 215
    move-result-object v7

    .line 216
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 217
    .line 218
    .line 219
    move-result-object v8

    .line 220
    invoke-virtual {v7, v3, v8}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1, v0, v6}, Lcom/android/launcher3/CellLayout;->s(II)V

    .line 224
    .line 225
    .line 226
    invoke-direct {p0, p3, p2, v5, v4}, Lp1/a;->a(Lcom/android/launcher3/K5;Landroid/view/View;ZZ)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1, v5}, Lcom/android/launcher3/CellLayout;->setChangeHotseatCountXY(Z)V

    .line 230
    .line 231
    .line 232
    new-instance p0, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string p1, "leaveHotseatLayout cellFromHotseat countX:"

    .line 238
    .line 239
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :cond_8
    if-eqz v0, :cond_b

    .line 260
    .line 261
    invoke-direct {p0, v4}, Lp1/a;->m(Z)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    invoke-static {p2}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 269
    .line 270
    .line 271
    move-result p2

    .line 272
    if-eqz p2, :cond_9

    .line 273
    .line 274
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 275
    .line 276
    .line 277
    move-result p2

    .line 278
    goto :goto_3

    .line 279
    :cond_9
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 280
    .line 281
    .line 282
    move-result p2

    .line 283
    sub-int/2addr p2, v5

    .line 284
    :goto_3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 285
    .line 286
    .line 287
    move-result-object p3

    .line 288
    invoke-static {p3}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 289
    .line 290
    .line 291
    move-result p3

    .line 292
    if-eqz p3, :cond_a

    .line 293
    .line 294
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 295
    .line 296
    .line 297
    move-result p3

    .line 298
    sub-int/2addr p3, v5

    .line 299
    goto :goto_4

    .line 300
    :cond_a
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 301
    .line 302
    .line 303
    move-result p3

    .line 304
    :goto_4
    iget-object p0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 305
    .line 306
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-virtual {p0, v3, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 315
    .line 316
    .line 317
    invoke-virtual {p1, p2, p3}, Lcom/android/launcher3/CellLayout;->s(II)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {p1, v4}, Lcom/android/launcher3/CellLayout;->setChangeHotseatCountXY(Z)V

    .line 321
    .line 322
    .line 323
    new-instance p0, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 326
    .line 327
    .line 328
    const-string p1, "leaveHotseatLayout cellNotFromHotseat countX:"

    .line 329
    .line 330
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    .line 348
    .line 349
    :cond_b
    return-void
.end method

.method private h()V
    .locals 4

    .line 1
    iget-object p0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/android/launcher3/CellLayout;->setChangeHotseatCountXY(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    move v1, v0

    .line 16
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v1, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lc1/b;

    .line 31
    .line 32
    const/4 v3, -0x1

    .line 33
    iput v3, v2, Lc1/b;->m:I

    .line 34
    .line 35
    iput v3, v2, Lc1/b;->n:I

    .line 36
    .line 37
    iput-boolean v0, v2, Lc1/b;->o:Z

    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method private l(Lcom/android/launcher3/CellLayout;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ge p1, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lc1/b;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    iput-boolean v1, v0, Lc1/b;->i:Z

    .line 24
    .line 25
    add-int/lit8 p1, p1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method private m(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iput-boolean v1, p0, Lp1/a;->c:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lp1/a;->d:Z

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-boolean v0, p0, Lp1/a;->c:Z

    .line 11
    .line 12
    iput-boolean v1, p0, Lp1/a;->d:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/n0$a;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/model/data/A;

    .line 4
    .line 5
    const-string v2, "HotseatUtils-divide"

    .line 6
    .line 7
    if-nez v1, :cond_9

    .line 8
    .line 9
    instance-of v1, v0, Lcom/android/launcher3/widget/z0;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    iget v1, v0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-ne v1, v3, :cond_8

    .line 19
    .line 20
    iget v0, v0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 21
    .line 22
    if-eq v0, v3, :cond_1

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_1
    const-string v0, "divideTheHotseat"

    .line 27
    .line 28
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const v1, 0x7f0b02eb

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    instance-of v2, v0, Ljava/lang/Integer;

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    check-cast v0, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eq v2, v3, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v2, 0x2

    .line 62
    if-ne v0, v2, :cond_3

    .line 63
    .line 64
    :cond_2
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    move v0, v3

    .line 78
    goto :goto_0

    .line 79
    :cond_3
    move v0, v4

    .line 80
    :goto_0
    iget-object v1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-static {v1, p1}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    const v2, 0x7f0b022e

    .line 87
    .line 88
    .line 89
    const v5, 0x7f0b0253

    .line 90
    .line 91
    .line 92
    const v6, 0x7f0b0353

    .line 93
    .line 94
    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    iget-object v1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 98
    .line 99
    invoke-static {v1, p2}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_5

    .line 104
    .line 105
    iget-object p2, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-virtual {p2, v6, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 117
    .line 118
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 123
    .line 124
    invoke-virtual {p2, v5, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 128
    .line 129
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    iget-object v0, p3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 134
    .line 135
    invoke-static {v0}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p2, v2, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 147
    .line 148
    invoke-static {p2}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    if-eqz p2, :cond_4

    .line 153
    .line 154
    invoke-direct {p0, p1, p4, v3}, Lp1/a;->e(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_4
    invoke-direct {p0, p1, p4, v4}, Lp1/a;->e(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_5
    iget-object v1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 163
    .line 164
    invoke-static {v1, p1}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-nez p1, :cond_7

    .line 169
    .line 170
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 171
    .line 172
    invoke-static {p1, p2}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_7

    .line 177
    .line 178
    if-nez v0, :cond_7

    .line 179
    .line 180
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 181
    .line 182
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 187
    .line 188
    invoke-virtual {p1, v6, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 192
    .line 193
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 198
    .line 199
    invoke-virtual {p1, v5, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 203
    .line 204
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iget-object v0, p3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 209
    .line 210
    invoke-static {v0}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {p1, v2, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 219
    .line 220
    .line 221
    iget-object p1, p3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 222
    .line 223
    invoke-static {p1}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-eqz p1, :cond_6

    .line 228
    .line 229
    invoke-direct {p0, p2, p4, v3}, Lp1/a;->c(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :cond_6
    invoke-direct {p0, p2, p4, v4}, Lp1/a;->c(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    :cond_7
    return-void

    .line 237
    :cond_8
    :goto_1
    const-string p0, "divideTheHotseat: streamer icon, return"

    .line 238
    .line 239
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_9
    :goto_2
    const-string p0, "divideTheHotseat: widget, return"

    .line 244
    .line 245
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public d(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lp1/f;->t(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lc1/b;

    .line 18
    .line 19
    iget v1, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lc1/b;->h(I)V

    .line 22
    .line 23
    .line 24
    iget v0, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lc1/b;->i(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const-string p1, "HotseatUtils-divide"

    .line 30
    .line 31
    const-string v0, "initHotseatChildPositionByDrag"

    .line 32
    .line 33
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, p1, v0}, Lp1/a;->g(Lcom/android/launcher3/n0$a;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/K5;->getCountX()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/K5;->getCountY()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    move v3, v1

    .line 34
    :cond_0
    if-eq v2, v3, :cond_1

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Lp1/a;->i(Z)V

    .line 38
    .line 39
    .line 40
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v0, "printHotseatValues childCount:"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v0, ",countXY:"

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string v0, "HotseatUtils-divide"

    .line 66
    .line 67
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public g(Lcom/android/launcher3/n0$a;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lp1/a;->i(Z)V

    .line 5
    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v1, p0, Lp1/a;->c:Z

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    iget-boolean v1, p0, Lp1/a;->d:Z

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    :cond_1
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-boolean p1, p1, Lcom/android/launcher3/n0$a;->j:Z

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lp1/a;->i(Z)V

    .line 23
    .line 24
    .line 25
    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "resetDivideAnimationFlag isCancleCreatShortcut:"

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p2, " mEnterHotseat:"

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-boolean p2, p0, Lp1/a;->c:Z

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p2, " mLeaveHotseat:"

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-boolean p2, p0, Lp1/a;->d:Z

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string p2, "HotseatUtils-divide"

    .line 63
    .line 64
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Lp1/a;->h()V

    .line 68
    .line 69
    .line 70
    iput-boolean v0, p0, Lp1/a;->f:Z

    .line 71
    .line 72
    iput-boolean v0, p0, Lp1/a;->c:Z

    .line 73
    .line 74
    iput-boolean v0, p0, Lp1/a;->d:Z

    .line 75
    .line 76
    iput-boolean v0, p0, Lp1/a;->a:Z

    .line 77
    .line 78
    iput-boolean v0, p0, Lp1/a;->b:Z

    .line 79
    .line 80
    iput-boolean v0, p0, Lp1/a;->e:Z

    .line 81
    .line 82
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const v1, 0x7f0b032d

    .line 89
    .line 90
    .line 91
    const/4 v2, 0x0

    .line 92
    invoke-virtual {p1, v1, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const v1, 0x7f0b02eb

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lx1/O;->C3()Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_3

    .line 116
    .line 117
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const v0, 0x7f0b04c1

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v0, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    const v0, 0x7f0b04c2

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v0, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const p1, 0x7f0b04c0

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p1, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    const-string p0, "resetDivideAnimationFlag"

    .line 154
    .line 155
    invoke-static {p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public i(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget-object v3, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v3}, Lp1/f;->g(Landroid/content/Context;)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    new-instance v4, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v5, "resetHotseatChildPosition firstCloseFolder:"

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v5, " childCount:"

    .line 39
    .line 40
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v5, " maxChildCount:"

    .line 47
    .line 48
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v5, " mEnterHotseat:"

    .line 55
    .line 56
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean v5, p0, Lp1/a;->c:Z

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    const-string v5, "HotseatUtils-divide"

    .line 69
    .line 70
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    if-ge v2, v3, :cond_5

    .line 76
    .line 77
    :cond_0
    if-nez p1, :cond_1

    .line 78
    .line 79
    if-le v2, v3, :cond_1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    const/4 v4, 0x0

    .line 83
    const/4 v6, 0x1

    .line 84
    invoke-direct {p0, v1, v4, v6, v6}, Lp1/a;->a(Lcom/android/launcher3/K5;Landroid/view/View;ZZ)V

    .line 85
    .line 86
    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    if-eqz p1, :cond_4

    .line 90
    .line 91
    iget-boolean p0, p0, Lp1/a;->c:Z

    .line 92
    .line 93
    if-eqz p0, :cond_4

    .line 94
    .line 95
    :cond_2
    invoke-static {}, Lx1/O;->C3()Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    if-eqz v2, :cond_4

    .line 102
    .line 103
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 104
    .line 105
    :cond_4
    if-le v2, v3, :cond_6

    .line 106
    .line 107
    :cond_5
    :goto_0
    return-void

    .line 108
    :cond_6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    invoke-virtual {v0, p0, v2}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_7
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    invoke-virtual {v0, v2, p0}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 131
    .line 132
    .line 133
    :goto_1
    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 134
    .line 135
    .line 136
    new-instance p0, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const-string p1, "resetHotseatChildPosition hotseat.getCountX():"

    .line 142
    .line 143
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string p1, " hotseat.getCountY():"

    .line 154
    .line 155
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->E0()V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public j(Lcom/android/launcher3/CellLayout;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "HotseatUtils-divide"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-static {v0, p1}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-boolean p1, p0, Lp1/a;->d:Z

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-boolean p1, p0, Lp1/a;->a:Z

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-direct {p0, p1, p2, v0}, Lp1/a;->c(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-direct {p0, v0, p2, v3, v3}, Lp1/a;->a(Lcom/android/launcher3/K5;Landroid/view/View;ZZ)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-object p0, p0, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 54
    .line 55
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/CellLayout;->y0(Landroid/view/View;[[Z)V

    .line 56
    .line 57
    .line 58
    const-string p0, "returnToTheOriginalPosition isHotseat"

    .line 59
    .line 60
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget-object v1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    invoke-static {v1, p1}, Lp1/f;->v(Lcom/android/launcher3/C2;Landroid/view/View;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    iget-boolean p1, p0, Lp1/a;->c:Z

    .line 73
    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    invoke-static {v0}, Lp1/f;->z(Lcom/android/launcher3/model/data/y;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_1

    .line 81
    .line 82
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-direct {p0, p1, p2, v3}, Lp1/a;->e(Lcom/android/launcher3/CellLayout;Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iget-object p0, p0, Lcom/android/launcher3/util/t0;->c:[[Z

    .line 96
    .line 97
    const/4 p2, 0x0

    .line 98
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/CellLayout;->y0(Landroid/view/View;[[Z)V

    .line 99
    .line 100
    .line 101
    const-string p0, "returnToTheOriginalPosition"

    .line 102
    .line 103
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    :cond_1
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lp1/a;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lp1/a;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public o(Lcom/android/launcher3/K5;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/K5;->getCountY()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/K5;->getCountX()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v4, "updateHotseatByRemoveView countXY:"

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v4, ",childCount:"

    .line 38
    .line 39
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v4, " mSwapAnimation: "

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-boolean v4, p0, Lp1/a;->b:Z

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v4, " mFlagStopHotseatUpdate:"

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-boolean v4, p0, Lp1/a;->e:Z

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v4, " mHotseatCreateUserFolder: "

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v4, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 71
    .line 72
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    iget-boolean v4, v4, Lcom/android/launcher3/Workspace;->A0:Z

    .line 77
    .line 78
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v4, " mHotseatDroptoExistingFolder: "

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object v4, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 87
    .line 88
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    iget-boolean v4, v4, Lcom/android/launcher3/Workspace;->B0:Z

    .line 93
    .line 94
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const-string v4, "HotseatUtils-divide"

    .line 102
    .line 103
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    sub-int v3, v2, v1

    .line 107
    .line 108
    const/4 v4, 0x0

    .line 109
    if-nez v3, :cond_2

    .line 110
    .line 111
    const/4 p1, 0x5

    .line 112
    if-ne v2, p1, :cond_4

    .line 113
    .line 114
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-boolean p1, p1, Lcom/android/launcher3/Workspace;->A0:Z

    .line 121
    .line 122
    if-nez p1, :cond_1

    .line 123
    .line 124
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iget-boolean p1, p1, Lcom/android/launcher3/Workspace;->B0:Z

    .line 131
    .line 132
    if-eqz p1, :cond_4

    .line 133
    .line 134
    :cond_1
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-boolean v4, p1, Lcom/android/launcher3/Workspace;->A0:Z

    .line 141
    .line 142
    iget-object p0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    iput-boolean v4, p0, Lcom/android/launcher3/Workspace;->B0:Z

    .line 149
    .line 150
    return-void

    .line 151
    :cond_2
    const/4 v3, 0x1

    .line 152
    if-nez v1, :cond_3

    .line 153
    .line 154
    if-ne v2, v3, :cond_3

    .line 155
    .line 156
    invoke-static {}, Lx1/O;->C3()Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-nez v2, :cond_3

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_3
    iget-boolean v2, p0, Lp1/a;->b:Z

    .line 164
    .line 165
    if-eqz v2, :cond_5

    .line 166
    .line 167
    :cond_4
    :goto_1
    return-void

    .line 168
    :cond_5
    iget-boolean v2, p0, Lp1/a;->e:Z

    .line 169
    .line 170
    if-eqz v2, :cond_6

    .line 171
    .line 172
    iput-boolean v4, p0, Lp1/a;->e:Z

    .line 173
    .line 174
    return-void

    .line 175
    :cond_6
    iget-object v2, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 176
    .line 177
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    iget-boolean v2, v2, Lcom/android/launcher3/Workspace;->A0:Z

    .line 182
    .line 183
    if-nez v2, :cond_9

    .line 184
    .line 185
    iget-object v2, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 186
    .line 187
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    iget-boolean v2, v2, Lcom/android/launcher3/Workspace;->B0:Z

    .line 192
    .line 193
    if-eqz v2, :cond_7

    .line 194
    .line 195
    goto :goto_3

    .line 196
    :cond_7
    const/4 v2, 0x0

    .line 197
    invoke-direct {p0, p1, v2, v3, v3}, Lp1/a;->a(Lcom/android/launcher3/K5;Landroid/view/View;ZZ)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 205
    .line 206
    if-eqz v0, :cond_8

    .line 207
    .line 208
    invoke-virtual {p1}, Lcom/android/launcher3/K5;->getCountX()I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 213
    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_8
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 221
    .line 222
    .line 223
    :goto_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->E0()V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_9
    :goto_3
    iget-object p1, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 231
    .line 232
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iput-boolean v4, p1, Lcom/android/launcher3/Workspace;->A0:Z

    .line 237
    .line 238
    iget-object p0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    iput-boolean v4, p0, Lcom/android/launcher3/Workspace;->B0:Z

    .line 245
    .line 246
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object p0, p0, Lp1/a;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->E0()V

    .line 8
    .line 9
    .line 10
    const-string p0, "HotseatUtils-divide"

    .line 11
    .line 12
    const-string v0, "updateHotseatDatabase"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return-void
.end method
