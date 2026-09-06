.class public Lcom/zte/mifavor/widget/SegmentScrollView;
.super Landroid/widget/FrameLayout;
.source "SegmentScrollView.java"


# instance fields
.field private g:Ljava/lang/String;

.field private h:Lcom/zte/mifavor/widget/SegmentSelector;

.field private i:Landroid/widget/ImageView;

.field private j:Landroid/widget/ImageView;

.field private k:Z

.field private l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/SegmentScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p1, "SS#SegmentScrollView"

    iput-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->g:Ljava/lang/String;

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->l:Z

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    new-instance p2, Lcom/zte/mifavor/widget/SegmentScrollView$a;

    invoke-direct {p2, p0}, Lcom/zte/mifavor/widget/SegmentScrollView$a;-><init>(Lcom/zte/mifavor/widget/SegmentScrollView;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/SegmentScrollView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/SegmentScrollView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/SegmentScrollView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/SegmentScrollView;)Lcom/zte/mifavor/widget/SegmentSelector;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/SegmentScrollView;Lcom/zte/mifavor/widget/SegmentSelector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/SegmentScrollView;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/SegmentScrollView;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->j:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/SegmentScrollView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/SegmentScrollView;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic j(Lcom/zte/mifavor/widget/SegmentScrollView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/SegmentScrollView;->l(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final k()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/SegmentSelector;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->g:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "set Segment View Bg in. mSegment="

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 30
    .line 31
    if-eqz v0, :cond_6

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    const/4 v1, 0x0

    .line 35
    move-object v2, v1

    .line 36
    move v1, v0

    .line 37
    :goto_0
    iget-object v3, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-ge v0, v3, :cond_3

    .line 44
    .line 45
    iget-object v3, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 46
    .line 47
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    if-nez v3, :cond_1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    if-nez v2, :cond_2

    .line 55
    .line 56
    move-object v2, v3

    .line 57
    :cond_2
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    add-int/2addr v1, v3

    .line 62
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    if-nez v2, :cond_4

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_4
    if-lez v1, :cond_5

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sget v3, LR3/e;->W:I

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    mul-int/lit8 v0, v0, 0x2

    .line 85
    .line 86
    add-int/2addr v1, v0

    .line 87
    :cond_5
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->j:Landroid/widget/ImageView;

    .line 88
    .line 89
    if-eqz v0, :cond_6

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 96
    .line 97
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 98
    .line 99
    iget-object v3, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->j:Landroid/widget/ImageView;

    .line 100
    .line 101
    invoke-virtual {v2}, Landroid/view/View;->getX()F

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setX(F)V

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->j:Landroid/widget/ImageView;

    .line 109
    .line 110
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->j:Landroid/widget/ImageView;

    .line 114
    .line 115
    sget v2, LR3/f;->F:I

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 118
    .line 119
    .line 120
    sget-boolean v0, Lcom/zte/mifavor/widget/SegmentSelector;->l:Z

    .line 121
    .line 122
    if-eqz v0, :cond_6

    .line 123
    .line 124
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->g:Ljava/lang/String;

    .line 125
    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v2, "set SegmentView Bg. totalWidth="

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    :cond_6
    :goto_2
    return-void
.end method

.method private final l(I)V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/SegmentSelector;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->g:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "show Item Bg in. position="

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 v0, -0x1

    .line 28
    if-eq p1, v0, :cond_4

    .line 29
    .line 30
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 31
    .line 32
    if-eqz v0, :cond_4

    .line 33
    .line 34
    iget-object v1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 35
    .line 36
    if-eqz v1, :cond_4

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    sget v2, LR3/g;->m0:I

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Landroid/widget/TextView;

    .line 58
    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    invoke-virtual {v2}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    new-instance v4, Lcom/zte/mifavor/widget/SegmentScrollView$b;

    .line 67
    .line 68
    invoke-direct {v4, p0, v0, v2, v1}, Lcom/zte/mifavor/widget/SegmentScrollView$b;-><init>(Lcom/zte/mifavor/widget/SegmentScrollView;Landroid/view/ViewGroup$LayoutParams;Landroid/widget/TextView;Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/widget/TextView;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 79
    .line 80
    invoke-virtual {v2}, Landroid/widget/TextView;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 85
    .line 86
    iget-object v3, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 87
    .line 88
    if-eqz v3, :cond_3

    .line 89
    .line 90
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 94
    .line 95
    const/4 v3, 0x0

    .line 96
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 100
    .line 101
    invoke-virtual {v1}, Landroid/view/View;->getX()F

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    invoke-virtual {v2}, Landroid/widget/TextView;->getWidth()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    sub-int/2addr v1, v2

    .line 114
    div-int/lit8 v1, v1, 0x2

    .line 115
    .line 116
    int-to-float v1, v1

    .line 117
    add-float/2addr v3, v1

    .line 118
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setX(F)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/widget/ImageView;->invalidate()V

    .line 124
    .line 125
    .line 126
    :cond_3
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/SegmentScrollView;->m(I)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 130
    .line 131
    const/4 p1, 0x4

    .line 132
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    :cond_4
    :goto_0
    return-void
.end method

.method private final m(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 8
    .line 9
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_3

    .line 14
    .line 15
    iget-object v2, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    sget v3, LR3/g;->m0:I

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Landroid/widget/TextView;

    .line 31
    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v1, p1, :cond_1

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v3, v0

    .line 39
    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public setDEBUG(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sput-boolean p1, Lcom/zte/mifavor/widget/SegmentSelector;->l:Z

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public setLayoutPadding(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setNightStyle(Z)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/zte/mifavor/widget/SegmentSelector;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->g:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "setNightStyle in. bNightStyle = "

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->l:Z

    .line 28
    .line 29
    if-ne v0, p1, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->l:Z

    .line 33
    .line 34
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->i:Landroid/widget/ImageView;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    sget p1, LR3/f;->H:I

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    sget p1, LR3/f;->G:I

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 49
    .line 50
    .line 51
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->h:Lcom/zte/mifavor/widget/SegmentSelector;

    .line 52
    .line 53
    if-eqz p1, :cond_4

    .line 54
    .line 55
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView;->l:Z

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Lcom/zte/mifavor/widget/SegmentSelector;->setNightStyle(Z)V

    .line 58
    .line 59
    .line 60
    :cond_4
    :goto_1
    return-void
.end method

.method public setPadding(I)V
    .locals 0

    .line 1
    return-void
.end method
