.class public Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;
.super Landroid/widget/FrameLayout;
.source "AIBubbleWidgetNumberTextLayout.java"


# instance fields
.field private g:Landroid/widget/TextView;

.field private h:Landroid/widget/TextView;

.field private final i:Landroid/view/animation/PathInterpolator;

.field private j:I

.field private k:Ljava/lang/String;

.field private l:Z

.field private m:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/view/animation/PathInterpolator;

    const p3, 0x3dcccccd    # 0.1f

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x3e800000    # 0.25f

    invoke-direct {p2, v1, p3, v1, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->i:Landroid/view/animation/PathInterpolator;

    .line 4
    const-string p2, ""

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->k:Ljava/lang/String;

    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->l:Z

    .line 6
    new-instance p3, Landroid/animation/ValueAnimator;

    invoke-direct {p3}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f07008c

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    .line 8
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 9
    new-instance p2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$a;

    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$a;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;I)V

    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->j:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->j:I

    .line 2
    .line 3
    return-void
.end method

.method private g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    const-wide/16 v1, 0x320

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->i:Landroid/view/animation/PathInterpolator;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$c;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$d;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method protected h(Ljava/lang/String;ZZ)Landroid/animation/ValueAnimator;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_1
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->j:I

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    :cond_2
    if-nez p2, :cond_3

    .line 21
    .line 22
    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->g:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_4

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 44
    .line 45
    .line 46
    :cond_4
    iput-boolean p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->l:Z

    .line 47
    .line 48
    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->k:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p2, :cond_5

    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->m:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    return-object v1
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0073

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/TextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->g:Landroid/widget/TextView;

    .line 14
    .line 15
    const v0, 0x7f0b0074

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h:Landroid/widget/TextView;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->g:Landroid/widget/TextView;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h:Landroid/widget/TextView;

    .line 33
    .line 34
    const/16 v2, 0x8

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    const-string v0, ""

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->h(Ljava/lang/String;ZZ)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$b;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$b;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->g()V

    .line 57
    .line 58
    .line 59
    return-void
.end method
