.class public Lcom/android/launcher3/appprediction/PredictionRowView;
.super Landroid/widget/LinearLayout;
.source "PredictionRowView.java"

# interfaces
.implements Lcom/android/launcher3/X3$b;
.implements Lcom/android/launcher3/allapps/P;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Landroid/widget/LinearLayout;",
        "Lcom/android/launcher3/X3$b;",
        "Lcom/android/launcher3/allapps/P;"
    }
.end annotation


# instance fields
.field private final g:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private h:I

.field private final i:I

.field private final j:I

.field private final k:Lv1/a;

.field private final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private m:Lcom/android/launcher3/allapps/FloatingHeaderView;

.field private n:Z

.field private o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    iput-boolean p2, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 13
    .line 14
    iput-boolean p2, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->o:Z

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 17
    .line 18
    .line 19
    new-instance p2, Lv1/a$a;

    .line 20
    .line 21
    invoke-direct {p2, p0}, Lv1/a$a;-><init>(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->k:Lv1/a;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 31
    .line 32
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 33
    .line 34
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget p1, p1, Lcom/android/launcher3/h0;->M2:I

    .line 39
    .line 40
    iput p1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->h:I

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const p2, 0x7f0700f1

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iput p1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->j:I

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const p2, 0x7f0700db

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput p1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->i:I

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/PredictionRowView;->j()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/I;
    .locals 0

    .line 1
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    return p0
.end method

.method private g(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v1, LX0/a;

    .line 13
    .line 14
    invoke-direct {v1}, LX0/a;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v1, LX0/b;

    .line 22
    .line 23
    invoke-direct {v1}, LX0/b;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Ljava/util/Collection;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/PredictionRowView;->h()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private h()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->o:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->h:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    :goto_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->h:I

    .line 25
    .line 26
    if-le v0, v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 33
    .line 34
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 35
    .line 36
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :goto_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget v3, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->h:I

    .line 49
    .line 50
    if-ge v1, v3, :cond_4

    .line 51
    .line 52
    const v1, 0x7f0e0067

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 60
    .line 61
    iget-object v3, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 62
    .line 63
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 64
    .line 65
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v3, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 73
    .line 74
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 75
    .line 76
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 81
    .line 82
    .line 83
    const/high16 v3, 0x3f800000    # 1.0f

    .line 84
    .line 85
    invoke-virtual {v1, v3}, Lcom/android/launcher3/BubbleTextView;->setLongPressTimeoutFactor(F)V

    .line 86
    .line 87
    .line 88
    iget-object v4, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->k:Lv1/a;

    .line 89
    .line 90
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 98
    .line 99
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    if-eqz v5, :cond_3

    .line 104
    .line 105
    const/4 v5, -0x1

    .line 106
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_3
    iget-object v5, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 110
    .line 111
    check-cast v5, Lcom/android/launcher3/views/k;

    .line 112
    .line 113
    invoke-interface {v5}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    iget v5, v5, Lcom/android/launcher3/h0;->H2:I

    .line 118
    .line 119
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 120
    .line 121
    :goto_3
    iput v2, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 122
    .line 123
    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 124
    .line 125
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 130
    .line 131
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    move v1, v2

    .line 136
    :goto_4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-ge v1, v3, :cond_7

    .line 141
    .line 142
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 147
    .line 148
    invoke-virtual {v3}, Lcom/android/launcher3/BubbleTextView;->B0()V

    .line 149
    .line 150
    .line 151
    if-le v0, v1, :cond_5

    .line 152
    .line 153
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 154
    .line 155
    .line 156
    iget-object v4, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 163
    .line 164
    iput v1, v4, Lcom/android/launcher3/model/data/y;->rank:I

    .line 165
    .line 166
    iput v1, v4, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 167
    .line 168
    iput v2, v4, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 169
    .line 170
    invoke-virtual {v3, v4}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 171
    .line 172
    .line 173
    goto :goto_6

    .line 174
    :cond_5
    if-nez v0, :cond_6

    .line 175
    .line 176
    const/16 v4, 0x8

    .line 177
    .line 178
    goto :goto_5

    .line 179
    :cond_6
    const/4 v4, 0x4

    .line 180
    :goto_5
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    :goto_6
    add-int/lit8 v1, v1, 0x1

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_7
    if-lez v0, :cond_8

    .line 187
    .line 188
    const/4 v2, 0x1

    .line 189
    :cond_8
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 190
    .line 191
    if-eq v2, v0, :cond_9

    .line 192
    .line 193
    iput-boolean v2, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 194
    .line 195
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/PredictionRowView;->j()V

    .line 196
    .line 197
    .line 198
    :cond_9
    iget-object p0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->m:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->n()V

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method private j()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/16 v0, 0x8

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 13
    .line 14
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 27
    .line 28
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 29
    .line 30
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, p0}, Lcom/android/launcher3/allapps/D;->u(Landroid/view/ViewGroup;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 43
    .line 44
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 45
    .line 46
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p0}, Lcom/android/launcher3/allapps/D;->z(Landroid/view/ViewGroup;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public b(IZ)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    :cond_0
    if-eqz p2, :cond_1

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/16 p2, 0x8

    .line 21
    .line 22
    if-eq p1, p2, :cond_2

    .line 23
    .line 24
    invoke-static {p0}, Lcom/android/launcher3/anim/a;->a(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public d(Lcom/android/launcher3/allapps/FloatingHeaderView;[Lcom/android/launcher3/allapps/P;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->m:Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 2
    .line 3
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->k:Lv1/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/keyboard/a;->e(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getExpectedHeight()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, v0, Lcom/android/launcher3/h0;->J2:I

    .line 10
    .line 11
    iget v2, v0, Lcom/android/launcher3/h0;->K2:I

    .line 12
    .line 13
    iget v3, v0, Lcom/android/launcher3/h0;->N2:F

    .line 14
    .line 15
    invoke-static {v3}, Lcom/android/launcher3/N5;->f(F)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    add-int/2addr v1, v2

    .line 20
    add-int/2addr v1, v3

    .line 21
    iget v2, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->i:I

    .line 22
    .line 23
    mul-int/lit8 v2, v2, 0x2

    .line 24
    .line 25
    add-int/2addr v1, v2

    .line 26
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 27
    .line 28
    iget-boolean v0, v0, Lcom/android/launcher3/F1;->B1:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->j:I

    .line 33
    .line 34
    add-int/2addr v3, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget v3, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->j:I

    .line 37
    .line 38
    :goto_0
    add-int/2addr v1, v3

    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/16 v2, 0x8

    .line 44
    .line 45
    if-ne v0, v2, :cond_1

    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0

    .line 49
    :cond_1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr v1, v0

    .line 54
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    add-int/2addr v1, p0

    .line 59
    return v1
.end method

.method public getFocusedChild()Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public getPredictedApps()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/z;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getTypeClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/android/launcher3/appprediction/PredictionRowView;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

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
    const-string v1, "PredictionRowView"

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tmPredictionsEnabled: "

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->n:Z

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tmPredictionUiUpdatePaused: "

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->o:Z

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, "\tmNumPredictedAppsPerRow: "

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget v1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->h:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v1, "\tmPredictedApps: "

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->l:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_0

    .line 136
    .line 137
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 142
    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v2, "\t\t"

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_0
    return-void
.end method

.method public isVisible()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

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

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 7
    .line 8
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iget p1, p1, Lcom/android/launcher3/h0;->M2:I

    .line 2
    .line 3
    iput p1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->h:I

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/PredictionRowView;->h()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x22

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->g:Landroid/content/Context;

    .line 11
    .line 12
    const v0, 0x7f140456

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setContainerTitle(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/appprediction/PredictionRowView;->getExpectedHeight()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/high16 v0, 0x40000000    # 2.0f

    .line 6
    .line 7
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setPredictedApps(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/appprediction/PredictionRowView;->g(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setPredictionUiUpdatePaused(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/appprediction/PredictionRowView;->o:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/appprediction/PredictionRowView;->h()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
