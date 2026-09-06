.class public Lcom/android/launcher3/Hotseat;
.super Lcom/android/launcher3/CellLayout;
.source "Hotseat.java"

# interfaces
.implements Lcom/android/launcher3/g1;


# instance fields
.field private final A0:Lcom/android/launcher3/util/B1;

.field private final B0:Lcom/android/launcher3/util/B1;

.field private C0:Lcom/android/launcher3/util/v1$c;

.field private final D0:Lcom/android/launcher3/util/v1;

.field private final E0:Landroid/view/View;

.field private F0:Landroid/graphics/Rect;

.field private final G0:I

.field private final H0:I

.field private I0:Landroid/graphics/drawable/Drawable;

.field private J0:Landroid/widget/ImageView;

.field public K0:Z

.field private final L0:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private M0:I

.field private N0:Landroid/graphics/RectF;

.field private O0:Landroid/graphics/Paint;

.field private P0:I

.field private Q0:I

.field private R0:I

.field private S0:Landroid/graphics/Paint;

.field private T0:Landroid/graphics/RectF;

.field private U0:I

.field private V0:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

.field private W0:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

.field private X0:I

.field private Y0:F

.field private Z0:F

.field private a1:I

.field private b1:F

.field private c1:Z

.field private d1:Landroid/animation/AnimatorSet;

.field private x0:Z
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private y0:Lcom/android/launcher3/Workspace;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/Workspace<",
            "*>;"
        }
    .end annotation
.end field

.field private z0:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/Hotseat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/Hotseat;->F0:Landroid/graphics/Rect;

    const/4 p2, 0x0

    .line 4
    iput-boolean p2, p0, Lcom/android/launcher3/Hotseat;->K0:Z

    .line 5
    new-instance p3, Lcom/android/launcher3/Hotseat$a;

    invoke-direct {p3, p0}, Lcom/android/launcher3/Hotseat$a;-><init>(Lcom/android/launcher3/Hotseat;)V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->L0:Ljava/util/Comparator;

    .line 6
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->N0:Landroid/graphics/RectF;

    .line 7
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->O0:Landroid/graphics/Paint;

    .line 8
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->S0:Landroid/graphics/Paint;

    .line 9
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->T0:Landroid/graphics/RectF;

    .line 10
    iput p2, p0, Lcom/android/launcher3/Hotseat;->a1:I

    .line 11
    iput-boolean p2, p0, Lcom/android/launcher3/Hotseat;->c1:Z

    const/4 p3, 0x0

    .line 12
    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->d1:Landroid/animation/AnimatorSet;

    .line 13
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    const v0, 0x7f0e01dc

    invoke-virtual {p3, v0, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 14
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 15
    new-instance p3, Lcom/android/launcher3/util/B1;

    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    move-result-object v0

    const/4 v1, 0x3

    invoke-direct {p3, v0, v1}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->A0:Lcom/android/launcher3/util/B1;

    .line 16
    instance-of p3, p2, Lcom/android/launcher3/G5;

    if-eqz p3, :cond_0

    move-object p3, p2

    check-cast p3, Lcom/android/launcher3/G5;

    .line 17
    invoke-interface {p3}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    move-result-object p3

    const/4 v0, 0x6

    .line 18
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    move-result-object p3

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->C0:Lcom/android/launcher3/util/v1$c;

    .line 19
    :cond_0
    new-instance p3, Lcom/android/launcher3/util/v1;

    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    move-result-object v0

    sget-object v2, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    new-instance v3, Lcom/android/launcher3/B0;

    invoke-direct {v3}, Lcom/android/launcher3/B0;-><init>()V

    const/4 v4, 0x1

    invoke-direct {p3, v0, v2, v4, v3}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->D0:Lcom/android/launcher3/util/v1;

    .line 20
    new-instance p3, Lcom/android/launcher3/util/B1;

    invoke-direct {p3, p2, v1}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    iput-object p3, p0, Lcom/android/launcher3/Hotseat;->B0:Lcom/android/launcher3/util/B1;

    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0702b6

    .line 22
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/Hotseat;->G0:I

    const p2, 0x7f0702b5

    .line 23
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/Hotseat;->H0:I

    .line 24
    invoke-static {}, Lx1/O;->C3()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/Hotseat;->a1()V

    .line 26
    :cond_1
    new-instance p1, Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    invoke-direct {p1, p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/android/launcher3/Hotseat;->V0:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    return-void
.end method

.method public static synthetic H0(Lcom/android/launcher3/Hotseat;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Hotseat;->h1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic I0(Lcom/android/launcher3/util/u0;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {p0, p1}, Lcom/android/launcher3/util/u0;->b(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic J0(Lcom/android/launcher3/util/u0;F)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/launcher3/util/u0;->b(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K0(Lcom/android/launcher3/Hotseat;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Hotseat;->e1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L0(Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/h0;I)F
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/Hotseat;->i1(Lcom/android/launcher3/h0;I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic M0(Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/h0;I)F
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/Hotseat;->g1(Lcom/android/launcher3/h0;I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic N0(Lcom/android/launcher3/Hotseat;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/Hotseat;->f1(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic O0(Lcom/android/launcher3/Hotseat;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic P0(Lcom/android/launcher3/Hotseat;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Hotseat;->d1:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method private Q0()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lx1/O;->e1()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 26
    .line 27
    iget v0, v0, Lcom/android/launcher3/F1;->d1:I

    .line 28
    .line 29
    div-int/lit8 v0, v0, 0x2

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const v2, 0x7f070495

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const v3, 0x7f08109d

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iput-object v2, p0, Lcom/android/launcher3/Hotseat;->I0:Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    new-instance v2, Lcom/android/launcher3/W;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-direct {v2, v3}, Lcom/android/launcher3/W;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 65
    .line 66
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 67
    .line 68
    invoke-direct {v2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/android/launcher3/Hotseat;->I0:Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 84
    .line 85
    new-instance v2, Lcom/android/launcher3/G0;

    .line 86
    .line 87
    invoke-direct {v2, p0}, Lcom/android/launcher3/G0;-><init>(Lcom/android/launcher3/Hotseat;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 94
    .line 95
    new-instance v2, Lcom/android/launcher3/H0;

    .line 96
    .line 97
    invoke-direct {v2, p0}, Lcom/android/launcher3/H0;-><init>(Lcom/android/launcher3/Hotseat;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 104
    .line 105
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 106
    .line 107
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->U1()Lcom/android/launcher3/keyboard/b;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Hotseat;->U0(I)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Hotseat;->V0(I)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    new-instance v6, Lc1/b;

    .line 127
    .line 128
    const/4 v2, 0x1

    .line 129
    invoke-direct {v6, v1, v0, v2, v2}, Lc1/b;-><init>(IIII)V

    .line 130
    .line 131
    .line 132
    const/4 v0, 0x0

    .line 133
    iput-boolean v0, v6, Lc1/b;->i:Z

    .line 134
    .line 135
    iget-object v3, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 136
    .line 137
    invoke-virtual {v3}, Landroid/widget/ImageView;->getId()I

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    const/4 v7, 0x1

    .line 142
    const/4 v4, -0x1

    .line 143
    move-object v2, p0

    .line 144
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 145
    .line 146
    .line 147
    :cond_1
    :goto_0
    return-void
.end method

.method private S0()V
    .locals 14

    .line 1
    sget-object v0, Lf1/a;->x:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_6

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 34
    .line 35
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/android/launcher3/F1;->r0()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const v4, 0x7f0e005d

    .line 50
    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    invoke-virtual {v3, v4, p0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    move-object v7, v3

    .line 58
    check-cast v7, Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const v4, 0x7f08079b

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-static {}, Lm1/a;->a()Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    const/4 v6, 0x0

    .line 76
    if-eqz v4, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->d0()Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    if-nez v3, :cond_1

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    const v4, 0x7f080d9e

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3, v4, v6}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    :cond_1
    iget v4, v1, Lcom/android/launcher3/h0;->B1:I

    .line 104
    .line 105
    invoke-virtual {v3, v5, v5, v4, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    const v8, 0x7f0700ba

    .line 113
    .line 114
    .line 115
    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    iget v9, v8, Landroid/graphics/Rect;->left:I

    .line 124
    .line 125
    iget v10, v8, Landroid/graphics/Rect;->top:I

    .line 126
    .line 127
    div-int/lit8 v11, v4, 0x2

    .line 128
    .line 129
    add-int/2addr v10, v11

    .line 130
    iget v12, v8, Landroid/graphics/Rect;->right:I

    .line 131
    .line 132
    sub-int/2addr v12, v4

    .line 133
    iget v4, v8, Landroid/graphics/Rect;->bottom:I

    .line 134
    .line 135
    sub-int/2addr v4, v11

    .line 136
    invoke-virtual {v3, v9, v10, v12, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    const v9, 0x7f070a1d

    .line 144
    .line 145
    .line 146
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    invoke-static {}, Lm1/a;->a()Z

    .line 151
    .line 152
    .line 153
    move-result v9

    .line 154
    if-eqz v9, :cond_2

    .line 155
    .line 156
    iget v9, v8, Landroid/graphics/Rect;->left:I

    .line 157
    .line 158
    iget v10, v8, Landroid/graphics/Rect;->top:I

    .line 159
    .line 160
    div-int/lit8 v11, v4, 0x2

    .line 161
    .line 162
    add-int/2addr v10, v11

    .line 163
    iget v12, v8, Landroid/graphics/Rect;->right:I

    .line 164
    .line 165
    sub-int/2addr v12, v4

    .line 166
    iget v13, v8, Landroid/graphics/Rect;->bottom:I

    .line 167
    .line 168
    sub-int/2addr v13, v11

    .line 169
    invoke-virtual {v3, v9, v10, v12, v13}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 170
    .line 171
    .line 172
    :cond_2
    invoke-static {}, Lm1/a;->c()Z

    .line 173
    .line 174
    .line 175
    move-result v9

    .line 176
    if-eqz v9, :cond_3

    .line 177
    .line 178
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 179
    .line 180
    .line 181
    move-result-object v9

    .line 182
    const v10, 0x7f070a1c

    .line 183
    .line 184
    .line 185
    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 186
    .line 187
    .line 188
    move-result v9

    .line 189
    iget v10, v8, Landroid/graphics/Rect;->left:I

    .line 190
    .line 191
    iget v11, v8, Landroid/graphics/Rect;->top:I

    .line 192
    .line 193
    div-int/lit8 v12, v4, 0x2

    .line 194
    .line 195
    add-int/2addr v11, v12

    .line 196
    iget v1, v1, Lcom/android/launcher3/h0;->B1:I

    .line 197
    .line 198
    div-int/lit8 v13, v1, 0x2

    .line 199
    .line 200
    sub-int/2addr v11, v13

    .line 201
    add-int/2addr v11, v9

    .line 202
    iget v13, v8, Landroid/graphics/Rect;->right:I

    .line 203
    .line 204
    sub-int/2addr v13, v4

    .line 205
    iget v4, v8, Landroid/graphics/Rect;->bottom:I

    .line 206
    .line 207
    sub-int/2addr v4, v12

    .line 208
    div-int/lit8 v1, v1, 0x2

    .line 209
    .line 210
    sub-int/2addr v4, v1

    .line 211
    add-int/2addr v4, v9

    .line 212
    invoke-virtual {v3, v10, v11, v13, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 213
    .line 214
    .line 215
    :cond_3
    invoke-virtual {v7, v6, v3, v6, v6}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 216
    .line 217
    .line 218
    const v1, 0x7f14006a

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 229
    .line 230
    if-eqz v0, :cond_4

    .line 231
    .line 232
    new-instance v0, Lcom/android/launcher3/I0;

    .line 233
    .line 234
    invoke-direct {v0, p0}, Lcom/android/launcher3/I0;-><init>(Lcom/android/launcher3/Hotseat;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 241
    .line 242
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->U1()Lcom/android/launcher3/keyboard/b;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 251
    .line 252
    .line 253
    :cond_4
    invoke-static {}, Lm1/a;->a()Z

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    const/4 v1, 0x1

    .line 258
    if-eqz v0, :cond_5

    .line 259
    .line 260
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 261
    .line 262
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    invoke-static {v0}, Lp1/f;->g(Landroid/content/Context;)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    sub-int/2addr v0, v1

    .line 271
    goto :goto_0

    .line 272
    :cond_5
    invoke-virtual {p0, v2}, Lcom/android/launcher3/Hotseat;->U0(I)I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    :goto_0
    invoke-virtual {p0, v2}, Lcom/android/launcher3/Hotseat;->V0(I)I

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    new-instance v10, Lc1/b;

    .line 281
    .line 282
    invoke-direct {v10, v0, v2, v1, v1}, Lc1/b;-><init>(IIII)V

    .line 283
    .line 284
    .line 285
    iput-boolean v5, v10, Lc1/b;->i:Z

    .line 286
    .line 287
    invoke-virtual {v7}, Landroid/widget/TextView;->getId()I

    .line 288
    .line 289
    .line 290
    move-result v9

    .line 291
    const/4 v11, 0x1

    .line 292
    const/4 v8, -0x1

    .line 293
    move-object v6, p0

    .line 294
    invoke-virtual/range {v6 .. v11}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 295
    .line 296
    .line 297
    :cond_6
    :goto_1
    return-void
.end method

.method private a1()V
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->O0:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->O0:Landroid/graphics/Paint;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->S0:Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->S0:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const v1, 0x7f0607db

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Lcom/android/launcher3/Hotseat;->U0:I

    .line 47
    .line 48
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->S0:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const v1, 0x7f0c00f2

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    int-to-float v0, v0

    .line 65
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput v0, p0, Lcom/android/launcher3/Hotseat;->M0:I

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const v1, 0x7f0c00f4

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    int-to-float v0, v0

    .line 83
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iput v0, p0, Lcom/android/launcher3/Hotseat;->P0:I

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const v1, 0x7f0c00f5

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    int-to-float v0, v0

    .line 101
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput v0, p0, Lcom/android/launcher3/Hotseat;->Q0:I

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const v1, 0x7f0c00f3

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    int-to-float v0, v0

    .line 119
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p0, Lcom/android/launcher3/Hotseat;->R0:I

    .line 124
    .line 125
    return-void
.end method

.method private synthetic e1(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "click AIButton"

    .line 2
    .line 3
    const-string v0, "Hotseat"

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v1, "com.zte.halo.app"

    .line 13
    .line 14
    invoke-static {p1, v1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v1, "com.zte.aiassistant"

    .line 25
    .line 26
    invoke-static {p1, v1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const p1, 0x7f140047

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    :goto_0
    :try_start_0
    new-instance p1, Landroid/os/Bundle;

    .line 50
    .line 51
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v1, "mfv_type"

    .line 55
    .line 56
    const-string v2, "desktop"

    .line 57
    .line 58
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->startAssistant(Landroid/os/Bundle;)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Lh1/a;->g()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :catch_0
    move-exception p0

    .line 81
    new-instance p1, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v1, "Exception:"

    .line 87
    .line 88
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private synthetic f1(Landroid/view/View;)Z
    .locals 5

    .line 1
    const-string p1, "long click AIButton"

    .line 2
    .line 3
    const-string v0, "Hotseat"

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "com.zte.halo.app"

    .line 14
    .line 15
    invoke-static {v1, v2}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Landroid/content/Intent;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 24
    .line 25
    .line 26
    const/high16 v2, 0x10000000

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string v2, "com.zte.halo.app.AI_HALF_ENTRY_OUTER"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const-string v2, "from"

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    const-string v2, "keyboard_input"

    .line 50
    .line 51
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const v3, 0x7f010014

    .line 63
    .line 64
    .line 65
    const v4, 0x7f010013

    .line 66
    .line 67
    .line 68
    invoke-static {v2, v3, v4}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Lh1/a;->B()V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :catch_0
    move-exception p0

    .line 88
    goto :goto_0

    .line 89
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "com.zte.aiassistant"

    .line 94
    .line 95
    invoke-static {v1, v2}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_1

    .line 100
    .line 101
    new-instance v1, Landroid/os/Bundle;

    .line 102
    .line 103
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 104
    .line 105
    .line 106
    const-string v2, "mfv_type"

    .line 107
    .line 108
    const-string v3, "desktop"

    .line 109
    .line 110
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    sget-object v2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 124
    .line 125
    invoke-virtual {p0, v1}, Lcom/android/quickstep/SystemUiProxy;->startAssistant(Landroid/os/Bundle;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lh1/a;->g()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    const-string v2, "Exception:"

    .line 138
    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    :cond_1
    :goto_1
    return p1
.end method

.method private synthetic g1(Lcom/android/launcher3/h0;I)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/h0;->q0(Landroid/content/Context;I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private getTableRecentHotseatBgColor()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v1, -0x1

    .line 16
    if-ne p0, v1, :cond_0

    .line 17
    .line 18
    const p0, 0x7f0607d9

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const p0, 0x7f0607da

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-static {v0, p0}, Lz/a;->c(Landroid/content/Context;I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method private synthetic h1(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private synthetic i1(Lcom/android/launcher3/h0;I)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0, p2}, Lcom/android/launcher3/h0;->q0(Landroid/content/Context;I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method


# virtual methods
.method protected F(IIIIIIZ[I[I)[I
    .locals 0

    .line 1
    invoke-super/range {p0 .. p9}, Lcom/android/launcher3/CellLayout;->F(IIIIIIZ[I[I)[I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget-object p2, p2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 12
    .line 13
    iget-boolean p2, p2, Lcom/android/launcher3/r4;->q0:Z

    .line 14
    .line 15
    if-eqz p2, :cond_4

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lcom/android/launcher3/H5;->y0()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    sget-object p2, Lx1/O;->h:Landroid/content/ComponentName;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget-object p2, Lx1/O;->g:Landroid/content/ComponentName;

    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    const/4 p4, 0x1

    .line 49
    sub-int/2addr p3, p4

    .line 50
    :goto_1
    if-ltz p3, :cond_4

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 53
    .line 54
    .line 55
    move-result-object p5

    .line 56
    invoke-virtual {p5, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p5

    .line 60
    invoke-virtual {p5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p6

    .line 64
    instance-of p6, p6, Lcom/android/launcher3/model/data/y;

    .line 65
    .line 66
    if-eqz p6, :cond_3

    .line 67
    .line 68
    invoke-virtual {p5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p6

    .line 72
    check-cast p6, Lcom/android/launcher3/model/data/y;

    .line 73
    .line 74
    invoke-virtual {p6}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 75
    .line 76
    .line 77
    move-result-object p6

    .line 78
    invoke-virtual {p2, p6}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p6

    .line 82
    if-eqz p6, :cond_3

    .line 83
    .line 84
    iget-object p6, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 85
    .line 86
    invoke-interface {p6}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 87
    .line 88
    .line 89
    move-result-object p6

    .line 90
    invoke-virtual {p6}, Lcom/android/launcher3/h0;->T0()Z

    .line 91
    .line 92
    .line 93
    move-result p6

    .line 94
    if-eqz p6, :cond_1

    .line 95
    .line 96
    invoke-virtual {p5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p6

    .line 100
    check-cast p6, Lcom/android/launcher3/model/data/y;

    .line 101
    .line 102
    iget p6, p6, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 105
    .line 106
    .line 107
    move-result-object p7

    .line 108
    invoke-virtual {p7}, Landroid/view/ViewGroup;->getChildCount()I

    .line 109
    .line 110
    .line 111
    move-result p7

    .line 112
    sub-int/2addr p7, p4

    .line 113
    if-ne p6, p7, :cond_1

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_1
    iget-object p6, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 117
    .line 118
    invoke-interface {p6}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 119
    .line 120
    .line 121
    move-result-object p6

    .line 122
    invoke-virtual {p6}, Lcom/android/launcher3/h0;->T0()Z

    .line 123
    .line 124
    .line 125
    move-result p6

    .line 126
    if-nez p6, :cond_3

    .line 127
    .line 128
    invoke-virtual {p5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p5

    .line 132
    check-cast p5, Lcom/android/launcher3/model/data/y;

    .line 133
    .line 134
    iget p5, p5, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 137
    .line 138
    .line 139
    move-result-object p6

    .line 140
    invoke-virtual {p6}, Landroid/view/ViewGroup;->getChildCount()I

    .line 141
    .line 142
    .line 143
    move-result p6

    .line 144
    sub-int/2addr p6, p4

    .line 145
    if-ne p5, p6, :cond_3

    .line 146
    .line 147
    :goto_2
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 148
    .line 149
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 154
    .line 155
    .line 156
    move-result-object p3

    .line 157
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    if-eqz p3, :cond_4

    .line 162
    .line 163
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 164
    .line 165
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 170
    .line 171
    .line 172
    move-result-object p3

    .line 173
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 174
    .line 175
    .line 176
    move-result-object p3

    .line 177
    iget-object p3, p3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 178
    .line 179
    if-eqz p3, :cond_4

    .line 180
    .line 181
    iget-object p3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 182
    .line 183
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 184
    .line 185
    .line 186
    move-result-object p3

    .line 187
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 188
    .line 189
    .line 190
    move-result-object p3

    .line 191
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/j;->z()Lcom/android/launcher3/n0$a;

    .line 192
    .line 193
    .line 194
    move-result-object p3

    .line 195
    iget-object p3, p3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 196
    .line 197
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 198
    .line 199
    .line 200
    move-result-object p3

    .line 201
    invoke-virtual {p2, p3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    if-nez p2, :cond_4

    .line 206
    .line 207
    iget-object p2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 208
    .line 209
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 214
    .line 215
    .line 216
    move-result p2

    .line 217
    if-eqz p2, :cond_2

    .line 218
    .line 219
    aget p2, p1, p4

    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    sub-int/2addr p0, p4

    .line 226
    if-ne p2, p0, :cond_4

    .line 227
    .line 228
    aget p0, p1, p4

    .line 229
    .line 230
    sub-int/2addr p0, p4

    .line 231
    aput p0, p1, p4

    .line 232
    .line 233
    return-object p1

    .line 234
    :cond_2
    const/4 p2, 0x0

    .line 235
    aget p3, p1, p2

    .line 236
    .line 237
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    sub-int/2addr p0, p4

    .line 242
    if-ne p3, p0, :cond_4

    .line 243
    .line 244
    aget p0, p1, p2

    .line 245
    .line 246
    sub-int/2addr p0, p4

    .line 247
    aput p0, p1, p2

    .line 248
    .line 249
    return-object p1

    .line 250
    :cond_3
    add-int/lit8 p3, p3, -0x1

    .line 251
    .line 252
    goto/16 :goto_1

    .line 253
    .line 254
    :cond_4
    return-object p1
.end method

.method protected R(II)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/K5;->getTranslationProvider()Lcom/android/launcher3/K5$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/launcher3/K5$a;->a(I)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    float-to-int p0, p0

    .line 18
    return p0
.end method

.method public R0(Z)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Lcom/android/launcher3/h0;->Z0(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    move p1, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move p1, v1

    .line 24
    :goto_0
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->b1()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    move v3, v2

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v3, v1

    .line 35
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    new-instance v5, Lcom/android/launcher3/C0;

    .line 42
    .line 43
    invoke-direct {v5, p0, v0}, Lcom/android/launcher3/C0;-><init>(Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/h0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4, v5}, Lcom/android/launcher3/K5;->setTranslationProvider(Lcom/android/launcher3/K5$a;)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_2
    const/4 v5, 0x0

    .line 51
    invoke-virtual {v4, v5}, Lcom/android/launcher3/K5;->setTranslationProvider(Lcom/android/launcher3/K5$a;)V

    .line 52
    .line 53
    .line 54
    :goto_2
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 55
    .line 56
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 57
    .line 58
    .line 59
    move v6, v1

    .line 60
    :goto_3
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    const/4 v8, 0x0

    .line 65
    if-ge v6, v7, :cond_6

    .line 66
    .line 67
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    instance-of v10, v9, Lc1/b;

    .line 76
    .line 77
    if-eqz v10, :cond_5

    .line 78
    .line 79
    check-cast v9, Lc1/b;

    .line 80
    .line 81
    if-eqz v3, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    invoke-virtual {v9}, Lc1/b;->a()I

    .line 88
    .line 89
    .line 90
    move-result v9

    .line 91
    invoke-virtual {v0, v8, v9}, Lcom/android/launcher3/h0;->q0(Landroid/content/Context;I)F

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    :cond_3
    instance-of v9, v7, Lcom/android/launcher3/G5;

    .line 96
    .line 97
    if-eqz v9, :cond_4

    .line 98
    .line 99
    check-cast v7, Lcom/android/launcher3/G5;

    .line 100
    .line 101
    invoke-interface {v7}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    const/4 v9, 0x3

    .line 106
    invoke-virtual {v7, v9}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    invoke-virtual {v7, v8}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    invoke-virtual {v5, v7}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 115
    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_4
    sget-object v9, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 119
    .line 120
    new-array v10, v2, [F

    .line 121
    .line 122
    aput v8, v10, v1

    .line 123
    .line 124
    invoke-static {v7, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 125
    .line 126
    .line 127
    move-result-object v7

    .line 128
    invoke-virtual {v5, v7}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 129
    .line 130
    .line 131
    :cond_5
    :goto_4
    add-int/2addr v6, v2

    .line 132
    goto :goto_3

    .line 133
    :cond_6
    if-nez v3, :cond_8

    .line 134
    .line 135
    if-eqz p1, :cond_7

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->c1()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_7

    .line 142
    .line 143
    goto :goto_5

    .line 144
    :cond_7
    move p1, v1

    .line 145
    goto :goto_6

    .line 146
    :cond_8
    :goto_5
    move p1, v2

    .line 147
    :goto_6
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 148
    .line 149
    instance-of v3, p0, Lcom/android/launcher3/util/u0;

    .line 150
    .line 151
    if-eqz v3, :cond_a

    .line 152
    .line 153
    check-cast p0, Lcom/android/launcher3/util/u0;

    .line 154
    .line 155
    invoke-interface {p0}, Lcom/android/launcher3/util/u0;->a()F

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    if-eqz p1, :cond_9

    .line 160
    .line 161
    iget p1, v0, Lcom/android/launcher3/h0;->B1:I

    .line 162
    .line 163
    int-to-float p1, p1

    .line 164
    iget v0, v0, Lcom/android/launcher3/h0;->o2:I

    .line 165
    .line 166
    int-to-float v0, v0

    .line 167
    div-float v8, p1, v0

    .line 168
    .line 169
    :cond_9
    const/4 p1, 0x2

    .line 170
    new-array p1, p1, [F

    .line 171
    .line 172
    aput v3, p1, v1

    .line 173
    .line 174
    aput v8, p1, v2

    .line 175
    .line 176
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    new-instance v0, Lcom/android/launcher3/D0;

    .line 181
    .line 182
    invoke-direct {v0, p0}, Lcom/android/launcher3/D0;-><init>(Lcom/android/launcher3/util/u0;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v5, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 189
    .line 190
    .line 191
    :cond_a
    const-wide/16 p0, 0xfa

    .line 192
    .line 193
    invoke-virtual {v5, p0, p1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public T0(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "Hotseat:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->A0:Lcom/android/launcher3/util/B1;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, "\t"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v3, "ALPHA_CHANNEL_TASKBAR_ALIGNMENT"

    .line 41
    .line 42
    const-string v4, "ALPHA_CHANNEL_PREVIEW_RENDERER"

    .line 43
    .line 44
    const-string v5, "ALPHA_CHANNEL_TASKBAR_STASH"

    .line 45
    .line 46
    filled-new-array {v3, v4, v5}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    const-string v7, "mIconsAlphaChannels"

    .line 51
    .line 52
    invoke-virtual {v0, v1, p2, v7, v6}, Lcom/android/launcher3/util/v1;->dump(Ljava/lang/String;Ljava/io/PrintWriter;Ljava/lang/String;[Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->B0:Lcom/android/launcher3/util/B1;

    .line 56
    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string v0, "mQsbAlphaChannels"

    .line 73
    .line 74
    filled-new-array {v3, v4, v5}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/launcher3/util/v1;->dump(Ljava/lang/String;Ljava/io/PrintWriter;Ljava/lang/String;[Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public U0(I)I
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Hotseat;->x0:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    return p1
.end method

.method public V0(I)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Hotseat;->x0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    sub-int/2addr p0, p1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public W0(I)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->A0:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public X0(I)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->D0:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Y0(I)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->B0:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Z0()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v2, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    move v4, v3

    .line 17
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    if-ge v4, v5, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->L0:Ljava/util/Comparator;

    .line 34
    .line 35
    invoke-static {v2, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 36
    .line 37
    .line 38
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-ge v3, p0, :cond_3

    .line 43
    .line 44
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 55
    .line 56
    instance-of p0, p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 57
    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    instance-of p0, v1, Lcom/android/launcher3/model/data/p;

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    iget-object p0, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_1
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-eqz p0, :cond_2

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    return-void
.end method

.method b1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/Hotseat;->x0:Z

    .line 2
    .line 3
    return p0
.end method

.method public c1()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/Hotseat;->a1:I

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

.method public d1()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/Hotseat;->X0:I

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

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    and-int/lit16 v0, v0, 0xff

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    if-ne v0, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLeft()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v2, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/widget/ImageView;->getLeft()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    add-int/2addr v0, v2

    .line 39
    int-to-float v0, v0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getTop()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget-object v3, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/widget/ImageView;->getTop()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    add-int/2addr v2, v3

    .line 55
    int-to-float v2, v2

    .line 56
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    cmpl-float v3, v3, v0

    .line 61
    .line 62
    if-lez v3, :cond_0

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    iget-object v4, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 69
    .line 70
    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    int-to-float v4, v4

    .line 75
    add-float/2addr v0, v4

    .line 76
    cmpg-float v0, v3, v0

    .line 77
    .line 78
    if-gez v0, :cond_0

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    cmpl-float v0, v0, v2

    .line 85
    .line 86
    if-lez v0, :cond_0

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget-object v3, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 93
    .line 94
    invoke-virtual {v3}, Landroid/widget/ImageView;->getHeight()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    int-to-float v3, v3

    .line 99
    add-float/2addr v2, v3

    .line 100
    cmpg-float v0, v0, v2

    .line 101
    .line 102
    if-gez v0, :cond_0

    .line 103
    .line 104
    sput-boolean v1, Lcom/android/launcher3/widget/T;->V:Z

    .line 105
    .line 106
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    return p0
.end method

.method public getActivityContext()Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppList()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    instance-of v3, v2, Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    instance-of v3, v3, Lcom/android/launcher3/model/data/I;

    .line 30
    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-object v0
.end method

.method public getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->W0:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 10
    .line 11
    return-object p0
.end method

.method public getQsb()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getQsbTranslationX()Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->C0:Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpringAnimImp()Lcom/android/quickstep/util/animation/SpringAnimationImpl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->V0:Lcom/android/quickstep/util/animation/SpringAnimationImpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTableRecentHotseatRecentCount()I
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->getRecentCount()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public j1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/launcher3/Hotseat;->a1:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/Hotseat;->b1:F

    .line 6
    .line 7
    return-void
.end method

.method public k1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/launcher3/Hotseat;->X0:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/Hotseat;->Z0:F

    .line 6
    .line 7
    iput v0, p0, Lcom/android/launcher3/Hotseat;->Y0:F

    .line 8
    .line 9
    return-void
.end method

.method protected l1(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "prepareOrResetUnlockAnim prepare="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " mPrepareForUnlockAnim="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/android/launcher3/Hotseat;->c1:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Hotseat"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iput-boolean p1, p0, Lcom/android/launcher3/Hotseat;->c1:Z

    .line 34
    .line 35
    xor-int/lit8 p1, p1, 0x1

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Hotseat;->s1(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public m1(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->isBubbleBarEnabled()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->hasBubbles()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->removeAllViewsInLayout()V

    .line 20
    .line 21
    .line 22
    iput-boolean p1, p0, Lcom/android/launcher3/Hotseat;->x0:Z

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v2, v1, v0}, Lcom/android/launcher3/h0;->X0(Landroid/content/Context;Z)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Lcom/android/launcher3/E0;

    .line 47
    .line 48
    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/E0;-><init>(Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/h0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/android/launcher3/K5;->setTranslationProvider(Lcom/android/launcher3/K5$a;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 55
    .line 56
    instance-of v1, v0, Lcom/android/launcher3/util/u0;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    move-object v1, v0

    .line 61
    check-cast v1, Lcom/android/launcher3/util/u0;

    .line 62
    .line 63
    iget v3, v2, Lcom/android/launcher3/h0;->B1:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    iget v4, v2, Lcom/android/launcher3/h0;->o2:I

    .line 67
    .line 68
    int-to-float v4, v4

    .line 69
    div-float/2addr v3, v4

    .line 70
    new-instance v4, Lcom/android/launcher3/F0;

    .line 71
    .line 72
    invoke-direct {v4, v1, v3}, Lcom/android/launcher3/F0;-><init>(Lcom/android/launcher3/util/u0;F)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const/4 v1, 0x0

    .line 84
    invoke-virtual {v0, v1}, Lcom/android/launcher3/K5;->setTranslationProvider(Lcom/android/launcher3/K5$a;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 88
    .line 89
    instance-of v1, v0, Lcom/android/launcher3/util/u0;

    .line 90
    .line 91
    if-eqz v1, :cond_1

    .line 92
    .line 93
    check-cast v0, Lcom/android/launcher3/util/u0;

    .line 94
    .line 95
    const/4 v1, 0x0

    .line 96
    invoke-interface {v0, v1}, Lcom/android/launcher3/util/u0;->b(F)V

    .line 97
    .line 98
    .line 99
    :cond_1
    :goto_0
    invoke-virtual {p0, v2}, Lcom/android/launcher3/CellLayout;->t0(Lcom/android/launcher3/h0;)V

    .line 100
    .line 101
    .line 102
    const/4 v0, 0x1

    .line 103
    if-eqz p1, :cond_2

    .line 104
    .line 105
    iget p1, v2, Lcom/android/launcher3/h0;->a2:I

    .line 106
    .line 107
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_2
    iget p1, v2, Lcom/android/launcher3/h0;->a2:I

    .line 112
    .line 113
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 114
    .line 115
    .line 116
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher3/Hotseat;->S0()V

    .line 117
    .line 118
    .line 119
    invoke-direct {p0}, Lcom/android/launcher3/Hotseat;->Q0()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public n1(I)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/Hotseat;->a1:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/android/launcher3/Hotseat;->a1:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/android/launcher3/Hotseat;->b1:F

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public o1(FI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Hotseat;->W0(I)Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/CellLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->C3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getAlpha()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    :goto_0
    const/high16 v2, 0x40000000    # 2.0f

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v3, p0, Lcom/android/launcher3/Hotseat;->O0:Landroid/graphics/Paint;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/android/launcher3/Hotseat;->getTableRecentHotseatBgColor()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Lcom/android/launcher3/Hotseat;->N0:Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-float v4, v4

    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    int-to-float v5, v5

    .line 55
    invoke-virtual {v3, v1, v1, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->c1()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_1

    .line 63
    .line 64
    iget-object v3, p0, Lcom/android/launcher3/Hotseat;->N0:Landroid/graphics/RectF;

    .line 65
    .line 66
    iget v4, p0, Lcom/android/launcher3/Hotseat;->b1:F

    .line 67
    .line 68
    neg-float v4, v4

    .line 69
    div-float/2addr v4, v2

    .line 70
    invoke-virtual {v3, v4, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->N0:Landroid/graphics/RectF;

    .line 74
    .line 75
    iget v3, p0, Lcom/android/launcher3/Hotseat;->M0:I

    .line 76
    .line 77
    int-to-float v4, v3

    .line 78
    int-to-float v3, v3

    .line 79
    iget-object v5, p0, Lcom/android/launcher3/Hotseat;->O0:Landroid/graphics/Paint;

    .line 80
    .line 81
    invoke-virtual {p1, v1, v4, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getTableRecentHotseatRecentCount()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    const v3, 0x7f0b04bf

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    instance-of v4, v3, Ljava/lang/Integer;

    .line 96
    .line 97
    if-eqz v4, :cond_3

    .line 98
    .line 99
    check-cast v3, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    :cond_3
    if-eqz v0, :cond_5

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    if-lez v1, :cond_5

    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-lez v0, :cond_5

    .line 126
    .line 127
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {v0}, Lp1/f;->s(Lcom/android/launcher3/C2;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLeft()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    iget-object v4, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 146
    .line 147
    invoke-static {v4}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-static {v4, v0, v1}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    mul-int/2addr v0, v1

    .line 156
    add-int/2addr v3, v0

    .line 157
    int-to-float v0, v3

    .line 158
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->d1()Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-eqz v1, :cond_4

    .line 163
    .line 164
    iget v0, p0, Lcom/android/launcher3/Hotseat;->Y0:F

    .line 165
    .line 166
    iget v1, p0, Lcom/android/launcher3/Hotseat;->Z0:F

    .line 167
    .line 168
    add-float/2addr v0, v1

    .line 169
    :cond_4
    iget v1, p0, Lcom/android/launcher3/Hotseat;->Q0:I

    .line 170
    .line 171
    int-to-float v1, v1

    .line 172
    div-float/2addr v1, v2

    .line 173
    sub-float/2addr v0, v1

    .line 174
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    int-to-float v1, v1

    .line 179
    div-float/2addr v1, v2

    .line 180
    iget v3, p0, Lcom/android/launcher3/Hotseat;->R0:I

    .line 181
    .line 182
    int-to-float v4, v3

    .line 183
    div-float/2addr v4, v2

    .line 184
    sub-float/2addr v1, v4

    .line 185
    iget-object v2, p0, Lcom/android/launcher3/Hotseat;->T0:Landroid/graphics/RectF;

    .line 186
    .line 187
    iget v4, p0, Lcom/android/launcher3/Hotseat;->Q0:I

    .line 188
    .line 189
    int-to-float v4, v4

    .line 190
    add-float/2addr v4, v0

    .line 191
    int-to-float v3, v3

    .line 192
    add-float/2addr v3, v1

    .line 193
    invoke-virtual {v2, v0, v1, v4, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->T0:Landroid/graphics/RectF;

    .line 197
    .line 198
    iget v1, p0, Lcom/android/launcher3/Hotseat;->P0:I

    .line 199
    .line 200
    int-to-float v2, v1

    .line 201
    int-to-float v1, v1

    .line 202
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->S0:Landroid/graphics/Paint;

    .line 203
    .line 204
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 205
    .line 206
    .line 207
    :cond_5
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->C3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const v1, 0x7f0e0219

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/launcher3/Hotseat;->W0:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->y0:Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v0, v0

    .line 19
    cmpg-float v0, v1, v0

    .line 20
    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->y0:Lcom/android/launcher3/Workspace;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput-boolean p1, p0, Lcom/android/launcher3/Hotseat;->z0:Z

    .line 30
    .line 31
    return p1

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 7

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/android/launcher3/CellLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 11
    .line 12
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-boolean v2, v1, Lcom/android/launcher3/h0;->M0:Z

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget v2, v1, Lcom/android/launcher3/h0;->s2:I

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v3}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    sub-int v3, p4, v3

    .line 37
    .line 38
    add-int/2addr v3, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    add-int/2addr v3, p2

    .line 45
    sub-int/2addr v3, v0

    .line 46
    sub-int/2addr v3, v2

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    sub-int v2, p4, p2

    .line 49
    .line 50
    sub-int/2addr v2, v0

    .line 51
    div-int/lit8 v3, v2, 0x2

    .line 52
    .line 53
    :goto_0
    add-int/2addr v0, v3

    .line 54
    sub-int v2, p5, p3

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->I0()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    sub-int/2addr v2, v4

    .line 61
    iget v1, v1, Lcom/android/launcher3/h0;->p2:I

    .line 62
    .line 63
    sub-int v1, v2, v1

    .line 64
    .line 65
    iget-object v4, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {v4, v3, v1, v0, v2}, Landroid/view/View;->layout(IIII)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->v1()V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lx1/O;->C3()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    move-object v1, p0

    .line 90
    move v2, p1

    .line 91
    move v3, p2

    .line 92
    move v4, p3

    .line 93
    move v5, p4

    .line 94
    move v6, p5

    .line 95
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->V0(Lcom/android/launcher3/Hotseat;ZIIII)V

    .line 96
    .line 97
    .line 98
    :cond_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/CellLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p2, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 11
    .line 12
    iget v0, p1, Lcom/android/launcher3/h0;->o2:I

    .line 13
    .line 14
    const/high16 v1, 0x40000000    # 2.0f

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget p1, p1, Lcom/android/launcher3/h0;->p2:I

    .line 21
    .line 22
    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p2, v0, p1}, Landroid/view/View;->measure(II)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lx1/O;->C3()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Landroid/view/ViewGroup;->forceLayout()V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 49
    .line 50
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 55
    .line 56
    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->measure(II)V

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/Hotseat;->z0:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    and-int/lit16 v0, v0, 0xff

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    const/4 v2, 0x3

    .line 16
    if-eq v0, v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iput-boolean v1, p0, Lcom/android/launcher3/Hotseat;->z0:Z

    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->y0:Lcom/android/launcher3/Workspace;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_1
    return v1
.end method

.method public p1(FI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/Hotseat;->Y0(I)Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q1(III)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/Hotseat;->X0:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->getHotseatRecentCellLayout()Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLeft()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1, p2, p3}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    mul-int/2addr p2, p3

    .line 24
    add-int/2addr v0, p2

    .line 25
    int-to-float p2, v0

    .line 26
    iput p1, p0, Lcom/android/launcher3/Hotseat;->X0:I

    .line 27
    .line 28
    iput p2, p0, Lcom/android/launcher3/Hotseat;->Y0:F

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput p1, p0, Lcom/android/launcher3/Hotseat;->Z0:F

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public r1(FZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/Hotseat;->Z0:F

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s1(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/Hotseat;->d1:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->d1:Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 p0, 0x4

    .line 34
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/Hotseat;->d1:Landroid/animation/AnimatorSet;

    .line 39
    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/Hotseat;->d1:Landroid/animation/AnimatorSet;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public setAlpha(F)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    cmpl-float p1, p1, v0

    .line 20
    .line 21
    if-lez p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p1, 0x4

    .line 29
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->V()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/Hotseat;->F0:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 29
    .line 30
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, -0x1

    .line 39
    const/4 v4, 0x0

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    const/4 v2, 0x5

    .line 43
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 44
    .line 45
    iget v2, v1, Lcom/android/launcher3/X3;->x:I

    .line 46
    .line 47
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 50
    .line 51
    const/16 v5, 0x8

    .line 52
    .line 53
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 57
    .line 58
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 61
    .line 62
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lcom/android/launcher3/h0;->s0(Landroid/content/Context;)Landroid/graphics/Rect;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 75
    .line 76
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 77
    .line 78
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 79
    .line 80
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 81
    .line 82
    invoke-virtual {p0, v2, v3, v4, v1}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 83
    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 87
    .line 88
    .line 89
    goto/16 :goto_5

    .line 90
    .line 91
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/Hotseat;->E0:Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 94
    .line 95
    .line 96
    const/16 v2, 0x50

    .line 97
    .line 98
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 99
    .line 100
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 101
    .line 102
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    .line 103
    .line 104
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 105
    .line 106
    iget-object v2, v1, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 107
    .line 108
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 109
    .line 110
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 111
    .line 112
    invoke-static {}, Lx1/O;->C3()Z

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    if-eqz v5, :cond_3

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    iget-object v3, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 123
    .line 124
    invoke-static {v3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 133
    .line 134
    if-eqz v3, :cond_2

    .line 135
    .line 136
    const v3, 0x7f0c00f1

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_2
    const v3, 0x7f0c00f0

    .line 141
    .line 142
    .line 143
    :goto_0
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    int-to-float v2, v2

    .line 148
    invoke-static {v2}, Lcom/android/launcher3/N5;->T(F)I

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    move v2, v3

    .line 153
    :cond_3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    invoke-virtual {v5}, Lcom/android/launcher3/resource/B;->p()Z

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    if-eqz v5, :cond_6

    .line 162
    .line 163
    iget v5, p1, Landroid/graphics/Rect;->bottom:I

    .line 164
    .line 165
    if-gtz v5, :cond_5

    .line 166
    .line 167
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    invoke-static {v5}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    sget-object v6, Lcom/android/launcher3/util/C1;->j:Lcom/android/launcher3/util/C1;

    .line 176
    .line 177
    if-ne v5, v6, :cond_4

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    const v6, 0x7f070493

    .line 185
    .line 186
    .line 187
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_5
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    const v6, 0x7f070494

    .line 199
    .line 200
    .line 201
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 206
    .line 207
    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    const v6, 0x7f070495

    .line 212
    .line 213
    .line 214
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 215
    .line 216
    .line 217
    move-result v5

    .line 218
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 219
    .line 220
    invoke-virtual {p0, v3, v4, v2, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 221
    .line 222
    .line 223
    goto :goto_3

    .line 224
    :cond_6
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 225
    .line 226
    .line 227
    move-result v5

    .line 228
    if-eqz v5, :cond_7

    .line 229
    .line 230
    iget v5, p1, Landroid/graphics/Rect;->bottom:I

    .line 231
    .line 232
    invoke-virtual {v1, v5}, Lcom/android/launcher3/X3;->k(I)I

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 237
    .line 238
    iget v5, v1, Lcom/android/launcher3/X3;->F:I

    .line 239
    .line 240
    invoke-virtual {p0, v3, v5, v2, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 241
    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_7
    iget v5, p1, Landroid/graphics/Rect;->bottom:I

    .line 245
    .line 246
    invoke-virtual {v1, v5}, Lcom/android/launcher3/X3;->k(I)I

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 251
    .line 252
    invoke-virtual {p0, v3, v4, v2, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 253
    .line 254
    .line 255
    :goto_3
    invoke-static {}, Lx1/O;->C3()Z

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    if-eqz v2, :cond_9

    .line 260
    .line 261
    iget-object v2, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 262
    .line 263
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-static {v2}, Lp1/f;->m(Lcom/android/launcher3/C2;)I

    .line 268
    .line 269
    .line 270
    move-result v2

    .line 271
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 276
    .line 277
    if-eqz v1, :cond_8

    .line 278
    .line 279
    const v1, 0x7f070afd

    .line 280
    .line 281
    .line 282
    goto :goto_4

    .line 283
    :cond_8
    const v1, 0x7f070afc

    .line 284
    .line 285
    .line 286
    :goto_4
    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 291
    .line 292
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 293
    .line 294
    const/16 v1, 0x51

    .line 295
    .line 296
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 297
    .line 298
    :cond_9
    invoke-virtual {p0}, Lcom/android/launcher3/Hotseat;->v1()V

    .line 299
    .line 300
    .line 301
    :goto_5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 302
    .line 303
    .line 304
    invoke-static {p0, p1}, Lcom/android/launcher3/h1;->dispatchInsets(Landroid/view/ViewGroup;Landroid/graphics/Rect;)V

    .line 305
    .line 306
    .line 307
    return-void
.end method

.method public setTableRecentHotseatBgAnimingOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/Hotseat;->b1:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setWorkspace(Lcom/android/launcher3/Workspace;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/Workspace<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Hotseat;->y0:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->setCellLayoutContainer(Lcom/android/launcher3/S;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t1()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 26
    .line 27
    const-string v4, "alpha"

    .line 28
    .line 29
    new-array v5, v1, [F

    .line 30
    .line 31
    fill-array-data v5, :array_0

    .line 32
    .line 33
    .line 34
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v4, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 39
    .line 40
    const-string v5, "scaleX"

    .line 41
    .line 42
    new-array v6, v1, [F

    .line 43
    .line 44
    fill-array-data v6, :array_1

    .line 45
    .line 46
    .line 47
    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iget-object v5, p0, Lcom/android/launcher3/Hotseat;->J0:Landroid/widget/ImageView;

    .line 52
    .line 53
    const-string v6, "scaleY"

    .line 54
    .line 55
    new-array v7, v1, [F

    .line 56
    .line 57
    fill-array-data v7, :array_2

    .line 58
    .line 59
    .line 60
    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    const/4 v6, 0x3

    .line 65
    new-array v6, v6, [Landroid/animation/Animator;

    .line 66
    .line 67
    aput-object v3, v6, v0

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    aput-object v4, v6, v0

    .line 71
    .line 72
    aput-object v5, v6, v1

    .line 73
    .line 74
    invoke-virtual {v2, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 75
    .line 76
    .line 77
    const-wide/16 v0, 0x1c2

    .line 78
    .line 79
    invoke-virtual {v2, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 80
    .line 81
    .line 82
    sget-object v0, Lcom/android/launcher3/anim/L;->K:Landroid/view/animation/Interpolator;

    .line 83
    .line 84
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Lcom/android/launcher3/Hotseat$b;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Lcom/android/launcher3/Hotseat$b;-><init>(Lcom/android/launcher3/Hotseat;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 93
    .line 94
    .line 95
    iput-object v2, p0, Lcom/android/launcher3/Hotseat;->d1:Landroid/animation/AnimatorSet;

    .line 96
    .line 97
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 102
    .line 103
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v0, :cond_1

    .line 112
    .line 113
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 114
    .line 115
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    if-eqz v0, :cond_1

    .line 128
    .line 129
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 130
    .line 131
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const-string v0, "voice"

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Lcom/android/launcher3/W3;->t(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_1
    return-void

    .line 149
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public u1(FZ)V
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const v0, 0x7f0607db

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    shr-int/lit8 v0, p2, 0x18

    .line 20
    .line 21
    and-int/lit16 v0, v0, 0xff

    .line 22
    .line 23
    const/high16 v1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    int-to-float v0, v0

    .line 35
    mul-float/2addr v0, p1

    .line 36
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const v0, 0xffffff

    .line 41
    .line 42
    .line 43
    and-int/2addr p2, v0

    .line 44
    shl-int/lit8 p1, p1, 0x18

    .line 45
    .line 46
    or-int/2addr p1, p2

    .line 47
    iput p1, p0, Lcom/android/launcher3/Hotseat;->U0:I

    .line 48
    .line 49
    iget-object p2, p0, Lcom/android/launcher3/Hotseat;->S0:Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public v1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/Hotseat;->F0:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x0

    .line 27
    move v2, v1

    .line 28
    :goto_0
    if-ge v2, v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    instance-of v4, v3, Lcom/android/launcher3/folder/FolderIcon;

    .line 39
    .line 40
    if-eqz v4, :cond_0

    .line 41
    .line 42
    check-cast v3, Lcom/android/launcher3/folder/FolderIcon;

    .line 43
    .line 44
    invoke-virtual {v3, v1}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    instance-of v4, v3, Lcom/android/launcher3/BubbleTextView;

    .line 49
    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 53
    .line 54
    invoke-virtual {v3, v1}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    return-void
.end method
