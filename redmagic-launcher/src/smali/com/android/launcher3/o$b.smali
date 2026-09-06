.class Lcom/android/launcher3/o$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AutoAlignHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/o;->e(Lcom/android/launcher3/C2;Ljava/util/ArrayList;Lcom/android/launcher3/CellLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/animation/ValueAnimator;

.field final synthetic h:Lcom/android/launcher3/CellLayout;

.field final synthetic i:Ljava/util/ArrayList;

.field final synthetic j:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Landroid/animation/ValueAnimator;Lcom/android/launcher3/CellLayout;Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/o$b;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/o$b;->h:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/o$b;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/o$b;->j:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(ZLjava/util/ArrayList;Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onItemsDelete onAnimationDone isCancel= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p0, " enqueueDeleteRunnable run"

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "AutoAlignHelper"

    .line 24
    .line 25
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/android/launcher3/o$c;

    .line 43
    .line 44
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {p1}, Lcom/android/launcher3/o$c;->e(Lcom/android/launcher3/o$c;)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method

.method private b(Z)V
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/android/launcher3/o;->a(Landroid/animation/ValueAnimator;)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "onItemsDelete onAnimationDone isCancel= "

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "AutoAlignHelper"

    .line 23
    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/o$b;->h:Lcom/android/launcher3/CellLayout;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getOccupied()Lcom/android/launcher3/util/t0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-static {v0, v1}, Lcom/android/launcher3/o;->c(ZLcom/android/launcher3/util/t0;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/o$b;->i:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v7, 0x0

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    move-object v8, v2

    .line 55
    check-cast v8, Lcom/android/launcher3/o$c;

    .line 56
    .line 57
    invoke-static {v8}, Lcom/android/launcher3/o$c;->a(Lcom/android/launcher3/o$c;)Landroid/graphics/Point;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget v9, v2, Landroid/graphics/Point;->x:I

    .line 62
    .line 63
    invoke-static {v8}, Lcom/android/launcher3/o$c;->a(Lcom/android/launcher3/o$c;)Landroid/graphics/Point;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget v10, v2, Landroid/graphics/Point;->y:I

    .line 68
    .line 69
    invoke-static {v8}, Lcom/android/launcher3/o$c;->e(Lcom/android/launcher3/o$c;)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    move-object v11, v2

    .line 78
    check-cast v11, Lcom/android/launcher3/model/data/y;

    .line 79
    .line 80
    invoke-static {v8}, Lcom/android/launcher3/o$c;->e(Lcom/android/launcher3/o$c;)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    move-object v12, v2

    .line 89
    check-cast v12, Lc1/b;

    .line 90
    .line 91
    invoke-virtual {v12}, Lc1/b;->a()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    invoke-virtual {v12}, Lc1/b;->b()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    iget v4, v12, Lc1/b;->f:I

    .line 100
    .line 101
    iget v5, v12, Lc1/b;->g:I

    .line 102
    .line 103
    const/4 v6, 0x0

    .line 104
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 105
    .line 106
    .line 107
    iget v4, v12, Lc1/b;->f:I

    .line 108
    .line 109
    iget v5, v12, Lc1/b;->g:I

    .line 110
    .line 111
    const/4 v6, 0x1

    .line 112
    move v2, v9

    .line 113
    move v3, v10

    .line 114
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/util/t0;->e(IIIIZ)V

    .line 115
    .line 116
    .line 117
    iput v2, v11, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 118
    .line 119
    invoke-virtual {v12, v2}, Lc1/b;->e(I)V

    .line 120
    .line 121
    .line 122
    iput v3, v11, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 123
    .line 124
    invoke-virtual {v12, v3}, Lc1/b;->g(I)V

    .line 125
    .line 126
    .line 127
    invoke-static {v8}, Lcom/android/launcher3/o$c;->c(Lcom/android/launcher3/o$c;)Lcom/android/launcher3/G5;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-interface {v2}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    const/4 v3, 0x0

    .line 136
    invoke-virtual {v2, v7, v3, v3}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 137
    .line 138
    .line 139
    invoke-static {v8}, Lcom/android/launcher3/o$c;->e(Lcom/android/launcher3/o$c;)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_0
    invoke-static {v7, v1}, Lcom/android/launcher3/o;->c(ZLcom/android/launcher3/util/t0;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/android/launcher3/o$b;->j:Lcom/android/launcher3/C2;

    .line 151
    .line 152
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iget-object v1, p0, Lcom/android/launcher3/o$b;->j:Lcom/android/launcher3/C2;

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    iget-object v2, p0, Lcom/android/launcher3/o$b;->i:Ljava/util/ArrayList;

    .line 163
    .line 164
    iget-object p0, p0, Lcom/android/launcher3/o$b;->j:Lcom/android/launcher3/C2;

    .line 165
    .line 166
    new-instance v3, Lcom/android/launcher3/p;

    .line 167
    .line 168
    invoke-direct {v3, p1, v2, p0}, Lcom/android/launcher3/p;-><init>(ZLjava/util/ArrayList;Lcom/android/launcher3/C2;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1, v3}, Lz1/J3;->V(Ljava/lang/Runnable;)Lz1/J3$c;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-virtual {v0, p0}, Lz1/J3;->F(Lz1/J3$c;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/o$b;->b(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/o$b;->b(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/o$b;->g:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/launcher3/o;->a(Landroid/animation/ValueAnimator;)V

    .line 7
    .line 8
    .line 9
    const-string p0, "AutoAlignHelper"

    .line 10
    .line 11
    const-string p1, "onItemsDelete onAnimationStart"

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void
.end method
