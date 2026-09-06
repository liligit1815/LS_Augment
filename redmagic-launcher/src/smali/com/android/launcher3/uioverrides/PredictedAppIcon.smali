.class public Lcom/android/launcher3/uioverrides/PredictedAppIcon;
.super Lcom/android/launcher3/views/DoubleShadowBubbleTextView;
.source "PredictedAppIcon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;,
        Lcom/android/launcher3/uioverrides/PredictedAppIcon$e;
    }
.end annotation


# static fields
.field private static final a1:F

.field private static final b1:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Lcom/android/launcher3/uioverrides/PredictedAppIcon;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final c1:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/uioverrides/PredictedAppIcon;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field I0:Z

.field private final J0:Lcom/android/launcher3/h0;

.field private final K0:Landroid/graphics/Paint;

.field private final L0:Landroid/graphics/Path;

.field private final M0:I

.field private final N0:Landroid/graphics/Path;

.field private final O0:Landroid/graphics/Matrix;

.field private final P0:Landroid/graphics/BlurMaskFilter;

.field private Q0:Z

.field private final R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

.field S0:Z

.field private final T0:Landroid/graphics/Rect;

.field private U0:Landroid/graphics/drawable/Drawable;

.field private V0:F

.field private W0:F

.field private X0:Z

.field private Y0:Landroid/animation/Animator;

.field private Z0:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const v0, 0x3dcccccd    # 0.1f

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const v0, 0x3dc28f5c    # 0.095f

    .line 12
    .line 13
    .line 14
    :goto_0
    sput v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$a;

    .line 17
    .line 18
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 19
    .line 20
    const-string v2, "ringScale"

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->b1:Landroid/util/Property;

    .line 26
    .line 27
    new-instance v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$b;

    .line 28
    .line 29
    const-string v1, "slotMachineTranslationY"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$b;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->c1:Landroid/util/FloatProperty;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->I0:Z

    .line 4
    new-instance p3, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p3, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 5
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->L0:Landroid/graphics/Path;

    .line 6
    new-instance p3, Landroid/graphics/Matrix;

    invoke-direct {p3}, Landroid/graphics/Matrix;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 7
    iput-boolean p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 8
    new-instance p3, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;-><init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon;Lcom/android/launcher3/uioverrides/d;)V

    iput-object p3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 9
    iput-boolean p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->S0:Z

    .line 10
    new-instance p3, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    move-result v1

    invoke-direct {p3, p2, p2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->T0:Landroid/graphics/Rect;

    const/high16 p3, 0x3f800000    # 1.0f

    .line 11
    iput p3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->W0:F

    .line 12
    iput-boolean p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->X0:Z

    .line 13
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/views/k;

    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->J0:Lcom/android/launcher3/h0;

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    move-result p2

    int-to-float p2, p2

    const p3, 0x3f6b851f    # 0.92f

    mul-float/2addr p2, p3

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->M0:I

    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f070145

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    .line 16
    new-instance v0, Landroid/graphics/BlurMaskFilter;

    int-to-float p3, p3

    sget-object v1, Landroid/graphics/BlurMaskFilter$Blur;->OUTER:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v0, p3, v1}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    iput-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->P0:Landroid/graphics/BlurMaskFilter;

    .line 17
    sget-object p3, Ln1/C;->g:Lcom/android/launcher3/util/I;

    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ln1/C;

    invoke-virtual {p1}, Ln1/C;->j()Ln1/t;

    move-result-object p1

    int-to-float p2, p2

    invoke-interface {p1, p2}, Ln1/t;->b(F)Landroid/graphics/Path;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->N0:Landroid/graphics/Path;

    return-void
.end method

.method public static synthetic b1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->s1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;Lcom/android/launcher3/util/a2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->t1(Lcom/android/launcher3/util/a2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->W0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)Landroid/graphics/Path;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->N0:Landroid/graphics/Path;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->V0:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->W0:F

    .line 2
    .line 3
    return-void
.end method

.method private getOutlineOffsetX()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 6
    .line 7
    const/4 v2, 0x5

    .line 8
    if-eq v1, v2, :cond_0

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "getOutlineOffsetX: measured width = "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, ", mNormalizedIconSize = "

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->M0:I

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, ", last updated width = "

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Z0:I

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "b/387844520"

    .line 48
    .line 49
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    :cond_0
    iget v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Z0:I

    .line 53
    .line 54
    iget p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->M0:I

    .line 55
    .line 56
    sub-int/2addr v0, p0

    .line 57
    div-int/lit8 v0, v0, 0x2

    .line 58
    .line 59
    return v0
.end method

.method private getOutlineOffsetY()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->J0:Lcom/android/launcher3/h0;

    .line 11
    .line 12
    iget p0, p0, Lcom/android/launcher3/h0;->R1:I

    .line 13
    .line 14
    add-int/2addr v0, p0

    .line 15
    return v0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->M0:I

    .line 21
    .line 22
    sub-int/2addr v0, p0

    .line 23
    div-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    return v0
.end method

.method private getSlotMachineIconPlusSpacingSize()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getOutlineOffsetY()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    int-to-float p0, v0

    .line 11
    return p0
.end method

.method static bridge synthetic h1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Y0:Landroid/animation/Animator;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->V0:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getOutlineOffsetX()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic k1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getOutlineOffsetY()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private varargs l1([F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->n1()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->b1:Landroid/util/Property;

    .line 5
    .line 6
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Y0:Landroid/animation/Animator;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$c;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$c;-><init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Y0:Landroid/animation/Animator;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private n1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Y0:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static o1(Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/I;)Lcom/android/launcher3/uioverrides/PredictedAppIcon;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0e0198

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->U1()Lcom/android/launcher3/keyboard/b;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method

.method private p1(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->S0:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/BubbleTextView;->w:Z

    .line 6
    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->X0:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 16
    .line 17
    const/high16 v1, -0x67000000

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->P0:Landroid/graphics/BlurMaskFilter;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/high16 v2, 0x3f800000    # 1.0f

    .line 38
    .line 39
    const/high16 v3, 0x40000000    # 2.0f

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    iget v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->W0:F

    .line 44
    .line 45
    sget v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 46
    .line 47
    sub-float v5, v2, v4

    .line 48
    .line 49
    mul-float/2addr v5, v1

    .line 50
    sub-float/2addr v2, v4

    .line 51
    mul-float/2addr v1, v2

    .line 52
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-float v2, v2

    .line 57
    div-float/2addr v2, v3

    .line 58
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    int-to-float v4, v4

    .line 63
    div-float/2addr v4, v3

    .line 64
    invoke-virtual {p1, v5, v1, v2, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->W0:F

    .line 69
    .line 70
    invoke-static {v2, v1}, Ljava/lang/Float;->compare(FF)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    iget v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->W0:F

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    int-to-float v2, v2

    .line 83
    div-float/2addr v2, v3

    .line 84
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    int-to-float v4, v4

    .line 89
    div-float/2addr v4, v3

    .line 90
    invoke-virtual {p1, v1, v1, v2, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 91
    .line 92
    .line 93
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->L0:Landroid/graphics/Path;

    .line 94
    .line 95
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 101
    .line 102
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 103
    .line 104
    iget v2, v2, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->e:I

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_3

    .line 114
    .line 115
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    int-to-float v2, v2

    .line 122
    sget v3, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 123
    .line 124
    mul-float/2addr v2, v3

    .line 125
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 129
    .line 130
    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 133
    .line 134
    .line 135
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 136
    .line 137
    const/4 v2, 0x0

    .line 138
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->L0:Landroid/graphics/Path;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 144
    .line 145
    invoke-virtual {p1, v1, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 149
    .line 150
    .line 151
    :cond_4
    :goto_1
    return-void
.end method

.method private synthetic s1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->U0:Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->V0:F

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic t1(Lcom/android/launcher3/util/a2;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Lcom/android/launcher3/util/a2;->close()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->S0:Z

    .line 6
    .line 7
    return-void
.end method

.method private v1(Lcom/android/launcher3/model/data/I;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/TextView;->isShown()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method private w1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->L0:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getOutlineOffsetX()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getOutlineOffsetY()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    int-to-float v2, v2

    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->L0:Landroid/graphics/Path;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->N0:Landroid/graphics/Path;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Ls1/o;->e()Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->M0:I

    .line 48
    .line 49
    int-to-float v0, v0

    .line 50
    sget v1, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 51
    .line 52
    mul-float/2addr v0, v1

    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    int-to-float v2, v2

    .line 58
    const/high16 v3, 0x40000000    # 2.0f

    .line 59
    .line 60
    mul-float/2addr v1, v3

    .line 61
    const/high16 v3, 0x3f800000    # 1.0f

    .line 62
    .line 63
    sub-float/2addr v3, v1

    .line 64
    mul-float/2addr v2, v3

    .line 65
    float-to-int v1, v2

    .line 66
    invoke-static {v1}, Ls1/b;->E(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    int-to-float v1, v1

    .line 71
    add-float/2addr v1, v0

    .line 72
    iget v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->M0:I

    .line 73
    .line 74
    int-to-float v2, v0

    .line 75
    div-float/2addr v1, v2

    .line 76
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 77
    .line 78
    int-to-float v3, v0

    .line 79
    int-to-float v0, v0

    .line 80
    invoke-virtual {v2, v3, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 84
    .line 85
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 89
    .line 90
    iget v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->M0:I

    .line 91
    .line 92
    neg-int v2, v1

    .line 93
    int-to-float v2, v2

    .line 94
    neg-int v1, v1

    .line 95
    int-to-float v1, v1

    .line 96
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->L0:Landroid/graphics/Path;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->N0:Landroid/graphics/Path;

    .line 102
    .line 103
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->O0:Landroid/graphics/Matrix;

    .line 104
    .line 105
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 106
    .line 107
    .line 108
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 109
    .line 110
    .line 111
    return-void
.end method


# virtual methods
.method public A(Lcom/android/launcher3/model/data/z;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->A(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ls1/o;->l()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const v1, 0x106003c

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p1, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->d:Ljava/lang/Integer;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p1, 0x3

    .line 35
    new-array p1, p1, [F

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/BubbleTextView;->C:Ls1/m$a;

    .line 38
    .line 39
    iget v0, v0, Ls1/m$a;->b:I

    .line 40
    .line 41
    invoke-static {v0, p1}, LB/a;->j(I[F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    aget p1, p1, v1

    .line 48
    .line 49
    const/high16 v1, 0x42100000    # 36.0f

    .line 50
    .line 51
    const/high16 v2, 0x42aa0000    # 85.0f

    .line 52
    .line 53
    invoke-static {p1, v1, v2}, LB/a;->a(FFF)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->d:Ljava/lang/Integer;

    .line 62
    .line 63
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 64
    .line 65
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->b(Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method protected U(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->I0:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    neg-int v1, v1

    .line 13
    int-to-float v1, v1

    .line 14
    sget v2, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 15
    .line 16
    mul-float/2addr v1, v2

    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    neg-int v3, v3

    .line 22
    int-to-float v3, v3

    .line 23
    mul-float/2addr v3, v2

    .line 24
    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 25
    .line 26
    .line 27
    const/high16 v1, 0x40000000    # 2.0f

    .line 28
    .line 29
    mul-float v3, v2, v1

    .line 30
    .line 31
    const/high16 v4, 0x3f800000    # 1.0f

    .line 32
    .line 33
    add-float/2addr v3, v4

    .line 34
    mul-float/2addr v2, v1

    .line 35
    add-float/2addr v2, v4

    .line 36
    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 37
    .line 38
    .line 39
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->U(Landroid/graphics/Canvas;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->I0:Z

    .line 47
    .line 48
    return-void
.end method

.method public d0(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->I0:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    int-to-float p0, p0

    .line 17
    sget v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 18
    .line 19
    mul-float/2addr p0, v0

    .line 20
    float-to-int p0, p0

    .line 21
    invoke-virtual {p1, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public e()Lcom/android/launcher3/util/a2;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->S0:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 5
    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/BubbleTextView;->e()Lcom/android/launcher3/util/a2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/launcher3/uioverrides/a;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/uioverrides/a;-><init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon;Lcom/android/launcher3/util/a2;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method

.method public g(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->g(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float p0, p0

    .line 13
    sget v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 14
    .line 15
    mul-float/2addr p0, v0

    .line 16
    float-to-int p0, p0

    .line 17
    invoke-virtual {p1, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public m1(Lcom/android/launcher3/model/data/I;I)Z
    .locals 8

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->v1(Lcom/android/launcher3/model/data/I;)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 11
    .line 12
    iget v3, v3, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->e:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 15
    .line 16
    .line 17
    iget-boolean v4, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 18
    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 29
    .line 30
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const v5, 0x7f14020c

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v5, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    const/high16 p1, 0x3f800000    # 1.0f

    .line 45
    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 49
    .line 50
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->d:Ljava/lang/Integer;

    .line 51
    .line 52
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->c:Ljava/lang/Integer;

    .line 53
    .line 54
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->a:Lcom/android/launcher3/anim/d;

    .line 55
    .line 56
    iput p1, p2, Lcom/android/launcher3/anim/d;->d:F

    .line 57
    .line 58
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->b(Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;)V

    .line 59
    .line 60
    .line 61
    return v1

    .line 62
    :cond_1
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 63
    .line 64
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    iput-object v3, v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->c:Ljava/lang/Integer;

    .line 69
    .line 70
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 71
    .line 72
    iget-object v4, v3, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->a:Lcom/android/launcher3/anim/d;

    .line 73
    .line 74
    const/4 v5, 0x0

    .line 75
    iput v5, v4, Lcom/android/launcher3/anim/d;->d:F

    .line 76
    .line 77
    invoke-static {v3}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->b(Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;)V

    .line 78
    .line 79
    .line 80
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 83
    .line 84
    .line 85
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->R0:Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;

    .line 86
    .line 87
    iget-object v4, v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon$d;->a:Lcom/android/launcher3/anim/d;

    .line 88
    .line 89
    sget-object v6, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 90
    .line 91
    new-array v7, v0, [F

    .line 92
    .line 93
    fill-array-data v7, :array_0

    .line 94
    .line 95
    .line 96
    invoke-static {v4, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const/4 v6, 0x1

    .line 101
    invoke-virtual {v4, v6}, Landroid/animation/ObjectAnimator;->setAutoCancel(Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 105
    .line 106
    .line 107
    iget-boolean v4, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 108
    .line 109
    if-nez v4, :cond_2

    .line 110
    .line 111
    if-eqz v2, :cond_2

    .line 112
    .line 113
    iput-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->U0:Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getSlotMachineIconPlusSpacingSize()F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    neg-float v2, v2

    .line 120
    invoke-static {v5, v5}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getOutlineOffsetY()I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    int-to-float v5, v5

    .line 129
    const/high16 v7, 0x40000000    # 2.0f

    .line 130
    .line 131
    div-float/2addr v5, v7

    .line 132
    sub-float v5, v2, v5

    .line 133
    .line 134
    const v7, 0x3f51eb85    # 0.82f

    .line 135
    .line 136
    .line 137
    invoke-static {v7, v5}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    invoke-static {p1, v2}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    filled-new-array {v4, v5, p1}, [Landroid/animation/Keyframe;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    aget-object v2, p1, v6

    .line 150
    .line 151
    sget-object v4, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 152
    .line 153
    invoke-virtual {v2, v4}, Landroid/animation/Keyframe;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 154
    .line 155
    .line 156
    aget-object v0, p1, v0

    .line 157
    .line 158
    invoke-virtual {v0, v4}, Landroid/animation/Keyframe;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 159
    .line 160
    .line 161
    sget-object v0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->c1:Landroid/util/FloatProperty;

    .line 162
    .line 163
    invoke-static {v0, p1}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Landroid/util/Property;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    filled-new-array {p1}, [Landroid/animation/PropertyValuesHolder;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-static {p0, p1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    new-instance v0, Lcom/android/launcher3/uioverrides/b;

    .line 176
    .line 177
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/b;-><init>(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p1, p0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1, v6}, Landroid/animation/ObjectAnimator;->setAutoCancel(Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v3, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 191
    .line 192
    .line 193
    :cond_2
    int-to-long p0, p2

    .line 194
    const-wide/16 v4, 0x32

    .line 195
    .line 196
    mul-long/2addr p0, v4

    .line 197
    invoke-virtual {v3, p0, p1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 198
    .line 199
    .line 200
    const-wide/16 p0, 0x168

    .line 201
    .line 202
    invoke-virtual {v3, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 207
    .line 208
    .line 209
    return v1

    .line 210
    nop

    .line 211
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->U0:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    iget-boolean v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 13
    .line 14
    if-nez v2, :cond_2

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->p1(Landroid/graphics/Canvas;)V

    .line 17
    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->L0:Landroid/graphics/Path;

    .line 22
    .line 23
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    sget v2, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->a1:F

    .line 27
    .line 28
    const/high16 v3, 0x40000000    # 2.0f

    .line 29
    .line 30
    mul-float v4, v2, v3

    .line 31
    .line 32
    const/high16 v5, 0x3f800000    # 1.0f

    .line 33
    .line 34
    sub-float v4, v5, v4

    .line 35
    .line 36
    mul-float/2addr v2, v3

    .line 37
    sub-float/2addr v5, v2

    .line 38
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    int-to-float v2, v2

    .line 43
    const/high16 v3, 0x3f000000    # 0.5f

    .line 44
    .line 45
    mul-float/2addr v2, v3

    .line 46
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    int-to-float v6, v6

    .line 51
    mul-float/2addr v6, v3

    .line 52
    invoke-virtual {p1, v4, v5, v2, v6}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 53
    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->V0:F

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->U0:Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->T0:Landroid/graphics/Rect;

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->U0:Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->getSlotMachineIconPlusSpacingSize()F

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 80
    .line 81
    .line 82
    :cond_2
    invoke-super {p0, p1}, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/BubbleTextView;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Z0:I

    .line 5
    .line 6
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->T0:Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 9
    .line 10
    .line 11
    move-result p4

    .line 12
    sub-int/2addr p1, p4

    .line 13
    div-int/lit8 p1, p1, 0x2

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    sub-int/2addr p2, p4

    .line 20
    div-int/lit8 p2, p2, 0x2

    .line 21
    .line 22
    invoke-virtual {p3, p1, p2}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 23
    .line 24
    .line 25
    iget p1, p0, Lcom/android/launcher3/BubbleTextView;->p:I

    .line 26
    .line 27
    const/4 p2, 0x5

    .line 28
    if-eq p1, p2, :cond_0

    .line 29
    .line 30
    const-string p1, "b/387844520"

    .line 31
    .line 32
    const-string p2, "calling updateRingPath from onSizeChanged"

    .line 33
    .line 34
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->w1()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public q1(Landroid/view/View$OnLongClickListener;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lc1/b;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p1, Lc1/b;->i:Z

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->W0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public r1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 2
    .line 3
    return p0
.end method

.method public setForceHideRing(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->X0:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->X0:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    const/4 p1, 0x2

    .line 15
    new-array p1, p1, [F

    .line 16
    .line 17
    fill-array-data p1, :array_0

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->l1([F)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :array_0
    .array-data 4
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public setIconDisabled(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setIconDisabled(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->K0:Landroid/graphics/Paint;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ls1/o;->g()Landroid/graphics/ColorFilter;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected setItemInfo(Lcom/android/launcher3/model/data/z;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setItemInfo(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->setIconDisabled(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->w1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public u1(Lcom/android/launcher3/model/data/I;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->Q0:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/android/launcher3/touch/A;->a:Landroid/view/View$OnLongClickListener;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lc1/b;

    .line 22
    .line 23
    iput-boolean v0, p1, Lc1/b;->i:Z

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidate()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
