.class public Lcom/zte/mifavor/widget/RippleDrawableZTE;
.super Landroid/graphics/drawable/LayerDrawable;
.source "RippleDrawableZTE.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/RippleDrawableZTE$c;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final POST_DURATION:I = 0xb4

.field private static final PRE_DURATION:I = 0xb4


# instance fields
.field private final TAG:Ljava/lang/String;

.field fastEaseInterpolator:Landroid/view/animation/PathInterpolator;

.field private mCircleX:I

.field private mCircleY:I

.field private mClickTime:J

.field private mIsInited:Z

.field private mIsMonkey:Z

.field private mIsPressed:Z

.field private mOrigAlpha:I

.field private mPaint:Landroid/graphics/Paint;

.field private mRadius:I

.field private mRippleEnterAnim:Landroid/animation/ObjectAnimator;

.field private mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

.field private mStringID:Ljava/lang/String;

.field private mUnclickTime:J

.field private valueAnimatorExit:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v2, v1

    invoke-direct {p0, v2}, Lcom/zte/mifavor/widget/RippleDrawableZTE;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "] "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mStringID:Ljava/lang/String;

    .line 4
    :cond_0
    invoke-static {}, Lcom/zte/mifavor/widget/u;->s()Z

    move-result v0

    iput-boolean v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsMonkey:Z

    return-void
.end method

.method public constructor <init>([Landroid/graphics/drawable/Drawable;)V
    .locals 4

    .line 5
    invoke-direct {p0, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 6
    const-string p1, "RippleDrawableZTE"

    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->TAG:Ljava/lang/String;

    .line 7
    new-instance p1, Landroid/view/animation/PathInterpolator;

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3e800000    # 0.25f

    const v3, 0x3f0ccccd    # 0.55f

    invoke-direct {p1, v2, v3, v0, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->fastEaseInterpolator:Landroid/view/animation/PathInterpolator;

    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsPressed:Z

    .line 9
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsInited:Z

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mStringID:Ljava/lang/String;

    .line 11
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsMonkey:Z

    .line 12
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 13
    new-instance p1, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    const/4 v0, 0x0

    invoke-super {p0}, Landroid/graphics/drawable/LayerDrawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    invoke-direct {p1, p0, v0, v1}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;-><init>(Lcom/zte/mifavor/widget/RippleDrawableZTE;Lcom/zte/mifavor/widget/RippleDrawableZTE$c;Landroid/graphics/drawable/Drawable$ConstantState;)V

    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsPressed:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/RippleDrawableZTE;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mOrigAlpha:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    return-object p0
.end method

.method private createRippleEnterAnim()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-double v0, v0

    .line 8
    const-wide v2, 0x3fe4cccccccccccdL    # 0.65

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    mul-double/2addr v0, v2

    .line 14
    double-to-int v0, v0

    .line 15
    iget-object v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    filled-new-array {v0, v1}, [I

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "radius"

    .line 26
    .line 27
    invoke-static {p0, v1, v0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mRippleEnterAnim:Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->fastEaseInterpolator:Landroid/view/animation/PathInterpolator;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mRippleEnterAnim:Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    const-wide/16 v1, 0xb4

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mRippleEnterAnim:Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    new-instance v1, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE$a;-><init>(Lcom/zte/mifavor/widget/RippleDrawableZTE;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mStringID:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p0, "create Ripple Enter Anim warning. mRipple Enter Anim is null."

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v0, "RippleDrawableZTE"

    .line 78
    .line 79
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private createRippleExitAnim(I)V
    .locals 2

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const/16 v0, 0xff

    .line 4
    .line 5
    if-le p1, v0, :cond_1

    .line 6
    .line 7
    :cond_0
    iget p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mOrigAlpha:I

    .line 8
    .line 9
    :cond_1
    const/4 v0, 0x0

    .line 10
    filled-new-array {p1, v0}, [I

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    const-wide/16 v0, 0xb4

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    new-instance v0, Lcom/zte/mifavor/widget/RippleDrawableZTE$b;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE$b;-><init>(Lcom/zte/mifavor/widget/RippleDrawableZTE;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mStringID:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p0, "+++++++++++ create Ripple Exit Anim warnning. value Animator Exit is null. "

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "RippleDrawableZTE"

    .line 68
    .line 69
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Lcom/zte/mifavor/widget/RippleDrawableZTE$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 2
    .line 3
    return-object p0
.end method

.method private dp2px(I)I
    .locals 1

    .line 1
    int-to-float p0, p1

    .line 2
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0, p0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    float-to-int p0, p0

    .line 16
    return p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mStringID:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/RippleDrawableZTE;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/RippleDrawableZTE;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsPressed:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/RippleDrawableZTE;Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/RippleDrawableZTE;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method private isEnterAnimRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mRippleEnterAnim:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private isExitAnimatorRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method static bridge synthetic j(Lcom/zte/mifavor/widget/RippleDrawableZTE;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->createRippleExitAnim(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private obtainAttributesZTE(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p3, p4}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p2, p3, p4, p0, p0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsMonkey:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mCircleX:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    iget v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mCircleY:I

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    iget v2, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mRadius:I

    .line 16
    .line 17
    int-to-float v2, v2

    .line 18
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object v0, LR3/m;->g3:[I

    .line 2
    .line 3
    invoke-direct {p0, p1, p4, p3, v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->obtainAttributesZTE(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, LR3/m;->h3:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v2, v1}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->c(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;Landroid/content/res/ColorStateList;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 26
    .line 27
    const/high16 v2, 0x1a000000

    .line 28
    .line 29
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->c(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;Landroid/content/res/ColorStateList;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 37
    .line 38
    sget v2, LR3/m;->i3:I

    .line 39
    .line 40
    const/16 v3, 0x18

    .line 41
    .line 42
    invoke-direct {p0, v3}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->dp2px(I)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-static {v1, v2}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->d(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 54
    .line 55
    .line 56
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/LayerDrawable;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public initAnim()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->a(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)Landroid/content/res/ColorStateList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->getState()[I

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/high16 v2, 0x1a000000

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mOrigAlpha:I

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->createRippleEnterAnim()V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsInited:Z

    .line 40
    .line 41
    return-void
.end method

.method public isProjected()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public isStateful()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/graphics/drawable/LayerDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/graphics/drawable/LayerDrawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 11
    .line 12
    invoke-direct {v1, p0, v2, v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;-><init>(Lcom/zte/mifavor/widget/RippleDrawableZTE;Lcom/zte/mifavor/widget/RippleDrawableZTE$c;Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 16
    .line 17
    return-object p0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mCircleX:I

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mCircleY:I

    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->b(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, -0x1

    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mState:Lcom/zte/mifavor/widget/RippleDrawableZTE$c;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    mul-int/2addr v1, v2

    .line 36
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    mul-int/2addr v2, p1

    .line 45
    add-int/2addr v1, v2

    .line 46
    int-to-double v1, v1

    .line 47
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    double-to-int p1, v1

    .line 52
    invoke-static {v0, p1}, Lcom/zte/mifavor/widget/RippleDrawableZTE$c;->d(Lcom/zte/mifavor/widget/RippleDrawableZTE$c;I)V

    .line 53
    .line 54
    .line 55
    :cond_0
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->initAnim()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method protected onStateChange([I)Z
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsMonkey:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->onStateChange([I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    array-length v0, p1

    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    move v3, v2

    .line 14
    move v4, v3

    .line 15
    :goto_0
    const/4 v5, 0x1

    .line 16
    if-ge v2, v0, :cond_3

    .line 17
    .line 18
    aget v6, p1, v2

    .line 19
    .line 20
    const v7, 0x101009e

    .line 21
    .line 22
    .line 23
    if-ne v6, v7, :cond_1

    .line 24
    .line 25
    move v3, v5

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const v7, 0x10100a7

    .line 28
    .line 29
    .line 30
    if-ne v6, v7, :cond_2

    .line 31
    .line 32
    move v4, v5

    .line 33
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    if-eqz v3, :cond_7

    .line 37
    .line 38
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsPressed:Z

    .line 39
    .line 40
    if-eqz v0, :cond_7

    .line 41
    .line 42
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v6

    .line 46
    iput-wide v6, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mUnclickTime:J

    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsPressed:Z

    .line 49
    .line 50
    iget-wide v8, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mClickTime:J

    .line 51
    .line 52
    sub-long/2addr v6, v8

    .line 53
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    if-eqz v0, :cond_7

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->isExitAnimatorRunning()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->onStateChange([I)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_4
    const-wide/16 v8, 0xb4

    .line 69
    .line 70
    cmp-long v0, v6, v8

    .line 71
    .line 72
    if-lez v0, :cond_5

    .line 73
    .line 74
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_5
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-ltz v0, :cond_6

    .line 87
    .line 88
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->valueAnimatorExit:Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v6, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mStringID:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v6, "is unpressed, alpha = "

    .line 105
    .line 106
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v2, "RippleDrawableZTE"

    .line 117
    .line 118
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    :cond_7
    :goto_2
    if-eqz v3, :cond_9

    .line 122
    .line 123
    if-eqz v4, :cond_9

    .line 124
    .line 125
    invoke-direct {p0}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->isEnterAnimRunning()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_8

    .line 130
    .line 131
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->onStateChange([I)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    return p0

    .line 136
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 137
    .line 138
    .line 139
    move-result-wide v2

    .line 140
    iput-wide v2, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mClickTime:J

    .line 141
    .line 142
    iput-boolean v5, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsPressed:Z

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/RippleDrawableZTE;->setAlpha(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mRippleEnterAnim:Landroid/animation/ObjectAnimator;

    .line 148
    .line 149
    if-eqz v0, :cond_a

    .line 150
    .line 151
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 152
    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_9
    iput-boolean v1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mIsPressed:Z

    .line 156
    .line 157
    :cond_a
    :goto_3
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->onStateChange([I)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    return p0
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setHotspot(FF)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/LayerDrawable;->setHotspot(FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setOpacity(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mPaint:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget p0, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mOrigAlpha:I

    .line 4
    .line 5
    int-to-float p0, p0

    .line 6
    mul-float/2addr p0, p1

    .line 7
    const/high16 p1, 0x3f000000    # 0.5f

    .line 8
    .line 9
    add-float/2addr p0, p1

    .line 10
    float-to-int p0, p0

    .line 11
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/RippleDrawableZTE;->mRadius:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setState([I)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setState([I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
