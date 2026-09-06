.class public Lcom/android/launcher3/menu/n;
.super Ljava/lang/Object;
.source "MenuOverviewStateHandler.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$f<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field g:Lcom/android/launcher3/C2;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/menu/MenuContainer;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getMenuIconArrange()Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->P(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private d(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "MenuOverviewStateHandler"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "setStateWithAnimation: getOverviewPanelMFV"

    .line 12
    .line 13
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/n;->b(Lcom/android/launcher3/V3;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Lcom/android/launcher3/V3;->v(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$f;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v2, v2, Lcom/android/launcher3/V3$f;->a:Landroid/view/animation/Interpolator;

    .line 27
    .line 28
    const/4 v3, 0x3

    .line 29
    invoke-virtual {p2, v3, v2}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v2, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    sget-object v3, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    const/4 v5, 0x0

    .line 47
    if-ne p1, v3, :cond_1

    .line 48
    .line 49
    move v6, v4

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v6, v5

    .line 52
    :goto_0
    new-instance v7, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    const-string v8, "setStateWithAnimation: "

    .line 58
    .line 59
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v8, "-"

    .line 66
    .line 67
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-static {v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lx1/O;->p0()Z

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    const/4 v9, 0x0

    .line 98
    const/4 v10, 0x0

    .line 99
    const/high16 v11, 0x3f800000    # 1.0f

    .line 100
    .line 101
    if-ne p1, v3, :cond_4

    .line 102
    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    int-to-float p1, v8

    .line 106
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    int-to-float p1, v7

    .line 111
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 112
    .line 113
    .line 114
    :goto_1
    if-eqz v2, :cond_3

    .line 115
    .line 116
    sget-object p1, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_3
    sget-object p1, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 120
    .line 121
    :goto_2
    sget-object v2, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 122
    .line 123
    invoke-virtual {p3, v0, p1, v10, v2}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p3, v0, v11, v9}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 127
    .line 128
    .line 129
    goto :goto_4

    .line 130
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    if-ne p1, v3, :cond_8

    .line 141
    .line 142
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    cmpg-float p1, p1, v11

    .line 150
    .line 151
    if-gez p1, :cond_5

    .line 152
    .line 153
    invoke-virtual {v0, v11}, Landroid/view/View;->setAlpha(F)V

    .line 154
    .line 155
    .line 156
    :cond_5
    if-eqz v2, :cond_6

    .line 157
    .line 158
    sget-object p1, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_6
    sget-object p1, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 162
    .line 163
    :goto_3
    if-eqz v2, :cond_7

    .line 164
    .line 165
    move v7, v8

    .line 166
    :cond_7
    int-to-float v2, v7

    .line 167
    sget-object v3, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 168
    .line 169
    invoke-virtual {p3, v0, p1, v2, v3}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p3, v0, v10, v9}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 173
    .line 174
    .line 175
    new-instance p1, Lcom/android/launcher3/menu/n$a;

    .line 176
    .line 177
    invoke-direct {p1, p0, v0}, Lcom/android/launcher3/menu/n$a;-><init>(Lcom/android/launcher3/menu/n;Landroid/view/View;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p3, p1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-eqz p1, :cond_8

    .line 188
    .line 189
    invoke-virtual {v0}, Lcom/android/launcher3/menu/MenuContainer;->getMenuIconArrange()Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p1, v4}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->P(Z)V

    .line 194
    .line 195
    .line 196
    new-instance p1, Lcom/android/launcher3/menu/m;

    .line 197
    .line 198
    invoke-direct {p1, v0}, Lcom/android/launcher3/menu/m;-><init>(Lcom/android/launcher3/menu/MenuContainer;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p3, p1}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 202
    .line 203
    .line 204
    :cond_8
    :goto_4
    iget-object p0, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    if-nez p0, :cond_9

    .line 215
    .line 216
    const-string p0, "setStateWithAnimation homeScreenEditor is null"

    .line 217
    .line 218
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_9
    if-eqz v6, :cond_a

    .line 223
    .line 224
    invoke-virtual {p0, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p3, p0, v11, p2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_a
    invoke-virtual {p0, v10}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 232
    .line 233
    .line 234
    return-void
.end method


# virtual methods
.method public b(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    and-int/lit16 p1, p1, 0x400

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/high16 p1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move p1, v0

    .line 24
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    cmpl-float p1, p1, v0

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/16 v0, 0x8

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/menu/MenuContainer;->getIconArrangeTopBar()Lcom/android/launcher3/iconarrange/IconArrangeTopBar;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p0, p0, Lcom/android/launcher3/menu/n;->g:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_2

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 85
    .line 86
    .line 87
    :goto_1
    const/4 p0, 0x0

    .line 88
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    :cond_3
    return-void
.end method

.method public c(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/menu/n;->d(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setState(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/n;->b(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/menu/n;->c(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
