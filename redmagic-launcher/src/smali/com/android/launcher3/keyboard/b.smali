.class public Lcom/android/launcher3/keyboard/b;
.super Lv1/a;
.source "ViewGroupFocusHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/keyboard/b$a;
    }
.end annotation


# static fields
.field private static final B:Landroid/graphics/Rect;


# instance fields
.field private final A:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/keyboard/b;->B:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv1/a;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/keyboard/b;->A:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method

.method private o(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v0, v0, Landroid/view/View;

    .line 9
    .line 10
    const-string v1, "ViewGroupFocusHelper"

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string p0, "computeLocationRelativeToContainer error"

    .line 15
    .line 16
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "computeLocationRelativeToContainer child:"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    int-to-float v0, v0

    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    add-float/2addr v0, v1

    .line 56
    float-to-int v0, v0

    .line 57
    iput v0, p2, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    iget v0, p2, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    int-to-float v0, v0

    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getY()F

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    add-float/2addr v0, v1

    .line 67
    float-to-int v0, v0

    .line 68
    iput v0, p2, Landroid/graphics/Rect;->top:I

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    instance-of v0, v0, Landroid/view/View;

    .line 81
    .line 82
    if-nez v0, :cond_2

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Landroid/view/View;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/android/launcher3/keyboard/b;->A:Landroid/view/View;

    .line 92
    .line 93
    if-eq v0, v1, :cond_4

    .line 94
    .line 95
    instance-of v1, v0, Lcom/android/launcher3/V4;

    .line 96
    .line 97
    if-eqz v1, :cond_3

    .line 98
    .line 99
    move-object v1, v0

    .line 100
    check-cast v1, Lcom/android/launcher3/V4;

    .line 101
    .line 102
    iget v2, p2, Landroid/graphics/Rect;->left:I

    .line 103
    .line 104
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-virtual {v1, p1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    sub-int/2addr v2, p1

    .line 113
    iput v2, p2, Landroid/graphics/Rect;->left:I

    .line 114
    .line 115
    :cond_3
    invoke-direct {p0, v0, p2}, Lcom/android/launcher3/keyboard/b;->o(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 116
    .line 117
    .line 118
    :cond_4
    :goto_0
    return-void
.end method

.method private p(Landroid/view/View;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    instance-of v1, v1, Landroid/view/View;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/V4;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    move-object v1, p1

    .line 18
    check-cast v1, Lcom/android/launcher3/V4;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->isPageInTransition()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move v1, v0

    .line 26
    :goto_0
    if-nez v1, :cond_3

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/view/View;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/android/launcher3/keyboard/b;->p(Landroid/view/View;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    return v0

    .line 42
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_4
    :goto_2
    return v0
.end method


# virtual methods
.method protected bridge synthetic l(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/b;->n(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic m(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/keyboard/b;->q(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected n(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-super {p0, p1}, Lv1/a;->n(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/keyboard/b;->p(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    invoke-super {p0, p1}, Lv1/a;->n(Landroid/view/View;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public q(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v0, Lcom/android/launcher3/keyboard/b;->B:Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->getFocusedRect(Landroid/graphics/Rect;)V

    .line 25
    .line 26
    .line 27
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    iput v2, p2, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    iput v2, p2, Landroid/graphics/Rect;->top:I

    .line 34
    .line 35
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/keyboard/b;->o(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    int-to-float p0, p0

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/high16 v3, 0x3f800000    # 1.0f

    .line 46
    .line 47
    sub-float v2, v3, v2

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    int-to-float v4, v4

    .line 54
    mul-float/2addr v2, v4

    .line 55
    div-float/2addr v2, v1

    .line 56
    add-float/2addr p0, v2

    .line 57
    float-to-int p0, p0

    .line 58
    iput p0, p2, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 61
    .line 62
    int-to-float p0, p0

    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    sub-float/2addr v3, v2

    .line 68
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    int-to-float v2, v2

    .line 73
    mul-float/2addr v3, v2

    .line 74
    div-float/2addr v3, v1

    .line 75
    add-float/2addr p0, v3

    .line 76
    float-to-int p0, p0

    .line 77
    iput p0, p2, Landroid/graphics/Rect;->top:I

    .line 78
    .line 79
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    int-to-float v2, v2

    .line 90
    mul-float/2addr v1, v2

    .line 91
    float-to-int v1, v1

    .line 92
    add-int/2addr p0, v1

    .line 93
    iput p0, p2, Landroid/graphics/Rect;->right:I

    .line 94
    .line 95
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    int-to-float v0, v0

    .line 106
    mul-float/2addr p1, v0

    .line 107
    float-to-int p1, p1

    .line 108
    add-int/2addr p0, p1

    .line 109
    iput p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 113
    iput v0, p2, Landroid/graphics/Rect;->left:I

    .line 114
    .line 115
    iput v0, p2, Landroid/graphics/Rect;->top:I

    .line 116
    .line 117
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/keyboard/b;->o(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    int-to-float p0, p0

    .line 125
    const v0, 0x3cf5c280    # 0.029999971f

    .line 126
    .line 127
    .line 128
    mul-float/2addr p0, v0

    .line 129
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    int-to-float v2, v2

    .line 134
    mul-float/2addr v0, v2

    .line 135
    iget v2, p2, Landroid/graphics/Rect;->left:I

    .line 136
    .line 137
    div-float v3, p0, v1

    .line 138
    .line 139
    float-to-int v3, v3

    .line 140
    sub-int/2addr v2, v3

    .line 141
    iput v2, p2, Landroid/graphics/Rect;->left:I

    .line 142
    .line 143
    iget v3, p2, Landroid/graphics/Rect;->top:I

    .line 144
    .line 145
    div-float v1, v0, v1

    .line 146
    .line 147
    float-to-int v1, v1

    .line 148
    sub-int/2addr v3, v1

    .line 149
    iput v3, p2, Landroid/graphics/Rect;->top:I

    .line 150
    .line 151
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    add-int/2addr v2, v1

    .line 156
    int-to-float v1, v2

    .line 157
    add-float/2addr v1, p0

    .line 158
    float-to-int p0, v1

    .line 159
    iput p0, p2, Landroid/graphics/Rect;->right:I

    .line 160
    .line 161
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 162
    .line 163
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    add-int/2addr p0, p1

    .line 168
    int-to-float p0, p0

    .line 169
    add-float/2addr p0, v0

    .line 170
    float-to-int p0, p0

    .line 171
    iput p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 172
    .line 173
    return-void
.end method
