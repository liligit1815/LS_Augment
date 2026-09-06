.class public Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "KeyboardQuickSwitchTaskView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;,
        Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$a;
    }
.end annotation


# instance fields
.field private final g:I

.field private final h:I

.field private i:Lcom/android/quickstep/util/BorderAnimator;

.field private j:Landroid/widget/ImageView;

.field private k:Landroid/widget/ImageView;

.field private l:Landroid/widget/ImageView;

.field private m:Landroid/widget/ImageView;

.field private n:Landroid/view/View;

.field private o:I

.field private p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 v0, -0x1

    .line 4
    iput v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->o:I

    .line 5
    iput v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->p:I

    .line 6
    sget-object v1, Lcom/android/launcher3/x5;->s3:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    .line 7
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 8
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->g:I

    const/4 p2, 0x1

    .line 9
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->h:I

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->p(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->s(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->r(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;Landroid/graphics/Rect;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->q(Landroid/graphics/Rect;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private l(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p2, v0, p0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    :cond_3
    :goto_0
    return-void
.end method

.method private m(Landroid/widget/ImageView;ILcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p3}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p3, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {p1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    move p2, v0

    .line 27
    :goto_1
    invoke-virtual {p3, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 28
    .line 29
    .line 30
    new-instance p2, Lcom/android/launcher3/taskbar/c;

    .line 31
    .line 32
    const/high16 p3, 0x3f800000    # 1.0f

    .line 33
    .line 34
    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/taskbar/c;-><init>(Landroid/graphics/Bitmap;F)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private n(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-nez p3, :cond_1

    .line 7
    .line 8
    iget p3, p2, Lcom/android/systemui/shared/recents/model/Task;->colorBackground:I

    .line 9
    .line 10
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->thumbnail:Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 11
    .line 12
    invoke-direct {p0, p1, p3, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->m(Landroid/widget/ImageView;ILcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    new-instance v0, Lcom/android/launcher3/taskbar/w;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/taskbar/w;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p3, p2, v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;->a(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V

    .line 22
    .line 23
    .line 24
    :cond_2
    :goto_0
    return-void
.end method

.method private synthetic p(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V
    .locals 0

    .line 1
    iget p2, p2, Lcom/android/systemui/shared/recents/model/Task;->colorBackground:I

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->m(Landroid/widget/ImageView;ILcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q(Landroid/graphics/Rect;)Lh4/t;
    .locals 2

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
    move-result p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v1, v1, v0, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 14
    .line 15
    return-object p0
.end method

.method private synthetic r(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->l:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-direct {p0, p3, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->l(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p2, 0x0

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->w(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic s(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->m:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-direct {p0, p3, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->l(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->w(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private w(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 15
    .line 16
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const p2, 0x7f14031e

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_1
    :goto_0
    iget p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->o:I

    .line 28
    .line 29
    if-gez p1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_3
    const-string v0, ""

    .line 43
    .line 44
    :goto_1
    iget p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->o:I

    .line 45
    .line 46
    add-int/lit8 p2, p2, 0x1

    .line 47
    .line 48
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iget v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->p:I

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    filled-new-array {v0, p2, v1}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const v0, 0x7f14031f

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->i:Lcom/android/quickstep/util/BorderAnimator;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BorderAnimator;->drawBorder(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected o(Z)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->i:Lcom/android/quickstep/util/BorderAnimator;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BorderAnimator;->buildAnimator(Z)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 9

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0604

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->j:Landroid/widget/ImageView;

    .line 14
    .line 15
    const v0, 0x7f0b0605

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/ImageView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->k:Landroid/widget/ImageView;

    .line 25
    .line 26
    const v0, 0x7f0b02ff

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/ImageView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->l:Landroid/widget/ImageView;

    .line 36
    .line 37
    const v0, 0x7f0b0300

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/widget/ImageView;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->m:Landroid/widget/ImageView;

    .line 47
    .line 48
    const v0, 0x7f0b018d

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->n:Landroid/view/View;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/android/launcher3/util/U1;->b(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->n:Landroid/view/View;

    .line 61
    .line 62
    const v1, 0x7f0b0337

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Landroid/widget/TextView;

    .line 70
    .line 71
    sget-object v1, Lcom/android/wm/shell/shared/o$b;->z:Lcom/android/wm/shell/shared/o$b;

    .line 72
    .line 73
    invoke-static {v0, v1}, Lcom/android/wm/shell/shared/o;->a(Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->n:Landroid/view/View;

    .line 77
    .line 78
    const v1, 0x7f0b0560

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/widget/TextView;

    .line 86
    .line 87
    sget-object v1, Lcom/android/wm/shell/shared/o$b;->q:Lcom/android/wm/shell/shared/o$b;

    .line 88
    .line 89
    invoke-static {v0, v1}, Lcom/android/wm/shell/shared/o;->a(Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Landroid/view/ViewGroup;->mContext:Landroid/content/Context;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->h:I

    .line 99
    .line 100
    const/4 v2, -0x1

    .line 101
    if-eq v1, v2, :cond_0

    .line 102
    .line 103
    :goto_0
    move v2, v1

    .line 104
    goto :goto_1

    .line 105
    :cond_0
    const v1, 0x7f0704f8

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    goto :goto_0

    .line 113
    :goto_1
    const v1, 0x7f0704eb

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    const v1, 0x7f0704ea

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    new-instance v5, Lcom/android/launcher3/taskbar/t;

    .line 128
    .line 129
    invoke-direct {v5, p0}, Lcom/android/launcher3/taskbar/t;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;)V

    .line 130
    .line 131
    .line 132
    iget-object v7, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->n:Landroid/view/View;

    .line 133
    .line 134
    iget v8, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->g:I

    .line 135
    .line 136
    move-object v6, p0

    .line 137
    invoke-static/range {v2 .. v8}, Lcom/android/quickstep/util/BorderAnimator;->createScalingBorderAnimator(IIILu4/l;Landroid/view/View;Landroid/view/View;I)Lcom/android/quickstep/util/BorderAnimator;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iput-object p0, v6, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->i:Lcom/android/quickstep/util/BorderAnimator;

    .line 142
    .line 143
    return-void
.end method

.method protected t(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->o:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->p:I

    .line 4
    .line 5
    return-void
.end method

.method protected u(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->j:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->n(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->k:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-direct {p0, v0, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->n(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->w(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 12
    .line 13
    .line 14
    if-nez p4, :cond_0

    .line 15
    .line 16
    iget-object p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->l:Landroid/widget/ImageView;

    .line 17
    .line 18
    invoke-direct {p0, p3, p1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->l(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->m:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->l(Landroid/widget/ImageView;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance p3, Lcom/android/launcher3/taskbar/u;

    .line 28
    .line 29
    invoke-direct {p3, p0, p1, p2}, Lcom/android/launcher3/taskbar/u;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p4, p1, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$a;->a(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V

    .line 33
    .line 34
    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    new-instance p3, Lcom/android/launcher3/taskbar/v;

    .line 39
    .line 40
    invoke-direct {p3, p0, p2, p1}, Lcom/android/launcher3/taskbar/v;-><init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p4, p2, p3}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$a;->a(Lcom/android/systemui/shared/recents/model/Task;Ljava/util/function/Consumer;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method protected v(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$a;Lcom/android/launcher3/util/y2$a;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->u(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$b;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView$a;)V

    .line 2
    .line 3
    .line 4
    if-nez p5, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-boolean p1, p5, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 8
    .line 9
    invoke-virtual {p5}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iget-object p3, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->j:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {p3}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    check-cast p3, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 20
    .line 21
    iget-object p4, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->k:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-virtual {p4}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    check-cast p4, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 28
    .line 29
    const p5, 0x7f0b0604

    .line 30
    .line 31
    .line 32
    const/high16 v0, 0x3f800000    # 1.0f

    .line 33
    .line 34
    const v1, 0x7f0b0605

    .line 35
    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    const/4 v3, 0x0

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput v3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 42
    .line 43
    iput v2, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 44
    .line 45
    iput p2, p3, Landroidx/constraintlayout/widget/ConstraintLayout$b;->V:F

    .line 46
    .line 47
    iput v3, p3, Landroidx/constraintlayout/widget/ConstraintLayout$b;->e:I

    .line 48
    .line 49
    iput v1, p3, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g:I

    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->j:Landroid/widget/ImageView;

    .line 52
    .line 53
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    iput v3, p4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 57
    .line 58
    iput v2, p4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 59
    .line 60
    sub-float/2addr v0, p2

    .line 61
    iput v0, p4, Landroidx/constraintlayout/widget/ConstraintLayout$b;->V:F

    .line 62
    .line 63
    iput p5, p4, Landroidx/constraintlayout/widget/ConstraintLayout$b;->f:I

    .line 64
    .line 65
    iput v3, p4, Landroidx/constraintlayout/widget/ConstraintLayout$b;->h:I

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->k:Landroid/widget/ImageView;

    .line 68
    .line 69
    invoke-virtual {p0, p4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    iput v3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 74
    .line 75
    iput v2, p3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 76
    .line 77
    iput p2, p3, Landroidx/constraintlayout/widget/ConstraintLayout$b;->W:F

    .line 78
    .line 79
    iput v3, p3, Landroidx/constraintlayout/widget/ConstraintLayout$b;->i:I

    .line 80
    .line 81
    iput v1, p3, Landroidx/constraintlayout/widget/ConstraintLayout$b;->k:I

    .line 82
    .line 83
    iget-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->j:Landroid/widget/ImageView;

    .line 84
    .line 85
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    .line 87
    .line 88
    iput v3, p4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 89
    .line 90
    iput v2, p4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 91
    .line 92
    sub-float/2addr v0, p2

    .line 93
    iput v0, p4, Landroidx/constraintlayout/widget/ConstraintLayout$b;->W:F

    .line 94
    .line 95
    iput p5, p4, Landroidx/constraintlayout/widget/ConstraintLayout$b;->j:I

    .line 96
    .line 97
    iput v3, p4, Landroidx/constraintlayout/widget/ConstraintLayout$b;->l:I

    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchTaskView;->k:Landroid/widget/ImageView;

    .line 100
    .line 101
    invoke-virtual {p0, p4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method
