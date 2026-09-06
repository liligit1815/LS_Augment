.class Ln1/d$a;
.super Ljava/lang/Object;
.source "DragPreviewProvider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ln1/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private final g:Landroid/graphics/Bitmap;

.field private final h:Landroid/content/Context;

.field private final i:Z

.field private final j:Z

.field final synthetic k:Ln1/d;


# direct methods
.method constructor <init>(Ln1/d;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ln1/d$a;->k:Ln1/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ln1/d$a;->g:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    iget-object p2, p1, Ln1/d;->b:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ln1/d$a;->h:Landroid/content/Context;

    .line 15
    .line 16
    iget-object p1, p1, Ln1/d;->b:Landroid/view/View;

    .line 17
    .line 18
    instance-of p2, p1, Lcom/android/launcher3/BubbleTextView;

    .line 19
    .line 20
    iput-boolean p2, p0, Ln1/d$a;->i:Z

    .line 21
    .line 22
    instance-of p2, p1, Lcom/android/launcher3/widget/T;

    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    instance-of p1, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p1, 0x0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 34
    :goto_1
    iput-boolean p1, p0, Ln1/d$a;->j:Z

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ln1/d$a;->k:Ln1/d;

    .line 2
    .line 3
    iget-object v1, p0, Ln1/d$a;->g:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ln1/d;->e(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "DragPreviewProvider"

    .line 12
    .line 13
    const-string v0, "OutlineGeneratorCallback run: preview is null."

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-boolean v1, p0, Ln1/d$a;->i:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ln1/d$a;->k:Ln1/d;

    .line 24
    .line 25
    invoke-static {v1}, Ln1/d;->d(Ln1/d;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Ln1/d$a;->h:Landroid/content/Context;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 38
    .line 39
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget v1, v1, Lcom/android/launcher3/h0;->B1:I

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-static {v0, v1, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_1
    new-instance v1, Landroid/graphics/Canvas;

    .line 51
    .line 52
    invoke-direct {v1}, Landroid/graphics/Canvas;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Ln1/d$a;->h:Landroid/content/Context;

    .line 59
    .line 60
    invoke-static {v2}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getForeColor()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    iget-object v3, p0, Ln1/d$a;->h:Landroid/content/Context;

    .line 69
    .line 70
    const/high16 v4, -0x1000000

    .line 71
    .line 72
    if-eq v2, v4, :cond_3

    .line 73
    .line 74
    const/high16 v4, -0x5a000000

    .line 75
    .line 76
    if-ne v2, v4, :cond_2

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const v2, 0x7f0601d0

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    :goto_0
    const v2, 0x7f0601d1

    .line 84
    .line 85
    .line 86
    :goto_1
    invoke-static {v3, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    iget-boolean v3, p0, Ln1/d$a;->j:Z

    .line 91
    .line 92
    if-eqz v3, :cond_4

    .line 93
    .line 94
    new-instance v3, Landroid/graphics/RectF;

    .line 95
    .line 96
    iget-object v4, p0, Ln1/d$a;->k:Ln1/d;

    .line 97
    .line 98
    iget-object v4, v4, Ln1/d;->b:Landroid/view/View;

    .line 99
    .line 100
    invoke-virtual {v4}, Landroid/view/View;->getPaddingLeft()I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    int-to-float v4, v4

    .line 105
    iget-object v5, p0, Ln1/d$a;->k:Ln1/d;

    .line 106
    .line 107
    iget-object v5, v5, Ln1/d;->b:Landroid/view/View;

    .line 108
    .line 109
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    int-to-float v5, v5

    .line 114
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    iget-object v7, p0, Ln1/d$a;->k:Ln1/d;

    .line 119
    .line 120
    iget-object v7, v7, Ln1/d;->b:Landroid/view/View;

    .line 121
    .line 122
    invoke-virtual {v7}, Landroid/view/View;->getPaddingRight()I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    sub-int/2addr v6, v7

    .line 127
    int-to-float v6, v6

    .line 128
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    iget-object v8, p0, Ln1/d$a;->k:Ln1/d;

    .line 133
    .line 134
    iget-object v8, v8, Ln1/d;->b:Landroid/view/View;

    .line 135
    .line 136
    invoke-virtual {v8}, Landroid/view/View;->getPaddingBottom()I

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    sub-int/2addr v7, v8

    .line 141
    int-to-float v7, v7

    .line 142
    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 143
    .line 144
    .line 145
    const/4 v4, 0x0

    .line 146
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 147
    .line 148
    invoke-virtual {v1, v4, v5}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 149
    .line 150
    .line 151
    new-instance v4, Landroid/graphics/Paint;

    .line 152
    .line 153
    const/4 v5, 0x3

    .line 154
    invoke-direct {v4, v5}, Landroid/graphics/Paint;-><init>(I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 158
    .line 159
    .line 160
    iget-object v2, p0, Ln1/d$a;->h:Landroid/content/Context;

    .line 161
    .line 162
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    const v5, 0x7f0702c4

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    invoke-virtual {v1, v3, v2, v2, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_4
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 178
    .line 179
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 180
    .line 181
    .line 182
    :goto_2
    iget-object p0, p0, Ln1/d$a;->k:Ln1/d;

    .line 183
    .line 184
    iput-object v0, p0, Ln1/d;->e:Landroid/graphics/Bitmap;

    .line 185
    .line 186
    return-void
.end method
