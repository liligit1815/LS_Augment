.class public abstract Lcom/android/launcher3/ButtonDropTarget;
.super Landroid/widget/TextView;
.source "ButtonDropTarget.java"

# interfaces
.implements Lcom/android/launcher3/n0;
.implements Lcom/android/launcher3/dragndrop/j$b;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final F:[I


# instance fields
.field protected A:I

.field protected B:I

.field private C:Landroid/animation/AnimatorSet;

.field private D:Z

.field private E:Z

.field protected final g:Lcom/android/launcher3/views/k;

.field protected final h:Lcom/android/launcher3/q0;

.field protected i:Lcom/android/launcher3/DropTargetBar;

.field private j:Lcom/android/launcher3/util/s1;

.field protected k:Z

.field private l:Z

.field private final m:I

.field private final n:I

.field private o:I

.field protected p:Ljava/lang/CharSequence;

.field protected q:Landroid/graphics/drawable/Drawable;

.field private r:Z

.field private s:Z

.field private t:Z

.field private u:Landroid/widget/PopupWindow;

.field private v:I

.field private final w:Ljava/lang/String;

.field protected final x:Lcom/android/launcher3/C2;

.field protected y:Landroid/app/Dialog;

.field z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lcom/android/launcher3/ButtonDropTarget;->F:[I

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/ButtonDropTarget;->r:Z

    .line 4
    iput-boolean p2, p0, Lcom/android/launcher3/ButtonDropTarget;->s:Z

    .line 5
    iput-boolean p2, p0, Lcom/android/launcher3/ButtonDropTarget;->t:Z

    .line 6
    const-string p2, "ButtonDropTarget"

    iput-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->w:Ljava/lang/String;

    .line 7
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    const/4 p2, 0x0

    .line 8
    iput p2, p0, Lcom/android/launcher3/ButtonDropTarget;->B:I

    .line 9
    iput-boolean p2, p0, Lcom/android/launcher3/ButtonDropTarget;->D:Z

    .line 10
    iput-boolean p2, p0, Lcom/android/launcher3/ButtonDropTarget;->E:Z

    .line 11
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/views/k;

    iput-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->g:Lcom/android/launcher3/views/k;

    .line 13
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDropTargetHandler()Lcom/android/launcher3/q0;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 14
    sget-object p2, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/launcher3/util/s1;

    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->j:Lcom/android/launcher3/util/s1;

    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0702bd

    .line 16
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/ButtonDropTarget;->m:I

    const p2, 0x7f0702c8

    .line 17
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/ButtonDropTarget;->n:I

    const p2, 0x7f0702d4

    .line 18
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/ButtonDropTarget;->o:I

    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->g()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/ButtonDropTarget;->o:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/n0$a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->p(Lcom/android/launcher3/n0$a;Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->o(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    instance-of v0, v0, Landroid/graphics/drawable/LayerDrawable;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/android/launcher3/ButtonDropTarget;->D:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->C:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 18
    .line 19
    .line 20
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getAlpha()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/high16 v1, 0x3f800000    # 1.0f

    .line 25
    .line 26
    cmpl-float v0, v0, v1

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->C:Landroid/animation/AnimatorSet;

    .line 37
    .line 38
    const-wide/16 v1, 0x78

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->C:Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    const-string v1, "textColor"

    .line 46
    .line 47
    filled-new-array {p1}, [I

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->C:Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private g()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->r:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    sub-int/2addr v0, v2

    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sub-int/2addr v0, v2

    .line 22
    div-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    iget v2, p0, Lcom/android/launcher3/ButtonDropTarget;->n:I

    .line 25
    .line 26
    div-int/lit8 v2, v2, 0x2

    .line 27
    .line 28
    sub-int/2addr v0, v2

    .line 29
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    iget p0, p0, Lcom/android/launcher3/ButtonDropTarget;->n:I

    .line 32
    .line 33
    add-int v3, v0, p0

    .line 34
    .line 35
    invoke-virtual {v2, v0, v1, v3, p0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private getDropButtonIconBgColor()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const v0, 0x7f0601d9

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const v0, 0x7f0601da

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-static {p0, v0}, Lz/a;->c(Landroid/content/Context;I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method private getDropButtonIconColor()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const v0, 0x7f0601db

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const v0, 0x7f0601dc

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-static {p0, v0}, Lz/a;->c(Landroid/content/Context;I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method private hideTooltip()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->u:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->u:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private j(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/W4;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/W4;

    .line 8
    .line 9
    iget p0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    if-eq p0, p1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x5

    .line 15
    if-ne p0, p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return v1

    .line 19
    :cond_1
    :goto_0
    return v0

    .line 20
    :cond_2
    instance-of p0, p1, Lcom/android/launcher3/model/data/A;

    .line 21
    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    return v0

    .line 25
    :cond_3
    return v1
.end method

.method private synthetic o(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->h(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->i:Lcom/android/launcher3/DropTargetBar;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/DropTargetBar;->v()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic p(Lcom/android/launcher3/n0$a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->r(Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected B(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C(Z)V
    .locals 5

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/ButtonDropTarget;->D:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->getDropButtonIconColor()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->getDropButtonIconBgColor()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const v2, 0x3e851eb8    # 0.26f

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/high16 v2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getForeColor()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    move p1, v0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->S(Lcom/android/launcher3/C2;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    :goto_1
    iput p1, p0, Lcom/android/launcher3/ButtonDropTarget;->B:I

    .line 36
    .line 37
    iget-boolean v4, p0, Lcom/android/launcher3/ButtonDropTarget;->D:Z

    .line 38
    .line 39
    if-nez v4, :cond_4

    .line 40
    .line 41
    iget-boolean v4, p0, Lcom/android/launcher3/ButtonDropTarget;->E:Z

    .line 42
    .line 43
    if-eqz v4, :cond_4

    .line 44
    .line 45
    instance-of v1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    instance-of v1, p0, Lcom/android/launcher3/SecondaryDropTarget;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    :cond_2
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const v4, 0x7f1400a0

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const v4, 0x7f140463

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const v0, 0x7f060804

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    const v0, 0x7f060805

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    const v0, 0x7f060807

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    goto :goto_2

    .line 129
    :cond_3
    move v1, p1

    .line 130
    :cond_4
    :goto_2
    iput v3, p0, Lcom/android/launcher3/ButtonDropTarget;->A:I

    .line 131
    .line 132
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 139
    .line 140
    instance-of v2, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 141
    .line 142
    if-eqz v2, :cond_6

    .line 143
    .line 144
    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 145
    .line 146
    const v2, 0x7f0b0307

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    const v4, 0x7f0b0308

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    instance-of v4, v2, Landroid/graphics/drawable/GradientDrawable;

    .line 161
    .line 162
    if-eqz v4, :cond_5

    .line 163
    .line 164
    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    .line 165
    .line 166
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 167
    .line 168
    .line 169
    :cond_5
    if-eqz p1, :cond_7

    .line 170
    .line 171
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_6
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 176
    .line 177
    .line 178
    :cond_7
    :goto_3
    const/4 p1, -0x1

    .line 179
    const/4 v0, 0x0

    .line 180
    if-ne p1, v3, :cond_8

    .line 181
    .line 182
    const/4 p1, 0x1

    .line 183
    goto :goto_4

    .line 184
    :cond_8
    move p1, v0

    .line 185
    :goto_4
    invoke-static {p0, p1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 186
    .line 187
    .line 188
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    if-eqz p1, :cond_9

    .line 193
    .line 194
    const-string p1, "sans-serif-medium"

    .line 195
    .line 196
    invoke-static {p1, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 201
    .line 202
    .line 203
    :cond_9
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    if-eqz p1, :cond_a

    .line 212
    .line 213
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    const v1, 0x7f0704af

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 225
    .line 226
    .line 227
    :cond_a
    return-void
.end method

.method public D()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->l:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->g:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->y()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget p0, p0, Lcom/android/launcher3/ButtonDropTarget;->m:I

    .line 20
    .line 21
    int-to-float p0, p0

    .line 22
    cmpl-float p0, v0, p0

    .line 23
    .line 24
    if-ltz p0, :cond_1

    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 3

    .line 1
    iget-boolean v0, p2, Lcom/android/launcher3/dragndrop/p;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->setupItemInfo(Lcom/android/launcher3/model/data/y;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->y(Lcom/android/launcher3/model/data/y;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 21
    .line 22
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    invoke-static {v0}, Lx1/O;->S3(Lcom/android/launcher3/model/data/y;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->l()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    invoke-static {}, Lx1/O;->M0()Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v2, 0x1

    .line 51
    if-ne v0, v2, :cond_1

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 54
    .line 55
    :cond_1
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 56
    .line 57
    instance-of v2, v0, Lcom/android/launcher3/model/data/p;

    .line 58
    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 82
    .line 83
    invoke-static {v2}, Lx1/O;->S3(Lcom/android/launcher3/model/data/y;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    iput-boolean v1, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 90
    .line 91
    :cond_3
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 92
    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    const/16 v1, 0x8

    .line 97
    .line 98
    :goto_1
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->C:Landroid/animation/AnimatorSet;

    .line 102
    .line 103
    const/4 v1, 0x0

    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 107
    .line 108
    .line 109
    iput-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->C:Landroid/animation/AnimatorSet;

    .line 110
    .line 111
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->l()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_6

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setTextAndDrawable(Lcom/android/launcher3/n0$a;)V

    .line 124
    .line 125
    .line 126
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 127
    .line 128
    invoke-static {p1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->R(Lcom/android/launcher3/C2;)I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    iput p1, p0, Lcom/android/launcher3/ButtonDropTarget;->A:I

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->u()V

    .line 135
    .line 136
    .line 137
    iget-boolean p1, p2, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 138
    .line 139
    iput-boolean p1, p0, Lcom/android/launcher3/ButtonDropTarget;->l:Z

    .line 140
    .line 141
    if-eqz p1, :cond_7

    .line 142
    .line 143
    move-object v1, p0

    .line 144
    :cond_7
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public G(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final I(Lcom/android/launcher3/n0$a;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->y(Lcom/android/launcher3/model/data/y;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final J(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->hideTooltip()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->E:Z

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/android/launcher3/n0$a;->e:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->u()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 23
    .line 24
    const p1, 0x3f266666    # 0.65f

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->getHitRect(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->g:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->H0:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->g:Lcom/android/launcher3/views/k;

    .line 17
    .line 18
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget v1, v1, Lcom/android/launcher3/h0;->e3:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 26
    .line 27
    :cond_0
    sget-object v0, Lcom/android/launcher3/ButtonDropTarget;->F:[I

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    const/4 v2, 0x0

    .line 31
    aput v2, v0, v1

    .line 32
    .line 33
    aput v2, v0, v2

    .line 34
    .line 35
    iget-object v3, p0, Lcom/android/launcher3/ButtonDropTarget;->g:Lcom/android/launcher3/views/k;

    .line 36
    .line 37
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3, p0, v0}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    .line 42
    .line 43
    .line 44
    aget p0, v0, v2

    .line 45
    .line 46
    aget v0, v0, v1

    .line 47
    .line 48
    invoke-virtual {p1, p0, v0}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract getAccessibilityAction()I
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getTextColor()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public abstract h(Lcom/android/launcher3/n0$a;)V
.end method

.method public i(Lcom/android/launcher3/n0$a;)Landroid/graphics/Rect;
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object v3, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/android/launcher3/q0;->b()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    new-instance v4, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3, p0, v4}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v3}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    iget v3, v4, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    sub-int/2addr v3, v5

    .line 56
    sub-int v5, v3, v1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget v3, v4, Landroid/graphics/Rect;->left:I

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    add-int/2addr v5, v3

    .line 66
    add-int v3, v5, v1

    .line 67
    .line 68
    :goto_0
    iget v6, v4, Landroid/graphics/Rect;->top:I

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingTop()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    add-int/2addr v6, p0

    .line 75
    add-int p0, v6, v2

    .line 76
    .line 77
    invoke-virtual {v4, v5, v6, v3, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 78
    .line 79
    .line 80
    sub-int/2addr v0, v1

    .line 81
    neg-int p0, v0

    .line 82
    div-int/lit8 p0, p0, 0x2

    .line 83
    .line 84
    sub-int/2addr p1, v2

    .line 85
    neg-int p1, p1

    .line 86
    div-int/lit8 p1, p1, 0x2

    .line 87
    .line 88
    invoke-virtual {v4, p0, p1}, Landroid/graphics/Rect;->offset(II)V

    .line 89
    .line 90
    .line 91
    return-object v4
.end method

.method protected k(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lcom/android/launcher3/util/J1;->o(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Lcom/android/launcher3/util/J1;->o(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v0, v1}, Lcom/android/launcher3/util/J1;->k(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0, p1}, Lcom/android/launcher3/popup/P;->isCanUnstallApp(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    return p0

    .line 55
    :cond_1
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public final l(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->j:Lcom/android/launcher3/util/s1;

    .line 8
    .line 9
    sget-object v1, Lw3/e;->v:Lw3/e;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/s1;->c(Lw3/e;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->l:Z

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->r:Z

    .line 20
    .line 21
    if-nez v0, :cond_3

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->hideTooltip()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const v2, 0x7f0e00c9

    .line 35
    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/widget/TextView;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Landroid/widget/PopupWindow;

    .line 50
    .line 51
    const/4 v3, -0x2

    .line 52
    invoke-direct {v2, v0, v3, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->u:Landroid/widget/PopupWindow;

    .line 56
    .line 57
    iget v2, p0, Lcom/android/launcher3/ButtonDropTarget;->v:I

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    neg-int v2, v2

    .line 67
    invoke-virtual {v0, v3, v3}, Landroid/widget/TextView;->measure(II)V

    .line 68
    .line 69
    .line 70
    iget v3, p0, Lcom/android/launcher3/ButtonDropTarget;->v:I

    .line 71
    .line 72
    if-ne v3, v1, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    neg-int v3, v3

    .line 79
    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    div-int/lit8 v0, v0, 0x2

    .line 84
    .line 85
    sub-int/2addr v3, v0

    .line 86
    goto :goto_0

    .line 87
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    div-int/lit8 v3, v3, 0x2

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    div-int/lit8 v0, v0, 0x2

    .line 98
    .line 99
    add-int/2addr v3, v0

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    move v2, v3

    .line 102
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->u:Landroid/widget/PopupWindow;

    .line 103
    .line 104
    invoke-virtual {v0, p0, v3, v2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 105
    .line 106
    .line 107
    :cond_3
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 108
    .line 109
    const v2, 0x3f266666    # 0.65f

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 116
    .line 117
    .line 118
    iput-boolean v1, p0, Lcom/android/launcher3/ButtonDropTarget;->E:Z

    .line 119
    .line 120
    iget v0, p0, Lcom/android/launcher3/ButtonDropTarget;->B:I

    .line 121
    .line 122
    invoke-direct {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->f(I)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 126
    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    invoke-virtual {p1}, LO0/e;->b()V

    .line 130
    .line 131
    .line 132
    :cond_4
    const/4 p1, 0x4

    .line 133
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->sendAccessibilityEvent(I)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/ButtonDropTarget;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public n(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    iget p0, p1, Lcom/android/launcher3/model/data/I;->m:I

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->W()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/android/launcher3/q0;->e(Lcom/android/launcher3/ButtonDropTarget;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const v1, 0x7f060806

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/launcher3/ButtonDropTarget;->B:I

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const v2, 0x7f040781

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/android/launcher3/ButtonDropTarget;->A:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public abstract q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
.end method

.method protected r(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected s(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected setDrawable(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iget v1, p0, Lcom/android/launcher3/ButtonDropTarget;->n:I

    .line 17
    .line 18
    invoke-virtual {p1, v0, v0, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->q:Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0, p1, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget p1, p0, Lcom/android/launcher3/ButtonDropTarget;->o:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public setDropTargetBar(Lcom/android/launcher3/DropTargetBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->i:Lcom/android/launcher3/DropTargetBar;

    .line 2
    .line 3
    return-void
.end method

.method public setIconVisible(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->s:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/ButtonDropTarget;->s:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->A()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setMSDLPlayerWrapper(Lcom/android/launcher3/util/s1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->j:Lcom/android/launcher3/util/s1;

    .line 2
    .line 3
    return-void
.end method

.method public setTextAndDrawable(Lcom/android/launcher3/n0$a;)V
    .locals 7

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->j(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const v1, 0x7f080afc

    .line 8
    .line 9
    .line 10
    const v2, 0x7f14008f

    .line 11
    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 21
    .line 22
    const v4, 0x7f080d8c

    .line 23
    .line 24
    .line 25
    const v5, 0x7f140463

    .line 26
    .line 27
    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    move-object v0, p1

    .line 31
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    if-eqz v6, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->n(Lcom/android/launcher3/model/data/y;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_6

    .line 47
    .line 48
    instance-of v3, p0, Lcom/android/launcher3/SecondaryDropTarget;

    .line 49
    .line 50
    invoke-virtual {p0, v4}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget p1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 55
    .line 56
    const/4 v6, 0x1

    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v4}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 60
    .line 61
    .line 62
    instance-of p1, p0, Lcom/android/launcher3/SecondaryDropTarget;

    .line 63
    .line 64
    if-eqz p1, :cond_5

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->k(Lcom/android/launcher3/model/data/y;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_5

    .line 71
    .line 72
    move v3, v6

    .line 73
    goto :goto_0

    .line 74
    :cond_2
    if-eq p1, v6, :cond_3

    .line 75
    .line 76
    const/4 v0, 0x6

    .line 77
    if-ne p1, v0, :cond_6

    .line 78
    .line 79
    :cond_3
    invoke-virtual {p0, v1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    instance-of p1, p1, Lcom/android/launcher3/model/data/p;

    .line 84
    .line 85
    if-eqz p1, :cond_6

    .line 86
    .line 87
    invoke-virtual {p0, v4}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 88
    .line 89
    .line 90
    instance-of v3, p0, Lcom/android/launcher3/SecondaryDropTarget;

    .line 91
    .line 92
    :cond_5
    :goto_0
    move v2, v5

    .line 93
    :cond_6
    :goto_1
    invoke-virtual {p0, v3}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->R(Lcom/android/launcher3/C2;)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 125
    .line 126
    return-void
.end method

.method public setTextMultiLine(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->t:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_2

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/ButtonDropTarget;->t:Z

    .line 6
    .line 7
    xor-int/lit8 v0, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v0

    .line 18
    :goto_0
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 19
    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const v0, 0x20001

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setInputType(I)V

    .line 27
    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public setTextVisible(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, ""

    .line 7
    .line 8
    :goto_0
    iget-boolean v1, p0, Lcom/android/launcher3/ButtonDropTarget;->r:Z

    .line 9
    .line 10
    if-ne v1, p1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    return-void

    .line 24
    :cond_2
    :goto_1
    iput-boolean p1, p0, Lcom/android/launcher3/ButtonDropTarget;->r:Z

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->A()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setToolTipLocation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/ButtonDropTarget;->v:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/ButtonDropTarget;->hideTooltip()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected abstract setupItemInfo(Lcom/android/launcher3/model/data/y;)V
.end method

.method protected t()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method protected u()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/ButtonDropTarget;->A:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->f(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/ButtonDropTarget;->k:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setSelected(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/n0$a;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 18
    .line 19
    :cond_0
    new-instance v0, Lx1/e;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-direct {v0, v2}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const v2, 0x7f1400a0

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lx1/e;->n(I)Lx1/e;

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    invoke-virtual {v0, v3}, Lx1/e;->l(Z)Lx1/e;

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 37
    .line 38
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const v4, 0x7f0e0250

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const v4, 0x7f0b0658

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Landroid/widget/TextView;

    .line 57
    .line 58
    const v5, 0x7f0b0657

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    check-cast v5, Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_1

    .line 78
    .line 79
    invoke-virtual {v5}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 84
    .line 85
    const p2, 0x800003

    .line 86
    .line 87
    .line 88
    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 89
    .line 90
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    const p1, 0x7f0b0659

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    const/4 p2, 0x0

    .line 106
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 107
    .line 108
    .line 109
    :cond_1
    const p1, 0x7f0b0656

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Lcom/android/launcher3/uninstall/OverlapIconsView;

    .line 117
    .line 118
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Lcom/android/launcher3/uninstall/OverlapIconsView;->setData(Ljava/util/ArrayList;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v3}, Lx1/e;->o(Landroid/view/View;)Lx1/e;

    .line 124
    .line 125
    .line 126
    new-instance p1, Lcom/android/launcher3/ButtonDropTarget$a;

    .line 127
    .line 128
    invoke-direct {p1, p0, p4}, Lcom/android/launcher3/ButtonDropTarget$a;-><init>(Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/n0$a;)V

    .line 129
    .line 130
    .line 131
    invoke-static {p1, v1}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    new-instance p2, Lcom/android/launcher3/ButtonDropTarget$b;

    .line 136
    .line 137
    invoke-direct {p2, p0, p4}, Lcom/android/launcher3/ButtonDropTarget$b;-><init>(Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/n0$a;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p2, v1}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    invoke-virtual {v0, p3, p1}, Lx1/e;->k(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    const v1, 0x7f14032f

    .line 160
    .line 161
    .line 162
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p3

    .line 166
    invoke-virtual {v0, p3, p2}, Lx1/e;->g(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    iput-object p3, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 174
    .line 175
    invoke-virtual {p1, p3}, LK1/g;->b(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 179
    .line 180
    invoke-virtual {p2, p1}, LK1/g;->b(Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->y:Landroid/app/Dialog;

    .line 184
    .line 185
    new-instance p2, Lcom/android/launcher3/Q;

    .line 186
    .line 187
    invoke-direct {p2, p0, p4}, Lcom/android/launcher3/Q;-><init>(Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/n0$a;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public abstract x(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
.end method

.method protected abstract y(Lcom/android/launcher3/model/data/y;)Z
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 11

    .line 1
    iget-boolean p2, p2, Lcom/android/launcher3/dragndrop/p;->g:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/android/launcher3/q0;->b()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->i(Lcom/android/launcher3/n0$a;)Landroid/graphics/Rect;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    int-to-float v3, v3

    .line 28
    div-float v3, v1, v3

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {p2, v1}, Lcom/android/launcher3/dragndrop/v;->r(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->i:Lcom/android/launcher3/DropTargetBar;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/android/launcher3/DropTargetBar;->d()V

    .line 37
    .line 38
    .line 39
    new-instance v8, Lcom/android/launcher3/P;

    .line 40
    .line 41
    invoke-direct {v8, p0, p1}, Lcom/android/launcher3/P;-><init>(Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/n0$a;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 45
    .line 46
    sget-object v7, LJ0/h;->L:Landroid/view/animation/Interpolator;

    .line 47
    .line 48
    const/4 v9, 0x0

    .line 49
    const/4 v10, 0x0

    .line 50
    const v4, 0x3dcccccd    # 0.1f

    .line 51
    .line 52
    .line 53
    const v5, 0x3dcccccd    # 0.1f

    .line 54
    .line 55
    .line 56
    const/16 v6, 0x11d

    .line 57
    .line 58
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/dragndrop/DragLayer;->f(Lcom/android/launcher3/dragndrop/v;Landroid/graphics/Rect;FFFILandroid/view/animation/Interpolator;Ljava/lang/Runnable;ILandroid/view/View;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
