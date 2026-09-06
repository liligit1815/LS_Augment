.class public Lcom/android/launcher3/taskbar/StashedHandleView;
.super Landroid/view/View;
.source "StashedHandleView.java"


# instance fields
.field private final g:I

.field private final h:I

.field private final i:Landroid/graphics/Rect;

.field private final j:[I

.field private k:Landroid/animation/ObjectAnimator;
    .annotation build Landroid/annotation/Nullable;
    .end annotation
.end field

.field private l:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/StashedHandleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/StashedHandleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 4
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->i:Landroid/graphics/Rect;

    const/4 p2, 0x2

    .line 5
    new-array p2, p2, [I

    iput-object p2, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->j:[I

    const p2, 0x7f0607ee

    .line 6
    invoke-static {p1, p2}, Lz/a;->c(Landroid/content/Context;I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->g:I

    const p2, 0x7f0607ed

    .line 7
    invoke-static {p1, p2}, Lz/a;->c(Landroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->h:I

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/taskbar/StashedHandleView;Landroid/animation/ObjectAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->k:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public b(FJ)V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v2, v1, [F

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput p1, v2, v3

    .line 8
    .line 9
    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p1}, [Landroid/animation/PropertyValuesHolder;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, v1}, Landroid/animation/ObjectAnimator;->setAutoCancel(Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public c(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->l:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne v0, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->g:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget v0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->h:I

    .line 18
    .line 19
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->l:Ljava/lang/Boolean;

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->k:Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 30
    .line 31
    .line 32
    :cond_2
    if-eqz p2, :cond_3

    .line 33
    .line 34
    sget-object p1, Lcom/android/launcher3/G2;->l:Landroid/util/IntProperty;

    .line 35
    .line 36
    filled-new-array {v0}, [I

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-static {p0, p1, p2}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->k:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    new-instance p2, Lcom/android/launcher3/taskbar/StashedHandleView$a;

    .line 47
    .line 48
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/StashedHandleView$a;-><init>(Lcom/android/launcher3/taskbar/StashedHandleView;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->k:Landroid/animation/ObjectAnimator;

    .line 55
    .line 56
    const-wide/16 v0, 0x78

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->k:Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public d(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->j:[I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->j:[I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v2, v0, v1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    sub-int/2addr v2, v3

    .line 20
    aput v2, v0, v1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->j:[I

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    aget v3, v0, v2

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    sub-int/2addr v3, v4

    .line 36
    aput v3, v0, v2

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->i:Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->i:Landroid/graphics/Rect;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->j:[I

    .line 46
    .line 47
    aget v0, p0, v1

    .line 48
    .line 49
    aget p0, p0, v2

    .line 50
    .line 51
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public getSampledRegion()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/StashedHandleView;->i:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method
