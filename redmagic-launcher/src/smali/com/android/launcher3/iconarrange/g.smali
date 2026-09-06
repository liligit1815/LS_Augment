.class public Lcom/android/launcher3/iconarrange/g;
.super Ljava/lang/Object;
.source "IconConvergeAnim.java"


# static fields
.field private static f:Ljava/lang/String; = "IconConvergeAnim"


# instance fields
.field private a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation
.end field

.field private b:F

.field private c:Z

.field private d:F

.field private e:Lcom/android/launcher3/C2;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/iconarrange/g;->b:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/android/launcher3/iconarrange/g;->c:Z

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput v0, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 13
    .line 14
    iput-object p2, p0, Lcom/android/launcher3/iconarrange/g;->a:Ljava/util/ArrayList;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/g;->e:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/iconarrange/g;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/g;->e:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/iconarrange/g;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/g;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/iconarrange/g;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/g;->b:F

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public d(Landroid/graphics/Canvas;II)V
    .locals 14

    .line 1
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/g;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v1, :cond_5

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/iconarrange/g;->c:Z

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_1
    new-instance v1, Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    new-array v3, v2, [I

    .line 26
    .line 27
    iget-object v4, p0, Lcom/android/launcher3/iconarrange/g;->a:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-eqz v5, :cond_4

    .line 38
    .line 39
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 44
    .line 45
    invoke-virtual {v5}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-virtual {v5, v1}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->getLocationOnScreen([I)V

    .line 53
    .line 54
    .line 55
    iget-object v7, p0, Lcom/android/launcher3/iconarrange/g;->e:Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    invoke-virtual {v7, v5, v3}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 62
    .line 63
    .line 64
    iget v7, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 65
    .line 66
    const v8, 0x3df5c290    # 0.120000005f

    .line 67
    .line 68
    .line 69
    mul-float/2addr v8, v7

    .line 70
    iget v9, p0, Lcom/android/launcher3/iconarrange/g;->b:F

    .line 71
    .line 72
    mul-float/2addr v8, v9

    .line 73
    add-float/2addr v8, v7

    .line 74
    const/4 v9, 0x0

    .line 75
    aget v10, v3, v9

    .line 76
    .line 77
    int-to-float v10, v10

    .line 78
    iget v11, v1, Landroid/graphics/Rect;->left:I

    .line 79
    .line 80
    int-to-float v11, v11

    .line 81
    mul-float/2addr v11, v7

    .line 82
    add-float/2addr v10, v11

    .line 83
    float-to-int v10, v10

    .line 84
    aput v10, v3, v9

    .line 85
    .line 86
    const/4 v10, 0x1

    .line 87
    aget v11, v3, v10

    .line 88
    .line 89
    int-to-float v11, v11

    .line 90
    iget v12, v1, Landroid/graphics/Rect;->top:I

    .line 91
    .line 92
    int-to-float v12, v12

    .line 93
    mul-float/2addr v12, v7

    .line 94
    add-float/2addr v11, v12

    .line 95
    float-to-int v7, v11

    .line 96
    aput v7, v3, v10

    .line 97
    .line 98
    iget-object v7, p0, Lcom/android/launcher3/iconarrange/g;->e:Lcom/android/launcher3/C2;

    .line 99
    .line 100
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    if-eqz v7, :cond_2

    .line 105
    .line 106
    iget-object v7, p0, Lcom/android/launcher3/iconarrange/g;->e:Lcom/android/launcher3/C2;

    .line 107
    .line 108
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    invoke-virtual {v7, v5}, Lcom/android/launcher3/G4;->k(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/folder/Folder;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    if-eqz v5, :cond_2

    .line 117
    .line 118
    invoke-virtual {v5}, Lcom/android/launcher3/a;->isOpen()Z

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    if-nez v7, :cond_2

    .line 123
    .line 124
    invoke-virtual {v5}, Lcom/android/launcher3/folder/Folder;->getFolderIcon()Lcom/android/launcher3/folder/FolderIcon;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5, v3}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 129
    .line 130
    .line 131
    new-array v7, v2, [I

    .line 132
    .line 133
    invoke-virtual {v5, v7}, Lcom/android/launcher3/folder/FolderIcon;->B([I)V

    .line 134
    .line 135
    .line 136
    aget v5, v3, v9

    .line 137
    .line 138
    int-to-float v5, v5

    .line 139
    aget v8, v7, v9

    .line 140
    .line 141
    int-to-float v8, v8

    .line 142
    iget v11, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 143
    .line 144
    mul-float/2addr v8, v11

    .line 145
    add-float/2addr v5, v8

    .line 146
    float-to-int v5, v5

    .line 147
    aput v5, v3, v9

    .line 148
    .line 149
    aget v5, v3, v10

    .line 150
    .line 151
    int-to-float v5, v5

    .line 152
    aget v7, v7, v10

    .line 153
    .line 154
    int-to-float v7, v7

    .line 155
    mul-float/2addr v7, v11

    .line 156
    add-float/2addr v5, v7

    .line 157
    float-to-int v5, v5

    .line 158
    aput v5, v3, v10

    .line 159
    .line 160
    sget v5, Lcom/android/launcher3/folder/i0;->m:F

    .line 161
    .line 162
    iget v7, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 163
    .line 164
    mul-float/2addr v5, v7

    .line 165
    const v8, 0x3f8f5c29    # 1.12f

    .line 166
    .line 167
    .line 168
    mul-float/2addr v7, v8

    .line 169
    sget v8, Lcom/android/launcher3/folder/i0;->m:F

    .line 170
    .line 171
    iget v11, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 172
    .line 173
    mul-float/2addr v8, v11

    .line 174
    sub-float/2addr v7, v8

    .line 175
    iget v8, p0, Lcom/android/launcher3/iconarrange/g;->b:F

    .line 176
    .line 177
    mul-float/2addr v7, v8

    .line 178
    add-float v8, v5, v7

    .line 179
    .line 180
    :cond_2
    aget v5, v3, v9

    .line 181
    .line 182
    sub-int v7, p2, v5

    .line 183
    .line 184
    int-to-float v7, v7

    .line 185
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 186
    .line 187
    .line 188
    move-result v11

    .line 189
    int-to-float v11, v11

    .line 190
    iget v12, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 191
    .line 192
    mul-float/2addr v11, v12

    .line 193
    const/high16 v12, 0x40000000    # 2.0f

    .line 194
    .line 195
    div-float/2addr v11, v12

    .line 196
    sub-float/2addr v7, v11

    .line 197
    iget v11, p0, Lcom/android/launcher3/iconarrange/g;->b:F

    .line 198
    .line 199
    mul-float/2addr v7, v11

    .line 200
    float-to-int v7, v7

    .line 201
    add-int/2addr v5, v7

    .line 202
    aput v5, v3, v9

    .line 203
    .line 204
    aget v5, v3, v10

    .line 205
    .line 206
    sub-int v7, p3, v5

    .line 207
    .line 208
    int-to-float v7, v7

    .line 209
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 210
    .line 211
    .line 212
    move-result v11

    .line 213
    int-to-float v11, v11

    .line 214
    iget v13, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 215
    .line 216
    mul-float/2addr v11, v13

    .line 217
    div-float/2addr v11, v12

    .line 218
    sub-float/2addr v7, v11

    .line 219
    iget v11, p0, Lcom/android/launcher3/iconarrange/g;->b:F

    .line 220
    .line 221
    mul-float/2addr v7, v11

    .line 222
    float-to-int v7, v7

    .line 223
    add-int/2addr v5, v7

    .line 224
    aput v5, v3, v10

    .line 225
    .line 226
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 227
    .line 228
    .line 229
    aget v5, v3, v9

    .line 230
    .line 231
    int-to-float v5, v5

    .line 232
    aget v7, v3, v10

    .line 233
    .line 234
    int-to-float v7, v7

    .line 235
    invoke-virtual {p1, v8, v8, v5, v7}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 236
    .line 237
    .line 238
    aget v5, v3, v9

    .line 239
    .line 240
    int-to-float v5, v5

    .line 241
    aget v7, v3, v10

    .line 242
    .line 243
    int-to-float v7, v7

    .line 244
    invoke-virtual {p1, v5, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 245
    .line 246
    .line 247
    if-eqz v6, :cond_3

    .line 248
    .line 249
    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 250
    .line 251
    .line 252
    :cond_3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 253
    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :cond_4
    :goto_1
    return-void

    .line 258
    :cond_5
    :goto_2
    sget-object p0, Lcom/android/launcher3/iconarrange/g;->f:Ljava/lang/String;

    .line 259
    .line 260
    const-string v0, "drawBitmapAnim--mDragingViews error"

    .line 261
    .line 262
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/iconarrange/g;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public f(Lcom/android/launcher3/dragndrop/v;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/g;->e:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->getInitialScale()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/android/launcher3/iconarrange/g;->d:F

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    new-array v0, v0, [F

    .line 22
    .line 23
    fill-array-data v0, :array_0

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/android/launcher3/G2;->i([F)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-wide/16 v1, 0x64

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    new-instance v1, Lcom/android/launcher3/iconarrange/g$a;

    .line 36
    .line 37
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/iconarrange/g$a;-><init>(Lcom/android/launcher3/iconarrange/g;Lcom/android/launcher3/dragndrop/v;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Lcom/android/launcher3/iconarrange/g$b;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Lcom/android/launcher3/iconarrange/g$b;-><init>(Lcom/android/launcher3/iconarrange/g;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
