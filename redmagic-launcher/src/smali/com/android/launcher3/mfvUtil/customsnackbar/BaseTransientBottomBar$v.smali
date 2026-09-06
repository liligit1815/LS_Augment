.class public Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;
.super Landroid/widget/FrameLayout;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "v"
.end annotation


# static fields
.field private static final n:Landroid/view/View$OnTouchListener;


# instance fields
.field private g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;

.field private h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;

.field private i:I

.field private final j:F

.field private final k:F

.field private l:Landroid/content/res/ColorStateList;

.field private m:Landroid/graphics/PorterDuff$Mode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->n:Landroid/view/View$OnTouchListener;

    .line 7
    .line 8
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p1, p2, v0, v0}, Lu3/a;->c(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v1, Lcom/android/launcher3/x5;->V2:[I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 p2, 0x6

    .line 20
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    int-to-float p2, p2

    .line 31
    invoke-static {p0, p2}, LJ/I;->r0(Landroid/view/View;F)V

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 p2, 0x2

    .line 35
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iput p2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->i:I

    .line 40
    .line 41
    const/4 p2, 0x3

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    .line 43
    .line 44
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iput p2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->j:F

    .line 49
    .line 50
    const/4 p2, 0x1

    .line 51
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->k:F

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 58
    .line 59
    .line 60
    sget-object p1, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->n:Landroid/view/View$OnTouchListener;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-nez p1, :cond_1

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->a()Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p0, p1}, LJ/I;->n0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method private a()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f070907

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->l:Landroid/content/res/ColorStateList;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {v1}, LC/a;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->l:Landroid/content/res/ColorStateList;

    .line 33
    .line 34
    invoke-static {v0, p0}, LC/a;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_0
    invoke-static {v1}, LC/a;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method


# virtual methods
.method getActionTextColorAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->k:F

    .line 2
    .line 3
    return p0
.end method

.method getAnimationMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->i:I

    .line 2
    .line 3
    return p0
.end method

.method getBackgroundOverlayColorAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->j:F

    .line 2
    .line 3
    return p0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;->onViewAttachedToWindow(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-static {p0}, LJ/I;->f0(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;->onViewDetachedFromWindow(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    move-object p1, p0

    .line 10
    move-object p0, v0

    .line 11
    invoke-interface/range {p0 .. p5}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;->a(Landroid/view/View;IIII)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method setAnimationMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->l:Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, LC/a;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->l:Landroid/content/res/ColorStateList;

    .line 16
    .line 17
    invoke-static {p1, v0}, LC/a;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->m:Landroid/graphics/PorterDuff$Mode;

    .line 21
    .line 22
    invoke-static {p1, v0}, LC/a;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->l:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, LC/a;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0, p1}, LC/a;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->m:Landroid/graphics/PorterDuff$Mode;

    .line 25
    .line 26
    invoke-static {v0, p1}, LC/a;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eq v0, p1, :cond_0

    .line 34
    .line 35
    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->m:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, LC/a;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0, p1}, LC/a;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eq v0, p1, :cond_0

    .line 29
    .line 30
    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method setOnAttachStateChangeListener(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$t;

    .line 2
    .line 3
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    sget-object v0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->n:Landroid/view/View$OnTouchListener;

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method setOnLayoutChangeListener(Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$v;->g:Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar$u;

    .line 2
    .line 3
    return-void
.end method
