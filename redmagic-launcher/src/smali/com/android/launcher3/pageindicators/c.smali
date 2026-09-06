.class public abstract Lcom/android/launcher3/pageindicators/c;
.super Landroid/view/View;
.source "MfvPageIndicatorDots.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/pageindicators/c$a;
    }
.end annotation


# instance fields
.field protected g:Landroid/graphics/Paint;

.field protected h:Landroid/graphics/Paint;

.field protected i:Landroid/graphics/Paint;

.field protected j:Landroid/graphics/Paint;

.field protected k:I

.field protected l:Z

.field private m:Landroid/content/Context;

.field protected n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/pageindicators/c$a;",
            ">;"
        }
    .end annotation
.end field

.field protected o:Lcom/android/launcher3/pageindicators/c$a;

.field protected p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/pageindicators/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 4
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/pageindicators/c;->h:Landroid/graphics/Paint;

    .line 5
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/pageindicators/c;->i:Landroid/graphics/Paint;

    .line 6
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/pageindicators/c;->j:Landroid/graphics/Paint;

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/pageindicators/c;->m:Landroid/content/Context;

    .line 9
    sget-object v0, Lcom/android/launcher3/x5;->c2:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/16 p3, 0xf

    .line 10
    invoke-virtual {p2, v1, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p3

    iput p3, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    .line 11
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 12
    invoke-direct {p0, p1}, Lcom/android/launcher3/pageindicators/c;->b(Landroid/content/Context;)V

    return-void
.end method

.method private b(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/pageindicators/c;->l:Z

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/H5$g;->a()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/high16 v0, -0x1000000

    .line 24
    .line 25
    or-int/2addr p1, v0

    .line 26
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->m:Landroid/content/Context;

    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    if-ne p1, v1, :cond_0

    .line 30
    .line 31
    const v2, 0x7f0605b7

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const v2, 0x7f0605b6

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-static {v0, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->m:Landroid/content/Context;

    .line 43
    .line 44
    if-ne p1, v1, :cond_1

    .line 45
    .line 46
    const p1, 0x7f0605b9

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const p1, 0x7f0605b8

    .line 51
    .line 52
    .line 53
    :goto_1
    invoke-static {v2, p1}, Lz/a;->c(Landroid/content/Context;I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iget-object v1, p0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 58
    .line 59
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 65
    .line 66
    const/4 v3, 0x1

    .line 67
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->j:Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->j:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->j:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->h:Landroid/graphics/Paint;

    .line 91
    .line 92
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->h:Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->h:Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->i:Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->i:Landroid/graphics/Paint;

    .line 113
    .line 114
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/android/launcher3/pageindicators/c;->i:Landroid/graphics/Paint;

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    .line 121
    .line 122
    return-void
.end method


# virtual methods
.method protected a(Lcom/android/launcher3/pageindicators/b;)Lcom/android/launcher3/pageindicators/c$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/pageindicators/c$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/pageindicators/c$a;-><init>(Lcom/android/launcher3/pageindicators/c;Lcom/android/launcher3/pageindicators/b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method protected c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    .line 8
    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method protected d(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/pageindicators/c;->k:I

    .line 2
    .line 3
    if-lt p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public abstract synthetic setActiveMarker(I)V
.end method

.method public setColor(I)V
    .locals 3

    .line 1
    const/high16 v0, -0x1000000

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->m:Landroid/content/Context;

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-ne p1, v1, :cond_0

    .line 8
    .line 9
    const v2, 0x7f0605b7

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const v2, 0x7f0605b6

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-static {v0, v2}, Lz/a;->c(Landroid/content/Context;I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v2, p0, Lcom/android/launcher3/pageindicators/c;->m:Landroid/content/Context;

    .line 21
    .line 22
    if-ne p1, v1, :cond_1

    .line 23
    .line 24
    const p1, 0x7f0605b9

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const p1, 0x7f0605b8

    .line 29
    .line 30
    .line 31
    :goto_1
    invoke-static {v2, p1}, Lz/a;->c(Landroid/content/Context;I)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object v1, p0, Lcom/android/launcher3/pageindicators/c;->g:Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->j:Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->h:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/pageindicators/c;->i:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 56
    .line 57
    .line 58
    return-void
.end method
