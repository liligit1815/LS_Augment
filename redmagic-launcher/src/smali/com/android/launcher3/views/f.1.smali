.class public abstract Lcom/android/launcher3/views/f;
.super Lcom/android/launcher3/a;
.source "AbstractSlideInView.java"

# interfaces
.implements Lcom/android/launcher3/touch/H$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/f$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/a;",
        "Lcom/android/launcher3/touch/H$d;"
    }
.end annotation


# static fields
.field public static final C:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/views/f<",
            "*>;>;"
        }
    .end annotation
.end field

.field public static final D:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/views/f<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field protected final A:Landroid/view/ViewOutlineProvider;

.field protected B:F

.field protected final g:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected final h:Lcom/android/launcher3/touch/H;

.field protected i:Lcom/android/launcher3/anim/q;

.field protected j:Landroid/view/ViewGroup;

.field protected final k:Landroid/view/View;

.field protected l:Landroid/view/animation/Interpolator;

.field private m:J

.field private n:F

.field protected o:F

.field protected p:F

.field protected q:F

.field private r:F

.field protected s:Z

.field protected t:Lcom/android/launcher3/views/f$e;

.field protected u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/views/f$e;",
            ">;"
        }
    .end annotation
.end field

.field protected final v:Lcom/android/launcher3/anim/d;

.field protected w:Z

.field private x:Landroid/view/View;

.field private y:Landroid/graphics/drawable/Drawable;

.field private z:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/views/f$a;

    .line 2
    .line 3
    const-string v1, "translationShift"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/views/f$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/views/f;->C:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/views/f$d;

    .line 11
    .line 12
    const-string v1, "translationShiftX"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/views/f$d;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/views/f;->D:Landroid/util/FloatProperty;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/views/f;->o:F

    .line 7
    .line 8
    new-instance p2, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/views/f;->u:Ljava/util/List;

    .line 14
    .line 15
    new-instance p2, Lcom/android/launcher3/anim/d;

    .line 16
    .line 17
    new-instance p3, Lcom/android/launcher3/views/a;

    .line 18
    .line 19
    invoke-direct {p3, p0}, Lcom/android/launcher3/views/a;-><init>(Lcom/android/launcher3/views/f;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-direct {p2, p3, v0}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;F)V

    .line 24
    .line 25
    .line 26
    iput-object p2, p0, Lcom/android/launcher3/views/f;->v:Lcom/android/launcher3/anim/d;

    .line 27
    .line 28
    iput-object p0, p0, Lcom/android/launcher3/views/f;->x:Landroid/view/View;

    .line 29
    .line 30
    new-instance p2, Lcom/android/launcher3/views/f$b;

    .line 31
    .line 32
    invoke-direct {p2, p0}, Lcom/android/launcher3/views/f$b;-><init>(Lcom/android/launcher3/views/f;)V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Lcom/android/launcher3/views/f;->A:Landroid/view/ViewOutlineProvider;

    .line 36
    .line 37
    iput v0, p0, Lcom/android/launcher3/views/f;->B:F

    .line 38
    .line 39
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    iput-object p2, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 44
    .line 45
    sget-object p2, LJ0/h;->a0:Landroid/view/animation/Interpolator;

    .line 46
    .line 47
    iput-object p2, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 48
    .line 49
    const-wide/16 p2, 0x12c

    .line 50
    .line 51
    iput-wide p2, p0, Lcom/android/launcher3/views/f;->m:J

    .line 52
    .line 53
    new-instance p2, Lcom/android/launcher3/touch/H;

    .line 54
    .line 55
    sget-object p3, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 56
    .line 57
    invoke-direct {p2, p1, p0, p3}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 58
    .line 59
    .line 60
    iput-object p2, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 61
    .line 62
    new-instance p2, Lcom/android/launcher3/anim/V;

    .line 63
    .line 64
    const-wide/16 v0, 0x0

    .line 65
    .line 66
    invoke-direct {p2, v0, v1}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    iput-object p2, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->X(Landroid/content/Context;)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    const/4 p3, -0x1

    .line 80
    if-eq p2, p3, :cond_0

    .line 81
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/views/f;->V(Landroid/content/Context;I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    goto :goto_0

    .line 87
    :cond_0
    const/4 p1, 0x0

    .line 88
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/views/f;->k:Landroid/view/View;

    .line 89
    .line 90
    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/views/f;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/f;->b0(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/android/launcher3/views/f;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/f;->c0(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic Q(Lcom/android/launcher3/views/f;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/f;->x:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method private W(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->y:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/views/f;->z:Landroid/view/View;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Lcom/android/launcher3/views/f;->z:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v3, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getTranslationY()F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    float-to-int v3, v3

    .line 27
    add-int/2addr v2, v3

    .line 28
    iget-object v3, p0, Lcom/android/launcher3/views/f;->z:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget-object v4, p0, Lcom/android/launcher3/views/f;->z:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    iget-boolean v5, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 41
    .line 42
    if-eqz v5, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getBottomOffsetPx()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 v5, 0x0

    .line 50
    :goto_0
    add-int/2addr v4, v5

    .line 51
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/launcher3/views/f;->y:Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_1
    return-void
.end method

.method private synthetic b0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic c0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private i0(J)Lcom/android/launcher3/anim/q;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/launcher3/views/f;->l0(FFJ)Lcom/android/launcher3/anim/q;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private l0(FFJ)Lcom/android/launcher3/anim/q;
    .locals 6

    .line 1
    iput p1, p0, Lcom/android/launcher3/views/f;->p:F

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/views/f;->q:F

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 6
    .line 7
    invoke-direct {v0, p3, p4}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 8
    .line 9
    .line 10
    new-instance p3, Lcom/android/launcher3/views/d;

    .line 11
    .line 12
    invoke-direct {p3, p0}, Lcom/android/launcher3/views/d;-><init>(Lcom/android/launcher3/views/f;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p3}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 16
    .line 17
    .line 18
    sget-object v2, Lcom/android/launcher3/views/f;->C:Landroid/util/FloatProperty;

    .line 19
    .line 20
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    move v3, p1

    .line 24
    move v4, p2

    .line 25
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, v1, Lcom/android/launcher3/views/f;->k:Landroid/view/View;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    const/high16 p1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    sub-float/2addr p1, v4

    .line 35
    invoke-virtual {v1}, Lcom/android/launcher3/views/f;->getScrimInterpolator()Landroid/view/animation/Interpolator;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {v0, p0, p1, p2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {v1, v0}, Lcom/android/launcher3/views/f;->e0(Lcom/android/launcher3/anim/V;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iput-object p0, v1, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 50
    .line 51
    return-object p0
.end method


# virtual methods
.method public R(Lcom/android/launcher3/views/f$e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->u:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected S()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->v:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-wide/16 v1, 0xc8

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/android/launcher3/views/f;->x:Landroid/view/View;

    .line 15
    .line 16
    if-eq p0, v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Lcom/android/launcher3/views/f$c;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/launcher3/views/f$c;-><init>(Lcom/android/launcher3/views/f;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method protected T()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->k:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/android/launcher3/widget/AddItemWidgetsBottomSheet;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/views/f;->k:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method protected U()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method protected V(Landroid/content/Context;I)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p0, Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->forceHasOverlappingRendering(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 14
    .line 15
    const/4 p2, -0x1

    .line 16
    invoke-direct {p1, p2, p2}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    iput-boolean p2, p1, Lcom/android/launcher3/h1$a;->a:Z

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method protected X(Landroid/content/Context;)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public Y(ZJ)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->t:Lcom/android/launcher3/views/f$e;

    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/android/launcher3/views/b;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/android/launcher3/views/b;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 18
    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->u()V

    .line 25
    .line 26
    .line 27
    const/high16 p1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->setTranslationShift(F)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->d0()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-direct {p0, p2, p3}, Lcom/android/launcher3/views/f;->i0(J)Lcom/android/launcher3/anim/q;

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getIdleInterpolator()Landroid/view/animation/Interpolator;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object p2, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 70
    .line 71
    .line 72
    iget-wide p2, p0, Lcom/android/launcher3/views/f;->m:J

    .line 73
    .line 74
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 78
    .line 79
    invoke-virtual {p2}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget-object p3, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 84
    .line 85
    invoke-virtual {p3}, Lcom/android/launcher3/anim/q;->q()F

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    iget v0, p0, Lcom/android/launcher3/views/f;->n:F

    .line 90
    .line 91
    const/4 v1, 0x2

    .line 92
    new-array v1, v1, [F

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    aput p3, v1, v2

    .line 96
    .line 97
    const/4 p3, 0x1

    .line 98
    aput v0, v1, p3

    .line 99
    .line 100
    invoke-virtual {p2, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 101
    .line 102
    .line 103
    :goto_0
    new-instance p2, Lcom/android/launcher3/views/c;

    .line 104
    .line 105
    invoke-direct {p2, p0}, Lcom/android/launcher3/views/c;-><init>(Lcom/android/launcher3/views/f;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method protected Z(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method protected a0()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method protected d0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/views/f;->k:Landroid/view/View;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/android/launcher3/views/f;->k:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/views/f;->u:Ljava/util/List;

    .line 25
    .line 26
    new-instance v0, Lcom/android/launcher3/views/b;

    .line 27
    .line 28
    invoke-direct {v0}, Lcom/android/launcher3/views/b;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-interface {p0, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/f;->W(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected e0(Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected f0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->v:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v1, v0, v1

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    move v1, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 15
    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    sub-float/2addr v1, v0

    .line 19
    const v0, 0x3dccccd0    # 0.100000024f

    .line 20
    .line 21
    .line 22
    mul-float/2addr v1, v0

    .line 23
    const v0, 0x3f666666    # 0.9f

    .line 24
    .line 25
    .line 26
    add-float/2addr v1, v0

    .line 27
    sget-object v0, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 28
    .line 29
    iget-object v3, p0, Lcom/android/launcher3/views/f;->x:Landroid/view/View;

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v3, v1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 36
    .line 37
    .line 38
    iget-boolean v0, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 39
    .line 40
    xor-int/2addr v0, v2

    .line 41
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 42
    .line 43
    .line 44
    iget-boolean v0, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 45
    .line 46
    xor-int/2addr v0, v2

    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 51
    .line 52
    iget-boolean v1, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 53
    .line 54
    xor-int/2addr v1, v2

    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 59
    .line 60
    iget-boolean v1, p0, Lcom/android/launcher3/views/f;->w:Z

    .line 61
    .line 62
    xor-int/2addr v1, v2

    .line 63
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method protected g0(Landroid/graphics/drawable/Drawable;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/f;->y:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/views/f;->z:Landroid/view/View;

    .line 4
    .line 5
    return-void
.end method

.method protected getBottomOffsetPx()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const v0, 0x3dccccd0    # 0.100000024f

    .line 7
    .line 8
    .line 9
    mul-float/2addr p0, v0

    .line 10
    float-to-int p0, p0

    .line 11
    return p0
.end method

.method protected getIdleInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method protected getScrimInterpolator()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getShiftRange()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    return p0
.end method

.method protected h0(FFJ)Lcom/android/launcher3/anim/q;
    .locals 6

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    invoke-direct {v0, p3, p4}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p3, Lcom/android/launcher3/views/e;

    .line 7
    .line 8
    invoke-direct {p3, p0}, Lcom/android/launcher3/views/e;-><init>(Lcom/android/launcher3/views/f;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p3}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    sget-object v2, Lcom/android/launcher3/views/f;->D:Landroid/util/FloatProperty;

    .line 15
    .line 16
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    move-object v1, p0

    .line 19
    move v3, p1

    .line 20
    move v4, p2

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/android/launcher3/views/f;->e0(Lcom/android/launcher3/anim/V;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iput-object p0, v1, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 32
    .line 33
    return-object p0
.end method

.method protected final j0()Lcom/android/launcher3/anim/q;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const-wide/16 v1, 0x12c

    .line 3
    .line 4
    const/high16 v3, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-direct {p0, v3, v0, v1, v2}, Lcom/android/launcher3/views/f;->l0(FFJ)Lcom/android/launcher3/anim/q;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method protected final k0(J)Lcom/android/launcher3/anim/q;
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/android/launcher3/views/f;->l0(FFJ)Lcom/android/launcher3/anim/q;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method protected m0(FJ)Lcom/android/launcher3/anim/q;
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/android/launcher3/views/f;->l0(FFJ)Lcom/android/launcher3/anim/q;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected n0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onBackCancelled()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/window/OnBackAnimationCallback;->onBackCancelled()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->S()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onBackProgressed(Landroid/window/BackEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/window/BackEvent;->getProgress()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/f;->v:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onBackStarted(Landroid/window/BackEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/window/OnBackAnimationCallback;->onBackStarted(Landroid/window/BackEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->n0()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object p1, p0

    .line 14
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/views/f;->x:Landroid/view/View;

    .line 15
    .line 16
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->h()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move v0, v1

    .line 18
    :goto_0
    instance-of v2, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 19
    .line 20
    if-nez v2, :cond_2

    .line 21
    .line 22
    instance-of v2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 23
    .line 24
    if-nez v2, :cond_2

    .line 25
    .line 26
    instance-of v2, p0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 27
    .line 28
    if-nez v2, :cond_2

    .line 29
    .line 30
    instance-of v2, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 31
    .line 32
    if-eqz v2, :cond_4

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->h()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v0, 0x3

    .line 43
    goto :goto_1

    .line 44
    :cond_3
    move v0, v1

    .line 45
    :cond_4
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 46
    .line 47
    invoke-virtual {v2, v0, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_6

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->Z(Landroid/view/MotionEvent;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_5

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_5
    return v1

    .line 71
    :cond_6
    :goto_2
    const/4 p0, 0x1

    .line 72
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->h()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->a0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->Z(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return v1
.end method

.method public onDrag(F)Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/views/f;->r:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/views/f;->q:F

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/views/f;->p:F

    .line 6
    .line 7
    sub-float/2addr v1, v2

    .line 8
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getShiftRange()F

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    div-float/2addr p1, v2

    .line 17
    mul-float/2addr v1, p1

    .line 18
    add-float/2addr v0, v1

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    const/high16 v1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-static {v0, p1, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public onDragEnd(F)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 3
    .line 4
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const v1, 0x3e99999a    # 0.3f

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/high16 v1, 0x3f000000    # 0.5f

    .line 19
    .line 20
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/high16 v3, 0x3f800000    # 1.0f

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    cmpl-float v2, p1, v4

    .line 32
    .line 33
    if-gtz v2, :cond_2

    .line 34
    .line 35
    :cond_1
    iget v2, p0, Lcom/android/launcher3/views/f;->o:F

    .line 36
    .line 37
    cmpl-float v1, v2, v1

    .line 38
    .line 39
    if-lez v1, :cond_4

    .line 40
    .line 41
    :cond_2
    invoke-static {p1}, LJ0/h;->o(F)Landroid/view/animation/Interpolator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 46
    .line 47
    iget v1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 48
    .line 49
    sub-float v1, v3, v1

    .line 50
    .line 51
    invoke-static {p1, v1}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 52
    .line 53
    .line 54
    move-result-wide v1

    .line 55
    iput-wide v1, p0, Lcom/android/launcher3/views/f;->m:J

    .line 56
    .line 57
    iget p1, p0, Lcom/android/launcher3/views/f;->q:F

    .line 58
    .line 59
    cmpl-float p1, p1, v4

    .line 60
    .line 61
    if-nez p1, :cond_3

    .line 62
    .line 63
    move v3, v4

    .line 64
    :cond_3
    iput v3, p0, Lcom/android/launcher3/views/f;->n:F

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget-object v2, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/android/launcher3/anim/q;->q()F

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    iget v5, p0, Lcom/android/launcher3/views/f;->q:F

    .line 88
    .line 89
    cmpl-float v5, v5, v4

    .line 90
    .line 91
    if-nez v5, :cond_5

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_5
    move v3, v4

    .line 95
    :goto_1
    const/4 v4, 0x2

    .line 96
    new-array v4, v4, [F

    .line 97
    .line 98
    const/4 v5, 0x0

    .line 99
    aput v2, v4, v5

    .line 100
    .line 101
    aput v3, v4, v0

    .line 102
    .line 103
    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 104
    .line 105
    .line 106
    iget p0, p0, Lcom/android/launcher3/views/f;->o:F

    .line 107
    .line 108
    invoke-static {p1, p0}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 109
    .line 110
    .line 111
    move-result-wide p0

    .line 112
    invoke-virtual {v1, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->u()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->q()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/android/launcher3/views/f;->r:F

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-wide/16 p1, 0x12c

    .line 28
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/views/f;->i0(J)Lcom/android/launcher3/anim/q;

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lcom/android/launcher3/views/f;->r:F

    .line 34
    .line 35
    return-void
.end method

.method public setOnCloseBeginListener(Lcom/android/launcher3/views/f$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/f;->t:Lcom/android/launcher3/views/f$e;

    .line 2
    .line 3
    return-void
.end method

.method protected setTranslationShift(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    check-cast v0, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getShiftRange()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    mul-float/2addr p1, v1

    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getShiftRange()F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    mul-float/2addr p1, v1

    .line 26
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method protected setTranslationShiftX(F)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/launcher3/views/f;->B:F

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public shrink(Z)V
    .locals 0

    .line 1
    return-void
.end method
