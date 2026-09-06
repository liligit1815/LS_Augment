.class public Lcom/android/launcher3/taskbar/bubbles/g0;
.super Ljava/lang/Object;
.source "BubbleBarViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/g0$i;,
        Lcom/android/launcher3/taskbar/bubbles/g0$h;,
        Lcom/android/launcher3/taskbar/bubbles/g0$g;
    }
.end annotation


# instance fields
.field private A:F

.field private B:F

.field private final C:I

.field private D:Z

.field private E:Z

.field private F:Z

.field private G:Z

.field public H:Z

.field private I:Z

.field private J:LN2/h;

.field private K:LV1/y;

.field private final L:Landroid/widget/FrameLayout;

.field private M:LW1/l;

.field private N:Lcom/android/launcher3/taskbar/bubbles/z;

.field private O:Lcom/android/launcher3/taskbar/J3;

.field private final P:Lcom/android/launcher3/taskbar/bubbles/w;

.field private final Q:Lcom/android/launcher3/taskbar/bubbles/w;

.field private final R:Lcom/android/launcher3/taskbar/bubbles/g0$i;

.field private final S:I

.field private final T:I

.field private U:Lcom/android/launcher3/taskbar/bubbles/g0$g;

.field private final a:Lcom/android/quickstep/SystemUiProxy;

.field private final b:Lcom/android/launcher3/taskbar/I1;

.field private final c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

.field private d:I

.field private e:I

.field private final f:I

.field private g:LX1/b;

.field private h:Lcom/android/launcher3/taskbar/bubbles/t;

.field private i:Lcom/android/launcher3/taskbar/bubbles/u0;

.field private j:Lcom/android/launcher3/taskbar/a4;

.field private k:Lcom/android/launcher3/taskbar/N2;

.field private l:Lcom/android/launcher3/taskbar/bubbles/g0$h;

.field private m:Landroid/view/View$OnClickListener;

.field private n:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

.field private o:Lcom/android/launcher3/taskbar/bubbles/x;

.field private final p:Lcom/android/launcher3/util/B1;

.field private final q:Lcom/android/launcher3/anim/d;

.field private final r:Lcom/android/launcher3/anim/d;

.field private final s:Lcom/android/launcher3/anim/d;

.field private final t:Lcom/android/launcher3/anim/d;

.field private final u:Lcom/android/launcher3/anim/d;

.field private final v:Lcom/android/launcher3/anim/d;

.field private final w:Lcom/android/launcher3/anim/d;

.field private final x:Lcom/android/launcher3/anim/d;

.field private final y:Lcom/android/launcher3/anim/d;

.field private final z:Lcom/android/launcher3/taskbar/bubbles/w$a;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/widget/FrameLayout;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/M;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/M;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->q:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 17
    .line 18
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/X;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/X;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->r:Lcom/android/launcher3/anim/d;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 29
    .line 30
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/Y;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/Y;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->s:Lcom/android/launcher3/anim/d;

    .line 39
    .line 40
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 41
    .line 42
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/Z;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/Z;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->t:Lcom/android/launcher3/anim/d;

    .line 51
    .line 52
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 53
    .line 54
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/a0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/a0;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->u:Lcom/android/launcher3/anim/d;

    .line 63
    .line 64
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 65
    .line 66
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/b0;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/b0;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->v:Lcom/android/launcher3/anim/d;

    .line 75
    .line 76
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 77
    .line 78
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/c0;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/c0;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->w:Lcom/android/launcher3/anim/d;

    .line 87
    .line 88
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 89
    .line 90
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/d0;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/d0;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 93
    .line 94
    .line 95
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->x:Lcom/android/launcher3/anim/d;

    .line 99
    .line 100
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 101
    .line 102
    new-instance v1, Lcom/android/launcher3/taskbar/bubbles/e0;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/bubbles/e0;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 105
    .line 106
    .line 107
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/util/function/Consumer;)V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->y:Lcom/android/launcher3/anim/d;

    .line 111
    .line 112
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/g0$a;

    .line 113
    .line 114
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0$a;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->z:Lcom/android/launcher3/taskbar/bubbles/w$a;

    .line 118
    .line 119
    const/4 v1, 0x1

    .line 120
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->E:Z

    .line 121
    .line 122
    const/4 v2, 0x0

    .line 123
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->I:Z

    .line 124
    .line 125
    new-instance v2, Lcom/android/launcher3/taskbar/bubbles/f0;

    .line 126
    .line 127
    invoke-direct {v2}, Lcom/android/launcher3/taskbar/bubbles/f0;-><init>()V

    .line 128
    .line 129
    .line 130
    iput-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->R:Lcom/android/launcher3/taskbar/bubbles/g0$i;

    .line 131
    .line 132
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 133
    .line 134
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 135
    .line 136
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->L:Landroid/widget/FrameLayout;

    .line 137
    .line 138
    sget-object p3, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 139
    .line 140
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    check-cast p3, Lcom/android/quickstep/SystemUiProxy;

    .line 145
    .line 146
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 147
    .line 148
    new-instance p3, Lcom/android/launcher3/util/B1;

    .line 149
    .line 150
    invoke-direct {p3, p2, v1}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 151
    .line 152
    .line 153
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->p:Lcom/android/launcher3/util/B1;

    .line 154
    .line 155
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    const p3, 0x7f07016d

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 163
    .line 164
    .line 165
    move-result p3

    .line 166
    iput p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->d:I

    .line 167
    .line 168
    const p3, 0x7f07017e

    .line 169
    .line 170
    .line 171
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 172
    .line 173
    .line 174
    move-result p3

    .line 175
    iput p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->C:I

    .line 176
    .line 177
    const p3, 0x7f0702c7

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 181
    .line 182
    .line 183
    move-result p3

    .line 184
    iput p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->f:I

    .line 185
    .line 186
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->k0(Lcom/android/launcher3/taskbar/I1;)I

    .line 187
    .line 188
    .line 189
    move-result p3

    .line 190
    iput p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->S:I

    .line 191
    .line 192
    invoke-static {p1}, LN2/n;->e(Landroid/content/Context;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_0

    .line 197
    .line 198
    const p1, 0x7f0702c5

    .line 199
    .line 200
    .line 201
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->T:I

    .line 206
    .line 207
    goto :goto_0

    .line 208
    :cond_0
    const p1, 0x7f0702c6

    .line 209
    .line 210
    .line 211
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->T:I

    .line 216
    .line 217
    :goto_0
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/w;

    .line 218
    .line 219
    sget-object p2, LN2/h;->i:LN2/h;

    .line 220
    .line 221
    invoke-direct {p1, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/w;-><init>(LN2/h;Lcom/android/launcher3/taskbar/bubbles/w$a;)V

    .line 222
    .line 223
    .line 224
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->P:Lcom/android/launcher3/taskbar/bubbles/w;

    .line 225
    .line 226
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/w;

    .line 227
    .line 228
    sget-object p2, LN2/h;->j:LN2/h;

    .line 229
    .line 230
    invoke-direct {p1, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/w;-><init>(LN2/h;Lcom/android/launcher3/taskbar/bubbles/w$a;)V

    .line 231
    .line 232
    .line 233
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->Q:Lcom/android/launcher3/taskbar/bubbles/w;

    .line 234
    .line 235
    return-void
.end method

.method static bridge synthetic A(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->x0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private E1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBackgroundAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private F(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 2
    .line 3
    invoke-interface {v0}, LX1/b;->u()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 10
    .line 11
    invoke-interface {v0}, LX1/b;->w()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_4

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->G0()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->l:Lcom/android/launcher3/taskbar/bubbles/g0$h;

    .line 29
    .line 30
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$h;->b()Lcom/android/launcher3/util/v1$c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 39
    .line 40
    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    const-wide/16 v0, 0x64

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_2
    const-wide/16 v0, 0x96

    .line 50
    .line 51
    :goto_2
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    if-nez p1, :cond_3

    .line 55
    .line 56
    const-wide/16 v0, 0x32

    .line 57
    .line 58
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 59
    .line 60
    .line 61
    :cond_3
    sget-object p1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 67
    .line 68
    .line 69
    :cond_4
    return-void
.end method

.method private F1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBackgroundScaleX(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private G1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBackgroundScaleY(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private H1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBubbleAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private I1(IIZ)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->d:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->e:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->d:I

    .line 11
    .line 12
    iput p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->e:I

    .line 13
    .line 14
    if-eqz p3, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    int-to-float p2, p2

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->v(FF)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 25
    .line 26
    int-to-float p1, p1

    .line 27
    int-to-float p2, p2

    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->k0(FF)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private J1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBubbleOffsetY(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private K1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private L()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->u1(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 6
    .line 7
    invoke-interface {p0}, LX1/b;->J()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic L0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private L1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private M()Lcom/android/launcher3/taskbar/bubbles/y;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/g0$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0$f;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private synthetic M0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->x1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private N()LW1/A;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/g0$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0$e;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private synthetic N0(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->W0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private N1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->w:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->A:F

    .line 8
    .line 9
    add-float/2addr v1, v2

    .line 10
    iget v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->B:F

    .line 11
    .line 12
    add-float/2addr v1, v2

    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->m0()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-float/2addr v1, p0

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private O()LW1/n;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/g0$d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0$d;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private synthetic O0(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->Y0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private O1()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->F:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 7
    .line 8
    invoke-virtual {v0}, LV1/y;->k0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->D:Z

    .line 18
    .line 19
    if-nez v2, :cond_2

    .line 20
    .line 21
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->E:Z

    .line 22
    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 35
    .line 36
    const/4 v0, 0x4

    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private P(Lcom/android/launcher3/taskbar/bubbles/BubbleView;ZLandroid/graphics/Rect;F)Landroid/animation/Animator;
    .locals 5

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {p0, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    div-int/lit8 p3, p3, 0x2

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    int-to-float v1, v1

    .line 30
    sub-float/2addr v1, p4

    .line 31
    float-to-int p4, v1

    .line 32
    div-int/lit8 p4, p4, 0x2

    .line 33
    .line 34
    invoke-static {v2, p4}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    new-instance v1, Landroid/graphics/Rect;

    .line 39
    .line 40
    iget v2, p0, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    add-int/2addr v2, p4

    .line 43
    sub-int v3, v0, p3

    .line 44
    .line 45
    iget v4, p0, Landroid/graphics/Rect;->right:I

    .line 46
    .line 47
    sub-int/2addr v4, p4

    .line 48
    add-int/2addr v0, p3

    .line 49
    invoke-direct {v1, v2, v3, v4, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    int-to-float p3, p3

    .line 57
    const/high16 p4, 0x40000000    # 2.0f

    .line 58
    .line 59
    div-float/2addr p3, p4

    .line 60
    new-instance p4, Lcom/android/launcher3/anim/d0;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-direct {p4, v0, p3, p0, v1}, Lcom/android/launcher3/anim/d0;-><init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 64
    .line 65
    .line 66
    xor-int/lit8 p0, p2, 0x1

    .line 67
    .line 68
    invoke-virtual {p4, p1, p0, v0}, Lcom/android/launcher3/anim/c0;->c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method private synthetic P0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->u1(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic Q0(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->k:Lcom/android/launcher3/taskbar/N2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->U:Lcom/android/launcher3/taskbar/bubbles/g0$g;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$g;->a()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private synthetic R0(Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->N1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->t1(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic S0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->O1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setExpanded(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->F(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/I1;->d0(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private T0()Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->G:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->G:Z

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->getBoundsOnScreen(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Landroid/graphics/Point;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 25
    .line 26
    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/android/quickstep/SystemUiProxy;->showUserEducation(Landroid/graphics/Point;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    return v1
.end method

.method private Y0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->y:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->k()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->t()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    const-string v0, "BubbleBarViewController"

    .line 20
    .line 21
    const-string v1, "bubble click listener, bubble was null"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->h:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/t;->E2()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->L()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->h:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->b3(Lcom/android/launcher3/taskbar/bubbles/u;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->L0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/bubbles/g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->O0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b0(Landroid/content/res/Resources;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->c0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->N1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/high16 v0, 0x42300000    # 44.0f

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v1, v0, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v2, 0x42400000    # 48.0f

    .line 13
    .line 14
    invoke-static {v1, v2, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-float/2addr v0, p0

    .line 19
    const/high16 p0, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr v0, p0

    .line 22
    iget p0, p2, Lcom/android/launcher3/h0;->u3:I

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    cmpg-float p0, p0, v0

    .line 26
    .line 27
    if-gtz p0, :cond_0

    .line 28
    .line 29
    const p0, 0x7f07016f

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_0
    const p0, 0x7f07016d

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/bubbles/g0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->G1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/bubbles/g0;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->R0(Ljava/lang/Float;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e0(Landroid/content/res/Resources;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->f0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/bubbles/g0;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->N0(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/high16 v0, 0x42400000    # 48.0f

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v1, v0, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v2, 0x42500000    # 52.0f

    .line 13
    .line 14
    invoke-static {v1, v2, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-float/2addr v0, p0

    .line 19
    const/high16 p0, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr v0, p0

    .line 22
    iget p0, p2, Lcom/android/launcher3/h0;->u3:I

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    cmpl-float p0, p0, v0

    .line 26
    .line 27
    if-ltz p0, :cond_0

    .line 28
    .line 29
    const p0, 0x7f070171

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_0
    const p0, 0x7f070170

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/bubbles/g0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->K1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/taskbar/bubbles/g0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->F1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/taskbar/bubbles/g0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->E1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/taskbar/bubbles/g0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->H1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/taskbar/bubbles/g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->P0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k0(Lcom/android/launcher3/taskbar/I1;)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f07016e

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const v1, 0x7f070172

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    mul-int/lit8 p0, p0, 0x2

    .line 20
    .line 21
    add-int/2addr v0, p0

    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->A0()Lcom/android/launcher3/h0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget p0, p0, Lcom/android/launcher3/h0;->r3:I

    .line 27
    .line 28
    sub-int/2addr p0, v0

    .line 29
    div-int/lit8 p0, p0, 0x2

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->I0()Lcom/android/launcher3/h0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget p1, p1, Lcom/android/launcher3/h0;->t3:I

    .line 36
    .line 37
    sub-int/2addr p1, p0

    .line 38
    return p1
.end method

.method public static synthetic l(Lcom/android/launcher3/taskbar/bubbles/g0;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/taskbar/bubbles/g0;->Q0(Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->M0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m0()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->O:Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->y:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/android/launcher3/taskbar/J3;->u:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->S:I

    .line 16
    .line 17
    int-to-float p0, p0

    .line 18
    invoke-static {v2, v1, p0}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->S:I

    .line 24
    .line 25
    neg-int p0, p0

    .line 26
    int-to-float p0, p0

    .line 27
    invoke-static {v2, p0, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public static synthetic n(Lcom/android/launcher3/taskbar/bubbles/g0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->L1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->S0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/taskbar/bubbles/g0;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->J1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic q(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/I1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    return-object p0
.end method

.method private q0(LN2/h;Landroid/graphics/Rect;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->I0()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->c0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/bubbles/g0;->f0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 22
    .line 23
    invoke-virtual {v3, v2, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->L(II)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getHorizontalMargin()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    add-float/2addr v1, v2

    .line 35
    float-to-int v1, v1

    .line 36
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p1, p0}, LN2/h;->e(Z)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    sub-int/2addr p0, v1

    .line 51
    return p0

    .line 52
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 57
    .line 58
    sub-int/2addr p0, v1

    .line 59
    iget p1, p2, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    sub-int/2addr p0, p1

    .line 62
    return p0
.end method

.method static bridge synthetic r(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic s(Lcom/android/launcher3/taskbar/bubbles/g0;)Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->L:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic t(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/launcher3/taskbar/bubbles/t;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->h:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 2
    .line 3
    return-object p0
.end method

.method private t1(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f07016e

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->I0()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-direct {p0, v0, v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->c0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    int-to-float v2, v2

    .line 25
    int-to-float v1, v1

    .line 26
    invoke-static {p1, v2, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const v2, 0x7f070172

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->I0()Lcom/android/launcher3/h0;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-direct {p0, v0, v3}, Lcom/android/launcher3/taskbar/bubbles/g0;->f0(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    int-to-float v0, v0

    .line 48
    int-to-float v2, v2

    .line 49
    invoke-static {p1, v0, v2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 54
    .line 55
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->l0(FF)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method static bridge synthetic u(Lcom/android/launcher3/taskbar/bubbles/g0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->T:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic v(Lcom/android/launcher3/taskbar/bubbles/g0;)LX1/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic w(Lcom/android/launcher3/taskbar/bubbles/g0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic x(Lcom/android/launcher3/taskbar/bubbles/g0;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method private x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 2
    .line 3
    invoke-virtual {v0}, LV1/y;->j0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-interface {v0, v1, p0}, LX1/b;->e(ZF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method static bridge synthetic y(Lcom/android/launcher3/taskbar/bubbles/g0;)Lcom/android/quickstep/SystemUiProxy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic z(Lcom/android/launcher3/taskbar/bubbles/g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

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

.method public A1(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->B:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->N1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(Lcom/android/launcher3/taskbar/bubbles/u;ZZLcom/android/launcher3/taskbar/bubbles/b;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    const/4 p4, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1, p4}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->t(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->m:Landroid/view/View$OnClickListener;

    .line 25
    .line 26
    invoke-virtual {p4, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->i:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p4, v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->p(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->n:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 43
    .line 44
    invoke-virtual {p4, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 45
    .line 46
    .line 47
    if-nez p3, :cond_1

    .line 48
    .line 49
    instance-of p3, p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 50
    .line 51
    if-eqz p3, :cond_1

    .line 52
    .line 53
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 54
    .line 55
    const/4 p3, 0x0

    .line 56
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/bubbles/g0;->J(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->j:Lcom/android/launcher3/taskbar/a4;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 69
    .line 70
    invoke-interface {p1}, LX1/b;->w()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->j:Lcom/android/launcher3/taskbar/a4;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 85
    .line 86
    invoke-interface {p0}, LX1/b;->q()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 91
    .line 92
    invoke-interface {p0}, LX1/b;->x()V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    const-string p0, "BubbleBarViewController"

    .line 97
    .line 98
    const-string p1, "addBubble, bubble was null!"

    .line 99
    .line 100
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public B0(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->P(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public B1(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->A:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->N1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;ZZZ)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    move-object p3, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    if-eqz p6, :cond_1

    .line 21
    .line 22
    new-instance p6, Lcom/android/launcher3/taskbar/bubbles/U;

    .line 23
    .line 24
    invoke-direct {p6, p0}, Lcom/android/launcher3/taskbar/bubbles/U;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move-object p6, v0

    .line 29
    :goto_1
    invoke-virtual {v1, v2, v3, p3, p6}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    iget-object p6, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->m:Landroid/view/View$OnClickListener;

    .line 37
    .line 38
    invoke-virtual {p3, p6}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    iget-object p6, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->n:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 46
    .line 47
    invoke-virtual {p3, p6}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->i:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p2, p3}, Lcom/android/launcher3/taskbar/bubbles/u0;->p(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 64
    .line 65
    .line 66
    if-nez p5, :cond_2

    .line 67
    .line 68
    const/4 p2, 0x0

    .line 69
    invoke-virtual {p0, p1, p4, p2}, Lcom/android/launcher3/taskbar/bubbles/g0;->J(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V

    .line 70
    .line 71
    .line 72
    :cond_2
    return-void
.end method

.method public C0(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->W()Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRestingTopPositionOnScreen()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    int-to-float p0, p0

    .line 28
    cmpl-float p0, p1, p0

    .line 29
    .line 30
    if-ltz p0, :cond_1

    .line 31
    .line 32
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 33
    .line 34
    int-to-float p0, p0

    .line 35
    cmpl-float p0, v2, p0

    .line 36
    .line 37
    if-ltz p0, :cond_1

    .line 38
    .line 39
    iget p0, v0, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    int-to-float p0, p0

    .line 42
    cmpg-float p0, v2, p0

    .line 43
    .line 44
    if-gtz p0, :cond_1

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_1
    return v1
.end method

.method public C1(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setUpdateSelectedBubbleAfterCollapse(Ljava/util/function/Consumer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Lcom/android/launcher3/dragndrop/j;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/dragndrop/j<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->P:Lcom/android/launcher3/taskbar/bubbles/w;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->Q:Lcom/android/launcher3/taskbar/bubbles/w;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/launcher3/dragndrop/j;->h(Lcom/android/launcher3/n0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public D0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D1(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->s(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->m:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->n:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h0(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const/4 v0, 0x0

    .line 62
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public E(Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p2, :cond_1

    .line 11
    .line 12
    move-object p2, v0

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v1, v2, v3, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->m:Landroid/view/View$OnClickListener;

    .line 40
    .line 41
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->n:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 51
    .line 52
    invoke-virtual {p2, p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public E0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method F0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public G(LN2/h;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->w(LN2/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->R()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

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
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->l:Lcom/android/launcher3/taskbar/bubbles/g0$h;

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/android/launcher3/taskbar/bubbles/g0$h;->a()Landroid/graphics/Rect;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarExpandedBounds()Landroid/graphics/Rect;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method public H(LN2/h;LN2/h;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->x(LN2/h;LN2/h;)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public H0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->J:LN2/h;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v0}, LN2/h;->e(Z)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->J:LN2/h;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, LN2/h;->e(Z)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eq v2, p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v1
.end method

.method public I(LN2/h;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->y(LN2/h;)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public I0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LV1/y;->g0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public J(Lcom/android/launcher3/taskbar/bubbles/b;ZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 2
    .line 3
    invoke-virtual {v0}, LV1/y;->k0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 15
    .line 16
    invoke-interface {v2}, LX1/b;->c()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    xor-int/2addr v2, v1

    .line 21
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->D(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->D0()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->j:Lcom/android/launcher3/taskbar/a4;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-ne v2, v1, :cond_3

    .line 44
    .line 45
    if-nez p3, :cond_3

    .line 46
    .line 47
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 48
    .line 49
    invoke-virtual {p3}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->V()Z

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    if-eqz p3, :cond_2

    .line 54
    .line 55
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->N:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 56
    .line 57
    invoke-virtual {p3}, LN2/f;->p()V

    .line 58
    .line 59
    .line 60
    :cond_2
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->V()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {p3, p1, v0, p2, p0}, LV1/y;->C(Lcom/android/launcher3/taskbar/bubbles/b;ZZZ)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 73
    .line 74
    invoke-interface {p3}, LX1/b;->c()Z

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    if-eqz p3, :cond_6

    .line 79
    .line 80
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 81
    .line 82
    invoke-interface {p3}, LX1/b;->w()Z

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    if-nez p3, :cond_4

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    if-eqz v0, :cond_5

    .line 90
    .line 91
    iget-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 92
    .line 93
    invoke-interface {p3}, LX1/b;->G()Z

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    if-eqz p3, :cond_5

    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 100
    .line 101
    invoke-virtual {p0, p1, p2}, LV1/y;->A(Lcom/android/launcher3/taskbar/bubbles/b;Z)V

    .line 102
    .line 103
    .line 104
    :cond_5
    :goto_0
    return-void

    .line 105
    :cond_6
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 106
    .line 107
    invoke-virtual {p0, p1, p2}, LV1/y;->y(Lcom/android/launcher3/taskbar/bubbles/b;Z)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public J0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 2
    .line 3
    return p0
.end method

.method public K(Landroid/view/View;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public K0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->V()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public M1(Lcom/android/launcher3/taskbar/bubbles/u;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setSelectedBubble(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Q(Z)Landroid/animation/Animator;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 7
    .line 8
    invoke-interface {v1, v0}, LX1/b;->C(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    int-to-float v3, v1

    .line 23
    div-float/2addr v2, v3

    .line 24
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    :goto_0
    if-ge v4, v1, :cond_0

    .line 31
    .line 32
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 33
    .line 34
    invoke-virtual {v5, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 39
    .line 40
    invoke-direct {p0, v5, p1, v0, v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->P(Lcom/android/launcher3/taskbar/bubbles/BubbleView;ZLandroid/graphics/Rect;F)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 45
    .line 46
    .line 47
    add-int/lit8 v4, v4, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return-object v3
.end method

.method public R(Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    const-string v0, "Bubble bar view controller state:"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "  mHiddenForSysui: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->D:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v1, "  mHiddenForNoBubbles: "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->E:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v1, "  mHiddenForStashed: "

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->F:Z

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v1, "  mShouldShowEducation: "

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->G:Z

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    const-string v1, "  mBubbleBarTranslationY.value: "

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->w:Lcom/android/launcher3/anim/d;

    .line 105
    .line 106
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    const-string v1, "  mBubbleBarSwipeUpTranslationY: "

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->A:F

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .line 144
    .line 145
    const-string v1, "  mOverflowAdded: "

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 163
    .line 164
    if-eqz p0, :cond_0

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->H(Ljava/io/PrintWriter;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_0
    const-string p0, "  Bubble bar view is null!"

    .line 171
    .line 172
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public S()Lcom/android/launcher3/util/v1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->p:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    return-object p0
.end method

.method public T()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->r:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public U()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->u:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public U0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Landroid/graphics/Point;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

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
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 17
    .line 18
    invoke-virtual {v1, v0, p2}, Lcom/android/quickstep/SystemUiProxy;->moveDraggedBubbleToFullscreen(Ljava/lang/String;Landroid/graphics/Point;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->Z0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public V()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->v:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public V0(Lcom/android/launcher3/taskbar/bubbles/u;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->R:Lcom/android/launcher3/taskbar/bubbles/g0$i;

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/g0$i;->a()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {v0, p1, v1, v2}, Lcom/android/quickstep/SystemUiProxy;->dragBubbleToDismiss(Ljava/lang/String;J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public W()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarBounds()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public W0(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 8
    .line 9
    invoke-interface {v1}, LX1/b;->u()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 16
    .line 17
    invoke-interface {v1}, LX1/b;->w()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const v1, 0x7f07016e

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const v2, 0x7f070172

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->b0(Landroid/content/res/Resources;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->e0(Landroid/content/res/Resources;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    :goto_1
    invoke-direct {p0, v1, v0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->I1(IIZ)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public X()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->q:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public X0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->w:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public Y()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarCollapsedHeight()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Z()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->C()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Z0(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->h:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/bubbles/t;->U2(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h0(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public a0(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->J(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setDraggedBubble(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b1(LN2/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRestingTopPositionOnScreen()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/android/quickstep/SystemUiProxy;->stopBubbleDrag(LN2/h;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public c1(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->getBubble()Lcom/android/launcher3/taskbar/bubbles/u;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/u;->a()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->startBubbleDrag(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setDraggedBubble(Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public d0()LN2/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarLocation()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->F(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->removeAllBubbles()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f1(LN2/h;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->J:LN2/h;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->o0(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 16
    .line 17
    invoke-interface {v0}, LX1/b;->c()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->I:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->J:LN2/h;

    .line 36
    .line 37
    invoke-interface {p1, v0, p0}, LX1/b;->r(LN2/h;LN2/h;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->H0()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->G(LN2/h;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void

    .line 57
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->N:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, LN2/f;->z(LN2/h;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public g0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->y:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public g1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 8
    .line 9
    invoke-virtual {p0}, LV1/y;->i0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public h0()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRelativePivotX()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->o0(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->N:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 8
    .line 9
    invoke-virtual {v0}, LN2/f;->p()V

    .line 10
    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->I:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->J:LN2/h;

    .line 16
    .line 17
    return-void
.end method

.method public i0()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getRelativePivotY()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->K0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->I:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->J:LN2/h;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v1, v0, v2}, LX1/b;->h(LN2/h;LN2/h;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->H0()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->G(LN2/h;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->h1()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public j0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->t:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public j1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 8
    .line 9
    invoke-virtual {p0}, LV1/y;->n0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public k1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->G:Z

    .line 3
    .line 4
    return-void
.end method

.method public l0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->w:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public l1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m1(Lcom/android/launcher3/taskbar/bubbles/b;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->h0(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "BubbleBarViewController"

    .line 22
    .line 23
    const-string p1, "removeBubble, bubble was null!"

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public n0()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 16
    .line 17
    invoke-interface {v0}, LX1/b;->D()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-float v0, v0

    .line 22
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarCollapsedHeight()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/high16 v2, 0x40000000    # 2.0f

    .line 29
    .line 30
    div-float/2addr v1, v2

    .line 31
    add-float/2addr v0, v1

    .line 32
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getArrowHeight()F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    add-float/2addr v0, v1

    .line 39
    float-to-int v0, v0

    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->y0()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->j:Lcom/android/launcher3/taskbar/a4;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/a4;->c0()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 55
    .line 56
    invoke-interface {v1}, LX1/b;->G()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 63
    .line 64
    invoke-interface {v0}, LX1/b;->l()F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    neg-float v0, v0

    .line 69
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 70
    .line 71
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    int-to-float v1, v1

    .line 76
    add-float/2addr v0, v1

    .line 77
    float-to-int v0, v0

    .line 78
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->M:LW1/l;

    .line 79
    .line 80
    invoke-virtual {p0}, LW1/l;->t()I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    :goto_0
    add-int/2addr v0, p0

    .line 85
    return v0

    .line 86
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->M:LW1/l;

    .line 87
    .line 88
    invoke-virtual {p0}, LW1/l;->t()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    goto :goto_0

    .line 93
    :cond_2
    return v0
.end method

.method public n1(Lcom/android/launcher3/dragndrop/j;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/dragndrop/j<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->P:Lcom/android/launcher3/taskbar/bubbles/w;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->Q:Lcom/android/launcher3/taskbar/bubbles/w;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->x:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public o1(Lcom/android/launcher3/taskbar/bubbles/b;Lcom/android/launcher3/taskbar/bubbles/b;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->H:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p2, :cond_1

    .line 11
    .line 12
    move-object p2, v0

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 25
    .line 26
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v1, v2, v3, p2, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->u(Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->m:Landroid/view/View$OnClickListener;

    .line 38
    .line 39
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/b;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->n:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/x;->b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public p0()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getCollapsedWidthWithMaxVisibleBubbles()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public p1(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/taskbar/bubbles/b;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/e;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/bubbles/e;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/W;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/bubbles/W;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->i0(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public q1(Lcom/android/launcher3/taskbar/bubbles/g0$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->U:Lcom/android/launcher3/taskbar/bubbles/g0$g;

    .line 2
    .line 3
    return-void
.end method

.method public r0(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarLocation()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->M(Landroid/graphics/PointF;LN2/h;)Landroid/graphics/PointF;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public r1(LN2/h;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setBubbleBarLocation(LN2/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s0()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->M:LW1/l;

    .line 2
    .line 3
    invoke-virtual {p0}, LW1/l;->s()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public s1(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->n0(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getHorizontalMargin()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public u0(LN2/h;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->A0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->l:Lcom/android/launcher3/taskbar/bubbles/g0$h;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {v0}, Lcom/android/launcher3/taskbar/bubbles/g0$h;->a()Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->q0(LN2/h;Landroid/graphics/Rect;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->C:I

    .line 28
    .line 29
    if-ge v0, v1, :cond_3

    .line 30
    .line 31
    sub-int/2addr v1, v0

    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p1, p0}, LN2/h;->e(Z)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    neg-int p0, v1

    .line 45
    return p0

    .line 46
    :cond_2
    return v1

    .line 47
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public u1(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v1(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleChildCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

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

.method public v1(ZZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->T0()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->y:Lcom/android/launcher3/anim/d;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/android/launcher3/anim/d;->k()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_2

    .line 27
    .line 28
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->Q()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eq p1, p2, :cond_2

    .line 35
    .line 36
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 37
    .line 38
    invoke-virtual {p2, p1}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setExpanded(Z)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->F(Z)V

    .line 42
    .line 43
    .line 44
    if-nez p1, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->a:Lcom/android/quickstep/SystemUiProxy;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->collapseBubbles()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->h:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/bubbles/t;->c3()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->j:Lcom/android/launcher3/taskbar/a4;

    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    const/4 p2, 0x0

    .line 61
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/a4;->O0(ZZ)V

    .line 62
    .line 63
    .line 64
    :cond_2
    :goto_0
    return-void
.end method

.method public w0(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/bubbles/m0;Lcom/android/launcher3/taskbar/bubbles/g0$h;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->O:Lcom/android/launcher3/taskbar/J3;

    .line 6
    .line 7
    iget-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->c:LX1/b;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 10
    .line 11
    iget-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->a:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->h:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 14
    .line 15
    iget-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->e:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->i:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 18
    .line 19
    iget-object v0, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->g:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->N:Lcom/android/launcher3/taskbar/bubbles/z;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->j:Lcom/android/launcher3/taskbar/a4;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->k:Lcom/android/launcher3/taskbar/N2;

    .line 30
    .line 31
    new-instance p1, LW1/l;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->L:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->O()LW1/n;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->N()LW1/A;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {p1, v0, v1, v2}, LW1/l;-><init>(Landroid/widget/FrameLayout;LW1/n;LW1/A;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->M:LW1/l;

    .line 47
    .line 48
    new-instance v3, LV1/y;

    .line 49
    .line 50
    iget-object v4, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 51
    .line 52
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 53
    .line 54
    iget-object v6, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->M:LW1/l;

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->M()Lcom/android/launcher3/taskbar/bubbles/y;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->h:Lcom/android/launcher3/taskbar/bubbles/t;

    .line 61
    .line 62
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    new-instance v8, Lcom/android/launcher3/taskbar/bubbles/N;

    .line 66
    .line 67
    invoke-direct {v8, p1}, Lcom/android/launcher3/taskbar/bubbles/N;-><init>(Lcom/android/launcher3/taskbar/bubbles/t;)V

    .line 68
    .line 69
    .line 70
    new-instance v9, Lcom/android/launcher3/taskbar/bubbles/O;

    .line 71
    .line 72
    invoke-direct {v9, p0}, Lcom/android/launcher3/taskbar/bubbles/O;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 73
    .line 74
    .line 75
    invoke-direct/range {v3 .. v9}, LV1/y;-><init>(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;LX1/b;LW1/l;Lcom/android/launcher3/taskbar/bubbles/y;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 76
    .line 77
    .line 78
    iput-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 79
    .line 80
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->l:Lcom/android/launcher3/taskbar/bubbles/g0$h;

    .line 81
    .line 82
    const/4 p1, 0x0

    .line 83
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->W0(Z)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 87
    .line 88
    new-instance p3, Lcom/android/launcher3/taskbar/bubbles/P;

    .line 89
    .line 90
    invoke-direct {p3, p0}, Lcom/android/launcher3/taskbar/bubbles/P;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {p1, p3}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->t:Lcom/android/launcher3/anim/d;

    .line 97
    .line 98
    const/high16 p3, 0x3f800000    # 1.0f

    .line 99
    .line 100
    invoke-virtual {p1, p3}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 101
    .line 102
    .line 103
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/Q;

    .line 104
    .line 105
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/Q;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 106
    .line 107
    .line 108
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->m:Landroid/view/View$OnClickListener;

    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->i:Lcom/android/launcher3/taskbar/bubbles/u0;

    .line 111
    .line 112
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/u0;->o(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p2, Lcom/android/launcher3/taskbar/bubbles/m0;->j:Lcom/android/launcher3/taskbar/bubbles/n0;

    .line 118
    .line 119
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 120
    .line 121
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/n0;->a(Landroid/view/ViewGroup;)Lcom/android/launcher3/taskbar/bubbles/x;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->o:Lcom/android/launcher3/taskbar/bubbles/x;

    .line 126
    .line 127
    invoke-static {}, LH2/c;->k()Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-nez p1, :cond_0

    .line 132
    .line 133
    const/4 p1, 0x1

    .line 134
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/g0;->D1(Z)V

    .line 135
    .line 136
    .line 137
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 138
    .line 139
    invoke-interface {p1}, LX1/b;->w()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_1

    .line 144
    .line 145
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 146
    .line 147
    new-instance p2, Lcom/android/launcher3/taskbar/bubbles/S;

    .line 148
    .line 149
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/bubbles/S;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 156
    .line 157
    new-instance p2, Lcom/android/launcher3/taskbar/bubbles/T;

    .line 158
    .line 159
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/bubbles/T;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_2

    .line 172
    .line 173
    const/4 p3, 0x0

    .line 174
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->y:Lcom/android/launcher3/anim/d;

    .line 175
    .line 176
    invoke-virtual {p1, p3}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 180
    .line 181
    new-instance p2, Lcom/android/launcher3/taskbar/bubbles/g0$b;

    .line 182
    .line 183
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/bubbles/g0$b;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->setController(Lcom/android/launcher3/taskbar/bubbles/BubbleBarView$h;)V

    .line 187
    .line 188
    .line 189
    new-instance p1, Lcom/android/launcher3/taskbar/bubbles/g0$c;

    .line 190
    .line 191
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/g0$c;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 192
    .line 193
    .line 194
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->n:Lcom/android/launcher3/taskbar/bubbles/BubbleView$a;

    .line 195
    .line 196
    return-void
.end method

.method public w1(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->I0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 10
    .line 11
    invoke-virtual {p0}, LV1/y;->f0()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 18
    .line 19
    invoke-interface {p0}, LX1/b;->J()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->g:LX1/b;

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-interface {p0, p1}, LX1/b;->g(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public x1(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->E:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->E:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/taskbar/bubbles/V;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/V;-><init>(Lcom/android/launcher3/taskbar/bubbles/g0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->F(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->O1()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->b:Lcom/android/launcher3/taskbar/I1;

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->d0(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public y0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->K:LV1/y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LV1/y;->k0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public y1(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->F:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->F:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->O1()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public z0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;->getBubbleBarLocation()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->c:Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, LN2/h;->e(Z)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public z1(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->D:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/g0;->D:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->O1()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
