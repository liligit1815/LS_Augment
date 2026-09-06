.class public final LS2/a$a;
.super LS2/a;
.source "PipContentOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LS2/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field private static final i:Ljava/lang/String; = "a$a"


# instance fields
.field private final b:Landroid/content/Context;

.field private final c:I

.field private final d:Landroid/graphics/Rect;

.field private final e:I

.field private final f:Landroid/graphics/Matrix;

.field private final g:[F

.field private h:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/drawable/Drawable;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Rect;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, LS2/a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LS2/a$a;->f:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/16 v0, 0x9

    .line 12
    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    iput-object v0, p0, LS2/a$a;->g:[F

    .line 16
    .line 17
    iput-object p1, p0, LS2/a$a;->b:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x1

    .line 28
    const/high16 v1, 0x42900000    # 72.0f

    .line 29
    .line 30
    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    float-to-int p1, p1

    .line 35
    invoke-static {p1, p5}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, LS2/a$a;->c:I

    .line 40
    .line 41
    invoke-static {p2, p3}, LS2/a$a;->d(Landroid/graphics/Rect;Landroid/graphics/Rect;)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    shr-int/lit8 p3, p1, 0x1

    .line 46
    .line 47
    iput p3, p0, LS2/a$a;->e:I

    .line 48
    .line 49
    iput-object p2, p0, LS2/a$a;->d:Landroid/graphics/Rect;

    .line 50
    .line 51
    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 52
    .line 53
    invoke-static {p1, p1, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, LS2/a$a;->h:Landroid/graphics/Bitmap;

    .line 58
    .line 59
    invoke-direct {p0, p4}, LS2/a$a;->e(Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Landroid/view/SurfaceControl$Builder;

    .line 63
    .line 64
    invoke-direct {p1}, Landroid/view/SurfaceControl$Builder;-><init>()V

    .line 65
    .line 66
    .line 67
    sget-object p2, LS2/a$a;->i:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Landroid/view/SurfaceControl$Builder;->setCallsite(Ljava/lang/String;)Landroid/view/SurfaceControl$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string p2, "PipContentOverlay"

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/view/SurfaceControl$Builder;->setName(Ljava/lang/String;)Landroid/view/SurfaceControl$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Builder;->build()Landroid/view/SurfaceControl;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 84
    .line 85
    return-void
.end method

.method public static d(Landroid/graphics/Rect;Landroid/graphics/Rect;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    add-int/lit8 p0, p0, 0x1

    .line 30
    .line 31
    return p0
.end method

.method private e(Landroid/graphics/drawable/Drawable;)V
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/Canvas;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LS2/a$a;->h:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LS2/a$a;->b:Landroid/content/Context;

    .line 12
    .line 13
    const v2, 0x1010031

    .line 14
    .line 15
    .line 16
    filled-new-array {v2}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x0

    .line 25
    :try_start_0
    invoke-virtual {v1, v2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-static {v3}, Landroid/graphics/Color;->red(I)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-static {v3}, Landroid/graphics/Color;->green(I)I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {v0, v4, v5, v3}, Landroid/graphics/Canvas;->drawRGB(III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 45
    .line 46
    .line 47
    new-instance v1, Landroid/graphics/Rect;

    .line 48
    .line 49
    iget v3, p0, LS2/a$a;->e:I

    .line 50
    .line 51
    iget v4, p0, LS2/a$a;->c:I

    .line 52
    .line 53
    div-int/lit8 v5, v4, 0x2

    .line 54
    .line 55
    sub-int v5, v3, v5

    .line 56
    .line 57
    div-int/lit8 v6, v4, 0x2

    .line 58
    .line 59
    sub-int v6, v3, v6

    .line 60
    .line 61
    div-int/lit8 v7, v4, 0x2

    .line 62
    .line 63
    add-int/2addr v7, v3

    .line 64
    div-int/lit8 v4, v4, 0x2

    .line 65
    .line 66
    add-int/2addr v3, v4

    .line 67
    invoke-direct {v1, v5, v6, v7, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, LS2/a$a;->h:Landroid/graphics/Bitmap;

    .line 77
    .line 78
    sget-object v0, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    .line 79
    .line 80
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, LS2/a$a;->h:Landroid/graphics/Bitmap;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :catchall_0
    move-exception p0

    .line 91
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 92
    .line 93
    .line 94
    throw p0
.end method


# virtual methods
.method public a(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V
    .locals 3

    .line 1
    iget-object v0, p0, LS2/a$a;->h:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHardwareBuffer()Landroid/hardware/HardwareBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 13
    .line 14
    const v2, 0x7fffffff

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 21
    .line 22
    invoke-virtual {p1, v1, v0}, Landroid/view/SurfaceControl$Transaction;->setBuffer(Landroid/view/SurfaceControl;Landroid/hardware/HardwareBuffer;)Landroid/view/SurfaceControl$Transaction;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p1, v1, v2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 32
    .line 33
    invoke-virtual {p1, v1, p2}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, LS2/a$a;->h:Landroid/graphics/Bitmap;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    iput-object p1, p0, LS2/a$a;->h:Landroid/graphics/Bitmap;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/hardware/HardwareBuffer;->close()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public c(Landroid/view/SurfaceControl$Transaction;Landroid/graphics/Rect;F)V
    .locals 5

    .line 1
    iget-object v0, p0, LS2/a$a;->f:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LS2/a$a;->d:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, LS2/a$a;->d:Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget-object v2, p0, LS2/a$a;->f:Landroid/graphics/Matrix;

    .line 19
    .line 20
    iget v3, p0, LS2/a$a;->e:I

    .line 21
    .line 22
    sub-int v4, v0, v3

    .line 23
    .line 24
    int-to-float v4, v4

    .line 25
    sub-int v3, v1, v3

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    invoke-virtual {v2, v4, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, LS2/a$a;->d:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    int-to-float v2, v2

    .line 38
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    int-to-float v3, v3

    .line 43
    div-float/2addr v2, v3

    .line 44
    iget-object v3, p0, LS2/a$a;->d:Landroid/graphics/Rect;

    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    int-to-float v3, v3

    .line 51
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    int-to-float p2, p2

    .line 56
    div-float/2addr v3, p2

    .line 57
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    iget-object v2, p0, LS2/a$a;->f:Landroid/graphics/Matrix;

    .line 62
    .line 63
    int-to-float v0, v0

    .line 64
    int-to-float v1, v1

    .line 65
    invoke-virtual {v2, p2, p2, v0, v1}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 69
    .line 70
    iget-object v0, p0, LS2/a$a;->f:Landroid/graphics/Matrix;

    .line 71
    .line 72
    iget-object v1, p0, LS2/a$a;->g:[F

    .line 73
    .line 74
    invoke-virtual {p1, p2, v0, v1}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;Landroid/graphics/Matrix;[F)Landroid/view/SurfaceControl$Transaction;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p0, p0, LS2/a;->a:Landroid/view/SurfaceControl;

    .line 79
    .line 80
    const/high16 p2, 0x3f000000    # 0.5f

    .line 81
    .line 82
    cmpg-float v0, p3, p2

    .line 83
    .line 84
    if-gez v0, :cond_0

    .line 85
    .line 86
    const/4 p2, 0x0

    .line 87
    goto :goto_0

    .line 88
    :cond_0
    sub-float/2addr p3, p2

    .line 89
    const/high16 p2, 0x40000000    # 2.0f

    .line 90
    .line 91
    mul-float/2addr p2, p3

    .line 92
    :goto_0
    invoke-virtual {p1, p0, p2}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 93
    .line 94
    .line 95
    return-void
.end method
