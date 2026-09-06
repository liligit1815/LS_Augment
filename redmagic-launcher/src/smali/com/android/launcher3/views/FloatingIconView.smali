.class public Lcom/android/launcher3/views/FloatingIconView;
.super Landroid/widget/FrameLayout;
.source "FloatingIconView.java"

# interfaces
.implements Lcom/android/launcher3/anim/T;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Lcom/android/launcher3/views/J;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/FloatingIconView$c;,
        Lcom/android/launcher3/views/FloatingIconView$b;
    }
.end annotation


# static fields
.field private static F:Lcom/android/launcher3/views/FloatingIconView$b;

.field private static G:J

.field private static H:J

.field private static final I:Landroid/graphics/RectF;

.field private static J:Z


# instance fields
.field protected A:Landroid/graphics/drawable/Drawable;

.field private B:Landroid/graphics/Path;

.field private C:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field protected D:Z

.field private E:Lcom/android/launcher3/views/FloatingIconView$c;

.field private g:Ljava/lang/Runnable;

.field private h:Landroid/os/CancellationSignal;

.field private final i:Lcom/android/launcher3/C2;

.field private final j:Z

.field private k:Z

.field private l:Lcom/android/launcher3/views/FloatingIconView$b;

.field private m:Landroid/view/View;

.field private n:Lcom/android/launcher3/views/ClipIconView;

.field private o:Landroid/graphics/drawable/Drawable;

.field private p:Landroid/view/View;

.field private q:Landroid/view/View;

.field private r:Landroid/view/View;

.field private s:Landroid/graphics/RectF;

.field private t:Ljava/lang/Runnable;

.field private final u:Landroid/graphics/Rect;

.field private v:Lcom/android/launcher3/views/K;

.field private w:Ljava/lang/Runnable;

.field private x:F

.field protected y:Landroid/graphics/drawable/Drawable;

.field protected z:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/views/FloatingIconView;->I:Landroid/graphics/RectF;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/FloatingIconView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/views/FloatingIconView;->u:Landroid/graphics/Rect;

    .line 4
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-static {p3}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/views/FloatingIconView;->j:Z

    .line 6
    new-instance p3, Lcom/android/launcher3/views/K;

    invoke-direct {p3, p1, p2}, Lcom/android/launcher3/views/K;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p3, p0, Lcom/android/launcher3/views/FloatingIconView;->v:Lcom/android/launcher3/views/K;

    .line 7
    new-instance p3, Lcom/android/launcher3/views/ClipIconView;

    invoke-direct {p3, p1, p2}, Lcom/android/launcher3/views/ClipIconView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p3, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 8
    new-instance p3, Landroid/widget/ImageView;

    invoke-direct {p3, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p3, p0, Lcom/android/launcher3/views/FloatingIconView;->m:Landroid/view/View;

    .line 9
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 10
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 12
    new-instance p1, Lcom/android/launcher3/views/FloatingIconView$a;

    invoke-direct {p1, p0}, Lcom/android/launcher3/views/FloatingIconView$a;-><init>(Lcom/android/launcher3/views/FloatingIconView;)V

    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->C:Ljava/util/function/Supplier;

    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->E:Lcom/android/launcher3/views/FloatingIconView$c;

    return-void
.end method

.method private synthetic C(Landroid/os/CancellationSignal;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/os/CancellationSignal;->isCanceled()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/android/launcher3/views/FloatingIconView$b;->d:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/android/launcher3/views/FloatingIconView$b;->e:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    iget-object v2, p1, Lcom/android/launcher3/views/FloatingIconView$b;->c:Ljava/util/function/Supplier;

    .line 15
    .line 16
    iget p1, p1, Lcom/android/launcher3/views/FloatingIconView$b;->f:I

    .line 17
    .line 18
    invoke-direct {p0, v0, v1, v2, p1}, Lcom/android/launcher3/views/FloatingIconView;->M(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Ljava/util/function/Supplier;I)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/FloatingIconView;->R(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic D(Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->v:Lcom/android/launcher3/views/K;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private E(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;)V
    .locals 2

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/android/launcher3/views/FloatingIconView;->x(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/h1$a;

    .line 5
    .line 6
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    invoke-direct {p1, p2, p3}, Lcom/android/launcher3/h1$a;-><init>(II)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, p4, p1}, Lcom/android/launcher3/views/FloatingIconView;->Q(Landroid/graphics/RectF;Lcom/android/launcher3/h1$a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 32
    .line 33
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 34
    .line 35
    iget p4, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 36
    .line 37
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    invoke-direct {p3, p4, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->m:Landroid/view/View;

    .line 47
    .line 48
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 49
    .line 50
    iget p3, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 51
    .line 52
    iget p1, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 53
    .line 54
    invoke-direct {p2, p3, p1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private G()V
    .locals 5

    .line 1
    const-string v0, "FloatingIconView"

    .line 2
    .line 3
    const-string v1, "recycle"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/views/FloatingIconView;->L()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 16
    .line 17
    .line 18
    const/high16 v1, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->h:Landroid/os/CancellationSignal;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/os/CancellationSignal;->cancel()V

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->h:Landroid/os/CancellationSignal;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->g:Ljava/lang/Runnable;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/android/launcher3/views/FloatingIconView;->u:Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/graphics/Rect;->setEmpty()V

    .line 44
    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    iput-boolean v2, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 48
    .line 49
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->s:Landroid/graphics/RectF;

    .line 50
    .line 51
    iget-object v3, p0, Lcom/android/launcher3/views/FloatingIconView;->v:Lcom/android/launcher3/views/K;

    .line 52
    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    invoke-virtual {v3, v1}, Lcom/android/launcher3/views/K;->setListener(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 59
    .line 60
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->t:Ljava/lang/Runnable;

    .line 61
    .line 62
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->o:Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    sget-wide v3, Lcom/android/launcher3/views/FloatingIconView;->G:J

    .line 65
    .line 66
    sput-wide v3, Lcom/android/launcher3/views/FloatingIconView;->H:J

    .line 67
    .line 68
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 69
    .line 70
    iget-object v3, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 71
    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    invoke-virtual {v3}, Lcom/android/launcher3/views/ClipIconView;->g()V

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-object v3, p0, Lcom/android/launcher3/views/FloatingIconView;->m:Landroid/view/View;

    .line 78
    .line 79
    invoke-virtual {v3, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->w:Ljava/lang/Runnable;

    .line 83
    .line 84
    iput v0, p0, Lcom/android/launcher3/views/FloatingIconView;->x:F

    .line 85
    .line 86
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->p:Landroid/view/View;

    .line 87
    .line 88
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->q:Landroid/view/View;

    .line 89
    .line 90
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->B:Landroid/graphics/Path;

    .line 91
    .line 92
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->A:Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->z:Landroid/graphics/drawable/Drawable;

    .line 97
    .line 98
    sput-boolean v2, Lcom/android/launcher3/views/FloatingIconView;->J:Z

    .line 99
    .line 100
    return-void
.end method

.method public static H(Lcom/android/launcher3/C2;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v1, "FloatingIconView"

    .line 16
    .line 17
    const-string v2, "recycleFloatingIconView"

    .line 18
    .line 19
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const v2, 0x7f0e00d7

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2, p0, v0}, Lcom/android/launcher3/util/X2;->b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/android/launcher3/views/FloatingIconView;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/android/launcher3/views/FloatingIconView;->G()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, v2, v0}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public static I()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/android/launcher3/views/FloatingIconView;->F:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 3
    .line 4
    return-void
.end method

.method private M(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Ljava/util/function/Supplier;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            "Landroid/graphics/drawable/Drawable;",
            "Ljava/util/function/Supplier<",
            "Landroid/graphics/drawable/Drawable;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v6

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    move-object v4, v0

    .line 12
    check-cast v4, Lcom/android/launcher3/h1$a;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/android/launcher3/views/FloatingIconView;->o:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    instance-of p2, p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 17
    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    sget-boolean v0, Lcom/android/launcher3/views/FloatingIconView;->J:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget v0, v0, Lcom/android/launcher3/r4;->N:I

    .line 33
    .line 34
    mul-int/lit8 v0, v0, 0x2

    .line 35
    .line 36
    int-to-float v0, v0

    .line 37
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget v1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 42
    .line 43
    if-le v1, v0, :cond_0

    .line 44
    .line 45
    iget v2, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 46
    .line 47
    if-le v2, v0, :cond_0

    .line 48
    .line 49
    iget-object v3, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 50
    .line 51
    instance-of v5, v3, Lcom/android/launcher3/folder/FolderIcon;

    .line 52
    .line 53
    if-nez v5, :cond_0

    .line 54
    .line 55
    instance-of v3, v3, Lcom/android/quickstep/views/CapsuleView;

    .line 56
    .line 57
    if-nez v3, :cond_0

    .line 58
    .line 59
    sub-int/2addr v1, v0

    .line 60
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 61
    .line 62
    sub-int/2addr v2, v0

    .line 63
    iput v2, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 64
    .line 65
    invoke-virtual {p0, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 69
    .line 70
    if-eqz v0, :cond_0

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 77
    .line 78
    iget v1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 79
    .line 80
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 81
    .line 82
    iget v1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 83
    .line 84
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 85
    .line 86
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 92
    .line 93
    iget-boolean v5, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 94
    .line 95
    move-object v7, p0

    .line 96
    move-object v2, p1

    .line 97
    move v3, p4

    .line 98
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/views/ClipIconView;->i(Landroid/graphics/drawable/Drawable;ILandroid/view/ViewGroup$MarginLayoutParams;ZLcom/android/launcher3/h0;Landroid/view/View;)V

    .line 99
    .line 100
    .line 101
    if-eqz p2, :cond_2

    .line 102
    .line 103
    iget p0, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 104
    .line 105
    iget p1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 106
    .line 107
    iget-object p2, v7, Lcom/android/launcher3/views/FloatingIconView;->u:Landroid/graphics/Rect;

    .line 108
    .line 109
    const/4 p4, 0x0

    .line 110
    invoke-virtual {p2, p4, p4, p1, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string p1, "update: params error. "

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget p1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string p1, ", "

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget p1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const-string p1, "FloatingIconView"

    .line 143
    .line 144
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    invoke-virtual {v7, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    .line 149
    .line 150
    iget-object p0, v7, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 157
    .line 158
    iget-object p1, v7, Lcom/android/launcher3/views/FloatingIconView;->o:Landroid/graphics/drawable/Drawable;

    .line 159
    .line 160
    if-eqz p1, :cond_1

    .line 161
    .line 162
    new-instance p1, Landroid/graphics/Rect;

    .line 163
    .line 164
    iget p2, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 165
    .line 166
    iget v0, p0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 167
    .line 168
    invoke-direct {p1, p4, p4, p2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 169
    .line 170
    .line 171
    iget-object p2, v7, Lcom/android/launcher3/views/FloatingIconView;->o:Landroid/graphics/drawable/Drawable;

    .line 172
    .line 173
    invoke-static {p2, p1}, Ls1/o;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;)V

    .line 174
    .line 175
    .line 176
    :cond_1
    iget p1, v4, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 177
    .line 178
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 179
    .line 180
    iget p1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 181
    .line 182
    iput p1, p0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 183
    .line 184
    iget-object p1, v7, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 185
    .line 186
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    .line 188
    .line 189
    :cond_2
    invoke-direct {v7, p3}, Lcom/android/launcher3/views/FloatingIconView;->setOriginalDrawableBackground(Ljava/util/function/Supplier;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->invalidate()V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method private Q(Landroid/graphics/RectF;Lcom/android/launcher3/h1$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->s:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p2, Lcom/android/launcher3/h1$a;->a:Z

    .line 8
    .line 9
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/android/launcher3/views/FloatingIconView;->j:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 28
    .line 29
    int-to-float v0, v0

    .line 30
    iget p1, p1, Landroid/graphics/RectF;->right:F

    .line 31
    .line 32
    sub-float/2addr v0, p1

    .line 33
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget p1, p1, Landroid/graphics/RectF;->left:F

    .line 42
    .line 43
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p2, p1}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-boolean p1, p0, Lcom/android/launcher3/views/FloatingIconView;->j:Z

    .line 51
    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/widget/FrameLayout$LayoutParams;->getMarginStart()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    sub-int/2addr p1, v0

    .line 67
    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 68
    .line 69
    sub-int/2addr p1, v0

    .line 70
    goto :goto_1

    .line 71
    :cond_1
    iget p1, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 72
    .line 73
    :goto_1
    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 74
    .line 75
    iget v1, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 76
    .line 77
    add-int/2addr v1, p1

    .line 78
    iget p2, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 79
    .line 80
    add-int/2addr p2, v0

    .line 81
    invoke-virtual {p0, p1, v0, v1, p2}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private R(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0, p1}, Lcom/android/launcher3/views/H;->a(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->p:Landroid/view/View;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-static {p0, p1}, Lcom/android/launcher3/views/H;->a(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public static synthetic a(Ls1/o;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/o;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic b(Lcom/android/launcher3/views/FloatingIconView;Landroid/os/CancellationSignal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/FloatingIconView;->C(Landroid/os/CancellationSignal;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/views/FloatingIconView;Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/FloatingIconView;->D(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(JLcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/graphics/RectF;Ls1/o;Lcom/android/launcher3/views/FloatingIconView$b;)V
    .locals 4

    .line 1
    sget-wide v0, Lcom/android/launcher3/views/FloatingIconView;->H:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    cmp-long p0, p0, v0

    .line 7
    .line 8
    if-gez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static/range {p2 .. p7}, Lcom/android/launcher3/views/FloatingIconView;->w(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/graphics/RectF;Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/views/FloatingIconView$b;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic e(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Ls1/o;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ls1/o;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g(Lcom/android/launcher3/views/FloatingIconView;ZLcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->g:Ljava/lang/Runnable;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->q:Landroid/view/View;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->q:Landroid/view/View;

    .line 14
    .line 15
    instance-of v1, v0, Lcom/android/launcher3/views/H;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    check-cast v0, Lcom/android/launcher3/views/H;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-interface {v0, v1}, Lcom/android/launcher3/views/H;->setForceHideDot(Z)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 26
    .line 27
    .line 28
    :cond_1
    if-eqz p1, :cond_2

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/FloatingIconView;->R(Z)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p2}, Lcom/android/launcher3/views/FloatingIconView;->s(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    invoke-direct {p0, p2}, Lcom/android/launcher3/views/FloatingIconView;->s(Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic h(Ls1/o;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/views/FloatingIconView;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->m:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/views/FloatingIconView;)Lcom/android/launcher3/views/ClipIconView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/views/FloatingIconView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/views/FloatingIconView;)Lcom/android/launcher3/views/FloatingIconView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/views/FloatingIconView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/views/FloatingIconView;)Landroid/os/CancellationSignal;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->h:Landroid/os/CancellationSignal;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/views/FloatingIconView;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/views/FloatingIconView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/FloatingIconView;->R(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q()V
    .locals 5

    .line 1
    new-instance v0, Landroid/os/CancellationSignal;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const-string p0, "FloatingIconView"

    .line 11
    .line 12
    const-string v0, "No icon load result found in checkIconResult"

    .line 13
    .line 14
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    monitor-enter v1

    .line 19
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 20
    .line 21
    iget-boolean v3, v2, Lcom/android/launcher3/views/FloatingIconView$b;->h:Z

    .line 22
    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    iget-object v0, v2, Lcom/android/launcher3/views/FloatingIconView$b;->d:Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    iget-object v3, v2, Lcom/android/launcher3/views/FloatingIconView$b;->e:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    iget-object v4, v2, Lcom/android/launcher3/views/FloatingIconView$b;->c:Ljava/util/function/Supplier;

    .line 30
    .line 31
    iget v2, v2, Lcom/android/launcher3/views/FloatingIconView$b;->f:I

    .line 32
    .line 33
    invoke-direct {p0, v0, v3, v4, v2}, Lcom/android/launcher3/views/FloatingIconView;->M(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Ljava/util/function/Supplier;I)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, v0}, Lcom/android/launcher3/views/FloatingIconView;->R(Z)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    new-instance v3, Lcom/android/launcher3/views/F;

    .line 47
    .line 48
    invoke-direct {v3, p0, v0}, Lcom/android/launcher3/views/F;-><init>(Lcom/android/launcher3/views/FloatingIconView;Landroid/os/CancellationSignal;)V

    .line 49
    .line 50
    .line 51
    iput-object v3, v2, Lcom/android/launcher3/views/FloatingIconView$b;->g:Ljava/lang/Runnable;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->h:Landroid/os/CancellationSignal;

    .line 54
    .line 55
    :goto_0
    monitor-exit v1

    .line 56
    return-void

    .line 57
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p0
.end method

.method public static r(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Lcom/android/launcher3/views/FloatingIconView$b;
    .locals 10

    .line 1
    new-instance v6, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1, p3, v6}, Lcom/android/launcher3/views/FloatingIconView;->x(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;)V

    .line 7
    .line 8
    .line 9
    instance-of p3, p1, Lcom/android/launcher3/BubbleTextView;

    .line 10
    .line 11
    if-eqz p3, :cond_1

    .line 12
    .line 13
    move-object p3, p1

    .line 14
    check-cast p3, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    instance-of v0, p2, Lcom/android/launcher3/model/data/z;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    move-object v0, p2

    .line 21
    check-cast v0, Lcom/android/launcher3/model/data/z;

    .line 22
    .line 23
    iget v0, v0, Lcom/android/launcher3/model/data/z;->h:I

    .line 24
    .line 25
    and-int/lit16 v0, v0, 0xc00

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/android/launcher3/BubbleTextView;->v0()Ln1/r;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    new-instance v0, Lcom/android/launcher3/views/B;

    .line 34
    .line 35
    invoke-direct {v0, p3}, Lcom/android/launcher3/views/B;-><init>(Ls1/o;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {p3}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    new-instance v0, Lcom/android/launcher3/views/C;

    .line 44
    .line 45
    invoke-direct {v0, p3}, Lcom/android/launcher3/views/C;-><init>(Ls1/o;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    move-object v7, p3

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    instance-of p3, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    if-nez p3, :cond_3

    .line 54
    .line 55
    instance-of p3, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 56
    .line 57
    if-nez p3, :cond_3

    .line 58
    .line 59
    instance-of p3, p1, Lcom/android/quickstep/views/CapsuleView;

    .line 60
    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    move-object v7, v0

    .line 65
    goto :goto_2

    .line 66
    :cond_3
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    invoke-static {p3}, Lcom/android/launcher3/folder/x0;->b(Landroid/content/Context;)Lcom/android/launcher3/folder/x0;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-virtual {p3, p1}, Lcom/android/launcher3/folder/x0;->a(Landroid/view/View;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    new-instance v0, Ls1/o;

    .line 81
    .line 82
    invoke-virtual {p3}, Lcom/android/launcher3/folder/x0;->getBitmap()Landroid/graphics/Bitmap;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    invoke-direct {v0, p3}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 87
    .line 88
    .line 89
    new-instance p3, Lcom/android/launcher3/views/D;

    .line 90
    .line 91
    invoke-direct {p3, v0}, Lcom/android/launcher3/views/D;-><init>(Ls1/o;)V

    .line 92
    .line 93
    .line 94
    move-object v9, v0

    .line 95
    move-object v0, p3

    .line 96
    move-object p3, v9

    .line 97
    goto :goto_0

    .line 98
    :cond_4
    const-string p3, "FloatingIconView"

    .line 99
    .line 100
    const-string v1, "fetchIcon icon error"

    .line 101
    .line 102
    invoke-static {p3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-object p3, v0

    .line 106
    goto :goto_0

    .line 107
    :goto_2
    new-instance v8, Lcom/android/launcher3/views/FloatingIconView$b;

    .line 108
    .line 109
    if-eqz v7, :cond_5

    .line 110
    .line 111
    invoke-virtual {v7}, Ls1/o;->l()Z

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    if-eqz p3, :cond_5

    .line 116
    .line 117
    const/4 p3, 0x1

    .line 118
    goto :goto_3

    .line 119
    :cond_5
    const/4 p3, 0x0

    .line 120
    :goto_3
    invoke-direct {v8, p2, p3}, Lcom/android/launcher3/views/FloatingIconView$b;-><init>(Lcom/android/launcher3/model/data/y;Z)V

    .line 121
    .line 122
    .line 123
    iput-object v0, v8, Lcom/android/launcher3/views/FloatingIconView$b;->c:Ljava/util/function/Supplier;

    .line 124
    .line 125
    instance-of p3, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 126
    .line 127
    if-nez p3, :cond_7

    .line 128
    .line 129
    instance-of p3, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 130
    .line 131
    if-nez p3, :cond_7

    .line 132
    .line 133
    instance-of p3, p1, Lcom/android/quickstep/views/CapsuleView;

    .line 134
    .line 135
    if-eqz p3, :cond_6

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_6
    sget-wide v1, Lcom/android/launcher3/views/FloatingIconView;->G:J

    .line 139
    .line 140
    const-wide/16 v3, 0x1

    .line 141
    .line 142
    add-long/2addr v3, v1

    .line 143
    sput-wide v3, Lcom/android/launcher3/views/FloatingIconView;->G:J

    .line 144
    .line 145
    sget-object p3, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 146
    .line 147
    invoke-virtual {p3}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    new-instance v0, Lcom/android/launcher3/views/E;

    .line 152
    .line 153
    move-object v3, p0

    .line 154
    move-object v4, p1

    .line 155
    move-object v5, p2

    .line 156
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/views/E;-><init>(JLcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/graphics/RectF;Ls1/o;Lcom/android/launcher3/views/FloatingIconView$b;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p3, v0}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 160
    .line 161
    .line 162
    sput-object v8, Lcom/android/launcher3/views/FloatingIconView;->F:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 163
    .line 164
    return-object v8

    .line 165
    :cond_7
    :goto_4
    sput-object v8, Lcom/android/launcher3/views/FloatingIconView;->F:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 166
    .line 167
    return-object v8
.end method

.method private s(Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/views/G;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/views/G;-><init>(Lcom/android/launcher3/views/FloatingIconView;Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/launcher3/views/FloatingIconView;->G()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const v0, 0x7f0e00d7

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private setOriginalDrawableBackground(Ljava/util/function/Supplier;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Supplier<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->m:Landroid/view/View;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {p1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    move-object v1, p1

    .line 19
    check-cast v1, Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    :goto_0
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/android/launcher3/h1$a;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    iget v1, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 34
    .line 35
    iget p1, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v0, v2, v2, v1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    instance-of v0, p1, Lcom/android/launcher3/dragndrop/E;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    check-cast p1, Lcom/android/launcher3/dragndrop/E;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    check-cast p1, Lcom/android/launcher3/dragndrop/E;

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 74
    .line 75
    check-cast p1, Lcom/android/launcher3/dragndrop/E;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->z:Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 92
    .line 93
    check-cast p1, Lcom/android/launcher3/dragndrop/E;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->A:Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    :cond_1
    return-void
.end method

.method public static u(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;
    .locals 7

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p1, p4}, LU0/e;->d(Landroid/view/View;Z)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    :goto_0
    move v4, p2

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 p2, 0x0

    .line 13
    goto :goto_0

    .line 14
    :goto_1
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v0, p0

    .line 17
    move-object v1, p1

    .line 18
    move-object v5, p3

    .line 19
    move v6, p4

    .line 20
    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/views/FloatingIconView;->v(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/16 p1, 0x8

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public static v(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const v3, 0x7f0e00d7

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v3, p0, v1}, Lcom/android/launcher3/util/X2;->b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/android/launcher3/views/FloatingIconView;

    .line 23
    .line 24
    invoke-direct {v2}, Lcom/android/launcher3/views/FloatingIconView;->G()V

    .line 25
    .line 26
    .line 27
    iput-boolean p6, v2, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 28
    .line 29
    iput-object p1, v2, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 30
    .line 31
    iput-object p2, v2, Lcom/android/launcher3/views/FloatingIconView;->p:Landroid/view/View;

    .line 32
    .line 33
    iput-object p3, v2, Lcom/android/launcher3/views/FloatingIconView;->q:Landroid/view/View;

    .line 34
    .line 35
    iput-object p5, v2, Lcom/android/launcher3/views/FloatingIconView;->s:Landroid/graphics/RectF;

    .line 36
    .line 37
    iput-boolean p4, v2, Lcom/android/launcher3/views/FloatingIconView;->D:Z

    .line 38
    .line 39
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    const/16 v3, 0x65

    .line 46
    .line 47
    invoke-virtual {p3, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    instance-of p3, p3, Lcom/android/launcher3/model/data/y;

    .line 55
    .line 56
    if-eqz p3, :cond_0

    .line 57
    .line 58
    if-nez p4, :cond_2

    .line 59
    .line 60
    :cond_0
    instance-of p3, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 61
    .line 62
    if-nez p3, :cond_2

    .line 63
    .line 64
    instance-of p3, p1, Lcom/android/quickstep/views/CapsuleView;

    .line 65
    .line 66
    if-eqz p3, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const/4 p3, 0x0

    .line 70
    goto :goto_1

    .line 71
    :cond_2
    :goto_0
    const/4 p3, 0x1

    .line 72
    :goto_1
    const-string v4, "FloatingIconView"

    .line 73
    .line 74
    const/4 v5, 0x0

    .line 75
    if-eqz p3, :cond_6

    .line 76
    .line 77
    sget-object v6, Lcom/android/launcher3/views/FloatingIconView;->F:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 78
    .line 79
    if-eqz v6, :cond_3

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    instance-of v6, v6, Lcom/android/launcher3/model/data/y;

    .line 86
    .line 87
    if-eqz v6, :cond_3

    .line 88
    .line 89
    sget-object v6, Lcom/android/launcher3/views/FloatingIconView;->F:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 90
    .line 91
    iget-object v6, v6, Lcom/android/launcher3/views/FloatingIconView$b;->a:Lcom/android/launcher3/model/data/y;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    if-ne v6, v7, :cond_3

    .line 98
    .line 99
    sget-object v6, Lcom/android/launcher3/views/FloatingIconView;->F:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 100
    .line 101
    iput-object v6, v2, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    instance-of v6, v6, Lcom/android/launcher3/model/data/y;

    .line 109
    .line 110
    if-eqz v6, :cond_4

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_4
    move-object v6, v5

    .line 120
    :goto_2
    invoke-static {p0, p1, v6, p6}, Lcom/android/launcher3/views/FloatingIconView;->r(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Lcom/android/launcher3/views/FloatingIconView$b;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    iput-object v6, v2, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 125
    .line 126
    :goto_3
    iget-object v6, v2, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 127
    .line 128
    if-eqz v6, :cond_5

    .line 129
    .line 130
    iget-object v6, v6, Lcom/android/launcher3/views/FloatingIconView$b;->c:Ljava/util/function/Supplier;

    .line 131
    .line 132
    invoke-direct {v2, v6}, Lcom/android/launcher3/views/FloatingIconView;->setOriginalDrawableBackground(Ljava/util/function/Supplier;)V

    .line 133
    .line 134
    .line 135
    goto :goto_4

    .line 136
    :cond_5
    const-string v6, "getFloatingIconView shouldLoadIcon true "

    .line 137
    .line 138
    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    invoke-direct {v2, v5}, Lcom/android/launcher3/views/FloatingIconView;->setOriginalDrawableBackground(Ljava/util/function/Supplier;)V

    .line 142
    .line 143
    .line 144
    :cond_6
    :goto_4
    if-eqz p6, :cond_7

    .line 145
    .line 146
    invoke-virtual {p2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    new-instance v6, Lcom/android/launcher3/views/w;

    .line 151
    .line 152
    invoke-direct {v6}, Lcom/android/launcher3/views/w;-><init>()V

    .line 153
    .line 154
    .line 155
    const-wide/16 v7, 0x1f4

    .line 156
    .line 157
    invoke-virtual {p2, v6, v3, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;IJ)Z

    .line 158
    .line 159
    .line 160
    goto :goto_5

    .line 161
    :cond_7
    invoke-static {}, Lcom/android/launcher3/views/FloatingIconView;->I()V

    .line 162
    .line 163
    .line 164
    :goto_5
    iget-object p2, v2, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 165
    .line 166
    iput-object p1, p2, Lcom/android/launcher3/views/ClipIconView;->u:Landroid/view/View;

    .line 167
    .line 168
    invoke-direct {v2, p0, p1, p6, p5}, Lcom/android/launcher3/views/FloatingIconView;->E(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    check-cast p0, Lcom/android/launcher3/h1$a;

    .line 176
    .line 177
    iget-object p1, v2, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 178
    .line 179
    iget-object p2, v2, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 180
    .line 181
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {p1, p0, p6, p2, v2}, Lcom/android/launcher3/views/ClipIconView;->e(Landroid/view/ViewGroup$MarginLayoutParams;ZLcom/android/launcher3/h0;Landroid/view/View;)V

    .line 186
    .line 187
    .line 188
    iget-object p0, v2, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 189
    .line 190
    if-eqz p0, :cond_8

    .line 191
    .line 192
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView$b;->c:Ljava/util/function/Supplier;

    .line 193
    .line 194
    invoke-direct {v2, p0}, Lcom/android/launcher3/views/FloatingIconView;->setOriginalDrawableBackground(Ljava/util/function/Supplier;)V

    .line 195
    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 201
    .line 202
    .line 203
    const-string p1, "getFloatingIconView shouldLoadIcon: "

    .line 204
    .line 205
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    invoke-direct {v2, v5}, Lcom/android/launcher3/views/FloatingIconView;->setOriginalDrawableBackground(Ljava/util/function/Supplier;)V

    .line 219
    .line 220
    .line 221
    :goto_6
    const/4 p0, 0x4

    .line 222
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 226
    .line 227
    .line 228
    iget-object p0, v2, Lcom/android/launcher3/views/FloatingIconView;->v:Lcom/android/launcher3/views/K;

    .line 229
    .line 230
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 231
    .line 232
    .line 233
    iget-object p0, v2, Lcom/android/launcher3/views/FloatingIconView;->v:Lcom/android/launcher3/views/K;

    .line 234
    .line 235
    new-instance p1, Lcom/android/launcher3/views/y;

    .line 236
    .line 237
    invoke-direct {p1, v2}, Lcom/android/launcher3/views/y;-><init>(Lcom/android/launcher3/views/FloatingIconView;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/K;->setListener(Ljava/lang/Runnable;)V

    .line 241
    .line 242
    .line 243
    new-instance p0, Lcom/android/launcher3/views/z;

    .line 244
    .line 245
    invoke-direct {p0, v2, p4, v0}, Lcom/android/launcher3/views/z;-><init>(Lcom/android/launcher3/views/FloatingIconView;ZLcom/android/launcher3/dragndrop/DragLayer;)V

    .line 246
    .line 247
    .line 248
    iput-object p0, v2, Lcom/android/launcher3/views/FloatingIconView;->g:Ljava/lang/Runnable;

    .line 249
    .line 250
    if-eqz p3, :cond_9

    .line 251
    .line 252
    invoke-direct {v2}, Lcom/android/launcher3/views/FloatingIconView;->q()V

    .line 253
    .line 254
    .line 255
    :cond_9
    return-object v2
.end method

.method private static w(Lcom/android/launcher3/C2;Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/graphics/RectF;Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/views/FloatingIconView$b;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->isDisabled()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    move v2, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v2, v0

    .line 14
    :goto_0
    instance-of v3, p2, Lcom/android/launcher3/popup/P;

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    if-eqz v3, :cond_3

    .line 18
    .line 19
    instance-of v0, p1, Landroid/widget/ImageView;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    check-cast p1, Landroid/widget/ImageView;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "FloatingIconView"

    .line 30
    .line 31
    const-string v2, "getIconResult--SystemShortcut--ImageView"

    .line 32
    .line 33
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    :goto_1
    move-object v2, v4

    .line 37
    goto/16 :goto_5

    .line 38
    .line 39
    :cond_1
    instance-of v0, p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    check-cast p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v0, "FloatingIconView"

    .line 54
    .line 55
    const-string v2, "getIconResult--SystemShortcut--DeepShortcutView"

    .line 56
    .line 57
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v0, "FloatingIconView"

    .line 66
    .line 67
    const-string v2, "getIconResult--SystemShortcut--other"

    .line 68
    .line 69
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    instance-of v3, p4, Ln1/r;

    .line 74
    .line 75
    if-eqz v3, :cond_4

    .line 76
    .line 77
    move-object p1, p4

    .line 78
    goto :goto_1

    .line 79
    :cond_4
    instance-of v3, p1, Landroid/widget/ImageView;

    .line 80
    .line 81
    if-eqz v3, :cond_5

    .line 82
    .line 83
    check-cast p1, Landroid/widget/ImageView;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    goto :goto_1

    .line 90
    :cond_5
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    float-to-int v3, v3

    .line 95
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    float-to-int v5, v5

    .line 100
    if-eqz v2, :cond_7

    .line 101
    .line 102
    instance-of p1, p4, Ls1/o;

    .line 103
    .line 104
    if-eqz p1, :cond_6

    .line 105
    .line 106
    move-object p1, p4

    .line 107
    check-cast p1, Ls1/o;

    .line 108
    .line 109
    invoke-virtual {p1}, Ls1/o;->j()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_6

    .line 114
    .line 115
    move v0, v1

    .line 116
    :cond_6
    invoke-static {p0, p2, v3, v5, v0}, Lcom/android/launcher3/N5;->o(Landroid/content/Context;Lcom/android/launcher3/model/data/y;IIZ)Landroid/util/Pair;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    goto :goto_2

    .line 121
    :cond_7
    instance-of p1, p1, Lcom/android/launcher3/BubbleTextView;

    .line 122
    .line 123
    if-nez p1, :cond_8

    .line 124
    .line 125
    if-eqz p2, :cond_8

    .line 126
    .line 127
    invoke-static {p0, p2, v3, v5, v1}, Lcom/android/launcher3/N5;->o(Landroid/content/Context;Lcom/android/launcher3/model/data/y;IIZ)Landroid/util/Pair;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    goto :goto_2

    .line 132
    :cond_8
    move-object p1, v4

    .line 133
    :goto_2
    if-eqz p1, :cond_9

    .line 134
    .line 135
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 138
    .line 139
    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 140
    .line 141
    check-cast v2, Landroid/graphics/drawable/Drawable;

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_9
    move-object v0, p4

    .line 145
    move-object v2, v4

    .line 146
    :goto_3
    sget-object v3, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 147
    .line 148
    invoke-virtual {v3, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    check-cast v3, Lcom/android/launcher3/anim/C;

    .line 153
    .line 154
    iget-boolean v3, v3, Lcom/android/launcher3/anim/C;->x:Z

    .line 155
    .line 156
    if-nez v3, :cond_b

    .line 157
    .line 158
    if-eqz p1, :cond_b

    .line 159
    .line 160
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 161
    .line 162
    check-cast p1, Landroid/graphics/drawable/Drawable;

    .line 163
    .line 164
    invoke-static {p0, p2, p1}, Lcom/android/launcher3/anim/C;->g0(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/graphics/drawable/Drawable;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-nez p1, :cond_a

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_a
    move-object p1, v0

    .line 172
    goto :goto_5

    .line 173
    :cond_b
    :goto_4
    sput-boolean v1, Lcom/android/launcher3/views/FloatingIconView;->J:Z

    .line 174
    .line 175
    move-object p1, p4

    .line 176
    :goto_5
    if-eqz p1, :cond_c

    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    if-nez v0, :cond_c

    .line 183
    .line 184
    const-string v0, "FloatingIconView"

    .line 185
    .line 186
    new-instance v3, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .line 190
    .line 191
    const-string v5, "getIconResult--drawable.getConstantState() == null--"

    .line 192
    .line 193
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget-object v5, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 197
    .line 198
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    const-string v5, "--"

    .line 202
    .line 203
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    invoke-static {v0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    goto :goto_6

    .line 221
    :cond_c
    if-eqz p1, :cond_d

    .line 222
    .line 223
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 224
    .line 225
    .line 226
    move-result-object p2

    .line 227
    if-eqz p2, :cond_d

    .line 228
    .line 229
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 230
    .line 231
    .line 232
    move-result-object p2

    .line 233
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    goto :goto_7

    .line 238
    :cond_d
    :goto_6
    move-object p2, v4

    .line 239
    :goto_7
    if-nez p1, :cond_e

    .line 240
    .line 241
    move-object p2, v4

    .line 242
    :cond_e
    invoke-static {p0, p2, p3}, Lcom/android/launcher3/views/FloatingIconView;->z(Lcom/android/launcher3/C2;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)I

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    instance-of p3, p2, Lcom/android/launcher3/dragndrop/E;

    .line 247
    .line 248
    if-eqz p3, :cond_f

    .line 249
    .line 250
    move-object p4, p2

    .line 251
    :cond_f
    if-nez p4, :cond_10

    .line 252
    .line 253
    move-object p3, v4

    .line 254
    goto :goto_8

    .line 255
    :cond_10
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 256
    .line 257
    .line 258
    move-result-object p3

    .line 259
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 260
    .line 261
    .line 262
    move-result-object p3

    .line 263
    :goto_8
    monitor-enter p5

    .line 264
    :try_start_0
    new-instance p4, Lcom/android/launcher3/views/x;

    .line 265
    .line 266
    invoke-direct {p4, p3}, Lcom/android/launcher3/views/x;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 267
    .line 268
    .line 269
    iput-object p4, p5, Lcom/android/launcher3/views/FloatingIconView$b;->c:Ljava/util/function/Supplier;

    .line 270
    .line 271
    iput-object p2, p5, Lcom/android/launcher3/views/FloatingIconView$b;->d:Landroid/graphics/drawable/Drawable;

    .line 272
    .line 273
    iput-object v2, p5, Lcom/android/launcher3/views/FloatingIconView$b;->e:Landroid/graphics/drawable/Drawable;

    .line 274
    .line 275
    iput p1, p5, Lcom/android/launcher3/views/FloatingIconView$b;->f:I

    .line 276
    .line 277
    iget-object p1, p5, Lcom/android/launcher3/views/FloatingIconView$b;->g:Ljava/lang/Runnable;

    .line 278
    .line 279
    if-eqz p1, :cond_11

    .line 280
    .line 281
    invoke-virtual {p0}, Landroid/app/Activity;->getMainExecutor()Ljava/util/concurrent/Executor;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    iget-object p1, p5, Lcom/android/launcher3/views/FloatingIconView$b;->g:Ljava/lang/Runnable;

    .line 286
    .line 287
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 288
    .line 289
    .line 290
    iput-object v4, p5, Lcom/android/launcher3/views/FloatingIconView$b;->g:Ljava/lang/Runnable;

    .line 291
    .line 292
    goto :goto_9

    .line 293
    :catchall_0
    move-exception p0

    .line 294
    goto :goto_a

    .line 295
    :cond_11
    :goto_9
    iput-boolean v1, p5, Lcom/android/launcher3/views/FloatingIconView$b;->h:Z

    .line 296
    .line 297
    monitor-exit p5

    .line 298
    return-void

    .line 299
    :goto_a
    monitor-exit p5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 300
    throw p0
.end method

.method private static x(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1, p2, p3, v0}, Lcom/android/launcher3/views/FloatingIconView;->y(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static y(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Landroid/graphics/Rect;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    xor-int/lit8 p2, p2, 0x1

    .line 5
    .line 6
    instance-of v0, p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    check-cast p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :goto_0
    move-object v3, p1

    .line 18
    move v5, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    instance-of v2, v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    check-cast v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    instance-of v0, p1, Lcom/android/launcher3/views/s;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    check-cast p1, Lcom/android/launcher3/views/s;

    .line 40
    .line 41
    invoke-interface {p1}, Lcom/android/launcher3/views/s;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    goto :goto_0

    .line 46
    :cond_3
    move-object v3, p1

    .line 47
    move v5, p2

    .line 48
    :goto_1
    instance-of p1, v3, Lcom/android/launcher3/BubbleTextView;

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    move-object p1, v3

    .line 53
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 54
    .line 55
    invoke-virtual {p1, p4}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_4
    instance-of p1, v3, Lcom/android/launcher3/folder/FolderIcon;

    .line 60
    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    move-object p1, v3

    .line 64
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 65
    .line 66
    invoke-virtual {p1, p4}, Lcom/android/launcher3/folder/FolderIcon;->C(Landroid/graphics/Rect;)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_5
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    invoke-virtual {p4, v1, v1, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 79
    .line 80
    .line 81
    :goto_2
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const/4 v6, 0x0

    .line 86
    move-object v7, p3

    .line 87
    move-object v4, p4

    .line 88
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->l(Lcom/android/launcher3/views/BaseDragLayer;Landroid/view/View;Landroid/graphics/Rect;Z[FLandroid/graphics/RectF;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private static z(Lcom/android/launcher3/C2;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)I
    .locals 2

    .line 1
    instance-of p1, p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const p1, 0x7f070144

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    new-instance p1, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    float-to-int v1, v1

    .line 25
    add-int/2addr v1, p0

    .line 26
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    float-to-int p2, p2

    .line 31
    add-int/2addr p2, p0

    .line 32
    invoke-direct {p1, v0, v0, v1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 33
    .line 34
    .line 35
    div-int/lit8 p0, p0, 0x2

    .line 36
    .line 37
    invoke-virtual {p1, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 38
    .line 39
    .line 40
    const p0, 0x3f6b851f    # 0.92f

    .line 41
    .line 42
    .line 43
    invoke-static {p1, p0}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    neg-int p0, p0

    .line 51
    int-to-float p0, p0

    .line 52
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    mul-float/2addr p0, p2

    .line 57
    float-to-int p0, p0

    .line 58
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    neg-int p2, p2

    .line 63
    int-to-float p2, p2

    .line 64
    invoke-static {}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getExtraInsetFraction()F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    mul-float/2addr p2, v0

    .line 69
    float-to-int p2, p2

    .line 70
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Rect;->inset(II)V

    .line 71
    .line 72
    .line 73
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    return p0
.end method


# virtual methods
.method public A(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/anim/x;->f:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "FloatingIconView"

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string p0, "hideOriginalIcon no need to hide as anim duration is 0"

    .line 13
    .line 14
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    const-string p0, "hideOriginalIcon, mOriginalIcon == null, return"

    .line 23
    .line 24
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    if-nez p1, :cond_2

    .line 29
    .line 30
    const-string p1, "hideOriginalIcon, originalView == null, return"

    .line 31
    .line 32
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/FloatingIconView;->R(Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    const/4 p0, 0x4

    .line 41
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public B()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-boolean p0, p0, Lcom/android/launcher3/views/FloatingIconView$b;->b:Z

    .line 8
    .line 9
    return p0
.end method

.method public F(Ljava/util/function/Consumer;Ljava/lang/Runnable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->A0(Ljava/util/function/Consumer;Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public J()V
    .locals 2

    .line 1
    const-string v0, "FloatingIconView"

    .line 2
    .line 3
    const-string v1, "reset icon when anim exception"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Lcom/android/launcher3/views/A;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/android/launcher3/views/A;-><init>(Lcom/android/launcher3/views/FloatingIconView;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/FloatingIconView;->K()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->H0()V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public N(FLandroid/graphics/RectF;FFFZ)V
    .locals 8

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    move v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/views/FloatingIconView;->O(FLandroid/graphics/RectF;FFFZI)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public O(FLandroid/graphics/RectF;FFFZI)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLaidOut()Z

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual/range {p0 .. p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v7

    .line 21
    move-object v6, p0

    .line 22
    move-object v1, p2

    .line 23
    move v2, p3

    .line 24
    move v3, p4

    .line 25
    move v4, p5

    .line 26
    move v5, p6

    .line 27
    move/from16 v8, p7

    .line 28
    .line 29
    invoke-virtual/range {v0 .. v8}, Lcom/android/launcher3/views/ClipIconView;->l(Landroid/graphics/RectF;FFFZLandroid/view/View;Lcom/android/launcher3/h0;I)V

    .line 30
    .line 31
    .line 32
    iget-object v6, p0, Lcom/android/launcher3/views/FloatingIconView;->q:Landroid/view/View;

    .line 33
    .line 34
    if-eqz v6, :cond_1

    .line 35
    .line 36
    const/high16 v4, 0x3f800000    # 1.0f

    .line 37
    .line 38
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    const v2, 0x3e19999a    # 0.15f

    .line 42
    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    move v0, p3

    .line 46
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/high16 v1, 0x3f800000    # 1.0f

    .line 51
    .line 52
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    sub-float/2addr v1, v0

    .line 57
    invoke-virtual {v6, v1}, Landroid/view/View;->setAlpha(F)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public P(Landroid/graphics/RectF;FFFFZLjava/util/function/Supplier;Ljava/util/function/Supplier;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/RectF;",
            "FFFFZ",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/function/Supplier<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    move p4, p5

    .line 5
    move p5, p6

    .line 6
    move-object p6, p0

    .line 7
    iget-object p0, p6, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 8
    .line 9
    iget-object p2, p6, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object p7

    .line 15
    const/4 p8, 0x0

    .line 16
    move p2, p3

    .line 17
    const p3, 0x3f666666    # 0.9f

    .line 18
    .line 19
    .line 20
    invoke-virtual/range {p0 .. p8}, Lcom/android/launcher3/views/ClipIconView;->l(Landroid/graphics/RectF;FFFZLandroid/view/View;Lcom/android/launcher3/h0;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->o:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public fastFinish()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->w:Ljava/lang/Runnable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->w:Ljava/lang/Runnable;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->h:Landroid/os/CancellationSignal;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->h:Landroid/os/CancellationSignal;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->g:Ljava/lang/Runnable;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->g:Ljava/lang/Runnable;

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/FloatingIconView;->L()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->h:Landroid/os/CancellationSignal;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/os/CancellationSignal;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->g:Ljava/lang/Runnable;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/views/ClipIconView;->d()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->l:Lcom/android/launcher3/views/FloatingIconView$b;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-boolean p1, p1, Lcom/android/launcher3/views/FloatingIconView$b;->h:Z

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 11
    .line 12
    if-nez p1, :cond_2

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->m:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->y:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-boolean p1, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 30
    .line 31
    if-nez p1, :cond_3

    .line 32
    .line 33
    invoke-direct {p0, v0}, Lcom/android/launcher3/views/FloatingIconView;->R(Z)V

    .line 34
    .line 35
    .line 36
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->q:Landroid/view/View;

    .line 37
    .line 38
    instance-of p1, p0, Lcom/android/launcher3/views/H;

    .line 39
    .line 40
    if-eqz p1, :cond_4

    .line 41
    .line 42
    check-cast p0, Lcom/android/launcher3/views/H;

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    invoke-interface {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideDot(Z)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 49
    .line 50
    .line 51
    :cond_4
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onGlobalLayout()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->s:Landroid/graphics/RectF;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->i:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/views/FloatingIconView;->r:Landroid/view/View;

    .line 18
    .line 19
    iget-boolean v2, p0, Lcom/android/launcher3/views/FloatingIconView;->k:Z

    .line 20
    .line 21
    sget-object v3, Lcom/android/launcher3/views/FloatingIconView;->I:Landroid/graphics/RectF;

    .line 22
    .line 23
    invoke-static {v0, v1, v2, v3}, Lcom/android/launcher3/views/FloatingIconView;->x(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iget v1, p0, Lcom/android/launcher3/views/FloatingIconView;->x:F

    .line 28
    .line 29
    invoke-virtual {v3, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/views/FloatingIconView;->s:Landroid/graphics/RectF;

    .line 33
    .line 34
    invoke-virtual {v3, v0}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/android/launcher3/h1$a;

    .line 45
    .line 46
    invoke-direct {p0, v3, v0}, Lcom/android/launcher3/views/FloatingIconView;->Q(Landroid/graphics/RectF;Lcom/android/launcher3/h1$a;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->t:Ljava/lang/Runnable;

    .line 50
    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public setClipPath(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->B:Landroid/graphics/Path;

    .line 2
    .line 3
    return-void
.end method

.method public setFastFinishRunnable(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->w:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setOnTargetChangeListener(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->t:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setOverlayArtist(Lcom/android/launcher3/views/ClipIconView$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->n:Lcom/android/launcher3/views/ClipIconView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/ClipIconView;->setTaskViewArtist(Lcom/android/launcher3/views/ClipIconView$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPositionOffsetY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/views/FloatingIconView;->x:F

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/views/FloatingIconView;->onGlobalLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Z)Lcom/android/launcher3/anim/U;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Lcom/android/launcher3/views/FloatingIconView$c;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/android/launcher3/views/FloatingIconView$c;-><init>(Lcom/android/launcher3/views/FloatingIconView;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/android/launcher3/views/FloatingIconView;->E:Lcom/android/launcher3/views/FloatingIconView$c;

    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/views/FloatingIconView;->E:Lcom/android/launcher3/views/FloatingIconView$c;

    .line 11
    .line 12
    return-object p0
.end method
