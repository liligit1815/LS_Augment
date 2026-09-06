.class public Lcom/android/launcher3/taskbar/bubbles/BubbleView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "BubbleView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;
    }
.end annotation


# instance fields
.field private final g:Landroid/widget/ImageView;

.field private final h:Landroid/widget/ImageView;

.field private i:I

.field private j:F

.field private k:F

.field private l:Ls1/m;

.field private m:Ls1/m$a;

.field private n:I

.field private o:Landroid/graphics/Rect;

.field private p:Z

.field private q:F

.field private r:F

.field private s:Z

.field private t:Z

.field private u:Lcom/android/launcher3/taskbar/bubbles/u;

.field private v:Z

.field private w:Landroid/graphics/Bitmap;

.field private x:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private y:Lcom/android/launcher3/taskbar/bubbles/c;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->o:Landroid/graphics/Rect;

    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->s:Z

    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->t:Z

    const/4 p3, 0x0

    .line 7
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y:Lcom/android/launcher3/taskbar/bubbles/c;

    .line 8
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setLayoutDirection(I)V

    .line 9
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p3, 0x7f0e007f

    invoke-virtual {p1, p3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0b0313

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->g:Landroid/widget/ImageView;

    const p1, 0x7f0b00dc

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 12
    new-instance p1, Ls1/m$a;

    invoke-direct {p1}, Ls1/m$a;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->m:Ls1/m$a;

    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setFocusable(Z)V

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClickable(Z)V

    .line 15
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setOutlineAmbientShadowColor(I)V

    .line 16
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setOutlineSpotShadowColor(I)V

    return-void
.end method

.method private B()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->w:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y:Lcom/android/launcher3/taskbar/bubbles/c;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v1, v2, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y:Lcom/android/launcher3/taskbar/bubbles/c;

    .line 19
    .line 20
    const/high16 v2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/bubbles/c;->m0(Landroid/graphics/drawable/Drawable;F)Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->g:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private C()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->i:I

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->i:I

    .line 19
    .line 20
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/c;

    .line 21
    .line 22
    iget-object v1, p0, Landroid/view/ViewGroup;->mContext:Landroid/content/Context;

    .line 23
    .line 24
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->i:I

    .line 25
    .line 26
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/taskbar/bubbles/c;-><init>(Landroid/content/Context;I)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y:Lcom/android/launcher3/taskbar/bubbles/c;

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->B()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    instance-of v1, v0, Lcom/android/launcher3/taskbar/bubbles/x;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/b;->e()Landroid/graphics/Path;

    .line 46
    .line 47
    .line 48
    new-instance v0, Ls1/m;

    .line 49
    .line 50
    invoke-direct {v0}, Ls1/m;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->l:Ls1/m;

    .line 54
    .line 55
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/BubbleView;ZLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->r(ZLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->s(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j(F)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->m()Z

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-wide/16 v0, 0xc8

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, LM2/a;->e:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private k(F)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->r:F

    .line 2
    .line 3
    invoke-static {v0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v1

    .line 14
    :goto_0
    iget-boolean v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->p:Z

    .line 15
    .line 16
    if-eqz v3, :cond_1

    .line 17
    .line 18
    iget v3, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->q:F

    .line 19
    .line 20
    cmpl-float v3, v3, p1

    .line 21
    .line 22
    if-eqz v3, :cond_2

    .line 23
    .line 24
    :cond_1
    if-nez v0, :cond_3

    .line 25
    .line 26
    :cond_2
    return-void

    .line 27
    :cond_3
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->p:Z

    .line 28
    .line 29
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->q:F

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    cmpl-float p1, p1, v0

    .line 33
    .line 34
    if-lez p1, :cond_4

    .line 35
    .line 36
    move v1, v2

    .line 37
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->clearAnimation()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-wide/16 v2, 0xc8

    .line 45
    .line 46
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object v0, LM2/a;->e:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/B0;

    .line 57
    .line 58
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/taskbar/bubbles/B0;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/C0;

    .line 66
    .line 67
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/taskbar/bubbles/C0;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Z)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->j:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->k:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageView;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

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

.method private synthetic r(ZLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    sub-float p2, p1, p2

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setDotScale(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic s(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setDotScale(F)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->p:Z

    .line 12
    .line 13
    return-void
.end method

.method private setDotScale(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->v()Z

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
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->r:F

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private v()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->p:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method


# virtual methods
.method public A(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->s:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->y(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public D(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v0, 0x0

    .line 16
    :goto_0
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->k(F)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->r:F

    .line 23
    .line 24
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->q:F

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->v()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->o:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->m:Ls1/m$a;

    .line 17
    .line 18
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n:I

    .line 19
    .line 20
    iput v1, v0, Ls1/m$a;->a:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->o:Landroid/graphics/Rect;

    .line 23
    .line 24
    iput-object v1, v0, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->t:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Ls1/m$a;->e:Z

    .line 29
    .line 30
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->r:F

    .line 31
    .line 32
    iput v1, v0, Ls1/m$a;->d:F

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->l:Ls1/m;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->m:Ls1/m$a;

    .line 41
    .line 42
    invoke-virtual {v0, v1, p1, p0}, Ls1/m;->a(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public getBubble()Lcom/android/launcher3/taskbar/bubbles/u;
    .locals 0
    .annotation build Landroid/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDotCenter()Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->o:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->o:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    mul-float/2addr v0, v1

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->o:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-float p0, p0

    .line 23
    mul-float/2addr p0, v1

    .line 24
    new-instance v1, Landroid/graphics/PointF;

    .line 25
    .line 26
    invoke-direct {v1, v0, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 27
    .line 28
    .line 29
    return-object v1
.end method

.method public getDotColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public getDragTranslationX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->j:F

    .line 2
    .line 3
    return p0
.end method

.method n()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/b;->h()LN2/k;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, LN2/k;->u()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->j(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoInternal(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfoInternal(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x80000

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 10
    .line 11
    instance-of v0, v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/high16 v0, 0x100000

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->x:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;->c()LN2/h;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isLayoutRtl()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, LN2/h;->e(Z)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const v1, 0x7f1400d5

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const v1, 0x7f0b0058

    .line 52
    .line 53
    .line 54
    invoke-direct {v0, v1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    new-instance v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const v1, 0x7f1400d4

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const v1, 0x7f0b0057

    .line 75
    .line 76
    .line 77
    invoke-direct {v0, v1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->C()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method p()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->k(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public performAccessibilityActionInternal(ILandroid/os/Bundle;)Z
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->performAccessibilityActionInternal(ILandroid/os/Bundle;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/high16 p2, 0x80000

    .line 10
    .line 11
    if-ne p1, p2, :cond_2

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->x:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;->b()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return v0

    .line 21
    :cond_2
    const/high16 p2, 0x100000

    .line 22
    .line 23
    if-ne p1, p2, :cond_4

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->x:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 26
    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    invoke-interface {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;->d(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 30
    .line 31
    .line 32
    :cond_3
    return v0

    .line 33
    :cond_4
    const p2, 0x7f0b0057

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x5

    .line 37
    if-ne p1, p2, :cond_5

    .line 38
    .line 39
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->x:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 40
    .line 41
    if-eqz p2, :cond_5

    .line 42
    .line 43
    sget-object v1, LN2/h;->i:LN2/h;

    .line 44
    .line 45
    invoke-interface {p2, v1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;->a(LN2/h;I)V

    .line 46
    .line 47
    .line 48
    :cond_5
    const p2, 0x7f0b0058

    .line 49
    .line 50
    .line 51
    if-ne p1, p2, :cond_6

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->x:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 54
    .line 55
    if-eqz p0, :cond_6

    .line 56
    .line 57
    sget-object p1, LN2/h;->j:LN2/h;

    .line 58
    .line 59
    invoke-interface {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;->a(LN2/h;I)V

    .line 60
    .line 61
    .line 62
    :cond_6
    const/4 p0, 0x0

    .line 63
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method setBadgeScale(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setBubble(Lcom/android/launcher3/taskbar/bubbles/b;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->g()Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->w:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->B()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->h()LN2/k;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, LN2/k;->w()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->c()Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 33
    .line 34
    const/16 v1, 0x8

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->d()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n:I

    .line 44
    .line 45
    new-instance v0, Ls1/m;

    .line 46
    .line 47
    invoke-direct {v0}, Ls1/m;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->l:Ls1/m;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->h()LN2/k;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, LN2/k;->q()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const v1, 0x7f1400d7

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->h()LN2/k;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, LN2/k;->a()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const v2, 0x7f1400d6

    .line 96
    .line 97
    .line 98
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {v1, v2, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    :cond_2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V
    .locals 0
    .param p1    # Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->x:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 2
    .line 3
    return-void
.end method

.method public setDragTranslationX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->j:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOffsetX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->k:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/b;->h()LN2/k;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, LN2/k;->b()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    or-int/lit8 v1, v1, 0x2

    .line 18
    .line 19
    invoke-virtual {v0, v1}, LN2/k;->v(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->p()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "null"

    .line 11
    .line 12
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "BubbleView{"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "}"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public u(Lcom/android/launcher3/taskbar/bubbles/x;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->u:Lcom/android/launcher3/taskbar/bubbles/u;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->v:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->w:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->B()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->h:Landroid/widget/ImageView;

    .line 12
    .line 13
    const/16 p2, 0x8

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const p2, 0x7f1400d9

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method w()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->j(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method x(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n()Z

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
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setDotScale(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method y(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->s:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->k(F)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setDotScale(F)V

    .line 21
    .line 22
    .line 23
    :cond_2
    :goto_0
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->s:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setDotScale(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
