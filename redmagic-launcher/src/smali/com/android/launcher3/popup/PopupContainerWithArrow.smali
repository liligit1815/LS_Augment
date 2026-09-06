.class public Lcom/android/launcher3/popup/PopupContainerWithArrow;
.super Lcom/android/launcher3/popup/c;
.source "PopupContainerWithArrow.java"

# interfaces
.implements Lcom/android/launcher3/m0;
.implements Lcom/android/launcher3/dragndrop/j$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/popup/PopupContainerWithArrow$f;,
        Lcom/android/launcher3/popup/PopupContainerWithArrow$d;,
        Lcom/android/launcher3/popup/PopupContainerWithArrow$e;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/popup/c<",
        "TT;>;",
        "Lcom/android/launcher3/m0;",
        "Lcom/android/launcher3/dragndrop/j$b;"
    }
.end annotation


# static fields
.field public static s:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/popup/PopupContainerWithArrow$e;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/shortcuts/DeepShortcutView;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Landroid/graphics/PointF;

.field private i:I

.field private final j:F

.field private k:Landroid/view/View;

.field private l:I

.field private m:Landroid/view/ViewGroup;

.field private n:Landroid/view/ViewGroup;

.field private o:Landroid/view/ViewGroup;

.field protected p:Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

.field protected q:LO0/r;

.field public r:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->s:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->g:Ljava/util/List;

    .line 3
    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->h:Landroid/graphics/PointF;

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07026a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->i:I

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070140

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->l:I

    .line 6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070ae2

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->j:F

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->e0()V

    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/widget/suggest/a;Lcom/android/launcher3/popup/P$i;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Lcom/android/launcher3/popup/P$i;->a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R(Lcom/android/launcher3/popup/PopupContainerWithArrow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->g0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;Lcom/android/launcher3/popup/P$i;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    invoke-interface {p3, p0, p1, p2}, Lcom/android/launcher3/popup/P$i;->a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic U(Lcom/android/launcher3/popup/PopupContainerWithArrow;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->i:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic V(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic W(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method private X(IF)V
    .locals 3

    .line 1
    const v0, 0x7f0e00a9

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0, p0}, Lcom/android/launcher3/popup/c;->inflateAndAdd(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->n:Landroid/view/ViewGroup;

    .line 11
    .line 12
    :goto_0
    if-lez p1, :cond_1

    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->j:F

    .line 15
    .line 16
    add-float/2addr p2, v0

    .line 17
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 18
    .line 19
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget v0, v0, Lcom/android/launcher3/h0;->W0:I

    .line 26
    .line 27
    int-to-float v0, v0

    .line 28
    cmpl-float v0, p2, v0

    .line 29
    .line 30
    if-ltz v0, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const v0, 0x7f0e00a8

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->n:Landroid/view/ViewGroup;

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/popup/c;->inflateAndAdd(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget v2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->l:I

    .line 49
    .line 50
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->g:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    add-int/lit8 p1, p1, -0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->n:Landroid/view/ViewGroup;

    .line 61
    .line 62
    const/4 p2, 0x1

    .line 63
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->n:Landroid/view/ViewGroup;

    .line 67
    .line 68
    new-instance p2, Lcom/android/launcher3/popup/PopupContainerWithArrow$a;

    .line 69
    .line 70
    invoke-direct {p2, p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow$a;-><init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->m0()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private Y(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    const v0, 0x7f0e0215

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, p0}, Lcom/android/launcher3/popup/c;->inflateAndAdd(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/view/ViewGroup;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    const/4 v3, 0x0

    .line 28
    if-le v1, v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const v4, 0x7f070138

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 42
    .line 43
    invoke-static {}, Lx1/O;->k1()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    const/4 v1, -0x1

    .line 50
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 53
    .line 54
    check-cast v0, Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 57
    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/android/launcher3/popup/P;

    .line 74
    .line 75
    const v1, 0x7f0e0211

    .line 76
    .line 77
    .line 78
    iget-object v4, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 79
    .line 80
    invoke-virtual {p0, v1, v4, v0, v3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->f0(ILandroid/view/ViewGroup;Lcom/android/launcher3/popup/P;Z)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 85
    .line 86
    check-cast v0, Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 92
    .line 93
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/android/launcher3/popup/P;

    .line 98
    .line 99
    const v1, 0x7f0e020f

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v1, v0, p1, v3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->f0(ILandroid/view/ViewGroup;Lcom/android/launcher3/popup/P;Z)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const v1, 0x7f070269

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setElevation(F)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 122
    .line 123
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setClipToOutline(Z)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 127
    .line 128
    new-instance v0, Lcom/android/launcher3/popup/PopupContainerWithArrow$c;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow$c;-><init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    return-void
.end method

.method private Z(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/popup/d;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/popup/d;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->y0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    instance-of v0, p2, Lcom/android/launcher3/model/data/z;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    check-cast p2, Lcom/android/launcher3/model/data/z;

    .line 20
    .line 21
    iget p2, p2, Lcom/android/launcher3/model/data/z;->h:I

    .line 22
    .line 23
    and-int/lit16 p2, p2, 0x2000

    .line 24
    .line 25
    if-nez p2, :cond_1

    .line 26
    .line 27
    :cond_0
    new-instance p2, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;

    .line 28
    .line 29
    invoke-direct {p2, p1, p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->p:Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

    .line 33
    .line 34
    :cond_1
    new-instance p2, LO0/t;

    .line 35
    .line 36
    invoke-direct {p2, p1}, LO0/t;-><init>(Lcom/android/launcher3/C2;)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->q:LO0/r;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static b0(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->animateClose_mfv()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public static d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;)",
            "Lcom/android/launcher3/popup/PopupContainerWithArrow;"
        }
    .end annotation

    .line 1
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 9
    .line 10
    return-object p0
.end method

.method private synthetic g0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private getTitleForAccessibility()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f140039

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private h0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getTitleForAccessibility()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 9
    .line 10
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    instance-of v1, v0, Lcom/android/launcher3/views/s;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    check-cast v0, Lcom/android/launcher3/views/s;

    .line 26
    .line 27
    invoke-interface {v0, v2}, Lcom/android/launcher3/views/s;->setForceHideDot(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    instance-of v1, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    check-cast v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/android/launcher3/folder/FolderIcon;->setForceHideDot(Z)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    instance-of v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setForceHideDot(Z)V

    .line 48
    .line 49
    .line 50
    :cond_3
    :goto_0
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    instance-of v0, p2, Lcom/android/launcher3/widget/group/b;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    instance-of v0, p1, Lcom/android/launcher3/model/data/A;

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    move-object v0, p1

    .line 65
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/android/launcher3/model/data/A;->p:Ljava/lang/String;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->r:Ljava/lang/String;

    .line 70
    .line 71
    :cond_4
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 72
    .line 73
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 77
    .line 78
    .line 79
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v1, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 86
    .line 87
    new-instance v3, Landroid/os/Handler;

    .line 88
    .line 89
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-direct {v3, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 94
    .line 95
    .line 96
    iget-object v5, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->g:Ljava/util/List;

    .line 97
    .line 98
    move-object v4, p0

    .line 99
    move-object v2, p1

    .line 100
    move-object v6, p2

    .line 101
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/popup/t;->e(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/os/Handler;Lcom/android/launcher3/popup/PopupContainerWithArrow;Ljava/util/List;Landroid/view/View;)Ljava/lang/Runnable;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v0, p0}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static k0(Landroid/view/View;)Lcom/android/launcher3/popup/PopupContainerWithArrow;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lcom/android/launcher3/popup/PopupContainerWithArrow<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const-string v3, "PopupContainerWithArrow"

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 19
    .line 20
    .line 21
    const-string p0, "showForIcon: already has a popup container."

    .line 22
    .line 23
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-object v2

    .line 27
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/android/launcher3/util/r2;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_1

    .line 38
    .line 39
    const-string p0, "showForIcon: do not support short cut menu."

    .line 40
    .line 41
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    return-object v2

    .line 45
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v4, v1}, Lcom/android/launcher3/popup/n;->j(Lcom/android/launcher3/model/data/y;)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-virtual {v0, v1}, Lcom/android/launcher3/C2;->y2(Lcom/android/launcher3/model/data/y;)Ljava/util/stream/Stream;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz v6, :cond_2

    .line 62
    .line 63
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->t(Landroid/view/View;)Ljava/util/stream/Stream;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    :cond_2
    new-instance v6, Lcom/android/launcher3/popup/f;

    .line 68
    .line 69
    invoke-direct {v6, v0, v1, p0}, Lcom/android/launcher3/popup/f;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    new-instance v6, Lcom/android/launcher3/popup/g;

    .line 77
    .line 78
    invoke-direct {v6}, Lcom/android/launcher3/popup/g;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    check-cast v5, Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    add-int/2addr v6, v4

    .line 100
    if-nez v6, :cond_3

    .line 101
    .line 102
    new-instance p0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v0, "showForIcon: empty menu, item: "

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    return-object v2

    .line 123
    :cond_3
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    const/4 v6, 0x0

    .line 132
    const v7, 0x7f0e0194

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2, v7, v3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 140
    .line 141
    invoke-direct {v2, v0, v1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->Z(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Landroid/multiuser/Flags;->enableMovingContentIntoPrivateSpace()Z

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    if-eqz v3, :cond_4

    .line 149
    .line 150
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    const-string v6, "com.android.privatespace"

    .line 155
    .line 156
    invoke-static {v3, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-eqz v3, :cond_4

    .line 161
    .line 162
    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 163
    .line 164
    :cond_4
    invoke-virtual {v2, p0, v4, v5}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->i0(Landroid/view/View;ILjava/util/List;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1}, Lcom/android/launcher3/util/L1;->a(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/L1;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {v0, p0}, Lcom/android/launcher3/C2;->l4(Lcom/android/launcher3/util/L1;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 175
    .line 176
    .line 177
    return-object v2
.end method

.method public static l0(Lcom/android/launcher3/widget/suggest/a;Lcom/android/launcher3/widget/suggest/data/AppIconTagData;)Lcom/android/launcher3/popup/PopupContainerWithArrow;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/suggest/a;",
            "Lcom/android/launcher3/widget/suggest/data/AppIconTagData;",
            ")",
            "Lcom/android/launcher3/popup/PopupContainerWithArrow<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, " appIconTagData="

    .line 2
    .line 3
    const-string v1, "PopupContainerWithArrow"

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v2, :cond_4

    .line 11
    .line 12
    if-eqz p1, :cond_4

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getSuggestNubiaPushConfig()Lcom/android/launcher3/widget/suggest/data/SuggestNubiaPushConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v2}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/ImageView;->clearFocus()V

    .line 37
    .line 38
    .line 39
    return-object v3

    .line 40
    :cond_1
    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    const v5, 0x7f0e0194

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    const/4 v7, 0x0

    .line 52
    invoke-virtual {v4, v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 57
    .line 58
    :try_start_0
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-virtual {p1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getOriginPkg()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    iget-object v8, p1, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->userHandle:Landroid/os/UserHandle;

    .line 67
    .line 68
    invoke-virtual {v5, v6, v8}, Lcom/android/launcher3/D3;->Z(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 69
    .line 70
    .line 71
    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    if-nez v5, :cond_2

    .line 73
    .line 74
    :try_start_1
    new-instance v6, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v8, "showForSuggestCustomImgView findAppInfo error getOriginPkg="

    .line 80
    .line 81
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/android/launcher3/widget/suggest/data/AppIconTagData;->getOriginPkg()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    invoke-static {v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-virtual {v6}, Lcom/android/launcher3/D3;->d0()Ljava/util/ArrayList;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    if-nez v8, :cond_2

    .line 117
    .line 118
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    check-cast v6, Lcom/android/launcher3/model/data/d;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 123
    .line 124
    move-object v5, v6

    .line 125
    goto :goto_0

    .line 126
    :catchall_0
    move-object v5, v3

    .line 127
    :catchall_1
    new-instance v6, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    const-string v8, "showForSuggestCustomImgView findAppInfo error appIconTagData="

    .line 133
    .line 134
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    invoke-static {v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    :cond_2
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .line 151
    .line 152
    const-string v8, "showForSuggestCustomImgView appInfo="

    .line 153
    .line 154
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    if-nez v5, :cond_3

    .line 174
    .line 175
    new-instance p0, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    const-string v0, "showForSuggestCustomImgView appInfo null return, appIconTagData="

    .line 181
    .line 182
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    return-object v3

    .line 196
    :cond_3
    new-instance p1, Lcom/android/launcher3/model/data/I;

    .line 197
    .line 198
    invoke-direct {p1, v5}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/d;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->t(Landroid/view/View;)Ljava/util/stream/Stream;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    new-instance v1, Lcom/android/launcher3/popup/h;

    .line 209
    .line 210
    invoke-direct {v1, v2, p1, p0}, Lcom/android/launcher3/popup/h;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/widget/suggest/a;)V

    .line 211
    .line 212
    .line 213
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    new-instance v0, Lcom/android/launcher3/popup/g;

    .line 218
    .line 219
    invoke-direct {v0}, Lcom/android/launcher3/popup/g;-><init>()V

    .line 220
    .line 221
    .line 222
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    check-cast p1, Ljava/util/List;

    .line 235
    .line 236
    invoke-virtual {v4, p0, v7, p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->i0(Landroid/view/View;ILjava/util/List;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->requestFocus()Z

    .line 240
    .line 241
    .line 242
    return-object v4

    .line 243
    :cond_4
    :goto_1
    return-object v3
.end method

.method private n0(Landroid/widget/TextView;Lcom/android/launcher3/popup/P;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f070ae8

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    float-to-int v0, v0

    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const v2, 0x7f070aeb

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const v3, 0x7f070aed

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    float-to-int v2, v2

    .line 36
    iget v3, p2, Lcom/android/launcher3/popup/P;->mIconBackgroundResId:I

    .line 37
    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const v3, 0x7f070ae9

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const v4, 0x7f070aec

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    move v3, v1

    .line 64
    :goto_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineCount()I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    const/4 v5, 0x2

    .line 69
    if-lt v4, v5, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const v2, 0x7f070aee

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    float-to-int v2, v1

    .line 83
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const v4, 0x7f070aea

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    float-to-int v1, v1

    .line 95
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    iget v5, p2, Lcom/android/launcher3/popup/P;->mIconResId:I

    .line 100
    .line 101
    invoke-static {v4, v5}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    if-eqz v4, :cond_3

    .line 106
    .line 107
    instance-of v5, p2, Lcom/android/launcher3/popup/P$p;

    .line 108
    .line 109
    if-eqz v5, :cond_2

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    const v6, 0x7f0607b2

    .line 116
    .line 117
    .line 118
    invoke-static {v5, v6}, Lz/a;->c(Landroid/content/Context;I)I

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    const v6, 0x7f0607b0

    .line 131
    .line 132
    .line 133
    invoke-static {v5, v6}, Lz/a;->c(Landroid/content/Context;I)I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 138
    .line 139
    .line 140
    :cond_3
    :goto_1
    iget v5, p2, Lcom/android/launcher3/popup/P;->mIconBackgroundResId:I

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    const v7, 0x7f070ae7

    .line 147
    .line 148
    .line 149
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    invoke-virtual {p0, v5, v4, v6}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->c0(ILandroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    const/4 v5, 0x0

    .line 158
    invoke-virtual {v4, v5, v5, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 159
    .line 160
    .line 161
    const/4 v0, 0x0

    .line 162
    invoke-virtual {p1, v0, v4, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1, v3, v5, v3, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 166
    .line 167
    .line 168
    invoke-static {}, Lx1/O;->k1()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_4

    .line 173
    .line 174
    invoke-virtual {p1, v3, v3, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 175
    .line 176
    .line 177
    :cond_4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget v3, p2, Lcom/android/launcher3/popup/P;->mLabelResId:I

    .line 182
    .line 183
    invoke-virtual {v0, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    int-to-float v0, v2

    .line 191
    invoke-virtual {p1, v5, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    iget p2, p2, Lcom/android/launcher3/popup/P;->mLabelResId:I

    .line 202
    .line 203
    invoke-virtual {p0, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 208
    .line 209
    .line 210
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/launcher3/popup/c;->mDeferContainerRemoval:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->animateClose_mfv()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a0(Z)Lcom/android/launcher3/dragndrop/p$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;-><init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;Z)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public c0(ILandroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p2

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0, p2}, [Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    move v3, p3

    .line 31
    move v4, p3

    .line 32
    move v5, p3

    .line 33
    move v2, p3

    .line 34
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method protected closeComplete()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/popup/c;->closeComplete()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 15
    .line 16
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 17
    .line 18
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->d0(Landroid/content/Context;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, v0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 36
    .line 37
    if-eq v0, v1, :cond_5

    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 40
    .line 41
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    move-object v1, v0

    .line 47
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 48
    .line 49
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->P0()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {v1, v0}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 59
    .line 60
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    instance-of v1, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 67
    .line 68
    const/4 v3, 0x1

    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    check-cast v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 72
    .line 73
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 74
    .line 75
    iget v1, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 76
    .line 77
    const/16 v4, -0x65

    .line 78
    .line 79
    if-ne v1, v4, :cond_3

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    invoke-virtual {v0, v3}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    instance-of v1, v0, Lcom/android/launcher3/widget/T;

    .line 90
    .line 91
    if-eqz v1, :cond_5

    .line 92
    .line 93
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_5

    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 102
    .line 103
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 104
    .line 105
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 110
    .line 111
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 112
    .line 113
    if-nez v0, :cond_5

    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 116
    .line 117
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 118
    .line 119
    invoke-virtual {v0, v3}, Lcom/android/launcher3/widget/T;->Z(Z)V

    .line 120
    .line 121
    .line 122
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 123
    .line 124
    invoke-static {v0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_6

    .line 129
    .line 130
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 131
    .line 132
    instance-of v1, v0, Lcom/android/launcher3/widget/suggest/e;

    .line 133
    .line 134
    if-eqz v1, :cond_6

    .line 135
    .line 136
    const v1, 0x7f0b059e

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    instance-of v1, v0, Lcom/android/launcher3/widget/suggest/m;

    .line 144
    .line 145
    if-eqz v1, :cond_6

    .line 146
    .line 147
    check-cast v0, Lcom/android/launcher3/widget/suggest/m;

    .line 148
    .line 149
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 150
    .line 151
    check-cast p0, Lcom/android/launcher3/widget/suggest/e;

    .line 152
    .line 153
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/suggest/m;->P0(Lcom/android/launcher3/widget/suggest/e;)V

    .line 154
    .line 155
    .line 156
    :cond_6
    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f07026b

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->i:I

    .line 13
    .line 14
    return-void
.end method

.method protected f0(ILandroid/view/ViewGroup;Lcom/android/launcher3/popup/P;Z)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/popup/c;->inflateAndAdd(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lx1/O;->k1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const v1, 0x7f080ed4

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    instance-of v0, p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 26
    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    move-object p2, p1

    .line 30
    check-cast p2, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    iget v0, p3, Lcom/android/launcher3/popup/P;->mIconResId:I

    .line 37
    .line 38
    invoke-static {p4, v0}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    if-eqz p4, :cond_2

    .line 43
    .line 44
    instance-of v0, p3, Lcom/android/launcher3/popup/P$p;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const v1, 0x7f0607b2

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Lz/a;->c(Landroid/content/Context;I)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p4, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const v1, 0x7f0607b0

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Lz/a;->c(Landroid/content/Context;I)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p4, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    iget v0, p3, Lcom/android/launcher3/popup/P;->mIconBackgroundResId:I

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const v2, 0x7f070264

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    invoke-virtual {p0, v0, p4, v1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->c0(ILandroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {}, LH2/c;->j()Z

    .line 95
    .line 96
    .line 97
    move-result p4

    .line 98
    if-eqz p4, :cond_3

    .line 99
    .line 100
    invoke-virtual {p2}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 101
    .line 102
    .line 103
    move-result-object p4

    .line 104
    const-string v0, "variable-label-large"

    .line 105
    .line 106
    const/4 v1, 0x0

    .line 107
    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    invoke-virtual {p2}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object p4

    .line 118
    invoke-virtual {p2}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p3, p4, p2, p0}, Lcom/android/launcher3/popup/P;->setIconAndLabel(Landroid/view/View;Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    instance-of v0, p1, Landroid/widget/ImageView;

    .line 127
    .line 128
    if-eqz v0, :cond_6

    .line 129
    .line 130
    move-object v0, p1

    .line 131
    check-cast v0, Landroid/widget/ImageView;

    .line 132
    .line 133
    invoke-virtual {p3, v0}, Lcom/android/launcher3/popup/P;->setIconAndContentDescriptionFor(Landroid/widget/ImageView;)V

    .line 134
    .line 135
    .line 136
    if-eqz p4, :cond_5

    .line 137
    .line 138
    const p4, 0x7f0e0216

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, p4, p2}, Lcom/android/launcher3/popup/c;->inflateAndAdd(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p1, p0}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_6
    instance-of p2, p1, Landroid/widget/TextView;

    .line 153
    .line 154
    if-eqz p2, :cond_7

    .line 155
    .line 156
    move-object p2, p1

    .line 157
    check-cast p2, Landroid/widget/TextView;

    .line 158
    .line 159
    invoke-direct {p0, p2, p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->n0(Landroid/widget/TextView;Lcom/android/launcher3/popup/P;)V

    .line 160
    .line 161
    .line 162
    :cond_7
    :goto_1
    invoke-virtual {p1, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    .line 167
    .line 168
    return-object p1
.end method

.method public getAccessibilityDelegate()LO0/r;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->q:LO0/r;

    return-object p0
.end method

.method public bridge synthetic getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->getAccessibilityDelegate()LO0/r;

    move-result-object p0

    return-object p0
.end method

.method protected getAccessibilityInitialFocusView()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/popup/c;->getAccessibilityInitialFocusView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getItemClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/popup/e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/popup/e;-><init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getItemDragHandler()Lcom/android/launcher3/popup/PopupContainerWithArrow$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->p:Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOriginalIcon()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getSystemShortcutContainer()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getTargetObjectLocation(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 8
    .line 9
    .line 10
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/2addr v0, v1

    .line 19
    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    add-int/2addr v0, v1

    .line 30
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 31
    .line 32
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    sub-int/2addr v0, v1

    .line 41
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 44
    .line 45
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 60
    .line 61
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    :goto_0
    add-int/2addr v1, p0

    .line 83
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    instance-of v1, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 87
    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    instance-of v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 91
    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    sub-int/2addr p0, v0

    .line 101
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr v1, v0

    .line 111
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 112
    .line 113
    check-cast p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolderName()Lcom/android/launcher3/BubbleTextView;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    sub-int/2addr v1, p0

    .line 124
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    instance-of v0, v0, Landroid/appwidget/AppWidgetHostView;

    .line 128
    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_4

    .line 136
    .line 137
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 138
    .line 139
    instance-of v1, v0, Lcom/android/launcher3/widget/group/b;

    .line 140
    .line 141
    if-eqz v1, :cond_4

    .line 142
    .line 143
    check-cast v0, Lcom/android/launcher3/widget/group/b;

    .line 144
    .line 145
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/group/b;->k0(Landroid/graphics/Rect;)V

    .line 146
    .line 147
    .line 148
    :cond_4
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 149
    .line 150
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    sub-int/2addr v0, p0

    .line 157
    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 158
    .line 159
    :cond_5
    return-void
.end method

.method protected getWidgetContainer()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->m:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0(Landroid/view/View;ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "I",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->j0(Landroid/view/View;Lcom/android/launcher3/model/data/y;ILjava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x2

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

.method public j0(Landroid/view/View;Lcom/android/launcher3/model/data/y;ILjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/android/launcher3/model/data/y;",
            "I",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f070140

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->l:I

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/widget/suggest/v;->y(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    move p3, v1

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 27
    .line 28
    instance-of v2, v0, Lcom/android/launcher3/widget/T;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 41
    .line 42
    invoke-super {p0, v0}, Lcom/android/launcher3/popup/c;->setIcon(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const v2, 0x7f070138

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iget v2, p0, Lcom/android/launcher3/popup/c;->mChildContainerMargin:I

    .line 57
    .line 58
    add-int/2addr v0, v2

    .line 59
    int-to-float v0, v0

    .line 60
    if-lez p3, :cond_2

    .line 61
    .line 62
    invoke-direct {p0, p3, v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->X(IF)V

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-direct {p0, p4}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->Y(Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->show()V

    .line 69
    .line 70
    .line 71
    iget-object p3, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 72
    .line 73
    if-eqz p3, :cond_4

    .line 74
    .line 75
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    :goto_0
    if-ge v1, p3, :cond_4

    .line 80
    .line 81
    iget-object p4, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->o:Landroid/view/ViewGroup;

    .line 82
    .line 83
    invoke-virtual {p4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p4

    .line 87
    instance-of v0, p4, Landroid/widget/TextView;

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    check-cast p4, Landroid/widget/TextView;

    .line 92
    .line 93
    invoke-virtual {p4}, Landroid/widget/TextView;->getLineCount()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    const/4 v2, 0x2

    .line 98
    if-lt v0, v2, :cond_3

    .line 99
    .line 100
    invoke-virtual {p4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    invoke-virtual {p4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    instance-of v0, v0, Lcom/android/launcher3/popup/P;

    .line 111
    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    invoke-virtual {p4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Lcom/android/launcher3/popup/P;

    .line 119
    .line 120
    invoke-direct {p0, p4, v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->n0(Landroid/widget/TextView;Lcom/android/launcher3/popup/P;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_4
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->h0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method protected m0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_2

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->g:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 18
    .line 19
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    iget-object v4, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 26
    .line 27
    instance-of v4, v4, Lcom/android/launcher3/widget/group/b;

    .line 28
    .line 29
    :cond_0
    const/4 v4, 0x4

    .line 30
    if-lt v2, v4, :cond_1

    .line 31
    .line 32
    const/16 v4, 0x8

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v4, v1

    .line 36
    :goto_1
    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_2

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {p0, v2}, Lcom/android/launcher3/a;->close(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return v1

    .line 34
    :cond_1
    :goto_0
    return v2

    .line 35
    :cond_2
    return v1
.end method

.method protected onCreateCloseAnimation(Landroid/animation/AnimatorSet;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/BubbleTextView;->P(Z)Landroid/animation/ObjectAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->k:Landroid/view/View;

    .line 18
    .line 19
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->h:Landroid/graphics/PointF;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->h:Landroid/graphics/PointF;

    .line 21
    .line 22
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-float/2addr v0, v1

    .line 29
    iget-object v1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->h:Landroid/graphics/PointF;

    .line 30
    .line 31
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    sub-float/2addr v1, p1

    .line 38
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Lcom/android/launcher3/N5;->f0(Landroid/content/Context;)F

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    cmpl-float p0, p1, p0

    .line 51
    .line 52
    if-lez p0, :cond_1

    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_1
    const/4 p0, 0x0

    .line 57
    return p0
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setPopupItemDragHandler(Lcom/android/launcher3/popup/PopupContainerWithArrow$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->p:Lcom/android/launcher3/popup/PopupContainerWithArrow$f;

    .line 2
    .line 3
    return-void
.end method

.method protected setWidgetContainer(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->m:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mOpenCloseAnimator:Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/popup/c;->mDeferContainerRemoval:Z

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/popup/c;->mDeferContainerRemoval:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->closeComplete()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method
