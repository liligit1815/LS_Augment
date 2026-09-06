.class public Lcom/zte/mifavor/widget/SeekBarZTE;
.super Landroid/widget/SeekBar;
.source "SeekBarZTE.java"


# static fields
.field private static final j:[I

.field private static final k:[I

.field private static final l:[I


# instance fields
.field private g:Landroid/graphics/drawable/BitmapDrawable;

.field private h:Landroid/graphics/drawable/BitmapDrawable;

.field private i:Landroid/graphics/drawable/BitmapDrawable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const v0, -0x101009e

    .line 2
    .line 3
    .line 4
    filled-new-array {v0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Lcom/zte/mifavor/widget/SeekBarZTE;->j:[I

    .line 9
    .line 10
    const v0, 0x10100a7

    .line 11
    .line 12
    .line 13
    const v1, 0x101009e

    .line 14
    .line 15
    .line 16
    filled-new-array {v1, v0}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/zte/mifavor/widget/SeekBarZTE;->k:[I

    .line 21
    .line 22
    const v0, -0x10100a7

    .line 23
    .line 24
    .line 25
    filled-new-array {v1, v0}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/zte/mifavor/widget/SeekBarZTE;->l:[I

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x101007b

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/SeekBarZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/f;->D:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    check-cast p3, Landroid/graphics/drawable/BitmapDrawable;

    iput-object p3, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->g:Landroid/graphics/drawable/BitmapDrawable;

    .line 4
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v1, LR3/f;->E:I

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    check-cast p3, Landroid/graphics/drawable/BitmapDrawable;

    iput-object p3, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->h:Landroid/graphics/drawable/BitmapDrawable;

    .line 5
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v2, LR3/f;->v:I

    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    check-cast p3, Landroid/graphics/drawable/BitmapDrawable;

    iput-object p3, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->i:Landroid/graphics/drawable/BitmapDrawable;

    .line 6
    sget-object p3, LR3/m;->n3:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 7
    sget p2, LR3/m;->o3:I

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    .line 8
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    const/4 p1, 0x0

    if-eq p2, p3, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    move p2, p1

    .line 9
    :goto_0
    invoke-virtual {p0, v0, v1, v2}, Lcom/zte/mifavor/widget/SeekBarZTE;->a(III)V

    .line 10
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/f;->C:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    invoke-virtual {p0, p3}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 11
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getTickMark()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    if-nez p3, :cond_1

    if-nez p2, :cond_1

    .line 12
    iget-object p2, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->g:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    iget-object p3, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->h:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    sub-int/2addr p2, p3

    int-to-float p2, p2

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p2, p3

    .line 13
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    .line 14
    invoke-virtual {p0, p2}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 15
    :cond_1
    sget-boolean p2, Lcom/zte/mifavor/widget/u;->b:Z

    if-eqz p2, :cond_2

    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/SeekBar;->setForceDarkAllowed(Z)V

    :cond_2
    return-void
.end method


# virtual methods
.method public a(III)V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/drawable/AnimatedStateListDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/AnimatedStateListDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedStateListDrawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/DrawableContainer$DrawableContainerState;->setConstantSize(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    check-cast p3, Landroid/graphics/drawable/BitmapDrawable;

    .line 25
    .line 26
    iput-object p3, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->i:Landroid/graphics/drawable/BitmapDrawable;

    .line 27
    .line 28
    const/16 v1, 0x11

    .line 29
    .line 30
    invoke-virtual {p3, v1}, Landroid/graphics/drawable/BitmapDrawable;->setGravity(I)V

    .line 31
    .line 32
    .line 33
    sget-object p3, Lcom/zte/mifavor/widget/SeekBarZTE;->j:[I

    .line 34
    .line 35
    iget-object v2, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->i:Landroid/graphics/drawable/BitmapDrawable;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-virtual {v0, p3, v2, v3}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 50
    .line 51
    iput-object p1, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->g:Landroid/graphics/drawable/BitmapDrawable;

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/BitmapDrawable;->setGravity(I)V

    .line 54
    .line 55
    .line 56
    sget-object p1, Lcom/zte/mifavor/widget/SeekBarZTE;->k:[I

    .line 57
    .line 58
    iget-object p3, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->g:Landroid/graphics/drawable/BitmapDrawable;

    .line 59
    .line 60
    invoke-virtual {v0, p1, p3, v3}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->h:Landroid/graphics/drawable/BitmapDrawable;

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/BitmapDrawable;->setGravity(I)V

    .line 76
    .line 77
    .line 78
    sget-object p1, Lcom/zte/mifavor/widget/SeekBarZTE;->l:[I

    .line 79
    .line 80
    iget-object p2, p0, Lcom/zte/mifavor/widget/SeekBarZTE;->h:Landroid/graphics/drawable/BitmapDrawable;

    .line 81
    .line 82
    invoke-virtual {v0, p1, p2, v3}, Landroid/graphics/drawable/AnimatedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
