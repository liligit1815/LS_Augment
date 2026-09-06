.class public Lcom/android/launcher3/dragndrop/E;
.super Landroid/graphics/drawable/AdaptiveIconDrawable;
.source "FolderAdaptiveIcon.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/dragndrop/E$b;,
        Lcom/android/launcher3/dragndrop/E$a;
    }
.end annotation


# static fields
.field private static final j:Landroid/graphics/Rect;


# instance fields
.field private final g:Landroid/graphics/drawable/Drawable;

.field private final h:Landroid/graphics/Path;

.field private final i:Landroid/graphics/drawable/Drawable$ConstantState;


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
    sput-object v0, Lcom/android/launcher3/dragndrop/E;->j:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/Path;)V
    .locals 1

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3
    iput-object p3, p0, Lcom/android/launcher3/dragndrop/E;->g:Landroid/graphics/drawable/Drawable;

    .line 4
    iput-object p4, p0, Lcom/android/launcher3/dragndrop/E;->h:Landroid/graphics/Path;

    .line 5
    new-instance v0, Lcom/android/launcher3/dragndrop/E$b;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p2

    .line 6
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p3

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/android/launcher3/dragndrop/E$b;-><init>(Landroid/graphics/drawable/Drawable$ConstantState;Landroid/graphics/drawable/Drawable$ConstantState;Landroid/graphics/drawable/Drawable$ConstantState;Landroid/graphics/Path;)V

    iput-object v0, p0, Lcom/android/launcher3/dragndrop/E;->i:Landroid/graphics/drawable/Drawable$ConstantState;

    return-void
.end method

.method synthetic constructor <init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/Path;Lcom/android/launcher3/dragndrop/F;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/dragndrop/E;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/Path;)V

    return-void
.end method

.method public static synthetic a(Landroid/graphics/Bitmap;FLandroid/graphics/Paint;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    neg-float p1, p1

    .line 2
    invoke-virtual {p3, p0, p1, p1, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Landroid/graphics/Picture;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawPicture(Landroid/graphics/Picture;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Landroid/graphics/Picture;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/graphics/Canvas;->drawPicture(Landroid/graphics/Picture;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/views/k;IILandroid/graphics/Canvas;Landroid/graphics/Canvas;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/launcher3/views/k;->findFolderIcon(I)Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p2, p3, p4, p5}, Lcom/android/launcher3/dragndrop/E;->g(Lcom/android/launcher3/folder/FolderIcon;ILandroid/graphics/Canvas;Landroid/graphics/Canvas;Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 12
    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string p3, "Folder not found with id: "

    .line 19
    .line 20
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0
.end method

.method public static e(Lcom/android/launcher3/views/k;ILandroid/graphics/Point;)Lcom/android/launcher3/dragndrop/E;
    .locals 18

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/util/U1;->a()V

    .line 4
    .line 5
    .line 6
    iget v3, v0, Landroid/graphics/Point;->x:I

    .line 7
    .line 8
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 9
    .line 10
    const/4 v7, 0x0

    .line 11
    if-eq v3, v0, :cond_0

    .line 12
    .line 13
    return-object v7

    .line 14
    :cond_0
    invoke-interface/range {p0 .. p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget v0, v0, Lcom/android/launcher3/h0;->Q1:I

    .line 19
    .line 20
    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sub-int v1, v0, v3

    .line 25
    .line 26
    int-to-float v8, v1

    .line 27
    new-instance v9, Landroid/graphics/Picture;

    .line 28
    .line 29
    invoke-direct {v9}, Landroid/graphics/Picture;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v10, Landroid/graphics/Picture;

    .line 33
    .line 34
    invoke-direct {v10}, Landroid/graphics/Picture;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v11, Landroid/graphics/Picture;

    .line 38
    .line 39
    invoke-direct {v11}, Landroid/graphics/Picture;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v9, v3, v3}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v11, v3, v3}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-virtual {v10, v0, v0}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v5, v8, v8}, Landroid/graphics/Canvas;->translate(FF)V

    .line 55
    .line 56
    .line 57
    new-instance v12, Landroid/graphics/Path;

    .line 58
    .line 59
    invoke-direct {v12}, Landroid/graphics/Path;-><init>()V

    .line 60
    .line 61
    .line 62
    neg-float v13, v8

    .line 63
    int-to-float v0, v3

    .line 64
    add-float v15, v0, v8

    .line 65
    .line 66
    sget-object v17, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 67
    .line 68
    move v14, v13

    .line 69
    move/from16 v16, v15

    .line 70
    .line 71
    invoke-virtual/range {v12 .. v17}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 72
    .line 73
    .line 74
    :try_start_0
    sget-object v13, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 75
    .line 76
    new-instance v0, Lcom/android/launcher3/dragndrop/A;

    .line 77
    .line 78
    move-object/from16 v1, p0

    .line 79
    .line 80
    move/from16 v2, p1

    .line 81
    .line 82
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/dragndrop/A;-><init>(Lcom/android/launcher3/views/k;IILandroid/graphics/Canvas;Landroid/graphics/Canvas;Landroid/graphics/Canvas;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v13, v0}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    .line 92
    invoke-virtual {v9}, Landroid/graphics/Picture;->endRecording()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v10}, Landroid/graphics/Picture;->endRecording()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v11}, Landroid/graphics/Picture;->endRecording()V

    .line 99
    .line 100
    .line 101
    invoke-static {v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Picture;)Landroid/graphics/Bitmap;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Landroid/graphics/Paint;

    .line 106
    .line 107
    const/4 v2, 0x1

    .line 108
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 109
    .line 110
    .line 111
    new-instance v2, Lcom/android/launcher3/dragndrop/E;

    .line 112
    .line 113
    new-instance v3, Lcom/android/launcher3/dragndrop/E$a;

    .line 114
    .line 115
    new-instance v4, Lcom/android/launcher3/dragndrop/B;

    .line 116
    .line 117
    invoke-direct {v4, v9}, Lcom/android/launcher3/dragndrop/B;-><init>(Landroid/graphics/Picture;)V

    .line 118
    .line 119
    .line 120
    invoke-direct {v3, v4}, Lcom/android/launcher3/dragndrop/E$a;-><init>(Ls1/e;)V

    .line 121
    .line 122
    .line 123
    new-instance v4, Lcom/android/launcher3/dragndrop/E$a;

    .line 124
    .line 125
    new-instance v5, Lcom/android/launcher3/dragndrop/C;

    .line 126
    .line 127
    invoke-direct {v5, v0, v8, v1}, Lcom/android/launcher3/dragndrop/C;-><init>(Landroid/graphics/Bitmap;FLandroid/graphics/Paint;)V

    .line 128
    .line 129
    .line 130
    invoke-direct {v4, v5}, Lcom/android/launcher3/dragndrop/E$a;-><init>(Ls1/e;)V

    .line 131
    .line 132
    .line 133
    new-instance v0, Lcom/android/launcher3/dragndrop/E$a;

    .line 134
    .line 135
    new-instance v1, Lcom/android/launcher3/dragndrop/D;

    .line 136
    .line 137
    invoke-direct {v1, v11}, Lcom/android/launcher3/dragndrop/D;-><init>(Landroid/graphics/Picture;)V

    .line 138
    .line 139
    .line 140
    invoke-direct {v0, v1}, Lcom/android/launcher3/dragndrop/E$a;-><init>(Ls1/e;)V

    .line 141
    .line 142
    .line 143
    invoke-direct {v2, v3, v4, v0, v12}, Lcom/android/launcher3/dragndrop/E;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/Path;)V

    .line 144
    .line 145
    .line 146
    return-object v2

    .line 147
    :catchall_0
    move-exception v0

    .line 148
    goto :goto_0

    .line 149
    :catch_0
    move-exception v0

    .line 150
    :try_start_1
    const-string v1, "FolderAdaptiveIcon"

    .line 151
    .line 152
    const-string v2, "Unable to create folder icon"

    .line 153
    .line 154
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 155
    .line 156
    .line 157
    invoke-virtual {v9}, Landroid/graphics/Picture;->endRecording()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v10}, Landroid/graphics/Picture;->endRecording()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v11}, Landroid/graphics/Picture;->endRecording()V

    .line 164
    .line 165
    .line 166
    return-object v7

    .line 167
    :goto_0
    invoke-virtual {v9}, Landroid/graphics/Picture;->endRecording()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v10}, Landroid/graphics/Picture;->endRecording()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v11}, Landroid/graphics/Picture;->endRecording()V

    .line 174
    .line 175
    .line 176
    throw v0
.end method

.method private static g(Lcom/android/launcher3/folder/FolderIcon;ILandroid/graphics/Canvas;Landroid/graphics/Canvas;Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/dragndrop/E;->j:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->C(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sub-int/2addr p1, v1

    .line 11
    div-int/lit8 p1, p1, 0x2

    .line 12
    .line 13
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    neg-int v1, v1

    .line 16
    add-int/2addr v1, p1

    .line 17
    int-to-float v1, v1

    .line 18
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 19
    .line 20
    neg-int v0, v0

    .line 21
    add-int/2addr v0, p1

    .line 22
    int-to-float p1, v0

    .line 23
    invoke-virtual {p4}, Landroid/graphics/Canvas;->save()I

    .line 24
    .line 25
    .line 26
    invoke-virtual {p4, v1, p1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p4}, Lcom/android/launcher3/folder/FolderIcon;->w(Landroid/graphics/Canvas;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p4}, Landroid/graphics/Canvas;->restore()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3}, Landroid/graphics/Canvas;->save()I

    .line 36
    .line 37
    .line 38
    invoke-virtual {p3, v1, p1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getPreviewItemManager()Lcom/android/launcher3/folder/A0;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    invoke-virtual {p4, p3}, Lcom/android/launcher3/folder/A0;->k(Landroid/graphics/Canvas;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p3}, Landroid/graphics/Canvas;->restore()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v1, p1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolderBackground()Lcom/android/launcher3/folder/u0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/u0;->q0(Landroid/graphics/Canvas;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public f()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/E;->g:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/E;->i:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconMask()Landroid/graphics/Path;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/E;->h:Landroid/graphics/Path;

    .line 2
    .line 3
    return-object p0
.end method
