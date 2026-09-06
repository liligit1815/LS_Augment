.class public Lcom/android/launcher3/menu/MenuContainer;
.super Landroid/widget/FrameLayout;
.source "MenuContainer.java"

# interfaces
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/menu/c$a;


# instance fields
.field private A:I

.field private B:I

.field private C:Landroid/view/ViewGroup;

.field private D:Lcom/android/launcher3/menu/c;

.field private E:J

.field private F:Z

.field private G:Landroid/view/View;

.field private H:Landroid/animation/AnimatorSet;

.field private g:Lcom/android/launcher3/views/k;

.field private h:Landroid/content/res/Resources;

.field private i:Landroid/view/View;

.field private j:Landroid/view/View;

.field private k:Landroid/view/View;

.field private l:Landroid/view/View;

.field private m:Landroid/widget/LinearLayout;

.field private n:Lcom/android/launcher3/menu/MenuWallpaper;

.field private o:Lcom/android/launcher3/menu/MenuEffect;

.field private p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

.field private q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

.field private r:Landroid/animation/TimeInterpolator;

.field private s:Landroid/view/animation/Interpolator;

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    iput-boolean p2, p0, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v0, p2}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->D:Lcom/android/launcher3/menu/c;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->u()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private A(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x0

    .line 7
    aget v1, v1, v2

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    const/4 v4, 0x1

    .line 14
    aget v3, v3, v4

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 31
    .line 32
    int-to-float p3, v1

    .line 33
    new-array v0, v4, [F

    .line 34
    .line 35
    aput p3, v0, v2

    .line 36
    .line 37
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 43
    .line 44
    int-to-float p3, v3

    .line 45
    new-array v0, v4, [F

    .line 46
    .line 47
    aput p3, v0, v2

    .line 48
    .line 49
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 55
    .line 56
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    const/4 v1, 0x0

    .line 65
    if-eqz p2, :cond_2

    .line 66
    .line 67
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 68
    .line 69
    neg-int p3, p3

    .line 70
    int-to-float p3, p3

    .line 71
    new-array v0, v0, [F

    .line 72
    .line 73
    aput v1, v0, v2

    .line 74
    .line 75
    aput p3, v0, v4

    .line 76
    .line 77
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    goto :goto_0

    .line 82
    :cond_2
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 83
    .line 84
    neg-int p3, p3

    .line 85
    int-to-float p3, p3

    .line 86
    new-array v0, v0, [F

    .line 87
    .line 88
    aput v1, v0, v2

    .line 89
    .line 90
    aput p3, v0, v4

    .line 91
    .line 92
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->r:Landroid/animation/TimeInterpolator;

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 99
    .line 100
    .line 101
    iget p0, p0, Lcom/android/launcher3/menu/MenuContainer;->x:I

    .line 102
    .line 103
    int-to-long p2, p0

    .line 104
    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 105
    .line 106
    .line 107
    return-object p1
.end method

.method private B(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x0

    .line 7
    aget v1, v1, v2

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    const/4 v4, 0x1

    .line 14
    aget v3, v3, v4

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 32
    .line 33
    neg-int p3, p3

    .line 34
    int-to-float p3, p3

    .line 35
    new-array v0, v0, [F

    .line 36
    .line 37
    aput p3, v0, v2

    .line 38
    .line 39
    aput v5, v0, v4

    .line 40
    .line 41
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 47
    .line 48
    neg-int p3, p3

    .line 49
    int-to-float p3, p3

    .line 50
    new-array v0, v0, [F

    .line 51
    .line 52
    aput p3, v0, v2

    .line 53
    .line 54
    aput v5, v0, v4

    .line 55
    .line 56
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    instance-of p2, p1, Lcom/android/launcher3/widget/o;

    .line 62
    .line 63
    if-eqz p2, :cond_2

    .line 64
    .line 65
    check-cast p1, Lcom/android/launcher3/widget/o;

    .line 66
    .line 67
    sget-object p2, Lcom/android/launcher3/views/f;->C:Landroid/util/FloatProperty;

    .line 68
    .line 69
    new-array p3, v4, [F

    .line 70
    .line 71
    aput v5, p3, v2

    .line 72
    .line 73
    invoke-static {p1, p2, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iget-object p3, p0, Lcom/android/launcher3/menu/MenuContainer;->s:Landroid/view/animation/Interpolator;

    .line 78
    .line 79
    invoke-virtual {p2, p3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 80
    .line 81
    .line 82
    iget p3, p0, Lcom/android/launcher3/menu/MenuContainer;->w:I

    .line 83
    .line 84
    int-to-long v0, p3

    .line 85
    invoke-virtual {p2, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 86
    .line 87
    .line 88
    new-instance p3, Lcom/android/launcher3/menu/MenuContainer$b;

    .line 89
    .line 90
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/menu/MenuContainer$b;-><init>(Lcom/android/launcher3/menu/MenuContainer;Lcom/android/launcher3/widget/o;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2, p3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 94
    .line 95
    .line 96
    return-object p2

    .line 97
    :cond_2
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 98
    .line 99
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-eqz p2, :cond_3

    .line 108
    .line 109
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 110
    .line 111
    mul-int/2addr v1, v0

    .line 112
    int-to-float p3, v1

    .line 113
    new-array v0, v0, [F

    .line 114
    .line 115
    aput p3, v0, v2

    .line 116
    .line 117
    aput v5, v0, v4

    .line 118
    .line 119
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    goto :goto_0

    .line 124
    :cond_3
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 125
    .line 126
    mul-int/2addr v3, v0

    .line 127
    int-to-float p3, v3

    .line 128
    new-array v0, v0, [F

    .line 129
    .line 130
    aput p3, v0, v2

    .line 131
    .line 132
    aput v5, v0, v4

    .line 133
    .line 134
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->s:Landroid/view/animation/Interpolator;

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 141
    .line 142
    .line 143
    iget p0, p0, Lcom/android/launcher3/menu/MenuContainer;->w:I

    .line 144
    .line 145
    int-to-long p2, p0

    .line 146
    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 147
    .line 148
    .line 149
    return-object p1
.end method

.method private G()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const v1, 0x7f0b02e3

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/LinearLayout;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 37
    .line 38
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->N0:Z

    .line 43
    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    const v2, 0x7f0706da

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const v2, 0x7f0706d9

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-virtual {v2, v1, v3, v1, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 73
    .line 74
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 85
    .line 86
    const v2, 0x7f07098a

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    goto :goto_1

    .line 94
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 95
    .line 96
    const v2, 0x7f070988

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    :goto_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_4

    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 114
    .line 115
    const v2, 0x7f070989

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    :cond_4
    new-instance v2, Lcom/android/launcher3/menu/d;

    .line 123
    .line 124
    invoke-direct {v2}, Lcom/android/launcher3/menu/d;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-direct {p0, v1, v0, v2}, Lcom/android/launcher3/menu/MenuContainer;->s(IILandroid/view/View$OnLongClickListener;)V

    .line 128
    .line 129
    .line 130
    invoke-direct {p0, v1, v0, v2}, Lcom/android/launcher3/menu/MenuContainer;->o(IILandroid/view/View$OnLongClickListener;)V

    .line 131
    .line 132
    .line 133
    invoke-direct {p0, v1, v0, v2}, Lcom/android/launcher3/menu/MenuContainer;->t(IILandroid/view/View$OnLongClickListener;)V

    .line 134
    .line 135
    .line 136
    invoke-direct {p0, v1, v0, v2}, Lcom/android/launcher3/menu/MenuContainer;->r(IILandroid/view/View$OnLongClickListener;)V

    .line 137
    .line 138
    .line 139
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->N()V

    .line 140
    .line 141
    .line 142
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->O()V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 146
    .line 147
    check-cast v0, Landroid/content/Context;

    .line 148
    .line 149
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->Q0()Z

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 161
    .line 162
    if-nez v0, :cond_5

    .line 163
    .line 164
    const v0, 0x7f0b03a8

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Lcom/android/launcher3/menu/MenuEffect;

    .line 172
    .line 173
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 174
    .line 175
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 176
    .line 177
    if-nez v0, :cond_6

    .line 178
    .line 179
    const v0, 0x7f0b03a9

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 187
    .line 188
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 189
    .line 190
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 191
    .line 192
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_8

    .line 201
    .line 202
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 203
    .line 204
    const/4 v1, -0x1

    .line 205
    const/4 v2, -0x2

    .line 206
    const v3, 0x800005

    .line 207
    .line 208
    .line 209
    const/4 v4, 0x0

    .line 210
    if-eqz v0, :cond_7

    .line 211
    .line 212
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 217
    .line 218
    iget v5, p0, Lcom/android/launcher3/menu/MenuContainer;->t:I

    .line 219
    .line 220
    invoke-virtual {v0, v4, v4, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 221
    .line 222
    .line 223
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 224
    .line 225
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 226
    .line 227
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 228
    .line 229
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 230
    .line 231
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 236
    .line 237
    iget p0, p0, Lcom/android/launcher3/menu/MenuContainer;->v:I

    .line 238
    .line 239
    invoke-virtual {v0, v4, v4, p0, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 240
    .line 241
    .line 242
    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 243
    .line 244
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 245
    .line 246
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 247
    .line 248
    :cond_8
    return-void
.end method

.method private L(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x0

    .line 7
    aget v1, v1, v2

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v3, 0x1

    .line 14
    aget v1, v1, v3

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 32
    .line 33
    neg-int p3, p3

    .line 34
    int-to-float p3, p3

    .line 35
    new-array v0, v0, [F

    .line 36
    .line 37
    aput p3, v0, v2

    .line 38
    .line 39
    aput v1, v0, v3

    .line 40
    .line 41
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 47
    .line 48
    neg-int p3, p3

    .line 49
    int-to-float p3, p3

    .line 50
    new-array v0, v0, [F

    .line 51
    .line 52
    aput p3, v0, v2

    .line 53
    .line 54
    aput v1, v0, v3

    .line 55
    .line 56
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 62
    .line 63
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 74
    .line 75
    neg-int p3, p3

    .line 76
    int-to-float p3, p3

    .line 77
    new-array v0, v0, [F

    .line 78
    .line 79
    aput p3, v0, v2

    .line 80
    .line 81
    aput v1, v0, v3

    .line 82
    .line 83
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    goto :goto_0

    .line 88
    :cond_2
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 89
    .line 90
    neg-int p3, p3

    .line 91
    int-to-float p3, p3

    .line 92
    new-array v0, v0, [F

    .line 93
    .line 94
    aput p3, v0, v2

    .line 95
    .line 96
    aput v1, v0, v3

    .line 97
    .line 98
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->s:Landroid/view/animation/Interpolator;

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 105
    .line 106
    .line 107
    iget p0, p0, Lcom/android/launcher3/menu/MenuContainer;->A:I

    .line 108
    .line 109
    int-to-long p2, p0

    .line 110
    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 111
    .line 112
    .line 113
    return-object p1
.end method

.method private M(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x0

    .line 7
    aget v1, v1, v2

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->m(Landroid/view/View;)[I

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v3, 0x1

    .line 14
    aget v1, v1, v3

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 31
    .line 32
    neg-int p3, p3

    .line 33
    int-to-float p3, p3

    .line 34
    new-array v0, v3, [F

    .line 35
    .line 36
    aput p3, v0, v2

    .line 37
    .line 38
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 44
    .line 45
    neg-int p3, p3

    .line 46
    int-to-float p3, p3

    .line 47
    new-array v0, v3, [F

    .line 48
    .line 49
    aput p3, v0, v2

    .line 50
    .line 51
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 57
    .line 58
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    const/4 v1, 0x0

    .line 67
    if-eqz p2, :cond_2

    .line 68
    .line 69
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 70
    .line 71
    neg-int p3, p3

    .line 72
    int-to-float p3, p3

    .line 73
    new-array v0, v0, [F

    .line 74
    .line 75
    aput v1, v0, v2

    .line 76
    .line 77
    aput p3, v0, v3

    .line 78
    .line 79
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    goto :goto_0

    .line 84
    :cond_2
    sget-object p2, Landroid/widget/FrameLayout;->TRANSLATION_Y:Landroid/util/Property;

    .line 85
    .line 86
    neg-int p3, p3

    .line 87
    int-to-float p3, p3

    .line 88
    new-array v0, v0, [F

    .line 89
    .line 90
    aput v1, v0, v2

    .line 91
    .line 92
    aput p3, v0, v3

    .line 93
    .line 94
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->r:Landroid/animation/TimeInterpolator;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 101
    .line 102
    .line 103
    iget p0, p0, Lcom/android/launcher3/menu/MenuContainer;->B:I

    .line 104
    .line 105
    int-to-long p2, p0

    .line 106
    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 107
    .line 108
    .line 109
    return-object p1
.end method

.method private N()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 14
    .line 15
    const v2, 0x7f070992

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 29
    .line 30
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 39
    .line 40
    const v2, 0x7f07048b

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 49
    .line 50
    const v2, 0x7f07048a

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 58
    .line 59
    const v3, 0x7f07098b

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 67
    .line 68
    invoke-virtual {v4, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    const/4 v4, 0x0

    .line 73
    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->j()F

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    :goto_1
    if-ge v4, v1, :cond_5

    .line 93
    .line 94
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 95
    .line 96
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    instance-of v2, v2, Landroid/widget/TextView;

    .line 101
    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 105
    .line 106
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Landroid/widget/TextView;

    .line 111
    .line 112
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 113
    .line 114
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-eqz v5, :cond_3

    .line 119
    .line 120
    const v5, 0x7f070984

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    const v5, 0x7f07097d

    .line 125
    .line 126
    .line 127
    :goto_2
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    int-to-float v3, v3

    .line 132
    mul-float/2addr v3, v0

    .line 133
    float-to-int v3, v3

    .line 134
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 135
    .line 136
    .line 137
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_5
    :goto_3
    return-void
.end method

.method private O()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 14
    .line 15
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v0, v0, Lcom/android/launcher3/r4;->R:I

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 22
    .line 23
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    new-instance v3, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v4, "MenuContainer nav = "

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v4, " isVerticalBarLayout:"

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v4, "  grid.isLandscape:"

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-boolean v4, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 58
    .line 59
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    const-string v4, "MenuContainer"

    .line 67
    .line 68
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 76
    .line 77
    const/4 v4, 0x0

    .line 78
    if-eqz v2, :cond_0

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const v0, 0x7f07022f

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    float-to-int p0, p0

    .line 96
    invoke-virtual {v3, v4, v4, p0, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_0
    const v2, 0x7f070230

    .line 101
    .line 102
    .line 103
    const v5, 0x7f070231

    .line 104
    .line 105
    .line 106
    if-lez v0, :cond_4

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-boolean v6, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 117
    .line 118
    if-eqz v6, :cond_1

    .line 119
    .line 120
    move v6, v5

    .line 121
    goto :goto_0

    .line 122
    :cond_1
    move v6, v2

    .line 123
    :goto_0
    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    float-to-int v0, v0

    .line 128
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    iget-boolean v7, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 137
    .line 138
    if-eqz v7, :cond_2

    .line 139
    .line 140
    move v2, v5

    .line 141
    :cond_2
    invoke-virtual {v6, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    float-to-int v2, v2

    .line 146
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 155
    .line 156
    if-eqz v1, :cond_3

    .line 157
    .line 158
    const v1, 0x7f0706d6

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_3
    const v1, 0x7f0706d5

    .line 163
    .line 164
    .line 165
    :goto_1
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    float-to-int p0, p0

    .line 170
    invoke-virtual {v3, v0, v4, v2, p0}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-boolean v6, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 183
    .line 184
    if-eqz v6, :cond_5

    .line 185
    .line 186
    move v6, v5

    .line 187
    goto :goto_2

    .line 188
    :cond_5
    move v6, v2

    .line 189
    :goto_2
    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimension(I)F

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    float-to-int v0, v0

    .line 194
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object v6

    .line 202
    iget-boolean v7, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 203
    .line 204
    if-eqz v7, :cond_6

    .line 205
    .line 206
    move v2, v5

    .line 207
    :cond_6
    invoke-virtual {v6, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    float-to-int v2, v2

    .line 212
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->N0:Z

    .line 221
    .line 222
    if-eqz v1, :cond_7

    .line 223
    .line 224
    const v1, 0x7f0706d8

    .line 225
    .line 226
    .line 227
    goto :goto_3

    .line 228
    :cond_7
    const v1, 0x7f0706d7

    .line 229
    .line 230
    .line 231
    :goto_3
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    float-to-int p0, p0

    .line 236
    invoke-virtual {v3, v0, v4, v2, p0}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/menu/MenuContainer;ZLandroid/content/Context;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/menu/MenuContainer;->y(ZLandroid/content/Context;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/menu/MenuContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->x(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/menu/MenuContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/menu/MenuContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->z(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/menu/MenuContainer;)Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/menu/MenuContainer;)Lcom/android/launcher3/iconarrange/MenuIconArrange;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/menu/MenuContainer;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method private l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    return-void
.end method

.method private m(Landroid/view/View;)[I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    const/16 p1, 0x15f

    .line 3
    .line 4
    filled-new-array {p0, p1}, [I

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private o(IILandroid/view/View$OnLongClickListener;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    const v1, 0x7f0b0244

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 31
    .line 32
    check-cast v0, Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const v3, 0x7f07098f

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 49
    .line 50
    check-cast v0, Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 56
    .line 57
    check-cast v0, Landroid/widget/TextView;

    .line 58
    .line 59
    const/4 v2, -0x1

    .line 60
    if-ne v2, p2, :cond_3

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    goto :goto_0

    .line 64
    :cond_3
    move v2, v1

    .line 65
    :goto_0
    invoke-static {v0, v2}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_4

    .line 87
    .line 88
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 89
    .line 90
    const v3, 0x7f070987

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 98
    .line 99
    const/4 v2, -0x2

    .line 100
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 101
    .line 102
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 103
    .line 104
    invoke-static {p2, v0}, Lf1/d;->e(ILandroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p2, v1, v1, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 112
    .line 113
    check-cast p1, Landroid/widget/TextView;

    .line 114
    .line 115
    const/4 v0, 0x0

    .line 116
    invoke-virtual {p1, v0, p2, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/view/View;->hasOnClickListeners()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_5

    .line 126
    .line 127
    :goto_1
    return-void

    .line 128
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 129
    .line 130
    new-instance p2, Lcom/android/launcher3/menu/f;

    .line 131
    .line 132
    invoke-direct {p2, p0}, Lcom/android/launcher3/menu/f;-><init>(Lcom/android/launcher3/menu/MenuContainer;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->j:Landroid/view/View;

    .line 139
    .line 140
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method private r(IILandroid/view/View$OnLongClickListener;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    const v1, 0x7f0b0547

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 28
    .line 29
    check-cast v0, Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const v3, 0x7f07098f

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 46
    .line 47
    check-cast v0, Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 53
    .line 54
    check-cast v0, Landroid/widget/TextView;

    .line 55
    .line 56
    const/4 v2, -0x1

    .line 57
    if-ne v2, p2, :cond_2

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    move v2, v1

    .line 62
    :goto_0
    invoke-static {v0, v2}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 72
    .line 73
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 74
    .line 75
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_3

    .line 84
    .line 85
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 86
    .line 87
    const v3, 0x7f070987

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 95
    .line 96
    const/4 v2, -0x2

    .line 97
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 98
    .line 99
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 100
    .line 101
    invoke-static {p2, v0}, Lf1/d;->g(ILandroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-virtual {p2, v1, v1, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 109
    .line 110
    check-cast p1, Landroid/widget/TextView;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    invoke-virtual {p1, v0, p2, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/view/View;->hasOnClickListeners()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_4

    .line 123
    .line 124
    :goto_1
    return-void

    .line 125
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 126
    .line 127
    new-instance p2, Lcom/android/launcher3/menu/h;

    .line 128
    .line 129
    invoke-direct {p2, p0}, Lcom/android/launcher3/menu/h;-><init>(Lcom/android/launcher3/menu/MenuContainer;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->l:Landroid/view/View;

    .line 136
    .line 137
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private s(IILandroid/view/View$OnLongClickListener;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    const v1, 0x7f0b067b

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 17
    .line 18
    check-cast v0, Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->Q0()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/16 v1, 0x8

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 38
    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 54
    .line 55
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const-string v4, "com.zte.beautify"

    .line 64
    .line 65
    invoke-static {v3, v4}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 70
    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    move v1, v2

    .line 74
    :cond_3
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_4

    .line 86
    .line 87
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 88
    .line 89
    check-cast v1, Landroid/widget/TextView;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    const v4, 0x7f07098f

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 106
    .line 107
    check-cast v1, Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 113
    .line 114
    check-cast v1, Landroid/widget/TextView;

    .line 115
    .line 116
    const/4 v3, -0x1

    .line 117
    if-ne v3, p2, :cond_5

    .line 118
    .line 119
    const/4 v3, 0x1

    .line 120
    goto :goto_1

    .line 121
    :cond_5
    move v3, v2

    .line 122
    :goto_1
    invoke-static {v1, v3}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 126
    .line 127
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 132
    .line 133
    const/4 v3, -0x2

    .line 134
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 135
    .line 136
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 137
    .line 138
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-eqz v3, :cond_6

    .line 147
    .line 148
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 149
    .line 150
    const v4, 0x7f070987

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 158
    .line 159
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 160
    .line 161
    invoke-static {p2, v1}, Lf1/d;->h(ILandroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {p2, v2, v2, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 169
    .line 170
    check-cast p1, Landroid/widget/TextView;

    .line 171
    .line 172
    const/4 v1, 0x0

    .line 173
    invoke-virtual {p1, v1, p2, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 185
    .line 186
    invoke-virtual {p2}, Landroid/view/View;->hasOnClickListeners()Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-eqz p2, :cond_7

    .line 191
    .line 192
    :goto_2
    return-void

    .line 193
    :cond_7
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 194
    .line 195
    new-instance v1, Lcom/android/launcher3/menu/g;

    .line 196
    .line 197
    invoke-direct {v1, p0, v0, p1}, Lcom/android/launcher3/menu/g;-><init>(Lcom/android/launcher3/menu/MenuContainer;ZLandroid/content/Context;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 204
    .line 205
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method private t(IILandroid/view/View$OnLongClickListener;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    const v1, 0x7f0b0683

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 28
    .line 29
    check-cast v0, Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const v3, 0x7f07098f

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 46
    .line 47
    check-cast v0, Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 53
    .line 54
    check-cast v0, Landroid/widget/TextView;

    .line 55
    .line 56
    const/4 v2, -0x1

    .line 57
    if-ne v2, p2, :cond_2

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    move v2, v1

    .line 62
    :goto_0
    invoke-static {v0, v2}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 72
    .line 73
    const/4 v2, -0x2

    .line 74
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 75
    .line 76
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 89
    .line 90
    const v3, 0x7f070987

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 98
    .line 99
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 100
    .line 101
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 102
    .line 103
    invoke-static {v0, p2, v2}, Lf1/d;->i(Landroid/view/View;ILandroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p2, v1, v1, p1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 111
    .line 112
    check-cast p1, Landroid/widget/TextView;

    .line 113
    .line 114
    const/4 v0, 0x0

    .line 115
    invoke-virtual {p1, v0, p2, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/view/View;->hasOnClickListeners()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_4

    .line 125
    .line 126
    :goto_1
    return-void

    .line 127
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 128
    .line 129
    new-instance p2, Lcom/android/launcher3/menu/e;

    .line 130
    .line 131
    invoke-direct {p2, p0}, Lcom/android/launcher3/menu/e;-><init>(Lcom/android/launcher3/menu/MenuContainer;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->k:Landroid/view/View;

    .line 138
    .line 139
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method private u()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f0b0303

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v0, v2}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->m(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 40
    .line 41
    const v0, 0x3e6b851f    # 0.23f

    .line 42
    .line 43
    .line 44
    const/high16 v1, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const v2, 0x3f028f5c    # 0.51f

    .line 47
    .line 48
    .line 49
    const v3, 0x3dcccccd    # 0.1f

    .line 50
    .line 51
    .line 52
    invoke-static {v2, v3, v0, v1}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->r:Landroid/animation/TimeInterpolator;

    .line 57
    .line 58
    sget-object v0, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->s:Landroid/view/animation/Interpolator;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 63
    .line 64
    const v1, 0x7f070c7c

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->u:I

    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 74
    .line 75
    const v1, 0x7f070c49

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->t:I

    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 85
    .line 86
    const v1, 0x7f0702fb

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->v:I

    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 96
    .line 97
    const v1, 0x7f0c0047

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->w:I

    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 107
    .line 108
    const v1, 0x7f0c004f

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->x:I

    .line 116
    .line 117
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 118
    .line 119
    const v1, 0x7f0c0048

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->y:I

    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 129
    .line 130
    const v1, 0x7f0c0050

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->z:I

    .line 138
    .line 139
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 140
    .line 141
    const v1, 0x7f0c0049

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->A:I

    .line 149
    .line 150
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 151
    .line 152
    const v1, 0x7f0c0051

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput v0, p0, Lcom/android/launcher3/menu/MenuContainer;->B:I

    .line 160
    .line 161
    return-void
.end method

.method private v(Lcom/android/launcher3/q4$a;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/q4$a;->m:Lcom/android/launcher3/q4$a;

    .line 2
    .line 3
    if-eq p0, p1, :cond_1

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/q4$a;->g:Lcom/android/launcher3/q4$a;

    .line 6
    .line 7
    if-eq p0, p1, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/android/launcher3/q4$a;->n:Lcom/android/launcher3/q4$a;

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 6
    .line 7
    sub-long/2addr v2, v0

    .line 8
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const-wide/16 v4, 0x12c

    .line 13
    .line 14
    cmp-long p1, v2, v4

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const v0, 0x7f14013e

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lh1/a;->D(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string p1, "MenuContainer"

    .line 35
    .line 36
    const-string v0, "initMenuContainer--onClick--mEffectTypeButton"

    .line 37
    .line 38
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_0

    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_0

    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/menu/MenuEffect;->j()V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 73
    .line 74
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 75
    .line 76
    const/4 v5, 0x0

    .line 77
    const/4 v3, 0x0

    .line 78
    move-object v0, p0

    .line 79
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_0

    .line 84
    .line 85
    const/4 p0, 0x1

    .line 86
    iput-boolean p0, v0, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 87
    .line 88
    sget-object p0, Lcom/android/launcher3/q4$a;->j:Lcom/android/launcher3/q4$a;

    .line 89
    .line 90
    invoke-virtual {v0, p0}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, v0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 94
    .line 95
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->invalidate()V

    .line 104
    .line 105
    .line 106
    :cond_0
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 6

    .line 1
    const-string p1, "MenuContainer"

    .line 2
    .line 3
    const-string v0, "initMenuContainer--onClick--mMoreButton"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget-wide v2, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 13
    .line 14
    sub-long/2addr v2, v0

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    const-wide/16 v4, 0x12c

    .line 20
    .line 21
    cmp-long p1, v2, v4

    .line 22
    .line 23
    if-lez p1, :cond_1

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const v0, 0x7f140141

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Lh1/a;->D(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance p1, Landroid/content/Intent;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-class v1, Lcom/android/launcher3/settings/SettingsActivityMFV;

    .line 48
    .line 49
    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_0

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_0

    .line 75
    .line 76
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/4 v1, 0x0

    .line 81
    invoke-virtual {v0, v1}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 82
    .line 83
    .line 84
    const v1, 0x10008000

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/16 v2, 0x4d2

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v1, p1, v2, v0}, Lcom/android/launcher3/C2;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 106
    .line 107
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Lcom/android/launcher3/statemanager/d;->i0(Lcom/android/launcher3/statemanager/a;)V

    .line 118
    .line 119
    .line 120
    :cond_0
    const/4 p1, 0x1

    .line 121
    iput-boolean p1, p0, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 122
    .line 123
    sget-object p1, Lcom/android/launcher3/q4$a;->m:Lcom/android/launcher3/q4$a;

    .line 124
    .line 125
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 126
    .line 127
    .line 128
    :cond_1
    return-void
.end method

.method private synthetic y(ZLandroid/content/Context;Landroid/view/View;)V
    .locals 9

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 6
    .line 7
    sub-long/2addr v2, v0

    .line 8
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const-wide/16 v4, 0x12c

    .line 13
    .line 14
    cmp-long p3, v2, v4

    .line 15
    .line 16
    if-lez p3, :cond_8

    .line 17
    .line 18
    invoke-static {}, Lx1/O;->R4()V

    .line 19
    .line 20
    .line 21
    iput-wide v0, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const v0, 0x7f140143

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-static {p3}, Lh1/a;->D(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 38
    .line 39
    invoke-static {p3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {}, Lx1/O;->P0()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string v3, "initMenuContainer--onClick--mWallpaperButton--isSwitchingState="

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v3, " wallpaperEntrance="

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "MenuContainer"

    .line 81
    .line 82
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    const/4 v2, 0x1

    .line 86
    if-eqz p1, :cond_5

    .line 87
    .line 88
    new-instance p1, Landroid/content/Intent;

    .line 89
    .line 90
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 91
    .line 92
    .line 93
    const/high16 p2, 0x10000000

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    const-string p2, "zte.mfv.intent.action.beauty.myoswallpaper"

    .line 99
    .line 100
    const-string v3, "com.zte.beautify/com.zte.beautify.NewStyleWallpaperActivity"

    .line 101
    .line 102
    const/4 v4, 0x2

    .line 103
    if-eq v1, v2, :cond_1

    .line 104
    .line 105
    if-eq v1, v4, :cond_1

    .line 106
    .line 107
    invoke-virtual {p3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iget-object v1, v1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/android/launcher3/r4;->L:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_0

    .line 120
    .line 121
    invoke-virtual {p3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    iget-object p2, p2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 126
    .line 127
    iget-object p2, p2, Lcom/android/launcher3/r4;->L:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {p2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_0
    invoke-static {v3}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_1
    if-ne v1, v2, :cond_2

    .line 149
    .line 150
    const-string p2, "com.zte.beautify/com.zte.beautify.BeautifyWallpaperActivity"

    .line 151
    .line 152
    invoke-static {p2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_2
    if-ne v1, v4, :cond_3

    .line 161
    .line 162
    invoke-static {v3}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    .line 171
    .line 172
    :cond_3
    :goto_0
    if-nez v0, :cond_4

    .line 173
    .line 174
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 175
    .line 176
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    if-nez p2, :cond_4

    .line 181
    .line 182
    invoke-virtual {p3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    const v0, 0x7f010014

    .line 187
    .line 188
    .line 189
    const v1, 0x7f010013

    .line 190
    .line 191
    .line 192
    invoke-static {p2, v0, v1}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    invoke-virtual {p2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 204
    .line 205
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    sget-object p2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 214
    .line 215
    invoke-virtual {p1, p2}, Lcom/android/launcher3/statemanager/d;->i0(Lcom/android/launcher3/statemanager/a;)V

    .line 216
    .line 217
    .line 218
    :cond_4
    iput-boolean v2, p0, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 219
    .line 220
    sget-object p1, Lcom/android/launcher3/q4$a;->n:Lcom/android/launcher3/q4$a;

    .line 221
    .line 222
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :cond_5
    invoke-static {p2}, Lx1/O;->S0(Landroid/content/Context;)Z

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    const/4 v1, 0x0

    .line 231
    const-string v3, "already_set_permission_Q"

    .line 232
    .line 233
    if-nez p1, :cond_6

    .line 234
    .line 235
    invoke-static {p2, v3, v1}, Lx1/O;->F4(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 236
    .line 237
    .line 238
    new-instance p1, Ljava/util/ArrayList;

    .line 239
    .line 240
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 241
    .line 242
    .line 243
    const-string p2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 244
    .line 245
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    const-string p2, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 249
    .line 250
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 254
    .line 255
    invoke-static {p2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 256
    .line 257
    .line 258
    move-result-object p2

    .line 259
    const/16 v1, 0x3ea

    .line 260
    .line 261
    invoke-static {p2, p1, v1}, Lx1/U;->b(Landroid/app/Activity;Ljava/util/List;I)V

    .line 262
    .line 263
    .line 264
    goto :goto_1

    .line 265
    :cond_6
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-interface {p1, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 270
    .line 271
    .line 272
    move-result p1

    .line 273
    if-nez p1, :cond_7

    .line 274
    .line 275
    invoke-static {p2, v3, v2}, Lx1/O;->F4(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 276
    .line 277
    .line 278
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->D:Lcom/android/launcher3/menu/c;

    .line 279
    .line 280
    invoke-virtual {p1}, Lcom/android/launcher3/menu/c;->p()V

    .line 281
    .line 282
    .line 283
    :cond_7
    :goto_1
    if-nez v0, :cond_8

    .line 284
    .line 285
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 286
    .line 287
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    if-nez p1, :cond_8

    .line 292
    .line 293
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 294
    .line 295
    if-eqz p1, :cond_8

    .line 296
    .line 297
    invoke-virtual {p1}, Lcom/android/launcher3/menu/MenuWallpaper;->j()V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 301
    .line 302
    .line 303
    move-result-object p1

    .line 304
    invoke-virtual {p1}, Lcom/android/launcher3/T6;->invalidate()V

    .line 305
    .line 306
    .line 307
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 308
    .line 309
    iget-object v5, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 310
    .line 311
    iget-object v7, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 312
    .line 313
    const/4 v8, 0x0

    .line 314
    const/4 v6, 0x0

    .line 315
    move-object v3, p0

    .line 316
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z

    .line 317
    .line 318
    .line 319
    iput-boolean v2, v3, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 320
    .line 321
    sget-object p0, Lcom/android/launcher3/q4$a;->i:Lcom/android/launcher3/q4$a;

    .line 322
    .line 323
    invoke-virtual {v3, p0}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {p3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    invoke-virtual {p0}, Lcom/android/launcher3/H5$g;->b()I

    .line 343
    .line 344
    .line 345
    move-result p0

    .line 346
    invoke-virtual {p3, p0}, Lcom/android/launcher3/C2;->T4(I)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {p3}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 350
    .line 351
    .line 352
    move-result-object p0

    .line 353
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/E2;->d(Landroid/content/Context;)V

    .line 354
    .line 355
    .line 356
    :cond_8
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 6
    .line 7
    sub-long/2addr v2, v0

    .line 8
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const-wide/16 v4, 0x12c

    .line 13
    .line 14
    cmp-long p1, v2, v4

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const v0, 0x7f140144

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lh1/a;->D(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 35
    .line 36
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 41
    .line 42
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    const v2, 0x7f0e008b

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/ComponentsFullSheet;->l1(Landroid/view/View;)Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->G:Landroid/view/View;

    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 62
    .line 63
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_0

    .line 76
    .line 77
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_0

    .line 84
    .line 85
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->G:Landroid/view/View;

    .line 86
    .line 87
    check-cast p1, Lcom/android/launcher3/menu/c$a;

    .line 88
    .line 89
    invoke-interface {p1}, Lcom/android/launcher3/menu/c$a;->j()V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->G:Landroid/view/View;

    .line 93
    .line 94
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    const/4 v1, 0x0

    .line 98
    const/4 v3, 0x0

    .line 99
    move-object v0, p0

    .line 100
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_0

    .line 105
    .line 106
    const/4 p0, 0x1

    .line 107
    iput-boolean p0, v0, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 108
    .line 109
    sget-object p0, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 110
    .line 111
    invoke-virtual {v0, p0}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 112
    .line 113
    .line 114
    :cond_0
    return-void
.end method


# virtual methods
.method public C()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->u2()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->g0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iget-wide v2, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 26
    .line 27
    sub-long/2addr v2, v0

    .line 28
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    const-wide/16 v4, 0x12c

    .line 33
    .line 34
    cmp-long v2, v2, v4

    .line 35
    .line 36
    if-lez v2, :cond_1

    .line 37
    .line 38
    iput-wide v0, p0, Lcom/android/launcher3/menu/MenuContainer;->E:J

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const v1, 0x7f14013f

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lh1/a;->D(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->F()V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->I1()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_1

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    iput-boolean v0, p0, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 85
    .line 86
    sget-object v0, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 92
    .line 93
    iget-object v3, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 94
    .line 95
    const/4 v4, 0x0

    .line 96
    iget-object v5, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 97
    .line 98
    move-object v6, v5

    .line 99
    move-object v1, p0

    .line 100
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z

    .line 101
    .line 102
    .line 103
    :cond_1
    return-void
.end method

.method public D(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->G()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->m(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/android/launcher3/menu/MenuWallpaper;->k(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/android/launcher3/menu/MenuEffect;->g(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->O(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public E()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->l()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 15
    .line 16
    instance-of v1, v0, Lcom/android/launcher3/menu/c$a;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    check-cast v0, Lcom/android/launcher3/menu/c$a;

    .line 22
    .line 23
    invoke-interface {v0, v2}, Lcom/android/launcher3/menu/c$a;->K(Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/MenuContainer;->K(Z)V

    .line 28
    .line 29
    .line 30
    :goto_0
    sget-object v0, Lcom/android/launcher3/q4$a;->g:Lcom/android/launcher3/q4$a;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/MenuContainer;->H(Lcom/android/launcher3/q4$a;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "MenuContainer"

    .line 12
    .line 13
    const-string v0, "onResumeForMFV--mMenuAnimator is running"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/android/launcher3/q4$a;->n:Lcom/android/launcher3/q4$a;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    sget-object v0, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lcom/android/launcher3/menu/MenuContainer;->F:Z

    .line 48
    .line 49
    return-void
.end method

.method public H(Lcom/android/launcher3/q4$a;)V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "showItemContent: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "MenuContainer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 42
    .line 43
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/4 v2, 0x0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 62
    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->G()V

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 69
    .line 70
    const/16 v3, 0x8

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->v(Lcom/android/launcher3/q4$a;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_6

    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 87
    .line 88
    instance-of v4, v0, Lcom/android/launcher3/menu/c$a;

    .line 89
    .line 90
    if-eqz v4, :cond_4

    .line 91
    .line 92
    check-cast v0, Lcom/android/launcher3/menu/c$a;

    .line 93
    .line 94
    invoke-interface {v0}, Lcom/android/launcher3/menu/c$a;->j()V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->j()V

    .line 99
    .line 100
    .line 101
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 102
    .line 103
    if-eqz v0, :cond_6

    .line 104
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    const-string v4, "showItemContent: mCurrentView = "

    .line 111
    .line 112
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    iget-object v4, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 116
    .line 117
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    sget-object v0, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 128
    .line 129
    if-ne p1, v0, :cond_5

    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 132
    .line 133
    invoke-virtual {v0, v3}, Lcom/android/launcher3/menu/MenuEffect;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 137
    .line 138
    const/4 v1, 0x0

    .line 139
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 143
    .line 144
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 153
    .line 154
    const/high16 v1, 0x3f800000    # 1.0f

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 160
    .line 161
    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    .line 162
    .line 163
    .line 164
    :cond_6
    sget-object v0, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 165
    .line 166
    if-ne p1, v0, :cond_7

    .line 167
    .line 168
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 169
    .line 170
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 174
    .line 175
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 176
    .line 177
    .line 178
    const/4 v7, 0x0

    .line 179
    iget-object v8, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 180
    .line 181
    const/4 v4, 0x0

    .line 182
    const/4 v5, 0x0

    .line 183
    const/4 v6, 0x0

    .line 184
    move-object v3, p0

    .line 185
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_7
    move-object v3, p0

    .line 190
    :goto_2
    iget-object p0, v3, Lcom/android/launcher3/menu/MenuContainer;->D:Lcom/android/launcher3/menu/c;

    .line 191
    .line 192
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/c;->D(Lcom/android/launcher3/q4$a;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public I()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "stateChangeEndMFV: showWorkspace "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

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
    const-string v1, "MenuContainer"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 26
    .line 27
    instance-of v1, v0, Lcom/android/launcher3/menu/c$a;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    check-cast v0, Lcom/android/launcher3/menu/c$a;

    .line 33
    .line 34
    invoke-interface {v0, v2}, Lcom/android/launcher3/menu/c$a;->K(Z)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p0, v2}, Lcom/android/launcher3/menu/MenuContainer;->K(Z)V

    .line 39
    .line 40
    .line 41
    :goto_0
    sget-object v0, Lcom/android/launcher3/q4$a;->g:Lcom/android/launcher3/q4$a;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/MenuContainer;->H(Lcom/android/launcher3/q4$a;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public J(Landroid/view/View;Landroid/view/View;)V
    .locals 8

    .line 1
    const-string v0, "switchIconArrangeTopBarAndDropTargetBar"

    .line 2
    .line 3
    const-string v1, "MenuContainer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v2, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    instance-of v0, p2, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-boolean v0, v0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->j:Z

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getAlpha()F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/high16 v2, 0x3f800000    # 1.0f

    .line 57
    .line 58
    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_0

    .line 63
    .line 64
    const-string p0, "switchIconArrangeTopBarAndDropTargetBar 1 return"

    .line 65
    .line 66
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-boolean v0, v0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->j:Z

    .line 75
    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-boolean v0, v0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->k:Z

    .line 83
    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    const-string p0, "switchIconArrangeTopBarAndDropTargetBar 2 return"

    .line 87
    .line 88
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    const/4 v4, 0x0

    .line 93
    const/4 v5, 0x0

    .line 94
    const/4 v3, 0x0

    .line 95
    move-object v2, p0

    .line 96
    move-object v6, p1

    .line 97
    move-object v7, p2

    .line 98
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z

    .line 99
    .line 100
    .line 101
    :cond_2
    return-void
.end method

.method public K(Z)V
    .locals 3

    .line 1
    const-string p1, "onViewExisted-home"

    .line 2
    .line 3
    const-string v0, "MenuContainer"

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getCurrentView()Landroid/view/ViewGroup;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    instance-of p1, p1, Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 13
    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 30
    .line 31
    invoke-interface {p1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->R1()Lcom/android/launcher3/DropTargetBar;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_1

    .line 52
    .line 53
    const-string p1, "onViewExisted: no MENU_OVERVIEW state , gone the dropTargetBar"

    .line 54
    .line 55
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->R1()Lcom/android/launcher3/DropTargetBar;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0, v1}, Lcom/android/launcher3/DropTargetBar;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuEffect;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f(ILandroid/view/animation/Interpolator;)V
    .locals 0

    .line 1
    return-void
.end method

.method getCurrentView()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 2
    .line 3
    return-object p0
.end method

.method getMenuIconArrange()Lcom/android/launcher3/iconarrange/MenuIconArrange;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()V
    .locals 2

    .line 1
    const-string v0, "MenuContainer"

    .line 2
    .line 3
    const-string v1, "initMenuData for main"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->G()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v4, p1

    .line 4
    .line 5
    move-object/from16 v6, p2

    .line 6
    .line 7
    move/from16 v5, p3

    .line 8
    .line 9
    move-object/from16 v0, p4

    .line 10
    .line 11
    move-object/from16 v3, p5

    .line 12
    .line 13
    const/4 v7, 0x1

    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v8, "animateBeautyMenu: ChildCount="

    .line 20
    .line 21
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v8, v1, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    invoke-static {v8}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 27
    .line 28
    .line 29
    move-result-object v8

    .line 30
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I

    .line 35
    .line 36
    .line 37
    move-result v8

    .line 38
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v8, ",mMenuAnimator="

    .line 42
    .line 43
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v8, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v8, "MenuContainer"

    .line 56
    .line 57
    invoke-static {v8, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    iget-object v2, v1, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 61
    .line 62
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    const/4 v9, 0x0

    .line 75
    if-nez v2, :cond_0

    .line 76
    .line 77
    const-string v0, "don\'t animateBeautyMenu"

    .line 78
    .line 79
    invoke-static {v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    return v9

    .line 83
    :cond_0
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v8, "accessibility"

    .line 88
    .line 89
    invoke-virtual {v2, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Landroid/view/accessibility/AccessibilityManager;

    .line 94
    .line 95
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-direct {v1}, Lcom/android/launcher3/menu/MenuContainer;->l()V

    .line 100
    .line 101
    .line 102
    invoke-static {}, Lcom/android/launcher3/G2;->d()Landroid/animation/AnimatorSet;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    iput-object v8, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 107
    .line 108
    sget-object v8, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 109
    .line 110
    iget-object v10, v1, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 111
    .line 112
    invoke-static {v10}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 113
    .line 114
    .line 115
    move-result-object v10

    .line 116
    invoke-virtual {v10}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 117
    .line 118
    .line 119
    move-result-object v10

    .line 120
    invoke-virtual {v10}, Lcom/android/launcher3/dragndrop/DragLayer;->getWorkspaceDragScrim()Ln1/s;

    .line 121
    .line 122
    .line 123
    move-result-object v10

    .line 124
    instance-of v11, v4, Lcom/android/launcher3/menu/MenuWallpaper;

    .line 125
    .line 126
    const/4 v12, 0x0

    .line 127
    if-eqz v11, :cond_1

    .line 128
    .line 129
    sget-object v11, Ln1/s;->f:Landroid/util/FloatProperty;

    .line 130
    .line 131
    iget-object v13, v1, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 132
    .line 133
    invoke-static {v13}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 134
    .line 135
    .line 136
    move-result-object v13

    .line 137
    invoke-virtual {v13}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 138
    .line 139
    .line 140
    move-result-object v13

    .line 141
    invoke-virtual {v13}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 142
    .line 143
    .line 144
    move-result-object v13

    .line 145
    check-cast v13, Lcom/android/launcher3/V3;

    .line 146
    .line 147
    iget-object v14, v1, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 148
    .line 149
    invoke-static {v14}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 150
    .line 151
    .line 152
    move-result-object v14

    .line 153
    invoke-virtual {v13, v14}, Lcom/android/launcher3/V3;->u(Lcom/android/launcher3/C2;)F

    .line 154
    .line 155
    .line 156
    move-result v13

    .line 157
    sget-object v14, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 158
    .line 159
    invoke-virtual {v8, v10, v11, v13, v14}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_1
    instance-of v11, v6, Lcom/android/launcher3/menu/MenuWallpaper;

    .line 164
    .line 165
    if-eqz v11, :cond_2

    .line 166
    .line 167
    sget-object v11, Ln1/s;->f:Landroid/util/FloatProperty;

    .line 168
    .line 169
    sget-object v13, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 170
    .line 171
    invoke-virtual {v8, v10, v11, v12, v13}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 172
    .line 173
    .line 174
    :cond_2
    :goto_0
    iget-object v8, v1, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 175
    .line 176
    const v10, 0x7f07098d

    .line 177
    .line 178
    .line 179
    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 180
    .line 181
    .line 182
    move-result v8

    .line 183
    if-eqz v4, :cond_3

    .line 184
    .line 185
    sget-object v11, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    .line 186
    .line 187
    new-array v13, v7, [F

    .line 188
    .line 189
    aput v12, v13, v9

    .line 190
    .line 191
    invoke-static {v4, v11, v13}, Lcom/android/launcher3/G2;->h(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 192
    .line 193
    .line 194
    move-result-object v11

    .line 195
    goto :goto_1

    .line 196
    :cond_3
    const/4 v11, 0x0

    .line 197
    :goto_1
    const/high16 v13, 0x3f800000    # 1.0f

    .line 198
    .line 199
    if-eqz v6, :cond_4

    .line 200
    .line 201
    sget-object v14, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    .line 202
    .line 203
    new-array v15, v7, [F

    .line 204
    .line 205
    aput v13, v15, v9

    .line 206
    .line 207
    invoke-static {v6, v14, v15}, Lcom/android/launcher3/G2;->h(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 208
    .line 209
    .line 210
    move-result-object v14

    .line 211
    goto :goto_2

    .line 212
    :cond_4
    const/4 v14, 0x0

    .line 213
    :goto_2
    if-eqz v4, :cond_5

    .line 214
    .line 215
    new-instance v15, Lcom/android/launcher3/menu/b;

    .line 216
    .line 217
    invoke-direct {v15, v4, v2}, Lcom/android/launcher3/menu/b;-><init>(Landroid/view/View;Z)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v11, v15}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 221
    .line 222
    .line 223
    iget v15, v1, Lcom/android/launcher3/menu/MenuContainer;->x:I

    .line 224
    .line 225
    move/from16 v16, v9

    .line 226
    .line 227
    int-to-long v9, v15

    .line 228
    invoke-virtual {v11, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 229
    .line 230
    .line 231
    iget-object v9, v1, Lcom/android/launcher3/menu/MenuContainer;->r:Landroid/animation/TimeInterpolator;

    .line 232
    .line 233
    invoke-virtual {v11, v9}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 234
    .line 235
    .line 236
    iget-object v9, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 237
    .line 238
    invoke-direct {v1, v4, v5, v8}, Lcom/android/launcher3/menu/MenuContainer;->A(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;

    .line 239
    .line 240
    .line 241
    move-result-object v10

    .line 242
    invoke-virtual {v9, v10}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 243
    .line 244
    .line 245
    iget-object v9, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 246
    .line 247
    invoke-virtual {v9, v11}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 248
    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_5
    move/from16 v16, v9

    .line 252
    .line 253
    :goto_3
    if-eqz v6, :cond_7

    .line 254
    .line 255
    instance-of v9, v6, Lcom/android/launcher3/widget/WidgetsTwoPaneSheetMfv;

    .line 256
    .line 257
    if-nez v9, :cond_7

    .line 258
    .line 259
    new-instance v9, Lcom/android/launcher3/menu/b;

    .line 260
    .line 261
    invoke-direct {v9, v6, v2}, Lcom/android/launcher3/menu/b;-><init>(Landroid/view/View;Z)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v14, v9}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 265
    .line 266
    .line 267
    iget v9, v1, Lcom/android/launcher3/menu/MenuContainer;->w:I

    .line 268
    .line 269
    int-to-long v9, v9

    .line 270
    invoke-virtual {v14, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 271
    .line 272
    .line 273
    iget-object v9, v1, Lcom/android/launcher3/menu/MenuContainer;->s:Landroid/view/animation/Interpolator;

    .line 274
    .line 275
    invoke-virtual {v14, v9}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 276
    .line 277
    .line 278
    instance-of v9, v6, Lcom/android/launcher3/menu/c$a;

    .line 279
    .line 280
    if-eqz v9, :cond_6

    .line 281
    .line 282
    move-object v9, v6

    .line 283
    check-cast v9, Lcom/android/launcher3/menu/c$a;

    .line 284
    .line 285
    iget v10, v1, Lcom/android/launcher3/menu/MenuContainer;->w:I

    .line 286
    .line 287
    iget-object v11, v1, Lcom/android/launcher3/menu/MenuContainer;->s:Landroid/view/animation/Interpolator;

    .line 288
    .line 289
    invoke-interface {v9, v10, v11}, Lcom/android/launcher3/menu/c$a;->f(ILandroid/view/animation/Interpolator;)V

    .line 290
    .line 291
    .line 292
    :cond_6
    iget-object v9, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 293
    .line 294
    invoke-direct {v1, v6, v5, v8}, Lcom/android/launcher3/menu/MenuContainer;->B(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;

    .line 295
    .line 296
    .line 297
    move-result-object v8

    .line 298
    invoke-virtual {v9, v8}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 299
    .line 300
    .line 301
    iget-object v8, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 302
    .line 303
    invoke-virtual {v8, v14}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 304
    .line 305
    .line 306
    :cond_7
    instance-of v8, v0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 307
    .line 308
    if-eqz v8, :cond_8

    .line 309
    .line 310
    instance-of v9, v3, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 311
    .line 312
    if-eqz v9, :cond_8

    .line 313
    .line 314
    move/from16 v9, v16

    .line 315
    .line 316
    goto :goto_4

    .line 317
    :cond_8
    move v9, v7

    .line 318
    :goto_4
    if-eqz v9, :cond_a

    .line 319
    .line 320
    if-nez v8, :cond_9

    .line 321
    .line 322
    instance-of v8, v3, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 323
    .line 324
    if-eqz v8, :cond_a

    .line 325
    .line 326
    :cond_9
    move v8, v7

    .line 327
    goto :goto_5

    .line 328
    :cond_a
    move/from16 v8, v16

    .line 329
    .line 330
    :goto_5
    if-eqz v9, :cond_e

    .line 331
    .line 332
    if-eqz v0, :cond_b

    .line 333
    .line 334
    sget-object v9, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    .line 335
    .line 336
    new-array v10, v7, [F

    .line 337
    .line 338
    aput v12, v10, v16

    .line 339
    .line 340
    invoke-static {v0, v9, v10}, Lcom/android/launcher3/G2;->h(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 341
    .line 342
    .line 343
    move-result-object v9

    .line 344
    goto :goto_6

    .line 345
    :cond_b
    const/4 v9, 0x0

    .line 346
    :goto_6
    if-eqz v3, :cond_c

    .line 347
    .line 348
    sget-object v10, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    .line 349
    .line 350
    new-array v11, v7, [F

    .line 351
    .line 352
    aput v13, v11, v16

    .line 353
    .line 354
    invoke-static {v3, v10, v11}, Lcom/android/launcher3/G2;->h(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 355
    .line 356
    .line 357
    move-result-object v10

    .line 358
    goto :goto_7

    .line 359
    :cond_c
    const/4 v10, 0x0

    .line 360
    :goto_7
    iget-object v11, v1, Lcom/android/launcher3/menu/MenuContainer;->h:Landroid/content/res/Resources;

    .line 361
    .line 362
    const v12, 0x7f0704b0

    .line 363
    .line 364
    .line 365
    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 366
    .line 367
    .line 368
    move-result v11

    .line 369
    if-eqz v0, :cond_d

    .line 370
    .line 371
    new-instance v12, Lcom/android/launcher3/menu/b;

    .line 372
    .line 373
    invoke-direct {v12, v0, v2}, Lcom/android/launcher3/menu/b;-><init>(Landroid/view/View;Z)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v9, v12}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 377
    .line 378
    .line 379
    iget v12, v1, Lcom/android/launcher3/menu/MenuContainer;->z:I

    .line 380
    .line 381
    int-to-long v12, v12

    .line 382
    invoke-virtual {v9, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 383
    .line 384
    .line 385
    iget-object v12, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 386
    .line 387
    invoke-direct {v1, v0, v5, v11}, Lcom/android/launcher3/menu/MenuContainer;->M(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-virtual {v12, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 392
    .line 393
    .line 394
    iget-object v0, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 395
    .line 396
    invoke-virtual {v0, v9}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 397
    .line 398
    .line 399
    :cond_d
    if-eqz v3, :cond_e

    .line 400
    .line 401
    new-instance v0, Lcom/android/launcher3/menu/b;

    .line 402
    .line 403
    invoke-direct {v0, v3, v2}, Lcom/android/launcher3/menu/b;-><init>(Landroid/view/View;Z)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v10, v0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 407
    .line 408
    .line 409
    iget v0, v1, Lcom/android/launcher3/menu/MenuContainer;->y:I

    .line 410
    .line 411
    int-to-long v12, v0

    .line 412
    invoke-virtual {v10, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 413
    .line 414
    .line 415
    iget-object v0, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 416
    .line 417
    invoke-direct {v1, v3, v5, v11}, Lcom/android/launcher3/menu/MenuContainer;->L(Landroid/view/View;ZI)Landroid/animation/ObjectAnimator;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 422
    .line 423
    .line 424
    iget-object v0, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 425
    .line 426
    invoke-virtual {v0, v10}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 427
    .line 428
    .line 429
    :cond_e
    iget-object v9, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 430
    .line 431
    new-instance v0, Lcom/android/launcher3/menu/MenuContainer$a;

    .line 432
    .line 433
    move v2, v8

    .line 434
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/menu/MenuContainer$a;-><init>(Lcom/android/launcher3/menu/MenuContainer;ZLandroid/view/View;Landroid/view/View;ZLandroid/view/View;)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {v9, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 438
    .line 439
    .line 440
    iget-object v0, v1, Lcom/android/launcher3/menu/MenuContainer;->H:Landroid/animation/AnimatorSet;

    .line 441
    .line 442
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 443
    .line 444
    .line 445
    return v7
.end method

.method public n()V
    .locals 9

    .line 1
    const-string v0, "MenuContainer"

    .line 2
    .line 3
    const-string v1, "goToOverView"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 39
    .line 40
    .line 41
    iget-object v7, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 42
    .line 43
    const/4 v8, 0x0

    .line 44
    const/4 v4, 0x0

    .line 45
    const/4 v5, 0x0

    .line 46
    const/4 v6, 0x0

    .line 47
    move-object v3, p0

    .line 48
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/menu/MenuContainer;->k(Landroid/view/View;Landroid/view/View;ZLandroid/view/View;Landroid/view/View;)Z

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    const/16 p3, 0x4d2

    .line 2
    .line 3
    if-eq p1, p3, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v0, "onActivityResult--requestCode"

    .line 12
    .line 13
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, "/resultCode"

    .line 20
    .line 21
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p2, "MenuContainer"

    .line 32
    .line 33
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/MenuContainer;->setCurrentView(Lcom/android/launcher3/q4$a;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lx1/O;->o5(Lcom/android/launcher3/C2;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p2, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p2}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    sget-object p3, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    const/4 v1, 0x1

    .line 78
    if-ne p2, p3, :cond_1

    .line 79
    .line 80
    move p2, v1

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    move p2, v0

    .line 83
    :goto_0
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/l0;->V(Z)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 87
    .line 88
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {p1, v0, v1}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->G()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 20
    .line 21
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v0, 0x0

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 67
    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/menu/MenuContainer;->O()V

    .line 5
    .line 6
    .line 7
    return-void
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
    const-string v1, "onViewEntered-home"

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
    const-string v0, "MenuContainer"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuContainer;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 30
    .line 31
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->q:Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    return-void
.end method

.method public setCurrentView(Lcom/android/launcher3/q4$a;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setCurrentView: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "MenuContainer"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/menu/MenuContainer$c;->a:[I

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    aget v0, v0, v1

    .line 30
    .line 31
    packed-switch v0, :pswitch_data_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :pswitch_0
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :pswitch_1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->G:Landroid/view/View;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    check-cast v0, Landroid/view/ViewGroup;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :pswitch_2
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :pswitch_3
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->o:Lcom/android/launcher3/menu/MenuEffect;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :pswitch_4
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->n:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :pswitch_5
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->C:Landroid/view/ViewGroup;

    .line 66
    .line 67
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->D:Lcom/android/launcher3/menu/c;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/c;->D(Lcom/android/launcher3/q4$a;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setMenuWallpaperBtnVisibility(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const v1, 0x7f0b067b

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/menu/MenuContainer;->i:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->m:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setTopBarStatus(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuContainer;->p:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->setTopBarStatus(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
