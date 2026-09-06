.class public final Lcom/android/quickstep/views/IconView;
.super Landroid/view/View;
.source "IconView.kt"

# interfaces
.implements Lcom/android/quickstep/views/TaskViewIcon;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/IconView$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/IconView$Companion;

.field private static final INDEX_CONTENT_ALPHA:I = 0x0

.field private static final INDEX_FLEX_SPLIT_ALPHA:I = 0x2

.field private static final INDEX_MODAL_ALPHA:I = 0x1

.field private static final NUM_ALPHA_CHANNELS:I = 0x3


# instance fields
.field private drawable:Landroid/graphics/drawable/Drawable;

.field private drawableHeight:I

.field private drawableWidth:I

.field private msdlPlayerWrapper:Lcom/android/launcher3/util/s1;

.field private final multiValueAlpha:Lcom/android/launcher3/util/B1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/IconView$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/IconView$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/IconView;->Companion:Lcom/android/quickstep/views/IconView$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Lcom/android/launcher3/util/B1;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    iput-object p1, p0, Lcom/android/quickstep/views/IconView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/views/IconView;->setUpHaptics()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 6
    new-instance p1, Lcom/android/launcher3/util/B1;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    iput-object p1, p0, Lcom/android/quickstep/views/IconView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    const/4 p2, 0x1

    .line 7
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/views/IconView;->setUpHaptics()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 10
    new-instance p1, Lcom/android/launcher3/util/B1;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    iput-object p1, p0, Lcom/android/quickstep/views/IconView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    const/4 p2, 0x1

    .line 11
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 12
    invoke-direct {p0}, Lcom/android/quickstep/views/IconView;->setUpHaptics()V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/IconView;Landroid/view/View$OnLongClickListener;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/IconView;->withFeedback$lambda$5(Lcom/android/quickstep/views/IconView;Landroid/view/View$OnLongClickListener;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final setDrawableSizeInternal(II)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iget p2, p0, Lcom/android/quickstep/views/IconView;->drawableWidth:I

    .line 13
    .line 14
    iget v1, p0, Lcom/android/quickstep/views/IconView;->drawableHeight:I

    .line 15
    .line 16
    const/16 v2, 0x11

    .line 17
    .line 18
    invoke-static {v2, p2, v1, v0, p1}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private final setUpHaptics()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/util/s1;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/IconView;->msdlPlayerWrapper:Lcom/android/launcher3/util/s1;

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/y0;->n0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/views/IconView;->msdlPlayerWrapper:Lcom/android/launcher3/util/s1;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 29
    :goto_1
    invoke-virtual {p0, v0}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private final withFeedback(Landroid/view/View$OnLongClickListener;)Landroid/view/View$OnLongClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/views/s;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/views/s;-><init>(Lcom/android/quickstep/views/IconView;Landroid/view/View$OnLongClickListener;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static final withFeedback$lambda$5(Lcom/android/quickstep/views/IconView;Landroid/view/View$OnLongClickListener;Landroid/view/View;)Z
    .locals 1

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->n0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->msdlPlayerWrapper:Lcom/android/launcher3/util/s1;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget-object v0, Lw3/e;->u:Lw3/e;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/s1;->c(Lw3/e;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-interface {p1, p2}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method


# virtual methods
.method public asView()Landroid/view/View;
    .locals 0

    .line 1
    return-object p0
.end method

.method protected drawableStateChanged()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDrawableHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/IconView;->drawableHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getDrawableWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/IconView;->drawableWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/IconView;->setDrawableSizeInternal(II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setContentAlpha(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :cond_1
    iput-object v1, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/IconView;->setDrawableSizeInternal(II)V

    .line 43
    .line 44
    .line 45
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public setDrawableSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/IconView;->drawableWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/views/IconView;->drawableHeight:I

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/IconView;->setDrawableSizeInternal(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setFlexSplitAlpha(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setIconColorTint(IF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Lcom/android/launcher3/N5;->I(IF)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setIconOrientation(Lcom/android/quickstep/util/RecentsOrientedState;Z)V
    .locals 8

    .line 1
    const-string v0, "orientationState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "null cannot be cast to non-null type com.android.launcher3.views.ActivityContext"

    .line 19
    .line 20
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "getDeviceProfile(...)"

    .line 30
    .line 31
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v7, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 39
    .line 40
    invoke-static {v0, v7}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move-object v2, v0

    .line 44
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 45
    .line 46
    iget v3, p1, Lcom/android/launcher3/h0;->O2:I

    .line 47
    .line 48
    iget v4, p1, Lcom/android/launcher3/h0;->P2:I

    .line 49
    .line 50
    iget v5, p1, Lcom/android/launcher3/h0;->S2:I

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v6, 0x1

    .line 57
    if-ne v0, v6, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 v6, 0x0

    .line 61
    :goto_0
    invoke-interface/range {v1 .. v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setTaskIconParams(Landroid/widget/FrameLayout$LayoutParams;IIIZ)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 71
    .line 72
    iget v2, p1, Lcom/android/launcher3/h0;->P2:I

    .line 73
    .line 74
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 75
    .line 76
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 86
    .line 87
    .line 88
    if-eqz p2, :cond_1

    .line 89
    .line 90
    iget p1, p1, Lcom/android/launcher3/h0;->R2:I

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    iget p1, p1, Lcom/android/launcher3/h0;->Q2:I

    .line 94
    .line 95
    :goto_1
    invoke-virtual {p0, p1, p1}, Lcom/android/quickstep/views/IconView;->setDrawableSize(II)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    new-instance p0, Ljava/lang/NullPointerException;

    .line 100
    .line 101
    invoke-direct {p0, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p0
.end method

.method public setModalAlpha(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/IconView;->withFeedback(Landroid/view/View$OnLongClickListener;)Landroid/view/View$OnLongClickListener;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    .line 1
    const-string v0, "who"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/quickstep/views/IconView;->drawable:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    if-ne p1, p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method
