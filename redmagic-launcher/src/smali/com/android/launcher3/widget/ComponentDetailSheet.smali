.class public Lcom/android/launcher3/widget/ComponentDetailSheet;
.super Lcom/android/launcher3/widget/o;
.source "ComponentDetailSheet.java"

# interfaces
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/widget/p0$b;


# static fields
.field private static final j0:Ljava/lang/String; = "ComponentDetailSheet"

.field private static final k0:Landroid/content/ComponentName;


# instance fields
.field private b0:Lcom/android/launcher3/widget/p;

.field private c0:Landroid/widget/ImageView;

.field private d0:Landroid/widget/TextView;

.field private e0:Lcom/android/launcher3/widget/o;

.field private f0:Lz1/Z4;

.field private g0:I

.field private final h0:Landroid/graphics/Rect;

.field private i0:Landroid/widget/Toast;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "com.android.systemui"

    .line 2
    .line 3
    const-string v1, ".people.widget.PeopleSpaceWidgetProvider"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/content/ComponentName;->createRelative(Ljava/lang/String;Ljava/lang/String;)Landroid/content/ComponentName;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lcom/android/launcher3/widget/ComponentDetailSheet;->k0:Landroid/content/ComponentName;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/ComponentDetailSheet;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/o;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->h0:Landroid/graphics/Rect;

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    new-instance p2, Lcom/android/launcher3/widget/p;

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    invoke-direct {p2, p1, p3, p0, p0}, Lcom/android/launcher3/widget/p;-><init>(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    return-void
.end method

.method public static synthetic X0(Lm2/g;Lz1/Z4;Ljava/util/ArrayList;Lz1/Z4;)V
    .locals 1

    .line 1
    iget-object v0, p3, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lm2/g;->i(Landroid/content/ComponentName;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    iget-object p0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p3, Lz1/Z4;->g:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p1, p1, Lz1/Z4;->g:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-object p0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "com.android.settings"

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method

.method public static synthetic Y0(Lm2/g;Lz1/Z4;Ljava/util/ArrayList;Lz1/Z4;)V
    .locals 1

    .line 1
    iget-object v0, p3, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lm2/g;->i(Landroid/content/ComponentName;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    instance-of v0, p0, Lm2/o;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    check-cast p0, Lm2/o;

    .line 24
    .line 25
    invoke-virtual {p0}, Lm2/o;->t()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    :cond_0
    iget-object p0, p3, Lz1/Z4;->g:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p1, p1, Lz1/Z4;->g:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public static synthetic Z0(Lcom/android/launcher3/widget/ComponentDetailSheet;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/a;->announceAccessibilityChanges()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic a1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/widget/o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b1(Lcom/android/launcher3/widget/ComponentDetailSheet;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/ComponentDetailSheet;->f1(ZJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic c1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/anim/q;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic d1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/anim/q;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic e1(Lcom/android/launcher3/widget/ComponentDetailSheet;)Lcom/android/launcher3/anim/q;
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
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->d0()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 31
    .line 32
    iget v1, p0, Lcom/android/launcher3/views/f;->o:F

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    const-wide/16 p2, 0x15e

    .line 51
    .line 52
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 53
    .line 54
    check-cast p1, Lcom/android/launcher3/v;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 61
    .line 62
    int-to-float p1, p1

    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/android/launcher3/views/f;->h0(FFJ)Lcom/android/launcher3/anim/q;

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget-object p2, Lcom/android/launcher3/anim/L;->t:Landroid/view/animation/Interpolator;

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p2, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance p2, Lcom/android/launcher3/widget/ComponentDetailSheet$d;

    .line 105
    .line 106
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/ComponentDetailSheet$d;-><init>(Lcom/android/launcher3/widget/ComponentDetailSheet;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method private h1()V
    .locals 3

    .line 1
    const v0, 0x7f0b017c

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/ImageView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->c0:Landroid/widget/ImageView;

    .line 11
    .line 12
    const v0, 0x7f0b017f

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/widget/TextView;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->d0:Landroid/widget/TextView;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->c0:Landroid/widget/ImageView;

    .line 24
    .line 25
    new-instance v1, Lcom/android/launcher3/widget/ComponentDetailSheet$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/ComponentDetailSheet$a;-><init>(Lcom/android/launcher3/widget/ComponentDetailSheet;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->c0:Landroid/widget/ImageView;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->c0:Landroid/widget/ImageView;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const v2, 0x7f08198e

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->d0:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const v1, 0x7f070219

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    const/4 v1, 0x0

    .line 79
    invoke-virtual {v0, v1, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method

.method private k1(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->U()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const p1, 0x3f19999a    # 0.6f

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move p1, v0

    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->setTranslationShift(F)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutFrozen(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 38
    .line 39
    check-cast p1, Lcom/android/launcher3/v;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 46
    .line 47
    int-to-float p1, p1

    .line 48
    const-wide/16 v1, 0x15e

    .line 49
    .line 50
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/android/launcher3/views/f;->h0(FFJ)Lcom/android/launcher3/anim/q;

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget-object v0, Lcom/android/launcher3/anim/L;->t:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance v0, Lcom/android/launcher3/widget/ComponentDetailSheet$b;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/ComponentDetailSheet$b;-><init>(Lcom/android/launcher3/widget/ComponentDetailSheet;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    sget-object p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->j0:Ljava/lang/String;

    .line 85
    .line 86
    const-string p1, "open: not idle state"

    .line 87
    .line 88
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    new-instance p1, Lcom/android/launcher3/widget/r;

    .line 93
    .line 94
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/r;-><init>(Lcom/android/launcher3/widget/ComponentDetailSheet;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method private setUpperPage(Lcom/android/launcher3/widget/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
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
    .locals 2

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
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->d0()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p1, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const-wide/16 p2, 0xfa

    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0, v0, p2, p3}, Lcom/android/launcher3/views/f;->m0(FJ)Lcom/android/launcher3/anim/q;

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/android/launcher3/touch/g;->h()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget-object p2, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p2, p0, Lcom/android/launcher3/views/f;->l:Landroid/view/animation/Interpolator;

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 85
    .line 86
    .line 87
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    new-instance p2, Lcom/android/launcher3/widget/ComponentDetailSheet$c;

    .line 94
    .line 95
    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/ComponentDetailSheet$c;-><init>(Lcom/android/launcher3/widget/ComponentDetailSheet;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public g1(Lz1/Z4;Ljava/lang/String;ZLcom/android/launcher3/widget/o;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/ComponentDetailSheet;->setTitle(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p4}, Lcom/android/launcher3/widget/ComponentDetailSheet;->setUpperPage(Lcom/android/launcher3/widget/o;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->T()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 12
    .line 13
    invoke-direct {p0, p3}, Lcom/android/launcher3/widget/ComponentDetailSheet;->k1(Z)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/android/launcher3/widget/o;->V:Z

    .line 18
    .line 19
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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
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
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateFull()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-wide/16 v0, 0x15e

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->Y(ZJ)V

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const-wide/16 v0, 0xfa

    .line 21
    .line 22
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->f1(ZJ)V

    .line 23
    .line 24
    .line 25
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->e0:Lcom/android/launcher3/widget/o;

    .line 26
    .line 27
    const/high16 v0, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 34
    .line 35
    return-void
.end method

.method public i1(Lm2/g;Lz1/Z4;I)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->f0:Lz1/Z4;

    .line 2
    .line 3
    iput p3, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->g0:I

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/widget/ComponentDetailSheet;->k0:Landroid/content/ComponentName;

    .line 6
    .line 7
    iget-object v1, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 20
    .line 21
    iget-object p1, p1, Lm2/g;->c:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p2, p1}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v0, p1, Lm2/g;->d:I

    .line 28
    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    new-instance p3, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p1, Lm2/g;->c:Ljava/util/List;

    .line 37
    .line 38
    new-instance v1, Lcom/android/launcher3/widget/s;

    .line 39
    .line 40
    invoke-direct {v1, p1, p2, p3}, Lcom/android/launcher3/widget/s;-><init>(Lm2/g;Lz1/Z4;Ljava/util/ArrayList;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 47
    .line 48
    invoke-virtual {p1, p3}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const/4 p2, 0x2

    .line 53
    if-ne p3, p2, :cond_2

    .line 54
    .line 55
    iget-object p2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 56
    .line 57
    iget-object p1, p1, Lm2/g;->e:Ljava/util/List;

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const/4 p2, 0x3

    .line 64
    if-ne p3, p2, :cond_3

    .line 65
    .line 66
    iget-object p2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 67
    .line 68
    iget-object p1, p1, Lm2/g;->f:Ljava/util/List;

    .line 69
    .line 70
    invoke-virtual {p2, p1}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_0
    const p1, 0x7f0b0643

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Landroid/widget/TextView;

    .line 81
    .line 82
    if-eqz p1, :cond_5

    .line 83
    .line 84
    sget-object p2, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/widget/TextView;->setSingleLine()V

    .line 90
    .line 91
    .line 92
    const/4 p2, 0x1

    .line 93
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setFocusableInTouchMode(Z)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/widget/p;->l()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_4

    .line 109
    .line 110
    const/4 p0, 0x0

    .line 111
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_4
    const/16 p0, 0x8

    .line 116
    .line 117
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 118
    .line 119
    .line 120
    :cond_5
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x20000000

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

.method public j1(Lz1/Z4;I)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->f0:Lz1/Z4;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->g0:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/v;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getWidgetPickerDataProvider()Ln2/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ln2/c;->j()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz v1, :cond_5

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lm2/g;

    .line 33
    .line 34
    iget-object v3, v1, Lm2/g;->c:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lz1/Z4;

    .line 41
    .line 42
    iget-object v4, v3, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 43
    .line 44
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v5, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 49
    .line 50
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-eqz v4, :cond_0

    .line 59
    .line 60
    sget-object v4, Lcom/android/launcher3/widget/ComponentDetailSheet;->k0:Landroid/content/ComponentName;

    .line 61
    .line 62
    iget-object v5, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-eqz v5, :cond_1

    .line 69
    .line 70
    iget-object v3, v3, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 71
    .line 72
    invoke-virtual {v4, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-eqz v3, :cond_0

    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 79
    .line 80
    iget-object p2, v1, Lm2/g;->c:Ljava/util/List;

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_1
    iget-object v3, v3, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 87
    .line 88
    invoke-virtual {v4, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-eqz v3, :cond_2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    iget v0, v1, Lm2/g;->d:I

    .line 96
    .line 97
    if-lez v0, :cond_3

    .line 98
    .line 99
    new-instance p2, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    iget-object v0, v1, Lm2/g;->c:Ljava/util/List;

    .line 105
    .line 106
    new-instance v3, Lcom/android/launcher3/widget/q;

    .line 107
    .line 108
    invoke-direct {v3, v1, p1, p2}, Lcom/android/launcher3/widget/q;-><init>(Lm2/g;Lz1/Z4;Ljava/util/ArrayList;)V

    .line 109
    .line 110
    .line 111
    invoke-interface {v0, v3}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    const/4 p1, 0x2

    .line 121
    if-ne p2, p1, :cond_4

    .line 122
    .line 123
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 124
    .line 125
    iget-object p2, v1, Lm2/g;->e:Ljava/util/List;

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    const/4 p1, 0x3

    .line 132
    if-ne p2, p1, :cond_5

    .line 133
    .line 134
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 135
    .line 136
    iget-object p2, v1, Lm2/g;->f:Ljava/util/List;

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/p;->k(Ljava/util/List;)V

    .line 139
    .line 140
    .line 141
    :cond_5
    :goto_1
    const p1, 0x7f0b0643

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    check-cast p1, Landroid/widget/TextView;

    .line 149
    .line 150
    if-eqz p1, :cond_7

    .line 151
    .line 152
    sget-object p2, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/widget/TextView;->setSingleLine()V

    .line 158
    .line 159
    .line 160
    const/4 p2, 0x1

    .line 161
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setFocusableInTouchMode(Z)V

    .line 168
    .line 169
    .line 170
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 171
    .line 172
    invoke-virtual {p0}, Lcom/android/launcher3/widget/p;->l()Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_6

    .line 177
    .line 178
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_6
    const/16 p0, 0x8

    .line 183
    .line 184
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 185
    .line 186
    .line 187
    :cond_7
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->i0:Landroid/widget/Toast;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/Toast;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const v0, 0x7f1400fa

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, v0}, Lcom/android/launcher3/N5;->h0(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->i0:Landroid/widget/Toast;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {v0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->T:Landroid/graphics/PointF;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->S:Landroid/graphics/PointF;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/widget/a;->getScrollbar()Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/android/launcher3/widget/ComponentRecyclerViewFastScroller;->getThumbOffsetY()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-ltz v3, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3, v2, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v3, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-virtual {v2, v3, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    iget-object v2, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v2, p1, v3}, Lcom/android/launcher3/widget/a;->q(Landroid/view/MotionEvent;Landroid/view/View;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-nez v2, :cond_1

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->y0(Landroid/view/MotionEvent;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-nez v2, :cond_1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    move v1, v0

    .line 88
    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v2, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 96
    .line 97
    invoke-virtual {v0, v2, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_4

    .line 102
    .line 103
    iput-boolean v1, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/4 v2, 0x2

    .line 111
    if-ne v0, v2, :cond_4

    .line 112
    .line 113
    iget-object v0, p0, Lcom/android/launcher3/widget/o;->T:Landroid/graphics/PointF;

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    invoke-virtual {v0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/o;->x0(Landroid/view/MotionEvent;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    xor-int/2addr v0, v1

    .line 131
    iput-boolean v0, p0, Lcom/android/launcher3/views/f;->s:Z

    .line 132
    .line 133
    :cond_4
    :goto_1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/f;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/f;->h:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/o;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/widget/ComponentDetailSheet;->h1()V

    .line 5
    .line 6
    .line 7
    const v0, 0x7f0b0187

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/view/ViewGroup;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    .line 17
    .line 18
    const v0, 0x7f0b0180

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/widget/LinearLayout;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/widget/o;->N:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    const v0, 0x7f0b017d

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/android/launcher3/widget/o;->U:Landroid/view/View;

    .line 37
    .line 38
    const v0, 0x7f0b017e

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->b0:Lcom/android/launcher3/widget/p;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/ComponentsRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->V0()V

    .line 55
    .line 56
    .line 57
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
    invoke-virtual {p0}, Lcom/android/launcher3/widget/ComponentDetailSheet;->getUpperPage()Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/widget/o;->O0(Landroid/view/View;Lcom/android/launcher3/widget/o;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/o;->M:Lcom/android/launcher3/widget/ComponentsRecyclerView;

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateFull()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->getIsSheetStateHalf()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->W0()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->h0:Landroid/graphics/Rect;

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
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 27
    .line 28
    .line 29
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 30
    .line 31
    if-lez p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->T0()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->z0()V

    .line 38
    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->d0:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->f0:Lz1/Z4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;->g0:I

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->j1(Lz1/Z4;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
