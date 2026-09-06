.class Ls1/j$c;
.super Ls1/o;
.source "ClockDrawableWrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/j$c$a;
    }
.end annotation


# instance fields
.field private final A:Ls1/j$a;

.field private final B:Landroid/graphics/Bitmap;

.field private final C:Landroid/graphics/Paint;

.field private final D:Landroid/graphics/ColorFilter;

.field private final E:I

.field private final F:Landroid/graphics/drawable/AdaptiveIconDrawable;

.field private final G:Landroid/graphics/drawable/LayerDrawable;

.field private final H:F

.field private final y:Ljava/util/Calendar;

.field private final z:F


# direct methods
.method constructor <init>(Ls1/j$c$a;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ls1/o$b;->a:Ls1/d;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ls1/o;-><init>(Ls1/d;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ls1/j$c;->y:Ljava/util/Calendar;

    .line 11
    .line 12
    new-instance v1, Landroid/graphics/Paint;

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ls1/j$c;->C:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-static {p1}, Ls1/j$c$a;->g(Ls1/j$c$a;)F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iput v2, p0, Ls1/j$c;->z:F

    .line 25
    .line 26
    invoke-static {p1}, Ls1/j$c$a;->d(Ls1/j$c$a;)Ls1/j$a;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iput-object v3, p0, Ls1/j$c;->A:Ls1/j$a;

    .line 31
    .line 32
    invoke-static {p1}, Ls1/j$c$a;->e(Ls1/j$c$a;)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iput-object v4, p0, Ls1/j$c;->B:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    invoke-static {p1}, Ls1/j$c$a;->f(Ls1/j$c$a;)Landroid/graphics/ColorFilter;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iput-object v4, p0, Ls1/j$c;->D:Landroid/graphics/ColorFilter;

    .line 43
    .line 44
    invoke-static {p1}, Ls1/j$c$a;->f(Ls1/j$c$a;)Landroid/graphics/ColorFilter;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Ls1/j$c$a;->h(Ls1/j$c$a;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Ls1/j$c;->E:I

    .line 56
    .line 57
    iget-object p1, v3, Ls1/j$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 68
    .line 69
    iput-object p1, p0, Ls1/j$c;->F:Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 76
    .line 77
    iput-object p1, p0, Ls1/j$c;->G:Landroid/graphics/drawable/LayerDrawable;

    .line 78
    .line 79
    invoke-virtual {v3, v0, p1}, Ls1/j$a;->a(Ljava/util/Calendar;Landroid/graphics/drawable/LayerDrawable;)Z

    .line 80
    .line 81
    .line 82
    const/high16 p1, 0x40000000    # 2.0f

    .line 83
    .line 84
    mul-float/2addr v2, p1

    .line 85
    const/high16 p1, 0x3f800000    # 1.0f

    .line 86
    .line 87
    sub-float/2addr p1, v2

    .line 88
    iput p1, p0, Ls1/j$c;->H:F

    .line 89
    .line 90
    return-void
.end method

.method private v()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p0}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sget-wide v2, Ls1/j;->j:J

    .line 16
    .line 17
    rem-long v4, v0, v2

    .line 18
    .line 19
    sub-long/2addr v0, v4

    .line 20
    add-long/2addr v0, v2

    .line 21
    invoke-virtual {p0, p0, v0, v1}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/j$c;->A:Ls1/j$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Ls1/o;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ls1/j$c;->B:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iget-object v2, p0, Ls1/j$c;->C:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1, p2, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ls1/j$c;->A:Ls1/j$a;

    .line 18
    .line 19
    iget-object v1, p0, Ls1/j$c;->y:Ljava/util/Calendar;

    .line 20
    .line 21
    iget-object v2, p0, Ls1/j$c;->G:Landroid/graphics/drawable/LayerDrawable;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ls1/j$a;->a(Ljava/util/Calendar;Landroid/graphics/drawable/LayerDrawable;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 31
    .line 32
    int-to-float v1, v1

    .line 33
    iget v2, p2, Landroid/graphics/Rect;->top:I

    .line 34
    .line 35
    int-to-float v2, v2

    .line 36
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 37
    .line 38
    .line 39
    iget v1, p0, Ls1/j$c;->H:F

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    div-int/lit8 v2, v2, 0x2

    .line 46
    .line 47
    int-to-float v2, v2

    .line 48
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    div-int/lit8 p2, p2, 0x2

    .line 53
    .line 54
    int-to-float p2, p2

    .line 55
    invoke-virtual {p1, v1, v1, v2, p2}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ls1/j$c;->F:Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getIconMask()Landroid/graphics/Path;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Ls1/j$c;->G:Landroid/graphics/drawable/LayerDrawable;

    .line 68
    .line 69
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Ls1/j$c;->v()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public i()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ls1/j$c;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ls1/j$c;->E:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0}, Ls1/o;->i()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/j$c;->C:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public m()Ls1/o$b;
    .locals 7

    .line 1
    new-instance v0, Ls1/j$c$a;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/o;->h:Ls1/d;

    .line 4
    .line 5
    iget v2, p0, Ls1/j$c;->E:I

    .line 6
    .line 7
    iget v3, p0, Ls1/j$c;->z:F

    .line 8
    .line 9
    iget-object v4, p0, Ls1/j$c;->A:Ls1/j$a;

    .line 10
    .line 11
    iget-object v5, p0, Ls1/j$c;->B:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    iget-object p0, p0, Ls1/j$c;->C:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    invoke-direct/range {v0 .. v6}, Ls1/j$c$a;-><init>(Ls1/d;IFLs1/j$a;Landroid/graphics/Bitmap;Landroid/graphics/ColorFilter;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ls1/o;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ls1/j$c;->F:Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v1, v1, v0, p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->setBounds(IIII)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/j$c;->A:Ls1/j$a;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/j$c;->y:Ljava/util/Calendar;

    .line 4
    .line 5
    iget-object v2, p0, Ls1/j$c;->G:Landroid/graphics/drawable/LayerDrawable;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ls1/j$a;->a(Ljava/util/Calendar;Landroid/graphics/drawable/LayerDrawable;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-direct {p0}, Ls1/j$c;->v()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ls1/o;->setAlpha(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ls1/j$c;->C:Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ls1/j$c;->G:Landroid/graphics/drawable/LayerDrawable;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setAlpha(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setVisible(ZZ)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ls1/j$c;->v()V

    .line 8
    .line 9
    .line 10
    return p2

    .line 11
    :cond_0
    invoke-virtual {p0, p0}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return p2
.end method

.method protected u()V
    .locals 2

    .line 1
    invoke-super {p0}, Ls1/o;->u()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ls1/o;->l:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Ls1/o;->m:F

    .line 9
    .line 10
    const/high16 v1, 0x437f0000    # 255.0f

    .line 11
    .line 12
    mul-float/2addr v0, v1

    .line 13
    float-to-int v0, v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/16 v0, 0xff

    .line 16
    .line 17
    :goto_0
    invoke-virtual {p0, v0}, Ls1/j$c;->setAlpha(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ls1/j$c;->C:Landroid/graphics/Paint;

    .line 21
    .line 22
    iget-boolean v1, p0, Ls1/o;->l:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ls1/o;->g()Landroid/graphics/ColorFilter;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    iget-object v1, p0, Ls1/j$c;->D:Landroid/graphics/ColorFilter;

    .line 32
    .line 33
    :goto_1
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ls1/j$c;->G:Landroid/graphics/drawable/LayerDrawable;

    .line 37
    .line 38
    iget-boolean p0, p0, Ls1/o;->l:Z

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    invoke-static {}, Ls1/o;->g()Landroid/graphics/ColorFilter;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    const/4 p0, 0x0

    .line 48
    :goto_2
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/LayerDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
