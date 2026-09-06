.class public LT0/p;
.super Lcom/android/launcher3/folder/z;
.source "FolderAnimationManagerMFV.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LT0/p$g;,
        LT0/p$f;,
        LT0/p$h;
    }
.end annotation


# static fields
.field private static final t:Landroid/view/animation/Interpolator;

.field private static final u:Landroid/view/animation/Interpolator;

.field private static final v:I

.field public static final w:I


# instance fields
.field public r:LT0/p$g;

.field public s:LT0/p$f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/L;->M:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    sput-object v0, LT0/p;->t:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/anim/L;->N:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    sput-object v0, LT0/p;->u:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->d2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/16 v0, 0x140

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v0, 0xdc

    .line 19
    .line 20
    :goto_0
    sput v0, LT0/p;->v:I

    .line 21
    .line 22
    invoke-static {}, Lx1/O;->d2()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/16 v0, 0x15e

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/16 v0, 0xfa

    .line 32
    .line 33
    :goto_1
    sput v0, LT0/p;->w:I

    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/folder/Folder;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/z;-><init>(Lcom/android/launcher3/folder/Folder;Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, LT0/p$g;->e()LT0/p$g;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, LT0/p;->r:LT0/p$g;

    .line 9
    .line 10
    new-instance p1, LT0/p$f;

    .line 11
    .line 12
    invoke-direct {p1}, LT0/p$f;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, LT0/p;->s:LT0/p$f;

    .line 16
    .line 17
    return-void
.end method

.method static synthetic A(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic B(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic C(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic D(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method private D0()Landroid/animation/AnimatorSet;
    .locals 14

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v2, v1, [F

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/high16 v4, 0x3f800000    # 1.0f

    .line 11
    .line 12
    aput v4, v2, v3

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    const/4 v6, 0x0

    .line 16
    aput v6, v2, v5

    .line 17
    .line 18
    iget-boolean v7, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 19
    .line 20
    if-nez v7, :cond_0

    .line 21
    .line 22
    aput v6, v2, v3

    .line 23
    .line 24
    aput v4, v2, v5

    .line 25
    .line 26
    :cond_0
    aget v4, v2, v3

    .line 27
    .line 28
    aget v2, v2, v5

    .line 29
    .line 30
    new-array v6, v1, [F

    .line 31
    .line 32
    aput v4, v6, v3

    .line 33
    .line 34
    aput v2, v6, v5

    .line 35
    .line 36
    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v4, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 41
    .line 42
    iget-object v4, v4, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 43
    .line 44
    invoke-virtual {v4}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 45
    .line 46
    .line 47
    move-result-object v8

    .line 48
    if-nez v8, :cond_1

    .line 49
    .line 50
    const-string p0, "FolderAnimationManagerMFV"

    .line 51
    .line 52
    const-string v1, "getLauncherContentAnim:launcher null return !!"

    .line 53
    .line 54
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_1
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 63
    .line 64
    .line 65
    move-result-object v9

    .line 66
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 75
    .line 76
    .line 77
    move-result-object v11

    .line 78
    new-instance v6, LT0/c;

    .line 79
    .line 80
    invoke-direct/range {v6 .. v11}, LT0/c;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/C2;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v4}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    check-cast v4, Lcom/android/launcher3/V3;

    .line 95
    .line 96
    invoke-virtual {v4, v8}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    iget v4, v4, Lcom/android/launcher3/V3$h;->a:F

    .line 101
    .line 102
    const v6, 0x3f666666    # 0.9f

    .line 103
    .line 104
    .line 105
    mul-float/2addr v6, v4

    .line 106
    new-array v12, v1, [F

    .line 107
    .line 108
    aput v4, v12, v3

    .line 109
    .line 110
    aput v6, v12, v5

    .line 111
    .line 112
    iget-boolean v13, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 113
    .line 114
    if-nez v13, :cond_2

    .line 115
    .line 116
    aput v6, v12, v3

    .line 117
    .line 118
    aput v4, v12, v5

    .line 119
    .line 120
    :cond_2
    aget v4, v12, v3

    .line 121
    .line 122
    aget v6, v12, v5

    .line 123
    .line 124
    new-array v12, v1, [F

    .line 125
    .line 126
    aput v4, v12, v3

    .line 127
    .line 128
    aput v6, v12, v5

    .line 129
    .line 130
    invoke-static {v12}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    new-instance v6, LT0/d;

    .line 135
    .line 136
    invoke-direct/range {v6 .. v11}, LT0/d;-><init>(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/C2;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 140
    .line 141
    .line 142
    new-instance v6, LT0/p$e;

    .line 143
    .line 144
    move-object v8, v7

    .line 145
    move-object v7, p0

    .line 146
    invoke-direct/range {v6 .. v11}, LT0/p$e;-><init>(LT0/p;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v6}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 150
    .line 151
    .line 152
    new-array p0, v1, [Landroid/animation/Animator;

    .line 153
    .line 154
    aput-object v2, p0, v3

    .line 155
    .line 156
    aput-object v4, p0, v5

    .line 157
    .line 158
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 159
    .line 160
    .line 161
    return-object v0
.end method

.method static synthetic E(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic F(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method private F0(Lcom/android/launcher3/folder/FolderIcon;Landroid/view/View;)Lcom/android/launcher3/folder/y0;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getPreviewItemManager()Lcom/android/launcher3/folder/A0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/A0;->o()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/android/launcher3/folder/y0;

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-ge p1, v1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/launcher3/folder/y0;

    .line 31
    .line 32
    iget-object v2, v1, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    if-ne v2, v3, :cond_1

    .line 39
    .line 40
    move-object v0, v1

    .line 41
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    return-object v0
.end method

.method static synthetic G(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic G0(Lcom/android/launcher3/BubbleTextView;Landroid/graphics/Paint;ZI[ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p6

    .line 5
    check-cast p6, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p6}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p6

    .line 11
    invoke-virtual {p1, p6}, Lcom/android/launcher3/BubbleTextView;->setTextAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    if-eqz p3, :cond_0

    .line 21
    .line 22
    int-to-float p0, p4

    .line 23
    mul-float/2addr p0, p6

    .line 24
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    shl-int/lit8 p0, p0, 0x18

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    aget p3, p5, p1

    .line 32
    .line 33
    if-eq p0, p3, :cond_0

    .line 34
    .line 35
    const/4 p3, 0x0

    .line 36
    const/high16 p4, 0x40400000    # 3.0f

    .line 37
    .line 38
    const/high16 p6, 0x40c00000    # 6.0f

    .line 39
    .line 40
    invoke-virtual {p2, p6, p3, p4, p0}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 41
    .line 42
    .line 43
    aput p0, p5, p1

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method static synthetic H(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic H0(FLcom/android/launcher3/C2;FFFFFFLandroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p10}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p10

    .line 5
    check-cast p10, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p10}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p10

    .line 11
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, LT0/p;->r:LT0/p$g;

    .line 16
    .line 17
    invoke-virtual {p0, p10}, LT0/p$g;->h(F)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p0, p0, LT0/p;->r:LT0/p$g;

    .line 22
    .line 23
    invoke-virtual {p0, p10}, LT0/p$g;->i(F)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    int-to-float p0, p0

    .line 35
    sub-float/2addr p1, p0

    .line 36
    sub-float/2addr p4, p3

    .line 37
    mul-float/2addr p4, p10

    .line 38
    add-float/2addr p3, p4

    .line 39
    add-float/2addr p3, p1

    .line 40
    sub-float/2addr p6, p5

    .line 41
    mul-float/2addr p6, p10

    .line 42
    add-float/2addr p5, p6

    .line 43
    sub-float/2addr p8, p7

    .line 44
    mul-float/2addr p8, p10

    .line 45
    add-float/2addr p7, p8

    .line 46
    invoke-virtual {p9, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p9, p5}, Landroid/view/View;->setTranslationY(F)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p9, p7}, Landroid/view/View;->setScaleX(F)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p9, p7}, Landroid/view/View;->setScaleY(F)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method static synthetic I(LT0/p;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic I0(FFFFFFLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p7}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p7

    .line 5
    check-cast p7, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p7}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p7

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 14
    .line 15
    const/16 v1, 0x20

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 24
    .line 25
    const v0, 0x7f0b0499

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sub-float/2addr p2, p1

    .line 33
    mul-float/2addr p2, p7

    .line 34
    add-float/2addr p1, p2

    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 36
    .line 37
    .line 38
    sub-float/2addr p4, p3

    .line 39
    mul-float/2addr p4, p7

    .line 40
    add-float/2addr p3, p4

    .line 41
    invoke-virtual {p0, p3}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    sub-float/2addr p6, p5

    .line 45
    mul-float/2addr p6, p7

    .line 46
    add-float/2addr p5, p6

    .line 47
    invoke-virtual {p0, p5}, Landroid/view/View;->setScaleX(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p5}, Landroid/view/View;->setScaleY(F)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 57
    .line 58
    sub-float/2addr p2, p1

    .line 59
    mul-float/2addr p2, p7

    .line 60
    add-float/2addr p1, p2

    .line 61
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTranslationX(F)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 67
    .line 68
    sub-float/2addr p4, p3

    .line 69
    mul-float/2addr p4, p7

    .line 70
    add-float/2addr p3, p4

    .line 71
    invoke-virtual {p1, p3}, Landroid/widget/EditText;->setTranslationY(F)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 77
    .line 78
    sub-float/2addr p6, p5

    .line 79
    mul-float/2addr p6, p7

    .line 80
    add-float/2addr p5, p6

    .line 81
    invoke-virtual {p1, p5}, Landroid/widget/EditText;->setScaleX(F)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 87
    .line 88
    invoke-virtual {p0, p5}, Landroid/widget/EditText;->setScaleY(F)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method static synthetic J(LT0/p;)Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic J0(Landroid/animation/ValueAnimator;)V
    .locals 2

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
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 14
    .line 15
    const/16 v1, 0x20

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 24
    .line 25
    const v0, 0x7f0b0499

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setAlpha(F)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method static synthetic K(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic K0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p6

    .line 5
    check-cast p6, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p6}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p6

    .line 11
    iget-object p0, p0, LT0/p;->r:LT0/p$g;

    .line 12
    .line 13
    invoke-virtual {p0, p6}, LT0/p$g;->f(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p6}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p6}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    if-eqz p3, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->k0()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p3, p6}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 42
    .line 43
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->k:Z

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p5, p6}, Lcom/android/launcher3/LongClickTextView;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method static synthetic L(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic L0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p6

    .line 5
    check-cast p6, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p6}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p6

    .line 11
    iget-object p0, p0, LT0/p;->r:LT0/p$g;

    .line 12
    .line 13
    invoke-virtual {p0, p6}, LT0/p$g;->g(F)V

    .line 14
    .line 15
    .line 16
    const/high16 p0, 0x42c80000    # 100.0f

    .line 17
    .line 18
    mul-float/2addr p6, p0

    .line 19
    invoke-static {}, Lx1/O;->q2()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Landroid/graphics/Shader$TileMode;->DECAL:Landroid/graphics/Shader$TileMode;

    .line 26
    .line 27
    invoke-static {p6, p6, p0}, Landroid/graphics/RenderEffect;->createBlurEffect(FFLandroid/graphics/Shader$TileMode;)Landroid/graphics/RenderEffect;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setRenderEffect(Landroid/graphics/RenderEffect;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setRenderEffect(Landroid/graphics/RenderEffect;)V

    .line 35
    .line 36
    .line 37
    if-eqz p3, :cond_0

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->k0()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p3, p0}, Landroid/widget/RelativeLayout;->setRenderEffect(Landroid/graphics/RenderEffect;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {p4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 57
    .line 58
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->k:Z

    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    invoke-virtual {p5, p0}, Landroid/widget/TextView;->setRenderEffect(Landroid/graphics/RenderEffect;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method static synthetic M(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic M0(Landroid/animation/ValueAnimator;)V
    .locals 2

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
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    float-to-int v1, p1

    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 32
    .line 33
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 40
    .line 41
    const/high16 v0, 0x437f0000    # 255.0f

    .line 42
    .line 43
    div-float/2addr p1, v0

    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setAlpha(F)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method static synthetic N(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic N0(Landroid/animation/ValueAnimator;)V
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
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method static synthetic O(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method private O0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getCloudFolder()Lcom/android/launcher3/cloudfolder/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getCloudFolder()Lcom/android/launcher3/cloudfolder/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/cloudfolder/a;->i()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getCloudFolder()Lcom/android/launcher3/cloudfolder/a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Lcom/android/launcher3/cloudfolder/a;->o(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic P(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method private P0(Landroid/animation/AnimatorSet;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

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
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Lx1/O;->d2()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0, p1}, LT0/p;->R0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0, p1}, LT0/p;->Q0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method static synthetic Q(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic R(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic S(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic T(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic U(LT0/p;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic V(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic W(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic X(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic Y(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic Z(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic a0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic b0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic c0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic d0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic e0(LT0/p;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic f0(LT0/p;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic g0(LT0/p;)Lcom/android/launcher3/folder/FolderIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic h0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic i0(LT0/p;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method static synthetic j0(LT0/p;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(ILjava/util/ArrayList;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ge p0, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 p0, p0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method static synthetic k0(LT0/p;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(LT0/p;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LT0/p;->N0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic l0(LT0/p;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Landroid/view/View;Landroid/animation/ValueAnimator;)V
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
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method static synthetic m0(LT0/p;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/C2;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    check-cast p5, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    invoke-virtual {p0, p5}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p5}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 18
    .line 19
    invoke-interface {p1, p0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p2, p5}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, p5}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 29
    .line 30
    .line 31
    :cond_0
    if-eqz p3, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->k0()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p3, p5}, Landroid/widget/RelativeLayout;->setScaleX(F)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3, p5}, Landroid/widget/RelativeLayout;->setScaleY(F)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 54
    .line 55
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->k:Z

    .line 56
    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setScaleX(F)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setScaleY(F)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method static synthetic n0(LT0/p;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(LT0/p;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LT0/p;->J0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic o0(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/C2;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    check-cast p5, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    invoke-virtual {p0, p5}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 15
    .line 16
    invoke-interface {p1, p0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p2, p5}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    if-eqz p3, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->k0()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p3, p5}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 45
    .line 46
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->k:Z

    .line 47
    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-virtual {p4, p5}, Lcom/android/launcher3/LongClickTextView;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method static synthetic p0(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(LT0/p;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, LT0/p;->L0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic q0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Lcom/android/launcher3/anim/C;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/anim/C;->F:Z

    .line 3
    .line 4
    return-void
.end method

.method static synthetic r0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Lcom/android/launcher3/BubbleTextView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method static synthetic s0(LT0/p;)Lcom/android/launcher3/folder/Folder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t(Landroid/view/View;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public static synthetic u(LT0/p;Lcom/android/launcher3/BubbleTextView;Landroid/graphics/Paint;ZI[ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, LT0/p;->G0(Lcom/android/launcher3/BubbleTextView;Landroid/graphics/Paint;ZI[ILandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(LT0/p;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LT0/p;->M0(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v0(Lcom/android/launcher3/folder/FolderIcon;Landroid/view/View;)Landroid/graphics/PointF;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, LT0/p;->F0(Lcom/android/launcher3/folder/FolderIcon;Landroid/view/View;)Lcom/android/launcher3/folder/y0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-array p2, v0, [F

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    new-instance p0, Landroid/graphics/PointF;

    .line 18
    .line 19
    aget p1, p2, v2

    .line 20
    .line 21
    aget p2, p2, v0

    .line 22
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getPreviewItemManager()Lcom/android/launcher3/folder/A0;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getFolderBackground()Lcom/android/launcher3/folder/u0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v3, v4}, Lcom/android/launcher3/folder/A0;->z(Lcom/android/launcher3/folder/u0;)Landroid/graphics/Rect;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget v4, p0, Lcom/android/launcher3/folder/y0;->a:F

    .line 44
    .line 45
    float-to-int v4, v4

    .line 46
    invoke-virtual {p1, v4, p2}, Lcom/android/launcher3/folder/i0;->b(I[F)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    aget v4, v1, v2

    .line 56
    .line 57
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    add-int/2addr v4, v5

    .line 60
    int-to-float v4, v4

    .line 61
    aget v2, p2, v2

    .line 62
    .line 63
    add-float/2addr v4, v2

    .line 64
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    int-to-float v2, v2

    .line 69
    iget v5, p0, Lcom/android/launcher3/folder/y0;->d:F

    .line 70
    .line 71
    mul-float/2addr v2, v5

    .line 72
    sub-float/2addr v4, v2

    .line 73
    aget v1, v1, v0

    .line 74
    .line 75
    iget v2, v3, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    add-int/2addr v1, v2

    .line 78
    int-to-float v1, v1

    .line 79
    aget p2, p2, v0

    .line 80
    .line 81
    add-float/2addr v1, p2

    .line 82
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    int-to-float p1, p1

    .line 87
    iget p0, p0, Lcom/android/launcher3/folder/y0;->d:F

    .line 88
    .line 89
    mul-float/2addr p1, p0

    .line 90
    sub-float/2addr v1, p1

    .line 91
    new-instance p0, Landroid/graphics/PointF;

    .line 92
    .line 93
    invoke-direct {p0, v4, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 94
    .line 95
    .line 96
    return-object p0
.end method

.method public static synthetic w(LT0/p;FFFFFFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, LT0/p;->I0(FFFFFFLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(LT0/p;FLcom/android/launcher3/C2;FFFFFFLandroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p10}, LT0/p;->H0(FLcom/android/launcher3/C2;FFFFFFLandroid/view/View;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(LT0/p;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, LT0/p;->K0(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic z(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A0(Lcom/android/launcher3/folder/FolderIcon;)Landroid/animation/AnimatorSet;
    .locals 31

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/4 v11, 0x0

    .line 4
    const/4 v12, 0x1

    .line 5
    const/4 v13, 0x2

    .line 6
    const-string v0, "FolderAnimationManagerMFV"

    .line 7
    .line 8
    const-string v2, "getFolderChildTransformsAndScaleAnim: "

    .line 9
    .line 10
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    new-instance v14, Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-direct {v14}, Landroid/animation/AnimatorSet;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v0, v1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-nez v3, :cond_0

    .line 27
    .line 28
    goto/16 :goto_d

    .line 29
    .line 30
    :cond_0
    iget-object v0, v1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    const/high16 v16, 0x3f800000    # 1.0f

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-interface {v0}, Lcom/android/launcher3/folder/Folder$k;->b()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    move/from16 v16, v0

    .line 44
    .line 45
    :goto_0
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/android/launcher3/V3;

    .line 54
    .line 55
    invoke-virtual {v0, v3}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v0, v0, Lcom/android/launcher3/V3$h;->a:F

    .line 60
    .line 61
    iget-object v4, v1, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 62
    .line 63
    move-object/from16 v2, p1

    .line 64
    .line 65
    iget-object v9, v2, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 66
    .line 67
    iget v5, v9, Lcom/android/launcher3/model/data/p;->k:I

    .line 68
    .line 69
    iget v6, v9, Lcom/android/launcher3/model/data/p;->l:I

    .line 70
    .line 71
    iget v7, v9, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 72
    .line 73
    iget v8, v9, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 74
    .line 75
    invoke-static/range {v4 .. v9}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->d1(Landroid/content/Context;IIIILcom/android/launcher3/model/data/p;)Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iget-object v4, v1, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 80
    .line 81
    instance-of v5, v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 82
    .line 83
    if-eqz v5, :cond_2

    .line 84
    .line 85
    iget v2, v2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$o;->j:I

    .line 86
    .line 87
    :goto_1
    int-to-float v2, v2

    .line 88
    move/from16 v17, v2

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_2
    invoke-virtual {v4}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v2}, Lcom/android/launcher3/folder/i0;->c()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    goto :goto_1

    .line 100
    :goto_2
    new-instance v2, Ljava/util/ArrayList;

    .line 101
    .line 102
    iget-object v4, v1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 103
    .line 104
    invoke-virtual {v4, v11}, Lcom/android/launcher3/folder/FolderPagedView;->g0(I)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 109
    .line 110
    .line 111
    new-array v4, v13, [F

    .line 112
    .line 113
    move v5, v11

    .line 114
    :goto_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    if-ge v5, v6, :cond_11

    .line 119
    .line 120
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    move-object v10, v6

    .line 125
    check-cast v10, Landroid/view/View;

    .line 126
    .line 127
    new-array v6, v13, [I

    .line 128
    .line 129
    new-array v7, v13, [F

    .line 130
    .line 131
    iget-object v8, v1, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 132
    .line 133
    new-instance v9, LT0/o;

    .line 134
    .line 135
    invoke-direct {v9, v10}, LT0/o;-><init>(Landroid/view/View;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v8, v9}, Lcom/android/launcher3/folder/FolderIcon;->R(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v8

    .line 142
    if-eqz v8, :cond_3

    .line 143
    .line 144
    invoke-virtual {v8, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 145
    .line 146
    .line 147
    instance-of v9, v8, Lcom/android/launcher3/BubbleTextView;

    .line 148
    .line 149
    if-eqz v9, :cond_4

    .line 150
    .line 151
    aget v9, v6, v11

    .line 152
    .line 153
    int-to-float v9, v9

    .line 154
    aput v9, v7, v11

    .line 155
    .line 156
    aput v9, v4, v11

    .line 157
    .line 158
    aget v6, v6, v12

    .line 159
    .line 160
    int-to-float v6, v6

    .line 161
    aput v6, v7, v12

    .line 162
    .line 163
    aput v6, v4, v12

    .line 164
    .line 165
    goto :goto_4

    .line 166
    :cond_3
    aget v6, v4, v11

    .line 167
    .line 168
    aput v6, v7, v11

    .line 169
    .line 170
    aget v6, v4, v12

    .line 171
    .line 172
    aput v6, v7, v12

    .line 173
    .line 174
    iget-object v6, v1, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 175
    .line 176
    iget-boolean v6, v6, Lcom/android/launcher3/X3;->B0:Z

    .line 177
    .line 178
    if-nez v6, :cond_4

    .line 179
    .line 180
    iget-object v6, v1, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 181
    .line 182
    invoke-direct {v1, v6, v10}, LT0/p;->v0(Lcom/android/launcher3/folder/FolderIcon;Landroid/view/View;)Landroid/graphics/PointF;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    iget v6, v6, Landroid/graphics/PointF;->x:F

    .line 187
    .line 188
    aput v6, v7, v11

    .line 189
    .line 190
    iget-object v6, v1, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 191
    .line 192
    invoke-direct {v1, v6, v10}, LT0/p;->v0(Lcom/android/launcher3/folder/FolderIcon;Landroid/view/View;)Landroid/graphics/PointF;

    .line 193
    .line 194
    .line 195
    move-result-object v6

    .line 196
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 197
    .line 198
    aput v6, v7, v12

    .line 199
    .line 200
    :cond_4
    :goto_4
    new-array v6, v13, [F

    .line 201
    .line 202
    iget-object v9, v1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 203
    .line 204
    invoke-virtual {v9, v11}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    if-nez v9, :cond_5

    .line 209
    .line 210
    goto/16 :goto_d

    .line 211
    .line 212
    :cond_5
    move/from16 v18, v11

    .line 213
    .line 214
    iget-object v11, v1, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 215
    .line 216
    iget v11, v11, Lcom/android/launcher3/h0;->X1:I

    .line 217
    .line 218
    int-to-float v11, v11

    .line 219
    mul-float v11, v11, v16

    .line 220
    .line 221
    move/from16 v19, v12

    .line 222
    .line 223
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 224
    .line 225
    .line 226
    move-result v12

    .line 227
    int-to-float v12, v12

    .line 228
    mul-float v12, v12, v16

    .line 229
    .line 230
    const/high16 v20, 0x3f800000    # 1.0f

    .line 231
    .line 232
    instance-of v15, v10, Lcom/android/launcher3/BubbleTextView;

    .line 233
    .line 234
    if-eqz v15, :cond_10

    .line 235
    .line 236
    move-object v15, v10

    .line 237
    check-cast v15, Lcom/android/launcher3/BubbleTextView;

    .line 238
    .line 239
    invoke-virtual {v15}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 240
    .line 241
    .line 242
    move-result-object v21

    .line 243
    move-object/from16 v22, v21

    .line 244
    .line 245
    check-cast v22, Lc1/b;

    .line 246
    .line 247
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 248
    .line 249
    .line 250
    move-result v23

    .line 251
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 252
    .line 253
    .line 254
    move-result v24

    .line 255
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 256
    .line 257
    .line 258
    move-result v26

    .line 259
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 260
    .line 261
    .line 262
    move-result v27

    .line 263
    iget-object v13, v1, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 264
    .line 265
    iget-object v13, v13, Lcom/android/launcher3/h0;->S1:Landroid/graphics/Point;

    .line 266
    .line 267
    const/16 v25, 0x0

    .line 268
    .line 269
    move-object/from16 v28, v13

    .line 270
    .line 271
    invoke-virtual/range {v22 .. v28}, Lc1/b;->k(IIZIILandroid/graphics/Point;)V

    .line 272
    .line 273
    .line 274
    move-object/from16 v13, v22

    .line 275
    .line 276
    move/from16 v22, v0

    .line 277
    .line 278
    invoke-virtual {v1}, LT0/p;->t0()Landroid/graphics/PointF;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 283
    .line 284
    move/from16 v23, v0

    .line 285
    .line 286
    iget v0, v13, Lc1/b;->j:I

    .line 287
    .line 288
    int-to-float v0, v0

    .line 289
    mul-float v0, v0, v16

    .line 290
    .line 291
    add-float v0, v23, v0

    .line 292
    .line 293
    aput v0, v6, v18

    .line 294
    .line 295
    invoke-virtual {v1}, LT0/p;->t0()Landroid/graphics/PointF;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 300
    .line 301
    iget v13, v13, Lc1/b;->k:I

    .line 302
    .line 303
    int-to-float v13, v13

    .line 304
    mul-float v13, v13, v16

    .line 305
    .line 306
    add-float/2addr v0, v13

    .line 307
    aput v0, v6, v19

    .line 308
    .line 309
    iget-object v0, v1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 310
    .line 311
    iget-boolean v0, v0, Lcom/android/launcher3/folder/FolderPagedView;->j:Z

    .line 312
    .line 313
    if-eqz v0, :cond_6

    .line 314
    .line 315
    iget-object v0, v1, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 316
    .line 317
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 318
    .line 319
    int-to-float v0, v0

    .line 320
    aget v13, v6, v18

    .line 321
    .line 322
    add-float/2addr v13, v12

    .line 323
    sub-float/2addr v0, v13

    .line 324
    aput v0, v6, v18

    .line 325
    .line 326
    :cond_6
    instance-of v0, v8, Lcom/android/launcher3/BubbleTextView;

    .line 327
    .line 328
    if-eqz v0, :cond_7

    .line 329
    .line 330
    move-object v13, v8

    .line 331
    check-cast v13, Lcom/android/launcher3/BubbleTextView;

    .line 332
    .line 333
    invoke-virtual {v13}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 334
    .line 335
    .line 336
    move-result v13

    .line 337
    int-to-float v13, v13

    .line 338
    mul-float v13, v13, v22

    .line 339
    .line 340
    goto :goto_5

    .line 341
    :cond_7
    mul-float v13, v17, v22

    .line 342
    .line 343
    :goto_5
    div-float v23, v11, v13

    .line 344
    .line 345
    if-eqz v0, :cond_8

    .line 346
    .line 347
    move-object v0, v8

    .line 348
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 349
    .line 350
    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    int-to-float v0, v0

    .line 355
    mul-float v0, v0, v22

    .line 356
    .line 357
    goto :goto_6

    .line 358
    :cond_8
    mul-float v0, v17, v22

    .line 359
    .line 360
    :goto_6
    invoke-virtual {v15}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 361
    .line 362
    .line 363
    move-result-object v24

    .line 364
    move/from16 p1, v0

    .line 365
    .line 366
    invoke-virtual/range {v24 .. v24}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    move-object/from16 v24, v2

    .line 371
    .line 372
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 373
    .line 374
    .line 375
    move-result v2

    .line 376
    invoke-virtual {v15, v0, v2}, Lcom/android/launcher3/BubbleTextView;->O(Landroid/graphics/Paint$FontMetrics;I)I

    .line 377
    .line 378
    .line 379
    move-result v0

    .line 380
    int-to-float v0, v0

    .line 381
    mul-float v0, v0, v16

    .line 382
    .line 383
    const/16 v25, 0x0

    .line 384
    .line 385
    if-eqz v8, :cond_9

    .line 386
    .line 387
    invoke-virtual {v8}, Landroid/view/View;->getPaddingTop()I

    .line 388
    .line 389
    .line 390
    move-result v2

    .line 391
    int-to-float v2, v2

    .line 392
    mul-float v2, v2, v22

    .line 393
    .line 394
    goto :goto_7

    .line 395
    :cond_9
    move/from16 v2, v25

    .line 396
    .line 397
    :goto_7
    aget v26, v6, v18

    .line 398
    .line 399
    aget v27, v7, v18

    .line 400
    .line 401
    const/high16 v28, 0x40000000    # 2.0f

    .line 402
    .line 403
    div-float v12, v12, v28

    .line 404
    .line 405
    div-float v29, p1, v28

    .line 406
    .line 407
    sub-float v12, v12, v29

    .line 408
    .line 409
    sub-float v27, v27, v12

    .line 410
    .line 411
    sub-float v26, v26, v27

    .line 412
    .line 413
    aget v6, v6, v19

    .line 414
    .line 415
    aget v7, v7, v19

    .line 416
    .line 417
    div-float v11, v11, v28

    .line 418
    .line 419
    div-float v13, v13, v28

    .line 420
    .line 421
    sub-float/2addr v11, v13

    .line 422
    sub-float/2addr v11, v2

    .line 423
    sub-float/2addr v7, v11

    .line 424
    sub-float/2addr v7, v0

    .line 425
    sub-float/2addr v6, v7

    .line 426
    div-float v0, v26, v16

    .line 427
    .line 428
    div-float v6, v6, v16

    .line 429
    .line 430
    neg-float v0, v0

    .line 431
    neg-float v2, v6

    .line 432
    div-float v6, v20, v23

    .line 433
    .line 434
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 435
    .line 436
    .line 437
    move-result v7

    .line 438
    int-to-float v7, v7

    .line 439
    div-float v7, v7, v28

    .line 440
    .line 441
    invoke-virtual {v10, v7}, Landroid/view/View;->setPivotX(F)V

    .line 442
    .line 443
    .line 444
    invoke-virtual {v15}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 445
    .line 446
    .line 447
    move-result-object v7

    .line 448
    invoke-virtual {v7}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 449
    .line 450
    .line 451
    move-result-object v7

    .line 452
    invoke-virtual {v9}, Lcom/android/launcher3/CellLayout;->getCellHeight()I

    .line 453
    .line 454
    .line 455
    move-result v9

    .line 456
    invoke-virtual {v15, v7, v9}, Lcom/android/launcher3/BubbleTextView;->O(Landroid/graphics/Paint$FontMetrics;I)I

    .line 457
    .line 458
    .line 459
    move-result v7

    .line 460
    int-to-float v7, v7

    .line 461
    iget-object v9, v1, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 462
    .line 463
    iget v9, v9, Lcom/android/launcher3/h0;->X1:I

    .line 464
    .line 465
    int-to-float v9, v9

    .line 466
    div-float v9, v9, v28

    .line 467
    .line 468
    add-float/2addr v7, v9

    .line 469
    invoke-virtual {v10, v7}, Landroid/view/View;->setPivotY(F)V

    .line 470
    .line 471
    .line 472
    const/4 v7, 0x2

    .line 473
    new-array v9, v7, [F

    .line 474
    .line 475
    fill-array-data v9, :array_0

    .line 476
    .line 477
    .line 478
    invoke-static {v9}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 479
    .line 480
    .line 481
    move-result-object v11

    .line 482
    iget-boolean v7, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 483
    .line 484
    if-eqz v7, :cond_a

    .line 485
    .line 486
    iget-object v7, v1, LT0/p;->s:LT0/p$f;

    .line 487
    .line 488
    iget v7, v7, LT0/p$f;->b:I

    .line 489
    .line 490
    :goto_8
    int-to-long v12, v7

    .line 491
    goto :goto_9

    .line 492
    :cond_a
    iget-object v7, v1, LT0/p;->s:LT0/p$f;

    .line 493
    .line 494
    iget v7, v7, LT0/p$f;->c:I

    .line 495
    .line 496
    goto :goto_8

    .line 497
    :goto_9
    invoke-virtual {v11, v12, v13}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 498
    .line 499
    .line 500
    iget-boolean v7, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 501
    .line 502
    if-eqz v7, :cond_b

    .line 503
    .line 504
    sget-object v7, Lcom/android/launcher3/anim/L;->M:Landroid/view/animation/Interpolator;

    .line 505
    .line 506
    goto :goto_a

    .line 507
    :cond_b
    sget-object v7, Lcom/android/launcher3/anim/L;->N:Landroid/view/animation/Interpolator;

    .line 508
    .line 509
    :goto_a
    invoke-virtual {v11, v7}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 510
    .line 511
    .line 512
    iget-boolean v7, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 513
    .line 514
    if-eqz v7, :cond_c

    .line 515
    .line 516
    sub-float v7, v25, v0

    .line 517
    .line 518
    iget-object v9, v1, LT0/p;->r:LT0/p$g;

    .line 519
    .line 520
    invoke-virtual {v9}, LT0/p$g;->c()F

    .line 521
    .line 522
    .line 523
    move-result v9

    .line 524
    mul-float/2addr v7, v9

    .line 525
    add-float/2addr v7, v0

    .line 526
    sub-float/2addr v0, v7

    .line 527
    iget-object v9, v1, LT0/p;->r:LT0/p$g;

    .line 528
    .line 529
    invoke-virtual {v9}, LT0/p$g;->d()F

    .line 530
    .line 531
    .line 532
    move-result v9

    .line 533
    mul-float/2addr v0, v9

    .line 534
    add-float/2addr v7, v0

    .line 535
    sub-float v0, v25, v2

    .line 536
    .line 537
    iget-object v9, v1, LT0/p;->r:LT0/p$g;

    .line 538
    .line 539
    invoke-virtual {v9}, LT0/p$g;->c()F

    .line 540
    .line 541
    .line 542
    move-result v9

    .line 543
    mul-float/2addr v0, v9

    .line 544
    add-float/2addr v0, v2

    .line 545
    sub-float/2addr v2, v0

    .line 546
    iget-object v9, v1, LT0/p;->r:LT0/p$g;

    .line 547
    .line 548
    invoke-virtual {v9}, LT0/p$g;->d()F

    .line 549
    .line 550
    .line 551
    move-result v9

    .line 552
    mul-float/2addr v2, v9

    .line 553
    add-float/2addr v0, v2

    .line 554
    sub-float v15, v20, v6

    .line 555
    .line 556
    iget-object v2, v1, LT0/p;->r:LT0/p$g;

    .line 557
    .line 558
    invoke-virtual {v2}, LT0/p$g;->c()F

    .line 559
    .line 560
    .line 561
    move-result v2

    .line 562
    mul-float/2addr v15, v2

    .line 563
    add-float/2addr v15, v6

    .line 564
    sub-float/2addr v6, v15

    .line 565
    iget-object v2, v1, LT0/p;->r:LT0/p$g;

    .line 566
    .line 567
    invoke-virtual {v2}, LT0/p$g;->d()F

    .line 568
    .line 569
    .line 570
    move-result v2

    .line 571
    mul-float/2addr v6, v2

    .line 572
    add-float/2addr v15, v6

    .line 573
    move v6, v0

    .line 574
    move-object v0, v4

    .line 575
    move v4, v7

    .line 576
    move/from16 v9, v20

    .line 577
    .line 578
    move/from16 v2, v25

    .line 579
    .line 580
    move v7, v2

    .line 581
    goto :goto_b

    .line 582
    :cond_c
    sub-float v7, v0, v25

    .line 583
    .line 584
    iget-object v9, v1, LT0/p;->r:LT0/p$g;

    .line 585
    .line 586
    invoke-virtual {v9}, LT0/p$g;->d()F

    .line 587
    .line 588
    .line 589
    move-result v9

    .line 590
    mul-float/2addr v7, v9

    .line 591
    add-float v7, v7, v25

    .line 592
    .line 593
    sub-float v9, v25, v7

    .line 594
    .line 595
    iget-object v12, v1, LT0/p;->r:LT0/p$g;

    .line 596
    .line 597
    invoke-virtual {v12}, LT0/p$g;->c()F

    .line 598
    .line 599
    .line 600
    move-result v12

    .line 601
    mul-float/2addr v9, v12

    .line 602
    add-float/2addr v7, v9

    .line 603
    sub-float v9, v2, v25

    .line 604
    .line 605
    iget-object v12, v1, LT0/p;->r:LT0/p$g;

    .line 606
    .line 607
    invoke-virtual {v12}, LT0/p$g;->d()F

    .line 608
    .line 609
    .line 610
    move-result v12

    .line 611
    mul-float/2addr v9, v12

    .line 612
    add-float v9, v9, v25

    .line 613
    .line 614
    sub-float v12, v25, v9

    .line 615
    .line 616
    iget-object v13, v1, LT0/p;->r:LT0/p$g;

    .line 617
    .line 618
    invoke-virtual {v13}, LT0/p$g;->c()F

    .line 619
    .line 620
    .line 621
    move-result v13

    .line 622
    mul-float/2addr v12, v13

    .line 623
    add-float/2addr v9, v12

    .line 624
    sub-float v12, v6, v20

    .line 625
    .line 626
    iget-object v13, v1, LT0/p;->r:LT0/p$g;

    .line 627
    .line 628
    invoke-virtual {v13}, LT0/p$g;->d()F

    .line 629
    .line 630
    .line 631
    move-result v13

    .line 632
    mul-float/2addr v12, v13

    .line 633
    add-float v12, v12, v20

    .line 634
    .line 635
    sub-float v15, v20, v12

    .line 636
    .line 637
    iget-object v13, v1, LT0/p;->r:LT0/p$g;

    .line 638
    .line 639
    invoke-virtual {v13}, LT0/p$g;->c()F

    .line 640
    .line 641
    .line 642
    move-result v13

    .line 643
    mul-float/2addr v15, v13

    .line 644
    add-float/2addr v15, v12

    .line 645
    move/from16 v30, v2

    .line 646
    .line 647
    move v2, v0

    .line 648
    move-object v0, v4

    .line 649
    move v4, v7

    .line 650
    move/from16 v7, v30

    .line 651
    .line 652
    move/from16 v30, v9

    .line 653
    .line 654
    move v9, v6

    .line 655
    move/from16 v6, v30

    .line 656
    .line 657
    :goto_b
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 658
    .line 659
    .line 660
    move-result-object v12

    .line 661
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getScrollX()I

    .line 662
    .line 663
    .line 664
    move-result v12

    .line 665
    int-to-float v12, v12

    .line 666
    move-object v13, v0

    .line 667
    new-instance v0, LT0/b;

    .line 668
    .line 669
    move/from16 v30, v5

    .line 670
    .line 671
    move v5, v2

    .line 672
    move v2, v12

    .line 673
    move/from16 v12, v30

    .line 674
    .line 675
    move/from16 v30, v15

    .line 676
    .line 677
    move-object v15, v8

    .line 678
    move/from16 v8, v30

    .line 679
    .line 680
    invoke-direct/range {v0 .. v10}, LT0/b;-><init>(LT0/p;FLcom/android/launcher3/C2;FFFFFFLandroid/view/View;)V

    .line 681
    .line 682
    .line 683
    invoke-virtual {v11, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 684
    .line 685
    .line 686
    invoke-virtual {v1, v10}, LT0/p;->z0(Landroid/view/View;)Landroid/animation/ValueAnimator;

    .line 687
    .line 688
    .line 689
    move-result-object v0

    .line 690
    invoke-virtual {v1, v15, v10}, LT0/p;->y0(Landroid/view/View;Landroid/view/View;)Landroid/animation/Animator;

    .line 691
    .line 692
    .line 693
    move-result-object v2

    .line 694
    if-eqz v0, :cond_d

    .line 695
    .line 696
    if-eqz v2, :cond_d

    .line 697
    .line 698
    const/4 v4, 0x3

    .line 699
    new-array v4, v4, [Landroid/animation/Animator;

    .line 700
    .line 701
    aput-object v11, v4, v18

    .line 702
    .line 703
    aput-object v0, v4, v19

    .line 704
    .line 705
    const/4 v7, 0x2

    .line 706
    aput-object v2, v4, v7

    .line 707
    .line 708
    invoke-virtual {v14, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 709
    .line 710
    .line 711
    goto :goto_c

    .line 712
    :cond_d
    const/4 v7, 0x2

    .line 713
    if-eqz v0, :cond_e

    .line 714
    .line 715
    new-array v2, v7, [Landroid/animation/Animator;

    .line 716
    .line 717
    aput-object v11, v2, v18

    .line 718
    .line 719
    aput-object v0, v2, v19

    .line 720
    .line 721
    invoke-virtual {v14, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 722
    .line 723
    .line 724
    goto :goto_c

    .line 725
    :cond_e
    if-eqz v2, :cond_f

    .line 726
    .line 727
    new-array v0, v7, [Landroid/animation/Animator;

    .line 728
    .line 729
    aput-object v11, v0, v18

    .line 730
    .line 731
    aput-object v2, v0, v19

    .line 732
    .line 733
    invoke-virtual {v14, v0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 734
    .line 735
    .line 736
    goto :goto_c

    .line 737
    :cond_f
    invoke-virtual {v14, v11}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 738
    .line 739
    .line 740
    goto :goto_c

    .line 741
    :cond_10
    move/from16 v22, v0

    .line 742
    .line 743
    move-object/from16 v24, v2

    .line 744
    .line 745
    move v12, v5

    .line 746
    move v7, v13

    .line 747
    move-object v13, v4

    .line 748
    :goto_c
    add-int/lit8 v5, v12, 0x1

    .line 749
    .line 750
    move-object v4, v13

    .line 751
    move/from16 v11, v18

    .line 752
    .line 753
    move/from16 v12, v19

    .line 754
    .line 755
    move/from16 v0, v22

    .line 756
    .line 757
    move-object/from16 v2, v24

    .line 758
    .line 759
    move v13, v7

    .line 760
    goto/16 :goto_3

    .line 761
    .line 762
    :cond_11
    :goto_d
    return-object v14

    .line 763
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public B0()Landroid/animation/AnimatorSet;
    .locals 14

    .line 1
    const/4 v8, 0x2

    .line 2
    new-array v0, v8, [I

    .line 3
    .line 4
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 5
    .line 6
    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    const/4 v9, 0x0

    .line 10
    aget v2, v0, v9

    .line 11
    .line 12
    int-to-float v2, v2

    .line 13
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 14
    .line 15
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    int-to-float v3, v3

    .line 20
    const/high16 v4, 0x40000000    # 2.0f

    .line 21
    .line 22
    div-float/2addr v3, v4

    .line 23
    add-float/2addr v2, v3

    .line 24
    invoke-virtual {p0}, LT0/p;->C0()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    div-float/2addr v3, v4

    .line 29
    sub-float/2addr v2, v3

    .line 30
    const/4 v10, 0x1

    .line 31
    aget v0, v0, v10

    .line 32
    .line 33
    int-to-float v0, v0

    .line 34
    invoke-virtual {p0}, LT0/p;->u0()[F

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    aget v3, v3, v9

    .line 39
    .line 40
    sub-float/2addr v3, v2

    .line 41
    invoke-virtual {p0}, LT0/p;->u0()[F

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    aget v2, v2, v10

    .line 46
    .line 47
    sub-float/2addr v2, v0

    .line 48
    const/4 v0, 0x0

    .line 49
    const/high16 v4, 0x3f800000    # 1.0f

    .line 50
    .line 51
    new-array v5, v8, [F

    .line 52
    .line 53
    fill-array-data v5, :array_0

    .line 54
    .line 55
    .line 56
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v11

    .line 60
    iget-boolean v5, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 61
    .line 62
    if-eqz v5, :cond_0

    .line 63
    .line 64
    sget-object v5, LT0/p;->t:Landroid/view/animation/Interpolator;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    sget-object v5, LT0/p;->u:Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    :goto_0
    invoke-virtual {v11, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 70
    .line 71
    .line 72
    iget-boolean v5, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 73
    .line 74
    if-eqz v5, :cond_1

    .line 75
    .line 76
    iget-object v5, p0, LT0/p;->s:LT0/p$f;

    .line 77
    .line 78
    iget v5, v5, LT0/p$f;->b:I

    .line 79
    .line 80
    :goto_1
    int-to-long v5, v5

    .line 81
    goto :goto_2

    .line 82
    :cond_1
    iget-object v5, p0, LT0/p;->s:LT0/p$f;

    .line 83
    .line 84
    iget v5, v5, LT0/p$f;->c:I

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :goto_2
    invoke-virtual {v11, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 88
    .line 89
    .line 90
    iget-boolean v5, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 91
    .line 92
    if-eqz v5, :cond_2

    .line 93
    .line 94
    neg-float v3, v3

    .line 95
    neg-float v2, v2

    .line 96
    move v5, v0

    .line 97
    move v6, v5

    .line 98
    move v12, v6

    .line 99
    move v7, v4

    .line 100
    move v13, v7

    .line 101
    move v4, v2

    .line 102
    move v2, v3

    .line 103
    move v3, v12

    .line 104
    goto :goto_3

    .line 105
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 106
    .line 107
    iget-object v4, v4, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 108
    .line 109
    invoke-virtual {v4}, Landroid/widget/EditText;->getTranslationX()F

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    neg-float v3, v3

    .line 114
    iget-object v5, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 115
    .line 116
    iget-object v5, v5, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 117
    .line 118
    invoke-virtual {v5}, Landroid/widget/EditText;->getTranslationY()F

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    neg-float v2, v2

    .line 123
    iget-object v6, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 124
    .line 125
    iget-object v6, v6, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 126
    .line 127
    invoke-virtual {v6}, Landroid/widget/EditText;->getScaleX()F

    .line 128
    .line 129
    .line 130
    move-result v6

    .line 131
    iget-object v7, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 132
    .line 133
    iget-object v7, v7, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 134
    .line 135
    invoke-virtual {v7}, Landroid/widget/EditText;->getAlpha()F

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    move v12, v5

    .line 140
    move v5, v2

    .line 141
    move v2, v4

    .line 142
    move v4, v12

    .line 143
    move v13, v0

    .line 144
    move v12, v7

    .line 145
    move v7, v13

    .line 146
    :goto_3
    new-instance v0, LT0/j;

    .line 147
    .line 148
    move-object v1, p0

    .line 149
    invoke-direct/range {v0 .. v7}, LT0/j;-><init>(LT0/p;FFFFFF)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v11, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 153
    .line 154
    .line 155
    new-array v0, v8, [F

    .line 156
    .line 157
    aput v12, v0, v9

    .line 158
    .line 159
    aput v13, v0, v10

    .line 160
    .line 161
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-boolean v2, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 166
    .line 167
    if-eqz v2, :cond_3

    .line 168
    .line 169
    sget v2, LT0/p;->v:I

    .line 170
    .line 171
    :goto_4
    int-to-long v2, v2

    .line 172
    goto :goto_5

    .line 173
    :cond_3
    sget v2, LT0/p;->v:I

    .line 174
    .line 175
    add-int/lit8 v2, v2, -0x64

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :goto_5
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 179
    .line 180
    .line 181
    iget-boolean v2, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 182
    .line 183
    if-eqz v2, :cond_4

    .line 184
    .line 185
    sget-object v2, LT0/p;->t:Landroid/view/animation/Interpolator;

    .line 186
    .line 187
    goto :goto_6

    .line 188
    :cond_4
    sget-object v2, LT0/p;->u:Landroid/view/animation/Interpolator;

    .line 189
    .line 190
    :goto_6
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 191
    .line 192
    .line 193
    iget-boolean v2, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 194
    .line 195
    if-eqz v2, :cond_5

    .line 196
    .line 197
    const-wide/16 v2, 0x64

    .line 198
    .line 199
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 200
    .line 201
    .line 202
    :cond_5
    new-instance v2, LT0/k;

    .line 203
    .line 204
    invoke-direct {v2, p0}, LT0/k;-><init>(LT0/p;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 208
    .line 209
    .line 210
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 211
    .line 212
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 213
    .line 214
    .line 215
    new-array v3, v8, [Landroid/animation/Animator;

    .line 216
    .line 217
    aput-object v11, v3, v9

    .line 218
    .line 219
    aput-object v0, v3, v10

    .line 220
    .line 221
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 222
    .line 223
    .line 224
    new-instance v0, LT0/p$b;

    .line 225
    .line 226
    invoke-direct {v0, p0}, LT0/p$b;-><init>(LT0/p;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 230
    .line 231
    .line 232
    return-object v2

    .line 233
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public C0()F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getFolderWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-int/2addr v0, v1

    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    sub-int/2addr v0, v1

    .line 21
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getFooter()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v0, v1

    .line 32
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getFooter()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    sub-int/2addr v0, p0

    .line 43
    int-to-float p0, v0

    .line 44
    return p0
.end method

.method public E0()Landroid/animation/AnimatorSet;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 19
    .line 20
    iget v4, v3, Lcom/android/launcher3/folder/Folder;->t0:F

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 26
    .line 27
    iget v4, v3, Lcom/android/launcher3/folder/Folder;->u0:F

    .line 28
    .line 29
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 33
    .line 34
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 38
    .line 39
    const/high16 v4, 0x3f800000    # 1.0f

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 45
    .line 46
    iget-object v3, v3, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/android/launcher3/V3;

    .line 60
    .line 61
    invoke-virtual {v3, v2}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget v2, v2, Lcom/android/launcher3/V3$h;->a:F

    .line 66
    .line 67
    const v3, 0x3f666666    # 0.9f

    .line 68
    .line 69
    .line 70
    mul-float/2addr v3, v2

    .line 71
    iget-object v5, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 72
    .line 73
    sget-object v6, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 74
    .line 75
    invoke-virtual {p0, v5, v6, v3, v2}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    iget-object v6, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 80
    .line 81
    sget-object v7, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 82
    .line 83
    invoke-virtual {p0, v6, v7, v3, v2}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 88
    .line 89
    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 90
    .line 91
    const/4 v7, 0x0

    .line 92
    invoke-virtual {p0, v3, v6, v7, v4}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-direct {p0}, LT0/p;->D0()Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const/4 v6, 0x4

    .line 101
    new-array v6, v6, [Landroid/animation/Animator;

    .line 102
    .line 103
    aput-object v3, v6, v0

    .line 104
    .line 105
    const/4 v0, 0x1

    .line 106
    aput-object v5, v6, v0

    .line 107
    .line 108
    const/4 v0, 0x2

    .line 109
    aput-object v2, v6, v0

    .line 110
    .line 111
    const/4 v0, 0x3

    .line 112
    aput-object v4, v6, v0

    .line 113
    .line 114
    invoke-virtual {v1, v6}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 115
    .line 116
    .line 117
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 118
    .line 119
    if-eqz p0, :cond_1

    .line 120
    .line 121
    invoke-static {}, LT0/p$f;->b()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    :goto_0
    int-to-long v2, p0

    .line 126
    goto :goto_1

    .line 127
    :cond_1
    invoke-static {}, LT0/p$f;->a()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    goto :goto_0

    .line 132
    :goto_1
    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 133
    .line 134
    .line 135
    sget-object p0, LT0/p;->t:Landroid/view/animation/Interpolator;

    .line 136
    .line 137
    invoke-virtual {v1, p0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 138
    .line 139
    .line 140
    return-object v1
.end method

.method public Q0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;)V
    .locals 12

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    const/high16 v3, 0x3f800000    # 1.0f

    .line 6
    .line 7
    aput v3, v1, v2

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x0

    .line 11
    aput v5, v1, v4

    .line 12
    .line 13
    iget-boolean v6, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 14
    .line 15
    if-eqz v6, :cond_0

    .line 16
    .line 17
    aput v5, v1, v4

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v5, p0, LT0/p;->r:LT0/p$g;

    .line 21
    .line 22
    invoke-virtual {v5}, LT0/p$g;->a()F

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    aput v5, v1, v2

    .line 27
    .line 28
    aput v3, v1, v4

    .line 29
    .line 30
    :goto_0
    aget v3, v1, v2

    .line 31
    .line 32
    aget v1, v1, v4

    .line 33
    .line 34
    new-array v0, v0, [F

    .line 35
    .line 36
    aput v3, v0, v2

    .line 37
    .line 38
    aput v1, v0, v4

    .line 39
    .line 40
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-wide/16 v3, 0xdc

    .line 45
    .line 46
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 69
    .line 70
    .line 71
    move-result-object v11

    .line 72
    new-instance v5, LT0/a;

    .line 73
    .line 74
    move-object v6, p0

    .line 75
    move-object v10, p1

    .line 76
    invoke-direct/range {v5 .. v11}, LT0/a;-><init>(LT0/p;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public R0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;)V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v5, p1

    .line 4
    .line 5
    move-object/from16 v7, p2

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    sget-object v4, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 11
    .line 12
    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v6

    .line 16
    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v6

    .line 20
    check-cast v6, Lcom/android/launcher3/anim/C;

    .line 21
    .line 22
    if-nez v6, :cond_0

    .line 23
    .line 24
    const-string v6, "FolderAnimationManagerMFV"

    .line 25
    .line 26
    const-string v8, "getFolderBgAnimator:  appOCAnimHelper is null. "

    .line 27
    .line 28
    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    move-object v6, v4

    .line 40
    check-cast v6, Lcom/android/launcher3/anim/C;

    .line 41
    .line 42
    :cond_0
    iput-boolean v3, v6, Lcom/android/launcher3/anim/C;->F:Z

    .line 43
    .line 44
    new-instance v4, LT0/h;

    .line 45
    .line 46
    invoke-direct {v4, v6}, LT0/h;-><init>(Lcom/android/launcher3/anim/C;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v4}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v7, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v4, v1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 57
    .line 58
    invoke-virtual {v4}, Lcom/android/launcher3/folder/Folder;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    if-eqz v4, :cond_1

    .line 63
    .line 64
    iget-boolean v6, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 65
    .line 66
    if-nez v6, :cond_1

    .line 67
    .line 68
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_1

    .line 73
    .line 74
    iget-object v4, v1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 75
    .line 76
    invoke-virtual {v4, v2}, Lcom/android/launcher3/folder/Folder;->setFolderBackground(Z)V

    .line 77
    .line 78
    .line 79
    :cond_1
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    move-object v8, v4

    .line 88
    invoke-virtual {v8}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    move-object v9, v6

    .line 93
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    new-array v10, v0, [F

    .line 98
    .line 99
    const/4 v11, 0x0

    .line 100
    aput v11, v10, v2

    .line 101
    .line 102
    const/high16 v12, 0x3f800000    # 1.0f

    .line 103
    .line 104
    aput v12, v10, v3

    .line 105
    .line 106
    iget-boolean v12, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 107
    .line 108
    if-eqz v12, :cond_2

    .line 109
    .line 110
    aput v11, v10, v2

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    iget-object v12, v1, LT0/p;->r:LT0/p$g;

    .line 114
    .line 115
    invoke-virtual {v12}, LT0/p$g;->b()F

    .line 116
    .line 117
    .line 118
    move-result v12

    .line 119
    aput v12, v10, v2

    .line 120
    .line 121
    aput v11, v10, v3

    .line 122
    .line 123
    :goto_0
    invoke-static {}, Lx1/O;->q2()Z

    .line 124
    .line 125
    .line 126
    move-result v11

    .line 127
    if-nez v11, :cond_3

    .line 128
    .line 129
    invoke-virtual/range {p0 .. p2}, LT0/p;->Q0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    instance-of v11, v5, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 133
    .line 134
    if-eqz v11, :cond_5

    .line 135
    .line 136
    move-object v11, v5

    .line 137
    check-cast v11, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 138
    .line 139
    invoke-virtual {v11}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 140
    .line 141
    .line 142
    move-result-object v12

    .line 143
    if-eqz v12, :cond_5

    .line 144
    .line 145
    invoke-virtual {v11}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 146
    .line 147
    .line 148
    move-result-object v11

    .line 149
    invoke-virtual {v11, v2}, Lcom/android/quickstep/util/BaseDepthController;->setZoom(Z)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v11, v3}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    .line 156
    .line 157
    .line 158
    move-result v12

    .line 159
    if-eqz v12, :cond_4

    .line 160
    .line 161
    invoke-virtual {v11}, LP1/h;->z()Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 162
    .line 163
    .line 164
    move-result-object v13

    .line 165
    aget v15, v10, v2

    .line 166
    .line 167
    aget v16, v10, v3

    .line 168
    .line 169
    const/high16 v17, 0x43960000    # 300.0f

    .line 170
    .line 171
    const/high16 v18, 0x3f800000    # 1.0f

    .line 172
    .line 173
    const/4 v14, 0x1

    .line 174
    invoke-virtual/range {v13 .. v18}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->depthTo(ZFFFF)Lcom/android/quickstep/util/animation/SpringAnimation;

    .line 175
    .line 176
    .line 177
    move-result-object v11

    .line 178
    invoke-virtual {v11}, Lcom/android/quickstep/util/animation/SpringAnimation;->start()V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_4
    aget v12, v10, v3

    .line 183
    .line 184
    invoke-virtual {v11, v12}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(F)V

    .line 185
    .line 186
    .line 187
    :cond_5
    :goto_1
    invoke-static {}, Lx1/O;->q2()Z

    .line 188
    .line 189
    .line 190
    move-result v11

    .line 191
    if-nez v11, :cond_6

    .line 192
    .line 193
    return-void

    .line 194
    :cond_6
    aget v11, v10, v2

    .line 195
    .line 196
    aget v10, v10, v3

    .line 197
    .line 198
    new-array v0, v0, [F

    .line 199
    .line 200
    aput v11, v0, v2

    .line 201
    .line 202
    aput v10, v0, v3

    .line 203
    .line 204
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 205
    .line 206
    .line 207
    move-result-object v10

    .line 208
    iget-boolean v0, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 209
    .line 210
    if-eqz v0, :cond_7

    .line 211
    .line 212
    iget-object v0, v1, LT0/p;->s:LT0/p$f;

    .line 213
    .line 214
    iget v0, v0, LT0/p$f;->d:I

    .line 215
    .line 216
    :goto_2
    int-to-long v2, v0

    .line 217
    goto :goto_3

    .line 218
    :cond_7
    iget-object v0, v1, LT0/p;->s:LT0/p$f;

    .line 219
    .line 220
    iget v0, v0, LT0/p$f;->e:I

    .line 221
    .line 222
    goto :goto_2

    .line 223
    :goto_3
    invoke-virtual {v10, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 224
    .line 225
    .line 226
    new-instance v0, LT0/i;

    .line 227
    .line 228
    move-object v2, v8

    .line 229
    move-object v3, v9

    .line 230
    invoke-direct/range {v0 .. v6}, LT0/i;-><init>(LT0/p;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/C2;Lcom/android/launcher3/LongClickTextView;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v10, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v7, v10}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public S0(Landroid/animation/AnimatorSet;)V
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->F3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, LT0/p;->T0(Landroid/animation/AnimatorSet;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, LT0/p;->U0(Landroid/animation/AnimatorSet;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public T0(Landroid/animation/AnimatorSet;)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 5
    .line 6
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    if-eqz v3, :cond_1

    .line 11
    .line 12
    new-array v3, v2, [F

    .line 13
    .line 14
    const/high16 v4, 0x437f0000    # 255.0f

    .line 15
    .line 16
    aput v4, v3, v1

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    aput v5, v3, v0

    .line 20
    .line 21
    iget-boolean v6, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 22
    .line 23
    if-eqz v6, :cond_0

    .line 24
    .line 25
    aput v5, v3, v0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v5, p0, LT0/p;->r:LT0/p$g;

    .line 29
    .line 30
    invoke-virtual {v5}, LT0/p$g;->c()F

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    aput v5, v3, v1

    .line 35
    .line 36
    aput v4, v3, v0

    .line 37
    .line 38
    :goto_0
    aget v4, v3, v1

    .line 39
    .line 40
    aget v3, v3, v0

    .line 41
    .line 42
    new-array v2, v2, [F

    .line 43
    .line 44
    aput v4, v2, v1

    .line 45
    .line 46
    aput v3, v2, v0

    .line 47
    .line 48
    invoke-static {v2}, Landroid/animation/ObjectAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, LT0/n;

    .line 53
    .line 54
    invoke-direct {v1, p0}, LT0/n;-><init>(LT0/p;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    sget p0, LT0/p;->w:I

    .line 61
    .line 62
    int-to-long v1, p0

    .line 63
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public U0(Landroid/animation/AnimatorSet;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 3
    .line 4
    instance-of v2, v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 5
    .line 6
    if-eqz v2, :cond_3

    .line 7
    .line 8
    check-cast v1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getAllChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    new-instance v3, LT0/l;

    .line 15
    .line 16
    invoke-direct {v3}, LT0/l;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Lcom/android/launcher3/folder/FolderPagedView;->i0(I)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-static {}, Lx1/O;->F3()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    iget-object v4, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 39
    .line 40
    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-gt v4, v3, :cond_1

    .line 48
    .line 49
    new-instance v0, LT0/p$c;

    .line 50
    .line 51
    invoke-direct {v0, p0, v1}, LT0/p$c;-><init>(LT0/p;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    new-instance v1, LT0/p$d;

    .line 59
    .line 60
    invoke-direct {v1, p0, v3, v2}, LT0/p$d;-><init>(LT0/p;ILjava/util/ArrayList;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, LT0/p;->r:LT0/p$g;

    .line 67
    .line 68
    invoke-virtual {v1}, LT0/p$g;->d()F

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget-boolean v4, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 73
    .line 74
    if-nez v4, :cond_2

    .line 75
    .line 76
    iget-object p0, p0, LT0/p;->r:LT0/p$g;

    .line 77
    .line 78
    invoke-virtual {p0}, LT0/p$g;->c()F

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    const/high16 p0, 0x3f800000    # 1.0f

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    const/4 p0, 0x0

    .line 86
    :goto_0
    const/4 v4, 0x2

    .line 87
    new-array v4, v4, [F

    .line 88
    .line 89
    aput v1, v4, v0

    .line 90
    .line 91
    const/4 v0, 0x1

    .line 92
    aput p0, v4, v0

    .line 93
    .line 94
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    new-instance v0, LT0/m;

    .line 99
    .line 100
    invoke-direct {v0, v3, v2}, LT0/m;-><init>(ILjava/util/ArrayList;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 107
    .line 108
    .line 109
    :cond_3
    return-void
.end method

.method public V0(Landroid/animation/AnimatorSet;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, LT0/p;->r:LT0/p$g;

    .line 18
    .line 19
    invoke-virtual {v0}, LT0/p$g;->c()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    move v4, v1

    .line 24
    move v1, v0

    .line 25
    move v0, v4

    .line 26
    :goto_0
    const/4 v2, 0x2

    .line 27
    new-array v2, v2, [F

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    aput v1, v2, v3

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    aput v0, v2, v1

    .line 34
    .line 35
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, LT0/g;

    .line 40
    .line 41
    invoke-direct {v1, p0}, LT0/g;-><init>(LT0/p;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public t0()Landroid/graphics/PointF;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/folder/Folder;->h0:Lcom/android/launcher3/folder/Folder$k;

    .line 4
    .line 5
    instance-of v2, v1, Lcom/android/launcher3/folder/G;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    check-cast v1, Lcom/android/launcher3/folder/G;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/android/launcher3/folder/G;->f(Lcom/android/launcher3/folder/Folder;)Landroid/graphics/PointF;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 21
    .line 22
    iget v1, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    add-int/2addr v1, v2

    .line 31
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    add-int/2addr v1, v2

    .line 38
    int-to-float v1, v1

    .line 39
    iget v0, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 40
    .line 41
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    add-int/2addr v0, v2

    .line 48
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v0, v2

    .line 55
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    add-int/2addr v0, v2

    .line 62
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    invoke-virtual {p0, v2}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    add-int/2addr v0, p0

    .line 74
    int-to-float p0, v0

    .line 75
    new-instance v0, Landroid/graphics/PointF;

    .line 76
    .line 77
    invoke-direct {v0, v1, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 78
    .line 79
    .line 80
    return-object v0
.end method

.method public u0()[F
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getFooterHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    sub-int/2addr v1, v2

    .line 24
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    sub-int/2addr v1, v2

    .line 33
    int-to-float v1, v1

    .line 34
    iget v2, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    add-int/2addr v2, v3

    .line 43
    int-to-float v2, v2

    .line 44
    iget v0, v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 45
    .line 46
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 47
    .line 48
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    add-int/2addr v0, v3

    .line 53
    iget-object v3, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    add-int/2addr v0, v3

    .line 62
    int-to-float v0, v0

    .line 63
    const/4 v3, 0x2

    .line 64
    new-array v3, v3, [F

    .line 65
    .line 66
    const/4 v4, 0x0

    .line 67
    aput v2, v3, v4

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    aput v0, v3, v2

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 75
    .line 76
    invoke-virtual {p0}, LT0/p;->C0()F

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    const/high16 v4, 0x40000000    # 2.0f

    .line 81
    .line 82
    div-float/2addr v2, v4

    .line 83
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setPivotX(F)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->v:Lcom/android/launcher3/folder/FolderNameEditText;

    .line 89
    .line 90
    div-float/2addr v1, v4

    .line 91
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setPivotY(F)V

    .line 92
    .line 93
    .line 94
    return-object v3
.end method

.method public w0()Landroid/animation/AnimatorSet;
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, LT0/p;->x0()Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, LT0/p;->E0()Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public x0()Landroid/animation/AnimatorSet;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lc1/b;

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 10
    .line 11
    xor-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    iput-boolean v1, v0, Lc1/b;->i:Z

    .line 14
    .line 15
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, LT0/p;->A0(Lcom/android/launcher3/folder/FolderIcon;)Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-direct {p0, v0}, LT0/p;->P0(Landroid/animation/AnimatorSet;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, LT0/p;->S0(Landroid/animation/AnimatorSet;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, LT0/p;->V0(Landroid/animation/AnimatorSet;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, LT0/p;->B0()Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, LT0/p;->O0()V

    .line 48
    .line 49
    .line 50
    new-instance v1, LT0/p$a;

    .line 51
    .line 52
    invoke-direct {v1, p0}, LT0/p$a;-><init>(LT0/p;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method

.method public y0(Landroid/view/View;Landroid/view/View;)Landroid/animation/Animator;
    .locals 4

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/high16 p1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p1, p0, LT0/p;->r:LT0/p$g;

    .line 12
    .line 13
    invoke-virtual {p1}, LT0/p$g;->c()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    move v3, v0

    .line 18
    move v0, p1

    .line 19
    move p1, v3

    .line 20
    :goto_0
    const/4 v1, 0x2

    .line 21
    new-array v1, v1, [F

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    aput v0, v1, v2

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    aput p1, v1, v0

    .line 28
    .line 29
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-wide/16 v0, 0x12c

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    sget-object p0, LT0/p;->t:Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    sget-object p0, LT0/p;->u:Landroid/view/animation/Interpolator;

    .line 46
    .line 47
    :goto_1
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, LT0/f;

    .line 51
    .line 52
    invoke-direct {p0, p2}, LT0/f;-><init>(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 56
    .line 57
    .line 58
    return-object p1

    .line 59
    :cond_2
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method

.method public z0(Landroid/view/View;)Landroid/animation/ValueAnimator;
    .locals 11

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    iget-object v2, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 6
    .line 7
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->k:Z

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    return-object v3

    .line 13
    :cond_0
    instance-of v2, p1, Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    if-eqz v2, :cond_8

    .line 16
    .line 17
    move-object v6, p1

    .line 18
    check-cast v6, Lcom/android/launcher3/BubbleTextView;

    .line 19
    .line 20
    iget-boolean p1, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v6, v1}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-static {v6, v1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v6}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 37
    .line 38
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 v2, -0x1

    .line 43
    if-ne v2, p1, :cond_2

    .line 44
    .line 45
    move v8, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move v8, v1

    .line 48
    :goto_0
    const/high16 p1, 0x45000000    # 2048.0f

    .line 49
    .line 50
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    filled-new-array {v2}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    iget-boolean p1, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 59
    .line 60
    const/high16 v2, 0x3f800000    # 1.0f

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    move v4, v3

    .line 66
    goto :goto_1

    .line 67
    :cond_3
    move v4, v2

    .line 68
    :goto_1
    if-eqz p1, :cond_4

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_4
    move v2, v3

    .line 72
    :goto_2
    const/4 p1, 0x2

    .line 73
    new-array p1, p1, [F

    .line 74
    .line 75
    aput v4, p1, v1

    .line 76
    .line 77
    aput v2, p1, v0

    .line 78
    .line 79
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v4, LT0/e;

    .line 84
    .line 85
    move-object v5, p0

    .line 86
    invoke-direct/range {v4 .. v10}, LT0/e;-><init>(LT0/p;Lcom/android/launcher3/BubbleTextView;Landroid/graphics/Paint;ZI[I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 90
    .line 91
    .line 92
    iget-boolean p0, v5, Lcom/android/launcher3/folder/z;->g:Z

    .line 93
    .line 94
    if-eqz p0, :cond_5

    .line 95
    .line 96
    const-wide/16 v0, 0x64

    .line 97
    .line 98
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 99
    .line 100
    .line 101
    :cond_5
    iget-boolean p0, v5, Lcom/android/launcher3/folder/z;->g:Z

    .line 102
    .line 103
    if-eqz p0, :cond_6

    .line 104
    .line 105
    iget-object p0, v5, LT0/p;->s:LT0/p$f;

    .line 106
    .line 107
    iget p0, p0, LT0/p$f;->b:I

    .line 108
    .line 109
    :goto_3
    add-int/lit8 p0, p0, -0x64

    .line 110
    .line 111
    int-to-long v0, p0

    .line 112
    goto :goto_4

    .line 113
    :cond_6
    iget-object p0, v5, LT0/p;->s:LT0/p$f;

    .line 114
    .line 115
    iget p0, p0, LT0/p$f;->c:I

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :goto_4
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 119
    .line 120
    .line 121
    iget-boolean p0, v5, Lcom/android/launcher3/folder/z;->g:Z

    .line 122
    .line 123
    if-eqz p0, :cond_7

    .line 124
    .line 125
    sget-object p0, LT0/p;->t:Landroid/view/animation/Interpolator;

    .line 126
    .line 127
    goto :goto_5

    .line 128
    :cond_7
    sget-object p0, LT0/p;->u:Landroid/view/animation/Interpolator;

    .line 129
    .line 130
    :goto_5
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 131
    .line 132
    .line 133
    return-object p1

    .line 134
    :cond_8
    return-object v3
.end method
