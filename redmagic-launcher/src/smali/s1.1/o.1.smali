.class public Ls1/o;
.super Landroid/graphics/drawable/Drawable;
.source "FastBitmapDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/o$b;
    }
.end annotation


# static fields
.field private static final t:Landroid/view/animation/Interpolator;

.field private static final u:Landroid/view/animation/Interpolator;

.field private static final v:Landroid/view/animation/Interpolator;

.field private static w:Z

.field protected static final x:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Ls1/o;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final g:Landroid/graphics/Paint;

.field public final h:Ls1/d;

.field private i:Landroid/graphics/ColorFilter;

.field protected j:Z

.field protected k:Z

.field protected l:Z

.field protected m:F

.field n:I

.field protected o:Landroid/animation/ObjectAnimator;

.field private p:F

.field private q:I

.field private r:Landroid/graphics/drawable/Drawable;

.field private s:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ls1/o;->t:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ls1/o;->u:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 16
    .line 17
    const v1, 0x3dcccccd    # 0.1f

    .line 18
    .line 19
    .line 20
    const/high16 v2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const v3, 0x3d4ccccd    # 0.05f

    .line 23
    .line 24
    .line 25
    const v4, 0x3f333333    # 0.7f

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Ls1/o;->v:Landroid/view/animation/Interpolator;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    sput-boolean v0, Ls1/o;->w:Z

    .line 35
    .line 36
    new-instance v0, Ls1/o$a;

    .line 37
    .line 38
    const-string v1, "scale"

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ls1/o$a;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sput-object v0, Ls1/o;->x:Landroid/util/FloatProperty;

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    move-result-object p1

    invoke-direct {p0, p1}, Ls1/o;-><init>(Ls1/d;)V

    return-void
.end method

.method public constructor <init>(Ls1/d;)V
    .locals 2

    .line 2
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 3
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Ls1/o;->g:Landroid/graphics/Paint;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    iput v0, p0, Ls1/o;->m:F

    const/4 v1, 0x0

    .line 5
    iput v1, p0, Ls1/o;->n:I

    .line 6
    iput v0, p0, Ls1/o;->p:F

    const/16 v0, 0xff

    .line 7
    iput v0, p0, Ls1/o;->q:I

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ls1/o;->s:Z

    .line 9
    iput-object p1, p0, Ls1/o;->h:Ls1/d;

    .line 10
    invoke-virtual {p0, v0}, Ls1/o;->setFilterBitmap(Z)V

    return-void
.end method

.method static bridge synthetic a(Ls1/o;)F
    .locals 0

    .line 1
    iget p0, p0, Ls1/o;->p:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Ls1/o;F)V
    .locals 0

    .line 1
    iput p1, p0, Ls1/o;->p:F

    .line 2
    .line 3
    return-void
.end method

.method protected static final f(I)I
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    add-int/2addr v0, p0

    .line 15
    div-int/lit8 v0, v0, 0x3

    .line 16
    .line 17
    int-to-float p0, v0

    .line 18
    const/high16 v0, 0x3f000000    # 0.5f

    .line 19
    .line 20
    mul-float/2addr p0, v0

    .line 21
    const/16 v0, 0x7f

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    add-float/2addr p0, v0

    .line 25
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const/16 v0, 0xff

    .line 30
    .line 31
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p0, p0, p0}, Landroid/graphics/Color;->rgb(III)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public static g()Landroid/graphics/ColorFilter;
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {v0}, Ls1/o;->h(F)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method private static h(F)Landroid/graphics/ColorFilter;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/ColorMatrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/graphics/ColorMatrix;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/ColorMatrix;->getArray()[F

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    const/high16 v4, 0x3f000000    # 0.5f

    .line 21
    .line 22
    aput v4, v2, v3

    .line 23
    .line 24
    const/4 v3, 0x6

    .line 25
    aput v4, v2, v3

    .line 26
    .line 27
    const/16 v3, 0xc

    .line 28
    .line 29
    aput v4, v2, v3

    .line 30
    .line 31
    const/16 v3, 0x7f

    .line 32
    .line 33
    int-to-float v3, v3

    .line 34
    const/4 v4, 0x4

    .line 35
    aput v3, v2, v4

    .line 36
    .line 37
    const/16 v4, 0x9

    .line 38
    .line 39
    aput v3, v2, v4

    .line 40
    .line 41
    const/16 v4, 0xe

    .line 42
    .line 43
    aput v3, v2, v4

    .line 44
    .line 45
    const/16 v3, 0x12

    .line 46
    .line 47
    aput p0, v2, v3

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/graphics/ColorMatrix;->preConcat(Landroid/graphics/ColorMatrix;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Landroid/graphics/ColorMatrixColorFilter;

    .line 53
    .line 54
    invoke-direct {p0, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method public static p(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ls1/b;->E(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 10
    .line 11
    sub-int v2, v1, v0

    .line 12
    .line 13
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    sub-int v0, p1, v0

    .line 16
    .line 17
    invoke-virtual {p0, v2, v0, v1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static q(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ls1/o;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method private t(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ls1/o;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method protected c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls1/o;->h:Ls1/d;

    .line 2
    .line 3
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-eqz v0, :cond_1

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
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ls1/o;->h:Ls1/d;

    .line 15
    .line 16
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iget-object p0, p0, Ls1/o;->g:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1, p2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    const-string p0, "FastBitmapDrawable"

    .line 26
    .line 27
    const-string p1, "drawInternal: bitmap is null or recycled."

    .line 28
    .line 29
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d()F
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/o;->o:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/high16 p0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget p0, p0, Ls1/o;->p:F

    .line 9
    .line 10
    return p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget v0, p0, Ls1/o;->p:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v2, p0, Ls1/o;->p:F

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/graphics/Rect;->exactCenterX()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v1}, Landroid/graphics/Rect;->exactCenterY()F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {p1, v2, v2, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1, v1}, Ls1/o;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, p1, v0}, Ls1/o;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public e()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAlpha()I
    .locals 0

    .line 1
    iget p0, p0, Ls1/o;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/o;->g:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ls1/o;->m()Ls1/o$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Ls1/o;->l:Z

    .line 6
    .line 7
    iput-boolean v1, v0, Ls1/o$b;->b:Z

    .line 8
    .line 9
    iget-object v1, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ls1/o$b;->a(Ls1/o$b;Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget p0, p0, Ls1/o;->n:I

    .line 21
    .line 22
    iput p0, v0, Ls1/o$b;->d:I

    .line 23
    .line 24
    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/o;->h:Ls1/d;

    .line 2
    .line 3
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/o;->h:Ls1/d;

    .line 2
    .line 3
    iget-object p0, p0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMinimumHeight()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMinimumWidth()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public i()I
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    const/16 v1, 0x8a

    .line 3
    .line 4
    invoke-static {v0, v1}, Ls1/q;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object p0, p0, Ls1/o;->h:Ls1/d;

    .line 9
    .line 10
    iget p0, p0, Ls1/d;->b:I

    .line 11
    .line 12
    invoke-static {v0, p0}, LB/a;->m(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public isStateful()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public j()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ls1/o;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget p0, p0, Ls1/o;->n:I

    .line 9
    .line 10
    and-int/2addr p0, v1

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    return v1
.end method

.method public k(Ls1/d;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/o;->h:Ls1/d;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected m()Ls1/o$b;
    .locals 1

    .line 1
    new-instance v0, Ls1/o$b;

    .line 2
    .line 3
    iget-object p0, p0, Ls1/o;->h:Ls1/d;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ls1/o$b;-><init>(Ls1/d;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/o;->o:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ls1/o;->o:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v0, p0, Ls1/o;->p:F

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public o(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-direct {p0, p1}, Ls1/o;->t(Landroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ls1/o;->u()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ls1/o;->t(Landroid/graphics/Rect;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onStateChange([I)Z
    .locals 7

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    const/4 v4, 0x1

    .line 6
    if-ge v2, v0, :cond_2

    .line 7
    .line 8
    aget v5, p1, v2

    .line 9
    .line 10
    const v6, 0x10100a7

    .line 11
    .line 12
    .line 13
    if-ne v5, v6, :cond_0

    .line 14
    .line 15
    move p1, v4

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    sget-boolean v6, Ls1/o;->w:Z

    .line 18
    .line 19
    if-eqz v6, :cond_1

    .line 20
    .line 21
    const v6, 0x1010367

    .line 22
    .line 23
    .line 24
    if-ne v5, v6, :cond_1

    .line 25
    .line 26
    iget-boolean v5, p0, Ls1/o;->s:Z

    .line 27
    .line 28
    if-eqz v5, :cond_1

    .line 29
    .line 30
    move v3, v4

    .line 31
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    move p1, v1

    .line 35
    :goto_1
    iget-boolean v0, p0, Ls1/o;->j:Z

    .line 36
    .line 37
    if-ne v0, p1, :cond_4

    .line 38
    .line 39
    iget-boolean p0, p0, Ls1/o;->k:Z

    .line 40
    .line 41
    if-eq p0, v3, :cond_3

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_3
    return v1

    .line 45
    :cond_4
    :goto_2
    return v4
.end method

.method public r(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls1/o;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public s(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ls1/o;->l:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Ls1/o;->l:Z

    .line 6
    .line 7
    iget-object v0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    instance-of v1, v0, Ls1/o;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    check-cast v0, Ls1/o;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ls1/o;->s(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Ls1/o;->u()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget v0, p0, Ls1/o;->q:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ls1/o;->q:I

    .line 6
    .line 7
    iget-object v0, p0, Ls1/o;->g:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ls1/o;->i:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls1/o;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFilterBitmap(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/o;->g:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ls1/o;->g:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ls1/o;->g:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-boolean v1, p0, Ls1/o;->l:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget v1, p0, Ls1/o;->m:F

    .line 8
    .line 9
    invoke-static {v1}, Ls1/o;->h(F)Landroid/graphics/ColorFilter;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Ls1/o;->i:Landroid/graphics/ColorFilter;

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ls1/o;->r:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ls1/o;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
