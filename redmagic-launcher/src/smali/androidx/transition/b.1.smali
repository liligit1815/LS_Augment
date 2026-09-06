.class public Landroidx/transition/b;
.super Landroidx/transition/k;
.source "ChangeBounds.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/transition/b$i;,
        Landroidx/transition/b$g;,
        Landroidx/transition/b$h;
    }
.end annotation


# static fields
.field private static final T:[Ljava/lang/String;

.field private static final U:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroidx/transition/b$i;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private static final V:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroidx/transition/b$i;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private static final W:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private static final X:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private static final Y:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private static final Z:Landroidx/transition/i;


# instance fields
.field private S:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "android:changeBounds:windowX"

    .line 2
    .line 3
    const-string v1, "android:changeBounds:windowY"

    .line 4
    .line 5
    const-string v2, "android:changeBounds:bounds"

    .line 6
    .line 7
    const-string v3, "android:changeBounds:clip"

    .line 8
    .line 9
    const-string v4, "android:changeBounds:parent"

    .line 10
    .line 11
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Landroidx/transition/b;->T:[Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, Landroidx/transition/b$a;

    .line 18
    .line 19
    const-class v1, Landroid/graphics/PointF;

    .line 20
    .line 21
    const-string v2, "topLeft"

    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Landroidx/transition/b$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Landroidx/transition/b;->U:Landroid/util/Property;

    .line 27
    .line 28
    new-instance v0, Landroidx/transition/b$b;

    .line 29
    .line 30
    const-string v3, "bottomRight"

    .line 31
    .line 32
    invoke-direct {v0, v1, v3}, Landroidx/transition/b$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Landroidx/transition/b;->V:Landroid/util/Property;

    .line 36
    .line 37
    new-instance v0, Landroidx/transition/b$c;

    .line 38
    .line 39
    invoke-direct {v0, v1, v3}, Landroidx/transition/b$c;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sput-object v0, Landroidx/transition/b;->W:Landroid/util/Property;

    .line 43
    .line 44
    new-instance v0, Landroidx/transition/b$d;

    .line 45
    .line 46
    invoke-direct {v0, v1, v2}, Landroidx/transition/b$d;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Landroidx/transition/b;->X:Landroid/util/Property;

    .line 50
    .line 51
    new-instance v0, Landroidx/transition/b$e;

    .line 52
    .line 53
    const-string v2, "position"

    .line 54
    .line 55
    invoke-direct {v0, v1, v2}, Landroidx/transition/b$e;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Landroidx/transition/b;->Y:Landroid/util/Property;

    .line 59
    .line 60
    new-instance v0, Landroidx/transition/i;

    .line 61
    .line 62
    invoke-direct {v0}, Landroidx/transition/i;-><init>()V

    .line 63
    .line 64
    .line 65
    sput-object v0, Landroidx/transition/b;->Z:Landroidx/transition/i;

    .line 66
    .line 67
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/transition/k;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/transition/b;->S:Z

    .line 6
    .line 7
    return-void
.end method

.method private h0(Landroidx/transition/v;)V
    .locals 7

    .line 1
    iget-object v0, p1, Landroidx/transition/v;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object v1, p1, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 22
    .line 23
    new-instance v2, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 42
    .line 43
    .line 44
    const-string v3, "android:changeBounds:bounds"

    .line 45
    .line 46
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object v1, p1, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 50
    .line 51
    iget-object v2, p1, Landroidx/transition/v;->b:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v3, "android:changeBounds:parent"

    .line 58
    .line 59
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    iget-boolean p0, p0, Landroidx/transition/b;->S:Z

    .line 63
    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    iget-object p0, p1, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 67
    .line 68
    const-string p1, "android:changeBounds:clip"

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method


# virtual methods
.method public G()[Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Landroidx/transition/b;->T:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Landroidx/transition/v;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/transition/b;->h0(Landroidx/transition/v;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Landroidx/transition/v;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/transition/b;->h0(Landroidx/transition/v;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Landroidx/transition/b;->S:Z

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p1, Landroidx/transition/v;->b:Landroid/view/View;

    .line 9
    .line 10
    sget v0, Landroidx/transition/h;->b:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/graphics/Rect;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    iget-object p1, p1, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 21
    .line 22
    const-string v0, "android:changeBounds:clip"

    .line 23
    .line 24
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public p(Landroid/view/ViewGroup;Landroidx/transition/v;Landroidx/transition/v;)Landroid/animation/Animator;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    if-nez v2, :cond_1

    .line 10
    .line 11
    :cond_0
    const/16 p1, 0x0

    .line 12
    .line 13
    goto/16 :goto_c

    .line 14
    .line 15
    :cond_1
    iget-object v7, v1, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 16
    .line 17
    iget-object v8, v2, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 18
    .line 19
    const-string v9, "android:changeBounds:parent"

    .line 20
    .line 21
    invoke-interface {v7, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    check-cast v7, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    check-cast v8, Landroid/view/ViewGroup;

    .line 32
    .line 33
    if-eqz v7, :cond_2

    .line 34
    .line 35
    if-nez v8, :cond_3

    .line 36
    .line 37
    :cond_2
    const/16 p1, 0x0

    .line 38
    .line 39
    goto/16 :goto_c

    .line 40
    .line 41
    :cond_3
    iget-object v10, v2, Landroidx/transition/v;->b:Landroid/view/View;

    .line 42
    .line 43
    iget-object v7, v1, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 44
    .line 45
    const-string v8, "android:changeBounds:bounds"

    .line 46
    .line 47
    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    check-cast v7, Landroid/graphics/Rect;

    .line 52
    .line 53
    iget-object v9, v2, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 54
    .line 55
    invoke-interface {v9, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    check-cast v8, Landroid/graphics/Rect;

    .line 60
    .line 61
    iget v15, v7, Landroid/graphics/Rect;->left:I

    .line 62
    .line 63
    iget v9, v8, Landroid/graphics/Rect;->left:I

    .line 64
    .line 65
    iget v11, v7, Landroid/graphics/Rect;->top:I

    .line 66
    .line 67
    iget v12, v8, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    iget v13, v7, Landroid/graphics/Rect;->right:I

    .line 70
    .line 71
    iget v14, v8, Landroid/graphics/Rect;->right:I

    .line 72
    .line 73
    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    .line 74
    .line 75
    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    const/16 p1, 0x0

    .line 78
    .line 79
    sub-int v6, v13, v15

    .line 80
    .line 81
    const/16 v23, 0x1

    .line 82
    .line 83
    sub-int v5, v7, v11

    .line 84
    .line 85
    const/16 v16, 0x0

    .line 86
    .line 87
    sub-int v4, v14, v9

    .line 88
    .line 89
    sub-int v3, v8, v12

    .line 90
    .line 91
    iget-object v1, v1, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 92
    .line 93
    move/from16 v18, v3

    .line 94
    .line 95
    const-string v3, "android:changeBounds:clip"

    .line 96
    .line 97
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Landroid/graphics/Rect;

    .line 102
    .line 103
    iget-object v2, v2, Landroidx/transition/v;->a:Ljava/util/Map;

    .line 104
    .line 105
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Landroid/graphics/Rect;

    .line 110
    .line 111
    if-eqz v6, :cond_4

    .line 112
    .line 113
    if-nez v5, :cond_5

    .line 114
    .line 115
    :cond_4
    if-eqz v4, :cond_9

    .line 116
    .line 117
    if-eqz v18, :cond_9

    .line 118
    .line 119
    :cond_5
    if-ne v15, v9, :cond_7

    .line 120
    .line 121
    if-eq v11, v12, :cond_6

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    move/from16 v3, v16

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_7
    :goto_0
    move/from16 v3, v23

    .line 128
    .line 129
    :goto_1
    if-ne v13, v14, :cond_8

    .line 130
    .line 131
    if-eq v7, v8, :cond_a

    .line 132
    .line 133
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_9
    move/from16 v3, v16

    .line 137
    .line 138
    :cond_a
    :goto_2
    if-eqz v1, :cond_b

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v19

    .line 144
    if-eqz v19, :cond_c

    .line 145
    .line 146
    :cond_b
    if-nez v1, :cond_d

    .line 147
    .line 148
    if-eqz v2, :cond_d

    .line 149
    .line 150
    :cond_c
    add-int/lit8 v3, v3, 0x1

    .line 151
    .line 152
    :cond_d
    if-lez v3, :cond_1b

    .line 153
    .line 154
    move-object/from16 p2, v1

    .line 155
    .line 156
    iget-boolean v1, v0, Landroidx/transition/b;->S:Z

    .line 157
    .line 158
    if-nez v1, :cond_12

    .line 159
    .line 160
    invoke-static {v10, v15, v11, v13, v7}, Landroidx/transition/y;->d(Landroid/view/View;IIII)V

    .line 161
    .line 162
    .line 163
    const/4 v1, 0x2

    .line 164
    if-ne v3, v1, :cond_f

    .line 165
    .line 166
    if-ne v6, v4, :cond_e

    .line 167
    .line 168
    move/from16 v1, v18

    .line 169
    .line 170
    if-ne v5, v1, :cond_e

    .line 171
    .line 172
    invoke-virtual {v0}, Landroidx/transition/k;->x()Landroidx/transition/g;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    int-to-float v2, v15

    .line 177
    int-to-float v3, v11

    .line 178
    int-to-float v4, v9

    .line 179
    int-to-float v5, v12

    .line 180
    invoke-virtual {v1, v2, v3, v4, v5}, Landroidx/transition/g;->a(FFFF)Landroid/graphics/Path;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    sget-object v2, Landroidx/transition/b;->Y:Landroid/util/Property;

    .line 185
    .line 186
    invoke-static {v10, v2, v1}, Landroidx/transition/f;->a(Ljava/lang/Object;Landroid/util/Property;Landroid/graphics/Path;)Landroid/animation/ObjectAnimator;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    goto/16 :goto_b

    .line 191
    .line 192
    :cond_e
    new-instance v1, Landroidx/transition/b$i;

    .line 193
    .line 194
    invoke-direct {v1, v10}, Landroidx/transition/b$i;-><init>(Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Landroidx/transition/k;->x()Landroidx/transition/g;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    int-to-float v3, v15

    .line 202
    int-to-float v4, v11

    .line 203
    int-to-float v5, v9

    .line 204
    int-to-float v6, v12

    .line 205
    invoke-virtual {v2, v3, v4, v5, v6}, Landroidx/transition/g;->a(FFFF)Landroid/graphics/Path;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    sget-object v3, Landroidx/transition/b;->U:Landroid/util/Property;

    .line 210
    .line 211
    invoke-static {v1, v3, v2}, Landroidx/transition/f;->a(Ljava/lang/Object;Landroid/util/Property;Landroid/graphics/Path;)Landroid/animation/ObjectAnimator;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v0}, Landroidx/transition/k;->x()Landroidx/transition/g;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    int-to-float v4, v13

    .line 220
    int-to-float v5, v7

    .line 221
    int-to-float v6, v14

    .line 222
    int-to-float v7, v8

    .line 223
    invoke-virtual {v3, v4, v5, v6, v7}, Landroidx/transition/g;->a(FFFF)Landroid/graphics/Path;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    sget-object v4, Landroidx/transition/b;->V:Landroid/util/Property;

    .line 228
    .line 229
    invoke-static {v1, v4, v3}, Landroidx/transition/f;->a(Ljava/lang/Object;Landroid/util/Property;Landroid/graphics/Path;)Landroid/animation/ObjectAnimator;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 234
    .line 235
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 236
    .line 237
    .line 238
    const/4 v5, 0x2

    .line 239
    new-array v5, v5, [Landroid/animation/Animator;

    .line 240
    .line 241
    aput-object v2, v5, v16

    .line 242
    .line 243
    aput-object v3, v5, v23

    .line 244
    .line 245
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 246
    .line 247
    .line 248
    new-instance v2, Landroidx/transition/b$f;

    .line 249
    .line 250
    invoke-direct {v2, v0, v1}, Landroidx/transition/b$f;-><init>(Landroidx/transition/b;Landroidx/transition/b$i;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v4, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 254
    .line 255
    .line 256
    move-object v1, v4

    .line 257
    goto/16 :goto_b

    .line 258
    .line 259
    :cond_f
    if-ne v15, v9, :cond_11

    .line 260
    .line 261
    if-eq v11, v12, :cond_10

    .line 262
    .line 263
    goto :goto_3

    .line 264
    :cond_10
    invoke-virtual {v0}, Landroidx/transition/k;->x()Landroidx/transition/g;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    int-to-float v2, v13

    .line 269
    int-to-float v3, v7

    .line 270
    int-to-float v4, v14

    .line 271
    int-to-float v5, v8

    .line 272
    invoke-virtual {v1, v2, v3, v4, v5}, Landroidx/transition/g;->a(FFFF)Landroid/graphics/Path;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    sget-object v2, Landroidx/transition/b;->W:Landroid/util/Property;

    .line 277
    .line 278
    invoke-static {v10, v2, v1}, Landroidx/transition/f;->a(Ljava/lang/Object;Landroid/util/Property;Landroid/graphics/Path;)Landroid/animation/ObjectAnimator;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    goto/16 :goto_b

    .line 283
    .line 284
    :cond_11
    :goto_3
    invoke-virtual {v0}, Landroidx/transition/k;->x()Landroidx/transition/g;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    int-to-float v2, v15

    .line 289
    int-to-float v3, v11

    .line 290
    int-to-float v4, v9

    .line 291
    int-to-float v5, v12

    .line 292
    invoke-virtual {v1, v2, v3, v4, v5}, Landroidx/transition/g;->a(FFFF)Landroid/graphics/Path;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    sget-object v2, Landroidx/transition/b;->X:Landroid/util/Property;

    .line 297
    .line 298
    invoke-static {v10, v2, v1}, Landroidx/transition/f;->a(Ljava/lang/Object;Landroid/util/Property;Landroid/graphics/Path;)Landroid/animation/ObjectAnimator;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    goto/16 :goto_b

    .line 303
    .line 304
    :cond_12
    move/from16 v1, v18

    .line 305
    .line 306
    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    .line 307
    .line 308
    .line 309
    move-result v3

    .line 310
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 311
    .line 312
    .line 313
    move-result v17

    .line 314
    add-int/2addr v3, v15

    .line 315
    move-object/from16 p3, v2

    .line 316
    .line 317
    add-int v2, v11, v17

    .line 318
    .line 319
    invoke-static {v10, v15, v11, v3, v2}, Landroidx/transition/y;->d(Landroid/view/View;IIII)V

    .line 320
    .line 321
    .line 322
    if-ne v15, v9, :cond_14

    .line 323
    .line 324
    if-eq v11, v12, :cond_13

    .line 325
    .line 326
    goto :goto_4

    .line 327
    :cond_13
    move-object/from16 v2, p1

    .line 328
    .line 329
    move/from16 v18, v7

    .line 330
    .line 331
    move/from16 v22, v8

    .line 332
    .line 333
    move/from16 v19, v9

    .line 334
    .line 335
    goto :goto_5

    .line 336
    :cond_14
    :goto_4
    invoke-virtual {v0}, Landroidx/transition/k;->x()Landroidx/transition/g;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    int-to-float v3, v15

    .line 341
    move/from16 v18, v7

    .line 342
    .line 343
    int-to-float v7, v11

    .line 344
    move/from16 v22, v8

    .line 345
    .line 346
    int-to-float v8, v9

    .line 347
    move/from16 v19, v9

    .line 348
    .line 349
    int-to-float v9, v12

    .line 350
    invoke-virtual {v2, v3, v7, v8, v9}, Landroidx/transition/g;->a(FFFF)Landroid/graphics/Path;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    sget-object v3, Landroidx/transition/b;->Y:Landroid/util/Property;

    .line 355
    .line 356
    invoke-static {v10, v3, v2}, Landroidx/transition/f;->a(Ljava/lang/Object;Landroid/util/Property;Landroid/graphics/Path;)Landroid/animation/ObjectAnimator;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    :goto_5
    move/from16 v20, v12

    .line 361
    .line 362
    if-nez p2, :cond_15

    .line 363
    .line 364
    move/from16 v12, v23

    .line 365
    .line 366
    goto :goto_6

    .line 367
    :cond_15
    move/from16 v12, v16

    .line 368
    .line 369
    :goto_6
    if-eqz v12, :cond_16

    .line 370
    .line 371
    new-instance v3, Landroid/graphics/Rect;

    .line 372
    .line 373
    move/from16 v7, v16

    .line 374
    .line 375
    invoke-direct {v3, v7, v7, v6, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 376
    .line 377
    .line 378
    goto :goto_7

    .line 379
    :cond_16
    move/from16 v7, v16

    .line 380
    .line 381
    move-object/from16 v3, p2

    .line 382
    .line 383
    :goto_7
    move/from16 v21, v14

    .line 384
    .line 385
    if-nez p3, :cond_17

    .line 386
    .line 387
    move/from16 v14, v23

    .line 388
    .line 389
    goto :goto_8

    .line 390
    :cond_17
    move v14, v7

    .line 391
    :goto_8
    if-eqz v14, :cond_18

    .line 392
    .line 393
    new-instance v5, Landroid/graphics/Rect;

    .line 394
    .line 395
    invoke-direct {v5, v7, v7, v4, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 396
    .line 397
    .line 398
    goto :goto_9

    .line 399
    :cond_18
    move-object/from16 v5, p3

    .line 400
    .line 401
    :goto_9
    invoke-virtual {v3, v5}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    if-nez v1, :cond_19

    .line 406
    .line 407
    invoke-virtual {v10, v3}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    .line 408
    .line 409
    .line 410
    sget-object v1, Landroidx/transition/b;->Z:Landroidx/transition/i;

    .line 411
    .line 412
    filled-new-array {v3, v5}, [Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v4

    .line 416
    const-string v6, "clipBounds"

    .line 417
    .line 418
    invoke-static {v10, v6, v1, v4}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    .line 419
    .line 420
    .line 421
    move-result-object v6

    .line 422
    new-instance v9, Landroidx/transition/b$g;

    .line 423
    .line 424
    move/from16 v16, v11

    .line 425
    .line 426
    move/from16 v17, v13

    .line 427
    .line 428
    move-object v11, v3

    .line 429
    move-object v13, v5

    .line 430
    invoke-direct/range {v9 .. v22}, Landroidx/transition/b$g;-><init>(Landroid/view/View;Landroid/graphics/Rect;ZLandroid/graphics/Rect;ZIIIIIIII)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {v6, v9}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v0, v9}, Landroidx/transition/k;->a(Landroidx/transition/k$f;)Landroidx/transition/k;

    .line 437
    .line 438
    .line 439
    goto :goto_a

    .line 440
    :cond_19
    move-object/from16 v6, p1

    .line 441
    .line 442
    :goto_a
    invoke-static {v2, v6}, Landroidx/transition/u;->c(Landroid/animation/Animator;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 443
    .line 444
    .line 445
    move-result-object v1

    .line 446
    :goto_b
    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 447
    .line 448
    .line 449
    move-result-object v2

    .line 450
    instance-of v2, v2, Landroid/view/ViewGroup;

    .line 451
    .line 452
    if-eqz v2, :cond_1a

    .line 453
    .line 454
    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 455
    .line 456
    .line 457
    move-result-object v2

    .line 458
    check-cast v2, Landroid/view/ViewGroup;

    .line 459
    .line 460
    move/from16 v3, v23

    .line 461
    .line 462
    invoke-static {v2, v3}, Landroidx/transition/x;->a(Landroid/view/ViewGroup;Z)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v0}, Landroidx/transition/k;->z()Landroidx/transition/k;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    new-instance v3, Landroidx/transition/b$h;

    .line 470
    .line 471
    invoke-direct {v3, v2}, Landroidx/transition/b$h;-><init>(Landroid/view/ViewGroup;)V

    .line 472
    .line 473
    .line 474
    invoke-virtual {v0, v3}, Landroidx/transition/k;->a(Landroidx/transition/k$f;)Landroidx/transition/k;

    .line 475
    .line 476
    .line 477
    :cond_1a
    return-object v1

    .line 478
    :cond_1b
    :goto_c
    return-object p1
.end method
