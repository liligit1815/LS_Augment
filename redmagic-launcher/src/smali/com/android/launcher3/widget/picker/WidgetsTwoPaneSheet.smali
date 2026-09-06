.class public Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;
.super Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
.source "WidgetsTwoPaneSheet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;,
        Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;,
        Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$d;
    }
.end annotation


# instance fields
.field private J0:Landroid/widget/FrameLayout;

.field private K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

.field private L0:Lcom/android/launcher3/util/L1;

.field private M0:Landroid/view/View;

.field private N0:Landroid/widget/LinearLayout;

.field protected O0:Landroid/widget/ScrollView;

.field private P0:Lcom/android/launcher3/widget/picker/d0;

.field private Q0:Z

.field private R0:I

.field private S0:Lcom/android/launcher3/util/L1;

.field private T0:Landroid/widget/TextView;

.field protected U0:Landroid/view/View;

.field protected V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

.field protected W0:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 9
    .line 10
    return-void
.end method

.method private static B2(Landroid/view/ViewGroup;Lz1/Z4;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Lcom/android/launcher3/widget/picker/m0;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/picker/m0;-><init>(Lz1/Z4;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/android/launcher3/N5;->k(Landroid/view/View;Ljava/util/function/Predicate;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/widget/WidgetCell;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->p()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->n(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic Y1(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->w2(Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic a2(Lz1/Z4;Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/WidgetCell;->s(Lz1/Z4;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static synthetic b2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->v2(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c2(Lz1/Z4;Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/WidgetCell;->s(Lz1/Z4;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static synthetic d2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Lcom/android/launcher3/model/data/B;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->x2(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Lcom/android/launcher3/util/L1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->u2(Lcom/android/launcher3/util/L1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->N0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/util/L1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    return-object p0
.end method

.method private getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method static bridge synthetic h2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/widget/picker/WidgetsListHeader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/widget/picker/d0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->P0:Lcom/android/launcher3/widget/picker/d0;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Lcom/android/launcher3/util/L1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->y2(Landroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic l2(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->t2(Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m2(Landroid/view/ViewGroup;Lz1/Z4;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->z2(Landroid/view/ViewGroup;Lz1/Z4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic n2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic o2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lcom/android/launcher3/anim/q;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic p2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic q2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic r2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lz1/Z4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getLastSelectedWidgetItem()Lz1/Z4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static synthetic s2(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)Lz1/Z4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getLastSelectedWidgetItem()Lz1/Z4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private setupSuggestedWidgets(Landroid/view/LayoutInflater;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->y0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const v1, 0x7f0b05a0

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->J0:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    const v0, 0x7f0e026c

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->J0:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {p1, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p1, v0}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setExpanded(Z)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$d;

    .line 38
    .line 39
    const-string v0, "widgets_list_suggestions_entry"

    .line 40
    .line 41
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {p1, v0, v2}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$d;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const v2, 0x7f140411

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const v3, 0x7f140486

    .line 64
    .line 65
    .line 66
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iput-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 75
    .line 76
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 77
    .line 78
    invoke-static {p1, v0, v3, v1}, Lm2/o;->r(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Ljava/util/List;I)Lm2/o;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lm2/o;->w()Lm2/o;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->c(Lm2/o;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const v3, 0x7f081a94

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 108
    .line 109
    new-instance v1, Lcom/android/launcher3/widget/picker/j0;

    .line 110
    .line 111
    invoke-direct {v1, p0, p1, v2}, Lcom/android/launcher3/widget/picker/j0;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Lcom/android/launcher3/model/data/B;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->J0:Landroid/widget/FrameLayout;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method private static t2(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    new-instance v0, Lcom/android/launcher3/widget/picker/k0;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/widget/picker/k0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/android/launcher3/N5;->k(Landroid/view/View;Ljava/util/function/Predicate;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/widget/WidgetCell;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x40

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v0, v1}, Landroid/widget/LinearLayout;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic u2(Lcom/android/launcher3/util/L1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;->a(Lcom/android/launcher3/util/L1;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic v2(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestApplyInsets()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->L0:Lcom/android/launcher3/util/L1;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->callOnClick()Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 30
    .line 31
    invoke-interface {p1, p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;->a(Lcom/android/launcher3/util/L1;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method private synthetic w2(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->k0:I

    .line 6
    .line 7
    return-void
.end method

.method private synthetic x2(Lcom/android/launcher3/model/data/B;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p3, v0}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setExpanded(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->J1()V

    .line 8
    .line 9
    .line 10
    iget-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->N0:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    iget-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->N0:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {p3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p3, v0}, Landroid/widget/ScrollView;->setScrollY(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Lcom/android/launcher3/util/L1;->d(Lcom/android/launcher3/model/data/B;)Lcom/android/launcher3/util/L1;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->L0:Lcom/android/launcher3/util/L1;

    .line 33
    .line 34
    iget-object p3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 35
    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->getAccessibilityInitialFocusView()Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Landroid/view/View;->isAccessibilityFocused()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->t2(Landroid/view/ViewGroup;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getLastSelectedWidgetItem()Lz1/Z4;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->B2(Landroid/view/ViewGroup;Lz1/Z4;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->L0:Lcom/android/launcher3/util/L1;

    .line 90
    .line 91
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 92
    .line 93
    return-void
.end method

.method private y2(Landroid/view/MenuItem;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;->a:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    xor-int/2addr v1, v2

    .line 7
    iput-boolean v1, v0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;->a:Z

    .line 8
    .line 9
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->w()V

    .line 13
    .line 14
    .line 15
    iget-boolean p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E0:Lcom/android/launcher3/widget/picker/search/b;

    .line 20
    .line 21
    invoke-interface {p0}, Lcom/android/launcher3/widget/picker/search/b;->reset()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->L0:Lcom/android/launcher3/util/L1;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 36
    .line 37
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/widget/picker/T;->V()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 51
    .line 52
    iget p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->g()V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return v2
.end method

.method private static z2(Landroid/view/ViewGroup;Lz1/Z4;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Lcom/android/launcher3/widget/picker/l0;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lcom/android/launcher3/widget/picker/l0;-><init>(Lz1/Z4;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/android/launcher3/N5;->k(Landroid/view/View;Ljava/util/function/Predicate;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/widget/WidgetCell;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->p()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->callOnClick()Z

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method protected A2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->U0:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$a;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public B(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->L0:Lcom/android/launcher3/util/L1;

    .line 9
    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 17
    .line 18
    invoke-interface {p1, p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;->a(Lcom/android/launcher3/util/L1;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method protected E0(Lcom/android/launcher3/widget/WidgetCell;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public E1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->F0:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->T0:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->T0:Landroid/widget/TextView;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method protected G0(Lcom/android/launcher3/h0;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const p1, 0x7f070c89

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public L()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->L()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->J0:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->h0:I

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->setupSuggestedWidgets(Landroid/view/LayoutInflater;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->callOnClick()Z

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->L0:Lcom/android/launcher3/util/L1;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getLastSelectedWidgetItem()Lz1/Z4;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v0, p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->z2(Landroid/view/ViewGroup;Lz1/Z4;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method protected Q0(Lcom/android/launcher3/widget/WidgetCell;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    if-eqz p1, :cond_2

    .line 6
    .line 7
    instance-of v0, p1, Landroid/widget/ScrollView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p1, Landroid/widget/ScrollView;

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-virtual {p1, p0, p2}, Landroid/widget/ScrollView;->smoothScrollBy(II)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-ne p1, p0, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_0

    .line 26
    :cond_2
    :goto_1
    return-void
.end method

.method protected R1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/picker/T;->X(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/picker/T;->X(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 38
    .line 39
    const/4 v2, 0x2

    .line 40
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->getHeaderChangeListener()Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v0, v3}, Lcom/android/launcher3/widget/picker/T;->X(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$c;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-boolean v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->g0:Z

    .line 64
    .line 65
    if-eqz v3, :cond_0

    .line 66
    .line 67
    const v3, 0x7f0e0276

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const v3, 0x7f0e0278

    .line 72
    .line 73
    .line 74
    :goto_0
    const v4, 0x7f0b04d0

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    check-cast v4, Landroid/view/ViewGroup;

    .line 82
    .line 83
    invoke-virtual {v0, v3, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->S1()V

    .line 87
    .line 88
    .line 89
    new-instance v3, Lcom/android/launcher3/widget/picker/d0;

    .line 90
    .line 91
    iget-object v4, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 92
    .line 93
    invoke-direct {v3, v4, v0, p0, p0}, Lcom/android/launcher3/widget/picker/d0;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    .line 94
    .line 95
    .line 96
    iput-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->P0:Lcom/android/launcher3/widget/picker/d0;

    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 99
    .line 100
    const v3, 0x7f0b0690

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Landroid/widget/LinearLayout;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 112
    .line 113
    const v3, 0x7f0b0692

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 121
    .line 122
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 123
    .line 124
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->B0:Landroid/widget/LinearLayout;

    .line 125
    .line 126
    invoke-virtual {v0, v3}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->initParentViews(Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 130
    .line 131
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->setWidgetCellLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 135
    .line 136
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->setWidgetCellOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 140
    .line 141
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->K0:Z

    .line 142
    .line 143
    if-nez v0, :cond_1

    .line 144
    .line 145
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->S()V

    .line 148
    .line 149
    .line 150
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->A0:Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;

    .line 151
    .line 152
    new-instance v3, Lcom/android/launcher3/widget/picker/h0;

    .line 153
    .line 154
    invoke-direct {v3, p0}, Lcom/android/launcher3/widget/picker/h0;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v3}, Lcom/android/launcher3/widget/picker/WidgetRecommendationsView;->Q(Ljava/util/function/Consumer;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 161
    .line 162
    const v3, 0x7f0b060e

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    check-cast v0, Landroid/widget/TextView;

    .line 170
    .line 171
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->F0:Landroid/widget/TextView;

    .line 172
    .line 173
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 174
    .line 175
    const v3, 0x7f0b068b

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Landroid/widget/TextView;

    .line 183
    .line 184
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->T0:Landroid/widget/TextView;

    .line 185
    .line 186
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 187
    .line 188
    const v3, 0x7f0b068c

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->U0:Landroid/view/View;

    .line 196
    .line 197
    invoke-static {}, Lcom/android/launcher3/y0;->f0()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_2

    .line 202
    .line 203
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->A2()V

    .line 204
    .line 205
    .line 206
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 207
    .line 208
    const v3, 0x7f0b04f0

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Landroid/widget/LinearLayout;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->N0:Landroid/widget/LinearLayout;

    .line 218
    .line 219
    iget-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 220
    .line 221
    const v3, 0x7f0b04f2

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Landroid/widget/ScrollView;

    .line 229
    .line 230
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 231
    .line 232
    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->setOverScrollMode(I)V

    .line 233
    .line 234
    .line 235
    const v0, 0x7f0b0497

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->M0:Landroid/view/View;

    .line 243
    .line 244
    iget-object v2, p0, Lcom/android/launcher3/views/f;->A:Landroid/view/ViewOutlineProvider;

    .line 245
    .line 246
    invoke-virtual {v0, v2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->M0:Landroid/view/View;

    .line 250
    .line 251
    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->w()V

    .line 255
    .line 256
    .line 257
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->G0:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 258
    .line 259
    const/16 v0, 0x8

    .line 260
    .line 261
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 262
    .line 263
    .line 264
    return-void
.end method

.method protected U1(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 14
    .line 15
    const/4 p1, -0x1

    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/ScrollView;->canScrollVertically(I)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->U1(Landroid/view/MotionEvent;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method protected X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->E()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->N0:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->L0:Lcom/android/launcher3/util/L1;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/L1;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/picker/WidgetsListHeader;->setExpanded(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 36
    .line 37
    :cond_1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->X1(Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method protected f0()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/views/f;->f0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/views/f;->v:Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    cmpl-float v0, v0, v1

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->Q0:Z

    .line 17
    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iput-boolean v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->Q0:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->M0:Landroid/view/View;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 28
    .line 29
    sget-object v2, Lcom/android/launcher3/O5;->b:Lcom/android/launcher3/O5$c;

    .line 30
    .line 31
    filled-new-array {v2}, [Lcom/android/launcher3/O5$c;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v0, v1, v3}, Lcom/android/launcher3/O5;->a(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 41
    .line 42
    sget-object v1, Lcom/android/launcher3/O5;->c:Lcom/android/launcher3/O5$c;

    .line 43
    .line 44
    filled-new-array {v2, v1}, [Lcom/android/launcher3/O5$c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v0, p0, v1}, Lcom/android/launcher3/O5;->a(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->M0:Landroid/view/View;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 55
    .line 56
    sget-object v2, Lcom/android/launcher3/O5;->b:Lcom/android/launcher3/O5$c;

    .line 57
    .line 58
    filled-new-array {v2}, [Lcom/android/launcher3/O5$c;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v0, v1, v3}, Lcom/android/launcher3/O5;->b(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 68
    .line 69
    sget-object v1, Lcom/android/launcher3/O5;->c:Lcom/android/launcher3/O5$c;

    .line 70
    .line 71
    filled-new-array {v2, v1}, [Lcom/android/launcher3/O5$c;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v0, p0, v1}, Lcom/android/launcher3/O5;->b(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method protected getMaxAvailableHeightForRecommendations()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->h0:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    const p0, 0x7f7fffff    # Float.MAX_VALUE

    .line 6
    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 10
    .line 11
    iget v0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 12
    .line 13
    iget p0, p0, Lcom/android/launcher3/h0;->x2:I

    .line 14
    .line 15
    sub-int/2addr v0, p0

    .line 16
    int-to-float p0, v0

    .line 17
    const v0, 0x3f333333    # 0.7f

    .line 18
    .line 19
    .line 20
    mul-float/2addr p0, v0

    .line 21
    return p0
.end method

.method protected getWidgetListHorizontalMargin()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f070c7a

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method protected getWidgetsToDisplay()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ln2/c;->e()Lo2/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lo2/a;->c()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 18
    .line 19
    check-cast v1, Lcom/android/launcher3/v;

    .line 20
    .line 21
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ln2/c;->e()Lo2/a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lo2/a;->d()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 47
    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    new-instance v2, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 51
    .line 52
    invoke-direct {v2}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 56
    .line 57
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->U0:Landroid/view/View;

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 64
    .line 65
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;->a:Z

    .line 66
    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    return-object v0

    .line 70
    :cond_2
    return-object v1

    .line 71
    :cond_3
    :goto_0
    const/4 v1, 0x0

    .line 72
    iput-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->V0:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$e;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->U0:Landroid/view/View;

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    return-object v0
.end method

.method public i(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->i(I)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->O0:Landroid/widget/ScrollView;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/widget/ScrollView;->getId()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAccessibilityTraversalBefore(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->V()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->g()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->n(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->V()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/s0;->g()V

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->W0:Landroid/widget/TextView;

    .line 38
    .line 39
    const-string p1, ""

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->onDeviceProfileChanged(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Lcom/android/launcher3/widget/picker/i0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/widget/picker/i0;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Lcom/android/launcher3/util/L1;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 7
    .line 8
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->K0:Z

    .line 9
    .line 10
    if-eqz p1, :cond_3

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 13
    .line 14
    const p2, 0x7f0b0362

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Landroid/widget/LinearLayout;

    .line 22
    .line 23
    const p2, 0x7f0b04d0

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    check-cast p3, Landroid/widget/LinearLayout$LayoutParams;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-float p1, p1

    .line 43
    const p4, 0x3ed1eb85    # 0.41f

    .line 44
    .line 45
    .line 46
    mul-float/2addr p1, p4

    .line 47
    float-to-int p1, p1

    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p5

    .line 52
    const/high16 v0, 0x43860000    # 268.0f

    .line 53
    .line 54
    invoke-static {p5, v0}, Lx1/O;->F(Landroid/content/Context;F)I

    .line 55
    .line 56
    .line 57
    move-result p5

    .line 58
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const v1, 0x43c58000    # 395.0f

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Lx1/O;->F(Landroid/content/Context;F)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-ge p1, p5, :cond_0

    .line 70
    .line 71
    iput p5, p3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    if-le p1, v0, :cond_1

    .line 75
    .line 76
    iput v0, p3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    const/4 p1, 0x0

    .line 80
    iput p1, p3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 81
    .line 82
    :goto_0
    iget p1, p3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 83
    .line 84
    if-nez p1, :cond_2

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    const/4 p4, 0x0

    .line 88
    :goto_1
    iput p4, p3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 89
    .line 90
    new-instance p1, Lcom/android/launcher3/widget/picker/g0;

    .line 91
    .line 92
    invoke-direct {p1, p0, p2, p3}, Lcom/android/launcher3/widget/picker/g0;-><init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout$LayoutParams;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 96
    .line 97
    .line 98
    :cond_3
    return-void
.end method

.method protected r1(I)I
    .locals 4

    .line 1
    int-to-double v0, p1

    .line 2
    const-wide v2, 0x3fe570a3d70a3d71L    # 0.67

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    mul-double/2addr v2, v0

    .line 8
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    double-to-int v2, v2

    .line 13
    iget-object v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w0:Lcom/android/launcher3/h0;

    .line 14
    .line 15
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->K0:Z

    .line 16
    .line 17
    if-eqz v3, :cond_2

    .line 18
    .line 19
    const-wide v2, 0x3fd51eb851eb851fL    # 0.33

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    mul-double/2addr v0, v2

    .line 25
    double-to-int v0, v0

    .line 26
    const/high16 v1, 0x43860000    # 268.0f

    .line 27
    .line 28
    invoke-static {v1}, Lcom/android/launcher3/N5;->i(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const v2, 0x43c58000    # 395.0f

    .line 33
    .line 34
    .line 35
    invoke-static {v2}, Lcom/android/launcher3/N5;->i(F)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-ge v0, v1, :cond_0

    .line 40
    .line 41
    move v0, v1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    if-le v0, v2, :cond_1

    .line 44
    .line 45
    move v0, v2

    .line 46
    :cond_1
    :goto_0
    sub-int v2, p1, v0

    .line 47
    .line 48
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const p1, 0x7f070c77

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    sub-int/2addr v2, p0

    .line 60
    return v2
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->setInsets(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 5
    .line 6
    const v0, 0x7f0b04f1

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget v3, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->H0:I

    .line 28
    .line 29
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method protected setViewVisibilityBasedOnSearch(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->setViewVisibilityBasedOnSearch(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->J0:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->K0:Lcom/android/launcher3/widget/picker/WidgetsListHeader;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->callOnClick()Z

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/16 p0, 0x8

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    if-nez p1, :cond_2

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 33
    .line 34
    iget p0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/T;->V()V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method protected v1()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public w()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->w()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->h0:I

    .line 5
    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->S0:Lcom/android/launcher3/util/L1;

    .line 9
    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget v1, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->b:Lcom/android/launcher3/widget/picker/T;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/widget/picker/T;->V()V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->l0:Landroid/util/SparseArray;

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t0:Z

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget v2, p0, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet;->R0:I

    .line 42
    .line 43
    :goto_1
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet$c;->d:Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->g()V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method
