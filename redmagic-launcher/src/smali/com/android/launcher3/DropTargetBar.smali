.class public Lcom/android/launcher3/DropTargetBar;
.super Landroid/widget/FrameLayout;
.source "DropTargetBar.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/j$b;
.implements Lcom/android/launcher3/g1;


# static fields
.field protected static final q:Landroid/animation/TimeInterpolator;


# instance fields
.field private final g:Lcom/android/launcher3/C2;

.field protected h:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field protected i:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private j:[Lcom/android/launcher3/ButtonDropTarget;

.field private k:[Lcom/android/launcher3/ButtonDropTarget;

.field private l:Landroid/view/ViewPropertyAnimator;

.field private m:Z

.field private final n:Ljava/lang/Runnable;

.field private final o:Ljava/lang/Runnable;

.field private p:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/DropTargetBar;->q:Landroid/animation/TimeInterpolator;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/DropTargetBar;->i:Z

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    iput-boolean p2, p0, Lcom/android/launcher3/DropTargetBar;->m:Z

    .line 9
    .line 10
    new-instance p2, Lcom/android/launcher3/DropTargetBar$a;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Lcom/android/launcher3/DropTargetBar$a;-><init>(Lcom/android/launcher3/DropTargetBar;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/android/launcher3/DropTargetBar;->n:Ljava/lang/Runnable;

    .line 16
    .line 17
    new-instance p2, Lcom/android/launcher3/DropTargetBar$b;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Lcom/android/launcher3/DropTargetBar$b;-><init>(Lcom/android/launcher3/DropTargetBar;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lcom/android/launcher3/DropTargetBar;->o:Ljava/lang/Runnable;

    .line 23
    .line 24
    const/4 p2, -0x1

    .line 25
    iput p2, p0, Lcom/android/launcher3/DropTargetBar;->p:I

    .line 26
    .line 27
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/DropTargetBar;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method private e([Lcom/android/launcher3/ButtonDropTarget;)I
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    aget-object v3, p0, v1

    .line 9
    .line 10
    invoke-virtual {v3}, Landroid/widget/TextView;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const/16 v5, 0x8

    .line 15
    .line 16
    if-eq v4, v5, :cond_0

    .line 17
    .line 18
    aput-object v3, p1, v2

    .line 19
    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return v2
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object p2, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p2, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/menu/MenuContainer;->J(Landroid/view/View;Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/4 p1, 0x1

    .line 36
    invoke-virtual {p0, p1}, Lcom/android/launcher3/DropTargetBar;->c(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method protected b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lx1/O;->k(Lcom/android/launcher3/C2;Landroid/widget/FrameLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/DropTargetBar;->i:Z

    .line 17
    .line 18
    if-eq v0, p1, :cond_3

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/android/launcher3/DropTargetBar;->i:Z

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/DropTargetBar;->l:Landroid/view/ViewPropertyAnimator;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/DropTargetBar;->l:Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    :cond_1
    iget-boolean p1, p0, Lcom/android/launcher3/DropTargetBar;->i:Z

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    const/high16 p1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    const/4 p1, 0x0

    .line 40
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {v0, p1}, Ljava/lang/Float;->compare(FF)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    invoke-virtual {p0, v0}, Lcom/android/launcher3/DropTargetBar;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object v0, Lcom/android/launcher3/DropTargetBar;->q:Landroid/animation/TimeInterpolator;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-wide/16 v0, 0xaf

    .line 69
    .line 70
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->o:Ljava/lang/Runnable;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->n:Ljava/lang/Runnable;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/android/launcher3/DropTargetBar;->l:Landroid/view/ViewPropertyAnimator;

    .line 87
    .line 88
    :cond_3
    :goto_1
    return-void
.end method

.method protected d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/DropTargetBar;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method protected f()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/android/launcher3/ButtonDropTarget;->t()V

    .line 12
    .line 13
    .line 14
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return-void
.end method

.method public g(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lcom/android/launcher3/DropTargetBar;->p:I

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget v0, p0, Lcom/android/launcher3/DropTargetBar;->p:I

    .line 18
    .line 19
    if-eq v0, p1, :cond_2

    .line 20
    .line 21
    iput p1, p0, Lcom/android/launcher3/DropTargetBar;->p:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 24
    .line 25
    array-length p1, p0

    .line 26
    const/4 v0, 0x0

    .line 27
    :goto_0
    if-ge v0, p1, :cond_2

    .line 28
    .line 29
    aget-object v1, p0, v0

    .line 30
    .line 31
    instance-of v2, v1, Lcom/android/launcher3/BatchCreateFolderDropTarget;

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    check-cast v1, Lcom/android/launcher3/BatchCreateFolderDropTarget;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->Y()V

    .line 38
    .line 39
    .line 40
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    return-void
.end method

.method public getDropTargets()[Lcom/android/launcher3/ButtonDropTarget;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    new-array p0, p0, [Lcom/android/launcher3/ButtonDropTarget;

    .line 12
    .line 13
    return-object p0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lx1/O;->k(Lcom/android/launcher3/C2;Landroid/widget/FrameLayout;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    new-array v0, v0, [Lcom/android/launcher3/ButtonDropTarget;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 14
    .line 15
    array-length v2, v1

    .line 16
    if-ge v0, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/android/launcher3/ButtonDropTarget;

    .line 23
    .line 24
    aput-object v2, v1, v0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 27
    .line 28
    aget-object v1, v1, v0

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Lcom/android/launcher3/ButtonDropTarget;->setDropTargetBar(Lcom/android/launcher3/DropTargetBar;)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    new-array v0, v0, [Lcom/android/launcher3/ButtonDropTarget;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/android/launcher3/DropTargetBar;->k:[Lcom/android/launcher3/ButtonDropTarget;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-static {v0, p0}, Lx1/O;->k(Lcom/android/launcher3/C2;Landroid/widget/FrameLayout;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 7

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/DropTargetBar;->k:[Lcom/android/launcher3/ButtonDropTarget;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/DropTargetBar;->e([Lcom/android/launcher3/ButtonDropTarget;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    iget-object p5, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    const/4 p5, 0x3

    .line 17
    const/16 v0, 0x8

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-ne p1, p5, :cond_1

    .line 21
    .line 22
    sub-int/2addr p4, p2

    .line 23
    mul-int/lit8 p1, p4, 0x2

    .line 24
    .line 25
    div-int/lit8 p1, p1, 0xa

    .line 26
    .line 27
    mul-int/lit8 p2, p4, 0x5

    .line 28
    .line 29
    div-int/lit8 p2, p2, 0xa

    .line 30
    .line 31
    mul-int/2addr p4, v0

    .line 32
    div-int/lit8 p4, p4, 0xa

    .line 33
    .line 34
    filled-new-array {p1, p2, p4}, [I

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 39
    .line 40
    array-length p2, p0

    .line 41
    move p4, v1

    .line 42
    :goto_0
    if-ge v1, p2, :cond_4

    .line 43
    .line 44
    aget-object p5, p0, v1

    .line 45
    .line 46
    invoke-virtual {p5}, Landroid/widget/TextView;->getVisibility()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eq v2, v0, :cond_0

    .line 51
    .line 52
    invoke-virtual {p5}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    div-int/lit8 v2, v2, 0x2

    .line 57
    .line 58
    invoke-virtual {p5}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    sub-int v4, p3, v3

    .line 63
    .line 64
    div-int/lit8 v4, v4, 0x2

    .line 65
    .line 66
    add-int/lit8 v5, p4, 0x1

    .line 67
    .line 68
    aget p4, p1, p4

    .line 69
    .line 70
    sub-int v6, p4, v2

    .line 71
    .line 72
    add-int/2addr p4, v2

    .line 73
    add-int/2addr v3, v4

    .line 74
    invoke-virtual {p5, v6, v4, p4, v3}, Landroid/widget/TextView;->layout(IIII)V

    .line 75
    .line 76
    .line 77
    move p4, v5

    .line 78
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    if-nez p1, :cond_2

    .line 82
    .line 83
    move p4, v1

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    sub-int/2addr p4, p2

    .line 86
    div-int/2addr p4, p1

    .line 87
    :goto_1
    div-int/lit8 p1, p4, 0x2

    .line 88
    .line 89
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 90
    .line 91
    array-length p2, p0

    .line 92
    :goto_2
    if-ge v1, p2, :cond_4

    .line 93
    .line 94
    aget-object p5, p0, v1

    .line 95
    .line 96
    invoke-virtual {p5}, Landroid/widget/TextView;->getVisibility()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eq v2, v0, :cond_3

    .line 101
    .line 102
    invoke-virtual {p5}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    div-int/lit8 v2, v2, 0x2

    .line 107
    .line 108
    invoke-virtual {p5}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    sub-int v4, p3, v3

    .line 113
    .line 114
    div-int/lit8 v4, v4, 0x2

    .line 115
    .line 116
    sub-int v5, p1, v2

    .line 117
    .line 118
    add-int/2addr v2, p1

    .line 119
    add-int/2addr v3, v4

    .line 120
    invoke-virtual {p5, v5, v4, v2, v3}, Landroid/widget/TextView;->layout(IIII)V

    .line 121
    .line 122
    .line 123
    add-int/2addr p1, p4

    .line 124
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_4
    return-void
.end method

.method protected onMeasure(II)V
    .locals 8

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/high16 v0, 0x40000000    # 2.0f

    .line 10
    .line 11
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->k:[Lcom/android/launcher3/ButtonDropTarget;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/android/launcher3/DropTargetBar;->e([Lcom/android/launcher3/ButtonDropTarget;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    move v0, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    div-int v0, p1, v0

    .line 26
    .line 27
    :goto_0
    const/high16 v2, -0x80000000

    .line 28
    .line 29
    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v3, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 38
    .line 39
    array-length v4, v3

    .line 40
    :goto_1
    if-ge v1, v4, :cond_2

    .line 41
    .line 42
    aget-object v5, v3, v1

    .line 43
    .line 44
    invoke-virtual {v5}, Landroid/widget/TextView;->getVisibility()I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    const/16 v7, 0x8

    .line 49
    .line 50
    if-eq v6, v7, :cond_1

    .line 51
    .line 52
    const/4 v6, 0x1

    .line 53
    invoke-virtual {v5, v6}, Lcom/android/launcher3/ButtonDropTarget;->setTextVisible(Z)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, v0, v2}, Landroid/widget/TextView;->measure(II)V

    .line 57
    .line 58
    .line 59
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {p0, p1, p2}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const v1, 0x7f0702cf

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const v1, 0x7f0702ce

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :goto_1
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_1
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 59
    .line 60
    iput v1, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 61
    .line 62
    iget v0, v0, Lcom/android/launcher3/h0;->b3:I

    .line 63
    .line 64
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 65
    .line 66
    :goto_2
    const/16 v0, 0x31

    .line 67
    .line 68
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public setVisibility(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/DropTargetBar;->i:Z

    .line 10
    .line 11
    return-void
.end method

.method public setup(Lcom/android/launcher3/dragndrop/j;)V
    .locals 3

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 6
    .line 7
    array-length v2, v1

    .line 8
    if-ge v0, v2, :cond_0

    .line 9
    .line 10
    aget-object v1, v1, v0

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/DropTargetBar;->j:[Lcom/android/launcher3/ButtonDropTarget;

    .line 16
    .line 17
    aget-object v1, v1, v0

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/DropTargetBar;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v2, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/android/launcher3/DropTargetBar;->g:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/menu/MenuContainer;->J(Landroid/view/View;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/launcher3/DropTargetBar;->c(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iput-boolean v1, p0, Lcom/android/launcher3/DropTargetBar;->h:Z

    .line 45
    .line 46
    return-void
.end method
