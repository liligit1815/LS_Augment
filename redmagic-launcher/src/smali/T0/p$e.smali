.class LT0/p$e;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderAnimationManagerMFV.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LT0/p;->D0()Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final g:[F

.field private final h:[F

.field private final i:[F

.field private final j:[F

.field final synthetic k:Lcom/android/launcher3/Workspace;

.field final synthetic l:Lcom/android/launcher3/Hotseat;

.field final synthetic m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

.field final synthetic n:Lcom/android/launcher3/LongClickTextView;

.field final synthetic o:LT0/p;


# direct methods
.method constructor <init>(LT0/p;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, LT0/p$e;->o:LT0/p;

    .line 2
    .line 3
    iput-object p2, p0, LT0/p$e;->k:Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    iput-object p3, p0, LT0/p$e;->l:Lcom/android/launcher3/Hotseat;

    .line 6
    .line 7
    iput-object p4, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 8
    .line 9
    iput-object p5, p0, LT0/p$e;->n:Lcom/android/launcher3/LongClickTextView;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x2

    .line 15
    new-array p2, p1, [F

    .line 16
    .line 17
    iput-object p2, p0, LT0/p$e;->g:[F

    .line 18
    .line 19
    new-array p2, p1, [F

    .line 20
    .line 21
    iput-object p2, p0, LT0/p$e;->h:[F

    .line 22
    .line 23
    new-array p2, p1, [F

    .line 24
    .line 25
    iput-object p2, p0, LT0/p$e;->i:[F

    .line 26
    .line 27
    new-array p1, p1, [F

    .line 28
    .line 29
    iput-object p1, p0, LT0/p$e;->j:[F

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, LT0/p$e;->k:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    iget-object v0, p0, LT0/p$e;->g:[F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setPivotX(F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, LT0/p$e;->k:Lcom/android/launcher3/Workspace;

    .line 15
    .line 16
    iget-object v0, p0, LT0/p$e;->g:[F

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    aget v0, v0, v2

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setPivotY(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, LT0/p$e;->l:Lcom/android/launcher3/Hotseat;

    .line 25
    .line 26
    iget-object v0, p0, LT0/p$e;->h:[F

    .line 27
    .line 28
    aget v0, v0, v1

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setPivotX(F)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, LT0/p$e;->l:Lcom/android/launcher3/Hotseat;

    .line 34
    .line 35
    iget-object v0, p0, LT0/p$e;->h:[F

    .line 36
    .line 37
    aget v0, v0, v2

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setPivotY(F)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 43
    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->k0()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_0

    .line 55
    .line 56
    iget-object p1, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 57
    .line 58
    iget-object v0, p0, LT0/p$e;->i:[F

    .line 59
    .line 60
    aget v0, v0, v1

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setPivotX(F)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 66
    .line 67
    iget-object v0, p0, LT0/p$e;->i:[F

    .line 68
    .line 69
    aget v0, v0, v2

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setPivotY(F)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object p1, p0, LT0/p$e;->o:LT0/p;

    .line 75
    .line 76
    invoke-static {p1}, LT0/p;->m0(LT0/p;)Lcom/android/launcher3/h0;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 81
    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    iget-object p1, p0, LT0/p$e;->o:LT0/p;

    .line 85
    .line 86
    invoke-static {p1}, LT0/p;->n0(LT0/p;)Lcom/android/launcher3/h0;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 91
    .line 92
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->k:Z

    .line 93
    .line 94
    if-eqz p1, :cond_1

    .line 95
    .line 96
    iget-object p1, p0, LT0/p$e;->n:Lcom/android/launcher3/LongClickTextView;

    .line 97
    .line 98
    iget-object v0, p0, LT0/p$e;->j:[F

    .line 99
    .line 100
    aget v0, v0, v1

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setPivotX(F)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, LT0/p$e;->n:Lcom/android/launcher3/LongClickTextView;

    .line 106
    .line 107
    iget-object p0, p0, LT0/p$e;->j:[F

    .line 108
    .line 109
    aget p0, p0, v2

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setPivotY(F)V

    .line 112
    .line 113
    .line 114
    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, LT0/p$e;->g:[F

    .line 5
    .line 6
    iget-object v0, p0, LT0/p$e;->k:Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPivotX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    aput v0, p1, v1

    .line 14
    .line 15
    iget-object p1, p0, LT0/p$e;->g:[F

    .line 16
    .line 17
    iget-object v0, p0, LT0/p$e;->k:Lcom/android/launcher3/Workspace;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPivotY()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x1

    .line 24
    aput v0, p1, v2

    .line 25
    .line 26
    iget-object p1, p0, LT0/p$e;->h:[F

    .line 27
    .line 28
    iget-object v0, p0, LT0/p$e;->l:Lcom/android/launcher3/Hotseat;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPivotX()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    aput v0, p1, v1

    .line 35
    .line 36
    iget-object p1, p0, LT0/p$e;->h:[F

    .line 37
    .line 38
    iget-object v0, p0, LT0/p$e;->l:Lcom/android/launcher3/Hotseat;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPivotY()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    aput v0, p1, v2

    .line 45
    .line 46
    iget-object p1, p0, LT0/p$e;->o:LT0/p;

    .line 47
    .line 48
    invoke-static {p1}, LT0/p;->j0(LT0/p;)Lcom/android/launcher3/h0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget p1, p1, Lcom/android/launcher3/h0;->W0:I

    .line 53
    .line 54
    int-to-float p1, p1

    .line 55
    const/high16 v0, 0x40000000    # 2.0f

    .line 56
    .line 57
    div-float/2addr p1, v0

    .line 58
    iget-object v3, p0, LT0/p$e;->l:Lcom/android/launcher3/Hotseat;

    .line 59
    .line 60
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    int-to-float v4, v4

    .line 65
    div-float/2addr v4, v0

    .line 66
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setPivotX(F)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, LT0/p$e;->l:Lcom/android/launcher3/Hotseat;

    .line 70
    .line 71
    neg-float p1, p1

    .line 72
    invoke-virtual {v3, p1}, Landroid/view/ViewGroup;->setPivotY(F)V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 76
    .line 77
    if-eqz v3, :cond_0

    .line 78
    .line 79
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->k0()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_0

    .line 88
    .line 89
    iget-object v3, p0, LT0/p$e;->i:[F

    .line 90
    .line 91
    iget-object v4, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 92
    .line 93
    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getPivotX()F

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    aput v4, v3, v1

    .line 98
    .line 99
    iget-object v3, p0, LT0/p$e;->i:[F

    .line 100
    .line 101
    iget-object v4, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 102
    .line 103
    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getPivotY()F

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    aput v4, v3, v2

    .line 108
    .line 109
    iget-object v3, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 110
    .line 111
    invoke-virtual {v3}, Landroid/widget/RelativeLayout;->getMeasuredWidth()I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    int-to-float v4, v4

    .line 116
    div-float/2addr v4, v0

    .line 117
    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->setPivotX(F)V

    .line 118
    .line 119
    .line 120
    iget-object v3, p0, LT0/p$e;->m:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 121
    .line 122
    invoke-virtual {v3, p1}, Landroid/widget/RelativeLayout;->setPivotY(F)V

    .line 123
    .line 124
    .line 125
    :cond_0
    iget-object v3, p0, LT0/p$e;->o:LT0/p;

    .line 126
    .line 127
    invoke-static {v3}, LT0/p;->k0(LT0/p;)Lcom/android/launcher3/h0;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    iget-object v3, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 132
    .line 133
    if-eqz v3, :cond_1

    .line 134
    .line 135
    iget-object v3, p0, LT0/p$e;->o:LT0/p;

    .line 136
    .line 137
    invoke-static {v3}, LT0/p;->l0(LT0/p;)Lcom/android/launcher3/h0;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    iget-object v3, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 142
    .line 143
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->k:Z

    .line 144
    .line 145
    if-eqz v3, :cond_1

    .line 146
    .line 147
    iget-object v3, p0, LT0/p$e;->j:[F

    .line 148
    .line 149
    iget-object v4, p0, LT0/p$e;->n:Lcom/android/launcher3/LongClickTextView;

    .line 150
    .line 151
    invoke-virtual {v4}, Landroid/widget/TextView;->getPivotX()F

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    aput v4, v3, v1

    .line 156
    .line 157
    iget-object v1, p0, LT0/p$e;->j:[F

    .line 158
    .line 159
    iget-object v3, p0, LT0/p$e;->n:Lcom/android/launcher3/LongClickTextView;

    .line 160
    .line 161
    invoke-virtual {v3}, Landroid/widget/TextView;->getPivotY()F

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    aput v3, v1, v2

    .line 166
    .line 167
    iget-object v1, p0, LT0/p$e;->n:Lcom/android/launcher3/LongClickTextView;

    .line 168
    .line 169
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    int-to-float v2, v2

    .line 174
    div-float/2addr v2, v0

    .line 175
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setPivotX(F)V

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, LT0/p$e;->n:Lcom/android/launcher3/LongClickTextView;

    .line 179
    .line 180
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setPivotY(F)V

    .line 181
    .line 182
    .line 183
    :cond_1
    return-void
.end method
