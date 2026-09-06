.class public final Lcom/android/launcher3/widget/picker/WidgetsListHeader;
.super Landroid/widget/LinearLayout;
.source "WidgetsListHeader.java"

# interfaces
.implements Ls1/P$a;


# static fields
.field private static final r:[I


# instance fields
.field private final g:I

.field private final h:Z

.field private i:Lcom/android/launcher3/util/w;

.field private j:Landroid/graphics/drawable/Drawable;

.field private k:Lcom/android/launcher3/widget/picker/U;

.field private l:Landroid/widget/ImageView;

.field private m:Landroid/widget/TextView;

.field private n:Landroid/widget/TextView;

.field private o:Z

.field private p:Z

.field private q:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const v0, 0x10100a8

    .line 2
    .line 3
    .line 4
    filled-new-array {v0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->r:[I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->o:Z

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->p:Z

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/views/k;

    .line 6
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    .line 7
    sget-object v2, Lcom/android/launcher3/x5;->P3:[I

    invoke-virtual {p1, p2, v2, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 8
    iget p2, v1, Lcom/android/launcher3/h0;->B1:I

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->g:I

    const/4 p2, 0x1

    .line 9
    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->h:Z

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/picker/WidgetsListHeader;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method private b(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iget v1, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->g:I

    .line 3
    .line 4
    invoke-virtual {p1, v0, v0, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->l:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 14
    .line 15
    iget v1, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->g:I

    .line 16
    .line 17
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 18
    .line 19
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->l:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->l:Landroid/widget/ImageView;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->j:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    instance-of v1, v0, Ls1/d0;

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->o:Z

    .line 40
    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    check-cast v0, Ls1/d0;

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ls1/d0;->w(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method private setTitles(Lm2/o;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->q:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object p1, p1, Lm2/g;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public c(Lm2/o;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setTitles(Lm2/o;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lm2/o;->u()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setExpanded(Z)V

    .line 22
    .line 23
    .line 24
    invoke-super {p0, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->e()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->i:Lcom/android/launcher3/util/w;

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
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->i:Lcom/android/launcher3/util/w;

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v1, v0, Lcom/android/launcher3/model/data/z;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    check-cast v0, Lcom/android/launcher3/model/data/z;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lt1/g;->e()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

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
    invoke-virtual {v1, p0, v0}, Ls1/P;->W0(Ls1/P$a;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/util/w;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->i:Lcom/android/launcher3/util/w;

    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public i(Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->i:Lcom/android/launcher3/util/w;

    .line 9
    .line 10
    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->o:Z

    .line 15
    .line 16
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 17
    .line 18
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/z;->F(Landroid/content/Context;)Ls1/o;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->o:Z

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method protected onCreateDrawableState(I)[I
    .locals 1

    .line 1
    add-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onCreateDrawableState(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->p:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->r:[I

    .line 12
    .line 13
    invoke-static {p1, v0}, Landroid/widget/LinearLayout;->mergeDrawableStates([I[I)[I

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->k:Lcom/android/launcher3/widget/picker/U;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/U;->g:[I

    .line 21
    .line 22
    invoke-static {p1, p0}, Landroid/widget/LinearLayout;->mergeDrawableStates([I[I)[I

    .line 23
    .line 24
    .line 25
    :cond_1
    return-object p1
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b00d9

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->l:Landroid/widget/ImageView;

    .line 14
    .line 15
    const v0, 0x7f0b00e1

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->m:Landroid/widget/TextView;

    .line 25
    .line 26
    const v0, 0x7f0b00e0

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
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->n:Landroid/widget/TextView;

    .line 36
    .line 37
    const v0, 0x7f0b069f

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
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->q:Landroid/widget/TextView;

    .line 47
    .line 48
    iget-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->h:Z

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    new-instance v0, Lcom/android/launcher3/widget/picker/WidgetsListHeader$a;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/WidgetsListHeader$a;-><init>(Lcom/android/launcher3/widget/picker/WidgetsListHeader;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public setExpanded(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->p:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->refreshDrawableState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->b(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->j:Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWindowVisibility()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isShown()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move p0, v1

    .line 24
    :goto_0
    invoke-virtual {p1, p0, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public setListDrawableState(Lcom/android/launcher3/widget/picker/U;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->k:Lcom/android/launcher3/widget/picker/U;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->k:Lcom/android/launcher3/widget/picker/U;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->refreshDrawableState()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
