.class public final Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;
.super Lcom/android/launcher3/popup/c;
.source "TaskbarDividerPopupView.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/launcher3/taskbar/I1;",
        ">",
        "Lcom/android/launcher3/popup/c<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final s:Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;


# instance fields
.field private g:Landroid/view/View;

.field private h:F

.field private final i:Lcom/android/launcher3/taskbar/I1;

.field private final j:F

.field private final k:F

.field private final l:F

.field private final m:F

.field private final n:F

.field private o:Z

.field private p:Z

.field private q:I

.field private r:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->s:Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    const-string p3, "lookupContext(...)"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lcom/android/launcher3/taskbar/I1;

    iput-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->i:Lcom/android/launcher3/taskbar/I1;

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->k(Landroid/content/Context;)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->j:F

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f0709e4

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->k:F

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f0709dd

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->l:F

    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f0709dc

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->m:F

    .line 9
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f070ba9

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->n:F

    .line 10
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->c()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->o:Z

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070baa

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->q:I

    .line 12
    new-instance p1, Lcom/android/launcher3/taskbar/T1;

    invoke-direct {p1}, Lcom/android/launcher3/taskbar/T1;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->r:Lu4/l;

    .line 13
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeStartDelay:I

    .line 14
    iget p1, p0, Lcom/android/launcher3/popup/c;->mOpenFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mOpenChildFadeDuration:I

    .line 15
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeStartDelay:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeStartDelay:I

    .line 16
    iget p1, p0, Lcom/android/launcher3/popup/c;->mCloseChildFadeDuration:I

    iput p1, p0, Lcom/android/launcher3/popup/c;->mCloseFadeDuration:I

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 2
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic Q(Z)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->Y(Z)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R(Landroid/widget/Switch;Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->c0(Landroid/widget/Switch;Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->a0(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic T(Z)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->Z(Z)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->b0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic V(Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;Landroid/view/View;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->d0(Landroid/view/View;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final varargs W(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;[F)",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .line 1
    array-length p0, p3

    .line 2
    invoke-static {p3, p0}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-static {p1, p2, p0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "ofFloat(...)"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p1, 0x53

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    sget-object p1, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method private final X()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->p:Z

    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$b;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$b;-><init>(Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0x14d

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static final Y(Z)Lh4/t;
    .locals 0

    .line 1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 2
    .line 3
    return-object p0
.end method

.method private static final Z(Z)Lh4/t;
    .locals 0

    .line 1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 2
    .line 3
    return-object p0
.end method

.method private static final a0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "null cannot be cast to non-null type android.view.View"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast p0, Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method private static final b0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "null cannot be cast to non-null type android.view.View"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast p0, Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static final c0(Landroid/widget/Switch;Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p2, p1, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->o:Z

    .line 2
    .line 3
    xor-int/lit8 p2, p2, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p1}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->X()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final d0(Landroid/view/View;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "F)",
            "Lcom/android/launcher3/taskbar/TaskbarDividerPopupView<",
            "*>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->g:Landroid/view/View;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->h:F

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->e0()V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method private final e0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "null cannot be cast to non-null type android.graphics.drawable.GradientDrawable"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const v2, 0x7f06070d

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/Context;->getColor(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 33
    .line 34
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadii()[F

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private final getCloseAnimator()Landroid/animation/AnimatorSet;
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    new-array v3, v2, [F

    .line 5
    .line 6
    fill-array-data v3, :array_0

    .line 7
    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->o:Z

    .line 10
    .line 11
    if-nez v4, :cond_0

    .line 12
    .line 13
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->q:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->q:I

    .line 17
    .line 18
    neg-int v4, v4

    .line 19
    :goto_0
    sget-object v5, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 20
    .line 21
    const-string v6, "ALPHA"

    .line 22
    .line 23
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    invoke-direct {p0, p0, v5, v7}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->W(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    iget-object v8, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 35
    .line 36
    const-string v9, "mArrow"

    .line 37
    .line 38
    invoke-static {v8, v9}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([FI)[F

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-direct {p0, v8, v5, v3}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->W(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    sget-object v5, Landroid/widget/LinearLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationY()F

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationY()F

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    int-to-float v4, v4

    .line 63
    add-float/2addr v8, v4

    .line 64
    new-array v9, v2, [F

    .line 65
    .line 66
    aput v6, v9, v1

    .line 67
    .line 68
    aput v8, v9, v0

    .line 69
    .line 70
    invoke-static {p0, v5, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    iget-object v8, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {v8}, Landroid/view/View;->getTranslationY()F

    .line 77
    .line 78
    .line 79
    move-result v9

    .line 80
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    add-float/2addr p0, v4

    .line 87
    new-array v4, v2, [F

    .line 88
    .line 89
    aput v9, v4, v1

    .line 90
    .line 91
    aput p0, v4, v0

    .line 92
    .line 93
    invoke-static {v8, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 98
    .line 99
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 100
    .line 101
    .line 102
    const/4 v5, 0x4

    .line 103
    new-array v5, v5, [Landroid/animation/Animator;

    .line 104
    .line 105
    aput-object v7, v5, v1

    .line 106
    .line 107
    aput-object v3, v5, v0

    .line 108
    .line 109
    aput-object v6, v5, v2

    .line 110
    .line 111
    const/4 v0, 0x3

    .line 112
    aput-object p0, v5, v0

    .line 113
    .line 114
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 115
    .line 116
    .line 117
    return-object v4

    .line 118
    nop

    .line 119
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method protected addArrow()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/popup/c;->addArrow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->E0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x2

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 12
    .line 13
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->n:F

    .line 14
    .line 15
    iget v3, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 16
    .line 17
    int-to-float v3, v3

    .line 18
    add-float/2addr v2, v3

    .line 19
    iget v3, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->h:F

    .line 20
    .line 21
    iget v4, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 22
    .line 23
    div-int/2addr v4, v1

    .line 24
    int-to-float v1, v4

    .line 25
    sub-float/2addr v3, v1

    .line 26
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    int-to-float v2, v2

    .line 39
    iget v3, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->n:F

    .line 40
    .line 41
    sub-float/2addr v2, v3

    .line 42
    iget v3, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 43
    .line 44
    int-to-float v3, v3

    .line 45
    sub-float/2addr v2, v3

    .line 46
    iget p0, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 47
    .line 48
    int-to-float p0, p0

    .line 49
    sub-float/2addr v2, p0

    .line 50
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {v0, p0}, Landroid/view/View;->setX(F)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    new-array v0, v1, [I

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->g:Landroid/view/View;

    .line 65
    .line 66
    const/4 v4, 0x0

    .line 67
    const-string v5, "dividerView"

    .line 68
    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    invoke-static {v5}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    move-object v3, v4

    .line 75
    :cond_1
    invoke-virtual {v2, v3, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 76
    .line 77
    .line 78
    const/4 v2, 0x0

    .line 79
    aget v0, v0, v2

    .line 80
    .line 81
    int-to-float v0, v0

    .line 82
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 83
    .line 84
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->g:Landroid/view/View;

    .line 85
    .line 86
    if-nez v3, :cond_2

    .line 87
    .line 88
    invoke-static {v5}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    move-object v4, v3

    .line 93
    :goto_0
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    div-int/2addr v3, v1

    .line 98
    int-to-float v3, v3

    .line 99
    add-float/2addr v0, v3

    .line 100
    iget p0, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 101
    .line 102
    div-int/2addr p0, v1

    .line 103
    int-to-float p0, p0

    .line 104
    sub-float/2addr v0, p0

    .line 105
    invoke-virtual {v2, v0}, Landroid/view/View;->setX(F)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public getExtraVerticalOffset()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Lcom/android/launcher3/h0;->r3:I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 12
    .line 13
    check-cast v1, Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v1, v1, Lcom/android/launcher3/h0;->u3:I

    .line 20
    .line 21
    sub-int/2addr v0, v1

    .line 22
    div-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->q:I

    .line 25
    .line 26
    add-int/2addr v0, p0

    .line 27
    return v0
.end method

.method public final getOnCloseCallback()Lu4/l;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lu4/l<",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->r:Lu4/l;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getTargetObjectLocation(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    const-string v0, "outPos"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->g:Landroid/view/View;

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "dividerView"

    .line 15
    .line 16
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    :cond_0
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x200000

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->g:Landroid/view/View;

    .line 29
    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    const-string p0, "dividerView"

    .line 33
    .line 34
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    :cond_1
    invoke-virtual {v1, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    return v0

    .line 45
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method protected onCreateCloseAnimation(Landroid/animation/AnimatorSet;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->p:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->getCloseAnimator()Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->r:Lu4/l;

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->p:Z

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p1, v0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance p1, Lcom/android/launcher3/taskbar/X1;

    .line 23
    .line 24
    invoke-direct {p1}, Lcom/android/launcher3/taskbar/X1;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->r:Lu4/l;

    .line 28
    .line 29
    return-void
.end method

.method protected onFinishInflate()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSwitchCompatOrMaterialCode",
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b05dd

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "requireViewById(...)"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    check-cast v0, Landroid/widget/LinearLayout;

    .line 17
    .line 18
    const v2, 0x7f0b05da

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    check-cast v2, Landroid/widget/Switch;

    .line 29
    .line 30
    const v3, 0x7f0b05db

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v3, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->o:Z

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Lcom/android/launcher3/taskbar/U1;

    .line 46
    .line 47
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/U1;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v1}, Landroid/widget/Switch;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Lcom/android/launcher3/taskbar/V1;

    .line 54
    .line 55
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/V1;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v1}, Landroid/widget/Switch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->i:Lcom/android/launcher3/taskbar/I1;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_0

    .line 68
    .line 69
    new-instance v1, Lcom/android/launcher3/taskbar/W1;

    .line 70
    .line 71
    invoke-direct {v1, v2, p0}, Lcom/android/launcher3/taskbar/W1;-><init>(Landroid/widget/Switch;Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    const/4 v0, 0x0

    .line 79
    invoke-virtual {v2, v0}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 80
    .line 81
    .line 82
    :goto_0
    invoke-virtual {v2}, Landroid/widget/Switch;->isEnabled()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_1

    .line 87
    .line 88
    invoke-virtual {v3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const v2, 0x1060031

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v2, p0}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 112
    .line 113
    .line 114
    :cond_1
    return-void
.end method

.method protected orientAboutObject()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/popup/c;->orientAboutObject()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->E0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->h:F

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    int-to-float v2, v2

    .line 19
    div-float/2addr v2, v1

    .line 20
    sub-float/2addr v0, v2

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    sub-int/2addr v1, v2

    .line 34
    int-to-float v1, v1

    .line 35
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->n:F

    .line 36
    .line 37
    sub-float/2addr v1, v2

    .line 38
    cmpg-float v3, v0, v2

    .line 39
    .line 40
    if-gez v3, :cond_0

    .line 41
    .line 42
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->h:F

    .line 43
    .line 44
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 45
    .line 46
    int-to-float v1, v1

    .line 47
    sub-float/2addr v0, v1

    .line 48
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 49
    .line 50
    div-int/lit8 v1, v1, 0x2

    .line 51
    .line 52
    int-to-float v1, v1

    .line 53
    sub-float/2addr v0, v1

    .line 54
    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    cmpl-float v1, v0, v1

    .line 60
    .line 61
    if-lez v1, :cond_2

    .line 62
    .line 63
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->h:F

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    int-to-float v1, v1

    .line 70
    sub-float/2addr v0, v1

    .line 71
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetHorizontal:I

    .line 72
    .line 73
    int-to-float v1, v1

    .line 74
    add-float/2addr v0, v1

    .line 75
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 76
    .line 77
    div-int/lit8 v1, v1, 0x2

    .line 78
    .line 79
    int-to-float v1, v1

    .line 80
    add-float/2addr v0, v1

    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    sub-int/2addr v1, v2

    .line 94
    int-to-float v1, v1

    .line 95
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->n:F

    .line 96
    .line 97
    sub-float/2addr v1, v2

    .line 98
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    goto :goto_0

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    int-to-float v0, v0

    .line 110
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    int-to-float v2, v2

    .line 115
    div-float/2addr v2, v1

    .line 116
    sub-float/2addr v0, v2

    .line 117
    :cond_2
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setX(F)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final setOnCloseCallback(Lu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->r:Lu4/l;

    .line 7
    .line 8
    return-void
.end method

.method protected setPivotForOpenCloseAnimation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/popup/c;->mArrowWidth:I

    .line 8
    .line 9
    div-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    int-to-float v1, v1

    .line 12
    add-float/2addr v0, v1

    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getX()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-float/2addr v0, v1

    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float v0, v0

    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method protected updateArrowColor()V
    .locals 13

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->E0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/launcher3/popup/c;->updateArrowColor()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v0, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 12
    .line 13
    invoke-static {v0}, Landroid/view/Gravity;->isVertical(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 20
    .line 21
    new-instance v1, Lcom/android/launcher3/popup/A;

    .line 22
    .line 23
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->k:F

    .line 24
    .line 25
    iget v3, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->l:F

    .line 26
    .line 27
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->m:F

    .line 28
    .line 29
    iget v5, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->j:F

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    int-to-float v6, v6

    .line 36
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    int-to-float v7, v7

    .line 41
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    int-to-float v8, v8

    .line 46
    iget v9, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->k:F

    .line 47
    .line 48
    sub-float/2addr v8, v9

    .line 49
    const/4 v9, 0x2

    .line 50
    int-to-float v9, v9

    .line 51
    div-float/2addr v8, v9

    .line 52
    iget v9, p0, Lcom/android/launcher3/popup/c;->mArrowOffsetVertical:I

    .line 53
    .line 54
    int-to-float v9, v9

    .line 55
    neg-float v9, v9

    .line 56
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v10

    .line 60
    const v11, 0x7f06070d

    .line 61
    .line 62
    .line 63
    invoke-virtual {v10, v11}, Landroid/content/Context;->getColor(I)I

    .line 64
    .line 65
    .line 66
    move-result v12

    .line 67
    const/4 v10, 0x0

    .line 68
    const/4 v11, 0x1

    .line 69
    invoke-direct/range {v1 .. v12}, Lcom/android/launcher3/popup/A;-><init>(FFFFFFFFZZI)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Lcom/android/launcher3/popup/c;->mElevation:F

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 81
    .line 82
    iget p0, p0, Lcom/android/launcher3/popup/c;->mElevation:F

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Landroid/view/View;->setElevation(F)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method
