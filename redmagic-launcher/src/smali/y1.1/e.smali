.class public Ly1/e;
.super Lcom/android/launcher3/util/i0;
.source "MiBoardEdgeEffect.java"


# instance fields
.field private a:Z

.field private b:Lcom/android/launcher3/C2;

.field private final c:Lz2/a$a;

.field private final d:Z

.field private e:F

.field private f:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Lz2/a$a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/i0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ly1/e;->b:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Ly1/e;->c:Lz2/a$a;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput-boolean p1, p0, Ly1/e;->d:Z

    .line 17
    .line 18
    iput-boolean p3, p0, Ly1/e;->a:Z

    .line 19
    .line 20
    return-void
.end method

.method private d()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ly1/e;->b:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ly1/e;->b:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/widget/EdgeEffect;->finish()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ly1/e;->e:F

    .line 13
    .line 14
    return-void
.end method

.method public getDistance()F
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/widget/EdgeEffect;->getDistance()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget p0, p0, Ly1/e;->e:F

    .line 13
    .line 14
    return p0
.end method

.method public isFinished()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget p0, p0, Ly1/e;->e:F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    cmpg-float p0, p0, v0

    .line 16
    .line 17
    if-gtz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public onAbsorb(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ly1/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onPullDistance(FF)F
    .locals 5

    .line 1
    invoke-direct {p0}, Ly1/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroid/widget/EdgeEffect;->onPullDistance(FF)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-boolean p2, p0, Ly1/e;->a:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Ly1/e;->c:Lz2/a$a;

    .line 18
    .line 19
    invoke-interface {p2}, Lz2/a$a;->f()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    return v0

    .line 26
    :cond_1
    iget p2, p0, Ly1/e;->e:F

    .line 27
    .line 28
    iget-boolean v1, p0, Ly1/e;->a:Z

    .line 29
    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    add-float v1, p1, p2

    .line 33
    .line 34
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iput v1, p0, Ly1/e;->e:F

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    sub-float v1, p2, p1

    .line 42
    .line 43
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p0, Ly1/e;->e:F

    .line 48
    .line 49
    :goto_0
    iget-boolean v1, p0, Ly1/e;->f:Z

    .line 50
    .line 51
    const-string v2, " deltaDistance="

    .line 52
    .line 53
    const-string v3, "MiBoardEdgeEffect"

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    cmpl-float v1, p2, v0

    .line 58
    .line 59
    if-nez v1, :cond_4

    .line 60
    .line 61
    iget v1, p0, Ly1/e;->e:F

    .line 62
    .line 63
    cmpl-float v1, v1, v0

    .line 64
    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v4, "onPullDistance onScrollInteractionBegin mIsScrolling="

    .line 73
    .line 74
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-boolean v4, p0, Ly1/e;->f:Z

    .line 78
    .line 79
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v4, " mDistance="

    .line 83
    .line 84
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget v4, p0, Ly1/e;->e:F

    .line 88
    .line 89
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v4, " oldDistance="

    .line 93
    .line 94
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-static {v3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    iget-object p2, p0, Ly1/e;->c:Lz2/a$a;

    .line 114
    .line 115
    invoke-interface {p2}, Lz2/a$a;->g()V

    .line 116
    .line 117
    .line 118
    const/4 p2, 0x1

    .line 119
    iput-boolean p2, p0, Ly1/e;->f:Z

    .line 120
    .line 121
    :cond_4
    iget-object p2, p0, Ly1/e;->c:Lz2/a$a;

    .line 122
    .line 123
    invoke-interface {p2}, Lz2/a$a;->f()Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-nez p2, :cond_5

    .line 128
    .line 129
    iget p2, p0, Ly1/e;->e:F

    .line 130
    .line 131
    cmpl-float p2, p2, v0

    .line 132
    .line 133
    if-lez p2, :cond_6

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_5
    iget p2, p0, Ly1/e;->e:F

    .line 137
    .line 138
    cmpl-float p2, p2, v0

    .line 139
    .line 140
    if-eqz p2, :cond_6

    .line 141
    .line 142
    :goto_1
    move v0, p1

    .line 143
    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string v1, "onPullDistance onScrollChange mDistance="

    .line 149
    .line 150
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget v1, p0, Ly1/e;->e:F

    .line 154
    .line 155
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string p1, " result="

    .line 165
    .line 166
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Ly1/e;->c:Lz2/a$a;

    .line 180
    .line 181
    iget p2, p0, Ly1/e;->e:F

    .line 182
    .line 183
    iget-boolean p0, p0, Ly1/e;->d:Z

    .line 184
    .line 185
    invoke-interface {p1, p2, p0}, Lz2/a$a;->c(FZ)V

    .line 186
    .line 187
    .line 188
    return v0
.end method

.method public onRelease()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ly1/e;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-boolean v0, p0, Ly1/e;->f:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "onRelease onScrollInteractionEnd old mDistance="

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget v1, p0, Ly1/e;->e:F

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "MiBoardEdgeEffect"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput v0, p0, Ly1/e;->e:F

    .line 41
    .line 42
    iget-object v0, p0, Ly1/e;->c:Lz2/a$a;

    .line 43
    .line 44
    invoke-interface {v0}, Lz2/a$a;->d()V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    iput-boolean v0, p0, Ly1/e;->f:Z

    .line 49
    .line 50
    :cond_1
    return-void
.end method
