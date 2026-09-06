.class public final LR2/b$b;
.super Ljava/lang/Object;
.source "ManageWindowsViewContainer.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LR2/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LR2/b$b$a;
    }
.end annotation


# static fields
.field public static final i:LR2/b$b$a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/SurfaceView;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Landroid/widget/LinearLayout;

.field private e:I

.field private f:I

.field private g:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "-",
            "Ljava/lang/Integer;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private h:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LR2/b$b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LR2/b$b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LR2/b$b;->i:LR2/b$b$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 4

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LR2/b$b;->a:Landroid/content/Context;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LR2/b$b;->b:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LR2/b$b;->c:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Landroid/graphics/drawable/ShapeDrawable;

    .line 37
    .line 38
    invoke-direct {p1}, Landroid/graphics/drawable/ShapeDrawable;-><init>()V

    .line 39
    .line 40
    .line 41
    const/high16 v0, 0x41d00000    # 26.0f

    .line 42
    .line 43
    invoke-direct {p0, v0}, LR2/b$b;->m(F)F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/16 v1, 0x8

    .line 48
    .line 49
    new-array v2, v1, [F

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    :goto_0
    if-ge v3, v1, :cond_0

    .line 53
    .line 54
    aput v0, v2, v3

    .line 55
    .line 56
    add-int/lit8 v3, v3, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    new-instance v0, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-direct {v0, v2, v1, v1}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/ShapeDrawable;->setShape(Landroid/graphics/drawable/shapes/Shape;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object p2, p0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 76
    .line 77
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    const/high16 p2, 0x3f800000    # 1.0f

    .line 83
    .line 84
    invoke-direct {p0, p2}, LR2/b$b;->m(F)F

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 92
    .line 93
    new-instance p2, LR2/e;

    .line 94
    .line 95
    invoke-direct {p2, p0}, LR2/e;-><init>(LR2/b$b;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public static synthetic a(LR2/b$b;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LR2/b$b;->k(LR2/b$b;ILandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LR2/b$b;->l(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(LR2/b$b;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LR2/b$b;->d(LR2/b$b;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final d(LR2/b$b;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x4

    .line 6
    if-ne p1, p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, LR2/b$b;->h:Lu4/a;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method private final g(Landroid/view/View;FFFF)V
    .locals 8

    .line 1
    iget-object v0, p0, LR2/b$b;->b:Ljava/util/List;

    .line 2
    .line 3
    sget-object v1, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    aput p2, v3, v4

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    aput p3, v3, v5

    .line 13
    .line 14
    invoke-static {p1, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-wide/16 v6, 0xc8

    .line 19
    .line 20
    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, LR2/b$b;->b:Ljava/util/List;

    .line 27
    .line 28
    sget-object v1, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 29
    .line 30
    new-array v3, v2, [F

    .line 31
    .line 32
    aput p2, v3, v4

    .line 33
    .line 34
    aput p3, v3, v5

    .line 35
    .line 36
    invoke-static {p1, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, p2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, LR2/b$b;->b:Ljava/util/List;

    .line 47
    .line 48
    sget-object p2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 49
    .line 50
    new-array p3, v2, [F

    .line 51
    .line 52
    aput p4, p3, v4

    .line 53
    .line 54
    aput p5, p3, v5

    .line 55
    .line 56
    invoke-static {p1, p2, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-wide/16 p2, 0x64

    .line 61
    .line 62
    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 63
    .line 64
    .line 65
    const-wide/16 p2, 0x32

    .line 66
    .line 67
    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private final h()Landroid/animation/AnimatorSet;
    .locals 2

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LR2/b$b;->b:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, LR2/b$b;->b:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method private final i(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v1, p0

    .line 10
    int-to-float v2, v0

    .line 11
    const v3, 0x3fcccccd    # 1.6f

    .line 12
    .line 13
    .line 14
    mul-float v4, v2, v3

    .line 15
    .line 16
    cmpl-float v5, v1, v4

    .line 17
    .line 18
    const-string v6, "createBitmap(...)"

    .line 19
    .line 20
    const/4 v7, 0x0

    .line 21
    const/4 v8, 0x2

    .line 22
    if-lez v5, :cond_0

    .line 23
    .line 24
    sub-float/2addr v1, v4

    .line 25
    int-to-float p0, v8

    .line 26
    div-float/2addr v1, p0

    .line 27
    float-to-int p0, v1

    .line 28
    float-to-int v1, v4

    .line 29
    invoke-static {p1, p0, v7, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_0
    div-float/2addr v1, v3

    .line 38
    sub-float/2addr v2, v1

    .line 39
    int-to-float v0, v8

    .line 40
    div-float/2addr v2, v0

    .line 41
    float-to-int v0, v2

    .line 42
    float-to-int v1, v1

    .line 43
    invoke-static {p1, v7, v0, p0, v1}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object p0
.end method

.method private static final k(LR2/b$b;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, LR2/b$b;->g:Lu4/l;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private static final l(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHardwareBuffer()Landroid/hardware/HardwareBuffer;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object v1, v0

    .line 18
    :goto_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getColorSpace()Landroid/graphics/ColorSpace;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    invoke-virtual {p0, v1, v0}, Landroid/view/Surface;->attachAndQueueBufferWithColorSpace(Landroid/hardware/HardwareBuffer;Landroid/graphics/ColorSpace;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private final m(F)F
    .locals 1

    .line 1
    iget-object p0, p0, LR2/b$b;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method


# virtual methods
.method public final e(Lu4/a;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v2, p0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const/high16 v5, 0x3f800000    # 1.0f

    .line 9
    .line 10
    const/4 v6, 0x0

    .line 11
    const/high16 v3, 0x3f800000    # 1.0f

    .line 12
    .line 13
    const v4, 0x3f4ccccd    # 0.8f

    .line 14
    .line 15
    .line 16
    move-object v1, p0

    .line 17
    invoke-direct/range {v1 .. v6}, LR2/b$b;->g(Landroid/view/View;FFFF)V

    .line 18
    .line 19
    .line 20
    iget-object p0, v1, LR2/b$b;->c:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object v8, v0

    .line 37
    check-cast v8, Landroid/view/SurfaceView;

    .line 38
    .line 39
    const/high16 v11, 0x3f800000    # 1.0f

    .line 40
    .line 41
    const/4 v12, 0x0

    .line 42
    const/high16 v9, 0x3f800000    # 1.0f

    .line 43
    .line 44
    const v10, 0x3f4ccccd    # 0.8f

    .line 45
    .line 46
    .line 47
    move-object v7, v1

    .line 48
    invoke-direct/range {v7 .. v12}, LR2/b$b;->g(Landroid/view/View;FFFF)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-direct {v1}, LR2/b$b;->h()Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, LR2/b$b$b;

    .line 57
    .line 58
    invoke-direct {v0, p1}, LR2/b$b$b;-><init>(Lu4/a;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final f()V
    .locals 12

    .line 1
    iget-object v1, p0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/high16 v5, 0x3f800000    # 1.0f

    .line 5
    .line 6
    const v2, 0x3f4ccccd    # 0.8f

    .line 7
    .line 8
    .line 9
    const/high16 v3, 0x3f800000    # 1.0f

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    invoke-direct/range {v0 .. v5}, LR2/b$b;->g(Landroid/view/View;FFFF)V

    .line 13
    .line 14
    .line 15
    iget-object p0, v0, LR2/b$b;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v7, v1

    .line 32
    check-cast v7, Landroid/view/SurfaceView;

    .line 33
    .line 34
    const/4 v10, 0x0

    .line 35
    const/high16 v11, 0x3f800000    # 1.0f

    .line 36
    .line 37
    const v8, 0x3f4ccccd    # 0.8f

    .line 38
    .line 39
    .line 40
    const/high16 v9, 0x3f800000    # 1.0f

    .line 41
    .line 42
    move-object v6, v0

    .line 43
    invoke-direct/range {v6 .. v11}, LR2/b$b;->g(Landroid/view/View;FFFF)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-direct {v0}, LR2/b$b;->h()Landroid/animation/AnimatorSet;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final j(Ljava/util/List;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "snapshotList"

    .line 4
    .line 5
    move-object/from16 v2, p1

    .line 6
    .line 7
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, v0, LR2/b$b;->f:I

    .line 12
    .line 13
    iput v1, v0, LR2/b$b;->e:I

    .line 14
    .line 15
    iget-object v3, v0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 18
    .line 19
    .line 20
    const/high16 v3, 0x42ff0000    # 127.5f

    .line 21
    .line 22
    invoke-direct {v0, v3}, LR2/b$b;->m(F)F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/high16 v4, 0x434c0000    # 204.0f

    .line 27
    .line 28
    invoke-direct {v0, v4}, LR2/b$b;->m(F)F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    const/high16 v5, 0x41800000    # 16.0f

    .line 33
    .line 34
    invoke-direct {v0, v5}, LR2/b$b;->m(F)F

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    invoke-direct {v0, v5}, LR2/b$b;->m(F)F

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/4 v7, 0x0

    .line 47
    move v8, v1

    .line 48
    move-object v9, v7

    .line 49
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    if-eqz v10, :cond_6

    .line 54
    .line 55
    add-int/lit8 v10, v8, 0x1

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v11

    .line 61
    check-cast v11, Lh4/l;

    .line 62
    .line 63
    invoke-virtual {v11}, Lh4/l;->c()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v12

    .line 67
    check-cast v12, Ljava/lang/Number;

    .line 68
    .line 69
    invoke-virtual {v12}, Ljava/lang/Number;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v12

    .line 73
    invoke-virtual {v11}, Lh4/l;->d()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v11

    .line 77
    check-cast v11, Landroid/graphics/Bitmap;

    .line 78
    .line 79
    rem-int/lit8 v13, v8, 0x3

    .line 80
    .line 81
    if-nez v13, :cond_0

    .line 82
    .line 83
    new-instance v9, Landroid/widget/LinearLayout;

    .line 84
    .line 85
    iget-object v13, v0, LR2/b$b;->a:Landroid/content/Context;

    .line 86
    .line 87
    invoke-direct {v9, v13}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 91
    .line 92
    .line 93
    iget-object v13, v0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 94
    .line 95
    invoke-virtual {v13, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    iget v13, v0, LR2/b$b;->e:I

    .line 99
    .line 100
    add-float v14, v3, v5

    .line 101
    .line 102
    float-to-int v14, v14

    .line 103
    add-int/2addr v13, v14

    .line 104
    iput v13, v0, LR2/b$b;->e:I

    .line 105
    .line 106
    :cond_0
    if-eqz v11, :cond_1

    .line 107
    .line 108
    invoke-direct {v0, v11}, LR2/b$b;->i(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 109
    .line 110
    .line 111
    move-result-object v11

    .line 112
    goto :goto_1

    .line 113
    :cond_1
    move-object v11, v7

    .line 114
    :goto_1
    const/4 v13, 0x1

    .line 115
    if-eqz v11, :cond_2

    .line 116
    .line 117
    float-to-int v14, v4

    .line 118
    float-to-int v15, v3

    .line 119
    invoke-static {v11, v14, v15, v13}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 120
    .line 121
    .line 122
    move-result-object v11

    .line 123
    goto :goto_2

    .line 124
    :cond_2
    move-object v11, v7

    .line 125
    :goto_2
    new-instance v14, Landroid/view/SurfaceView;

    .line 126
    .line 127
    iget-object v15, v0, LR2/b$b;->a:Landroid/content/Context;

    .line 128
    .line 129
    invoke-direct {v14, v15}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v14, v6}, Landroid/view/SurfaceView;->setCornerRadius(F)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v14, v13}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 136
    .line 137
    .line 138
    iget-object v13, v0, LR2/b$b;->a:Landroid/content/Context;

    .line 139
    .line 140
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 141
    .line 142
    .line 143
    move-result-object v13

    .line 144
    sget v15, Lcom/android/wm/shell/shared/R$string;->manage_windows_icon_text:I

    .line 145
    .line 146
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object v16

    .line 150
    filled-new-array/range {v16 .. v16}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v13, v15, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v14, v1}, Landroid/view/SurfaceView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    new-instance v1, LR2/c;

    .line 162
    .line 163
    invoke-direct {v1, v0, v12}, LR2/c;-><init>(LR2/b$b;I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v14, v1}, Landroid/view/SurfaceView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    .line 168
    .line 169
    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 170
    .line 171
    float-to-int v12, v4

    .line 172
    float-to-int v13, v3

    .line 173
    invoke-direct {v1, v12, v13}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 174
    .line 175
    .line 176
    float-to-int v12, v5

    .line 177
    invoke-virtual {v1, v12}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 178
    .line 179
    .line 180
    iput v12, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 181
    .line 182
    invoke-virtual {v14, v1}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    .line 184
    .line 185
    const/4 v1, 0x3

    .line 186
    if-ge v8, v1, :cond_3

    .line 187
    .line 188
    iget v1, v0, LR2/b$b;->f:I

    .line 189
    .line 190
    add-float v8, v4, v5

    .line 191
    .line 192
    float-to-int v8, v8

    .line 193
    add-int/2addr v1, v8

    .line 194
    iput v1, v0, LR2/b$b;->f:I

    .line 195
    .line 196
    :cond_3
    if-eqz v9, :cond_4

    .line 197
    .line 198
    invoke-virtual {v9, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 199
    .line 200
    .line 201
    :cond_4
    iget-object v1, v0, LR2/b$b;->c:Ljava/util/List;

    .line 202
    .line 203
    invoke-interface {v1, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    invoke-virtual {v14}, Landroid/view/SurfaceView;->requestLayout()V

    .line 207
    .line 208
    .line 209
    if-eqz v9, :cond_5

    .line 210
    .line 211
    new-instance v1, LR2/d;

    .line 212
    .line 213
    invoke-direct {v1, v14, v11}, LR2/d;-><init>(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 217
    .line 218
    .line 219
    :cond_5
    move v8, v10

    .line 220
    const/4 v1, 0x0

    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_6
    iget v1, v0, LR2/b$b;->f:I

    .line 224
    .line 225
    float-to-int v2, v5

    .line 226
    add-int/2addr v1, v2

    .line 227
    iput v1, v0, LR2/b$b;->f:I

    .line 228
    .line 229
    iget v1, v0, LR2/b$b;->e:I

    .line 230
    .line 231
    add-int/2addr v1, v2

    .line 232
    iput v1, v0, LR2/b$b;->e:I

    .line 233
    .line 234
    return-void
.end method

.method public final n()I
    .locals 0

    .line 1
    iget p0, p0, LR2/b$b;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final o()I
    .locals 0

    .line 1
    iget p0, p0, LR2/b$b;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public final p()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, LR2/b$b;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q(Lu4/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Ljava/lang/Integer;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LR2/b$b;->g:Lu4/l;

    .line 2
    .line 3
    return-void
.end method

.method public final r(Lu4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LR2/b$b;->h:Lu4/a;

    .line 2
    .line 3
    return-void
.end method
