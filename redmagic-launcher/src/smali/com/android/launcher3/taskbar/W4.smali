.class public Lcom/android/launcher3/taskbar/W4;
.super Ljava/lang/Object;
.source "TaskbarViewController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;
.implements Lcom/android/launcher3/taskbar/bubbles/t$a;


# static fields
.field private static final R:Ljava/lang/Runnable;

.field public static S:J


# instance fields
.field private A:I

.field private final B:I

.field private final C:Lcom/android/launcher3/taskbar/j3;

.field private D:Lcom/android/launcher3/taskbar/R1;

.field private final E:Landroid/view/View$OnLayoutChangeListener;

.field private F:Lcom/android/launcher3/anim/q;

.field private G:Ljava/lang/Runnable;

.field private H:Z

.field private I:Z

.field private J:Z

.field private final K:Lcom/android/launcher3/X3$b;

.field private final L:Z

.field private final M:Lcom/android/launcher3/h0;

.field private final N:Lcom/android/launcher3/h0;

.field private final O:I

.field private final P:I

.field private final Q:F

.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private h:Lcom/android/launcher3/taskbar/s2;

.field private final i:Lcom/android/launcher3/taskbar/TaskbarView;

.field private final j:Lcom/android/launcher3/util/B1;

.field private final k:Lcom/android/launcher3/anim/d;

.field public final l:Lcom/android/launcher3/anim/d;

.field private final m:Lcom/android/launcher3/anim/d;

.field private final n:Lcom/android/launcher3/anim/d;

.field private final o:Lcom/android/launcher3/anim/d;

.field private final p:Lcom/android/launcher3/anim/d;

.field private final q:Lcom/android/launcher3/anim/d;

.field private r:Landroid/animation/Animator;

.field private s:LN2/h;

.field private t:Lcom/android/launcher3/taskbar/bubbles/m0;

.field private u:Landroid/animation/ObjectAnimator;

.field private final v:Lcom/android/launcher3/anim/d;

.field private w:Lcom/android/launcher3/anim/d;

.field private x:Lcom/android/launcher3/anim/d;

.field private y:F

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/U4;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/U4;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/taskbar/W4;->R:Ljava/lang/Runnable;

    .line 7
    .line 8
    const-wide/16 v0, 0xfa

    .line 9
    .line 10
    sput-wide v0, Lcom/android/launcher3/taskbar/W4;->S:J

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/taskbar/G4;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/G4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->k:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 17
    .line 18
    new-instance v1, Lcom/android/launcher3/taskbar/N4;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/N4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->l:Lcom/android/launcher3/anim/d;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 29
    .line 30
    new-instance v1, Lcom/android/launcher3/taskbar/N4;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/N4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->m:Lcom/android/launcher3/anim/d;

    .line 39
    .line 40
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 41
    .line 42
    new-instance v1, Lcom/android/launcher3/taskbar/O4;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/O4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->n:Lcom/android/launcher3/anim/d;

    .line 51
    .line 52
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 53
    .line 54
    new-instance v1, Lcom/android/launcher3/taskbar/P4;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/P4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->o:Lcom/android/launcher3/anim/d;

    .line 63
    .line 64
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 65
    .line 66
    new-instance v1, Lcom/android/launcher3/taskbar/Q4;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/Q4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->p:Lcom/android/launcher3/anim/d;

    .line 75
    .line 76
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 77
    .line 78
    new-instance v1, Lcom/android/launcher3/taskbar/R4;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/R4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->q:Lcom/android/launcher3/anim/d;

    .line 87
    .line 88
    const/4 v0, 0x0

    .line 89
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 90
    .line 91
    new-instance v1, Lcom/android/launcher3/anim/d;

    .line 92
    .line 93
    new-instance v2, Lcom/android/launcher3/taskbar/N4;

    .line 94
    .line 95
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/N4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 96
    .line 97
    .line 98
    invoke-direct {v1, v2}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    iput-object v1, p0, Lcom/android/launcher3/taskbar/W4;->v:Lcom/android/launcher3/anim/d;

    .line 102
    .line 103
    new-instance v1, Lcom/android/launcher3/taskbar/S4;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/S4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 106
    .line 107
    .line 108
    iput-object v1, p0, Lcom/android/launcher3/taskbar/W4;->E:Landroid/view/View$OnLayoutChangeListener;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->F:Lcom/android/launcher3/anim/q;

    .line 111
    .line 112
    sget-object v0, Lcom/android/launcher3/taskbar/W4;->R:Ljava/lang/Runnable;

    .line 113
    .line 114
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->G:Ljava/lang/Runnable;

    .line 115
    .line 116
    new-instance v0, Lcom/android/launcher3/taskbar/T4;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/T4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 119
    .line 120
    .line 121
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->K:Lcom/android/launcher3/X3$b;

    .line 122
    .line 123
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->I0()Lcom/android/launcher3/h0;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->M:Lcom/android/launcher3/h0;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->A0()Lcom/android/launcher3/h0;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iput-object v1, p0, Lcom/android/launcher3/taskbar/W4;->N:Lcom/android/launcher3/h0;

    .line 136
    .line 137
    iget v0, v0, Lcom/android/launcher3/h0;->u3:I

    .line 138
    .line 139
    iput v0, p0, Lcom/android/launcher3/taskbar/W4;->O:I

    .line 140
    .line 141
    iget v0, v1, Lcom/android/launcher3/h0;->u3:I

    .line 142
    .line 143
    iput v0, p0, Lcom/android/launcher3/taskbar/W4;->P:I

    .line 144
    .line 145
    iput-object p2, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 146
    .line 147
    new-instance v0, Lcom/android/launcher3/util/B1;

    .line 148
    .line 149
    const/16 v1, 0x9

    .line 150
    .line 151
    invoke-direct {v0, p2, v1}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 152
    .line 153
    .line 154
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->j:Lcom/android/launcher3/util/B1;

    .line 155
    .line 156
    const/4 v1, 0x1

    .line 157
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 158
    .line 159
    .line 160
    invoke-static {p1}, Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;->b(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarModelCallbacksFactory;->a(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/TaskbarView;)Lcom/android/launcher3/taskbar/j3;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget v0, v0, Lcom/android/launcher3/h0;->t3:I

    .line 175
    .line 176
    iput v0, p0, Lcom/android/launcher3/taskbar/W4;->A:I

    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    const v1, 0x7f070bb3

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    iput v0, p0, Lcom/android/launcher3/taskbar/W4;->B:I

    .line 190
    .line 191
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 196
    .line 197
    .line 198
    move-result p2

    .line 199
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/W4;->L:Z

    .line 200
    .line 201
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    const p2, 0x7f070c21

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    int-to-float p1, p1

    .line 213
    iput p1, p0, Lcom/android/launcher3/taskbar/W4;->Q:F

    .line 214
    .line 215
    return-void
.end method

.method private A0(Lcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->P(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/BubbleTextView$f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/BubbleTextView;->V0(Lcom/android/launcher3/BubbleTextView$f;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private B()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->v0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private B0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->k:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->u:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->u:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->u:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method private D()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->r:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private E0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->n:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-boolean v2, v2, Lcom/android/launcher3/taskbar/J3;->u:Z

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget v2, p0, Lcom/android/launcher3/taskbar/W4;->P:I

    .line 26
    .line 27
    int-to-float v2, v2

    .line 28
    iget p0, p0, Lcom/android/launcher3/taskbar/W4;->O:I

    .line 29
    .line 30
    int-to-float p0, p0

    .line 31
    div-float/2addr v2, p0

    .line 32
    invoke-static {v0, v3, v2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget v2, p0, Lcom/android/launcher3/taskbar/W4;->O:I

    .line 38
    .line 39
    int-to-float v2, v2

    .line 40
    iget p0, p0, Lcom/android/launcher3/taskbar/W4;->P:I

    .line 41
    .line 42
    int-to-float p0, p0

    .line 43
    div-float/2addr v2, p0

    .line 44
    invoke-static {v0, v2, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    :goto_0
    const/4 v0, 0x0

    .line 49
    :goto_1
    array-length v2, v1

    .line 50
    if-ge v0, v2, :cond_1

    .line 51
    .line 52
    aget-object v2, v1, v0

    .line 53
    .line 54
    invoke-virtual {v2, p0}, Landroid/view/View;->setScaleX(F)V

    .line 55
    .line 56
    .line 57
    aget-object v2, v1, v0

    .line 58
    .line 59
    invoke-virtual {v2, p0}, Landroid/view/View;->setScaleY(F)V

    .line 60
    .line 61
    .line 62
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    return-void
.end method

.method private F(Lcom/android/launcher3/h0;)Lcom/android/launcher3/anim/q;
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v8, p1

    .line 4
    .line 5
    new-instance v1, Lcom/android/launcher3/anim/V;

    .line 6
    .line 7
    const-wide/16 v2, 0x64

    .line 8
    .line 9
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 10
    .line 11
    .line 12
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0

    .line 25
    :cond_0
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->G:Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 28
    .line 29
    .line 30
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object v9

    .line 36
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 37
    .line 38
    invoke-virtual {v8, v2}, Lcom/android/launcher3/h0;->s0(Landroid/content/Context;)Landroid/graphics/Rect;

    .line 39
    .line 40
    .line 41
    move-result-object v10

    .line 42
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget v3, v8, Lcom/android/launcher3/h0;->B1:I

    .line 49
    .line 50
    int-to-float v3, v3

    .line 51
    iget v4, v9, Lcom/android/launcher3/h0;->u3:I

    .line 52
    .line 53
    int-to-float v4, v4

    .line 54
    div-float v11, v3, v4

    .line 55
    .line 56
    iget v12, v8, Lcom/android/launcher3/h0;->s2:I

    .line 57
    .line 58
    iget v3, v8, Lcom/android/launcher3/h0;->V0:I

    .line 59
    .line 60
    iget v4, v10, Landroid/graphics/Rect;->left:I

    .line 61
    .line 62
    sub-int/2addr v3, v4

    .line 63
    iget v4, v10, Landroid/graphics/Rect;->right:I

    .line 64
    .line 65
    sub-int/2addr v3, v4

    .line 66
    iget v4, v8, Lcom/android/launcher3/h0;->a2:I

    .line 67
    .line 68
    invoke-static {v3, v12, v4}, Lcom/android/launcher3/h0;->P(III)I

    .line 69
    .line 70
    .line 71
    move-result v13

    .line 72
    iget-object v3, v0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 75
    .line 76
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/o4;->u()Z

    .line 77
    .line 78
    .line 79
    move-result v14

    .line 80
    iget-object v3, v0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 83
    .line 84
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/a4;->a0()Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    iget-boolean v4, v0, Lcom/android/launcher3/taskbar/W4;->I:Z

    .line 89
    .line 90
    if-eqz v4, :cond_1

    .line 91
    .line 92
    sget-object v4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 93
    .line 94
    :goto_0
    move-object v6, v4

    .line 95
    goto :goto_1

    .line 96
    :cond_1
    sget-object v4, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :goto_1
    if-eqz v3, :cond_2

    .line 100
    .line 101
    invoke-virtual {v9}, Lcom/android/launcher3/h0;->J0()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    goto :goto_2

    .line 106
    :cond_2
    invoke-virtual {v8}, Lcom/android/launcher3/h0;->J0()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    :goto_2
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->l:Lcom/android/launcher3/anim/d;

    .line 111
    .line 112
    sget-object v5, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 113
    .line 114
    neg-int v7, v3

    .line 115
    int-to-float v7, v7

    .line 116
    invoke-virtual {v1, v4, v5, v7, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->w:Lcom/android/launcher3/anim/d;

    .line 120
    .line 121
    invoke-virtual {v1, v4, v5, v7, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 122
    .line 123
    .line 124
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->x:Lcom/android/launcher3/anim/d;

    .line 125
    .line 126
    int-to-float v7, v3

    .line 127
    invoke-virtual {v1, v4, v5, v7, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 131
    .line 132
    const/4 v15, 0x0

    .line 133
    if-eqz v4, :cond_3

    .line 134
    .line 135
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->s:LN2/h;

    .line 136
    .line 137
    if-eqz v4, :cond_3

    .line 138
    .line 139
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 140
    .line 141
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-eqz v4, :cond_3

    .line 146
    .line 147
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 148
    .line 149
    iget-object v4, v4, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 150
    .line 151
    iget-object v7, v0, Lcom/android/launcher3/taskbar/W4;->s:LN2/h;

    .line 152
    .line 153
    invoke-virtual {v4, v7}, Lcom/android/launcher3/taskbar/bubbles/g0;->u0(LN2/h;)I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-eqz v4, :cond_3

    .line 158
    .line 159
    iget-object v7, v0, Lcom/android/launcher3/taskbar/W4;->q:Lcom/android/launcher3/anim/d;

    .line 160
    .line 161
    int-to-float v4, v4

    .line 162
    invoke-virtual {v7, v4}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 163
    .line 164
    .line 165
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->q:Lcom/android/launcher3/anim/d;

    .line 166
    .line 167
    invoke-virtual {v1, v4, v5, v15, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 168
    .line 169
    .line 170
    :cond_3
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 171
    .line 172
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->u0()I

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    iget v5, v9, Lcom/android/launcher3/h0;->r3:I

    .line 177
    .line 178
    add-int/2addr v5, v3

    .line 179
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    new-instance v5, Lcom/android/launcher3/taskbar/I4;

    .line 184
    .line 185
    invoke-direct {v5, v0, v3, v4}, Lcom/android/launcher3/taskbar/I4;-><init>(Lcom/android/launcher3/taskbar/W4;II)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, v5}, Lcom/android/launcher3/anim/f;->i(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 189
    .line 190
    .line 191
    if-eqz v2, :cond_4

    .line 192
    .line 193
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->M:Lcom/android/launcher3/h0;

    .line 194
    .line 195
    iget v2, v2, Lcom/android/launcher3/h0;->t3:I

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_4
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->N:Lcom/android/launcher3/h0;

    .line 199
    .line 200
    iget v2, v2, Lcom/android/launcher3/h0;->t3:I

    .line 201
    .line 202
    :goto_3
    iput v2, v0, Lcom/android/launcher3/taskbar/W4;->A:I

    .line 203
    .line 204
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->s:LN2/h;

    .line 205
    .line 206
    const/16 v16, 0x0

    .line 207
    .line 208
    if-eqz v2, :cond_5

    .line 209
    .line 210
    iget-object v3, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 211
    .line 212
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    invoke-virtual {v2, v3}, LN2/h;->e(Z)Z

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    iget-object v3, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 221
    .line 222
    invoke-virtual {v9, v3, v2}, Lcom/android/launcher3/h0;->u0(Landroid/content/Context;Z)I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    move v7, v2

    .line 227
    goto :goto_4

    .line 228
    :cond_5
    move/from16 v7, v16

    .line 229
    .line 230
    :goto_4
    const/16 v17, -0x1

    .line 231
    .line 232
    move/from16 v2, v16

    .line 233
    .line 234
    move/from16 v18, v17

    .line 235
    .line 236
    :goto_5
    iget-object v3, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 237
    .line 238
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    if-ge v2, v3, :cond_21

    .line 243
    .line 244
    iget-object v3, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 245
    .line 246
    invoke-virtual {v3, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 251
    .line 252
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    if-ne v3, v4, :cond_6

    .line 257
    .line 258
    const/4 v4, 0x1

    .line 259
    goto :goto_6

    .line 260
    :cond_6
    move/from16 v4, v16

    .line 261
    .line 262
    :goto_6
    iget-object v5, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 263
    .line 264
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarDividerViewContainer()LY1/g;

    .line 265
    .line 266
    .line 267
    move-result-object v5

    .line 268
    if-ne v3, v5, :cond_7

    .line 269
    .line 270
    const/4 v5, 0x1

    .line 271
    goto :goto_7

    .line 272
    :cond_7
    move/from16 v5, v16

    .line 273
    .line 274
    :goto_7
    iget-object v15, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 275
    .line 276
    invoke-virtual {v15}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 277
    .line 278
    .line 279
    move-result-object v15

    .line 280
    if-ne v3, v15, :cond_8

    .line 281
    .line 282
    const/16 v19, 0x1

    .line 283
    .line 284
    goto :goto_8

    .line 285
    :cond_8
    move/from16 v19, v16

    .line 286
    .line 287
    :goto_8
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v15

    .line 291
    instance-of v15, v15, Lcom/android/quickstep/util/GroupTask;

    .line 292
    .line 293
    move/from16 v21, v2

    .line 294
    .line 295
    iget-boolean v2, v0, Lcom/android/launcher3/taskbar/W4;->I:Z

    .line 296
    .line 297
    move/from16 v22, v5

    .line 298
    .line 299
    const/high16 v5, 0x3f800000    # 1.0f

    .line 300
    .line 301
    if-nez v2, :cond_a

    .line 302
    .line 303
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 304
    .line 305
    move/from16 v23, v4

    .line 306
    .line 307
    const v4, 0x3f4ccccd    # 0.8f

    .line 308
    .line 309
    .line 310
    invoke-static {v2, v4, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    const/4 v4, 0x0

    .line 315
    invoke-virtual {v1, v3, v4, v2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 316
    .line 317
    .line 318
    :cond_9
    :goto_9
    const v5, 0x3f570a3d    # 0.84f

    .line 319
    .line 320
    .line 321
    goto/16 :goto_d

    .line 322
    .line 323
    :cond_a
    move/from16 v23, v4

    .line 324
    .line 325
    if-eqz v23, :cond_b

    .line 326
    .line 327
    invoke-static {}, Lf1/a;->a()Z

    .line 328
    .line 329
    .line 330
    move-result v2

    .line 331
    if-eqz v2, :cond_e

    .line 332
    .line 333
    :cond_b
    if-eqz v22, :cond_c

    .line 334
    .line 335
    invoke-static {}, Lf1/a;->e()Z

    .line 336
    .line 337
    .line 338
    move-result v2

    .line 339
    if-nez v2, :cond_e

    .line 340
    .line 341
    :cond_c
    if-eqz v15, :cond_d

    .line 342
    .line 343
    goto :goto_a

    .line 344
    :cond_d
    if-eqz v19, :cond_9

    .line 345
    .line 346
    :cond_e
    :goto_a
    if-nez v14, :cond_f

    .line 347
    .line 348
    iget-boolean v2, v0, Lcom/android/launcher3/taskbar/W4;->I:Z

    .line 349
    .line 350
    if-eqz v2, :cond_f

    .line 351
    .line 352
    iget-boolean v2, v0, Lcom/android/launcher3/taskbar/W4;->J:Z

    .line 353
    .line 354
    if-eqz v2, :cond_f

    .line 355
    .line 356
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 357
    .line 358
    const/4 v4, 0x0

    .line 359
    invoke-static {v2, v4, v4}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 360
    .line 361
    .line 362
    move-result-object v2

    .line 363
    invoke-virtual {v1, v3, v4, v2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 364
    .line 365
    .line 366
    goto :goto_9

    .line 367
    :cond_f
    const/4 v4, 0x0

    .line 368
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 369
    .line 370
    .line 371
    move-result v2

    .line 372
    if-eqz v2, :cond_11

    .line 373
    .line 374
    if-eqz v14, :cond_10

    .line 375
    .line 376
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 377
    .line 378
    const v5, 0x3d8f5c29    # 0.07f

    .line 379
    .line 380
    .line 381
    invoke-static {v2, v4, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 382
    .line 383
    .line 384
    move-result-object v2

    .line 385
    move v5, v4

    .line 386
    const/high16 v4, 0x3f800000    # 1.0f

    .line 387
    .line 388
    goto :goto_b

    .line 389
    :cond_10
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 390
    .line 391
    const v5, 0x3f6e147b    # 0.93f

    .line 392
    .line 393
    .line 394
    const/high16 v4, 0x3f800000    # 1.0f

    .line 395
    .line 396
    invoke-static {v2, v5, v4}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 397
    .line 398
    .line 399
    move-result-object v2

    .line 400
    const/4 v5, 0x0

    .line 401
    :goto_b
    invoke-virtual {v1, v3, v5, v2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 402
    .line 403
    .line 404
    goto :goto_9

    .line 405
    :cond_11
    move/from16 v29, v5

    .line 406
    .line 407
    move v5, v4

    .line 408
    move/from16 v4, v29

    .line 409
    .line 410
    if-eqz v14, :cond_12

    .line 411
    .line 412
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 413
    .line 414
    const v4, 0x3e2e147b    # 0.17f

    .line 415
    .line 416
    .line 417
    invoke-static {v2, v5, v4}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    move v4, v5

    .line 422
    const v5, 0x3f570a3d    # 0.84f

    .line 423
    .line 424
    .line 425
    goto :goto_c

    .line 426
    :cond_12
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 427
    .line 428
    const v4, 0x3f3851ec    # 0.72f

    .line 429
    .line 430
    .line 431
    const v5, 0x3f570a3d    # 0.84f

    .line 432
    .line 433
    .line 434
    invoke-static {v2, v4, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 435
    .line 436
    .line 437
    move-result-object v2

    .line 438
    const/4 v4, 0x0

    .line 439
    :goto_c
    invoke-virtual {v1, v3, v4, v2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 440
    .line 441
    .line 442
    :goto_d
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 443
    .line 444
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/TaskbarView;->getQsb()Landroid/view/View;

    .line 445
    .line 446
    .line 447
    move-result-object v2

    .line 448
    const/4 v4, 0x5

    .line 449
    const/high16 v24, 0x40000000    # 2.0f

    .line 450
    .line 451
    if-ne v3, v2, :cond_1b

    .line 452
    .line 453
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 454
    .line 455
    .line 456
    move-result-object v2

    .line 457
    invoke-static {v2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 458
    .line 459
    .line 460
    move-result v15

    .line 461
    if-eqz v15, :cond_13

    .line 462
    .line 463
    iget v2, v8, Lcom/android/launcher3/h0;->T0:I

    .line 464
    .line 465
    iget v5, v10, Landroid/graphics/Rect;->right:I

    .line 466
    .line 467
    sub-int/2addr v2, v5

    .line 468
    add-int/2addr v2, v12

    .line 469
    int-to-float v2, v2

    .line 470
    iget v5, v8, Lcom/android/launcher3/h0;->o2:I

    .line 471
    .line 472
    int-to-float v5, v5

    .line 473
    div-float v5, v5, v24

    .line 474
    .line 475
    add-float/2addr v2, v5

    .line 476
    goto :goto_e

    .line 477
    :cond_13
    iget v2, v10, Landroid/graphics/Rect;->left:I

    .line 478
    .line 479
    sub-int/2addr v2, v12

    .line 480
    int-to-float v2, v2

    .line 481
    iget v5, v8, Lcom/android/launcher3/h0;->o2:I

    .line 482
    .line 483
    int-to-float v5, v5

    .line 484
    div-float v5, v5, v24

    .line 485
    .line 486
    sub-float/2addr v2, v5

    .line 487
    :goto_e
    iget-boolean v5, v9, Lcom/android/launcher3/h0;->M0:Z

    .line 488
    .line 489
    if-eqz v5, :cond_14

    .line 490
    .line 491
    int-to-float v5, v7

    .line 492
    add-float/2addr v2, v5

    .line 493
    :cond_14
    move/from16 v22, v2

    .line 494
    .line 495
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 496
    .line 497
    .line 498
    move-result v2

    .line 499
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 500
    .line 501
    .line 502
    move-result v5

    .line 503
    add-int/2addr v2, v5

    .line 504
    int-to-float v2, v2

    .line 505
    div-float v2, v2, v24

    .line 506
    .line 507
    instance-of v5, v3, Lcom/android/launcher3/G5;

    .line 508
    .line 509
    if-eqz v5, :cond_15

    .line 510
    .line 511
    move-object/from16 v23, v3

    .line 512
    .line 513
    check-cast v23, Lcom/android/launcher3/G5;

    .line 514
    .line 515
    move-object/from16 v26, v1

    .line 516
    .line 517
    invoke-interface/range {v23 .. v23}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    invoke-virtual {v1, v4}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 522
    .line 523
    .line 524
    move-result-object v1

    .line 525
    invoke-virtual {v1}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 526
    .line 527
    .line 528
    move-result v1

    .line 529
    add-float/2addr v2, v1

    .line 530
    :goto_f
    move/from16 v23, v2

    .line 531
    .line 532
    goto :goto_10

    .line 533
    :cond_15
    move-object/from16 v26, v1

    .line 534
    .line 535
    goto :goto_f

    .line 536
    :goto_10
    iget v1, v8, Lcom/android/launcher3/h0;->o2:I

    .line 537
    .line 538
    iget v2, v9, Lcom/android/launcher3/h0;->u3:I

    .line 539
    .line 540
    sub-int/2addr v1, v2

    .line 541
    int-to-float v1, v1

    .line 542
    div-float v1, v1, v24

    .line 543
    .line 544
    int-to-float v2, v2

    .line 545
    iget v4, v8, Lcom/android/launcher3/h0;->q2:I

    .line 546
    .line 547
    int-to-float v4, v4

    .line 548
    div-float v4, v2, v4

    .line 549
    .line 550
    move-object v2, v3

    .line 551
    sget-object v3, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 552
    .line 553
    move/from16 v24, v5

    .line 554
    .line 555
    const/high16 v5, 0x3f800000    # 1.0f

    .line 556
    .line 557
    move/from16 v27, v7

    .line 558
    .line 559
    move/from16 v19, v12

    .line 560
    .line 561
    move/from16 v25, v24

    .line 562
    .line 563
    const/4 v12, 0x3

    .line 564
    move v7, v1

    .line 565
    move-object/from16 v1, v26

    .line 566
    .line 567
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 568
    .line 569
    .line 570
    move-object/from16 v26, v2

    .line 571
    .line 572
    if-eqz v15, :cond_16

    .line 573
    .line 574
    neg-float v2, v7

    .line 575
    move v4, v2

    .line 576
    goto :goto_11

    .line 577
    :cond_16
    move v4, v7

    .line 578
    :goto_11
    sub-float v5, v22, v23

    .line 579
    .line 580
    if-eqz v25, :cond_17

    .line 581
    .line 582
    move-object/from16 v3, v26

    .line 583
    .line 584
    check-cast v3, Lcom/android/launcher3/G5;

    .line 585
    .line 586
    invoke-interface {v3}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 587
    .line 588
    .line 589
    move-result-object v7

    .line 590
    invoke-virtual {v7, v12}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 591
    .line 592
    .line 593
    move-result-object v2

    .line 594
    sget-object v3, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 595
    .line 596
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 597
    .line 598
    .line 599
    invoke-virtual {v7, v12}, Lcom/android/launcher3/util/z1;->b(I)Lcom/android/launcher3/util/v1$c;

    .line 600
    .line 601
    .line 602
    move-result-object v2

    .line 603
    iget v4, v0, Lcom/android/launcher3/taskbar/W4;->A:I

    .line 604
    .line 605
    int-to-float v4, v4

    .line 606
    invoke-virtual {v1, v2, v3, v4, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 607
    .line 608
    .line 609
    move-object v7, v6

    .line 610
    move-object/from16 v2, v26

    .line 611
    .line 612
    goto :goto_12

    .line 613
    :cond_17
    sget-object v3, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 614
    .line 615
    move-object/from16 v2, v26

    .line 616
    .line 617
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 618
    .line 619
    .line 620
    move-object v7, v6

    .line 621
    sget-object v3, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 622
    .line 623
    iget v4, v0, Lcom/android/launcher3/taskbar/W4;->A:I

    .line 624
    .line 625
    int-to-float v4, v4

    .line 626
    invoke-virtual {v1, v2, v3, v4, v7}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 627
    .line 628
    .line 629
    :goto_12
    iget-boolean v3, v0, Lcom/android/launcher3/taskbar/W4;->I:Z

    .line 630
    .line 631
    if-eqz v3, :cond_1a

    .line 632
    .line 633
    sget-object v3, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 634
    .line 635
    if-eqz v14, :cond_18

    .line 636
    .line 637
    sget-object v4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 638
    .line 639
    const v5, 0x3eb33333    # 0.35f

    .line 640
    .line 641
    .line 642
    const/4 v12, 0x0

    .line 643
    invoke-static {v4, v12, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 644
    .line 645
    .line 646
    move-result-object v4

    .line 647
    :goto_13
    move-object v6, v4

    .line 648
    goto :goto_14

    .line 649
    :cond_18
    const/4 v12, 0x0

    .line 650
    iget-object v4, v0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 651
    .line 652
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 653
    .line 654
    .line 655
    move-result-object v4

    .line 656
    iget-boolean v4, v4, Lcom/android/launcher3/h0;->M0:Z

    .line 657
    .line 658
    if-eqz v4, :cond_19

    .line 659
    .line 660
    sget-object v4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 661
    .line 662
    const/high16 v5, 0x3f800000    # 1.0f

    .line 663
    .line 664
    invoke-static {v4, v12, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 665
    .line 666
    .line 667
    move-result-object v4

    .line 668
    goto :goto_13

    .line 669
    :cond_19
    const/high16 v5, 0x3f800000    # 1.0f

    .line 670
    .line 671
    sget-object v4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 672
    .line 673
    const v6, 0x3f570a3d    # 0.84f

    .line 674
    .line 675
    .line 676
    invoke-static {v4, v6, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 677
    .line 678
    .line 679
    move-result-object v4

    .line 680
    goto :goto_13

    .line 681
    :goto_14
    const/4 v4, 0x0

    .line 682
    const/high16 v5, 0x3f800000    # 1.0f

    .line 683
    .line 684
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 685
    .line 686
    .line 687
    goto :goto_15

    .line 688
    :cond_1a
    const/4 v12, 0x0

    .line 689
    :goto_15
    new-instance v3, Lcom/android/launcher3/taskbar/J4;

    .line 690
    .line 691
    invoke-direct {v3, v2}, Lcom/android/launcher3/taskbar/J4;-><init>(Landroid/view/View;)V

    .line 692
    .line 693
    .line 694
    invoke-virtual {v1, v3}, Lcom/android/launcher3/anim/f;->i(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 695
    .line 696
    .line 697
    move-object v15, v1

    .line 698
    move-object/from16 v22, v9

    .line 699
    .line 700
    move/from16 v20, v12

    .line 701
    .line 702
    move/from16 v12, v27

    .line 703
    .line 704
    goto/16 :goto_1a

    .line 705
    .line 706
    :cond_1b
    move-object v2, v3

    .line 707
    move/from16 v27, v7

    .line 708
    .line 709
    move/from16 v19, v12

    .line 710
    .line 711
    const/4 v12, 0x3

    .line 712
    const/16 v20, 0x0

    .line 713
    .line 714
    move-object v7, v6

    .line 715
    if-eqz v15, :cond_1d

    .line 716
    .line 717
    if-gez v18, :cond_1c

    .line 718
    .line 719
    move/from16 v18, v21

    .line 720
    .line 721
    :cond_1c
    sub-int v3, v21, v18

    .line 722
    .line 723
    :goto_16
    move-object/from16 v26, v1

    .line 724
    .line 725
    goto :goto_17

    .line 726
    :cond_1d
    move/from16 v3, v17

    .line 727
    .line 728
    goto :goto_16

    .line 729
    :goto_17
    iget v1, v9, Lcom/android/launcher3/h0;->a2:I

    .line 730
    .line 731
    move-object v6, v7

    .line 732
    move v7, v3

    .line 733
    iget-boolean v3, v0, Lcom/android/launcher3/taskbar/W4;->L:Z

    .line 734
    .line 735
    iget-object v5, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 736
    .line 737
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarView;->p()Z

    .line 738
    .line 739
    .line 740
    move-result v5

    .line 741
    move-object/from16 v28, v6

    .line 742
    .line 743
    move-object/from16 v15, v26

    .line 744
    .line 745
    move/from16 v12, v27

    .line 746
    .line 747
    move v6, v5

    .line 748
    move/from16 v5, v22

    .line 749
    .line 750
    move-object/from16 v22, v9

    .line 751
    .line 752
    move v9, v4

    .line 753
    move/from16 v4, v23

    .line 754
    .line 755
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/taskbar/W4;->O(ILandroid/view/View;ZZZZI)F

    .line 756
    .line 757
    .line 758
    move-result v1

    .line 759
    const/high16 v3, -0x3d380000    # -100.0f

    .line 760
    .line 761
    cmpl-float v3, v1, v3

    .line 762
    .line 763
    if-nez v3, :cond_1e

    .line 764
    .line 765
    move-object/from16 v7, v28

    .line 766
    .line 767
    goto/16 :goto_1a

    .line 768
    .line 769
    :cond_1e
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 770
    .line 771
    .line 772
    move-result-object v3

    .line 773
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/W4;->B()Z

    .line 774
    .line 775
    .line 776
    move-result v4

    .line 777
    invoke-virtual {v8, v3, v4}, Lcom/android/launcher3/h0;->X0(Landroid/content/Context;Z)Z

    .line 778
    .line 779
    .line 780
    move-result v3

    .line 781
    if-eqz v3, :cond_1f

    .line 782
    .line 783
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 784
    .line 785
    .line 786
    move-result-object v3

    .line 787
    invoke-virtual {v8, v3}, Lcom/android/launcher3/h0;->p0(Landroid/content/Context;)F

    .line 788
    .line 789
    .line 790
    move-result v3

    .line 791
    iget v4, v10, Landroid/graphics/Rect;->left:I

    .line 792
    .line 793
    add-int/2addr v4, v13

    .line 794
    int-to-float v4, v4

    .line 795
    int-to-float v5, v13

    .line 796
    add-float/2addr v3, v5

    .line 797
    mul-float/2addr v3, v1

    .line 798
    add-float/2addr v4, v3

    .line 799
    div-float v5, v5, v24

    .line 800
    .line 801
    add-float/2addr v4, v5

    .line 802
    goto :goto_18

    .line 803
    :cond_1f
    iget v3, v10, Landroid/graphics/Rect;->left:I

    .line 804
    .line 805
    int-to-float v3, v3

    .line 806
    add-int v4, v13, v19

    .line 807
    .line 808
    int-to-float v4, v4

    .line 809
    mul-float/2addr v4, v1

    .line 810
    add-float/2addr v3, v4

    .line 811
    int-to-float v1, v13

    .line 812
    div-float v1, v1, v24

    .line 813
    .line 814
    add-float v4, v3, v1

    .line 815
    .line 816
    :goto_18
    int-to-float v1, v12

    .line 817
    add-float/2addr v4, v1

    .line 818
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 819
    .line 820
    .line 821
    move-result v1

    .line 822
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 823
    .line 824
    .line 825
    move-result v3

    .line 826
    add-int/2addr v1, v3

    .line 827
    int-to-float v1, v1

    .line 828
    div-float v1, v1, v24

    .line 829
    .line 830
    move-object v3, v2

    .line 831
    check-cast v3, Lcom/android/launcher3/G5;

    .line 832
    .line 833
    invoke-interface {v3}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 834
    .line 835
    .line 836
    move-result-object v5

    .line 837
    invoke-virtual {v5, v9}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 838
    .line 839
    .line 840
    move-result-object v5

    .line 841
    invoke-virtual {v5}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 842
    .line 843
    .line 844
    move-result v5

    .line 845
    add-float/2addr v1, v5

    .line 846
    sub-float/2addr v4, v1

    .line 847
    instance-of v1, v2, Lcom/android/launcher3/G5;

    .line 848
    .line 849
    if-eqz v1, :cond_20

    .line 850
    .line 851
    invoke-interface {v3}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 852
    .line 853
    .line 854
    move-result-object v1

    .line 855
    const/4 v3, 0x3

    .line 856
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 857
    .line 858
    .line 859
    move-result-object v5

    .line 860
    sget-object v6, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 861
    .line 862
    move-object/from16 v7, v28

    .line 863
    .line 864
    invoke-virtual {v15, v5, v6, v4, v7}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 865
    .line 866
    .line 867
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/z1;->b(I)Lcom/android/launcher3/util/v1$c;

    .line 868
    .line 869
    .line 870
    move-result-object v1

    .line 871
    iget v3, v0, Lcom/android/launcher3/taskbar/W4;->A:I

    .line 872
    .line 873
    int-to-float v3, v3

    .line 874
    invoke-virtual {v15, v1, v6, v3, v7}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 875
    .line 876
    .line 877
    goto :goto_19

    .line 878
    :cond_20
    move-object/from16 v7, v28

    .line 879
    .line 880
    sget-object v1, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 881
    .line 882
    invoke-virtual {v15, v2, v1, v4, v7}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 883
    .line 884
    .line 885
    sget-object v1, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 886
    .line 887
    iget v3, v0, Lcom/android/launcher3/taskbar/W4;->A:I

    .line 888
    .line 889
    int-to-float v3, v3

    .line 890
    invoke-virtual {v15, v2, v1, v3, v7}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 891
    .line 892
    .line 893
    :goto_19
    sget-object v1, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 894
    .line 895
    invoke-virtual {v15, v2, v1, v11, v7}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 896
    .line 897
    .line 898
    :goto_1a
    add-int/lit8 v2, v21, 0x1

    .line 899
    .line 900
    move-object v6, v7

    .line 901
    move v7, v12

    .line 902
    move-object v1, v15

    .line 903
    move/from16 v12, v19

    .line 904
    .line 905
    move/from16 v15, v20

    .line 906
    .line 907
    move-object/from16 v9, v22

    .line 908
    .line 909
    goto/16 :goto_5

    .line 910
    .line 911
    :cond_21
    move-object v15, v1

    .line 912
    invoke-virtual {v15}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 913
    .line 914
    .line 915
    move-result-object v1

    .line 916
    new-instance v2, Lcom/android/launcher3/taskbar/K4;

    .line 917
    .line 918
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/K4;-><init>(Lcom/android/launcher3/anim/q;)V

    .line 919
    .line 920
    .line 921
    iput-object v2, v0, Lcom/android/launcher3/taskbar/W4;->G:Ljava/lang/Runnable;

    .line 922
    .line 923
    return-object v1
.end method

.method private F0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->q:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    const/4 v1, 0x7

    .line 6
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/taskbar/W4;->z0(IF)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->h:Lcom/android/launcher3/taskbar/s2;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s2;->D(F)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private G()Landroid/animation/LayoutTransition;
    .locals 14

    .line 1
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x1f4

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/taskbar/W4$a;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/W4$a;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/LayoutTransition;->addTransitionListener(Landroid/animation/LayoutTransition$TransitionListener;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x2

    .line 26
    new-array v4, v3, [F

    .line 27
    .line 28
    fill-array-data v4, :array_0

    .line 29
    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    const-string v6, "alpha"

    .line 33
    .line 34
    invoke-static {v5, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    sget-object v7, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 39
    .line 40
    const v8, 0x3eab020c    # 0.334f

    .line 41
    .line 42
    .line 43
    invoke-static {v7, v2, v8}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v4, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    sget-object v2, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 51
    .line 52
    new-array v8, v3, [F

    .line 53
    .line 54
    fill-array-data v8, :array_1

    .line 55
    .line 56
    .line 57
    invoke-static {v5, v2, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    sget-object v9, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    invoke-virtual {v8, v9}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 64
    .line 65
    .line 66
    new-array v10, v3, [Landroid/animation/Animator;

    .line 67
    .line 68
    const/4 v11, 0x0

    .line 69
    aput-object v4, v10, v11

    .line 70
    .line 71
    const/4 v4, 0x1

    .line 72
    aput-object v8, v10, v4

    .line 73
    .line 74
    invoke-virtual {v1, v10}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v3, v1}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 78
    .line 79
    .line 80
    const-wide/16 v12, 0x32

    .line 81
    .line 82
    invoke-virtual {v0, v3, v12, v13}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 83
    .line 84
    .line 85
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 86
    .line 87
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 88
    .line 89
    .line 90
    new-array v8, v3, [F

    .line 91
    .line 92
    fill-array-data v8, :array_2

    .line 93
    .line 94
    .line 95
    invoke-static {v5, v6, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    const v8, 0x3dcccccd    # 0.1f

    .line 100
    .line 101
    .line 102
    const v10, 0x3e883127    # 0.266f

    .line 103
    .line 104
    .line 105
    invoke-static {v7, v8, v10}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    invoke-virtual {v6, v7}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 110
    .line 111
    .line 112
    new-array v7, v3, [F

    .line 113
    .line 114
    fill-array-data v7, :array_3

    .line 115
    .line 116
    .line 117
    invoke-static {v5, v2, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v2, v9}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 122
    .line 123
    .line 124
    new-array v7, v3, [Landroid/animation/Animator;

    .line 125
    .line 126
    aput-object v6, v7, v11

    .line 127
    .line 128
    aput-object v2, v7, v4

    .line 129
    .line 130
    invoke-virtual {v1, v7}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 131
    .line 132
    .line 133
    const/4 v2, 0x3

    .line 134
    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 135
    .line 136
    .line 137
    new-instance v1, Lcom/android/launcher3/taskbar/W4$b;

    .line 138
    .line 139
    const-string v2, "translateXPinning"

    .line 140
    .line 141
    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/taskbar/W4$b;-><init>(Lcom/android/launcher3/taskbar/W4;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 145
    .line 146
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v11}, Landroid/animation/LayoutTransition;->getAnimator(I)Landroid/animation/Animator;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    new-array v6, v3, [F

    .line 154
    .line 155
    fill-array-data v6, :array_4

    .line 156
    .line 157
    .line 158
    invoke-static {v5, v1, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    new-array v3, v3, [Landroid/animation/Animator;

    .line 163
    .line 164
    aput-object v2, v3, v11

    .line 165
    .line 166
    aput-object v1, v3, v4

    .line 167
    .line 168
    invoke-virtual {p0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v11, p0}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v11, v9}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v4, p0}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v4, v9}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v4, v12, v13}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 184
    .line 185
    .line 186
    return-object v0

    .line 187
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    :array_4
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private G0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->p:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    const/4 v1, 0x6

    .line 6
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/taskbar/W4;->z0(IF)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private H(Landroid/view/View;ZFZZ)Landroid/animation/ValueAnimator;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v2, p0, Lcom/android/launcher3/taskbar/W4;->B:I

    .line 20
    .line 21
    div-int/lit8 v2, v2, 0x2

    .line 22
    .line 23
    sub-int v3, v1, v2

    .line 24
    .line 25
    add-int/2addr v1, v2

    .line 26
    const/high16 v2, 0x40000000    # 2.0f

    .line 27
    .line 28
    if-eqz p4, :cond_1

    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/W4;->L:Z

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    iget p0, v0, Landroid/graphics/Rect;->right:I

    .line 35
    .line 36
    int-to-float v4, p0

    .line 37
    sub-float/2addr v4, p3

    .line 38
    float-to-int p3, v4

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget p0, v0, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    int-to-float v4, p0

    .line 43
    add-float/2addr v4, p3

    .line 44
    float-to-int p3, v4

    .line 45
    move v5, p3

    .line 46
    move p3, p0

    .line 47
    move p0, v5

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    int-to-float p0, p0

    .line 54
    sub-float/2addr p0, p3

    .line 55
    div-float/2addr p0, v2

    .line 56
    float-to-int p0, p0

    .line 57
    iget p3, v0, Landroid/graphics/Rect;->left:I

    .line 58
    .line 59
    add-int/2addr p3, p0

    .line 60
    iget v4, v0, Landroid/graphics/Rect;->right:I

    .line 61
    .line 62
    sub-int p0, v4, p0

    .line 63
    .line 64
    :goto_0
    new-instance v4, Landroid/graphics/Rect;

    .line 65
    .line 66
    invoke-direct {v4, p3, v3, p0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x0

    .line 70
    if-eqz p4, :cond_2

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 73
    .line 74
    .line 75
    move-result p3

    .line 76
    int-to-float p3, p3

    .line 77
    div-float/2addr p3, v2

    .line 78
    goto :goto_1

    .line 79
    :cond_2
    move p3, p0

    .line 80
    :goto_1
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 81
    .line 82
    .line 83
    move-result p4

    .line 84
    int-to-float p4, p4

    .line 85
    div-float/2addr p4, v2

    .line 86
    new-instance v1, Lcom/android/launcher3/anim/d0;

    .line 87
    .line 88
    invoke-direct {v1, p3, p4, v0, v4}, Lcom/android/launcher3/anim/d0;-><init>(FFLandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 89
    .line 90
    .line 91
    xor-int/lit8 p2, p2, 0x1

    .line 92
    .line 93
    invoke-virtual {v1, p1, p2, p0}, Lcom/android/launcher3/anim/c0;->c(Landroid/view/View;ZF)Landroid/animation/ValueAnimator;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    if-eqz p5, :cond_3

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getListeners()Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_3

    .line 112
    .line 113
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    check-cast p2, Landroid/animation/Animator$AnimatorListener;

    .line 118
    .line 119
    invoke-interface {p2, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationStart(Landroid/animation/Animator;)V

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    return-object p0
.end method

.method private H0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->l:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->m:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    add-float/2addr v1, v2

    .line 12
    iget v2, p0, Lcom/android/launcher3/taskbar/W4;->y:F

    .line 13
    .line 14
    add-float/2addr v1, v2

    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->X()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-float/2addr v1, v2

    .line 20
    iget p0, p0, Lcom/android/launcher3/taskbar/W4;->z:F

    .line 21
    .line 22
    add-float/2addr v1, p0

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private I(F)Landroid/animation/ObjectAnimator;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->p:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-wide/16 v0, 0x64

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    .line 15
    sget-object p1, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method private P(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/BubbleTextView$f;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of v0, p1, Lcom/android/launcher3/model/data/D;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lcom/android/launcher3/model/data/D;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/D;->j0()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/F3;->p(I)Lcom/android/launcher3/BubbleTextView$f;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    instance-of v0, p1, Lcom/android/quickstep/util/SingleTask;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    check-cast p1, Lcom/android/quickstep/util/SingleTask;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->s:Lcom/android/launcher3/taskbar/F3;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 39
    .line 40
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/F3;->p(I)Lcom/android/launcher3/BubbleTextView$f;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    sget-object p0, Lcom/android/launcher3/BubbleTextView$f;->g:Lcom/android/launcher3/BubbleTextView$f;

    .line 48
    .line 49
    return-object p0
.end method

.method private X()F
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->v:Lcom/android/launcher3/anim/d;

    .line 12
    .line 13
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-boolean v2, v2, Lcom/android/launcher3/taskbar/J3;->u:Z

    .line 22
    .line 23
    const/high16 v3, 0x40000000    # 2.0f

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->M:Lcom/android/launcher3/h0;

    .line 28
    .line 29
    iget v4, v2, Lcom/android/launcher3/h0;->t3:I

    .line 30
    .line 31
    iget v2, v2, Lcom/android/launcher3/h0;->r3:I

    .line 32
    .line 33
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 34
    .line 35
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarView;->getTransientTaskbarIconLayoutBounds()Landroid/graphics/Rect;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 40
    .line 41
    sub-int/2addr v2, v5

    .line 42
    add-int/2addr v4, v2

    .line 43
    int-to-float v2, v4

    .line 44
    iget-object v4, p0, Lcom/android/launcher3/taskbar/W4;->N:Lcom/android/launcher3/h0;

    .line 45
    .line 46
    iget v4, v4, Lcom/android/launcher3/h0;->r3:I

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->M:Lcom/android/launcher3/h0;

    .line 49
    .line 50
    iget p0, p0, Lcom/android/launcher3/h0;->u3:I

    .line 51
    .line 52
    sub-int/2addr v4, p0

    .line 53
    int-to-float p0, v4

    .line 54
    div-float/2addr p0, v3

    .line 55
    sub-float/2addr v2, p0

    .line 56
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->M:Lcom/android/launcher3/h0;

    .line 62
    .line 63
    iget v2, v2, Lcom/android/launcher3/h0;->t3:I

    .line 64
    .line 65
    neg-int v2, v2

    .line 66
    iget-object v4, p0, Lcom/android/launcher3/taskbar/W4;->N:Lcom/android/launcher3/h0;

    .line 67
    .line 68
    iget v4, v4, Lcom/android/launcher3/h0;->r3:I

    .line 69
    .line 70
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 71
    .line 72
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarView;->getTransientTaskbarIconLayoutBounds()Landroid/graphics/Rect;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 77
    .line 78
    sub-int/2addr v4, v5

    .line 79
    add-int/2addr v2, v4

    .line 80
    int-to-float v2, v2

    .line 81
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->M:Lcom/android/launcher3/h0;

    .line 82
    .line 83
    iget v4, p0, Lcom/android/launcher3/h0;->r3:I

    .line 84
    .line 85
    iget p0, p0, Lcom/android/launcher3/h0;->u3:I

    .line 86
    .line 87
    sub-int/2addr v4, p0

    .line 88
    int-to-float p0, v4

    .line 89
    div-float/2addr p0, v3

    .line 90
    sub-float/2addr v2, p0

    .line 91
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    return p0
.end method

.method private c0()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->s:LN2/h;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/bubbles/g0;->u0(LN2/h;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->B0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Landroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/anim/a;->a(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/anim/q;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic f0(IILandroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const/4 v0, 0x0

    .line 8
    cmpl-float p3, p3, v0

    .line 9
    .line 10
    if-lez p3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p1, p2

    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic g0(Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/taskbar/W4;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/taskbar/W4;->j0(Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/android/launcher3/D3;->P(Lz1/y0$b;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic i()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic i0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->C0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/taskbar/W4;Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->k0(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic j0(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    sget-object p1, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/W4;->D0(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/M0;->J0()V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->x()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/taskbar/W4;Lcom/android/launcher3/taskbar/bubbles/m0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->g0(Lcom/android/launcher3/taskbar/bubbles/m0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k0(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->G0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/util/z1;)V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v1}, Lcom/android/launcher3/util/z1;->c(IFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->F0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->H0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->h0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/android/launcher3/taskbar/W4;IILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/W4;->f0(IILandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lcom/android/launcher3/taskbar/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic t(Lcom/android/launcher3/taskbar/W4;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->A0(Lcom/android/launcher3/BubbleTextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v0(Lcom/android/launcher3/BubbleTextView;)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/S1;->c(I)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    instance-of v1, p1, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 11
    .line 12
    instance-of p1, p1, LY1/g;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    return v0
.end method

.method private w0(Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->C()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->c0()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->q:Lcom/android/launcher3/anim/d;

    .line 20
    .line 21
    int-to-float v0, v0

    .line 22
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4;->u:Landroid/animation/ObjectAnimator;

    .line 27
    .line 28
    sget-object v0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->u:Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    sget-wide v0, Lcom/android/launcher3/taskbar/W4;->S:J

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->u:Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->q:Lcom/android/launcher3/anim/d;

    .line 47
    .line 48
    int-to-float p1, v0

    .line 49
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private x()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/W4;->w0(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private x0(LN2/h;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->s:LN2/h;

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4;->s:LN2/h;

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private z0(IF)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length v0, p0

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_0

    .line 10
    .line 11
    aget-object v2, p0, v1

    .line 12
    .line 13
    check-cast v2, Lcom/android/launcher3/G5;

    .line 14
    .line 15
    invoke-interface {v2}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, p1}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, p2}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->j()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method C0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/W4;->D0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method D0(Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->o:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-virtual {v3, v4}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->h1(Z)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    iget-object v3, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 39
    .line 40
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-virtual {v5, v6}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->h1(Z)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 54
    .line 55
    const/4 v7, 0x0

    .line 56
    if-eqz v5, :cond_0

    .line 57
    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->C()V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->t:Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 66
    .line 67
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->s:LN2/h;

    .line 68
    .line 69
    invoke-virtual {p1, v5}, Lcom/android/launcher3/taskbar/bubbles/g0;->u0(LN2/h;)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    int-to-float p1, p1

    .line 74
    invoke-static {v1, p1, v7}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->q:Lcom/android/launcher3/anim/d;

    .line 79
    .line 80
    invoke-virtual {v5, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 81
    .line 82
    .line 83
    :cond_0
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 88
    .line 89
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonTranslationXOffsetUsedForLayout()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    int-to-float v5, v5

    .line 94
    sub-float/2addr v5, v2

    .line 95
    const/high16 v2, 0x40000000    # 2.0f

    .line 96
    .line 97
    div-float/2addr v5, v2

    .line 98
    iget-object v8, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 99
    .line 100
    invoke-virtual {v8}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonTranslationXOffsetUsedForLayout()I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    int-to-float v8, v8

    .line 105
    sub-float/2addr v8, v3

    .line 106
    div-float/2addr v8, v2

    .line 107
    invoke-static {v1, v5, v8}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    array-length v5, v0

    .line 112
    if-gt v5, v4, :cond_1

    .line 113
    .line 114
    move p1, v7

    .line 115
    :cond_1
    iget-boolean v5, p0, Lcom/android/launcher3/taskbar/W4;->L:Z

    .line 116
    .line 117
    if-eqz v5, :cond_2

    .line 118
    .line 119
    const/high16 v5, -0x40800000    # -1.0f

    .line 120
    .line 121
    mul-float/2addr p1, v5

    .line 122
    mul-float/2addr v3, v5

    .line 123
    :cond_2
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 124
    .line 125
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-eqz v5, :cond_3

    .line 130
    .line 131
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/IconButtonView;->setTranslationXForTaskbarAllAppsIcon(F)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_3
    iget v5, p0, Lcom/android/launcher3/taskbar/W4;->O:I

    .line 142
    .line 143
    iget v8, p0, Lcom/android/launcher3/taskbar/W4;->P:I

    .line 144
    .line 145
    sub-int/2addr v5, v8

    .line 146
    int-to-float v5, v5

    .line 147
    invoke-static {v1, v7, v5}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    array-length v5, v0

    .line 152
    sub-int/2addr v5, v4

    .line 153
    int-to-float v4, v5

    .line 154
    div-float/2addr v4, v2

    .line 155
    :goto_0
    array-length v2, v0

    .line 156
    if-ge v6, v2, :cond_5

    .line 157
    .line 158
    aget-object v2, v0, v6

    .line 159
    .line 160
    move-object v5, v2

    .line 161
    check-cast v5, Lcom/android/launcher3/G5;

    .line 162
    .line 163
    invoke-interface {v5}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    const/4 v7, 0x5

    .line 168
    invoke-virtual {v5, v7}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    int-to-float v7, v6

    .line 173
    sub-float v7, v4, v7

    .line 174
    .line 175
    mul-float/2addr v7, v1

    .line 176
    add-float/2addr v7, v3

    .line 177
    invoke-virtual {v5, v7}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 178
    .line 179
    .line 180
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 181
    .line 182
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    invoke-virtual {v2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-eqz v2, :cond_4

    .line 191
    .line 192
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 193
    .line 194
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-virtual {v2, p1}, Lcom/android/launcher3/views/IconButtonView;->setTranslationXForTaskbarAllAppsIcon(F)V

    .line 199
    .line 200
    .line 201
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_5
    return-void
.end method

.method public E()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/j3;->G()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutTransition()Landroid/animation/LayoutTransition;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->G()Landroid/animation/LayoutTransition;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public J()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public K()Lcom/android/launcher3/util/Y0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v1, v0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    aget-object v1, v0, v1

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getX()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    array-length v2, v0

    .line 20
    add-int/lit8 v2, v2, -0x1

    .line 21
    .line 22
    aget-object v3, v0, v2

    .line 23
    .line 24
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    int-to-float v3, v3

    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-float/2addr v3, v0

    .line 36
    sub-float/2addr v3, v1

    .line 37
    const/high16 v0, 0x40000000    # 2.0f

    .line 38
    .line 39
    iget p0, p0, Lcom/android/launcher3/taskbar/W4;->Q:F

    .line 40
    .line 41
    mul-float/2addr p0, v0

    .line 42
    add-float/2addr v3, p0

    .line 43
    return v3
.end method

.method public M(Ljava/util/function/Predicate;)Landroid/view/View;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/util/P0;->n(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x2

    .line 8
    new-array v2, v2, [Ljava/util/function/Predicate;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    aput-object p1, v2, v3

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    aput-object v1, v2, p1

    .line 15
    .line 16
    invoke-interface {v0, v2}, Lcom/android/launcher3/util/Y0;->M([Ljava/util/function/Predicate;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public N()[Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method O(ILandroid/view/View;ZZZZI)F
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    int-to-float p0, p1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/high16 p0, -0x40800000    # -1.0f

    .line 6
    .line 7
    :goto_0
    if-eqz p3, :cond_1

    .line 8
    .line 9
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    :cond_1
    int-to-float p1, p1

    .line 12
    if-eqz p4, :cond_2

    .line 13
    .line 14
    return p0

    .line 15
    :cond_2
    if-eqz p5, :cond_5

    .line 16
    .line 17
    if-eqz p6, :cond_3

    .line 18
    .line 19
    move p0, p1

    .line 20
    :cond_3
    const/4 p1, 0x0

    .line 21
    cmpl-float p1, p0, p1

    .line 22
    .line 23
    const/high16 p2, 0x3f000000    # 0.5f

    .line 24
    .line 25
    if-lez p1, :cond_4

    .line 26
    .line 27
    sub-float/2addr p0, p2

    .line 28
    return p0

    .line 29
    :cond_4
    add-float/2addr p0, p2

    .line 30
    return p0

    .line 31
    :cond_5
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    instance-of p0, p0, Lcom/android/launcher3/model/data/y;

    .line 36
    .line 37
    if-eqz p0, :cond_6

    .line 38
    .line 39
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 44
    .line 45
    iget p0, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 46
    .line 47
    int-to-float p0, p0

    .line 48
    return p0

    .line 49
    :cond_6
    if-ltz p7, :cond_7

    .line 50
    .line 51
    int-to-float p0, p7

    .line 52
    add-float/2addr p1, p0

    .line 53
    return p1

    .line 54
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string p1, "Unsupported view found in createIconAlignmentController, v="

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "TaskbarViewController"

    .line 72
    .line 73
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    const/high16 p0, -0x3d380000    # -100.0f

    .line 77
    .line 78
    return p0
.end method

.method protected Q()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->N()[Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    array-length v1, p0

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    if-ge v2, v1, :cond_2

    .line 22
    .line 23
    aget-object v3, p0, v2

    .line 24
    .line 25
    instance-of v4, v3, Lcom/android/launcher3/BubbleTextView;

    .line 26
    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    instance-of v4, v3, Lcom/android/launcher3/model/data/D;

    .line 36
    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    check-cast v3, Lcom/android/launcher3/model/data/D;

    .line 40
    .line 41
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/D;->j0()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    return-object v0
.end method

.method public R()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarDividerViewContainer()LY1/g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
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
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->j:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    return-object p0
.end method

.method public T()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->n:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public U()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->k:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public V()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->o:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public W()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->v:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public Y()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->m:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public Z()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 10

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
    const-string v1, "TaskbarViewController:"

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->j:Lcom/android/launcher3/util/B1;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, "\t"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v8, "ALPHA_INDEX_ASSISTANT_INVOKED"

    .line 41
    .line 42
    const-string v9, "ALPHA_INDEX_SMALL_SCREEN"

    .line 43
    .line 44
    const-string v3, "ALPHA_INDEX_HOME"

    .line 45
    .line 46
    const-string v4, "ALPHA_INDEX_KEYGUARD"

    .line 47
    .line 48
    const-string v5, "ALPHA_INDEX_STASH"

    .line 49
    .line 50
    const-string v6, "ALPHA_INDEX_RECENTS_DISABLED"

    .line 51
    .line 52
    const-string v7, "ALPHA_INDEX_NOTIFICATION_EXPANDED"

    .line 53
    .line 54
    filled-new-array/range {v3 .. v9}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const-string v4, "mTaskbarIconAlpha"

    .line 59
    .line 60
    invoke-virtual {v0, v1, p2, v4, v3}, Lcom/android/launcher3/util/v1;->dump(Ljava/lang/String;Ljava/io/PrintWriter;Ljava/lang/String;[Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 64
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/j3;->Q(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public a0()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTransientTaskbarIconLayoutBounds()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(LN2/h;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->x0(LN2/h;)Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->w0(Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->p2()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->D()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->p:Lcom/android/launcher3/anim/d;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->t(LN2/h;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public b0()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTransientTaskbarIconLayoutBoundsInParent()Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(LN2/h;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->x0(LN2/h;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->w0(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->p2()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->D()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->m(LN2/h;)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/W4;->I(F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4;->r:Landroid/animation/Animator;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public d0(Lcom/android/launcher3/taskbar/R1;Landroid/animation/AnimatorSet;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 4
    .line 5
    new-instance v1, Lcom/android/launcher3/taskbar/V4;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/V4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->j:Lcom/android/launcher3/util/B1;

    .line 19
    .line 20
    const/16 v3, 0x8

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget-object v3, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 44
    .line 45
    invoke-static {v2}, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;->c(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 52
    .line 53
    iget-object v5, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 54
    .line 55
    invoke-virtual {v2, v3, v4, v5}, Lcom/android/launcher3/taskbar/TaskbarViewCallbacksFactory;->a(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/TaskbarView;)Lcom/android/launcher3/taskbar/E4;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {p2, v2}, Lcom/android/launcher3/taskbar/TaskbarView;->o(Lcom/android/launcher3/taskbar/E4;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 69
    .line 70
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 77
    .line 78
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    const v3, 0x7f070ba8

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    goto :goto_0

    .line 90
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 91
    .line 92
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iget v2, v2, Lcom/android/launcher3/h0;->r3:I

    .line 97
    .line 98
    :goto_0
    iput v2, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 99
    .line 100
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->k:Lcom/android/launcher3/anim/d;

    .line 101
    .line 102
    invoke-virtual {p2, v1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 106
    .line 107
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_2

    .line 112
    .line 113
    move p2, v0

    .line 114
    goto :goto_1

    .line 115
    :cond_2
    move p2, v1

    .line 116
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->n:Lcom/android/launcher3/anim/d;

    .line 117
    .line 118
    invoke-virtual {v2, p2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 119
    .line 120
    .line 121
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->v:Lcom/android/launcher3/anim/d;

    .line 122
    .line 123
    invoke-virtual {v2, p2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 124
    .line 125
    .line 126
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->o:Lcom/android/launcher3/anim/d;

    .line 127
    .line 128
    invoke-virtual {v2, p2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 129
    .line 130
    .line 131
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 132
    .line 133
    invoke-virtual {p2, p1}, Lcom/android/launcher3/taskbar/j3;->U(Lcom/android/launcher3/taskbar/R1;)V

    .line 134
    .line 135
    .line 136
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 137
    .line 138
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-eqz p2, :cond_3

    .line 143
    .line 144
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/view/ContextThemeWrapper;->getApplicationContext()Landroid/content/Context;

    .line 147
    .line 148
    .line 149
    new-instance p2, Lcom/android/launcher3/taskbar/H4;

    .line 150
    .line 151
    invoke-direct {p2, p0}, Lcom/android/launcher3/taskbar/H4;-><init>(Lcom/android/launcher3/taskbar/W4;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/R1;->q(Ljava/lang/Runnable;)V

    .line 155
    .line 156
    .line 157
    :cond_3
    iget-object p2, p1, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 158
    .line 159
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/M0;->i0()Lcom/android/launcher3/anim/d;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    iput-object p2, p0, Lcom/android/launcher3/taskbar/W4;->w:Lcom/android/launcher3/anim/d;

    .line 164
    .line 165
    iget-object p2, p1, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 166
    .line 167
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/M0;->j0()Lcom/android/launcher3/anim/d;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    iput-object p2, p0, Lcom/android/launcher3/taskbar/W4;->x:Lcom/android/launcher3/anim/d;

    .line 172
    .line 173
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 174
    .line 175
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W4;->h:Lcom/android/launcher3/taskbar/s2;

    .line 176
    .line 177
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 178
    .line 179
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->K:Lcom/android/launcher3/X3$b;

    .line 180
    .line 181
    invoke-interface {p1, p2}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 182
    .line 183
    .line 184
    sget-boolean p1, Lf1/a;->g:Z

    .line 185
    .line 186
    if-eqz p1, :cond_5

    .line 187
    .line 188
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->j:Lcom/android/launcher3/util/B1;

    .line 189
    .line 190
    const/4 p2, 0x6

    .line 191
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 196
    .line 197
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 198
    .line 199
    .line 200
    move-result p2

    .line 201
    if-eqz p2, :cond_4

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_4
    move v0, v1

    .line 205
    :goto_2
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 206
    .line 207
    .line 208
    :cond_5
    invoke-static {}, Lf1/a;->e()Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    if-eqz p1, :cond_6

    .line 213
    .line 214
    iget-object p1, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 215
    .line 216
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->E:Landroid/view/View$OnLayoutChangeListener;

    .line 217
    .line 218
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 219
    .line 220
    .line 221
    :cond_6
    return-void
.end method

.method public e0(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->q(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l0()V
    .locals 2

    .line 1
    invoke-static {}, Lf1/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->E:Landroid/view/View$OnLayoutChangeListener;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/android/launcher3/D3;->O0(Lz1/y0$b;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->K:Lcom/android/launcher3/X3$b;

    .line 32
    .line 33
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public m0(Landroid/animation/AnimatorSet;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->j:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n0(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    const v1, 0x7f070ba8

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const v1, 0x7f070bb6

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    iget v0, p1, Lcom/android/launcher3/h0;->r3:I

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->J0()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    add-int/2addr v0, v1

    .line 53
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->w:Lcom/android/launcher3/anim/d;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->J0()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    neg-int p1, p1

    .line 65
    int-to-float p1, p1

    .line 66
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public o0(Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_2

    .line 10
    .line 11
    aget-object v3, v0, v2

    .line 12
    .line 13
    instance-of v4, v3, Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    move-object v4, v3

    .line 18
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    instance-of v6, v5, Lcom/android/quickstep/util/GroupTask;

    .line 25
    .line 26
    if-eqz v6, :cond_0

    .line 27
    .line 28
    check-cast v5, Lcom/android/quickstep/util/GroupTask;

    .line 29
    .line 30
    iget-object v3, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 31
    .line 32
    iget v3, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 33
    .line 34
    invoke-virtual {v5, v3}, Lcom/android/quickstep/util/GroupTask;->containsTask(I)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 41
    .line 42
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/taskbar/TaskbarView;->i(Lcom/android/launcher3/BubbleTextView;Lcom/android/quickstep/util/GroupTask;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    instance-of v4, v3, Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 47
    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    check-cast v3, Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 51
    .line 52
    invoke-virtual {v3, p1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->y(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    return-void
.end method

.method public p0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->setClickAndLongClickListenersForIcon(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->C:Lcom/android/launcher3/taskbar/j3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/j3;->a0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r0(FLcom/android/launcher3/h0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/android/launcher3/taskbar/W4;->F:Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/o4;->t()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v2, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/o4;->u()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/a4;->g0()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iget-object v4, p0, Lcom/android/launcher3/taskbar/W4;->F:Lcom/android/launcher3/anim/q;

    .line 38
    .line 39
    if-eqz v4, :cond_1

    .line 40
    .line 41
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/W4;->I:Z

    .line 42
    .line 43
    if-ne v4, v0, :cond_1

    .line 44
    .line 45
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/W4;->H:Z

    .line 46
    .line 47
    if-ne v4, v2, :cond_1

    .line 48
    .line 49
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/W4;->J:Z

    .line 50
    .line 51
    if-eq v4, v3, :cond_2

    .line 52
    .line 53
    :cond_1
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/W4;->I:Z

    .line 54
    .line 55
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/W4;->H:Z

    .line 56
    .line 57
    iput-boolean v3, p0, Lcom/android/launcher3/taskbar/W4;->J:Z

    .line 58
    .line 59
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/W4;->F(Lcom/android/launcher3/h0;)Lcom/android/launcher3/anim/q;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    iput-object p2, p0, Lcom/android/launcher3/taskbar/W4;->F:Lcom/android/launcher3/anim/q;

    .line 64
    .line 65
    :cond_2
    iget-object p2, p0, Lcom/android/launcher3/taskbar/W4;->F:Lcom/android/launcher3/anim/q;

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 68
    .line 69
    .line 70
    const/4 p2, 0x0

    .line 71
    cmpg-float p2, p1, p2

    .line 72
    .line 73
    if-lez p2, :cond_4

    .line 74
    .line 75
    const/high16 p2, 0x3f800000    # 1.0f

    .line 76
    .line 77
    cmpl-float p1, p1, p2

    .line 78
    .line 79
    if-ltz p1, :cond_3

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    return-void

    .line 83
    :cond_4
    :goto_0
    iput-object v1, p0, Lcom/android/launcher3/taskbar/W4;->F:Lcom/android/launcher3/anim/q;

    .line 84
    .line 85
    return-void
.end method

.method public s0(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->j:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public t0(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/W4;->z:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->H0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-static {p0, p1}, LJ/z;->a(Landroid/view/View;Ljava/lang/Runnable;)LJ/z;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u0(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/W4;->y:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->H0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Landroid/animation/AnimatorSet;ZJLandroid/view/animation/Interpolator;Z)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move-wide/from16 v7, p3

    .line 6
    .line 7
    new-instance v9, Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v10, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, Lcom/android/launcher3/taskbar/W4;->D:Lcom/android/launcher3/taskbar/R1;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 20
    .line 21
    invoke-virtual {v1, v10}, Lcom/android/launcher3/taskbar/U0;->m(Landroid/graphics/Rect;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v11

    .line 30
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-float v1, v1

    .line 35
    int-to-float v2, v11

    .line 36
    div-float v3, v1, v2

    .line 37
    .line 38
    iget-object v1, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconTouchSize()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    sub-int/2addr v1, v2

    .line 49
    int-to-float v12, v1

    .line 50
    iget-object v1, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v13, 0x1

    .line 57
    sub-int/2addr v1, v13

    .line 58
    move v14, v1

    .line 59
    :goto_0
    if-ltz v14, :cond_6

    .line 60
    .line 61
    iget-object v1, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 62
    .line 63
    invoke-virtual {v1, v14}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object v2, v0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 68
    .line 69
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/TaskbarView;->getQsb()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    if-ne v1, v2, :cond_0

    .line 74
    .line 75
    move v4, v13

    .line 76
    :goto_1
    move/from16 v2, p2

    .line 77
    .line 78
    move/from16 v5, p6

    .line 79
    .line 80
    const/16 v16, 0x0

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_0
    const/4 v4, 0x0

    .line 84
    goto :goto_1

    .line 85
    :goto_2
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/taskbar/W4;->H(Landroid/view/View;ZFZZ)Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    .line 88
    move-result-object v15

    .line 89
    move v0, v4

    .line 90
    invoke-virtual {v15, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v9, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 95
    .line 96
    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/view/View;->getX()F

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    goto :goto_3

    .line 104
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    int-to-float v0, v0

    .line 109
    :goto_3
    iget v2, v10, Landroid/graphics/Rect;->left:I

    .line 110
    .line 111
    int-to-float v2, v2

    .line 112
    int-to-float v4, v14

    .line 113
    mul-float/2addr v4, v3

    .line 114
    add-float/2addr v2, v4

    .line 115
    cmpl-float v4, v0, v2

    .line 116
    .line 117
    if-lez v4, :cond_2

    .line 118
    .line 119
    iget v2, v10, Landroid/graphics/Rect;->right:I

    .line 120
    .line 121
    int-to-float v2, v2

    .line 122
    add-int/lit8 v4, v11, -0x1

    .line 123
    .line 124
    sub-int/2addr v4, v14

    .line 125
    int-to-float v4, v4

    .line 126
    mul-float/2addr v4, v3

    .line 127
    sub-float/2addr v2, v4

    .line 128
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    int-to-float v4, v4

    .line 133
    add-float/2addr v0, v4

    .line 134
    sub-float/2addr v0, v2

    .line 135
    neg-float v0, v0

    .line 136
    goto :goto_4

    .line 137
    :cond_2
    sub-float v0, v2, v0

    .line 138
    .line 139
    :goto_4
    const/4 v2, 0x0

    .line 140
    const/4 v4, 0x2

    .line 141
    if-eqz p2, :cond_3

    .line 142
    .line 143
    new-array v5, v13, [F

    .line 144
    .line 145
    aput v0, v5, v16

    .line 146
    .line 147
    goto :goto_5

    .line 148
    :cond_3
    new-array v5, v4, [F

    .line 149
    .line 150
    aput v0, v5, v16

    .line 151
    .line 152
    aput v2, v5, v13

    .line 153
    .line 154
    :goto_5
    if-eqz p2, :cond_4

    .line 155
    .line 156
    new-array v0, v13, [F

    .line 157
    .line 158
    aput v12, v0, v16

    .line 159
    .line 160
    goto :goto_6

    .line 161
    :cond_4
    new-array v0, v4, [F

    .line 162
    .line 163
    aput v12, v0, v16

    .line 164
    .line 165
    aput v2, v0, v13

    .line 166
    .line 167
    :goto_6
    instance-of v2, v1, Lcom/android/launcher3/G5;

    .line 168
    .line 169
    if-eqz v2, :cond_5

    .line 170
    .line 171
    check-cast v1, Lcom/android/launcher3/G5;

    .line 172
    .line 173
    invoke-interface {v1}, Lcom/android/launcher3/G5;->getTranslateDelegate()Lcom/android/launcher3/util/z1;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    const/4 v2, 0x4

    .line 178
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    sget-object v15, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 183
    .line 184
    invoke-static {v4, v15, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    invoke-virtual {v4, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    invoke-virtual {v9, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/z1;->b(I)Lcom/android/launcher3/util/v1$c;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-static {v2, v15, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {v9, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 204
    .line 205
    .line 206
    new-instance v0, Lcom/android/launcher3/taskbar/L4;

    .line 207
    .line 208
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/L4;-><init>(Lcom/android/launcher3/util/z1;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v6, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 216
    .line 217
    .line 218
    goto :goto_7

    .line 219
    :cond_5
    sget-object v2, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 220
    .line 221
    invoke-static {v1, v2, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {v2, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-virtual {v9, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 230
    .line 231
    .line 232
    sget-object v2, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 233
    .line 234
    invoke-static {v1, v2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v9, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 239
    .line 240
    .line 241
    new-instance v0, Lcom/android/launcher3/taskbar/M4;

    .line 242
    .line 243
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/M4;-><init>(Landroid/view/View;)V

    .line 244
    .line 245
    .line 246
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v6, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 251
    .line 252
    .line 253
    :goto_7
    add-int/lit8 v14, v14, -0x1

    .line 254
    .line 255
    move-object/from16 v0, p0

    .line 256
    .line 257
    goto/16 :goto_0

    .line 258
    .line 259
    :cond_6
    move-object/from16 v0, p5

    .line 260
    .line 261
    invoke-virtual {v9, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v6, v9}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 265
    .line 266
    .line 267
    return-void
.end method

.method w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/W4;->F:Lcom/android/launcher3/anim/q;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarView;->A()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->E()V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/W4;->x()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public y()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    array-length v1, p0

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v1, :cond_1

    .line 12
    .line 13
    aget-object v4, p0, v3

    .line 14
    .line 15
    instance-of v5, v4, Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    if-eqz v5, :cond_0

    .line 18
    .line 19
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 20
    .line 21
    invoke-virtual {v4}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-eqz v5, :cond_0

    .line 26
    .line 27
    new-array v5, v0, [F

    .line 28
    .line 29
    const/4 v6, 0x0

    .line 30
    aput v6, v5, v2

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Lcom/android/launcher3/BubbleTextView;->s([F)V

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/2addr v3, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-void
.end method

.method public y0()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->N()[Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    instance-of v4, v3, Lcom/android/launcher3/BubbleTextView;

    .line 12
    .line 13
    if-eqz v4, :cond_0

    .line 14
    .line 15
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    invoke-direct {p0, v3}, Lcom/android/launcher3/taskbar/W4;->A0(Lcom/android/launcher3/BubbleTextView;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v3}, Lcom/android/launcher3/taskbar/W4;->v0(Lcom/android/launcher3/BubbleTextView;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    new-instance v4, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/widget/TextView;->getContentDescription()Ljava/lang/CharSequence;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v5, " "

    .line 39
    .line 40
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Lcom/android/launcher3/BubbleTextView;->getIconStateDescription()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    return-void
.end method

.method public z()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W4;->i:Lcom/android/launcher3/taskbar/TaskbarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
