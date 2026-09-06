.class public Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;
.super Lcom/android/launcher3/a;
.source "AllAppsSortMenuView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final l:Landroid/graphics/Rect;


# instance fields
.field private g:Lcom/android/launcher3/v;

.field private h:Landroid/animation/AnimatorSet;

.field private i:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

.field private j:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

.field private k:Lcom/zte/mifavor/widget/CheckedTextViewZTE;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->l:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 5
    new-instance p1, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$a;

    invoke-direct {p1, p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$a;-><init>(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->animateOpen()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic O(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->closeComplete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Q(Z)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x3

    .line 4
    const/4 v3, 0x2

    .line 5
    iget-object v4, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->h:Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    if-eqz v4, :cond_0

    .line 14
    .line 15
    iget-object v4, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->h:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->end()V

    .line 18
    .line 19
    .line 20
    :cond_0
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v4, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->h:Landroid/animation/AnimatorSet;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    sget-object v4, Landroid/widget/LinearLayout;->SCALE_X:Landroid/util/Property;

    .line 30
    .line 31
    new-array v5, v3, [F

    .line 32
    .line 33
    fill-array-data v5, :array_0

    .line 34
    .line 35
    .line 36
    invoke-static {p0, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    sget-object v5, Lcom/android/launcher3/anim/L;->P:Landroid/view/animation/Interpolator;

    .line 41
    .line 42
    invoke-virtual {v4, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    const-wide/16 v6, 0x1c2

    .line 46
    .line 47
    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    .line 50
    sget-object v8, Landroid/widget/LinearLayout;->SCALE_Y:Landroid/util/Property;

    .line 51
    .line 52
    new-array v9, v3, [F

    .line 53
    .line 54
    fill-array-data v9, :array_1

    .line 55
    .line 56
    .line 57
    invoke-static {p0, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    invoke-virtual {v8, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v8, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    .line 67
    sget-object v5, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 68
    .line 69
    new-array v6, v3, [F

    .line 70
    .line 71
    fill-array-data v6, :array_2

    .line 72
    .line 73
    .line 74
    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    const-wide/16 v6, 0xc8

    .line 79
    .line 80
    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 81
    .line 82
    .line 83
    iget-object v6, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->h:Landroid/animation/AnimatorSet;

    .line 84
    .line 85
    new-array v2, v2, [Landroid/animation/Animator;

    .line 86
    .line 87
    aput-object v4, v2, v1

    .line 88
    .line 89
    aput-object v8, v2, v0

    .line 90
    .line 91
    aput-object v5, v2, v3

    .line 92
    .line 93
    invoke-virtual {v6, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_1
    sget-object v4, Landroid/widget/LinearLayout;->SCALE_X:Landroid/util/Property;

    .line 98
    .line 99
    new-array v5, v3, [F

    .line 100
    .line 101
    fill-array-data v5, :array_3

    .line 102
    .line 103
    .line 104
    invoke-static {p0, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    sget-object v5, Lcom/android/launcher3/anim/L;->Q:Landroid/view/animation/Interpolator;

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 111
    .line 112
    .line 113
    const-wide/16 v6, 0xfa

    .line 114
    .line 115
    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    .line 118
    sget-object v8, Landroid/widget/LinearLayout;->SCALE_Y:Landroid/util/Property;

    .line 119
    .line 120
    new-array v9, v3, [F

    .line 121
    .line 122
    fill-array-data v9, :array_4

    .line 123
    .line 124
    .line 125
    invoke-static {p0, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    invoke-virtual {v8, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v8, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 133
    .line 134
    .line 135
    sget-object v5, Landroid/widget/LinearLayout;->ALPHA:Landroid/util/Property;

    .line 136
    .line 137
    new-array v9, v3, [F

    .line 138
    .line 139
    fill-array-data v9, :array_5

    .line 140
    .line 141
    .line 142
    invoke-static {p0, v5, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 147
    .line 148
    .line 149
    iget-object v6, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->h:Landroid/animation/AnimatorSet;

    .line 150
    .line 151
    new-array v2, v2, [Landroid/animation/Animator;

    .line 152
    .line 153
    aput-object v4, v2, v1

    .line 154
    .line 155
    aput-object v8, v2, v0

    .line 156
    .line 157
    aput-object v5, v2, v3

    .line 158
    .line 159
    invoke-virtual {v6, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 160
    .line 161
    .line 162
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->h:Landroid/animation/AnimatorSet;

    .line 163
    .line 164
    new-instance v1, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;

    .line 165
    .line 166
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView$b;-><init>(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;Z)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 170
    .line 171
    .line 172
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->h:Landroid/animation/AnimatorSet;

    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    nop

    .line 179
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3e800000    # 0.25f
    .end array-data

    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3e800000    # 0.25f
    .end array-data

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :array_3
    .array-data 4
        0x3e800000    # 0.25f
        0x3f800000    # 1.0f
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_4
    .array-data 4
        0x3e800000    # 0.25f
        0x3f800000    # 1.0f
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    :array_5
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private R()V
    .locals 4

    .line 1
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f0b0567

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->i:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 15
    .line 16
    const v1, 0x7f0b0569

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->j:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 26
    .line 27
    const v1, 0x7f0b0568

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->k:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->i:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/widget/CheckedTextView;->getText()Ljava/lang/CharSequence;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v2, "    "

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v3, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->i:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 62
    .line 63
    invoke-virtual {v3, v1}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object v3, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->j:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 72
    .line 73
    invoke-virtual {v3}, Landroid/widget/CheckedTextView;->getText()Ljava/lang/CharSequence;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v3, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->j:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 88
    .line 89
    invoke-virtual {v3, v1}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->k:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 98
    .line 99
    invoke-virtual {v3}, Landroid/widget/CheckedTextView;->getText()Ljava/lang/CharSequence;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iget-object v2, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->k:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 114
    .line 115
    invoke-virtual {v2, v1}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->i:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 119
    .line 120
    invoke-virtual {v1, p0}, Landroid/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->j:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 124
    .line 125
    invoke-virtual {v1, p0}, Landroid/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->k:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 129
    .line 130
    invoke-virtual {v1, p0}, Landroid/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 134
    .line 135
    invoke-virtual {v0, v1}, LR0/m;->b(Landroid/content/Context;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    invoke-direct {p0, v0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->U(I)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method private S(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->R()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p1}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->setSortMenuViewPosition(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, LR0/l;

    .line 25
    .line 26
    invoke-direct {p1, p0}, LR0/l;-><init>(Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public static T(Landroid/view/View;)Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v2, 0x0

    .line 18
    const v3, 0x7f0e006a

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v3, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->S(Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method private U(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq p1, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->k:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 11
    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->j:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 19
    .line 20
    if-eqz p0, :cond_3

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->i:Lcom/zte/mifavor/widget/CheckedTextViewZTE;

    .line 27
    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 31
    .line 32
    .line 33
    :cond_3
    :goto_0
    return-void
.end method

.method private animateClose()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->Q(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private animateOpen()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->Q(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 7
    .line 8
    return-void
.end method

.method private closeComplete()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private setSortMenuViewPosition(Landroid/view/View;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Landroid/widget/LinearLayout;->measure(II)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 6
    .line 7
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->l:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {v1, p1, v2}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/h1;->getInsets()Landroid/graphics/Rect;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget v3, v2, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    iget v4, p1, Landroid/graphics/Rect;->left:I

    .line 33
    .line 34
    sub-int/2addr v3, v4

    .line 35
    sub-int/2addr v3, v1

    .line 36
    if-gez v3, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v0, v3

    .line 40
    :goto_0
    iget v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 41
    .line 42
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    sub-int/2addr v3, p1

    .line 45
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const v4, 0x7f0707c4

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    add-int/2addr v3, p1

    .line 57
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object v4, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 78
    .line 79
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->N0:Z

    .line 84
    .line 85
    if-eqz v4, :cond_1

    .line 86
    .line 87
    const v4, 0x7f0c0018

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_1
    const v4, 0x7f0c0017

    .line 92
    .line 93
    .line 94
    :goto_1
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    int-to-float p1, p1

    .line 99
    invoke-static {p1}, Lcom/android/launcher3/N5;->T(F)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    add-int/2addr v0, p1

    .line 104
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_3

    .line 113
    .line 114
    neg-int p1, v0

    .line 115
    int-to-float p1, p1

    .line 116
    goto :goto_2

    .line 117
    :cond_3
    int-to-float p1, v0

    .line 118
    :goto_2
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setX(F)V

    .line 119
    .line 120
    .line 121
    int-to-float p1, v3

    .line 122
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setY(F)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    div-int/lit8 p1, p1, 0x2

    .line 130
    .line 131
    sub-int/2addr v1, p1

    .line 132
    int-to-float p1, v1

    .line 133
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 134
    .line 135
    .line 136
    const/4 p1, 0x0

    .line 137
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 138
    .line 139
    .line 140
    return-void
.end method


# virtual methods
.method protected handleClose(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->animateClose()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->closeComplete()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x4000000

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

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const-string v0, "AllAppsSortMenuView"

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    packed-switch p1, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    const-string p1, "onCheckedChanged: error."

    .line 12
    .line 13
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move p1, v1

    .line 17
    goto :goto_0

    .line 18
    :pswitch_0
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :pswitch_1
    const/4 p1, 0x2

    .line 21
    goto :goto_0

    .line 22
    :pswitch_2
    const/4 p1, 0x0

    .line 23
    :goto_0
    invoke-static {}, LR0/m;->a()LR0/m;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 28
    .line 29
    invoke-virtual {v2, v3}, LR0/m;->b(Landroid/content/Context;)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eq p1, v3, :cond_0

    .line 34
    .line 35
    if-eq p1, v1, :cond_0

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v3, "sort mode changed, new sort mode: "

    .line 43
    .line 44
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    invoke-direct {p0, p1}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->U(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 61
    .line 62
    invoke-virtual {v2, v0, p1}, LR0/m;->e(Landroid/content/Context;I)V

    .line 63
    .line 64
    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    invoke-static {}, Lcom/android/launcher3/resource/g;->l()Lcom/android/launcher3/resource/g;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/resource/g;->i()V

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->animateClose()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    nop

    .line 79
    :pswitch_data_0
    .packed-switch 0x7f0b0567
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

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
    iget-object v0, p0, Lcom/android/launcher3/allappsmenu/AllAppsSortMenuView;->g:Lcom/android/launcher3/v;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 21
    .line 22
    .line 23
    return p1

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
