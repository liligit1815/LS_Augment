.class public Lcom/android/launcher3/menu/k;
.super Landroid/widget/FrameLayout;
.source "MenuItemViewEffect.java"

# interfaces
.implements Lcom/android/launcher3/menu/MenuScroller$b;


# instance fields
.field private g:Z

.field private h:Ljava/lang/String;

.field private i:Landroid/graphics/drawable/Drawable;

.field private j:Landroid/widget/Button;

.field private k:Landroid/widget/TextView;

.field l:Landroid/widget/LinearLayout$LayoutParams;

.field m:Landroid/widget/LinearLayout$LayoutParams;

.field public final n:I

.field private o:Z

.field private p:Landroid/animation/ObjectAnimator;

.field private q:Landroid/animation/TimeInterpolator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/menu/k;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/menu/k;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 4
    iput-boolean p2, p0, Lcom/android/launcher3/menu/k;->o:Z

    const/4 p3, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x3e800000    # 0.25f

    const v2, 0x3f0ccccd    # 0.55f

    .line 5
    invoke-static {v1, v2, p3, v0}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/menu/k;->q:Landroid/animation/TimeInterpolator;

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p3, v0, p2}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 7
    iput-boolean p2, p0, Lcom/android/launcher3/menu/k;->g:Z

    const p3, 0x7f04049b

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    move-result v0

    invoke-static {p1, p3, v0}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/menu/k;->i:Landroid/graphics/drawable/Drawable;

    .line 9
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    const v0, 0x7f0e0147

    const/4 v1, 0x1

    invoke-virtual {p3, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const p3, 0x7f0b0617

    .line 10
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    iput-object p3, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    const p3, 0x7f0b0137

    .line 11
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/Button;

    iput-object p3, p0, Lcom/android/launcher3/menu/k;->j:Landroid/widget/Button;

    .line 12
    invoke-virtual {p3}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Landroid/widget/LinearLayout$LayoutParams;

    iput-object p3, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    .line 13
    iget-object p3, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Landroid/widget/LinearLayout$LayoutParams;

    iput-object p3, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    .line 14
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p1

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p1, p3}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    move-result p3

    if-eqz p3, :cond_0

    .line 16
    iget-object p3, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0702f4

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 17
    iget-object p3, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0702f9

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    goto :goto_0

    .line 18
    :cond_0
    iget-object p3, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0702f2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 19
    iget-object p3, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0702f8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 20
    :goto_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result p3

    const/4 v0, -0x2

    if-eqz p3, :cond_7

    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    iget-boolean v1, p1, Lcom/android/launcher3/h0;->N0:Z

    if-eqz v1, :cond_1

    const v1, 0x7f0706e6

    goto :goto_1

    .line 22
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-static {v1}, Lcom/android/launcher3/N5;->z(Landroid/util/DisplayMetrics;)Z

    move-result v1

    if-eqz v1, :cond_2

    const v1, 0x7f0706e5

    goto :goto_1

    :cond_2
    const v1, 0x7f0706e4

    .line 23
    :goto_1
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-boolean v2, p1, Lcom/android/launcher3/h0;->N0:Z

    if-eqz v2, :cond_3

    const v2, 0x7f0c00bd

    goto :goto_2

    :cond_3
    const v2, 0x7f0c00bc

    :goto_2
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v1}, Lcom/android/launcher3/N5;->T(F)I

    move-result v1

    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-boolean v3, p1, Lcom/android/launcher3/h0;->N0:Z

    if-eqz v3, :cond_4

    const v3, 0x7f0c00bb

    goto :goto_3

    :cond_4
    const v3, 0x7f0c00ba

    :goto_3
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v2}, Lcom/android/launcher3/N5;->T(F)I

    move-result v2

    .line 26
    invoke-virtual {p0, p3, v1, p3, v2}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 27
    iget-object p3, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-boolean v2, p1, Lcom/android/launcher3/h0;->N0:Z

    const v3, 0x7f0706de

    const v4, 0x7f0706e0

    if-eqz v2, :cond_5

    move v2, v4

    goto :goto_4

    :cond_5
    move v2, v3

    :goto_4
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 28
    iget-object p3, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    if-eqz p1, :cond_6

    move v3, v4

    :cond_6
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 29
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 30
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f0706db

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 31
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 32
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f0702fa

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 33
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 34
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f0c00b9

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p3

    int-to-float p3, p3

    const/4 v1, 0x2

    invoke-virtual {p1, v1, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 35
    :cond_7
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 36
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f0706e1

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 37
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f0706df

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 38
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 39
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0706dc

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 41
    :cond_8
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->j:Landroid/widget/Button;

    iget-object p2, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->j:Landroid/widget/Button;

    iget-object p2, p0, Lcom/android/launcher3/menu/k;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {p1}, Lcom/android/launcher3/N5;->A(Landroid/util/DisplayMetrics;)Z

    move-result p1

    if-eqz p1, :cond_9

    sget-object p1, Lx1/g;->b:Ljava/lang/String;

    invoke-static {}, Lx1/g;->a()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 45
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0702f7

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 46
    :cond_9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0601de

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/menu/k;->n:I

    .line 47
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p1

    iget-boolean p1, p1, Lcom/android/launcher3/r4;->d0:Z

    iput-boolean p1, p0, Lcom/android/launcher3/menu/k;->o:Z

    .line 48
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    move-result p1

    if-nez p1, :cond_a

    .line 49
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    new-instance p2, Lcom/android/launcher3/menu/k$a;

    invoke-direct {p2, p0}, Lcom/android/launcher3/menu/k$a;-><init>(Lcom/android/launcher3/menu/k;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_a
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/menu/k;)Landroid/widget/Button;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->j:Landroid/widget/Button;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/menu/k;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method private c(Z)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->p:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/k;->d(Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/menu/k;->p:Landroid/animation/ObjectAnimator;

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->i:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    new-array v0, v0, [F

    .line 16
    .line 17
    fill-array-data v0, :array_0

    .line 18
    .line 19
    .line 20
    const-string v1, "alpha"

    .line 21
    .line 22
    invoke-static {p1, v1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/android/launcher3/menu/k;->p:Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    const-wide/16 v0, 0x3e8

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->p:Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->q:Landroid/animation/TimeInterpolator;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->p:Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    new-instance v0, Lcom/android/launcher3/menu/k$b;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Lcom/android/launcher3/menu/k$b;-><init>(Lcom/android/launcher3/menu/k;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->p:Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x437f0000    # 255.0f
    .end array-data
.end method

.method private d(Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method


# virtual methods
.method public e(I)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/k;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/menu/k;->n:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const v3, 0x7f04049d

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const v2, 0x7f04049b

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/android/launcher3/menu/k;->i:Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/launcher3/menu/k;->j:Landroid/widget/Button;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    const/4 v0, -0x1

    .line 64
    if-ne v0, p1, :cond_1

    .line 65
    .line 66
    iget-object v1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const v3, 0x7f060831

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 83
    .line 84
    if-ne v0, p1, :cond_2

    .line 85
    .line 86
    const/4 p1, 0x1

    .line 87
    goto :goto_1

    .line 88
    :cond_2
    const/4 p1, 0x0

    .line 89
    :goto_1
    invoke-static {p0, p1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public getEffectName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getIsSelected()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/menu/k;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public getItemId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    .line 28
    .line 29
    const/4 v1, 0x7

    .line 30
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 31
    .line 32
    iget-boolean v1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    const v3, 0x7f0706dd

    .line 36
    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move v1, v2

    .line 50
    :goto_0
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    .line 53
    .line 54
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    :cond_2
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->j:Landroid/widget/Button;

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->l:Landroid/widget/LinearLayout$LayoutParams;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->m:Landroid/widget/LinearLayout$LayoutParams;

    .line 78
    .line 79
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setForeImg(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->j:Landroid/widget/Button;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIsSelected(Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/menu/k;->g:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/menu/k;->g:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setSelected(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/k;->c(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/menu/k;->o:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 18
    .line 19
    iget p0, p0, Lcom/android/launcher3/menu/k;->n:I

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const v3, 0x7f04049e

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-static {v2}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    const v3, 0x7f04049d

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    :goto_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    const/4 v2, -0x1

    .line 91
    if-ne v2, v1, :cond_3

    .line 92
    .line 93
    if-nez p1, :cond_3

    .line 94
    .line 95
    iget-object p1, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const v3, 0x7f060831

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-ne v2, p1, :cond_4

    .line 118
    .line 119
    const/4 p1, 0x1

    .line 120
    goto :goto_1

    .line 121
    :cond_4
    const/4 p1, 0x0

    .line 122
    :goto_1
    invoke-static {p0, p1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 123
    .line 124
    .line 125
    :cond_5
    return-void
.end method

.method public setItemId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/k;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTitleText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/k;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
