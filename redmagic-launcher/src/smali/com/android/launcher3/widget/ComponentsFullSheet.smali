.class public Lcom/android/launcher3/widget/ComponentsFullSheet;
.super Lcom/android/launcher3/widget/o;
.source "ComponentsFullSheet.java"

# interfaces
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/widget/p0$b;
.implements Lcom/android/launcher3/menu/c$a;
.implements Lp2/a;
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field protected b0:Lcom/android/launcher3/widget/C;

.field private c0:Landroid/widget/TextView;

.field private d0:Landroid/widget/ImageView;

.field private final e0:Landroid/graphics/Rect;

.field private f0:Lcom/android/launcher3/widget/o;

.field private g0:J

.field private h0:Landroid/view/View;

.field private i0:Z

.field protected j0:Landroid/view/View;

.field protected k0:Lcom/android/launcher3/widget/picker/search/b;

.field private l0:Lcom/android/launcher3/ExtendedEditText;

.field private m0:Z

.field private n0:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/o;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->e0:Landroid/graphics/Rect;

    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/4 p2, 0x0

    invoke-static {p1, p0, p2}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    return-void
.end method

.method public static synthetic X0(Lm2/g;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lm2/o;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Y0(Lcom/android/launcher3/widget/ComponentsFullSheet;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z0(Ljava/util/ArrayList;Lm2/g;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lm2/g;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method static bridge synthetic a1(Lcom/android/launcher3/widget/ComponentsFullSheet;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/ComponentsFullSheet;->f1(ZJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b1(Lcom/android/launcher3/widget/ComponentsFullSheet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->k1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c1(Lcom/android/launcher3/widget/ComponentsFullSheet;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic d1(Lcom/android/launcher3/widget/ComponentsFullSheet;)Lcom/android/launcher3/anim/q;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic e1(Lcom/android/launcher3/widget/ComponentsFullSheet;)Lcom/android/launcher3/anim/q;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    return-object p0
.end method

.method private f1(ZJ)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 7
    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-nez p1, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->h0:Landroid/view/View;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    instance-of p2, p1, Lcom/android/launcher3/widget/o;

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    check-cast p1, Lcom/android/launcher3/widget/o;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p1, p2}, Lcom/android/launcher3/a;->close(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->d0()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->h0:Landroid/view/View;

    .line 41
    .line 42
    instance-of v1, p1, Lcom/android/launcher3/widget/o;

    .line 43
    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    check-cast p1, Lcom/android/launcher3/widget/o;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    const/4 p1, 0x0

    .line 50
    :goto_0
    if-nez p1, :cond_4

    .line 51
    .line 52
    :goto_1
    return-void

    .line 53
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_5

    .line 58
    .line 59
    iget v1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_6

    .line 74
    .line 75
    const-wide/16 p2, 0x15e

    .line 76
    .line 77
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 78
    .line 79
    check-cast p1, Lcom/android/launcher3/v;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 86
    .line 87
    int-to-float p1, p1

    .line 88
    const/4 v0, 0x0

    .line 89
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/android/launcher3/views/f;->h0(FFJ)Lcom/android/launcher3/anim/q;

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_7

    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget-object p2, Lcom/android/launcher3/anim/L;->t:Landroid/view/animation/Interpolator;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p2, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 121
    .line 122
    .line 123
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    new-instance p2, Lcom/android/launcher3/widget/ComponentsFullSheet$d;

    .line 130
    .line 131
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/ComponentsFullSheet$d;-><init>(Lcom/android/launcher3/widget/ComponentsFullSheet;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method private h1()V
    .locals 3

    .line 1
    const v0, 0x7f0b017f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/TextView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->c0:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const v2, 0x7f1400fc

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->c0:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const v1, 0x7f070219

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-virtual {v0, v1, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method private k1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->h0:Landroid/view/View;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    instance-of v1, v0, Lcom/android/launcher3/menu/MenuContainer;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    check-cast v0, Lcom/android/launcher3/menu/MenuContainer;

    .line 27
    .line 28
    sget-object v1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 41
    .line 42
    .line 43
    const/high16 v1, 0x3f800000    # 1.0f

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const/4 v0, 0x1

    .line 71
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public E(Z)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->m0:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/ComponentsFullSheet;->setViewVisibilityBasedOnSearch(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public K(Z)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewExisted-widget "

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "ComponentsFullSheet"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1, v2}, Lcom/android/launcher3/widget/C;->p(Ljava/util/ArrayList;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 34
    .line 35
    .line 36
    new-instance p1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/launcher3/widget/C;->getItemCount()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->f0:Lcom/android/launcher3/widget/o;

    .line 65
    .line 66
    const-wide/16 v0, 0x10b

    .line 67
    .line 68
    const/4 v3, 0x0

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    invoke-virtual {p1, v3, v0, v1}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 75
    .line 76
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    const/high16 v4, 0x20000000

    .line 79
    .line 80
    invoke-static {p1, v4}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    instance-of v4, p1, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 85
    .line 86
    if-eqz v4, :cond_2

    .line 87
    .line 88
    check-cast p1, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 89
    .line 90
    invoke-virtual {p1, v3, v0, v1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->Y(ZJ)V

    .line 91
    .line 92
    .line 93
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->d0()V

    .line 94
    .line 95
    .line 96
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 102
    .line 103
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object p0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 108
    .line 109
    invoke-virtual {p1, p0, v2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public L()V
    .locals 0

    .line 1
    return-void
.end method

.method protected N0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method protected Q0(Lcom/android/launcher3/widget/WidgetCell;I)V
    .locals 0

    .line 1
    return-void
.end method

.method protected X(Landroid/content/Context;)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public Y(ZJ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 7
    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->d0()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->k1()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const-wide/16 p2, 0x64

    .line 33
    .line 34
    :goto_0
    invoke-virtual {p0, v0, p2, p3}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object p2, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
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
    new-instance p2, Lcom/android/launcher3/widget/ComponentsFullSheet$b;

    .line 55
    .line 56
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/ComponentsFullSheet$b;-><init>(Lcom/android/launcher3/widget/ComponentsFullSheet;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method protected d0()V
    .locals 4

    .line 1
    const-string v0, "onCloseComplete"

    .line 2
    .line 3
    const-string v1, "ComponentsFullSheet"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/C;->p(Ljava/util/ArrayList;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v3, "onCloseComplete\uff0cwidget "

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/android/launcher3/widget/C;->getItemCount()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 48
    .line 49
    check-cast v0, Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->i3()V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 64
    .line 65
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 70
    .line 71
    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Recycler;)V

    .line 72
    .line 73
    .line 74
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->d0()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public f(ILandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/high16 p2, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    int-to-long p1, p1

    .line 14
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g1(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lm2/g;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/android/launcher3/widget/v0;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 14
    .line 15
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    move-object v6, p0

    .line 24
    move-object v7, p0

    .line 25
    move-object v5, p0

    .line 26
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/widget/v0;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Ls1/P;Lcom/android/launcher3/widget/ComponentsFullSheet;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, v5, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 30
    .line 31
    iget-object p0, v5, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/android/launcher3/widget/ComponentsRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v5, p0

    .line 38
    :goto_0
    const/4 p0, 0x1

    .line 39
    iput-boolean p0, v5, Lcom/android/launcher3/widget/ComponentsFullSheet;->n0:Z

    .line 40
    .line 41
    invoke-virtual {v5}, Lcom/android/launcher3/views/f;->T()V

    .line 42
    .line 43
    .line 44
    iget-object p0, v5, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/C;->p(Ljava/util/ArrayList;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, v5, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iget-object v0, v5, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v1, v5, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const v3, 0x7f0701ed

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method protected getAccessibilityTarget()Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const p0, 0x7f140493

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const p0, 0x7f140494

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {v1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public getUpperPage()Lcom/android/launcher3/widget/o;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->h0:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/android/launcher3/widget/o;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/widget/o;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method protected getWidgetsToDisplay()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lm2/g;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/v;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ln2/c;->e()Lo2/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lo2/a;->c()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/C2;->l4(Lcom/android/launcher3/util/L1;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected handleClose(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->h0:Landroid/view/View;

    .line 2
    .line 3
    const-wide/16 v1, 0x10b

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    instance-of v3, v0, Lcom/android/launcher3/widget/o;

    .line 8
    .line 9
    if-eqz v3, :cond_1

    .line 10
    .line 11
    check-cast v0, Lcom/android/launcher3/widget/o;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-wide/16 v0, 0xfa

    .line 20
    .line 21
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/widget/ComponentsFullSheet;->f1(ZJ)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0, p1, v1, v2}, Lcom/android/launcher3/widget/ComponentsFullSheet;->Y(ZJ)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0, p1, v1, v2}, Lcom/android/launcher3/widget/ComponentsFullSheet;->Y(ZJ)V

    .line 30
    .line 31
    .line 32
    :goto_0
    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 34
    .line 35
    return-void
.end method

.method public i1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->n0:Z

    .line 2
    .line 3
    return p0
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x10000000

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public j()V
    .locals 11

    .line 1
    const v0, 0x7f0b0517

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->j0:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->j0:Landroid/view/View;

    .line 21
    .line 22
    check-cast v1, Landroid/view/ViewGroup;

    .line 23
    .line 24
    const v2, 0x7f0e026f

    .line 25
    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    const v0, 0x7f0b06a2

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/android/launcher3/widget/picker/search/b;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->k0:Lcom/android/launcher3/widget/picker/search/b;

    .line 41
    .line 42
    new-instance v1, Lcom/android/launcher3/widget/ComponentsFullSheet$a;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/ComponentsFullSheet$a;-><init>(Lcom/android/launcher3/widget/ComponentsFullSheet;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v0, v1, p0}, Lcom/android/launcher3/widget/picker/search/b;->a(Lcom/android/launcher3/widget/picker/search/b$a;Lp2/a;)V

    .line 48
    .line 49
    .line 50
    const v0, 0x7f0b06a3

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/android/launcher3/ExtendedEditText;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const v4, 0x7f0811e6

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v4, v2}, Lcom/android/launcher3/N5;->S(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 82
    .line 83
    const/16 v1, 0x10

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setGravity(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Lcom/android/launcher3/ExtendedEditText;->g(Landroid/view/View$OnFocusChangeListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 94
    .line 95
    if-nez v0, :cond_0

    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v4, Lcom/android/launcher3/widget/C;

    .line 104
    .line 105
    iget-object v5, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 106
    .line 107
    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    move-object v9, p0

    .line 116
    move-object v10, p0

    .line 117
    move-object v8, p0

    .line 118
    invoke-direct/range {v4 .. v10}, Lcom/android/launcher3/widget/C;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Ls1/P;Lcom/android/launcher3/widget/ComponentsFullSheet;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    .line 119
    .line 120
    .line 121
    iput-object v4, v8, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 122
    .line 123
    iget-object p0, v8, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 124
    .line 125
    invoke-virtual {p0, v4}, Lcom/android/launcher3/widget/ComponentsRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_0
    move-object v8, p0

    .line 130
    :goto_0
    invoke-virtual {v8}, Lcom/android/launcher3/views/f;->T()V

    .line 131
    .line 132
    .line 133
    iget-object p0, v8, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 134
    .line 135
    check-cast p0, Lcom/android/launcher3/v;

    .line 136
    .line 137
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Ln2/c;->k()Ljava/util/ArrayList;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_2

    .line 150
    .line 151
    iget-object v0, v8, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 152
    .line 153
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/C;->p(Ljava/util/ArrayList;)V

    .line 154
    .line 155
    .line 156
    iget-object p0, v8, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 157
    .line 158
    check-cast p0, Lcom/android/launcher3/v;

    .line 159
    .line 160
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    if-eqz p0, :cond_1

    .line 165
    .line 166
    invoke-static {}, Lx1/O;->o1()Z

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    if-nez p0, :cond_1

    .line 171
    .line 172
    iget-object p0, v8, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 173
    .line 174
    check-cast p0, Lcom/android/launcher3/v;

    .line 175
    .line 176
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    const/4 v0, 0x0

    .line 181
    invoke-virtual {p0, v0}, Ln2/c;->l(Ln2/c$a;)V

    .line 182
    .line 183
    .line 184
    :cond_1
    return-void

    .line 185
    :cond_2
    iput-boolean v3, v8, Lcom/android/launcher3/widget/ComponentsFullSheet;->i0:Z

    .line 186
    .line 187
    return-void
.end method

.method protected j1(Z)V
    .locals 4

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->h0:Landroid/view/View;

    .line 7
    .line 8
    instance-of v0, p1, Lcom/android/launcher3/widget/o;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/android/launcher3/widget/o;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const v0, 0x3f19999a    # 0.6f

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    move v0, v1

    .line 31
    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutFrozen(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->h()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 49
    .line 50
    check-cast v0, Lcom/android/launcher3/v;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 57
    .line 58
    int-to-float v0, v0

    .line 59
    const-wide/16 v2, 0x10b

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/launcher3/views/f;->h0(FFJ)Lcom/android/launcher3/anim/q;

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget-object v1, Lcom/android/launcher3/anim/L;->t:Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Lcom/android/launcher3/widget/ComponentsFullSheet$c;

    .line 82
    .line 83
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/ComponentsFullSheet$c;-><init>(Lcom/android/launcher3/widget/ComponentsFullSheet;Lcom/android/launcher3/widget/o;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    const-string p0, "ComponentsFullSheet"

    .line 96
    .line 97
    const-string p1, "open: not idle state"

    .line 98
    .line 99
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    new-instance p1, Lcom/android/launcher3/widget/y;

    .line 104
    .line 105
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/y;-><init>(Lcom/android/launcher3/widget/ComponentsFullSheet;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public l1(Landroid/view/View;)Lcom/android/launcher3/widget/ComponentsFullSheet;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->h0:Landroid/view/View;

    .line 12
    .line 13
    return-object p0
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
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v1, Lcom/android/launcher3/widget/w;

    .line 15
    .line 16
    invoke-direct {v1}, Lcom/android/launcher3/widget/w;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v1, Lcom/android/launcher3/widget/x;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Lcom/android/launcher3/widget/x;-><init>(Ljava/util/ArrayList;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/C;->p(Ljava/util/ArrayList;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->o1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->i0:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    :goto_0
    invoke-static {}, Lx1/O;->o1()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 23
    .line 24
    check-cast v0, Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/l0;->q(Lcom/android/launcher3/widget/p0$b;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->h()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->g0:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    const-wide/16 v4, 0x12c

    .line 10
    .line 11
    cmp-long v2, v2, v4

    .line 12
    .line 13
    if-gez v2, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    iput-wide v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->g0:J

    .line 18
    .line 19
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    check-cast p1, Lcom/android/launcher3/widget/WidgetCellMfv;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCellMfv;->getWidgetItem()Lz1/Z4;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iget-object v1, v0, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x0

    .line 43
    const/4 v3, 0x1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lh1/a;->o()V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 50
    .line 51
    check-cast v1, Lcom/android/launcher3/v;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v4, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 58
    .line 59
    check-cast v4, Lcom/android/launcher3/v;

    .line 60
    .line 61
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    const v5, 0x7f0e0096

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v5, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 73
    .line 74
    iput-object v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->f0:Lcom/android/launcher3/widget/o;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCellMfv;->getWidgetNameText()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v1, v0, p1, v3, p0}, Lcom/android/launcher3/widget/CustomTransformSheet;->e1(Lz1/Z4;Ljava/lang/String;ZLcom/android/launcher3/widget/ComponentsFullSheet;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 85
    .line 86
    check-cast v1, Lcom/android/launcher3/v;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v4, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 93
    .line 94
    check-cast v4, Lcom/android/launcher3/v;

    .line 95
    .line 96
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const v5, 0x7f0e0089

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, v5, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 108
    .line 109
    iput-object v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->f0:Lcom/android/launcher3/widget/o;

    .line 110
    .line 111
    invoke-virtual {v1, v0, v3}, Lcom/android/launcher3/widget/ComponentDetailSheet;->j1(Lz1/Z4;I)V

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->f0:Lcom/android/launcher3/widget/o;

    .line 115
    .line 116
    check-cast v1, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCellMfv;->getWidgetNameText()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {v1, v0, p1, v3, p0}, Lcom/android/launcher3/widget/ComponentDetailSheet;->g1(Lz1/Z4;Ljava/lang/String;ZLcom/android/launcher3/widget/o;)V

    .line 123
    .line 124
    .line 125
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 126
    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/widget/EditText;->hasFocus()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_4

    .line 134
    .line 135
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 136
    .line 137
    invoke-virtual {p0}, Landroid/widget/EditText;->clearFocus()V

    .line 138
    .line 139
    .line 140
    :cond_4
    :goto_1
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/o;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    instance-of p1, p0, Lcom/android/launcher3/widget/v0;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onControllerInterceptTouchEvent: ev = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "ComponentsFullSheet"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x1

    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->T:Landroid/graphics/PointF;

    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 56
    .line 57
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/android/launcher3/widget/a;->getScrollbar()Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->getThumbOffsetY()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-ltz v3, :cond_0

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3, v2, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_0

    .line 78
    .line 79
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iget-object v3, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 87
    .line 88
    invoke-virtual {v2, v3, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-eqz v2, :cond_2

    .line 93
    .line 94
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v2, p1, v3}, Lcom/android/launcher3/widget/a;->q(Landroid/view/MotionEvent;Landroid/view/View;)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-nez v2, :cond_1

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->y0(Landroid/view/MotionEvent;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-nez v2, :cond_1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    move v1, v0

    .line 114
    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object v2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 122
    .line 123
    invoke-virtual {v0, v2, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_3

    .line 128
    .line 129
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 130
    .line 131
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->k0:Lcom/android/launcher3/widget/picker/search/b;

    .line 132
    .line 133
    if-eqz v0, :cond_5

    .line 134
    .line 135
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/search/b;->b()Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_5

    .line 140
    .line 141
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->j0:Landroid/view/View;

    .line 142
    .line 143
    if-eqz v0, :cond_5

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object v1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->j0:Landroid/view/View;

    .line 150
    .line 151
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_5

    .line 156
    .line 157
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->k0:Lcom/android/launcher3/widget/picker/search/b;

    .line 158
    .line 159
    invoke-interface {v0}, Lcom/android/launcher3/widget/picker/search/b;->c()V

    .line 160
    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    const/4 v2, 0x2

    .line 168
    if-ne v0, v2, :cond_5

    .line 169
    .line 170
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->T:Landroid/graphics/PointF;

    .line 171
    .line 172
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    invoke-virtual {v0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->x0(Landroid/view/MotionEvent;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    xor-int/2addr v0, v1

    .line 188
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 189
    .line 190
    :cond_5
    :goto_2
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onControllerTouchEvent: mSwipeDetecto="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "ComponentsFullSheet"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lx1/O;->o1()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 11
    .line 12
    check-cast v0, Lcom/android/launcher3/C2;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Lcom/android/launcher3/widget/l0;->N(Lcom/android/launcher3/widget/p0$b;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/widget/o;->onDragStart(ZF)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/widget/EditText;->hasFocus()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->l0:Lcom/android/launcher3/ExtendedEditText;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/EditText;->clearFocus()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->h1()V

    .line 5
    .line 6
    .line 7
    const v0, 0x7f0b017c

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/ImageView;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->d0:Landroid/widget/ImageView;

    .line 17
    .line 18
    const v0, 0x7f0b0187

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/view/ViewGroup;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 28
    .line 29
    const v0, 0x7f0b0182

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 39
    .line 40
    const v0, 0x7f0b0180

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/widget/LinearLayout;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    const v0, 0x7f0b017d

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Lcom/android/launcher3/widget/o;->U:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->V0()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/ExtendedEditText;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/ExtendedEditText;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/ExtendedEditText;->j()V

    .line 10
    .line 11
    .line 12
    :cond_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    cmpl-float p1, p1, p2

    .line 20
    .line 21
    if-ltz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 24
    .line 25
    .line 26
    iget p1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 27
    .line 28
    sub-float p1, p2, p1

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {p2, p1}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    invoke-virtual {p0, p2, v0, v1}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget-object p2, Lcom/android/launcher3/anim/L;->g:Landroid/view/animation/Interpolator;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget p2, p0, Lcom/android/launcher3/views/f;->o:F

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    int-to-float p3, p3

    .line 21
    mul-float/2addr p2, p3

    .line 22
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->S0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/android/launcher3/widget/WidgetCell;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, v0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const p1, 0x7f1400fb

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->getUpperPage()Lcom/android/launcher3/widget/o;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/widget/o;->O0(Landroid/view/View;Lcom/android/launcher3/widget/o;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

.method public p(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onViewEntered-widget "

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "ComponentsFullSheet"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x1

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->c()V

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    return-void
.end method

.method public setChildSheet(Lcom/android/launcher3/widget/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->f0:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->e0:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iget-object v3, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    .line 25
    .line 26
    iget-object v5, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 27
    .line 28
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    add-int/2addr v4, v5

    .line 33
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 34
    .line 35
    .line 36
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 37
    .line 38
    if-lez p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->T0()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->z0()V

    .line 45
    .line 46
    .line 47
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public setToolBar(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->c0:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->d0:Landroid/widget/ImageView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->d0:Landroid/widget/ImageView;

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/widget/ComponentsFullSheet$e;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/ComponentsFullSheet$e;-><init>(Lcom/android/launcher3/widget/ComponentsFullSheet;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method protected setViewVisibilityBasedOnSearch(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->m0:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->w()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->m0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->n(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->setViewVisibilityBasedOnSearch(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->b0:Lcom/android/launcher3/widget/C;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    instance-of v1, v0, Lcom/android/launcher3/widget/v0;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 10
    .line 11
    check-cast v1, Lcom/android/launcher3/v;

    .line 12
    .line 13
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ln2/c;->k()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/C;->p(Ljava/util/ArrayList;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->i0:Z

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;->i0:Z

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 32
    .line 33
    check-cast v0, Lcom/android/launcher3/v;

    .line 34
    .line 35
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 42
    .line 43
    check-cast p0, Lcom/android/launcher3/v;

    .line 44
    .line 45
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p0, v0}, Ln2/c;->l(Ln2/c$a;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method
