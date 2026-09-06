.class Lcom/android/launcher3/resource/K$e;
.super Ljava/lang/Object;
.source "MenuResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/K;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "e"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Landroid/graphics/drawable/Drawable;

.field private f:I

.field private g:J


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method private S(II)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    const/4 p0, 0x0

    .line 2
    const-string v0, "R-Loader"

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-string p1, " zoomImg resId is 0 !"

    .line 7
    .line 8
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/resource/o0;->g()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :try_start_0
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    .line 21
    .line 22
    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 27
    .line 28
    invoke-static {v1, p1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 29
    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    iput-boolean v4, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 33
    .line 34
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 35
    .line 36
    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 37
    .line 38
    div-int/2addr v5, p2

    .line 39
    iput v5, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 40
    .line 41
    new-instance v5, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v6, " zoomImg is "

    .line 47
    .line 48
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 52
    .line 53
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v6, " opt.inSampleSize "

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 62
    .line 63
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 74
    .line 75
    const/4 v6, 0x2

    .line 76
    if-ge v5, v6, :cond_1

    .line 77
    .line 78
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 79
    .line 80
    invoke-static {v1, p1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1, p2, v4}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :catch_0
    move-exception p1

    .line 90
    goto :goto_0

    .line 91
    :cond_1
    invoke-static {v1, p1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eq v1, p2, :cond_2

    .line 102
    .line 103
    invoke-static {p1, p2, v3}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    return-object p0

    .line 108
    :cond_2
    return-object p1

    .line 109
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v1, " zoomImg exception!"

    .line 115
    .line 116
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    return-object p0
.end method

.method private T(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "R-Loader"

    .line 7
    .line 8
    if-nez p0, :cond_3

    .line 9
    .line 10
    const-string p0, "../"

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_1

    .line 19
    .line 20
    :cond_0
    :try_start_0
    new-instance p0, Landroid/graphics/BitmapFactory$Options;

    .line 21
    .line 22
    invoke-direct {p0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    iput-boolean v2, p0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 27
    .line 28
    invoke-static {p1, p0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    iput-boolean v3, p0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 33
    .line 34
    iput-boolean v2, p0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 35
    .line 36
    iget v4, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 37
    .line 38
    div-int/2addr v4, p2

    .line 39
    iput v4, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 40
    .line 41
    const/4 v5, 0x2

    .line 42
    if-ge v4, v5, :cond_1

    .line 43
    .line 44
    iput v2, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 45
    .line 46
    invoke-static {p1, p0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0, p2, v3}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :catch_0
    move-exception p0

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v4, " zoomImg is "

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget v4, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v4, " "

    .line 73
    .line 74
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget v4, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 78
    .line 79
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v4, " opt.inSampleSize "

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget v4, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 88
    .line 89
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    invoke-static {p1, p0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    if-eqz p0, :cond_2

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eq p1, p2, :cond_2

    .line 110
    .line 111
    invoke-static {p0, p2, v2}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 112
    .line 113
    .line 114
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    :cond_2
    return-object p0

    .line 116
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string p2, " zoomImg exception!"

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_3
    :goto_1
    const-string p0, " zoomImg file not exist !"

    .line 142
    .line 143
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    return-object v0
.end method

.method private U([BI)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    const-string v0, "R-Loader"

    .line 3
    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    array-length v1, p1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    :try_start_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 18
    .line 19
    array-length v3, p1

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-static {p1, v4, v3, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 22
    .line 23
    .line 24
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 25
    .line 26
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 27
    .line 28
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 29
    .line 30
    div-int v5, v3, p2

    .line 31
    .line 32
    iput v5, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-virtual {v5}, Lcom/android/launcher3/resource/o0;->i()Lcom/android/launcher3/resource/o0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-virtual {v5}, Lcom/android/launcher3/resource/o0$a;->b()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-ge v3, v5, :cond_1

    .line 47
    .line 48
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Lcom/android/launcher3/resource/o0;->i()Lcom/android/launcher3/resource/o0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Lcom/android/launcher3/resource/o0$a;->b()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    div-int/2addr v3, p2

    .line 61
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 62
    .line 63
    mul-int/2addr v5, v5

    .line 64
    div-int/2addr v5, v3

    .line 65
    iput v5, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception p1

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v5, " zoomImg is "

    .line 76
    .line 77
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 81
    .line 82
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v5, " opt.inSampleSize "

    .line 86
    .line 87
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 91
    .line 92
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 103
    .line 104
    const/4 v5, 0x2

    .line 105
    if-ge v3, v5, :cond_2

    .line 106
    .line 107
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 108
    .line 109
    array-length v2, p1

    .line 110
    invoke-static {p1, v4, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-static {p1, p2, v4}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_2
    array-length v3, p1

    .line 120
    invoke-static {p1, v4, v3, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    if-eqz p1, :cond_3

    .line 125
    .line 126
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eq v1, p2, :cond_3

    .line 131
    .line 132
    invoke-static {p1, p2, v2}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 133
    .line 134
    .line 135
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    return-object p0

    .line 137
    :cond_3
    return-object p1

    .line 138
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v1, " zoomImg exception!"

    .line 144
    .line 145
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    return-object p0

    .line 163
    :cond_4
    :goto_2
    const-string p1, " zoomImg byte data is 0 !"

    .line 164
    .line 165
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    return-object p0
.end method

.method static bridge synthetic a(Lcom/android/launcher3/resource/K$e;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/resource/K$e;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$e;->f:I

    .line 2
    .line 3
    return p0
.end method

.method private c(IILandroid/graphics/Bitmap;)I
    .locals 12

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p3, :cond_3

    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    move v2, p0

    .line 14
    move v3, v2

    .line 15
    :goto_0
    if-ge v2, p1, :cond_2

    .line 16
    .line 17
    move v4, p0

    .line 18
    :goto_1
    if-ge v4, p2, :cond_1

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    invoke-virtual {p3, v2, v4}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    const-wide v8, 0x3fd322d0e5604189L    # 0.299

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    int-to-double v10, v6

    .line 44
    mul-double/2addr v10, v8

    .line 45
    add-double/2addr v0, v10

    .line 46
    const-wide v8, 0x3fe2c8b439581062L    # 0.587

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    int-to-double v6, v7

    .line 52
    mul-double/2addr v6, v8

    .line 53
    add-double/2addr v0, v6

    .line 54
    const-wide v6, 0x3fbd2f1a9fbe76c9L    # 0.114

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    int-to-double v8, v5

    .line 60
    mul-double/2addr v8, v6

    .line 61
    add-double/2addr v0, v8

    .line 62
    add-int/lit8 v4, v4, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    if-eqz v3, :cond_3

    .line 69
    .line 70
    int-to-double p0, v3

    .line 71
    div-double/2addr v0, p0

    .line 72
    double-to-int p0, v0

    .line 73
    :cond_3
    :goto_2
    return p0
.end method

.method private g(Landroid/graphics/Bitmap;)I
    .locals 6

    .line 1
    const/4 p0, -0x1

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-static {p1}, Lb0/b;->b(Landroid/graphics/Bitmap;)Lb0/b$b;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lb0/b$b;->a()Lb0/b;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lb0/b;->h()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    move v0, p1

    .line 35
    move v1, v0

    .line 36
    move v2, v1

    .line 37
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lb0/b$d;

    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    invoke-virtual {v3}, Lb0/b$d;->e()I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-virtual {v3}, Lb0/b$d;->e()I

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    invoke-virtual {v3}, Lb0/b$d;->e()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    add-int/2addr p1, v4

    .line 76
    add-int/2addr v1, v5

    .line 77
    add-int/2addr v2, v3

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    div-int/2addr p1, v0

    .line 80
    div-int/2addr v1, v0

    .line 81
    div-int/2addr v2, v0

    .line 82
    invoke-static {p1, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    :cond_2
    :goto_1
    return p0
.end method

.method private h(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1b
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Landroid/app/WallpaperColors;->fromBitmap(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method private i(Landroid/graphics/Bitmap;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/K$e;->s(Landroid/graphics/Bitmap;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0xbe

    .line 6
    .line 7
    if-lt p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/high16 p0, -0x1000000

    .line 12
    .line 13
    return p0
.end method

.method private s(Landroid/graphics/Bitmap;)I
    .locals 5

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-double v1, v1

    .line 19
    const-wide v3, 0x3fb999999999999aL    # 0.1

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    mul-double/2addr v1, v3

    .line 25
    double-to-int v1, v1

    .line 26
    invoke-direct {p0, v0, v1, p1}, Lcom/android/launcher3/resource/K$e;->c(IILandroid/graphics/Bitmap;)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private t()I
    .locals 0

    .line 1
    const/16 p0, 0x5a

    .line 2
    .line 3
    return p0
.end method

.method private v(Landroid/graphics/Bitmap;)I
    .locals 14

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    move v4, p0

    .line 22
    move v5, v4

    .line 23
    :goto_0
    if-ge v4, v0, :cond_2

    .line 24
    .line 25
    move v6, p0

    .line 26
    :goto_1
    if-ge v6, v1, :cond_1

    .line 27
    .line 28
    add-int/lit8 v5, v5, 0x1

    .line 29
    .line 30
    invoke-virtual {p1, v4, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    invoke-static {v7}, Landroid/graphics/Color;->red(I)I

    .line 35
    .line 36
    .line 37
    move-result v8

    .line 38
    invoke-static {v7}, Landroid/graphics/Color;->green(I)I

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    invoke-static {v7}, Landroid/graphics/Color;->blue(I)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    const-wide v10, 0x3fd322d0e5604189L    # 0.299

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    int-to-double v12, v8

    .line 52
    mul-double/2addr v12, v10

    .line 53
    add-double/2addr v2, v12

    .line 54
    const-wide v10, 0x3fe2c8b439581062L    # 0.587

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    int-to-double v8, v9

    .line 60
    mul-double/2addr v8, v10

    .line 61
    add-double/2addr v2, v8

    .line 62
    const-wide v8, 0x3fbd2f1a9fbe76c9L    # 0.114

    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    int-to-double v10, v7

    .line 68
    mul-double/2addr v10, v8

    .line 69
    add-double/2addr v2, v10

    .line 70
    add-int/lit8 v6, v6, 0x1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    if-eqz v5, :cond_3

    .line 77
    .line 78
    int-to-double p0, v5

    .line 79
    div-double/2addr v2, p0

    .line 80
    double-to-int p0, v2

    .line 81
    :cond_3
    :goto_2
    return p0
.end method

.method private w(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;->t()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p1, p0, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :try_start_0
    instance-of v2, p0, Lcom/android/launcher3/resource/K$f;

    .line 23
    .line 24
    if-eqz v2, :cond_b

    .line 25
    .line 26
    move-object v2, p0

    .line 27
    check-cast v2, Lcom/android/launcher3/resource/K$f;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-ne v3, v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;->t()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-direct {p0, v1, v3}, Lcom/android/launcher3/resource/K$e;->T(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    goto/16 :goto_4

    .line 48
    .line 49
    :catch_0
    move-exception p0

    .line 50
    goto/16 :goto_6

    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v3, -0x1

    .line 57
    if-ne v1, v3, :cond_5

    .line 58
    .line 59
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lcom/android/launcher3/resource/o0;->J()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const-string v3, "wallpaper/wallpaper169.jpg"

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/android/launcher3/resource/K;->k(Ljava/lang/String;Ljava/lang/String;)[B

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    move-object v1, p1

    .line 81
    :goto_0
    if-eqz v1, :cond_3

    .line 82
    .line 83
    array-length v3, v1

    .line 84
    if-nez v3, :cond_4

    .line 85
    .line 86
    :cond_3
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const-string v3, "wallpaper/wallpaper1.jpg"

    .line 91
    .line 92
    invoke-static {v1, v3}, Lcom/android/launcher3/resource/K;->k(Ljava/lang/String;Ljava/lang/String;)[B

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    :cond_4
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;->t()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-direct {p0, v1, v3}, Lcom/android/launcher3/resource/K$e;->U([BI)Landroid/graphics/Bitmap;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    goto/16 :goto_4

    .line 105
    .line 106
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    const/4 v3, 0x2

    .line 111
    if-ne v1, v3, :cond_7

    .line 112
    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v3, " alive only restore data"

    .line 126
    .line 127
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .line 136
    .line 137
    :try_start_1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->o()Landroid/database/Cursor;

    .line 138
    .line 139
    .line 140
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 141
    if-eqz v1, :cond_6

    .line 142
    .line 143
    :try_start_2
    invoke-virtual {p0, v1}, Lcom/android/launcher3/resource/K$e;->A(Landroid/database/Cursor;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :catchall_0
    move-exception p0

    .line 148
    goto :goto_2

    .line 149
    :cond_6
    :goto_1
    :try_start_3
    invoke-static {v1}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 150
    .line 151
    .line 152
    move-object p0, p1

    .line 153
    goto :goto_4

    .line 154
    :catchall_1
    move-exception p0

    .line 155
    move-object v1, p1

    .line 156
    :goto_2
    invoke-static {v1}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 157
    .line 158
    .line 159
    throw p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 160
    :cond_7
    :try_start_4
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 168
    goto :goto_3

    .line 169
    :catch_1
    :try_start_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .line 173
    .line 174
    const-string v3, " preset wallpaper need get from sys "

    .line 175
    .line 176
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    const/4 v1, 0x0

    .line 194
    :goto_3
    if-lez v1, :cond_8

    .line 195
    .line 196
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;->t()I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    invoke-direct {p0, v1, v3}, Lcom/android/launcher3/resource/K$e;->S(II)Landroid/graphics/Bitmap;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    goto :goto_4

    .line 205
    :cond_8
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->c0()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-static {v1}, Lcom/android/launcher3/resource/p0;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;->t()I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    invoke-direct {p0, v1, v3}, Lcom/android/launcher3/resource/K$e;->T(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    .line 218
    .line 219
    .line 220
    move-result-object p0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 221
    :goto_4
    if-eqz p0, :cond_a

    .line 222
    .line 223
    :try_start_6
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_9

    .line 228
    .line 229
    goto :goto_5

    .line 230
    :cond_9
    move-object p1, p0

    .line 231
    goto :goto_7

    .line 232
    :catch_2
    move-exception p1

    .line 233
    move-object v4, p1

    .line 234
    move-object p1, p0

    .line 235
    move-object p0, v4

    .line 236
    goto :goto_6

    .line 237
    :cond_a
    :goto_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    const-string v2, " res id is not exist!"

    .line 250
    .line 251
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 259
    .line 260
    .line 261
    return-object p1

    .line 262
    :goto_6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 263
    .line 264
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 265
    .line 266
    .line 267
    const-string v2, "getZoomedBitmap getWallpaperResource exception : "

    .line 268
    .line 269
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    :cond_b
    :goto_7
    return-object p1
.end method

.method private x()[I
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p0, "initWallpaperInfo: item id is null."

    .line 9
    .line 10
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    filled-new-array {v2, v2, v2, v2}, [I

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const-string p0, "initWallpaperInfo--getResourceProvider() == null"

    .line 25
    .line 26
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    filled-new-array {v2, v2, v2, v2}, [I

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    sget-object v4, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 41
    .line 42
    filled-new-array {p0}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    const/4 v8, 0x0

    .line 47
    const/4 v5, 0x0

    .line 48
    const-string v6, "itemId=?"

    .line 49
    .line 50
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-nez p0, :cond_2

    .line 55
    .line 56
    filled-new-array {v2, v2, v2, v2}, [I

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_2
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_3

    .line 66
    .line 67
    filled-new-array {v2, v2, v2, v2}, [I

    .line 68
    .line 69
    .line 70
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    invoke-static {p0}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 72
    .line 73
    .line 74
    return-object v0

    .line 75
    :catchall_0
    move-exception v0

    .line 76
    goto/16 :goto_5

    .line 77
    .line 78
    :catch_0
    move-exception v0

    .line 79
    goto :goto_4

    .line 80
    :cond_3
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 81
    .line 82
    .line 83
    const-string v0, "finger"

    .line 84
    .line 85
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    const/4 v4, 0x1

    .line 98
    if-nez v3, :cond_4

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    const/16 v3, 0x90

    .line 105
    .line 106
    if-ne v0, v3, :cond_4

    .line 107
    .line 108
    move v0, v4

    .line 109
    goto :goto_0

    .line 110
    :cond_4
    move v0, v2

    .line 111
    :goto_0
    const-string v3, "foreColor"

    .line 112
    .line 113
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    if-nez v3, :cond_5

    .line 122
    .line 123
    move v3, v4

    .line 124
    goto :goto_1

    .line 125
    :cond_5
    move v3, v2

    .line 126
    :goto_1
    const-string v5, "statusForeColor"

    .line 127
    .line 128
    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    invoke-interface {p0, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    if-nez v5, :cond_6

    .line 137
    .line 138
    move v5, v4

    .line 139
    goto :goto_2

    .line 140
    :cond_6
    move v5, v2

    .line 141
    :goto_2
    const-string v6, "mainColor"

    .line 142
    .line 143
    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    invoke-interface {p0, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    if-nez v6, :cond_7

    .line 152
    .line 153
    move v6, v4

    .line 154
    goto :goto_3

    .line 155
    :cond_7
    move v6, v2

    .line 156
    :goto_3
    xor-int/2addr v3, v4

    .line 157
    xor-int/2addr v5, v4

    .line 158
    xor-int/2addr v4, v6

    .line 159
    filled-new-array {v0, v3, v5, v4}, [I

    .line 160
    .line 161
    .line 162
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 163
    invoke-static {p0}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 164
    .line 165
    .line 166
    return-object v0

    .line 167
    :goto_4
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .line 171
    .line 172
    const-string v4, "initWallpaperInfo Exception occor !!"

    .line 173
    .line 174
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 189
    .line 190
    .line 191
    invoke-static {p0}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 192
    .line 193
    .line 194
    filled-new-array {v2, v2, v2, v2}, [I

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    return-object p0

    .line 199
    :goto_5
    invoke-static {p0}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 200
    .line 201
    .line 202
    throw v0
.end method

.method private y([I)Z
    .locals 3

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, v0

    .line 4
    :goto_0
    if-ge v1, p0, :cond_1

    .line 5
    .line 6
    aget v2, p1, v1

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    return v0
.end method

.method private z([I)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "["

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 9
    .line 10
    .line 11
    array-length v1, p1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_0

    .line 14
    .line 15
    aget v3, p1, v2

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 18
    .line 19
    .line 20
    const-string v3, "-"

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 23
    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 33
    .line 34
    .line 35
    const-string p0, "]"

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method


# virtual methods
.method A(Landroid/database/Cursor;)V
    .locals 1

    .line 1
    const-string v0, "itemId"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "itemType"

    .line 14
    .line 15
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/android/launcher3/resource/K$e;->b:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "srcType"

    .line 26
    .line 27
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Lcom/android/launcher3/resource/K$e;->f:I

    .line 36
    .line 37
    return-void
.end method

.method B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$e;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method C(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$e;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-void
.end method

.method D(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/launcher3/resource/K$e;->g:J

    .line 2
    .line 3
    return-void
.end method

.method E(I)V
    .locals 0

    .line 1
    return-void
.end method

.method F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method G(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$e;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method H(I)V
    .locals 0

    .line 1
    return-void
.end method

.method I(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/resource/K$e;->f:I

    .line 2
    .line 3
    return-void
.end method

.method J(I)V
    .locals 0

    .line 1
    return-void
.end method

.method K(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/K$e;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method L([I)V
    .locals 0

    .line 1
    return-void
.end method

.method M(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method N([B)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/resource/K$e;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "R-Loader"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "updateItemBackground: item id is null."

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v2, Landroid/content/ContentValues;

    .line 16
    .line 17
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v3, "background"

    .line 21
    .line 22
    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    sget-object v4, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 30
    .line 31
    filled-new-array {v0}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v5, "itemId=?"

    .line 36
    .line 37
    invoke-virtual {v3, v4, v2, v5, v0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-static {p1}, Lx1/O;->s([B)Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/K$e;->C(Landroid/graphics/drawable/Drawable;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string p1, " updateItemBackground res  :"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method O(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "R-Loader"

    .line 6
    .line 7
    const-string p1, "updateItemForeColor: item id is null."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "foreColor"

    .line 23
    .line 24
    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object p2, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 34
    .line 35
    filled-new-array {p0}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v1, "itemId=?"

    .line 40
    .line 41
    invoke-virtual {p1, p2, v0, v1, p0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method P(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "R-Loader"

    .line 6
    .line 7
    const-string p1, "updateItemMainColor: item id is null."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "mainColor"

    .line 23
    .line 24
    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object p2, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 34
    .line 35
    filled-new-array {p0}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v1, "itemId=?"

    .line 40
    .line 41
    invoke-virtual {p1, p2, v0, v1, p0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method Q(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "R-Loader"

    .line 6
    .line 7
    const-string p1, "updateItemStatusForeColor: item id is null."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "statusForeColor"

    .line 23
    .line 24
    invoke-virtual {v0, p2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object p2, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 34
    .line 35
    filled-new-array {p0}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v1, "itemId=?"

    .line 40
    .line 41
    invoke-virtual {p1, p2, v0, v1, p0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method R(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "R-Loader"

    .line 6
    .line 7
    const-string p1, "updateWallpaperFinger: item id is null."

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "finger"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v1, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 30
    .line 31
    filled-new-array {p0}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v2, "itemId=?"

    .line 36
    .line 37
    invoke-virtual {p1, v1, v0, v2, p0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method d(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/resource/K$e;->e(Landroid/graphics/Bitmap;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method e(Landroid/graphics/Bitmap;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/resource/K$e;->f(Landroid/graphics/Bitmap;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method f(Landroid/graphics/Bitmap;ZZ)V
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1b
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;->x()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez p2, :cond_1

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/resource/K$e;->y([I)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/K$e;->w(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_1
    const-string v1, "R-Loader"

    .line 21
    .line 22
    if-eqz p1, :cond_13

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    goto/16 :goto_5

    .line 31
    .line 32
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v3, "computeAndUpdateColorOfWallpaper wallpaperInfo "

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Lcom/android/launcher3/resource/K$e;->x()[I

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-direct {p0, v3}, Lcom/android/launcher3/resource/K$e;->z([I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, " forceComputer "

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 69
    .line 70
    .line 71
    move-result-wide v2

    .line 72
    const/4 v4, 0x0

    .line 73
    aget v5, v0, v4

    .line 74
    .line 75
    if-nez v5, :cond_3

    .line 76
    .line 77
    if-nez p3, :cond_3

    .line 78
    .line 79
    invoke-static {p1}, Lcom/android/launcher3/resource/A1;->e(Landroid/graphics/Bitmap;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-virtual {p0, v5}, Lcom/android/launcher3/resource/K$e;->M(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    new-instance v5, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v6, "computeFingerprint itemId "

    .line 92
    .line 93
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v6, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v6, " used time "

    .line 102
    .line 103
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 107
    .line 108
    .line 109
    move-result-wide v6

    .line 110
    sub-long/2addr v6, v2

    .line 111
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    :cond_3
    const/4 v2, 0x1

    .line 122
    aget v2, v0, v2

    .line 123
    .line 124
    const/4 v3, -0x1

    .line 125
    if-eqz v2, :cond_5

    .line 126
    .line 127
    if-eqz p2, :cond_4

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_4
    move v2, v3

    .line 131
    goto :goto_3

    .line 132
    :cond_5
    :goto_2
    move-object v2, p0

    .line 133
    check-cast v2, Lcom/android/launcher3/resource/K$f;

    .line 134
    .line 135
    invoke-virtual {v2}, Lcom/android/launcher3/resource/K$f;->X()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-nez v2, :cond_6

    .line 140
    .line 141
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/resource/K$e;->j(Landroid/graphics/Bitmap;Z)I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    :cond_6
    invoke-virtual {p0, v2}, Lcom/android/launcher3/resource/K$e;->E(I)V

    .line 146
    .line 147
    .line 148
    :goto_3
    const/4 v5, 0x3

    .line 149
    aget v5, v0, v5

    .line 150
    .line 151
    const/high16 v6, -0x1000000

    .line 152
    .line 153
    if-eqz v5, :cond_7

    .line 154
    .line 155
    if-eqz p2, :cond_d

    .line 156
    .line 157
    :cond_7
    move-object v4, p0

    .line 158
    check-cast v4, Lcom/android/launcher3/resource/K$f;

    .line 159
    .line 160
    invoke-virtual {v4}, Lcom/android/launcher3/resource/K$f;->Y()I

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    if-nez v4, :cond_c

    .line 165
    .line 166
    if-eqz p3, :cond_a

    .line 167
    .line 168
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/K$e;->h(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    if-eqz v5, :cond_a

    .line 173
    .line 174
    invoke-virtual {v5}, Landroid/app/WallpaperColors;->getPrimaryColor()Landroid/graphics/Color;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    if-eqz v7, :cond_a

    .line 179
    .line 180
    invoke-virtual {v5}, Landroid/app/WallpaperColors;->getPrimaryColor()Landroid/graphics/Color;

    .line 181
    .line 182
    .line 183
    move-result-object v7

    .line 184
    invoke-virtual {v7}, Landroid/graphics/Color;->toArgb()I

    .line 185
    .line 186
    .line 187
    move-result v7

    .line 188
    invoke-virtual {v5}, Landroid/app/WallpaperColors;->getSecondaryColor()Landroid/graphics/Color;

    .line 189
    .line 190
    .line 191
    move-result-object v8

    .line 192
    if-eqz v8, :cond_8

    .line 193
    .line 194
    invoke-virtual {v5}, Landroid/app/WallpaperColors;->getSecondaryColor()Landroid/graphics/Color;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    invoke-virtual {v8}, Landroid/graphics/Color;->toArgb()I

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    goto :goto_4

    .line 203
    :cond_8
    move v8, v3

    .line 204
    :goto_4
    invoke-virtual {v5}, Landroid/app/WallpaperColors;->getTertiaryColor()Landroid/graphics/Color;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    if-eqz v9, :cond_9

    .line 209
    .line 210
    invoke-virtual {v5}, Landroid/app/WallpaperColors;->getTertiaryColor()Landroid/graphics/Color;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    invoke-virtual {v3}, Landroid/graphics/Color;->toArgb()I

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    :cond_9
    filled-new-array {v7, v8, v3}, [I

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    invoke-virtual {p0, v3}, Lcom/android/launcher3/resource/K$e;->L([I)V

    .line 223
    .line 224
    .line 225
    :cond_a
    if-eqz v4, :cond_b

    .line 226
    .line 227
    if-ne v4, v6, :cond_c

    .line 228
    .line 229
    :cond_b
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/K$e;->g(Landroid/graphics/Bitmap;)I

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    move v4, v3

    .line 234
    :cond_c
    invoke-virtual {p0, v4}, Lcom/android/launcher3/resource/K$e;->H(I)V

    .line 235
    .line 236
    .line 237
    :cond_d
    const/4 v3, 0x2

    .line 238
    aget v0, v0, v3

    .line 239
    .line 240
    if-eqz v0, :cond_e

    .line 241
    .line 242
    if-eqz p2, :cond_10

    .line 243
    .line 244
    :cond_e
    move-object p2, p0

    .line 245
    check-cast p2, Lcom/android/launcher3/resource/K$f;

    .line 246
    .line 247
    invoke-virtual {p2}, Lcom/android/launcher3/resource/K$f;->Z()I

    .line 248
    .line 249
    .line 250
    move-result p2

    .line 251
    if-nez p2, :cond_f

    .line 252
    .line 253
    invoke-direct {p0, p1, p3}, Lcom/android/launcher3/resource/K$e;->i(Landroid/graphics/Bitmap;Z)I

    .line 254
    .line 255
    .line 256
    move-result p2

    .line 257
    :cond_f
    move v6, p2

    .line 258
    invoke-virtual {p0, v6}, Lcom/android/launcher3/resource/K$e;->J(I)V

    .line 259
    .line 260
    .line 261
    :cond_10
    if-nez v2, :cond_11

    .line 262
    .line 263
    if-eqz v6, :cond_12

    .line 264
    .line 265
    :cond_11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 266
    .line 267
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 268
    .line 269
    .line 270
    const-string p2, "color info == fore "

    .line 271
    .line 272
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p2

    .line 279
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    const-string p2, " main "

    .line 283
    .line 284
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p2

    .line 291
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string p2, " status "

    .line 295
    .line 296
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p2

    .line 303
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    .line 312
    .line 313
    :cond_12
    invoke-static {p1}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 314
    .line 315
    .line 316
    return-void

    .line 317
    :cond_13
    :goto_5
    const-string p0, "computeAndUpdateColorOfWallpaper bitmap is null or recyled"

    .line 318
    .line 319
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    .line 321
    .line 322
    return-void
.end method

.method j(Landroid/graphics/Bitmap;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/K$e;->v(Landroid/graphics/Bitmap;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0xbe

    .line 6
    .line 7
    if-lt p0, p1, :cond_0

    .line 8
    .line 9
    const/high16 p0, -0x1000000

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    return p0
.end method

.method k()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "deleteFromDb: item id id null."

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v2, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 20
    .line 21
    filled-new-array {p0}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v3, "itemId=?"

    .line 26
    .line 27
    invoke-virtual {v0, v2, v3, p0}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v2, " deleteItemFromDb res  :"

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method m()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method n()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/resource/K$e;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method o()Landroid/database/Cursor;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "R-Loader"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p0, "getItemFromDb: item id is null."

    .line 9
    .line 10
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    return-object v2

    .line 14
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->z()Lcom/android/launcher3/resource/ResourceDatabaseProvider;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    sget-object v4, Lcom/android/launcher3/resource/ResourceDatabaseProvider$e;->a:Landroid/net/Uri;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 21
    .line 22
    filled-new-array {p0}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    const/4 v8, 0x0

    .line 27
    const/4 v5, 0x0

    .line 28
    const-string v6, "itemId=?"

    .line 29
    .line 30
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/resource/ResourceDatabaseProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    return-object v2

    .line 37
    :cond_1
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 44
    .line 45
    .line 46
    return-object v2

    .line 47
    :catch_0
    move-exception v0

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    return-object p0

    .line 53
    :goto_0
    invoke-static {p0}, Lx1/O;->x(Landroid/database/Cursor;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v3, " getItemFromDb Exception occor !!"

    .line 62
    .line 63
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    return-object v2
.end method

.method p()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method r()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/resource/K$e;->f:I

    .line 2
    .line 3
    return p0
.end method

.method u()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/resource/K$e;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
