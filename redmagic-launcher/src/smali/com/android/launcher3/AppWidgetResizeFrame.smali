.class public Lcom/android/launcher3/AppWidgetResizeFrame;
.super Lcom/android/launcher3/a;
.source "AppWidgetResizeFrame.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/AppWidgetResizeFrame$b;
    }
.end annotation


# static fields
.field private static final g0:Landroid/graphics/Rect;

.field private static final h0:Landroid/graphics/Rect;

.field private static final i0:[I


# instance fields
.field private final A:Lcom/android/launcher3/keyboard/b;

.field private final B:F

.field private C:Z

.field private D:Z

.field private E:Z

.field private F:Z

.field private G:Z

.field private H:Z

.field private I:I

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:I

.field private O:I

.field private P:I

.field private Q:I

.field private R:I

.field private S:I

.field private T:I

.field private U:[I

.field private final V:Landroid/graphics/Rect;

.field private final W:Landroid/graphics/Rect;

.field private final a0:Lcom/android/launcher3/widget/T$a;

.field private final b0:Landroid/view/View$OnLayoutChangeListener;

.field private c0:I

.field private d0:I

.field private e0:Z

.field private f0:Landroid/graphics/Rect;

.field private final g:Lcom/android/launcher3/C2;

.field private final h:LO0/e;

.field private final i:Lcom/android/launcher3/w0;

.field private final j:[Landroid/view/View;

.field private final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private l:Lcom/android/launcher3/widget/T;

.field private m:Lcom/android/launcher3/CellLayout;

.field private n:Lcom/android/launcher3/dragndrop/DragLayer;

.field private o:Landroid/widget/ImageButton;

.field private final p:I

.field private final q:I

.field private final r:[I

.field private final s:[I

.field private final t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

.field private final z:Lcom/android/launcher3/logging/d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/AppWidgetResizeFrame;->g0:Landroid/graphics/Rect;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/AppWidgetResizeFrame;->h0:Landroid/graphics/Rect;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v0, v0, [I

    .line 17
    .line 18
    sput-object v0, Lcom/android/launcher3/AppWidgetResizeFrame;->i0:[I

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/AppWidgetResizeFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x4

    .line 3
    new-array p3, p2, [Landroid/view/View;

    iput-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 4
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->k:Ljava/util/List;

    const/4 p3, 0x2

    .line 5
    new-array v0, p3, [I

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 6
    new-array v0, p3, [I

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->s:[I

    .line 7
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 8
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 9
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 10
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 11
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 12
    new-instance v0, Lcom/android/launcher3/AppWidgetResizeFrame$b;

    invoke-direct {v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 13
    new-instance v0, Lcom/android/launcher3/logging/f;

    invoke-direct {v0}, Lcom/android/launcher3/logging/f;-><init>()V

    invoke-virtual {v0}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->z:Lcom/android/launcher3/logging/d;

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->S:I

    .line 15
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->T:I

    .line 16
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->V:Landroid/graphics/Rect;

    .line 17
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->W:Landroid/graphics/Rect;

    .line 18
    iput-boolean v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->e0:Z

    .line 19
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v0, v0, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->f0:Landroid/graphics/Rect;

    .line 20
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 21
    invoke-static {p0}, LO0/e;->d(Landroid/view/View;)LO0/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->h:LO0/e;

    .line 22
    sget-object p1, Lf1/a;->o:Lf1/a$a;

    invoke-virtual {p1}, Lf1/a$a;->c()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 23
    new-instance p1, Lcom/android/launcher3/i;

    invoke-direct {p1, p0}, Lcom/android/launcher3/i;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->a0:Lcom/android/launcher3/widget/T$a;

    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f070a38

    .line 26
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->p:I

    mul-int/2addr p1, p3

    .line 27
    iput p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 28
    new-instance p1, Lcom/android/launcher3/w0;

    invoke-direct {p1, p0}, Lcom/android/launcher3/w0;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->i:Lcom/android/launcher3/w0;

    :goto_1
    if-ge v0, p2, :cond_1

    .line 29
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->k:Ljava/util/List;

    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    invoke-interface {p1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 30
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070a39

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->B:F

    .line 31
    new-instance p1, Lcom/android/launcher3/keyboard/b;

    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    invoke-virtual {p2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/android/launcher3/keyboard/b;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->A:Lcom/android/launcher3/keyboard/b;

    .line 32
    new-instance p1, Lcom/android/launcher3/j;

    invoke-direct {p1, p0}, Lcom/android/launcher3/j;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;)V

    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->b0:Landroid/view/View$OnLayoutChangeListener;

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/AppWidgetResizeFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->g0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/android/launcher3/AppWidgetResizeFrame;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/AppWidgetResizeFrame;->p0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/AppWidgetResizeFrame;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame;->h0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Lcom/android/launcher3/AppWidgetResizeFrame;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/AppWidgetResizeFrame;->d0(Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/AppWidgetResizeFrame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame;->f0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T(Lcom/android/launcher3/AppWidgetResizeFrame;Landroid/view/View;IIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/AppWidgetResizeFrame;->c0(Landroid/view/View;IIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U(Lcom/android/launcher3/AppWidgetResizeFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->e0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private W(Landroid/graphics/Rect;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/widget/x0;->getScaleToFit()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget-object v1, Lf1/a;->o:Lf1/a$a;

    .line 8
    .line 9
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame;->Y(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 22
    .line 23
    invoke-virtual {v1, v2, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const v2, 0x7f070bc5

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    mul-float/2addr v1, v0

    .line 39
    float-to-int v1, v1

    .line 40
    iget v2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->p:I

    .line 41
    .line 42
    mul-int/lit8 v2, v2, 0x2

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    iget-object v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->f0:Landroid/graphics/Rect;

    .line 49
    .line 50
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 51
    .line 52
    sub-int/2addr v3, v5

    .line 53
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    sub-int/2addr v3, v4

    .line 56
    int-to-float v3, v3

    .line 57
    mul-float/2addr v3, v0

    .line 58
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    add-int/2addr v2, v3

    .line 63
    mul-int/lit8 v3, v1, 0x2

    .line 64
    .line 65
    sub-int/2addr v2, v3

    .line 66
    iget v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->p:I

    .line 67
    .line 68
    mul-int/lit8 v4, v4, 0x2

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    iget-object v6, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->f0:Landroid/graphics/Rect;

    .line 75
    .line 76
    iget v7, v6, Landroid/graphics/Rect;->top:I

    .line 77
    .line 78
    sub-int/2addr v5, v7

    .line 79
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 80
    .line 81
    sub-int/2addr v5, v6

    .line 82
    int-to-float v5, v5

    .line 83
    mul-float/2addr v5, v0

    .line 84
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    add-int/2addr v4, v5

    .line 89
    sub-int/2addr v4, v3

    .line 90
    iget v3, p1, Landroid/graphics/Rect;->left:I

    .line 91
    .line 92
    iget v5, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->p:I

    .line 93
    .line 94
    sub-int/2addr v3, v5

    .line 95
    iget-object v6, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->f0:Landroid/graphics/Rect;

    .line 96
    .line 97
    iget v7, v6, Landroid/graphics/Rect;->left:I

    .line 98
    .line 99
    int-to-float v7, v7

    .line 100
    mul-float/2addr v7, v0

    .line 101
    float-to-int v7, v7

    .line 102
    add-int/2addr v3, v7

    .line 103
    add-int/2addr v3, v1

    .line 104
    iget v7, p1, Landroid/graphics/Rect;->top:I

    .line 105
    .line 106
    sub-int/2addr v7, v5

    .line 107
    iget v5, v6, Landroid/graphics/Rect;->top:I

    .line 108
    .line 109
    int-to-float v5, v5

    .line 110
    mul-float/2addr v0, v5

    .line 111
    float-to-int v0, v0

    .line 112
    add-int/2addr v7, v0

    .line 113
    add-int/2addr v7, v1

    .line 114
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->U()V

    .line 117
    .line 118
    .line 119
    iput v3, p1, Landroid/graphics/Rect;->left:I

    .line 120
    .line 121
    iput v7, p1, Landroid/graphics/Rect;->top:I

    .line 122
    .line 123
    add-int/2addr v3, v2

    .line 124
    iput v3, p1, Landroid/graphics/Rect;->right:I

    .line 125
    .line 126
    add-int/2addr v7, v4

    .line 127
    iput v7, p1, Landroid/graphics/Rect;->bottom:I

    .line 128
    .line 129
    return-void
.end method

.method private static X(F)I
    .locals 2

    .line 1
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x3f28f5c3    # 0.66f

    .line 6
    .line 7
    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private Y(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->getViewPosRelativeToDragLayer()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    aget v1, v0, v1

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    aget v3, v0, v2

    .line 10
    .line 11
    iget-object v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->W:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    add-int/2addr v4, v1

    .line 18
    aget v0, v0, v2

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->W:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/2addr v0, p0

    .line 27
    invoke-virtual {p1, v1, v3, v4, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private Z(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-int v1, v1

    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    float-to-int p1, p1

    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getHitRect(Landroid/graphics/Rect;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    const/4 v3, 0x1

    .line 29
    invoke-static {v0, v3, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sub-int v0, v1, v0

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    sub-int v2, p1, v2

    .line 43
    .line 44
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/AppWidgetResizeFrame;->V(II)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iput v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->c0:I

    .line 51
    .line 52
    iput p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->d0:I

    .line 53
    .line 54
    return v3

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method private a0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/android/launcher3/J3;->y:Lcom/android/launcher3/X;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method private b0(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sub-int/2addr v0, v1

    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    float-to-int p1, p1

    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    sub-int/2addr p1, v1

    .line 21
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->o:Landroid/widget/ImageButton;

    .line 22
    .line 23
    sget-object v1, Lcom/android/launcher3/AppWidgetResizeFrame;->g0:Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/widget/ImageButton;->getHitRect(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method private synthetic c0(Landroid/view/View;IIII)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->U:[I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->U:[I

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->U:[I

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->V:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->W:Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-virtual {p0, p2, p3, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private synthetic d0(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->k0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/AppWidgetResizeFrame;->p0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic f0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    instance-of v0, p1, Lcom/android/launcher3/model/data/A;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    move-object v0, p1

    .line 14
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const v1, 0x7f140155

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :goto_0
    invoke-static {v0, p1}, Lh1/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/O1;->w(ILcom/android/launcher3/widget/N0;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/O1;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, v0}, Lcom/android/launcher3/C2;->C4(Lcom/android/launcher3/util/O1;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    const/16 v1, 0xd

    .line 84
    .line 85
    invoke-virtual {p1, v0, p0, v1}, Lcom/android/launcher3/widget/l0;->Y(Lcom/android/launcher3/v;II)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private synthetic g0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->o0()Lcom/android/launcher3/views/q;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/android/launcher3/J3;->y:Lcom/android/launcher3/X;

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private getViewPosRelativeToDragLayer()[I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/AppWidgetResizeFrame;->i0:[I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getLocationInWindow([I)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget v2, v1, v0

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    aget v1, v1, v3

    .line 13
    .line 14
    iget-object v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->U:[I

    .line 15
    .line 16
    if-nez v4, :cond_0

    .line 17
    .line 18
    const/4 v4, 0x2

    .line 19
    new-array v4, v4, [I

    .line 20
    .line 21
    iput-object v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->U:[I

    .line 22
    .line 23
    iget-object v5, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 24
    .line 25
    invoke-virtual {v5, v4}, Landroid/appwidget/AppWidgetHostView;->getLocationInWindow([I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->W:Landroid/graphics/Rect;

    .line 29
    .line 30
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 31
    .line 32
    iget-object v6, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->V:Landroid/graphics/Rect;

    .line 33
    .line 34
    iget v7, v6, Landroid/graphics/Rect;->left:I

    .line 35
    .line 36
    sub-int/2addr v5, v7

    .line 37
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 40
    .line 41
    sub-int/2addr v4, v6

    .line 42
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->U:[I

    .line 43
    .line 44
    aget v0, p0, v0

    .line 45
    .line 46
    sub-int/2addr v0, v2

    .line 47
    add-int/2addr v0, v5

    .line 48
    aget p0, p0, v3

    .line 49
    .line 50
    sub-int/2addr p0, v1

    .line 51
    add-int/2addr p0, v4

    .line 52
    filled-new-array {v0, p0}, [I

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method private synthetic h0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, v0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 14
    .line 15
    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 16
    .line 17
    add-int/2addr v1, v2

    .line 18
    iget-object v2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iget-object v0, v0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 25
    .line 26
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 27
    .line 28
    add-int/2addr v2, v0

    .line 29
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->I:I

    .line 30
    .line 31
    mul-int/2addr v0, v1

    .line 32
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->Q:I

    .line 33
    .line 34
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->J:I

    .line 35
    .line 36
    mul-int/2addr v0, v2

    .line 37
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->R:I

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->O:I

    .line 41
    .line 42
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->P:I

    .line 43
    .line 44
    new-instance v0, Lcom/android/launcher3/h;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/android/launcher3/h;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->x()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private j0(Z)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    instance-of v2, v1, Lc1/b;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_5

    .line 14
    .line 15
    :cond_0
    iget-object v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    iget-object v4, v2, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 28
    .line 29
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 30
    .line 31
    add-int/2addr v3, v4

    .line 32
    int-to-float v3, v3

    .line 33
    iget-object v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 34
    .line 35
    invoke-virtual {v4}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    iget-object v2, v2, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 40
    .line 41
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 42
    .line 43
    add-int/2addr v4, v2

    .line 44
    int-to-float v2, v4

    .line 45
    iget v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->O:I

    .line 46
    .line 47
    iget v5, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->Q:I

    .line 48
    .line 49
    add-int/2addr v4, v5

    .line 50
    int-to-float v4, v4

    .line 51
    div-float/2addr v4, v3

    .line 52
    iget v3, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->I:I

    .line 53
    .line 54
    int-to-float v3, v3

    .line 55
    sub-float/2addr v4, v3

    .line 56
    invoke-static {v4}, Lcom/android/launcher3/AppWidgetResizeFrame;->X(F)I

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    iget v3, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->P:I

    .line 61
    .line 62
    iget v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->R:I

    .line 63
    .line 64
    add-int/2addr v3, v4

    .line 65
    int-to-float v3, v3

    .line 66
    div-float/2addr v3, v2

    .line 67
    iget v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->J:I

    .line 68
    .line 69
    int-to-float v2, v2

    .line 70
    sub-float/2addr v3, v2

    .line 71
    invoke-static {v3}, Lcom/android/launcher3/AppWidgetResizeFrame;->X(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez p1, :cond_1

    .line 76
    .line 77
    if-nez v8, :cond_1

    .line 78
    .line 79
    if-nez v2, :cond_1

    .line 80
    .line 81
    goto/16 :goto_5

    .line 82
    .line 83
    :cond_1
    iget-object v3, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 84
    .line 85
    const/4 v4, 0x0

    .line 86
    aput v4, v3, v4

    .line 87
    .line 88
    const/4 v13, 0x1

    .line 89
    aput v4, v3, v13

    .line 90
    .line 91
    check-cast v1, Lc1/b;

    .line 92
    .line 93
    iget v3, v1, Lc1/b;->f:I

    .line 94
    .line 95
    iget v14, v1, Lc1/b;->g:I

    .line 96
    .line 97
    iget-boolean v5, v1, Lc1/b;->e:Z

    .line 98
    .line 99
    if-eqz v5, :cond_2

    .line 100
    .line 101
    invoke-virtual {v1}, Lc1/b;->c()I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    goto :goto_0

    .line 106
    :cond_2
    invoke-virtual {v1}, Lc1/b;->a()I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    :goto_0
    iget-boolean v6, v1, Lc1/b;->e:Z

    .line 111
    .line 112
    if-eqz v6, :cond_3

    .line 113
    .line 114
    invoke-virtual {v1}, Lc1/b;->d()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    :goto_1
    move v15, v6

    .line 119
    goto :goto_2

    .line 120
    :cond_3
    invoke-virtual {v1}, Lc1/b;->b()I

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    goto :goto_1

    .line 125
    :goto_2
    iget-object v6, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 126
    .line 127
    add-int/2addr v3, v5

    .line 128
    invoke-virtual {v6, v5, v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 129
    .line 130
    .line 131
    iget-object v5, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 132
    .line 133
    iget-boolean v6, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->C:Z

    .line 134
    .line 135
    iget-boolean v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->D:Z

    .line 136
    .line 137
    iget v9, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->K:I

    .line 138
    .line 139
    iget v10, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->M:I

    .line 140
    .line 141
    iget-object v3, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 142
    .line 143
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 144
    .line 145
    .line 146
    move-result v11

    .line 147
    iget-object v12, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 148
    .line 149
    invoke-virtual/range {v5 .. v12}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b(ZZIIIILcom/android/launcher3/AppWidgetResizeFrame$b;)I

    .line 150
    .line 151
    .line 152
    move-result v17

    .line 153
    iget-object v3, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 154
    .line 155
    move v12, v2

    .line 156
    iget v2, v3, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 157
    .line 158
    invoke-virtual {v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    const/4 v5, -0x1

    .line 163
    if-eqz v17, :cond_5

    .line 164
    .line 165
    iget-object v6, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 166
    .line 167
    iget-boolean v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->C:Z

    .line 168
    .line 169
    if-eqz v7, :cond_4

    .line 170
    .line 171
    move v7, v5

    .line 172
    goto :goto_3

    .line 173
    :cond_4
    move v7, v13

    .line 174
    :goto_3
    aput v7, v6, v4

    .line 175
    .line 176
    :cond_5
    new-instance v6, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    const-string v7, "resizeWidgetIfNeeded  cellY :"

    .line 182
    .line 183
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string v7, " mMinVSpan:"

    .line 190
    .line 191
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    iget v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->L:I

    .line 195
    .line 196
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v7, " mMaxVSpan:"

    .line 200
    .line 201
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->N:I

    .line 205
    .line 206
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string v7, " mCellLayout.getCountY():"

    .line 210
    .line 211
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget-object v8, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 215
    .line 216
    invoke-virtual {v8}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 217
    .line 218
    .line 219
    move-result v8

    .line 220
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v6

    .line 227
    const-string v8, "AppWidgetResizeFrame"

    .line 228
    .line 229
    invoke-static {v8, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    iget-object v6, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 233
    .line 234
    add-int/2addr v14, v15

    .line 235
    invoke-virtual {v6, v15, v14}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 236
    .line 237
    .line 238
    iget-object v9, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 239
    .line 240
    iget-boolean v10, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->E:Z

    .line 241
    .line 242
    iget-boolean v11, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->F:Z

    .line 243
    .line 244
    move v6, v13

    .line 245
    iget v13, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->L:I

    .line 246
    .line 247
    iget v14, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->N:I

    .line 248
    .line 249
    iget-object v15, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 250
    .line 251
    invoke-virtual {v15}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 252
    .line 253
    .line 254
    move-result v15

    .line 255
    move/from16 v18, v4

    .line 256
    .line 257
    iget-object v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 258
    .line 259
    move-object/from16 v16, v4

    .line 260
    .line 261
    invoke-virtual/range {v9 .. v16}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b(ZZIIIILcom/android/launcher3/AppWidgetResizeFrame$b;)I

    .line 262
    .line 263
    .line 264
    move-result v9

    .line 265
    iget-object v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->u:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 266
    .line 267
    move v10, v3

    .line 268
    iget v3, v4, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 269
    .line 270
    invoke-virtual {v4}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 271
    .line 272
    .line 273
    move-result v4

    .line 274
    if-eqz v9, :cond_7

    .line 275
    .line 276
    iget-object v11, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 277
    .line 278
    iget-boolean v12, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->E:Z

    .line 279
    .line 280
    if-eqz v12, :cond_6

    .line 281
    .line 282
    move v13, v5

    .line 283
    goto :goto_4

    .line 284
    :cond_6
    move v13, v6

    .line 285
    :goto_4
    aput v13, v11, v6

    .line 286
    .line 287
    :cond_7
    if-nez p1, :cond_8

    .line 288
    .line 289
    if-nez v9, :cond_8

    .line 290
    .line 291
    if-nez v17, :cond_8

    .line 292
    .line 293
    :goto_5
    return-void

    .line 294
    :cond_8
    add-int v5, v3, v4

    .line 295
    .line 296
    iget-object v11, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 297
    .line 298
    invoke-virtual {v11}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 299
    .line 300
    .line 301
    move-result v11

    .line 302
    if-gt v5, v11, :cond_9

    .line 303
    .line 304
    add-int v5, v2, v10

    .line 305
    .line 306
    iget-object v11, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 307
    .line 308
    invoke-virtual {v11}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 309
    .line 310
    .line 311
    move-result v11

    .line 312
    if-le v5, v11, :cond_a

    .line 313
    .line 314
    :cond_9
    move v5, v3

    .line 315
    move v11, v6

    .line 316
    move v3, v2

    .line 317
    move v6, v4

    .line 318
    move v4, v10

    .line 319
    move/from16 v2, p1

    .line 320
    .line 321
    goto/16 :goto_b

    .line 322
    .line 323
    :cond_a
    if-eqz p1, :cond_b

    .line 324
    .line 325
    iget-object v5, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 326
    .line 327
    iget-object v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->s:[I

    .line 328
    .line 329
    aget v8, v7, v18

    .line 330
    .line 331
    aput v8, v5, v18

    .line 332
    .line 333
    aget v7, v7, v6

    .line 334
    .line 335
    aput v7, v5, v6

    .line 336
    .line 337
    :goto_6
    move v5, v6

    .line 338
    goto :goto_7

    .line 339
    :cond_b
    iget-object v5, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->s:[I

    .line 340
    .line 341
    iget-object v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 342
    .line 343
    aget v8, v7, v18

    .line 344
    .line 345
    aput v8, v5, v18

    .line 346
    .line 347
    aget v7, v7, v6

    .line 348
    .line 349
    aput v7, v5, v6

    .line 350
    .line 351
    goto :goto_6

    .line 352
    :goto_7
    iget-object v6, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 353
    .line 354
    instance-of v7, v6, Lcom/android/launcher3/widget/F0;

    .line 355
    .line 356
    if-nez v7, :cond_e

    .line 357
    .line 358
    move-object v7, v1

    .line 359
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 360
    .line 361
    move-object v8, v7

    .line 362
    iget-object v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 363
    .line 364
    move v11, v5

    .line 365
    move-object v12, v8

    .line 366
    move/from16 v8, p1

    .line 367
    .line 368
    move v5, v4

    .line 369
    move v4, v10

    .line 370
    move/from16 v10, v18

    .line 371
    .line 372
    invoke-virtual/range {v1 .. v8}, Lcom/android/launcher3/CellLayout;->A(IIIILandroid/view/View;[IZ)Z

    .line 373
    .line 374
    .line 375
    move-result v1

    .line 376
    move v6, v5

    .line 377
    move v5, v3

    .line 378
    move v3, v2

    .line 379
    move v2, v8

    .line 380
    if-eqz v1, :cond_f

    .line 381
    .line 382
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->h:LO0/e;

    .line 383
    .line 384
    if-eqz v1, :cond_d

    .line 385
    .line 386
    iget v7, v12, Lc1/b;->f:I

    .line 387
    .line 388
    if-ne v7, v4, :cond_c

    .line 389
    .line 390
    iget v7, v12, Lc1/b;->g:I

    .line 391
    .line 392
    if-eq v7, v6, :cond_d

    .line 393
    .line 394
    :cond_c
    iget-object v7, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 395
    .line 396
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 397
    .line 398
    .line 399
    move-result-object v8

    .line 400
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 401
    .line 402
    .line 403
    move-result-object v13

    .line 404
    filled-new-array {v8, v13}, [Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object v8

    .line 408
    const v13, 0x7f14048c

    .line 409
    .line 410
    .line 411
    invoke-virtual {v7, v13, v8}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v7

    .line 415
    invoke-virtual {v1, v7}, LO0/e;->a(Ljava/lang/CharSequence;)V

    .line 416
    .line 417
    .line 418
    :cond_d
    invoke-virtual {v12, v3}, Lc1/b;->h(I)V

    .line 419
    .line 420
    .line 421
    invoke-virtual {v12, v5}, Lc1/b;->i(I)V

    .line 422
    .line 423
    .line 424
    iput v4, v12, Lc1/b;->f:I

    .line 425
    .line 426
    iput v6, v12, Lc1/b;->g:I

    .line 427
    .line 428
    iget v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->J:I

    .line 429
    .line 430
    add-int/2addr v1, v9

    .line 431
    iput v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->J:I

    .line 432
    .line 433
    iget v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->I:I

    .line 434
    .line 435
    add-int v1, v1, v17

    .line 436
    .line 437
    iput v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->I:I

    .line 438
    .line 439
    if-nez v2, :cond_f

    .line 440
    .line 441
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 442
    .line 443
    iget-object v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 444
    .line 445
    invoke-static {v1, v2, v4, v6}, Lr2/b;->i(Landroid/appwidget/AppWidgetHostView;Landroid/content/Context;II)V

    .line 446
    .line 447
    .line 448
    goto :goto_8

    .line 449
    :cond_e
    move v6, v4

    .line 450
    move v11, v5

    .line 451
    move v4, v10

    .line 452
    move/from16 v10, v18

    .line 453
    .line 454
    :cond_f
    :goto_8
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 455
    .line 456
    invoke-virtual {v1}, Lcom/android/launcher3/widget/h;->u()Z

    .line 457
    .line 458
    .line 459
    move-result v1

    .line 460
    if-eqz v1, :cond_12

    .line 461
    .line 462
    if-eq v4, v11, :cond_11

    .line 463
    .line 464
    if-ne v6, v11, :cond_10

    .line 465
    .line 466
    goto :goto_9

    .line 467
    :cond_10
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 468
    .line 469
    invoke-virtual {v1, v11}, Lcom/android/launcher3/widget/h;->setEnforcedCornerRadiusDefault(Z)V

    .line 470
    .line 471
    .line 472
    goto :goto_a

    .line 473
    :cond_11
    :goto_9
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 474
    .line 475
    invoke-virtual {v1, v10}, Lcom/android/launcher3/widget/h;->setEnforcedCornerRadiusDefault(Z)V

    .line 476
    .line 477
    .line 478
    :goto_a
    const v1, 0x7f0b0695

    .line 479
    .line 480
    .line 481
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 482
    .line 483
    .line 484
    move-result-object v1

    .line 485
    check-cast v1, Landroid/widget/ImageView;

    .line 486
    .line 487
    if-eqz v1, :cond_12

    .line 488
    .line 489
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 490
    .line 491
    .line 492
    move-result-object v1

    .line 493
    instance-of v2, v1, Landroid/graphics/drawable/GradientDrawable;

    .line 494
    .line 495
    if-eqz v2, :cond_12

    .line 496
    .line 497
    iget-object v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 498
    .line 499
    invoke-virtual {v2}, Lcom/android/launcher3/widget/h;->getEnforcedCornerRadius()F

    .line 500
    .line 501
    .line 502
    move-result v2

    .line 503
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 504
    .line 505
    .line 506
    move-result-object v1

    .line 507
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 508
    .line 509
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 510
    .line 511
    .line 512
    :cond_12
    iget-object v0, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 513
    .line 514
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->requestLayout()V

    .line 515
    .line 516
    .line 517
    return-void

    .line 518
    :goto_b
    new-instance v1, Ljava/lang/StringBuilder;

    .line 519
    .line 520
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 521
    .line 522
    .line 523
    const-string v10, "resizeWidgetIfNeeded  onDismiss :"

    .line 524
    .line 525
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    .line 527
    .line 528
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 529
    .line 530
    .line 531
    const-string v2, " cellX:"

    .line 532
    .line 533
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .line 535
    .line 536
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    const-string v2, " spanX:"

    .line 540
    .line 541
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    const-string v2, " cellY:"

    .line 548
    .line 549
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 553
    .line 554
    .line 555
    const-string v2, " spanY:"

    .line 556
    .line 557
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    .line 559
    .line 560
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    const-string v2, " mCellLayout.getCountX():"

    .line 564
    .line 565
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    iget-object v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 569
    .line 570
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 571
    .line 572
    .line 573
    move-result v2

    .line 574
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 575
    .line 576
    .line 577
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    .line 579
    .line 580
    iget-object v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 581
    .line 582
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 583
    .line 584
    .line 585
    move-result v2

    .line 586
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 587
    .line 588
    .line 589
    const-string v2, " vSpanDelta:"

    .line 590
    .line 591
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    const-string v2, " mDirectionVector[1]:"

    .line 598
    .line 599
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    .line 601
    .line 602
    iget-object v0, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->r:[I

    .line 603
    .line 604
    aget v0, v0, v11

    .line 605
    .line 606
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v0

    .line 613
    invoke-static {v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    .line 615
    .line 616
    return-void
.end method

.method private k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->t()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->getEnforcedCornerRadius()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const v1, 0x7f0b0695

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Landroid/widget/ImageView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    instance-of v1, p0, Landroid/graphics/drawable/GradientDrawable;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method private l0(Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/DragLayer;)V
    .locals 6

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/widget/U;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 12
    .line 13
    iget p3, v0, Lcom/android/launcher3/widget/U;->i:I

    .line 14
    .line 15
    iput p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->K:I

    .line 16
    .line 17
    iget p3, v0, Lcom/android/launcher3/widget/U;->j:I

    .line 18
    .line 19
    iput p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->L:I

    .line 20
    .line 21
    iget p3, v0, Lcom/android/launcher3/widget/U;->k:I

    .line 22
    .line 23
    iput p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->M:I

    .line 24
    .line 25
    iget p3, v0, Lcom/android/launcher3/widget/U;->l:I

    .line 26
    .line 27
    iput p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->N:I

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/widget/h;->u()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p1, p3}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p3, Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->f0:Landroid/graphics/Rect;

    .line 57
    .line 58
    iget v1, p1, Lcom/android/launcher3/X3;->m0:I

    .line 59
    .line 60
    iput v1, p3, Landroid/graphics/Rect;->left:I

    .line 61
    .line 62
    iget v2, p1, Lcom/android/launcher3/X3;->n0:I

    .line 63
    .line 64
    iput v2, p3, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    iput v1, p3, Landroid/graphics/Rect;->right:I

    .line 67
    .line 68
    iget p1, p1, Lcom/android/launcher3/X3;->o0:I

    .line 69
    .line 70
    iput p1, p3, Landroid/graphics/Rect;->bottom:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p3, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->f0:Landroid/graphics/Rect;

    .line 80
    .line 81
    invoke-static {p1, p3, v1}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 82
    .line 83
    .line 84
    :goto_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget p3, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 93
    .line 94
    const/4 v1, 0x2

    .line 95
    and-int/2addr p3, v1

    .line 96
    const/4 v2, 0x0

    .line 97
    const/4 v3, 0x1

    .line 98
    if-eqz p3, :cond_1

    .line 99
    .line 100
    iget p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->L:I

    .line 101
    .line 102
    iget v4, p1, Lcom/android/launcher3/F1;->G0:I

    .line 103
    .line 104
    if-ge p3, v4, :cond_1

    .line 105
    .line 106
    iget v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->N:I

    .line 107
    .line 108
    if-le v4, v3, :cond_1

    .line 109
    .line 110
    if-ge p3, v4, :cond_1

    .line 111
    .line 112
    move p3, v3

    .line 113
    goto :goto_1

    .line 114
    :cond_1
    move p3, v2

    .line 115
    :goto_1
    iput-boolean p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->H:Z

    .line 116
    .line 117
    const/16 v4, 0x8

    .line 118
    .line 119
    if-nez p3, :cond_2

    .line 120
    .line 121
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 122
    .line 123
    aget-object p3, p3, v3

    .line 124
    .line 125
    invoke-virtual {p3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 126
    .line 127
    .line 128
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 129
    .line 130
    const/4 v5, 0x3

    .line 131
    aget-object p3, p3, v5

    .line 132
    .line 133
    invoke-virtual {p3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    :cond_2
    iget p3, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 137
    .line 138
    and-int/2addr p3, v3

    .line 139
    if-eqz p3, :cond_3

    .line 140
    .line 141
    iget p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->K:I

    .line 142
    .line 143
    iget p1, p1, Lcom/android/launcher3/F1;->H0:I

    .line 144
    .line 145
    if-ge p3, p1, :cond_3

    .line 146
    .line 147
    iget p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->M:I

    .line 148
    .line 149
    if-le p1, v3, :cond_3

    .line 150
    .line 151
    if-ge p3, p1, :cond_3

    .line 152
    .line 153
    move p1, v3

    .line 154
    goto :goto_2

    .line 155
    :cond_3
    move p1, v2

    .line 156
    :goto_2
    iput-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->G:Z

    .line 157
    .line 158
    if-nez p1, :cond_4

    .line 159
    .line 160
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 161
    .line 162
    aget-object p1, p1, v2

    .line 163
    .line 164
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 168
    .line 169
    aget-object p1, p1, v1

    .line 170
    .line 171
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 172
    .line 173
    .line 174
    :cond_4
    const p1, 0x7f0b0693

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    check-cast p1, Landroid/widget/ImageButton;

    .line 182
    .line 183
    iput-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->o:Landroid/widget/ImageButton;

    .line 184
    .line 185
    if-eqz p1, :cond_5

    .line 186
    .line 187
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    instance-of p3, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 192
    .line 193
    if-eqz p3, :cond_5

    .line 194
    .line 195
    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 196
    .line 197
    invoke-virtual {p1, v3}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    if-eqz p1, :cond_5

    .line 202
    .line 203
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    const p3, 0x7f06085b

    .line 208
    .line 209
    .line 210
    invoke-static {p2, p3}, Lz/a;->c(Landroid/content/Context;I)I

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 215
    .line 216
    .line 217
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->D()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-eqz p1, :cond_6

    .line 222
    .line 223
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->o:Landroid/widget/ImageButton;

    .line 224
    .line 225
    if-eqz p1, :cond_6

    .line 226
    .line 227
    invoke-virtual {p1, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 228
    .line 229
    .line 230
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->o:Landroid/widget/ImageButton;

    .line 231
    .line 232
    new-instance p2, Lcom/android/launcher3/m;

    .line 233
    .line 234
    invoke-direct {p2, p0}, Lcom/android/launcher3/m;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    .line 239
    .line 240
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->a0()Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-nez p1, :cond_6

    .line 245
    .line 246
    iget-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->e0:Z

    .line 247
    .line 248
    if-eqz p1, :cond_6

    .line 249
    .line 250
    new-instance p1, Lcom/android/launcher3/n;

    .line 251
    .line 252
    invoke-direct {p1, p0}, Lcom/android/launcher3/n;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 256
    .line 257
    .line 258
    :cond_6
    sget-object p1, Lf1/a;->o:Lf1/a$a;

    .line 259
    .line 260
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    if-eqz p1, :cond_7

    .line 265
    .line 266
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 267
    .line 268
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->a0:Lcom/android/launcher3/widget/T$a;

    .line 269
    .line 270
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/T;->setCellChildViewPreLayoutListener(Lcom/android/launcher3/widget/T$a;)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->V:Landroid/graphics/Rect;

    .line 274
    .line 275
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 276
    .line 277
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getLeft()I

    .line 278
    .line 279
    .line 280
    move-result p2

    .line 281
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 282
    .line 283
    invoke-virtual {p3}, Landroid/appwidget/AppWidgetHostView;->getTop()I

    .line 284
    .line 285
    .line 286
    move-result p3

    .line 287
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 288
    .line 289
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHostView;->getRight()I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 294
    .line 295
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getBottom()I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 300
    .line 301
    .line 302
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->W:Landroid/graphics/Rect;

    .line 303
    .line 304
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->V:Landroid/graphics/Rect;

    .line 305
    .line 306
    invoke-virtual {p1, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 307
    .line 308
    .line 309
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 310
    .line 311
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    check-cast p1, Lc1/b;

    .line 316
    .line 317
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 318
    .line 319
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object p2

    .line 323
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 324
    .line 325
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 326
    .line 327
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->getCellPosMapper()Lc1/c;

    .line 328
    .line 329
    .line 330
    move-result-object p3

    .line 331
    invoke-virtual {p3, p2}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 332
    .line 333
    .line 334
    move-result-object p3

    .line 335
    iget v0, p3, Lc1/c$a;->a:I

    .line 336
    .line 337
    invoke-virtual {p1, v0}, Lc1/b;->e(I)V

    .line 338
    .line 339
    .line 340
    iget v0, p3, Lc1/c$a;->a:I

    .line 341
    .line 342
    invoke-virtual {p1, v0}, Lc1/b;->h(I)V

    .line 343
    .line 344
    .line 345
    iget v0, p3, Lc1/c$a;->b:I

    .line 346
    .line 347
    invoke-virtual {p1, v0}, Lc1/b;->g(I)V

    .line 348
    .line 349
    .line 350
    iget p3, p3, Lc1/c$a;->b:I

    .line 351
    .line 352
    invoke-virtual {p1, p3}, Lc1/b;->i(I)V

    .line 353
    .line 354
    .line 355
    iget p3, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 356
    .line 357
    iput p3, p1, Lc1/b;->f:I

    .line 358
    .line 359
    iget p3, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 360
    .line 361
    iput p3, p1, Lc1/b;->g:I

    .line 362
    .line 363
    iput-boolean v3, p1, Lc1/b;->h:Z

    .line 364
    .line 365
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 366
    .line 367
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 368
    .line 369
    invoke-virtual {p1, p3}, Lcom/android/launcher3/CellLayout;->g0(Landroid/view/View;)V

    .line 370
    .line 371
    .line 372
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 373
    .line 374
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 379
    .line 380
    .line 381
    move-result-object p1

    .line 382
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->z:Lcom/android/launcher3/logging/d;

    .line 383
    .line 384
    invoke-interface {p1, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    sget-object p2, Lcom/android/launcher3/logging/StatsLogManager$e;->c2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 393
    .line 394
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 395
    .line 396
    .line 397
    invoke-virtual {p0, p0}, Landroid/widget/LinearLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 398
    .line 399
    .line 400
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->k0()V

    .line 401
    .line 402
    .line 403
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 404
    .line 405
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->b0:Landroid/view/View$OnLayoutChangeListener;

    .line 406
    .line 407
    invoke-virtual {p1, p0}, Landroid/appwidget/AppWidgetHostView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 408
    .line 409
    .line 410
    return-void
.end method

.method public static m0(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x15

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x16

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x13

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const/16 v0, 0x14

    .line 14
    .line 15
    if-eq p0, v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x7a

    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0x7b

    .line 22
    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    const/16 v0, 0x5c

    .line 26
    .line 27
    if-eq p0, v0, :cond_1

    .line 28
    .line 29
    const/16 v0, 0x5d

    .line 30
    .line 31
    if-ne p0, v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static n0(Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const v3, 0x7f0e006f

    .line 25
    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-virtual {v2, v3, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/android/launcher3/AppWidgetResizeFrame;

    .line 33
    .line 34
    invoke-direct {v2, p0, p1, v1}, Lcom/android/launcher3/AppWidgetResizeFrame;->l0(Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/dragndrop/DragLayer;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->D1()LO0/r;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContentDescription()Ljava/lang/CharSequence;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const v0, 0x7f140485

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v2, p0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 78
    .line 79
    const/4 p1, 0x1

    .line 80
    iput-boolean p1, p0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->d:Z

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    iput-boolean p1, v2, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 86
    .line 87
    new-instance p0, Lcom/android/launcher3/l;

    .line 88
    .line 89
    invoke-direct {p0, v2}, Lcom/android/launcher3/l;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2, p0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method private o0()Lcom/android/launcher3/views/q;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->o:Landroid/widget/ImageButton;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const v2, 0x7f070c9a

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    new-instance v2, Lcom/android/launcher3/views/q;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/views/q;-><init>(Landroid/content/Context;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const v4, 0x7f14033f

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iget v4, v0, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->o:Landroid/widget/ImageButton;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    div-int/lit8 p0, p0, 0x2

    .line 57
    .line 58
    add-int/2addr v4, p0

    .line 59
    invoke-virtual {v2, v3, v4, v0, v1}, Lcom/android/launcher3/views/q;->e0(Ljava/lang/String;ILandroid/graphics/Rect;I)Lcom/android/launcher3/views/q;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method private q0(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;FF)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/AppWidgetResizeFrame;->r0(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;FFLandroid/animation/AnimatorSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private r0(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;FFLandroid/animation/AnimatorSet;)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    move v3, v2

    .line 8
    :goto_0
    if-ge v3, v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    if-eqz p5, :cond_0

    .line 15
    .line 16
    iget-object v5, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->i:Lcom/android/launcher3/w0;

    .line 17
    .line 18
    sget-object v6, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 19
    .line 20
    new-array v7, v0, [F

    .line 21
    .line 22
    aput p3, v7, v2

    .line 23
    .line 24
    invoke-static {v4, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v5, v4}, Lcom/android/launcher3/w0;->c(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {p5, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {v4, p3}, Landroid/view/View;->setAlpha(F)V

    .line 37
    .line 38
    .line 39
    :goto_1
    add-int/2addr v3, v0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    if-eqz p5, :cond_2

    .line 42
    .line 43
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->i:Lcom/android/launcher3/w0;

    .line 44
    .line 45
    sget-object v1, Lcom/android/launcher3/CellLayout;->w0:Landroid/util/FloatProperty;

    .line 46
    .line 47
    new-array v3, v0, [F

    .line 48
    .line 49
    aput p4, v3, v2

    .line 50
    .line 51
    invoke-static {p1, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {p3, v3}, Lcom/android/launcher3/w0;->c(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p5, p3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 60
    .line 61
    .line 62
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->i:Lcom/android/launcher3/w0;

    .line 63
    .line 64
    new-array v3, v0, [F

    .line 65
    .line 66
    aput p4, v3, v2

    .line 67
    .line 68
    invoke-static {p2, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p3, v1}, Lcom/android/launcher3/w0;->c(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-virtual {p5, p3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_2
    invoke-virtual {p1, p4}, Lcom/android/launcher3/CellLayout;->setSpringLoadedProgress(F)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, p4}, Lcom/android/launcher3/CellLayout;->setSpringLoadedProgress(F)V

    .line 84
    .line 85
    .line 86
    :goto_2
    const/4 p3, 0x0

    .line 87
    cmpl-float p3, p4, p3

    .line 88
    .line 89
    if-lez p3, :cond_3

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_3
    move v0, v2

    .line 93
    :goto_3
    if-eqz p5, :cond_4

    .line 94
    .line 95
    new-instance p3, Lcom/android/launcher3/AppWidgetResizeFrame$a;

    .line 96
    .line 97
    invoke-direct {p3, p0, p1, v0, p2}, Lcom/android/launcher3/AppWidgetResizeFrame$a;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;Lcom/android/launcher3/CellLayout;ZLcom/android/launcher3/CellLayout;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p5, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_4
    invoke-virtual {p1, v0}, Lcom/android/launcher3/CellLayout;->setIsDragOverlapping(Z)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p2, v0}, Lcom/android/launcher3/CellLayout;->setIsDragOverlapping(Z)V

    .line 108
    .line 109
    .line 110
    return-void
.end method


# virtual methods
.method public V(II)Z
    .locals 6

    .line 1
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->G:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move v0, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v2

    .line 14
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->C:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 21
    .line 22
    sub-int/2addr v0, v3

    .line 23
    if-le p1, v0, :cond_1

    .line 24
    .line 25
    iget-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->G:Z

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    move p1, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move p1, v2

    .line 32
    :goto_1
    iput-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->D:Z

    .line 33
    .line 34
    iget p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->S:I

    .line 35
    .line 36
    add-int/2addr v3, p1

    .line 37
    if-ge p2, v3, :cond_2

    .line 38
    .line 39
    iget-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->H:Z

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    move p1, v1

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move p1, v2

    .line 46
    :goto_2
    iput-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->E:Z

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 53
    .line 54
    sub-int/2addr p1, v0

    .line 55
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->T:I

    .line 56
    .line 57
    add-int/2addr p1, v0

    .line 58
    if-le p2, p1, :cond_3

    .line 59
    .line 60
    iget-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->H:Z

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    move p1, v1

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move p1, v2

    .line 67
    :goto_3
    iput-boolean p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->F:Z

    .line 68
    .line 69
    iget-boolean p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->C:Z

    .line 70
    .line 71
    if-nez p2, :cond_5

    .line 72
    .line 73
    iget-boolean v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->D:Z

    .line 74
    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    iget-boolean v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->E:Z

    .line 78
    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_4
    move p1, v2

    .line 85
    goto :goto_5

    .line 86
    :cond_5
    :goto_4
    move p1, v1

    .line 87
    :goto_5
    const/4 v0, 0x2

    .line 88
    if-eqz p1, :cond_a

    .line 89
    .line 90
    iget-object v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 91
    .line 92
    aget-object v3, v3, v2

    .line 93
    .line 94
    const/4 v4, 0x0

    .line 95
    const/high16 v5, 0x3f800000    # 1.0f

    .line 96
    .line 97
    if-eqz p2, :cond_6

    .line 98
    .line 99
    move p2, v5

    .line 100
    goto :goto_6

    .line 101
    :cond_6
    move p2, v4

    .line 102
    :goto_6
    invoke-virtual {v3, p2}, Landroid/view/View;->setAlpha(F)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 106
    .line 107
    aget-object p2, p2, v0

    .line 108
    .line 109
    iget-boolean v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->D:Z

    .line 110
    .line 111
    if-eqz v3, :cond_7

    .line 112
    .line 113
    move v3, v5

    .line 114
    goto :goto_7

    .line 115
    :cond_7
    move v3, v4

    .line 116
    :goto_7
    invoke-virtual {p2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 120
    .line 121
    aget-object p2, p2, v1

    .line 122
    .line 123
    iget-boolean v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->E:Z

    .line 124
    .line 125
    if-eqz v1, :cond_8

    .line 126
    .line 127
    move v1, v5

    .line 128
    goto :goto_8

    .line 129
    :cond_8
    move v1, v4

    .line 130
    :goto_8
    invoke-virtual {p2, v1}, Landroid/view/View;->setAlpha(F)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 134
    .line 135
    const/4 v1, 0x3

    .line 136
    aget-object p2, p2, v1

    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->F:Z

    .line 139
    .line 140
    if-eqz v1, :cond_9

    .line 141
    .line 142
    move v4, v5

    .line 143
    :cond_9
    invoke-virtual {p2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 144
    .line 145
    .line 146
    :cond_a
    iget-boolean p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->C:Z

    .line 147
    .line 148
    if-eqz p2, :cond_b

    .line 149
    .line 150
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    neg-int v1, v1

    .line 157
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    iget v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 162
    .line 163
    mul-int/2addr v4, v0

    .line 164
    sub-int/2addr v3, v4

    .line 165
    invoke-virtual {p2, v1, v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 166
    .line 167
    .line 168
    goto :goto_9

    .line 169
    :cond_b
    iget-boolean p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->D:Z

    .line 170
    .line 171
    if-eqz p2, :cond_c

    .line 172
    .line 173
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 174
    .line 175
    iget v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 176
    .line 177
    mul-int/2addr v1, v0

    .line 178
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    sub-int/2addr v1, v3

    .line 183
    iget-object v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 184
    .line 185
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getRight()I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    sub-int/2addr v3, v4

    .line 194
    invoke-virtual {p2, v1, v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 195
    .line 196
    .line 197
    goto :goto_9

    .line 198
    :cond_c
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 199
    .line 200
    invoke-virtual {p2, v2, v2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 201
    .line 202
    .line 203
    :goto_9
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 204
    .line 205
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getRight()I

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    invoke-virtual {p2, v1, v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 214
    .line 215
    .line 216
    iget-boolean p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->E:Z

    .line 217
    .line 218
    if-eqz p2, :cond_d

    .line 219
    .line 220
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 221
    .line 222
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    neg-int v1, v1

    .line 227
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    iget v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 232
    .line 233
    mul-int/2addr v3, v0

    .line 234
    sub-int/2addr v2, v3

    .line 235
    invoke-virtual {p2, v1, v2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 236
    .line 237
    .line 238
    goto :goto_a

    .line 239
    :cond_d
    iget-boolean p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->F:Z

    .line 240
    .line 241
    if-eqz p2, :cond_e

    .line 242
    .line 243
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 244
    .line 245
    iget v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->q:I

    .line 246
    .line 247
    mul-int/2addr v1, v0

    .line 248
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getHeight()I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    sub-int/2addr v1, v0

    .line 253
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 254
    .line 255
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    sub-int/2addr v0, v2

    .line 264
    invoke-virtual {p2, v1, v0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 265
    .line 266
    .line 267
    goto :goto_a

    .line 268
    :cond_e
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 269
    .line 270
    invoke-virtual {p2, v2, v2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 271
    .line 272
    .line 273
    :goto_a
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 274
    .line 275
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTop()I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 280
    .line 281
    .line 282
    move-result p0

    .line 283
    invoke-virtual {p2, v0, p0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->d(II)V

    .line 284
    .line 285
    .line 286
    return p1
.end method

.method public getViewForAccessibility()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    return-object p0
.end method

.method protected handleClose(Z)V
    .locals 1

    .line 1
    sget-object p1, Lf1/a;->o:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/widget/T;->E()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Landroid/appwidget/AppWidgetHostView;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->b0:Landroid/view/View$OnLayoutChangeListener;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Landroid/appwidget/AppWidgetHostView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x8

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame;->b0(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame;->Z(Landroid/view/MotionEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 24
    .line 25
    .line 26
    return v1
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    float-to-int v1, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    float-to-int v2, v2

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    if-eq v0, p1, :cond_1

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    if-eq v0, v3, :cond_0

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    if-eq v0, v3, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->c0:I

    .line 28
    .line 29
    sub-int/2addr v1, v0

    .line 30
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->d0:I

    .line 31
    .line 32
    sub-int/2addr v2, v0

    .line 33
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/AppWidgetResizeFrame;->s0(II)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->c0:I

    .line 38
    .line 39
    sub-int/2addr v1, v0

    .line 40
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->d0:I

    .line 41
    .line 42
    sub-int/2addr v2, v0

    .line 43
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/AppWidgetResizeFrame;->s0(II)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/AppWidgetResizeFrame;->i0()V

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->d0:I

    .line 51
    .line 52
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->c0:I

    .line 53
    .line 54
    :goto_0
    return p1

    .line 55
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame;->Z(Landroid/view/MotionEvent;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/AppWidgetResizeFrame;->j0(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->z:Lcom/android/launcher3/logging/d;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 31
    .line 32
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->d2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 37
    .line 38
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method protected onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getThemeRes()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const v2, 0x7f040781

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setForegroundTintList(Landroid/content/res/ColorStateList;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 29
    .line 30
    const v2, 0x7f0b0696

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/4 v3, 0x0

    .line 38
    aput-object v2, v1, v3

    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 41
    .line 42
    const v2, 0x7f0b0698

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const/4 v4, 0x1

    .line 50
    aput-object v2, v1, v4

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 53
    .line 54
    const v2, 0x7f0b0697

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const/4 v5, 0x2

    .line 62
    aput-object v2, v1, v5

    .line 63
    .line 64
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 65
    .line 66
    const v2, 0x7f0b0694

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const/4 v6, 0x3

    .line 74
    aput-object v2, v1, v6

    .line 75
    .line 76
    const v1, 0x7f0b0695

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Landroid/widget/ImageView;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 89
    .line 90
    aget-object v1, v1, v3

    .line 91
    .line 92
    if-eqz v1, :cond_0

    .line 93
    .line 94
    check-cast v1, Landroid/widget/ImageView;

    .line 95
    .line 96
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 100
    .line 101
    aget-object v1, v1, v4

    .line 102
    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    check-cast v1, Landroid/widget/ImageView;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 108
    .line 109
    .line 110
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 111
    .line 112
    aget-object v1, v1, v5

    .line 113
    .line 114
    if-eqz v1, :cond_2

    .line 115
    .line 116
    check-cast v1, Landroid/widget/ImageView;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 119
    .line 120
    .line 121
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 122
    .line 123
    aget-object p0, p0, v6

    .line 124
    .line 125
    if-eqz p0, :cond_3

    .line 126
    .line 127
    check-cast p0, Landroid/widget/ImageView;

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/android/launcher3/AppWidgetResizeFrame;->m0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Lcom/android/launcher3/a;->close(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->requestFocus()Z

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    return p2
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    :goto_0
    const/4 p2, 0x4

    .line 6
    if-ge p1, p2, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 9
    .line 10
    aget-object p2, p2, p1

    .line 11
    .line 12
    iget-object p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->k:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    check-cast p3, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 25
    .line 26
    .line 27
    move-result p5

    .line 28
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p3, p4, p5, v0, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 p1, p1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->k:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setSystemGestureExclusionRects(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public p0(Z)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v6, 0x1

    .line 5
    sget-object v2, Lf1/a;->o:Lf1/a$a;

    .line 6
    .line 7
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const-wide/16 v7, 0x96

    .line 12
    .line 13
    const/4 v3, 0x4

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    iget-object v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    new-instance v2, Landroid/animation/LayoutTransition;

    .line 25
    .line 26
    invoke-direct {v2}, Landroid/animation/LayoutTransition;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v7, v8}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 33
    .line 34
    .line 35
    iget-object v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->l:Lcom/android/launcher3/widget/T;

    .line 36
    .line 37
    invoke-virtual {v4, v2}, Landroid/appwidget/AppWidgetHostView;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    sget-object v2, Lcom/android/launcher3/AppWidgetResizeFrame;->g0:Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {v0, v2}, Lcom/android/launcher3/AppWidgetResizeFrame;->W(Landroid/graphics/Rect;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    iget v9, v2, Landroid/graphics/Rect;->left:I

    .line 54
    .line 55
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    if-gez v2, :cond_1

    .line 58
    .line 59
    neg-int v10, v2

    .line 60
    iput v10, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->S:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iput v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->S:I

    .line 64
    .line 65
    :goto_0
    add-int v10, v2, v5

    .line 66
    .line 67
    iget-object v11, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 68
    .line 69
    invoke-virtual {v11}, Landroid/widget/FrameLayout;->getHeight()I

    .line 70
    .line 71
    .line 72
    move-result v11

    .line 73
    if-le v10, v11, :cond_2

    .line 74
    .line 75
    iget-object v11, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->n:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 76
    .line 77
    invoke-virtual {v11}, Landroid/widget/FrameLayout;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    sub-int/2addr v10, v11

    .line 82
    neg-int v10, v10

    .line 83
    iput v10, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->T:I

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    iput v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->T:I

    .line 87
    .line 88
    :goto_1
    iget-object v10, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->g:Lcom/android/launcher3/C2;

    .line 89
    .line 90
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getThemeRes()I

    .line 91
    .line 92
    .line 93
    move-result v10

    .line 94
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v11

    .line 98
    const v12, 0x7f040781

    .line 99
    .line 100
    .line 101
    invoke-static {v11, v12, v10}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 102
    .line 103
    .line 104
    move-result v10

    .line 105
    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 110
    .line 111
    .line 112
    move-result-object v11

    .line 113
    check-cast v11, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 114
    .line 115
    iget-object v12, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 116
    .line 117
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 118
    .line 119
    .line 120
    move-result-object v12

    .line 121
    instance-of v12, v12, Lcom/android/launcher3/Workspace;

    .line 122
    .line 123
    if-eqz v12, :cond_3

    .line 124
    .line 125
    iget-object v12, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 126
    .line 127
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 128
    .line 129
    .line 130
    move-result-object v12

    .line 131
    check-cast v12, Lcom/android/launcher3/Workspace;

    .line 132
    .line 133
    iget-object v13, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 134
    .line 135
    invoke-virtual {v12, v13}, Lcom/android/launcher3/Workspace;->l1(Lcom/android/launcher3/CellLayout;)Lcom/android/launcher3/CellLayout;

    .line 136
    .line 137
    .line 138
    move-result-object v12

    .line 139
    goto :goto_2

    .line 140
    :cond_3
    const/4 v12, 0x0

    .line 141
    :goto_2
    const/high16 v13, 0x3f800000    # 1.0f

    .line 142
    .line 143
    if-nez p1, :cond_6

    .line 144
    .line 145
    iput v4, v11, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 146
    .line 147
    iput v5, v11, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 148
    .line 149
    iput v9, v11, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 150
    .line 151
    iput v2, v11, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 152
    .line 153
    :goto_3
    if-ge v1, v3, :cond_4

    .line 154
    .line 155
    iget-object v2, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 156
    .line 157
    aget-object v2, v2, v1

    .line 158
    .line 159
    invoke-virtual {v2, v13}, Landroid/view/View;->setAlpha(F)V

    .line 160
    .line 161
    .line 162
    add-int/2addr v1, v6

    .line 163
    goto :goto_3

    .line 164
    :cond_4
    if-eqz v12, :cond_5

    .line 165
    .line 166
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 167
    .line 168
    const/4 v2, 0x0

    .line 169
    invoke-direct {v0, v1, v12, v13, v2}, Lcom/android/launcher3/AppWidgetResizeFrame;->q0(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;FF)V

    .line 170
    .line 171
    .line 172
    :cond_5
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 173
    .line 174
    .line 175
    goto/16 :goto_5

    .line 176
    .line 177
    :cond_6
    sget-object v14, Lcom/android/launcher3/G2;->e:Landroid/util/IntProperty;

    .line 178
    .line 179
    iget v15, v11, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 180
    .line 181
    filled-new-array {v15, v4}, [I

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    invoke-static {v14, v4}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    sget-object v14, Lcom/android/launcher3/G2;->f:Landroid/util/IntProperty;

    .line 190
    .line 191
    iget v15, v11, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 192
    .line 193
    filled-new-array {v15, v5}, [I

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-static {v14, v5}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    sget-object v14, Lcom/android/launcher3/views/BaseDragLayer;->LAYOUT_X:Landroid/util/Property;

    .line 202
    .line 203
    iget v15, v11, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 204
    .line 205
    filled-new-array {v15, v9}, [I

    .line 206
    .line 207
    .line 208
    move-result-object v9

    .line 209
    invoke-static {v14, v9}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 210
    .line 211
    .line 212
    move-result-object v9

    .line 213
    sget-object v14, Lcom/android/launcher3/views/BaseDragLayer;->LAYOUT_Y:Landroid/util/Property;

    .line 214
    .line 215
    iget v15, v11, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 216
    .line 217
    filled-new-array {v15, v2}, [I

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    invoke-static {v14, v2}, Landroid/animation/PropertyValuesHolder;->ofInt(Landroid/util/Property;[I)Landroid/animation/PropertyValuesHolder;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    filled-new-array {v4, v5, v9, v2}, [Landroid/animation/PropertyValuesHolder;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-static {v11, v2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    iget-object v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->i:Lcom/android/launcher3/w0;

    .line 234
    .line 235
    invoke-virtual {v4, v2}, Lcom/android/launcher3/w0;->c(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    check-cast v4, Landroid/animation/ObjectAnimator;

    .line 240
    .line 241
    new-instance v5, Lcom/android/launcher3/k;

    .line 242
    .line 243
    invoke-direct {v5, v0}, Lcom/android/launcher3/k;-><init>(Lcom/android/launcher3/AppWidgetResizeFrame;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v4, v5}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 247
    .line 248
    .line 249
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 250
    .line 251
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v5, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 255
    .line 256
    .line 257
    move v2, v1

    .line 258
    :goto_4
    if-ge v2, v3, :cond_8

    .line 259
    .line 260
    iget-object v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 261
    .line 262
    aget-object v4, v4, v2

    .line 263
    .line 264
    invoke-virtual {v4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    if-eqz v4, :cond_7

    .line 269
    .line 270
    invoke-virtual {v10}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 271
    .line 272
    .line 273
    move-result v9

    .line 274
    invoke-virtual {v4, v9}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 275
    .line 276
    .line 277
    :cond_7
    iget-object v4, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->i:Lcom/android/launcher3/w0;

    .line 278
    .line 279
    iget-object v9, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->j:[Landroid/view/View;

    .line 280
    .line 281
    aget-object v9, v9, v2

    .line 282
    .line 283
    sget-object v11, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 284
    .line 285
    new-array v14, v6, [F

    .line 286
    .line 287
    aput v13, v14, v1

    .line 288
    .line 289
    invoke-static {v9, v11, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 290
    .line 291
    .line 292
    move-result-object v9

    .line 293
    invoke-virtual {v4, v9}, Lcom/android/launcher3/w0;->c(Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;

    .line 294
    .line 295
    .line 296
    move-result-object v4

    .line 297
    invoke-virtual {v5, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 298
    .line 299
    .line 300
    add-int/2addr v2, v6

    .line 301
    goto :goto_4

    .line 302
    :cond_8
    if-eqz v12, :cond_9

    .line 303
    .line 304
    iget-object v1, v0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 305
    .line 306
    const/high16 v3, 0x3f800000    # 1.0f

    .line 307
    .line 308
    const/4 v4, 0x0

    .line 309
    move-object v2, v12

    .line 310
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/AppWidgetResizeFrame;->r0(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;FFLandroid/animation/AnimatorSet;)V

    .line 311
    .line 312
    .line 313
    :cond_9
    invoke-virtual {v5, v7, v8}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->start()V

    .line 317
    .line 318
    .line 319
    :goto_5
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setFocusableInTouchMode(Z)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 323
    .line 324
    .line 325
    return-void
.end method

.method public s0(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->c(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->O:I

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->c(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->P:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->v:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->c(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->O:I

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->w:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 32
    .line 33
    iget-boolean v2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->C:Z

    .line 34
    .line 35
    iget-boolean v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->D:Z

    .line 36
    .line 37
    iget-object v4, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3, p1, v4}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a(ZZILcom/android/launcher3/AppWidgetResizeFrame$b;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 43
    .line 44
    iget v1, p1, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 45
    .line 46
    iput v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->x:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->c(I)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->P:I

    .line 61
    .line 62
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->y:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 63
    .line 64
    iget-boolean v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->E:Z

    .line 65
    .line 66
    iget-boolean v2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->F:Z

    .line 67
    .line 68
    iget-object v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 69
    .line 70
    invoke-virtual {p2, v1, v2, p1, v3}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a(ZZILcom/android/launcher3/AppWidgetResizeFrame$b;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->t:Lcom/android/launcher3/AppWidgetResizeFrame$b;

    .line 74
    .line 75
    iget p2, p1, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 76
    .line 77
    iput p2, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    invoke-direct {p0, p1}, Lcom/android/launcher3/AppWidgetResizeFrame;->j0(Z)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    instance-of p1, p1, Lcom/android/launcher3/Workspace;

    .line 96
    .line 97
    if-eqz p1, :cond_2

    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Lcom/android/launcher3/Workspace;

    .line 106
    .line 107
    iget-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Lcom/android/launcher3/Workspace;->l1(Lcom/android/launcher3/CellLayout;)Lcom/android/launcher3/CellLayout;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    if-eqz p2, :cond_2

    .line 114
    .line 115
    sget-object v0, Lcom/android/launcher3/AppWidgetResizeFrame;->g0:Landroid/graphics/Rect;

    .line 116
    .line 117
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->A:Lcom/android/launcher3/keyboard/b;

    .line 118
    .line 119
    iget-object v2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 120
    .line 121
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/keyboard/b;->q(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 122
    .line 123
    .line 124
    sget-object v1, Lcom/android/launcher3/AppWidgetResizeFrame;->h0:Landroid/graphics/Rect;

    .line 125
    .line 126
    const v2, 0x7f0b0695

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v2, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iget-object v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 141
    .line 142
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    const/high16 v4, 0x3f800000    # 1.0f

    .line 147
    .line 148
    if-ge v2, v3, :cond_0

    .line 149
    .line 150
    iget v2, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->O:I

    .line 151
    .line 152
    if-gez v2, :cond_0

    .line 153
    .line 154
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 155
    .line 156
    iget v5, v0, Landroid/graphics/Rect;->left:I

    .line 157
    .line 158
    if-ge v3, v5, :cond_0

    .line 159
    .line 160
    iget p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->B:F

    .line 161
    .line 162
    int-to-float v0, v2

    .line 163
    add-float/2addr v0, p1

    .line 164
    div-float/2addr v0, p1

    .line 165
    goto :goto_0

    .line 166
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    iget-object v3, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 171
    .line 172
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-le v2, p1, :cond_1

    .line 177
    .line 178
    iget p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->O:I

    .line 179
    .line 180
    if-lez p1, :cond_1

    .line 181
    .line 182
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 183
    .line 184
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 185
    .line 186
    if-le v1, v0, :cond_1

    .line 187
    .line 188
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->B:F

    .line 189
    .line 190
    int-to-float p1, p1

    .line 191
    sub-float p1, v0, p1

    .line 192
    .line 193
    div-float v0, p1, v0

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_1
    move v0, v4

    .line 197
    :goto_0
    const/high16 p1, 0x3f000000    # 0.5f

    .line 198
    .line 199
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    sub-float v0, v4, v0

    .line 204
    .line 205
    invoke-static {v4, v0}, Ljava/lang/Math;->min(FF)F

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    iget-object v1, p0, Lcom/android/launcher3/AppWidgetResizeFrame;->m:Lcom/android/launcher3/CellLayout;

    .line 210
    .line 211
    invoke-direct {p0, v1, p2, p1, v0}, Lcom/android/launcher3/AppWidgetResizeFrame;->q0(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;FF)V

    .line 212
    .line 213
    .line 214
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 215
    .line 216
    .line 217
    return-void
.end method
