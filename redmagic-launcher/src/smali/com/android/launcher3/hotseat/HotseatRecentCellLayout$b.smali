.class Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "HotseatRecentCellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->c1(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/model/data/I;

.field final synthetic h:Landroid/view/View;

.field final synthetic i:Z

.field final synthetic j:Lcom/android/launcher3/Hotseat;

.field final synthetic k:I

.field final synthetic l:I

.field final synthetic m:I

.field final synthetic n:Landroid/animation/ValueAnimator;

.field final synthetic o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;Lcom/android/launcher3/model/data/I;Landroid/view/View;ZLcom/android/launcher3/Hotseat;IIILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->g:Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->h:Landroid/view/View;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->i:Z

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->j:Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->k:I

    .line 12
    .line 13
    iput p7, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->l:I

    .line 14
    .line 15
    iput p8, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->m:I

    .line 16
    .line 17
    iput-object p9, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->n:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 20
    .line 21
    .line 22
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
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->I0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->g:Lcom/android/launcher3/model/data/I;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->h:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->i:Z

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->j:Lcom/android/launcher3/Hotseat;

    .line 27
    .line 28
    const v0, 0x7f0b04bf

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->j:Lcom/android/launcher3/Hotseat;

    .line 36
    .line 37
    const/high16 v0, 0x3f800000    # 1.0f

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/Hotseat;->u1(FZ)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->L0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->M0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)V

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-ge p1, v0, :cond_3

    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-nez v0, :cond_1

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_1
    iget v1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->k:I

    .line 80
    .line 81
    if-lt p1, v1, :cond_2

    .line 82
    .line 83
    add-int/lit8 v1, p1, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    move v1, p1

    .line 87
    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const v2, 0x7f0b04c4

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const v2, 0x7f0b04c3

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :goto_2
    add-int/lit8 p1, p1, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->j:Lcom/android/launcher3/Hotseat;

    .line 111
    .line 112
    const v0, 0x7f0b04c7

    .line 113
    .line 114
    .line 115
    sget-object v1, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->z0:Landroid/animation/TimeInterpolator;

    .line 116
    .line 117
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->j:Lcom/android/launcher3/Hotseat;

    .line 121
    .line 122
    const/16 v0, 0xc8

    .line 123
    .line 124
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const v1, 0x7f0b04c6

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 135
    .line 136
    new-instance v0, Landroid/graphics/Point;

    .line 137
    .line 138
    iget v1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->l:I

    .line 139
    .line 140
    iget v2, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->m:I

    .line 141
    .line 142
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 143
    .line 144
    .line 145
    const v1, 0x7f0b04c5

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 152
    .line 153
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->N0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Lcom/android/launcher3/views/k;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->i()V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->o:Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 169
    .line 170
    invoke-static {p1}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->J0(Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;)Ljava/util/ArrayList;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->n:Landroid/animation/ValueAnimator;

    .line 175
    .line 176
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->i:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout$b;->j:Lcom/android/launcher3/Hotseat;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const v0, 0x7f0b04bf

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
