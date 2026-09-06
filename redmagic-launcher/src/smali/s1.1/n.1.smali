.class Ls1/n;
.super Ljava/lang/Object;
.source "DynamicIconResourceMfv.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/n$a;,
        Ls1/n$b;
    }
.end annotation


# static fields
.field private static q:Ljava/lang/String;


# instance fields
.field private a:Landroid/graphics/Bitmap;

.field private b:Landroid/graphics/Bitmap;

.field private final c:Ljava/lang/Object;

.field private volatile d:Landroid/graphics/Bitmap;

.field private volatile e:I

.field private volatile f:Ljava/lang/String;

.field private g:Landroid/graphics/Bitmap;

.field private h:Landroid/graphics/Bitmap;

.field private i:Landroid/graphics/Bitmap;

.field private final j:Ljava/lang/Object;

.field private volatile k:Landroid/graphics/Bitmap;

.field private volatile l:F

.field private volatile m:F

.field private n:I

.field private final o:Landroid/content/Context;

.field private p:Ls1/n$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ls1/n;->c:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ls1/n;->e:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ls1/n;->f:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/Object;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ls1/n;->j:Ljava/lang/Object;

    .line 23
    .line 24
    const/high16 v1, 0x41400000    # 12.0f

    .line 25
    .line 26
    iput v1, p0, Ls1/n;->l:F

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput v1, p0, Ls1/n;->m:F

    .line 30
    .line 31
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/graphics/Typeface;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, p0, Ls1/n;->n:I

    .line 38
    .line 39
    iput-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 40
    .line 41
    iput-object p1, p0, Ls1/n;->o:Landroid/content/Context;

    .line 42
    .line 43
    return-void
.end method

.method private b(Ljava/io/Closeable;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception p0

    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v0, "close fail "

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "DynamicIconResourceMfv"

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method private c(Landroid/content/Context;F)I
    .locals 0

    .line 1
    const/high16 p0, 0x40400000    # 3.0f

    .line 2
    .line 3
    mul-float/2addr p2, p0

    .line 4
    const/high16 p0, 0x3f000000    # 0.5f

    .line 5
    .line 6
    add-float/2addr p2, p0

    .line 7
    float-to-int p0, p2

    .line 8
    return p0
.end method

.method private static d()Ljava/lang/String;
    .locals 3

    .line 1
    sget-object v0, Ls1/n;->q:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ls1/n;->q:Ljava/lang/String;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    const-string v0, "/data/resource-cache/cache/icon-cache/icon/icon"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v2, "/data/resource-cache/cache/icon-cache/icon/"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, "/icon"

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v2, "generateSysIconPath sysPath "

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "DynamicIconResourceMfv"

    .line 69
    .line 70
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    sput-object v0, Ls1/n;->q:Ljava/lang/String;

    .line 74
    .line 75
    return-object v0
.end method

.method private e(Landroid/content/ComponentName;)[B
    .locals 4

    .line 1
    invoke-static {p1}, Ls1/n;->r(Landroid/content/ComponentName;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "getIconBitmapFromFile path "

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "DynamicIconResourceMfv"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    new-instance v0, Ljava/io/File;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    new-instance v2, Ljava/io/FileInputStream;

    .line 40
    .line 41
    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 42
    .line 43
    .line 44
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1, v2}, Ls1/n;->q(Ljava/lang/String;Ljava/io/InputStream;)Ls1/n$b;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1}, Ls1/n$b;->a()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string v0, "UTF-8"

    .line 59
    .line 60
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 65
    .line 66
    .line 67
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    invoke-direct {p0, v2}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 69
    .line 70
    .line 71
    return-object p1

    .line 72
    :catchall_0
    move-exception p1

    .line 73
    goto :goto_3

    .line 74
    :catch_0
    move-exception p1

    .line 75
    goto :goto_1

    .line 76
    :cond_0
    move-object p1, v2

    .line 77
    goto :goto_0

    .line 78
    :catchall_1
    move-exception v0

    .line 79
    move-object v2, p1

    .line 80
    move-object p1, v0

    .line 81
    goto :goto_3

    .line 82
    :catch_1
    move-exception v0

    .line 83
    move-object v2, p1

    .line 84
    move-object p1, v0

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :goto_1
    :try_start_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    const-string v3, "getIconBitmapFromFile exception "

    .line 96
    .line 97
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 112
    .line 113
    .line 114
    invoke-direct {p0, v2}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 115
    .line 116
    .line 117
    :goto_2
    const/4 p0, 0x0

    .line 118
    new-array p0, p0, [B

    .line 119
    .line 120
    return-object p0

    .line 121
    :goto_3
    invoke-direct {p0, v2}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 122
    .line 123
    .line 124
    throw p1
.end method

.method private g(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "DynamicIconResourceMfv"

    .line 4
    .line 5
    const-string p1, "getCalendarIcon icon is null"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Ls1/n;->o:Landroid/content/Context;

    .line 17
    .line 18
    int-to-float p4, p4

    .line 19
    invoke-direct {p0, v1, p4}, Ls1/n;->c(Landroid/content/Context;F)I

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    iget-object v1, p0, Ls1/n;->o:Landroid/content/Context;

    .line 24
    .line 25
    int-to-float p2, p2

    .line 26
    invoke-direct {p0, v1, p2}, Ls1/n;->c(Landroid/content/Context;F)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iget-object v1, p0, Ls1/n;->o:Landroid/content/Context;

    .line 31
    .line 32
    int-to-float p5, p5

    .line 33
    invoke-direct {p0, v1, p5}, Ls1/n;->c(Landroid/content/Context;F)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    new-instance p5, Landroid/graphics/Canvas;

    .line 38
    .line 39
    invoke-direct {p5, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Landroid/text/TextPaint;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-direct {v1, v2}, Landroid/text/TextPaint;-><init>(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, p3}, Landroid/text/TextPaint;->setColor(I)V

    .line 52
    .line 53
    .line 54
    int-to-float p3, p4

    .line 55
    invoke-virtual {v1, p3}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 56
    .line 57
    .line 58
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 59
    .line 60
    invoke-virtual {v1, p3}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 61
    .line 62
    .line 63
    new-instance p3, Ljava/util/Date;

    .line 64
    .line 65
    invoke-direct {p3}, Ljava/util/Date;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance p4, Ljava/text/SimpleDateFormat;

    .line 69
    .line 70
    const-string v2, "EEEE"

    .line 71
    .line 72
    invoke-direct {p4, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p4, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    invoke-virtual {v1, p4}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    float-to-int v2, v2

    .line 84
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const/16 v4, 0x8

    .line 89
    .line 90
    if-le v3, v4, :cond_1

    .line 91
    .line 92
    new-instance p4, Ljava/text/SimpleDateFormat;

    .line 93
    .line 94
    const-string v2, "EEE"

    .line 95
    .line 96
    invoke-direct {p4, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p4, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p4

    .line 103
    invoke-virtual {v1, p4}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    float-to-int v2, p3

    .line 108
    :cond_1
    sub-int/2addr v0, v2

    .line 109
    div-int/lit8 v0, v0, 0x2

    .line 110
    .line 111
    add-int/2addr v0, p0

    .line 112
    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    iget p0, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 117
    .line 118
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    add-int/2addr p0, p2

    .line 123
    int-to-float p2, v0

    .line 124
    int-to-float p0, p0

    .line 125
    invoke-virtual {p5, p4, p2, p0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 126
    .line 127
    .line 128
    return-object p1
.end method

.method private i(Landroid/content/ComponentName;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Ls1/n;->j(Landroid/content/ComponentName;Z)Landroid/graphics/Bitmap;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method private j(Landroid/content/ComponentName;Z)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    invoke-static {p1}, Ls1/n;->o(Landroid/content/ComponentName;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/io/File;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v2, "getIconBitmapFromCache Exception"

    .line 15
    .line 16
    const-string v3, "DynamicIconResourceMfv"

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 24
    .line 25
    .line 26
    :try_start_1
    invoke-direct {p0, v0}, Ls1/n;->n(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 27
    .line 28
    .line 29
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    invoke-direct {p0, v0}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 31
    .line 32
    .line 33
    return-object p1

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    move-object v4, v0

    .line 36
    goto :goto_1

    .line 37
    :catch_0
    move-exception v1

    .line 38
    goto :goto_0

    .line 39
    :catchall_1
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :catch_1
    move-exception v1

    .line 42
    move-object v0, v4

    .line 43
    :goto_0
    :try_start_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .line 64
    .line 65
    invoke-direct {p0, v0}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :goto_1
    invoke-direct {p0, v4}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 70
    .line 71
    .line 72
    throw p1

    .line 73
    :cond_0
    move-object v0, v4

    .line 74
    :goto_2
    if-nez p2, :cond_1

    .line 75
    .line 76
    return-object v4

    .line 77
    :cond_1
    invoke-static {p1}, Ls1/n;->p(Landroid/content/ComponentName;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    new-instance p2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v1, "getIconBitmapFromFile path "

    .line 87
    .line 88
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-static {v3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    new-instance p2, Ljava/io/File;

    .line 102
    .line 103
    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_2

    .line 111
    .line 112
    :try_start_3
    new-instance p1, Ljava/io/FileInputStream;

    .line 113
    .line 114
    invoke-direct {p1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 115
    .line 116
    .line 117
    :try_start_4
    invoke-direct {p0, p1}, Ls1/n;->n(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 118
    .line 119
    .line 120
    move-result-object p2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 121
    invoke-direct {p0, p1}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 122
    .line 123
    .line 124
    return-object p2

    .line 125
    :catchall_2
    move-exception p2

    .line 126
    move-object v0, p1

    .line 127
    goto :goto_4

    .line 128
    :catch_2
    move-exception p2

    .line 129
    move-object v0, p1

    .line 130
    goto :goto_3

    .line 131
    :catchall_3
    move-exception p2

    .line 132
    goto :goto_4

    .line 133
    :catch_3
    move-exception p2

    .line 134
    :goto_3
    :try_start_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 154
    .line 155
    .line 156
    invoke-direct {p0, v0}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 157
    .line 158
    .line 159
    goto :goto_5

    .line 160
    :goto_4
    invoke-direct {p0, v0}, Ls1/n;->b(Ljava/io/Closeable;)V

    .line 161
    .line 162
    .line 163
    throw p2

    .line 164
    :cond_2
    :goto_5
    return-object v4
.end method

.method private k()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, v0}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0
.end method

.method private l()V
    .locals 15

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    new-instance v1, Landroid/content/ComponentName;

    .line 4
    .line 5
    const-string v2, "theme.info.dynamic.calendar"

    .line 6
    .line 7
    const-string v3, "null"

    .line 8
    .line 9
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v1}, Ls1/n;->e(Landroid/content/ComponentName;)[B

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    array-length v2, v1

    .line 17
    const-string v3, "DynamicIconResourceMfv"

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    const-string v0, "refreshCalendarIconWithWeek theme info not found!"

    .line 22
    .line 23
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    new-instance v0, Ls1/n$a;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ls1/n$a;-><init>(Ls1/n;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    :try_start_0
    new-instance v2, Ljava/lang/String;

    .line 35
    .line 36
    const-string v4, "utf-8"

    .line 37
    .line 38
    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-direct {v2, v1, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 43
    .line 44
    .line 45
    const-string v1, "-"

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 54
    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    move v5, v4

    .line 58
    :goto_0
    array-length v6, v1

    .line 59
    const/4 v7, 0x1

    .line 60
    sub-int/2addr v6, v7

    .line 61
    if-ge v5, v6, :cond_1

    .line 62
    .line 63
    aget-object v6, v1, v5

    .line 64
    .line 65
    add-int/lit8 v7, v5, 0x1

    .line 66
    .line 67
    aget-object v7, v1, v7

    .line 68
    .line 69
    invoke-interface {v2, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    add-int/lit8 v5, v5, 0x2

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception v0

    .line 76
    move-object v9, p0

    .line 77
    goto/16 :goto_4

    .line 78
    .line 79
    :cond_1
    const-string v1, "showWeekInfo"

    .line 80
    .line 81
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    const-string v5, "paddingTop"

    .line 92
    .line 93
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    check-cast v5, Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    float-to-int v11, v5

    .line 104
    const-string v5, "textColor"

    .line 105
    .line 106
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    check-cast v5, Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v12

    .line 116
    const-string v5, "textSize"

    .line 117
    .line 118
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    check-cast v5, Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v13

    .line 128
    const-string v5, "horizontalOffset"

    .line 129
    .line 130
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-eqz v5, :cond_2

    .line 141
    .line 142
    move v14, v4

    .line 143
    goto :goto_1

    .line 144
    :cond_2
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    move v14, v2

    .line 149
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v5, "refreshCalendarIconWithWeek paddingTop + textColor + textSize "

    .line 155
    .line 156
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-static {v12}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string v0, ", "

    .line 185
    .line 186
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    new-instance v8, Ls1/n$a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .line 201
    if-ne v1, v7, :cond_3

    .line 202
    .line 203
    move v10, v7

    .line 204
    :goto_2
    move-object v9, p0

    .line 205
    goto :goto_3

    .line 206
    :cond_3
    move v10, v4

    .line 207
    goto :goto_2

    .line 208
    :goto_3
    :try_start_1
    invoke-direct/range {v8 .. v14}, Ls1/n$a;-><init>(Ls1/n;ZIIII)V

    .line 209
    .line 210
    .line 211
    iput-object v8, v9, Ls1/n;->p:Ls1/n$a;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 212
    .line 213
    return-void

    .line 214
    :catch_1
    move-exception v0

    .line 215
    :goto_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .line 219
    .line 220
    const-string v1, "refreshCalendarIconWithWeek Exception occour "

    .line 221
    .line 222
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    const/4 p0, 0x0

    .line 240
    iput-object p0, v9, Ls1/n;->p:Ls1/n$a;

    .line 241
    .line 242
    return-void
.end method

.method private m(I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Landroid/content/ComponentName;

    .line 3
    .line 4
    const-string v2, "theme.dynamic.calendar"

    .line 5
    .line 6
    const-string v3, "null"

    .line 7
    .line 8
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v1}, Ls1/n;->i(Landroid/content/ComponentName;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_4

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    mul-int/lit8 v3, v3, 0x20

    .line 34
    .line 35
    if-ge v2, v3, :cond_1

    .line 36
    .line 37
    const-string p1, "DynamicIconResourceMfv"

    .line 38
    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v3, "initCalendarBaseIcon: resource error. width: "

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v3, ", height: "

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {p1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 76
    .line 77
    invoke-direct {p0, p1}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, v1}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :catchall_0
    move-exception p0

    .line 85
    move-object p1, v0

    .line 86
    goto :goto_2

    .line 87
    :cond_1
    invoke-direct {p0, v1}, Ls1/n;->t(Landroid/graphics/Bitmap;)V

    .line 88
    .line 89
    .line 90
    invoke-direct {p0, p1, v1}, Ls1/n;->u(ILandroid/graphics/Bitmap;)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0, v1}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ls1/n;->a:Landroid/graphics/Bitmap;

    .line 97
    .line 98
    if-eqz p1, :cond_2

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_2

    .line 105
    .line 106
    iget-object p1, p0, Ls1/n;->b:Landroid/graphics/Bitmap;

    .line 107
    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_2

    .line 115
    .line 116
    iget-object p1, p0, Ls1/n;->c:Ljava/lang/Object;

    .line 117
    .line 118
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    :try_start_1
    iget-object v1, p0, Ls1/n;->a:Landroid/graphics/Bitmap;

    .line 120
    .line 121
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    const/4 v3, 0x1

    .line 126
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 131
    .line 132
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 133
    :try_start_2
    new-instance p1, Landroid/graphics/Canvas;

    .line 134
    .line 135
    iget-object v1, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 136
    .line 137
    invoke-direct {p1, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 138
    .line 139
    .line 140
    :try_start_3
    iget-object p0, p0, Ls1/n;->b:Landroid/graphics/Bitmap;

    .line 141
    .line 142
    const/4 v1, 0x0

    .line 143
    invoke-virtual {p1, p0, v1, v1, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :catchall_1
    move-exception p0

    .line 151
    goto :goto_2

    .line 152
    :catchall_2
    move-exception p0

    .line 153
    :try_start_4
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 154
    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 155
    :cond_2
    move-object p1, v0

    .line 156
    :goto_0
    if-eqz p1, :cond_3

    .line 157
    .line 158
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 159
    .line 160
    .line 161
    :cond_3
    return-void

    .line 162
    :cond_4
    :goto_1
    :try_start_6
    const-string p1, "DynamicIconResourceMfv"

    .line 163
    .line 164
    const-string v2, "initCalendarBaseIcon: do not find resource."

    .line 165
    .line 166
    invoke-static {p1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 170
    .line 171
    invoke-direct {p0, p1}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 172
    .line 173
    .line 174
    invoke-direct {p0, v1}, Ls1/n;->s(Landroid/graphics/Bitmap;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :goto_2
    if-eqz p1, :cond_5

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 181
    .line 182
    .line 183
    :cond_5
    throw p0
.end method

.method private n(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0, p0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private static o(Landroid/content/ComponentName;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ls1/n;->d()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    .line 12
    .line 13
    const-string v1, "/"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "."

    .line 23
    .line 24
    const-string v3, "_"

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 31
    .line 32
    .line 33
    const-string v1, "null"

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    const-string v1, "-"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 59
    .line 60
    .line 61
    :cond_0
    const-string p0, ".png"

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method private static p(Landroid/content/ComponentName;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ls1/n;->d()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    .line 12
    .line 13
    const-string v1, "/"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v1, "."

    .line 23
    .line 24
    const-string v2, "_"

    .line 25
    .line 26
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 31
    .line 32
    .line 33
    const-string p0, ".png"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method private static q(Ljava/lang/String;Ljava/io/InputStream;)Ls1/n$b;
    .locals 6

    .line 1
    const-string v0, "DynamicIconResourceMfv"

    .line 2
    .line 3
    const-string v1, "-"

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    const-string v2, ".xml"

    .line 19
    .line 20
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v4, -0x1

    .line 25
    if-ne v2, v4, :cond_1

    .line 26
    .line 27
    return-object v3

    .line 28
    :cond_1
    const-string v4, "_"

    .line 29
    .line 30
    const-string v5, "."

    .line 31
    .line 32
    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 v4, 0x0

    .line 37
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v2, Landroid/content/ComponentName;

    .line 42
    .line 43
    const-string v4, "null"

    .line 44
    .line 45
    invoke-direct {v2, p0, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance p0, Ljava/lang/StringBuffer;

    .line 49
    .line 50
    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 51
    .line 52
    .line 53
    :try_start_0
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v5, "UTF-8"

    .line 58
    .line 59
    invoke-interface {v4, p1, v5}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    :goto_0
    const/4 v5, 0x1

    .line 67
    if-eq p1, v5, :cond_4

    .line 68
    .line 69
    const/4 v5, 0x2

    .line 70
    if-eq p1, v5, :cond_2

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v5, "item"

    .line 78
    .line 79
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    const-string p1, "key"

    .line 86
    .line 87
    invoke-interface {v4, v3, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string v5, "value"

    .line 92
    .line 93
    invoke-interface {v4, v3, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :catch_0
    move-exception p0

    .line 111
    goto :goto_2

    .line 112
    :cond_3
    :goto_1
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    goto :goto_0

    .line 117
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string v1, "parseXmlInfo values "

    .line 123
    .line 124
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    new-instance p1, Ls1/n$b;

    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-direct {p1, v2, p0}, Ls1/n$b;-><init>(Landroid/content/ComponentName;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .line 149
    .line 150
    return-object p1

    .line 151
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .line 155
    .line 156
    const-string v1, "parseXmlInfo Exception occor !!"

    .line 157
    .line 158
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    return-object v3
.end method

.method private static r(Landroid/content/ComponentName;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ls1/n;->d()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    .line 12
    .line 13
    const-string v1, "/"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v1, "."

    .line 23
    .line 24
    const-string v2, "_"

    .line 25
    .line 26
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 31
    .line 32
    .line 33
    const-string p0, ".xml"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method private s(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private t(Landroid/graphics/Bitmap;)V
    .locals 7

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v3

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "refreshCalendarBg height"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, "- width"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "DynamicIconResourceMfv"

    .line 37
    .line 38
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    mul-int/lit8 v1, v3, 0x1f

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x1

    .line 45
    const/4 v2, 0x0

    .line 46
    move v4, v3

    .line 47
    move-object v0, p1

    .line 48
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Ls1/n;->a:Landroid/graphics/Bitmap;

    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method private u(ILandroid/graphics/Bitmap;)V
    .locals 8

    .line 1
    iget v0, p0, Ls1/n;->e:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ls1/n;->b:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p2, :cond_2

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput p1, p0, Ls1/n;->e:I

    .line 21
    .line 22
    add-int/lit8 p1, p1, -0x1

    .line 23
    .line 24
    mul-int v2, p1, v4

    .line 25
    .line 26
    add-int p1, v2, v4

    .line 27
    .line 28
    if-le p1, v0, :cond_1

    .line 29
    .line 30
    iput-object p2, p0, Ls1/n;->b:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    const-string p0, "DynamicIconResourceMfv"

    .line 33
    .line 34
    const-string p1, "refreshCalendarDay mCalendarBg resource is error"

    .line 35
    .line 36
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const/4 v6, 0x0

    .line 41
    const/4 v7, 0x1

    .line 42
    const/4 v3, 0x0

    .line 43
    move v5, v4

    .line 44
    move-object v1, p2

    .line 45
    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ls1/n;->b:Landroid/graphics/Bitmap;

    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method private v()V
    .locals 8

    .line 1
    iget-object v0, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    iget-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0}, Ls1/n;->l()V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v1, p0, Ls1/n;->c:Ljava/lang/Object;

    .line 22
    .line 23
    monitor-enter v1

    .line 24
    :try_start_0
    iget-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-static {v0}, Ls1/n$a;->a(Ls1/n$a;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v3, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 35
    .line 36
    iget-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 37
    .line 38
    invoke-static {v0}, Ls1/n$a;->d(Ls1/n$a;)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    iget-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 43
    .line 44
    invoke-static {v0}, Ls1/n$a;->b(Ls1/n$a;)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    iget-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 49
    .line 50
    invoke-static {v0}, Ls1/n$a;->e(Ls1/n$a;)I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    iget-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 55
    .line 56
    invoke-static {v0}, Ls1/n$a;->c(Ls1/n$a;)I

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    move-object v2, p0

    .line 61
    invoke-direct/range {v2 .. v7}, Ls1/n;->g(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iput-object p0, v2, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    move-object p0, v0

    .line 70
    goto :goto_1

    .line 71
    :cond_2
    :goto_0
    monitor-exit v1

    .line 72
    return-void

    .line 73
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    throw p0

    .line 75
    :cond_3
    :goto_2
    const-string p0, "DynamicIconResourceMfv"

    .line 76
    .line 77
    const-string v0, "refreshCalendarIconWithWeek: calendar bitmap is null or recycled."

    .line 78
    .line 79
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private w(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ls1/n;->i:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    if-eqz p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    add-int v2, v0, v0

    .line 33
    .line 34
    if-gt v0, v1, :cond_2

    .line 35
    .line 36
    if-le v2, v1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v1, 0x0

    .line 40
    invoke-static {p1, v1, v1, v0, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-object v2, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 45
    .line 46
    invoke-static {p1, v0, v1, v0, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Ls1/n;->i:Landroid/graphics/Bitmap;

    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    :goto_0
    const-string p0, "DynamicIconResourceMfv"

    .line 54
    .line 55
    const-string p1, "refreshHourAndMinute mClockHour mClockMinute resource is error"

    .line 56
    .line 57
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    const/4 p1, 0x0

    .line 62
    iput-object p1, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 63
    .line 64
    iput-object p1, p0, Ls1/n;->i:Landroid/graphics/Bitmap;

    .line 65
    .line 66
    return-void
.end method

.method private x(Landroid/graphics/Bitmap;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ls1/n;->g:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-eqz p1, :cond_2

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    mul-int/lit8 v2, v4, 0x2

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    add-int v1, v2, v4

    .line 25
    .line 26
    sub-int/2addr v0, v1

    .line 27
    if-gez v0, :cond_1

    .line 28
    .line 29
    const-string p0, "DynamicIconResourceMfv"

    .line 30
    .line 31
    const-string p1, "refreshTimerBg mClockBg resource is error"

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const/4 v6, 0x0

    .line 38
    const/4 v7, 0x1

    .line 39
    const/4 v3, 0x0

    .line 40
    move v5, v4

    .line 41
    move-object v1, p1

    .line 42
    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Ls1/n;->g:Landroid/graphics/Bitmap;

    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Ls1/n;->g:Landroid/graphics/Bitmap;

    .line 51
    .line 52
    return-void
.end method

.method private declared-synchronized y()V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x5

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-direct {p0}, Ls1/n;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v2, p0, Ls1/n;->n:I

    .line 16
    .line 17
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/graphics/Typeface;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, 0x1

    .line 24
    const/4 v6, 0x0

    .line 25
    if-eq v2, v4, :cond_0

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/graphics/Typeface;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iput v2, p0, Ls1/n;->n:I

    .line 32
    .line 33
    move v2, v5

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_0
    move v2, v6

    .line 39
    :goto_0
    iget-object v3, p0, Ls1/n;->f:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    new-instance v3, Ljava/util/Locale;

    .line 48
    .line 49
    iget-object v4, p0, Ls1/n;->f:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    move v5, v6

    .line 66
    :goto_1
    const-string v3, "DynamicIconResourceMfv"

    .line 67
    .line 68
    new-instance v4, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v6, "initCalendarBaseIcon today/mDay : "

    .line 74
    .line 75
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v6, "/"

    .line 82
    .line 83
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget v6, p0, Ls1/n;->e:I

    .line 87
    .line 88
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v6, " languageChanged "

    .line 92
    .line 93
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v6, " fontChanged "

    .line 100
    .line 101
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v6, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 120
    .line 121
    if-eqz v3, :cond_2

    .line 122
    .line 123
    iget-object v3, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 124
    .line 125
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-nez v3, :cond_2

    .line 130
    .line 131
    iget v3, p0, Ls1/n;->e:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    .line 133
    if-ne v0, v3, :cond_2

    .line 134
    .line 135
    if-nez v5, :cond_2

    .line 136
    .line 137
    if-nez v2, :cond_2

    .line 138
    .line 139
    monitor-exit p0

    .line 140
    return-void

    .line 141
    :cond_2
    :try_start_1
    iput-object v1, p0, Ls1/n;->f:Ljava/lang/String;

    .line 142
    .line 143
    invoke-direct {p0, v0}, Ls1/n;->m(I)V

    .line 144
    .line 145
    .line 146
    invoke-direct {p0}, Ls1/n;->v()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 147
    .line 148
    .line 149
    monitor-exit p0

    .line 150
    return-void

    .line 151
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    throw v0
.end method

.method private declared-synchronized z()V
    .locals 15

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/16 v1, 0xc

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    int-to-float v2, v2

    .line 13
    const/16 v3, 0xd

    .line 14
    .line 15
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    int-to-float v4, v4

    .line 20
    const/high16 v5, 0x42700000    # 60.0f

    .line 21
    .line 22
    div-float/2addr v4, v5

    .line 23
    add-float/2addr v2, v4

    .line 24
    const/16 v4, 0xb

    .line 25
    .line 26
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    int-to-float v4, v4

    .line 31
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    int-to-float v0, v0

    .line 41
    div-float/2addr v0, v5

    .line 42
    add-float/2addr v1, v0

    .line 43
    div-float/2addr v1, v5

    .line 44
    add-float/2addr v4, v1

    .line 45
    iget v0, p0, Ls1/n;->m:F

    .line 46
    .line 47
    sub-float v0, v2, v0

    .line 48
    .line 49
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    float-to-double v0, v0

    .line 54
    const-wide v6, 0x3f847ae147ae147bL    # 0.01

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    cmpl-double v0, v0, v6

    .line 60
    .line 61
    if-gtz v0, :cond_1

    .line 62
    .line 63
    iget v0, p0, Ls1/n;->l:F

    .line 64
    .line 65
    sub-float v0, v4, v0

    .line 66
    .line 67
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 68
    .line 69
    .line 70
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    float-to-double v0, v0

    .line 72
    cmpl-double v0, v0, v6

    .line 73
    .line 74
    if-lez v0, :cond_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    monitor-exit p0

    .line 78
    return-void

    .line 79
    :catchall_0
    move-exception v0

    .line 80
    goto/16 :goto_5

    .line 81
    .line 82
    :cond_1
    :goto_0
    :try_start_1
    iput v2, p0, Ls1/n;->m:F

    .line 83
    .line 84
    iput v4, p0, Ls1/n;->l:F

    .line 85
    .line 86
    const-string v0, "DynamicIconResourceMfv"

    .line 87
    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v3, "updateClockIcon  update mHour : "

    .line 94
    .line 95
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v3, p0, Ls1/n;->l:F

    .line 99
    .line 100
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v3, " mMinute :"

    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v3, p0, Ls1/n;->m:F

    .line 109
    .line 110
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    new-instance v0, Landroid/content/ComponentName;

    .line 121
    .line 122
    const-string v1, "theme.dynamic.clock"

    .line 123
    .line 124
    const-string v3, "null"

    .line 125
    .line 126
    invoke-direct {v0, v1, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-direct {p0, v0}, Ls1/n;->i(Landroid/content/ComponentName;)Landroid/graphics/Bitmap;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_2

    .line 140
    .line 141
    goto/16 :goto_4

    .line 142
    .line 143
    :cond_2
    invoke-direct {p0, v0}, Ls1/n;->x(Landroid/graphics/Bitmap;)V

    .line 144
    .line 145
    .line 146
    invoke-direct {p0, v0}, Ls1/n;->w(Landroid/graphics/Bitmap;)V

    .line 147
    .line 148
    .line 149
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 150
    .line 151
    .line 152
    const/4 v0, 0x0

    .line 153
    :try_start_2
    iget-object v1, p0, Ls1/n;->g:Landroid/graphics/Bitmap;

    .line 154
    .line 155
    if-eqz v1, :cond_5

    .line 156
    .line 157
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-nez v1, :cond_5

    .line 162
    .line 163
    iget-object v1, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 164
    .line 165
    if-eqz v1, :cond_5

    .line 166
    .line 167
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-nez v1, :cond_5

    .line 172
    .line 173
    iget-object v1, p0, Ls1/n;->i:Landroid/graphics/Bitmap;

    .line 174
    .line 175
    if-eqz v1, :cond_5

    .line 176
    .line 177
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-nez v1, :cond_5

    .line 182
    .line 183
    iget-object v1, p0, Ls1/n;->g:Landroid/graphics/Bitmap;

    .line 184
    .line 185
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    const/4 v6, 0x1

    .line 190
    invoke-virtual {v1, v3, v6}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    new-instance v3, Landroid/graphics/Canvas;

    .line 195
    .line 196
    invoke-direct {v3, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 197
    .line 198
    .line 199
    :try_start_3
    new-instance v7, Landroid/graphics/Paint;

    .line 200
    .line 201
    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setFlags(I)V

    .line 208
    .line 209
    .line 210
    new-instance v6, Landroid/graphics/PaintFlagsDrawFilter;

    .line 211
    .line 212
    const/4 v8, 0x3

    .line 213
    const/4 v9, 0x0

    .line 214
    invoke-direct {v6, v9, v8}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v3, v6}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 218
    .line 219
    .line 220
    const/high16 v6, 0x41400000    # 12.0f

    .line 221
    .line 222
    div-float/2addr v4, v6

    .line 223
    const/high16 v6, 0x43b40000    # 360.0f

    .line 224
    .line 225
    mul-float/2addr v4, v6

    .line 226
    const/high16 v8, 0x43870000    # 270.0f

    .line 227
    .line 228
    add-float/2addr v4, v8

    .line 229
    iget-object v10, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 230
    .line 231
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    .line 232
    .line 233
    .line 234
    move-result v10

    .line 235
    div-int/lit8 v10, v10, 0x2

    .line 236
    .line 237
    iget-object v11, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 238
    .line 239
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    .line 240
    .line 241
    .line 242
    move-result v11

    .line 243
    div-int/lit8 v11, v11, 0x2

    .line 244
    .line 245
    iget-object v12, p0, Ls1/n;->p:Ls1/n$a;

    .line 246
    .line 247
    if-nez v12, :cond_3

    .line 248
    .line 249
    invoke-direct {p0}, Ls1/n;->l()V

    .line 250
    .line 251
    .line 252
    goto :goto_1

    .line 253
    :catchall_1
    move-exception v1

    .line 254
    goto :goto_3

    .line 255
    :cond_3
    :goto_1
    iget-object v12, p0, Ls1/n;->p:Ls1/n$a;

    .line 256
    .line 257
    if-eqz v12, :cond_4

    .line 258
    .line 259
    invoke-static {v12}, Ls1/n$a;->c(Ls1/n$a;)I

    .line 260
    .line 261
    .line 262
    move-result v9

    .line 263
    :cond_4
    iget-object v12, p0, Ls1/n;->o:Landroid/content/Context;

    .line 264
    .line 265
    int-to-float v9, v9

    .line 266
    invoke-direct {p0, v12, v9}, Ls1/n;->c(Landroid/content/Context;F)I

    .line 267
    .line 268
    .line 269
    move-result v9

    .line 270
    int-to-float v12, v9

    .line 271
    const/4 v13, 0x0

    .line 272
    invoke-virtual {v3, v12, v13}, Landroid/graphics/Canvas;->translate(FF)V

    .line 273
    .line 274
    .line 275
    int-to-float v10, v10

    .line 276
    int-to-float v11, v11

    .line 277
    invoke-virtual {v3, v4, v10, v11}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 278
    .line 279
    .line 280
    iget-object v14, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 281
    .line 282
    invoke-virtual {v3, v14, v13, v13, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 283
    .line 284
    .line 285
    neg-int v9, v9

    .line 286
    int-to-float v9, v9

    .line 287
    invoke-virtual {v3, v9, v13}, Landroid/graphics/Canvas;->translate(FF)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 291
    .line 292
    .line 293
    neg-float v4, v4

    .line 294
    add-float/2addr v4, v8

    .line 295
    div-float/2addr v2, v5

    .line 296
    mul-float/2addr v2, v6

    .line 297
    add-float/2addr v4, v2

    .line 298
    invoke-virtual {v3, v12, v13}, Landroid/graphics/Canvas;->translate(FF)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v3, v4, v10, v11}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 302
    .line 303
    .line 304
    iget-object v2, p0, Ls1/n;->i:Landroid/graphics/Bitmap;

    .line 305
    .line 306
    invoke-virtual {v3, v2, v13, v13, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v3, v9, v13}, Landroid/graphics/Canvas;->translate(FF)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 313
    .line 314
    .line 315
    goto :goto_2

    .line 316
    :catchall_2
    move-exception v1

    .line 317
    move-object v3, v0

    .line 318
    goto :goto_3

    .line 319
    :cond_5
    move-object v1, v0

    .line 320
    move-object v3, v1

    .line 321
    :goto_2
    iget-object v2, p0, Ls1/n;->j:Ljava/lang/Object;

    .line 322
    .line 323
    monitor-enter v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 324
    :try_start_4
    iput-object v1, p0, Ls1/n;->k:Landroid/graphics/Bitmap;

    .line 325
    .line 326
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 327
    if-eqz v3, :cond_6

    .line 328
    .line 329
    :try_start_5
    invoke-virtual {v3, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 330
    .line 331
    .line 332
    :cond_6
    monitor-exit p0

    .line 333
    return-void

    .line 334
    :catchall_3
    move-exception v1

    .line 335
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 336
    :try_start_7
    throw v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 337
    :goto_3
    if-eqz v3, :cond_7

    .line 338
    .line 339
    :try_start_8
    invoke-virtual {v3, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 340
    .line 341
    .line 342
    :cond_7
    throw v1

    .line 343
    :cond_8
    :goto_4
    const-string v0, "DynamicIconResourceMfv"

    .line 344
    .line 345
    const-string v1, "updateClockIcon: resource is null or recycled."

    .line 346
    .line 347
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    .line 349
    .line 350
    iget-object v0, p0, Ls1/n;->k:Landroid/graphics/Bitmap;

    .line 351
    .line 352
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 353
    .line 354
    .line 355
    monitor-exit p0

    .line 356
    return-void

    .line 357
    :goto_5
    :try_start_9
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 358
    throw v0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const-string v0, "DynamicIconResourceMfv"

    .line 2
    .line 3
    const-string v1, "clearDynamicIconCache: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ls1/n;->e:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ls1/n;->f:Ljava/lang/String;

    .line 13
    .line 14
    const/high16 v1, 0x41400000    # 12.0f

    .line 15
    .line 16
    iput v1, p0, Ls1/n;->l:F

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput v1, p0, Ls1/n;->m:F

    .line 20
    .line 21
    iput-object v0, p0, Ls1/n;->p:Ls1/n$a;

    .line 22
    .line 23
    iget-object v0, p0, Ls1/n;->g:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ls1/n;->h:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ls1/n;->i:Landroid/graphics/Bitmap;

    .line 34
    .line 35
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ls1/n;->k:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ls1/n;->a:Landroid/graphics/Bitmap;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ls1/n;->b:Landroid/graphics/Bitmap;

    .line 49
    .line 50
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    invoke-direct {p0, v0}, Ls1/n;->s(Landroid/graphics/Bitmap;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method f(Landroid/content/ComponentName;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-direct {p0}, Ls1/n;->y()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 18
    .line 19
    iget-object p0, p0, Ls1/n;->d:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    invoke-direct {p1, v0, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    return-object v0
.end method

.method h(Landroid/content/ComponentName;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-direct {p0}, Ls1/n;->z()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ls1/n;->k:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ls1/n;->k:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 18
    .line 19
    iget-object p0, p0, Ls1/n;->k:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    invoke-direct {p1, v0, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_0
    return-object v0
.end method
