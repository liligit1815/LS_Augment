.class public Lcom/android/launcher3/widget/WidgetCell;
.super Landroid/widget/LinearLayout;
.source "WidgetCell.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/WidgetCell$c;
    }
.end annotation


# instance fields
.field protected A:F

.field protected B:I

.field private C:Lcom/android/launcher3/util/w;

.field private D:Z

.field private E:I

.field private F:Lx1/v;

.field protected G:Z

.field protected g:F

.field private h:Landroid/util/Size;

.field protected i:Landroid/widget/FrameLayout;

.field protected j:Lcom/android/launcher3/widget/WidgetImageView;

.field protected k:Landroid/widget/TextView;

.field protected l:Landroid/widget/TextView;

.field private m:Landroid/widget/TextView;

.field private n:Landroid/widget/Button;

.field private o:Landroid/widget/LinearLayout;

.field protected p:Lz1/Z4;

.field protected q:Landroid/util/Size;

.field protected final r:Lcom/android/launcher3/widget/P;

.field private s:Lcom/android/launcher3/widget/WidgetCell$c;

.field protected t:Lcom/android/launcher3/util/w;

.field protected u:Z

.field protected final v:Lcom/android/launcher3/views/k;

.field private final w:Lcom/android/launcher3/V;

.field protected x:F

.field protected y:Landroid/widget/RemoteViews;

.field protected z:Lcom/android/launcher3/widget/x0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/WidgetCell;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p2, 0x3f800000    # 1.0f

    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/WidgetCell;->g:F

    .line 4
    new-instance p3, Landroid/util/Size;

    const/4 v0, 0x0

    invoke-direct {p3, v0, v0}, Landroid/util/Size;-><init>(II)V

    iput-object p3, p0, Lcom/android/launcher3/widget/WidgetCell;->h:Landroid/util/Size;

    const/4 p3, 0x0

    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/WidgetCell;->s:Lcom/android/launcher3/widget/WidgetCell$c;

    const/4 p3, 0x1

    .line 6
    iput-boolean p3, p0, Lcom/android/launcher3/widget/WidgetCell;->u:Z

    .line 7
    iput p2, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    const/16 p3, -0x69

    .line 8
    iput p3, p0, Lcom/android/launcher3/widget/WidgetCell;->B:I

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/widget/WidgetCell;->D:Z

    .line 10
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p3

    check-cast p3, Lcom/android/launcher3/views/k;

    iput-object p3, p0, Lcom/android/launcher3/widget/WidgetCell;->v:Lcom/android/launcher3/views/k;

    .line 11
    new-instance v1, Lcom/android/launcher3/widget/P;

    invoke-direct {v1, p1}, Lcom/android/launcher3/widget/P;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->r:Lcom/android/launcher3/widget/P;

    .line 12
    new-instance v1, Lcom/android/launcher3/V;

    invoke-direct {v1, p0}, Lcom/android/launcher3/V;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->w:Lcom/android/launcher3/V;

    .line 13
    invoke-virtual {v1, p2}, Lcom/android/launcher3/V;->j(F)V

    .line 14
    invoke-static {p1}, Lcom/android/launcher3/widget/I0;->b(Landroid/content/Context;)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/WidgetCell;->x:F

    .line 15
    new-instance p1, Landroid/util/Size;

    invoke-direct {p1, v0, v0}, Landroid/util/Size;-><init>(II)V

    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 17
    invoke-interface {p3}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    return-void
.end method

.method private A(Lcom/android/launcher3/widget/x0;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x1

    .line 16
    if-ne v2, v3, :cond_0

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p1, v2}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/high16 v3, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v0, v3

    .line 26
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    int-to-float v4, v4

    .line 31
    sub-float v4, v0, v4

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    int-to-float v5, v5

    .line 38
    sub-float/2addr v5, v0

    .line 39
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    mul-float/2addr v0, v3

    .line 44
    div-float/2addr v1, v3

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-float v4, v4

    .line 50
    sub-float v4, v1, v4

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-float v2, v2

    .line 57
    sub-float/2addr v2, v1

    .line 58
    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    mul-float/2addr v1, v3

    .line 63
    :cond_0
    const/4 v2, 0x0

    .line 64
    cmpg-float v3, v0, v2

    .line 65
    .line 66
    if-lez v3, :cond_2

    .line 67
    .line 68
    cmpg-float v2, v1, v2

    .line 69
    .line 70
    if-gtz v2, :cond_1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    instance-of v2, p0, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 74
    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    move-object v2, p0

    .line 78
    check-cast v2, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 79
    .line 80
    iget v3, v2, Lcom/android/launcher3/widget/WidgetCellMfv;->L:I

    .line 81
    .line 82
    int-to-float v3, v3

    .line 83
    iget v2, v2, Lcom/android/launcher3/widget/WidgetCellMfv;->M:I

    .line 84
    .line 85
    int-to-float v2, v2

    .line 86
    div-float/2addr v3, v0

    .line 87
    div-float/2addr v2, v1

    .line 88
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    :goto_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 96
    .line 97
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 98
    .line 99
    :cond_3
    :goto_1
    iget v0, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/x0;->setScaleToFit(F)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->s:Lcom/android/launcher3/widget/WidgetCell$c;

    .line 105
    .line 106
    if-eqz p1, :cond_4

    .line 107
    .line 108
    invoke-interface {p1}, Lcom/android/launcher3/widget/WidgetCell$c;->s()V

    .line 109
    .line 110
    .line 111
    const/4 p1, 0x0

    .line 112
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->s:Lcom/android/launcher3/widget/WidgetCell$c;

    .line 113
    .line 114
    :cond_4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/WidgetCell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCell;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/widget/WidgetCell;Lcom/android/launcher3/model/data/z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->t(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/widget/WidgetCell;Lcom/android/launcher3/widget/x0;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p10}, Lcom/android/launcher3/widget/WidgetCell;->q(Lcom/android/launcher3/widget/x0;Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/WidgetCell;)Landroid/widget/Button;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 2
    .line 3
    return-object p0
.end method

.method private i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->C:Lcom/android/launcher3/util/w;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/w;->e()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->C:Lcom/android/launcher3/util/w;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected static k(Landroid/content/Context;)Lcom/android/launcher3/widget/T;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/WidgetCell$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/WidgetCell$b;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private l(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 2
    .line 3
    iget-object v1, v0, Lz1/Z4;->g:Ljava/lang/String;

    .line 4
    .line 5
    iget v0, v0, Lz1/Z4;->i:I

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 12
    .line 13
    iget v2, v2, Lz1/Z4;->j:I

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    filled-new-array {v1, v0, v2}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const v1, 0x7f14048a

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 31
    .line 32
    iget-object v0, v0, Lz1/Z4;->h:Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, " "

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 54
    .line 55
    iget-object p0, p0, Lz1/Z4;->h:Ljava/lang/CharSequence;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_0
    return-object p1
.end method

.method private static m(Landroid/view/View;Landroid/view/View;ILandroid/animation/TimeInterpolator;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/anim/f;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, p0, v1, p3}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    int-to-long v1, p2

    .line 12
    invoke-virtual {p0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    instance-of p2, p0, Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    move-object p2, p0

    .line 22
    check-cast p2, Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    invoke-virtual {p2, v3}, Landroid/animation/ObjectAnimator;->setAutoCancel(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    instance-of p2, p1, Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    move-object p2, p1

    .line 42
    check-cast p2, Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    invoke-virtual {p2, v3}, Landroid/animation/ObjectAnimator;->setAutoCancel(Z)V

    .line 45
    .line 46
    .line 47
    :cond_1
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 48
    .line 49
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 50
    .line 51
    .line 52
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2}, Landroid/animation/AnimatorSet;->start()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private synthetic q(Lcom/android/launcher3/widget/x0;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->A(Lcom/android/launcher3/widget/x0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t(Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 6
    .line 7
    invoke-virtual {v0}, Ls1/d;->l()Z

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
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 17
    .line 18
    iput-object p1, v0, Lz1/Z4;->f:Ls1/d;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->x(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->x(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private v()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f14047a

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/widget/Button;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-virtual {v2, v0, v4, v3, v1}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const v3, 0x7f070c53

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const v5, 0x7f070c4e

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    const v6, 0x7f070c4d

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    const v7, 0x7f070c4c

    .line 69
    .line 70
    .line 71
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v1, v2

    .line 80
    add-int/2addr v1, v3

    .line 81
    add-int/2addr v1, v5

    .line 82
    add-int/2addr v1, v6

    .line 83
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-le v1, v5, :cond_0

    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const v1, 0x7f070c54

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 107
    .line 108
    invoke-virtual {v1, v0, v4, v3, v4}, Landroid/widget/Button;->setPaddingRelative(IIII)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 112
    .line 113
    invoke-virtual {p0, v4}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 118
    .line 119
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 123
    .line 124
    invoke-virtual {v0, v2, v4, v3, v4}, Landroid/widget/Button;->setPaddingRelative(IIII)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 128
    .line 129
    invoke-virtual {p0, v6}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    .line 130
    .line 131
    .line 132
    return-void
.end method


# virtual methods
.method public B(Lz1/Z4;ZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public cancelLongPress()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->w:Lcom/android/launcher3/V;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/V;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lx1/v;->u(Landroid/view/View;Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->F:Lx1/v;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lx1/v;

    .line 14
    .line 15
    const-string v2, "WidgetCell"

    .line 16
    .line 17
    invoke-direct {v0, p0, v2, v1}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->F:Lx1/v;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->F:Lx1/v;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->v:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 32
    .line 33
    if-eqz v2, :cond_4

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    and-int/lit16 v2, v2, 0xff

    .line 44
    .line 45
    if-ne v2, v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    and-int/lit16 v1, v1, 0xff

    .line 60
    .line 61
    const/4 v2, 0x2

    .line 62
    if-eq v1, v2, :cond_3

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    and-int/lit16 v1, v1, 0xff

    .line 69
    .line 70
    const/4 v2, 0x3

    .line 71
    if-ne v1, v2, :cond_4

    .line 72
    .line 73
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/views/BaseDragLayer;->createActiveController()V

    .line 78
    .line 79
    .line 80
    :cond_4
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    return p0
.end method

.method public e(Lcom/android/launcher3/widget/WidgetCell$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->s:Lcom/android/launcher3/widget/WidgetCell$c;

    .line 2
    .line 3
    return-void
.end method

.method protected f(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    new-instance v1, Ls1/k0;

    .line 5
    .line 6
    new-instance v2, Ls1/o;

    .line 7
    .line 8
    invoke-direct {v2, p1}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    iget p1, p0, Lcom/android/launcher3/widget/WidgetCell;->x:F

    .line 12
    .line 13
    invoke-direct {v1, v2, p1}, Ls1/k0;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Lcom/android/launcher3/widget/WidgetImageView;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->s:Lcom/android/launcher3/widget/WidgetCell$c;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-interface {p1}, Lcom/android/launcher3/widget/WidgetCell$c;->s()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->s:Lcom/android/launcher3/widget/WidgetCell$c;

    .line 44
    .line 45
    :cond_1
    iget-boolean p1, p0, Lcom/android/launcher3/widget/WidgetCell;->u:Z

    .line 46
    .line 47
    const/high16 v1, 0x3f800000    # 1.0f

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {p1, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-wide/16 v1, 0x5a

    .line 68
    .line 69
    invoke-virtual {p1, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 79
    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/android/launcher3/util/w;->e()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 86
    .line 87
    :cond_3
    return-void
.end method

.method public g(Lz1/Z4;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->v:Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 18
    .line 19
    invoke-static {v1, v2, v3}, Lr2/b;->c(Landroid/content/Context;Lcom/android/launcher3/h0;Lz1/Z4;)Landroid/util/Size;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->o()V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 31
    .line 32
    iget-object v2, v2, Lz1/Z4;->g:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 40
    .line 41
    iget v2, v2, Lz1/Z4;->i:I

    .line 42
    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 48
    .line 49
    iget v3, v3, Lz1/Z4;->j:I

    .line 50
    .line 51
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const v3, 0x7f140481

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 70
    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 74
    .line 75
    iget-object v1, v1, Lz1/Z4;->h:Ljava/lang/CharSequence;

    .line 76
    .line 77
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_0

    .line 82
    .line 83
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 84
    .line 85
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 86
    .line 87
    iget-object v2, v2, Lz1/Z4;->h:Ljava/lang/CharSequence;

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 100
    .line 101
    const/16 v2, 0x8

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/WidgetCell;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 114
    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 118
    .line 119
    iget-object v2, v2, Lz1/Z4;->g:Ljava/lang/String;

    .line 120
    .line 121
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    const v3, 0x7f140479

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    :cond_2
    iget-object v0, p1, Lz1/Z4;->e:LD1/i;

    .line 136
    .line 137
    if-eqz v0, :cond_3

    .line 138
    .line 139
    new-instance v0, Lcom/android/launcher3/widget/y0;

    .line 140
    .line 141
    iget-object v1, p1, Lz1/Z4;->e:LD1/i;

    .line 142
    .line 143
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/y0;-><init>(LD1/i;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_3
    new-instance v0, Lcom/android/launcher3/widget/z0;

    .line 151
    .line 152
    iget-object v1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 153
    .line 154
    iget v2, p0, Lcom/android/launcher3/widget/WidgetCell;->B:I

    .line 155
    .line 156
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/widget/z0;-><init>(Lcom/android/launcher3/widget/U;I)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->y:Landroid/widget/RemoteViews;

    .line 163
    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    new-instance v0, Lcom/android/launcher3/widget/P$a;

    .line 167
    .line 168
    invoke-direct {v0}, Lcom/android/launcher3/widget/P$a;-><init>()V

    .line 169
    .line 170
    .line 171
    iget-object p1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 172
    .line 173
    iput-object p1, v0, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 174
    .line 175
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->y:Landroid/widget/RemoteViews;

    .line 176
    .line 177
    iput-object p1, v0, Lcom/android/launcher3/widget/P$a;->b:Landroid/widget/RemoteViews;

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/WidgetCell;->h(Lcom/android/launcher3/widget/P$a;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 184
    .line 185
    if-nez p1, :cond_5

    .line 186
    .line 187
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->r:Lcom/android/launcher3/widget/P;

    .line 188
    .line 189
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 192
    .line 193
    new-instance v2, Lcom/android/launcher3/widget/Q0;

    .line 194
    .line 195
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/Q0;-><init>(Lcom/android/launcher3/widget/WidgetCell;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1, v0, v1, v2}, Lcom/android/launcher3/widget/P;->n(Lz1/Z4;Landroid/util/Size;Ljava/util/function/Consumer;)Lcom/android/launcher3/util/w;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 203
    .line 204
    :cond_5
    return-void
.end method

.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-class p0, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAppWidgetHostViewPreview()Lcom/android/launcher3/widget/x0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppWidgetHostViewScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 2
    .line 3
    return p0
.end method

.method public getDragAndDropView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPreviewContentHeight()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/WidgetCell;->g:F

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    mul-float/2addr v0, v1

    .line 11
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/widget/WidgetImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetImageView;->getBitmapBounds()Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v2, 0x1

    .line 45
    if-ne v1, v2, :cond_1

    .line 46
    .line 47
    iget v0, p0, Lcom/android/launcher3/widget/WidgetCell;->g:F

    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    int-to-float v1, v1

    .line 56
    mul-float/2addr v0, v1

    .line 57
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iget v1, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-virtual {p0, v2}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    int-to-float p0, p0

    .line 75
    mul-float/2addr v1, p0

    .line 76
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    return p0

    .line 85
    :cond_1
    return v0
.end method

.method public getRemoteViewsPreview()Landroid/widget/RemoteViews;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->y:Landroid/widget/RemoteViews;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidgetItem()Lz1/Z4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected h(Lcom/android/launcher3/widget/P$a;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/widget/WidgetCell;->k(Landroid/content/Context;)Lcom/android/launcher3/widget/T;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/android/launcher3/widget/P$a;->b:Landroid/widget/RemoteViews;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/widget/WidgetCell;->u(Lcom/android/launcher3/widget/x0;Landroid/appwidget/AppWidgetProviderInfo;Landroid/widget/RemoteViews;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p1, Lcom/android/launcher3/widget/P$a;->c:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->f(Landroid/graphics/Bitmap;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public j()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/WidgetImageView;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 41
    .line 42
    const/16 v4, 0x8

    .line 43
    .line 44
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v3}, Lcom/android/launcher3/widget/WidgetCell;->y(Z)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->s:Lcom/android/launcher3/widget/WidgetCell$c;

    .line 51
    .line 52
    iput v2, p0, Lcom/android/launcher3/widget/WidgetCell;->E:I

    .line 53
    .line 54
    invoke-virtual {p0, v3}, Lcom/android/launcher3/widget/WidgetCell;->z(Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v2}, Lcom/android/launcher3/widget/WidgetCell;->n(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 61
    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/android/launcher3/util/w;->e()V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 68
    .line 69
    :cond_1
    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->y:Landroid/widget/RemoteViews;

    .line 70
    .line 71
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 76
    .line 77
    invoke-virtual {v3, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 81
    .line 82
    new-instance v0, Landroid/util/Size;

    .line 83
    .line 84
    invoke-direct {v0, v2, v2}, Landroid/util/Size;-><init>(II)V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->h:Landroid/util/Size;

    .line 88
    .line 89
    const/high16 v0, 0x3f800000    # 1.0f

    .line 90
    .line 91
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 92
    .line 93
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCell;->g:F

    .line 94
    .line 95
    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 96
    .line 97
    new-instance v0, Landroid/util/Size;

    .line 98
    .line 99
    invoke-direct {v0, v2, v2}, Landroid/util/Size;-><init>(II)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 103
    .line 104
    invoke-virtual {p0, v2}, Lcom/android/launcher3/widget/WidgetCell;->x(Z)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public n(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/WidgetCell;->D:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/widget/WidgetCell;->D:Z

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 18
    .line 19
    const/4 v1, 0x4

    .line 20
    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->o:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->o:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    const/high16 p1, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->o:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    const/16 v0, 0x64

    .line 41
    .line 42
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    invoke-static {p1, p0, v0, v1}, Lcom/android/launcher3/widget/WidgetCell;->m(Landroid/view/View;Landroid/view/View;ILandroid/animation/TimeInterpolator;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method protected o()V
    .locals 3

    .line 1
    sget-object v0, Lq2/a;->c:Lq2/a$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->v:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Lq2/a$a;->c(Lz1/Z4;Lcom/android/launcher3/h0;)Lq2/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->v:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget v2, v0, Lq2/a;->a:I

    .line 22
    .line 23
    iget v0, v0, Lq2/a;->b:I

    .line 24
    .line 25
    invoke-static {v1, v2, v0}, Lr2/b;->e(Lcom/android/launcher3/h0;II)Landroid/util/Size;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->h:Landroid/util/Size;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    int-to-float v0, v0

    .line 36
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    int-to-float v1, v1

    .line 43
    div-float/2addr v0, v1

    .line 44
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->h:Landroid/util/Size;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    int-to-float v1, v1

    .line 51
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    int-to-float v2, v2

    .line 58
    div-float/2addr v1, v2

    .line 59
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCell;->g:F

    .line 64
    .line 65
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b068e

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/FrameLayout;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    const v0, 0x7f0b068d

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/widget/WidgetImageView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 25
    .line 26
    const v0, 0x7f0b068a

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 36
    .line 37
    const v0, 0x7f0b0686

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/widget/TextView;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 47
    .line 48
    const v0, 0x7f0b0685

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/TextView;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 58
    .line 59
    const v0, 0x7f0b069b

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Landroid/widget/LinearLayout;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->o:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    const v0, 0x7f0b0680

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Landroid/widget/Button;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 80
    .line 81
    new-instance v0, Lcom/android/launcher3/widget/WidgetCell$a;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/WidgetCell$a;-><init>(Lcom/android/launcher3/widget/WidgetCell;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 90
    .line 91
    if-eqz p0, :cond_0

    .line 92
    .line 93
    const/4 v0, 0x4

    .line 94
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->p()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance p1, Lcom/android/launcher3/widget/O0;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/O0;-><init>(Lcom/android/launcher3/widget/WidgetCell;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 8

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 2
    .line 3
    if-nez v0, :cond_9

    .line 4
    .line 5
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetCellTwoPane;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget v2, p0, Lcom/android/launcher3/widget/WidgetCell;->g:F

    .line 22
    .line 23
    iput v2, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->h:Landroid/util/Size;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->h:Landroid/util/Size;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    const/4 v5, 0x0

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-ne v3, v4, :cond_1

    .line 50
    .line 51
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 52
    .line 53
    invoke-virtual {v3, v5}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    if-eqz v3, :cond_1

    .line 58
    .line 59
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-lez v6, :cond_1

    .line 64
    .line 65
    iget v6, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    int-to-float v3, v3

    .line 72
    mul-float/2addr v6, v3

    .line 73
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-lez v3, :cond_1

    .line 78
    .line 79
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 84
    .line 85
    if-eqz v3, :cond_2

    .line 86
    .line 87
    iget v6, v3, Lz1/Z4;->i:I

    .line 88
    .line 89
    const/4 v7, 0x3

    .line 90
    if-ne v6, v7, :cond_2

    .line 91
    .line 92
    iget v3, v3, Lz1/Z4;->j:I

    .line 93
    .line 94
    const/4 v6, 0x2

    .line 95
    if-ne v3, v6, :cond_2

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    move v4, v5

    .line 99
    :goto_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_3

    .line 104
    .line 105
    if-eqz v4, :cond_3

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    const v4, 0x7f070afe

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    :cond_3
    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 119
    .line 120
    const/high16 v4, 0x3f800000    # 1.0f

    .line 121
    .line 122
    if-le v3, v1, :cond_4

    .line 123
    .line 124
    if-eqz v3, :cond_4

    .line 125
    .line 126
    int-to-float v6, v1

    .line 127
    int-to-float v3, v3

    .line 128
    div-float/2addr v6, v3

    .line 129
    mul-float/2addr v6, v4

    .line 130
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_4
    move v6, v4

    .line 134
    :goto_1
    if-lez v5, :cond_5

    .line 135
    .line 136
    int-to-float v3, v2

    .line 137
    mul-float/2addr v3, v6

    .line 138
    int-to-float v5, v5

    .line 139
    cmpl-float v7, v3, v5

    .line 140
    .line 141
    if-lez v7, :cond_5

    .line 142
    .line 143
    const/4 v7, 0x0

    .line 144
    cmpl-float v7, v3, v7

    .line 145
    .line 146
    if-eqz v7, :cond_5

    .line 147
    .line 148
    div-float/2addr v5, v3

    .line 149
    mul-float/2addr v6, v5

    .line 150
    :cond_5
    cmpl-float v3, v6, v4

    .line 151
    .line 152
    if-eqz v3, :cond_6

    .line 153
    .line 154
    iget v2, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 155
    .line 156
    mul-float/2addr v2, v6

    .line 157
    iput v2, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 158
    .line 159
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->h:Landroid/util/Size;

    .line 160
    .line 161
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    int-to-float v2, v2

    .line 166
    iget v3, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 167
    .line 168
    mul-float/2addr v2, v3

    .line 169
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    :cond_6
    iget v3, p0, Lcom/android/launcher3/widget/WidgetCell;->E:I

    .line 174
    .line 175
    if-lez v3, :cond_7

    .line 176
    .line 177
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_7
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 185
    .line 186
    :goto_2
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-eqz v2, :cond_8

    .line 191
    .line 192
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 193
    .line 194
    :cond_8
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_9
    :goto_3
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 199
    .line 200
    .line 201
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->w:Lcom/android/launcher3/V;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V;->h(Landroid/view/MotionEvent;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/WidgetCell;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCell;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 5
    .line 6
    iget-object v0, v0, Lz1/Z4;->f:Ls1/d;

    .line 7
    .line 8
    invoke-virtual {v0}, Ls1/d;->k()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/model/data/B;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    new-instance v2, Lcom/android/launcher3/widget/P0;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/P0;-><init>(Lcom/android/launcher3/widget/WidgetCell;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2, v0}, Ls1/P;->W0(Ls1/P$a;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/util/w;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->C:Lcom/android/launcher3/util/w;

    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public s(Lz1/Z4;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v2, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-eqz v2, :cond_2

    .line 13
    .line 14
    iget-object v4, v1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 15
    .line 16
    if-eqz v4, :cond_2

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/android/launcher3/widget/U;->e()Landroid/os/UserHandle;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 23
    .line 24
    iget-object v2, v2, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/android/launcher3/widget/U;->e()Landroid/os/UserHandle;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object p1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/widget/U;->g()Landroid/content/ComponentName;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 43
    .line 44
    iget-object p0, p0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->g()Landroid/content/ComponentName;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_1

    .line 55
    .line 56
    return v3

    .line 57
    :cond_1
    return v0

    .line 58
    :cond_2
    iget-object v2, p1, Lz1/Z4;->e:LD1/i;

    .line 59
    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    iget-object v1, v1, Lz1/Z4;->e:LD1/i;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v2}, LD1/i;->e()Landroid/os/UserHandle;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 71
    .line 72
    iget-object v2, v2, Lz1/Z4;->e:LD1/i;

    .line 73
    .line 74
    invoke-virtual {v2}, LD1/i;->e()Landroid/os/UserHandle;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v1, v2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    iget-object p1, p1, Lz1/Z4;->e:LD1/i;

    .line 85
    .line 86
    invoke-virtual {p1}, LD1/i;->g()Landroid/content/ComponentName;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 91
    .line 92
    iget-object p0, p0, Lz1/Z4;->e:LD1/i;

    .line 93
    .line 94
    invoke-virtual {p0}, LD1/i;->g()Landroid/content/ComponentName;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1, p0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_3

    .line 103
    .line 104
    return v3

    .line 105
    :cond_3
    :goto_0
    return v0
.end method

.method public setAnimatePreview(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/WidgetCell;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public setParentAlignedPreviewHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/WidgetCell;->E:I

    .line 2
    .line 3
    return-void
.end method

.method public setRemoteViewsPreview(Landroid/widget/RemoteViews;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->y:Landroid/widget/RemoteViews;

    .line 2
    .line 3
    return-void
.end method

.method public setSourceContainer(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/WidgetCell;->B:I

    .line 2
    .line 3
    return-void
.end method

.method protected u(Lcom/android/launcher3/widget/x0;Landroid/appwidget/AppWidgetProviderInfo;Landroid/widget/RemoteViews;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p1, v0}, Landroid/appwidget/AppWidgetHostView;->setImportantForAccessibility(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p1, v0, p2}, Lcom/android/launcher3/widget/x0;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, p3}, Landroid/appwidget/AppWidgetHostView;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 10
    .line 11
    .line 12
    const/4 p2, 0x0

    .line 13
    invoke-virtual {p1, p2}, Landroid/appwidget/AppWidgetHostView;->setClipToPadding(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/appwidget/AppWidgetHostView;->setClipChildren(Z)V

    .line 17
    .line 18
    .line 19
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/16 v2, 0x11

    .line 34
    .line 35
    invoke-direct {p3, v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-object p3, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 44
    .line 45
    const/16 v0, 0x8

    .line 46
    .line 47
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    instance-of p3, p1, Lcom/android/launcher3/widget/T;

    .line 51
    .line 52
    if-eqz p3, :cond_0

    .line 53
    .line 54
    move-object p3, p1

    .line 55
    check-cast p3, Lcom/android/launcher3/widget/T;

    .line 56
    .line 57
    invoke-virtual {p3, p2}, Lcom/android/launcher3/widget/h;->setNeedShowWidgetTitle(Z)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 61
    .line 62
    iget-boolean p3, p0, Lcom/android/launcher3/widget/WidgetCell;->G:Z

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-virtual {p0, p2, p3, v0}, Lcom/android/launcher3/widget/WidgetCell;->B(Lz1/Z4;ZZ)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    const v0, 0x7f080a20

    .line 75
    .line 76
    .line 77
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    const/4 p2, 0x0

    .line 85
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/WidgetCell;->f(Landroid/graphics/Bitmap;)V

    .line 86
    .line 87
    .line 88
    new-instance p2, Lcom/android/launcher3/widget/R0;

    .line 89
    .line 90
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/widget/R0;-><init>(Lcom/android/launcher3/widget/WidgetCell;Lcom/android/launcher3/widget/x0;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/appwidget/AppWidgetHostView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public w(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/widget/WidgetCell;->D:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/widget/WidgetCell;->D:Z

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCell;->v()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->o:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->n:Landroid/widget/Button;

    .line 25
    .line 26
    const/16 v0, 0x64

    .line 27
    .line 28
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    invoke-static {p1, p0, v0, v1}, Lcom/android/launcher3/widget/WidgetCell;->m(Landroid/view/View;Landroid/view/View;ILandroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public x(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 5
    .line 6
    iget-object p1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->r()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 14
    .line 15
    iget-object p1, p1, Lz1/Z4;->f:Ls1/d;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1, v1}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const v2, 0x7f070c56

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {p1, v2, v2, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void

    .line 46
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCell;->i()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 50
    .line 51
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public y(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/16 p1, 0x8

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/16 p1, 0x8

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
