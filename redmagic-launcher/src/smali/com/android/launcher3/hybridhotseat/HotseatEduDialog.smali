.class public Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;
.super Lcom/android/launcher3/views/f;
.source "HotseatEduDialog.java"

# interfaces
.implements Lcom/android/launcher3/g1;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/views/f<",
        "Lcom/android/launcher3/C2;",
        ">;",
        "Lcom/android/launcher3/g1;"
    }
.end annotation


# instance fields
.field private final E:Landroid/graphics/Rect;

.field private F:Landroid/view/View;

.field private G:Lcom/android/launcher3/CellLayout;

.field private H:Landroid/widget/Button;

.field private I:Lcom/android/launcher3/hybridhotseat/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/views/f;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->E:Landroid/graphics/Rect;

    .line 4
    iput-object p0, p0, Lcom/android/launcher3/views/f;->j:Landroid/view/ViewGroup;

    return-void
.end method

.method private animateOpen()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/views/f;->i:Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->j0()Lcom/android/launcher3/anim/q;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->x()V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic o0(Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->s0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p0(Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->r0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static q0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    const v2, 0x7f0e0199

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;

    .line 18
    .line 19
    return-object p0
.end method

.method private r0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->I:Lcom/android/launcher3/hybridhotseat/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/hybridhotseat/a;->i()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->handleClose(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->I:Lcom/android/launcher3/hybridhotseat/a;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/hybridhotseat/a;->k()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->I:Lcom/android/launcher3/hybridhotseat/a;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/hybridhotseat/a;->d()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 21
    .line 22
    check-cast p0, Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->Y:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 33
    .line 34
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private s0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->I:Lcom/android/launcher3/hybridhotseat/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/hybridhotseat/a;->n()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->I:Lcom/android/launcher3/hybridhotseat/a;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/hybridhotseat/a;->d()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 12
    .line 13
    check-cast p1, Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->Z:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 24
    .line 25
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->handleClose(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private t0(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v3, v0

    .line 3
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 4
    .line 5
    check-cast v1, Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget v1, v1, Lcom/android/launcher3/h0;->a2:I

    .line 12
    .line 13
    if-ge v3, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->G:Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    invoke-static {v2, v1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->o1(Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/I;)Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    const/4 v4, 0x2

    .line 31
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/launcher3/BubbleTextView;->W0()V

    .line 35
    .line 36
    .line 37
    new-instance v5, Lc1/b;

    .line 38
    .line 39
    const/4 v4, 0x1

    .line 40
    invoke-direct {v5, v3, v0, v4, v4}, Lc1/b;-><init>(IIII)V

    .line 41
    .line 42
    .line 43
    move-object v4, v1

    .line 44
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->G:Lcom/android/launcher3/CellLayout;

    .line 45
    .line 46
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getViewId()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    const/4 v6, 0x1

    .line 51
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 52
    .line 53
    .line 54
    add-int/lit8 v3, v3, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    return-void
.end method


# virtual methods
.method protected X(Landroid/content/Context;)I
    .locals 0

    .line 1
    const/high16 p0, -0x78000000

    .line 2
    .line 3
    return p0
.end method

.method protected handleClose(Z)V
    .locals 2

    .line 1
    const/4 p1, 0x1

    .line 2
    const-wide/16 v0, 0xc8

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x20

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

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->handleClose(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b02f5

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->F:Landroid/view/View;

    .line 12
    .line 13
    const v0, 0x7f0b04fe

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->G:Lcom/android/launcher3/CellLayout;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 29
    .line 30
    check-cast v1, Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1, v0}, Lcom/android/launcher3/h0;->s0(Landroid/content/Context;)Landroid/graphics/Rect;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->G:Lcom/android/launcher3/CellLayout;

    .line 41
    .line 42
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget v4, v1, Lcom/android/launcher3/h0;->I1:I

    .line 47
    .line 48
    iput v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 49
    .line 50
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->G:Lcom/android/launcher3/CellLayout;

    .line 51
    .line 52
    iget v4, v1, Lcom/android/launcher3/h0;->a2:I

    .line 53
    .line 54
    const/4 v5, 0x1

    .line 55
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 56
    .line 57
    .line 58
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->G:Lcom/android/launcher3/CellLayout;

    .line 59
    .line 60
    iget v4, v2, Landroid/graphics/Rect;->left:I

    .line 61
    .line 62
    const/4 v5, 0x0

    .line 63
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 64
    .line 65
    invoke-virtual {v3, v4, v5, v2, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 66
    .line 67
    .line 68
    const v2, 0x7f0b064f

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Landroid/widget/Button;

    .line 76
    .line 77
    new-instance v3, Lq1/d;

    .line 78
    .line 79
    invoke-direct {v3, p0}, Lq1/d;-><init>(Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    const v2, 0x7f0b041d

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Landroid/widget/Button;

    .line 93
    .line 94
    iput-object v2, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->H:Landroid/widget/Button;

    .line 95
    .line 96
    new-instance v3, Lq1/e;

    .line 97
    .line 98
    invoke-direct {v3, p0}, Lq1/e;-><init>(Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    const v2, 0x7f0b0136

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Landroid/widget/LinearLayout;

    .line 112
    .line 113
    iget v1, v1, Lcom/android/launcher3/h0;->h2:I

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingEnd()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    sub-int/2addr v1, v2

    .line 120
    sget-object v2, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 121
    .line 122
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Lcom/android/launcher3/F1;

    .line 127
    .line 128
    invoke-virtual {v2, v0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->p3:Z

    .line 133
    .line 134
    if-eqz v0, :cond_0

    .line 135
    .line 136
    if-lez v1, :cond_0

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 145
    .line 146
    .line 147
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f;->setTranslationShift(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setHotseatEduController(Lcom/android/launcher3/hybridhotseat/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->I:Lcom/android/launcher3/hybridhotseat/a;

    .line 2
    .line 3
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 6

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->E:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 6
    .line 7
    sub-int/2addr v0, v2

    .line 8
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 9
    .line 10
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 11
    .line 12
    sub-int/2addr v2, v3

    .line 13
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    .line 16
    .line 17
    sub-int/2addr v3, v4

    .line 18
    invoke-virtual {v1, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 22
    .line 23
    check-cast v1, Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->m2()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v4, 0x1

    .line 30
    const/4 v5, 0x0

    .line 31
    if-ne v1, v4, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0, v0, v1, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->F:Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget-object v4, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->F:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {v4}, Landroid/view/View;->getPaddingRight()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v0, v1, v2, v4, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->F:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 66
    .line 67
    check-cast p0, Lcom/android/launcher3/C2;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iget p0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 74
    .line 75
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    add-int/2addr p0, p1

    .line 78
    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-virtual {p0, v5, p1, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->F:Landroid/view/View;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->F:Landroid/view/View;

    .line 99
    .line 100
    invoke-virtual {v2}, Landroid/view/View;->getPaddingRight()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    const v4, 0x7f070146

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    float-to-int v3, v3

    .line 116
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 117
    .line 118
    .line 119
    const p1, 0x7f0b02e9

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Landroid/widget/TextView;

    .line 127
    .line 128
    const v0, 0x7f14020a

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 132
    .line 133
    .line 134
    const p1, 0x7f0b02e8

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Landroid/widget/TextView;

    .line 142
    .line 143
    const p1, 0x7f140208

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public u0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 12
    .line 13
    check-cast v1, Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v1, v1, Lcom/android/launcher3/h0;->a2:I

    .line 20
    .line 21
    if-lt v0, v1, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->I:Lcom/android/launcher3/hybridhotseat/a;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 29
    .line 30
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/views/f;->T()V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->animateOpen()V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->t0(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/views/f;->g:Landroid/content/Context;

    .line 45
    .line 46
    check-cast p0, Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->X:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 57
    .line 58
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method
