.class public Lcom/android/launcher3/folder/x0;
.super Landroid/widget/ImageView;
.source "PreviewImageView.java"


# instance fields
.field private final g:Landroid/graphics/Rect;

.field private final h:Lcom/android/launcher3/dragndrop/DragLayer;

.field private i:Landroid/graphics/Bitmap;

.field private j:Landroid/graphics/Canvas;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/folder/x0;->g:Landroid/graphics/Rect;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/launcher3/folder/x0;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 16
    .line 17
    return-void
.end method

.method public static b(Landroid/content/Context;)Lcom/android/launcher3/folder/x0;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const v0, 0x7f0b0494

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getTag(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/folder/x0;

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/folder/x0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/android/launcher3/folder/x0;-><init>(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->setTag(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-object v1
.end method


# virtual methods
.method public a(Landroid/view/View;)Z
    .locals 5

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move-object v2, p1

    .line 7
    check-cast v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 8
    .line 9
    iget-object v3, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    iget-object v2, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    instance-of v2, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    instance-of v2, p1, Lcom/android/quickstep/views/CapsuleView;

    .line 36
    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    move v2, v1

    .line 49
    move v3, v2

    .line 50
    :goto_0
    if-lez v3, :cond_7

    .line 51
    .line 52
    if-gtz v2, :cond_3

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    iget-object v4, p0, Lcom/android/launcher3/folder/x0;->i:Landroid/graphics/Bitmap;

    .line 56
    .line 57
    if-eqz v4, :cond_4

    .line 58
    .line 59
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-ne v4, v3, :cond_4

    .line 64
    .line 65
    iget-object v4, p0, Lcom/android/launcher3/folder/x0;->i:Landroid/graphics/Bitmap;

    .line 66
    .line 67
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eq v4, v2, :cond_5

    .line 72
    .line 73
    :cond_4
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 74
    .line 75
    invoke-static {v3, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iput-object v2, p0, Lcom/android/launcher3/folder/x0;->i:Landroid/graphics/Bitmap;

    .line 80
    .line 81
    :cond_5
    new-instance v2, Landroid/graphics/Canvas;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/android/launcher3/folder/x0;->i:Landroid/graphics/Bitmap;

    .line 84
    .line 85
    invoke-direct {v2, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 86
    .line 87
    .line 88
    iput-object v2, p0, Lcom/android/launcher3/folder/x0;->j:Landroid/graphics/Canvas;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    move-object v0, p1

    .line 93
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 94
    .line 95
    iget-object v3, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 96
    .line 97
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLeft()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    neg-int v3, v3

    .line 102
    int-to-float v3, v3

    .line 103
    iget-object v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f0:Lcom/android/launcher3/CellLayout;

    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTop()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    neg-int v0, v0

    .line 110
    int-to-float v0, v0

    .line 111
    invoke-virtual {v2, v3, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/folder/x0;->j:Landroid/graphics/Canvas;

    .line 115
    .line 116
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 117
    .line 118
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Lcom/android/launcher3/folder/x0;->j:Landroid/graphics/Canvas;

    .line 122
    .line 123
    invoke-virtual {p1, p0}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 124
    .line 125
    .line 126
    const/4 p0, 0x1

    .line 127
    return p0

    .line 128
    :cond_7
    :goto_1
    return v1
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/x0;->i:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method
