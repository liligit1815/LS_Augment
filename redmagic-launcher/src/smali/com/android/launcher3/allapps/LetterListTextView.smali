.class public Lcom/android/launcher3/allapps/LetterListTextView;
.super Landroid/widget/TextView;
.source "LetterListTextView.java"


# instance fields
.field private final g:Landroid/graphics/drawable/Drawable;

.field private final h:I

.field private final i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/allapps/LetterListTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/LetterListTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p2, 0x7f080848

    .line 4
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/allapps/LetterListTextView;->g:Landroid/graphics/drawable/Drawable;

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f07030f

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/allapps/LetterListTextView;->h:I

    const p2, 0x7f06044a

    .line 6
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/allapps/LetterListTextView;->i:I

    return-void
.end method

.method private c(IFZ)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->getY()F

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    sub-float/2addr p1, v0

    .line 7
    div-float/2addr p1, p2

    .line 8
    float-to-double p1, p1

    .line 9
    const-wide v0, 0x400921fb54442d18L    # Math.PI

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    mul-double/2addr p1, v0

    .line 15
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    double-to-float p1, p1

    .line 20
    const p2, 0x3fb33333    # 1.4f

    .line 21
    .line 22
    .line 23
    mul-float/2addr p1, p2

    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    invoke-static {p1, v0, p2}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setScaleX(F)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setScaleY(F)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setScaleX(F)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setScaleY(F)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private d(IFZ)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->getY()F

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    sub-float/2addr p1, v0

    .line 7
    div-float/2addr p1, p2

    .line 8
    float-to-double p1, p1

    .line 9
    const-wide v0, 0x400921fb54442d18L    # Math.PI

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    mul-double/2addr p1, v0

    .line 15
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide p1

    .line 19
    double-to-float p1, p1

    .line 20
    const/high16 p2, 0x41f00000    # 30.0f

    .line 21
    .line 22
    mul-float/2addr p1, p2

    .line 23
    const/4 v0, 0x0

    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    const/high16 p3, -0x40800000    # -1.0f

    .line 27
    .line 28
    invoke-static {p1, v0, p2}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    mul-float/2addr p1, p3

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    mul-int/lit8 v0, v0, 0x2

    .line 13
    .line 14
    sub-int v0, p1, v0

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    mul-int/lit8 v1, v1, 0x2

    .line 22
    .line 23
    add-int/2addr v1, p1

    .line 24
    int-to-float v1, v1

    .line 25
    sub-float v2, v1, v0

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/TextView;->getY()F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    cmpg-float v1, v3, v1

    .line 32
    .line 33
    if-gez v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/TextView;->getY()F

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    cmpl-float v0, v1, v0

    .line 40
    .line 41
    if-lez v0, :cond_1

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    :goto_0
    invoke-direct {p0, p1, v2, v0}, Lcom/android/launcher3/allapps/LetterListTextView;->d(IFZ)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, p1, v2, v0}, Lcom/android/launcher3/allapps/LetterListTextView;->c(IFZ)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public b(Lcom/android/launcher3/allapps/M$a;I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setId(I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    const/4 v0, -0x2

    .line 13
    invoke-direct {p1, p2, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$b;-><init>(II)V

    .line 14
    .line 15
    .line 16
    const-string p2, "v,1:1"

    .line 17
    .line 18
    iput-object p2, p1, Landroidx/constraintlayout/widget/ConstraintLayout$b;->I:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allapps/LetterListTextView;->g:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/allapps/LetterListTextView;->i:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setClickable(Z)V

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/android/launcher3/allapps/LetterListTextView;->h:I

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setWidth(I)V

    .line 21
    .line 22
    .line 23
    iget v1, p0, Lcom/android/launcher3/allapps/LetterListTextView;->h:I

    .line 24
    .line 25
    int-to-float v1, v1

    .line 26
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
