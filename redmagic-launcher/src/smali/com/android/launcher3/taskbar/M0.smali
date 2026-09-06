.class public Lcom/android/launcher3/taskbar/M0;
.super Ljava/lang/Object;
.source "NavbarButtonsViewController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;
.implements Lcom/android/launcher3/taskbar/bubbles/t$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/M0$d;,
        Lcom/android/launcher3/taskbar/M0$e;
    }
.end annotation


# instance fields
.field private final A:Lcom/android/launcher3/anim/d;

.field private B:F

.field private final C:Lcom/android/launcher3/anim/d;

.field private final D:Lcom/android/launcher3/anim/d;

.field private final E:Lcom/android/launcher3/anim/d;

.field private final F:Lcom/android/launcher3/anim/d;

.field private final G:Lcom/android/launcher3/anim/d;

.field private final H:Lcom/android/launcher3/taskbar/M0$d;

.field private final I:Landroid/graphics/Rect;

.field private J:Lcom/android/launcher3/taskbar/R1;

.field private K:Z

.field private L:Landroid/widget/ImageView;

.field private M:J

.field private N:Landroid/widget/ImageView;

.field private O:Landroid/widget/ImageView;

.field private P:Lcom/android/launcher3/util/B1;

.field private Q:Lcom/android/launcher3/util/B1;

.field private R:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

.field private S:Landroid/widget/ImageView;

.field private T:Z

.field private U:Lcom/android/launcher3/views/BaseDragLayer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/views/BaseDragLayer<",
            "Lcom/android/launcher3/taskbar/I1;",
            ">;"
        }
    .end annotation
.end field

.field private final V:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

.field private final W:Lcom/android/launcher3/taskbar/R0;

.field private X:Landroid/widget/ImageView;

.field private Y:Landroid/widget/Space;

.field private Z:Lcom/android/launcher3/taskbar/e4;

.field private a0:I

.field private final b0:Ljava/lang/Runnable;

.field private final g:Landroid/graphics/Rect;

.field private final h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/taskbar/M0$e;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private j:I

.field private final k:Lcom/android/launcher3/taskbar/I1;

.field private final l:Landroid/content/Context;

.field private final m:Lcom/android/launcher3/util/window/d;

.field private final n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

.field private final o:Landroid/os/Handler;

.field private final p:Landroid/widget/LinearLayout;

.field private final q:Landroid/view/ViewGroup;

.field private final r:Landroid/view/ViewGroup;

.field private final s:I

.field private final t:I

.field private final u:I

.field private final v:Z

.field private w:Landroid/animation/Animator;

.field private x:LN2/h;

.field private final y:Lcom/android/launcher3/anim/d;

.field private final z:Lcom/android/launcher3/anim/d;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;Landroid/content/Context;Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/os/Handler;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->i:Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 26
    .line 27
    new-instance v1, Lcom/android/launcher3/taskbar/c0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/c0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->y:Lcom/android/launcher3/anim/d;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 38
    .line 39
    new-instance v1, Lcom/android/launcher3/taskbar/c0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/c0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->z:Lcom/android/launcher3/anim/d;

    .line 48
    .line 49
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 50
    .line 51
    new-instance v1, Lcom/android/launcher3/taskbar/c0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/c0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->A:Lcom/android/launcher3/anim/d;

    .line 60
    .line 61
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 62
    .line 63
    new-instance v1, Lcom/android/launcher3/taskbar/n0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/n0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 66
    .line 67
    .line 68
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->C:Lcom/android/launcher3/anim/d;

    .line 72
    .line 73
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 74
    .line 75
    new-instance v1, Lcom/android/launcher3/taskbar/y0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/y0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->D:Lcom/android/launcher3/anim/d;

    .line 84
    .line 85
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 86
    .line 87
    new-instance v1, Lcom/android/launcher3/taskbar/F0;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/F0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->E:Lcom/android/launcher3/anim/d;

    .line 96
    .line 97
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 98
    .line 99
    new-instance v1, Lcom/android/launcher3/taskbar/F0;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/F0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 102
    .line 103
    .line 104
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->F:Lcom/android/launcher3/anim/d;

    .line 108
    .line 109
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 110
    .line 111
    new-instance v1, Lcom/android/launcher3/taskbar/F0;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/F0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 114
    .line 115
    .line 116
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 117
    .line 118
    .line 119
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->G:Lcom/android/launcher3/anim/d;

    .line 120
    .line 121
    new-instance v0, Lcom/android/launcher3/taskbar/M0$d;

    .line 122
    .line 123
    const/4 v1, 0x0

    .line 124
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/taskbar/M0$d;-><init>(Lcom/android/launcher3/taskbar/M0;Lcom/android/launcher3/taskbar/N0;)V

    .line 125
    .line 126
    .line 127
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->H:Lcom/android/launcher3/taskbar/M0$d;

    .line 128
    .line 129
    new-instance v0, Landroid/graphics/Rect;

    .line 130
    .line 131
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 132
    .line 133
    .line 134
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->I:Landroid/graphics/Rect;

    .line 135
    .line 136
    const/4 v0, 0x0

    .line 137
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->T:Z

    .line 138
    .line 139
    new-instance v1, Lcom/android/launcher3/taskbar/G0;

    .line 140
    .line 141
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/G0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 142
    .line 143
    .line 144
    iput-object v1, p0, Lcom/android/launcher3/taskbar/M0;->V:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 145
    .line 146
    new-instance v1, Lcom/android/launcher3/taskbar/R0;

    .line 147
    .line 148
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/R0;-><init>()V

    .line 149
    .line 150
    .line 151
    iput-object v1, p0, Lcom/android/launcher3/taskbar/M0;->W:Lcom/android/launcher3/taskbar/R0;

    .line 152
    .line 153
    new-instance v1, Lcom/android/launcher3/taskbar/H0;

    .line 154
    .line 155
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/H0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 156
    .line 157
    .line 158
    iput-object v1, p0, Lcom/android/launcher3/taskbar/M0;->b0:Ljava/lang/Runnable;

    .line 159
    .line 160
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 161
    .line 162
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0;->l:Landroid/content/Context;

    .line 163
    .line 164
    sget-object p2, Lcom/android/launcher3/util/window/d;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 165
    .line 166
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    check-cast p2, Lcom/android/launcher3/util/window/d;

    .line 171
    .line 172
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0;->m:Lcom/android/launcher3/util/window/d;

    .line 173
    .line 174
    iput-object p3, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 175
    .line 176
    iput-object p4, p0, Lcom/android/launcher3/taskbar/M0;->o:Landroid/os/Handler;

    .line 177
    .line 178
    const p2, 0x7f0b0250

    .line 179
    .line 180
    .line 181
    invoke-virtual {p3, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    check-cast p2, Landroid/widget/LinearLayout;

    .line 186
    .line 187
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 188
    .line 189
    const p2, 0x7f0b024f

    .line 190
    .line 191
    .line 192
    invoke-virtual {p3, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    check-cast p2, Landroid/view/ViewGroup;

    .line 197
    .line 198
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0;->q:Landroid/view/ViewGroup;

    .line 199
    .line 200
    const p2, 0x7f0b058d

    .line 201
    .line 202
    .line 203
    invoke-virtual {p3, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    check-cast p2, Landroid/view/ViewGroup;

    .line 208
    .line 209
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0;->r:Landroid/view/ViewGroup;

    .line 210
    .line 211
    const p2, 0x7f0607ea

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1, p2}, Landroid/view/ContextThemeWrapper;->getColor(I)I

    .line 215
    .line 216
    .line 217
    move-result p2

    .line 218
    iput p2, p0, Lcom/android/launcher3/taskbar/M0;->s:I

    .line 219
    .line 220
    const p2, 0x7f0607e8

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1, p2}, Landroid/view/ContextThemeWrapper;->getColor(I)I

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    iput p2, p0, Lcom/android/launcher3/taskbar/M0;->t:I

    .line 228
    .line 229
    invoke-static {p1}, Lcom/android/launcher3/N5;->x(Landroid/content/Context;)Z

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    if-eqz p2, :cond_0

    .line 234
    .line 235
    const p2, 0x7f0607e9

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1, p2}, Landroid/view/ContextThemeWrapper;->getColor(I)I

    .line 239
    .line 240
    .line 241
    move-result p2

    .line 242
    goto :goto_0

    .line 243
    :cond_0
    const p2, 0x7f0607e7

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1, p2}, Landroid/view/ContextThemeWrapper;->getColor(I)I

    .line 247
    .line 248
    .line 249
    move-result p2

    .line 250
    :goto_0
    iput p2, p0, Lcom/android/launcher3/taskbar/M0;->u:I

    .line 251
    .line 252
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 253
    .line 254
    .line 255
    move-result p2

    .line 256
    if-eqz p2, :cond_1

    .line 257
    .line 258
    new-instance p2, Lcom/android/launcher3/taskbar/e4;

    .line 259
    .line 260
    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/taskbar/e4;-><init>(Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;)V

    .line 261
    .line 262
    .line 263
    iput-object p2, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 264
    .line 265
    :cond_1
    const-string p1, "setupwizard.theme"

    .line 266
    .line 267
    const-string p2, ""

    .line 268
    .line 269
    invoke-static {p1, p2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    const-string p2, "glif_expressive"

    .line 274
    .line 275
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result p2

    .line 279
    if-nez p2, :cond_2

    .line 280
    .line 281
    const-string p2, "glif_expressive_light"

    .line 282
    .line 283
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    if-eqz p1, :cond_3

    .line 288
    .line 289
    :cond_2
    const/4 v0, 0x1

    .line 290
    :cond_3
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->v:Z

    .line 291
    .line 292
    return-void
.end method

.method public static synthetic A(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x10

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic A0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->w:Landroid/animation/Animator;

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p0, 0x1400

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic B0(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Runnable;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/launcher3/taskbar/l3;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p7}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->o:Landroid/os/Handler;

    .line 13
    .line 14
    const-wide/16 v4, 0xc8

    .line 15
    .line 16
    invoke-virtual {v3, p2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p6}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    int-to-float v3, v3

    .line 24
    invoke-virtual {p6}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result p6

    .line 28
    int-to-float p6, p6

    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-virtual {p3, v4, v4, v3, p6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p4, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 p6, 0x3

    .line 37
    if-eq v0, p6, :cond_2

    .line 38
    .line 39
    invoke-virtual {p7}, Landroid/view/MotionEvent;->getX()F

    .line 40
    .line 41
    .line 42
    move-result p6

    .line 43
    invoke-virtual {p7}, Landroid/view/MotionEvent;->getY()F

    .line 44
    .line 45
    .line 46
    move-result p7

    .line 47
    invoke-virtual {p3, p6, p7}, Landroid/graphics/RectF;->contains(FF)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-nez p3, :cond_1

    .line 52
    .line 53
    const/4 p3, 0x2

    .line 54
    if-eq v0, p3, :cond_2

    .line 55
    .line 56
    if-ne v0, v1, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    move p3, v2

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    :goto_0
    move p3, v1

    .line 62
    :goto_1
    if-eq v0, v1, :cond_3

    .line 63
    .line 64
    if-nez p3, :cond_3

    .line 65
    .line 66
    return v2

    .line 67
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->o:Landroid/os/Handler;

    .line 68
    .line 69
    invoke-virtual {p0, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_5

    .line 77
    .line 78
    if-eqz p3, :cond_4

    .line 79
    .line 80
    return v2

    .line 81
    :cond_4
    invoke-virtual {p5, v2, p3}, Lcom/android/launcher3/taskbar/l3;->t(IZ)V

    .line 82
    .line 83
    .line 84
    :cond_5
    invoke-virtual {p5, v1, p3}, Lcom/android/launcher3/taskbar/l3;->t(IZ)V

    .line 85
    .line 86
    .line 87
    if-ne v0, v1, :cond_6

    .line 88
    .line 89
    if-nez p3, :cond_6

    .line 90
    .line 91
    invoke-virtual {p4}, Landroid/view/View;->performClick()Z

    .line 92
    .line 93
    .line 94
    :cond_6
    return v2
.end method

.method public static synthetic C(II)Z
    .locals 0

    .line 1
    and-int/2addr p0, p1

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method private synthetic C0(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->J0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->A0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(ZI)Z
    .locals 0

    .line 1
    and-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
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

.method public static synthetic F(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->c1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F0(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    iget-object v1, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/M0;->T(Lcom/android/launcher3/views/BaseDragLayer;Landroid/graphics/Region;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic G(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->d1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(ZI)Z
    .locals 1

    .line 1
    and-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    and-int/lit8 p0, p1, 0x8

    .line 8
    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private H0()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->c1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->h0()Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/e4;->g(F)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic I(Lcom/android/launcher3/taskbar/l3;Landroid/view/View;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/l3;->n(ILandroid/view/View;)Z

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public static synthetic J(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p0, 0x2000

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public static synthetic K(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p0, 0x4000

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method static bridge synthetic L(Lcom/android/launcher3/taskbar/M0;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic M(Lcom/android/launcher3/taskbar/M0;)Lcom/android/systemui/shared/rotation/FloatingRotationButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->R:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method private M0(J)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    iput-wide v1, v0, Lcom/android/launcher3/taskbar/M0;->M:J

    .line 6
    .line 7
    const-wide/32 v3, 0x100000

    .line 8
    .line 9
    .line 10
    and-long/2addr v3, v1

    .line 11
    const-wide/16 v5, 0x0

    .line 12
    .line 13
    cmp-long v3, v3, v5

    .line 14
    .line 15
    const/4 v7, 0x1

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    move v3, v7

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v3, 0x0

    .line 21
    :goto_0
    const-wide/32 v8, 0x40000

    .line 22
    .line 23
    .line 24
    and-long/2addr v8, v1

    .line 25
    cmp-long v8, v8, v5

    .line 26
    .line 27
    if-eqz v8, :cond_1

    .line 28
    .line 29
    move v8, v7

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/4 v8, 0x0

    .line 32
    :goto_1
    const-wide v9, 0x1000000000L

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    and-long/2addr v9, v1

    .line 38
    cmp-long v9, v9, v5

    .line 39
    .line 40
    if-eqz v9, :cond_2

    .line 41
    .line 42
    move v9, v7

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    const/4 v9, 0x0

    .line 45
    :goto_2
    const-wide/16 v10, 0x10

    .line 46
    .line 47
    and-long/2addr v10, v1

    .line 48
    cmp-long v10, v10, v5

    .line 49
    .line 50
    if-eqz v10, :cond_3

    .line 51
    .line 52
    move v10, v7

    .line 53
    goto :goto_3

    .line 54
    :cond_3
    const/4 v10, 0x0

    .line 55
    :goto_3
    const-wide/16 v11, 0x100

    .line 56
    .line 57
    and-long/2addr v11, v1

    .line 58
    cmp-long v11, v11, v5

    .line 59
    .line 60
    if-eqz v11, :cond_4

    .line 61
    .line 62
    move v11, v7

    .line 63
    goto :goto_4

    .line 64
    :cond_4
    const/4 v11, 0x0

    .line 65
    :goto_4
    const-wide/16 v12, 0x80

    .line 66
    .line 67
    and-long/2addr v12, v1

    .line 68
    cmp-long v12, v12, v5

    .line 69
    .line 70
    if-eqz v12, :cond_5

    .line 71
    .line 72
    move v12, v7

    .line 73
    goto :goto_5

    .line 74
    :cond_5
    const/4 v12, 0x0

    .line 75
    :goto_5
    const-wide/32 v13, 0x400000

    .line 76
    .line 77
    .line 78
    and-long/2addr v13, v1

    .line 79
    cmp-long v13, v13, v5

    .line 80
    .line 81
    if-eqz v13, :cond_6

    .line 82
    .line 83
    move v13, v7

    .line 84
    goto :goto_6

    .line 85
    :cond_6
    const/4 v13, 0x0

    .line 86
    :goto_6
    const-wide/16 v14, 0x804

    .line 87
    .line 88
    and-long/2addr v14, v1

    .line 89
    cmp-long v14, v14, v5

    .line 90
    .line 91
    if-eqz v14, :cond_7

    .line 92
    .line 93
    move v14, v7

    .line 94
    goto :goto_7

    .line 95
    :cond_7
    const/4 v14, 0x0

    .line 96
    :goto_7
    const-wide/16 v15, 0x1

    .line 97
    .line 98
    and-long/2addr v15, v1

    .line 99
    cmp-long v15, v15, v5

    .line 100
    .line 101
    if-eqz v15, :cond_8

    .line 102
    .line 103
    move v15, v7

    .line 104
    goto :goto_8

    .line 105
    :cond_8
    const/4 v15, 0x0

    .line 106
    :goto_8
    const-wide/32 v16, 0x2000000

    .line 107
    .line 108
    .line 109
    and-long v16, v1, v16

    .line 110
    .line 111
    cmp-long v16, v16, v5

    .line 112
    .line 113
    if-eqz v16, :cond_9

    .line 114
    .line 115
    move v4, v7

    .line 116
    goto :goto_9

    .line 117
    :cond_9
    const/4 v4, 0x0

    .line 118
    :goto_9
    const-wide v17, 0x100000000L

    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    and-long v17, v1, v17

    .line 124
    .line 125
    cmp-long v17, v17, v5

    .line 126
    .line 127
    if-eqz v17, :cond_a

    .line 128
    .line 129
    move-wide/from16 v17, v5

    .line 130
    .line 131
    move v5, v7

    .line 132
    goto :goto_a

    .line 133
    :cond_a
    move-wide/from16 v17, v5

    .line 134
    .line 135
    const/4 v5, 0x0

    .line 136
    :goto_a
    invoke-direct {v0, v7, v3}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 137
    .line 138
    .line 139
    const/4 v3, 0x2

    .line 140
    invoke-direct {v0, v3, v8}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 141
    .line 142
    .line 143
    const/4 v3, 0x4

    .line 144
    invoke-direct {v0, v3, v9}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 145
    .line 146
    .line 147
    const/16 v3, 0x8

    .line 148
    .line 149
    invoke-direct {v0, v3, v10}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 150
    .line 151
    .line 152
    const/16 v3, 0x80

    .line 153
    .line 154
    invoke-direct {v0, v3, v11}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 155
    .line 156
    .line 157
    const/16 v3, 0x100

    .line 158
    .line 159
    invoke-direct {v0, v3, v12}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 160
    .line 161
    .line 162
    const/16 v3, 0x200

    .line 163
    .line 164
    invoke-direct {v0, v3, v13}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 165
    .line 166
    .line 167
    const/16 v3, 0x400

    .line 168
    .line 169
    invoke-direct {v0, v3, v14}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 170
    .line 171
    .line 172
    const/16 v3, 0x800

    .line 173
    .line 174
    invoke-direct {v0, v3, v15}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 175
    .line 176
    .line 177
    const/16 v3, 0x1000

    .line 178
    .line 179
    invoke-direct {v0, v3, v4}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 180
    .line 181
    .line 182
    const v3, 0x8000

    .line 183
    .line 184
    .line 185
    invoke-direct {v0, v3, v5}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 186
    .line 187
    .line 188
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->L:Landroid/widget/ImageView;

    .line 189
    .line 190
    if-eqz v3, :cond_c

    .line 191
    .line 192
    const-wide/16 v4, 0x20

    .line 193
    .line 194
    and-long/2addr v1, v4

    .line 195
    cmp-long v1, v1, v17

    .line 196
    .line 197
    if-eqz v1, :cond_b

    .line 198
    .line 199
    move v4, v7

    .line 200
    goto :goto_b

    .line 201
    :cond_b
    const/4 v4, 0x0

    .line 202
    :goto_b
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setLongClickable(Z)V

    .line 203
    .line 204
    .line 205
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/M0;->a1()V

    .line 206
    .line 207
    .line 208
    :cond_c
    return-void
.end method

.method static bridge synthetic N(Lcom/android/launcher3/taskbar/M0;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->I:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic O(Lcom/android/launcher3/taskbar/M0;)Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->V:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private O0(Landroid/view/View;Lcom/android/launcher3/taskbar/l3;)V
    .locals 7

    .line 1
    new-instance v4, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {v2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    new-instance v3, Lcom/android/launcher3/taskbar/C0;

    .line 13
    .line 14
    invoke-direct {v3, p2, v2}, Lcom/android/launcher3/taskbar/C0;-><init>(Lcom/android/launcher3/taskbar/l3;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/android/launcher3/taskbar/D0;

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    move-object v5, p1

    .line 21
    move-object v6, p2

    .line 22
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/D0;-><init>(Lcom/android/launcher3/taskbar/M0;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Runnable;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/launcher3/taskbar/l3;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v5, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Lcom/android/launcher3/taskbar/E0;

    .line 29
    .line 30
    invoke-direct {p0, v6}, Lcom/android/launcher3/taskbar/E0;-><init>(Lcom/android/launcher3/taskbar/l3;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v5, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method static bridge synthetic P(Lcom/android/launcher3/taskbar/M0;)Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    return-object p0
.end method

.method private R(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;II)Landroid/widget/ImageView;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p3, p5, p6}, Lcom/android/launcher3/taskbar/M0;->S(Landroid/view/ViewGroup;II)Landroid/widget/ImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    invoke-virtual {p5, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p4, p2}, Lcom/android/launcher3/taskbar/l3;->f(I)I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p5, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, LG2/c;->j()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    if-ne p2, p1, :cond_0

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-direct {p0, p5, p2}, Lcom/android/launcher3/taskbar/M0;->U0(Landroid/view/View;Landroid/view/View$AccessibilityDelegate;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p5, p4}, Lcom/android/launcher3/taskbar/M0;->O0(Landroid/view/View;Lcom/android/launcher3/taskbar/l3;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p5, p1}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 40
    .line 41
    .line 42
    return-object p5

    .line 43
    :cond_0
    new-instance p0, Lcom/android/launcher3/taskbar/z0;

    .line 44
    .line 45
    invoke-direct {p0, p4, p2}, Lcom/android/launcher3/taskbar/z0;-><init>(Lcom/android/launcher3/taskbar/l3;I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Lcom/android/launcher3/taskbar/A0;

    .line 52
    .line 53
    invoke-direct {p0, p4, p2}, Lcom/android/launcher3/taskbar/A0;-><init>(Lcom/android/launcher3/taskbar/l3;I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p5, p0}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 57
    .line 58
    .line 59
    new-instance p0, Lcom/android/launcher3/taskbar/B0;

    .line 60
    .line 61
    invoke-direct {p0, p5}, Lcom/android/launcher3/taskbar/B0;-><init>(Landroid/widget/ImageView;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p5, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 65
    .line 66
    .line 67
    return-object p5
.end method

.method private S(Landroid/view/ViewGroup;II)Landroid/widget/ImageView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p3, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    check-cast p3, Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setId(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->i:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-object p3
.end method

.method private U(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/ImageView;

    .line 18
    .line 19
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    instance-of v2, v1, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    check-cast v1, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->h0()Lcom/android/launcher3/anim/d;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;->setDarkIntensity(F)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method

.method private U0(Landroid/view/View;Landroid/view/View$AccessibilityDelegate;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/M0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/taskbar/M0$b;-><init>(Lcom/android/launcher3/taskbar/M0;Landroid/view/View$AccessibilityDelegate;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private V()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 17
    .line 18
    iget v3, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 19
    .line 20
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 21
    .line 22
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    invoke-virtual {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;->b(IZ)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method private W()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->w:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->w:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private W0(I)Z
    .locals 1

    .line 1
    and-int/lit8 v0, p1, 0x20

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    and-int/lit8 v0, p1, 0x40

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    :cond_0
    and-int/lit16 p1, p1, 0x80

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private Y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->w:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->w:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private static Z0(Landroid/view/View;Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0704e8

    .line 10
    .line 11
    .line 12
    invoke-direct {p1, v0, p0, v1}, Lcom/android/systemui/shared/navigationbar/KeyButtonRipple;-><init>(Landroid/content/Context;Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const p1, 0x7f081920

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private a1()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 4
    .line 5
    .line 6
    move-result v10

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    xor-int/lit8 v9, v0, 0x1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->Z0()Z

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    sget-boolean v1, Lf1/a;->g:Z

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    sget-object v1, Lcom/android/launcher3/taskbar/navbutton/c;->a:Lcom/android/launcher3/taskbar/navbutton/c$a;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->S:Landroid/widget/ImageView;

    .line 42
    .line 43
    iget-object v5, p0, Lcom/android/launcher3/taskbar/M0;->L:Landroid/widget/ImageView;

    .line 44
    .line 45
    iget-object v6, p0, Lcom/android/launcher3/taskbar/M0;->Y:Landroid/widget/Space;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 50
    .line 51
    .line 52
    move-result v11

    .line 53
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->m:Lcom/android/launcher3/util/window/d;

    .line 54
    .line 55
    iget-object v12, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 56
    .line 57
    invoke-virtual {v0, v12}, Lcom/android/launcher3/util/window/d;->getRotation(Landroid/content/Context;)I

    .line 58
    .line 59
    .line 60
    move-result v12

    .line 61
    invoke-virtual/range {v1 .. v12}, Lcom/android/launcher3/taskbar/navbutton/c$a;->a(Lcom/android/launcher3/h0;Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;Landroid/content/res/Resources;ZZZZI)Lcom/android/launcher3/taskbar/navbutton/c$b;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->o0()Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/taskbar/navbutton/c$b;->a(Lcom/android/launcher3/taskbar/I1;Z)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->b1()V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->c1()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    if-nez v0, :cond_1

    .line 82
    .line 83
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->l0()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    const/high16 v0, -0x3d4c0000    # -90.0f

    .line 88
    .line 89
    const/4 v1, 0x0

    .line 90
    const/4 v3, 0x0

    .line 91
    if-eqz v8, :cond_2

    .line 92
    .line 93
    const v2, 0x7f070b9b

    .line 94
    .line 95
    .line 96
    invoke-virtual {v7, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    const v4, 0x7f070ba3

    .line 101
    .line 102
    .line 103
    invoke-virtual {v7, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    const v5, 0x7f070ba1

    .line 108
    .line 109
    .line 110
    invoke-virtual {v7, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    const v6, 0x7f070ba0

    .line 115
    .line 116
    .line 117
    invoke-virtual {v7, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    sub-int v8, v4, v2

    .line 122
    .line 123
    div-int/lit8 v8, v8, 0x2

    .line 124
    .line 125
    sub-int v2, v5, v2

    .line 126
    .line 127
    div-int/lit8 v2, v2, 0x2

    .line 128
    .line 129
    new-instance v9, Landroid/graphics/drawable/RotateDrawable;

    .line 130
    .line 131
    invoke-direct {v9}, Landroid/graphics/drawable/RotateDrawable;-><init>()V

    .line 132
    .line 133
    .line 134
    iget-object v10, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 135
    .line 136
    const v11, 0x7f080d7c

    .line 137
    .line 138
    .line 139
    invoke-virtual {v10, v11}, Landroid/view/ContextThemeWrapper;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 140
    .line 141
    .line 142
    move-result-object v10

    .line 143
    invoke-virtual {v9, v10}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v9, v1}, Landroid/graphics/drawable/RotateDrawable;->setFromDegrees(F)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v9, v0}, Landroid/graphics/drawable/RotateDrawable;->setToDegrees(F)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 153
    .line 154
    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 158
    .line 159
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 165
    .line 166
    invoke-virtual {v0, v8, v2, v8, v2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 170
    .line 171
    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object v9

    .line 175
    const v10, 0x7f080d7e

    .line 176
    .line 177
    .line 178
    invoke-virtual {v9, v10}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 179
    .line 180
    .line 181
    move-result-object v9

    .line 182
    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 191
    .line 192
    invoke-virtual {v0, v8, v2, v8, v2}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 193
    .line 194
    .line 195
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 196
    .line 197
    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 198
    .line 199
    .line 200
    const v1, 0x7f070b94

    .line 201
    .line 202
    .line 203
    invoke-virtual {v7, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    invoke-virtual {v0, v1, v3, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 211
    .line 212
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    .line 214
    .line 215
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 216
    .line 217
    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 218
    .line 219
    .line 220
    const v1, 0x7f070b6d

    .line 221
    .line 222
    .line 223
    invoke-virtual {v7, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    invoke-virtual {v0, v1, v3, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 228
    .line 229
    .line 230
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 231
    .line 232
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 233
    .line 234
    .line 235
    const v0, 0x3dcccccd    # 0.1f

    .line 236
    .line 237
    .line 238
    const/high16 v1, 0x3f800000    # 1.0f

    .line 239
    .line 240
    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(FFFF)I

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    new-instance v1, Landroid/graphics/drawable/PaintDrawable;

    .line 245
    .line 246
    invoke-direct {v1, v0}, Landroid/graphics/drawable/PaintDrawable;-><init>(I)V

    .line 247
    .line 248
    .line 249
    int-to-float v0, v6

    .line 250
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/PaintDrawable;->setCornerRadius(F)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 254
    .line 255
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 264
    .line 265
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 270
    .line 271
    invoke-virtual {v0}, Landroid/widget/FrameLayout$LayoutParams;->getMarginEnd()I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    div-int/lit8 v1, v1, 0x2

    .line 276
    .line 277
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0}, Landroid/widget/FrameLayout$LayoutParams;->getMarginStart()I

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 285
    .line 286
    .line 287
    const/16 v1, 0x11

    .line 288
    .line 289
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 290
    .line 291
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 292
    .line 293
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 294
    .line 295
    .line 296
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 297
    .line 298
    const/4 v0, 0x0

    .line 299
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 300
    .line 301
    .line 302
    return-void

    .line 303
    :cond_2
    if-eqz v10, :cond_7

    .line 304
    .line 305
    new-instance v4, Landroid/graphics/drawable/RotateDrawable;

    .line 306
    .line 307
    invoke-direct {v4}, Landroid/graphics/drawable/RotateDrawable;-><init>()V

    .line 308
    .line 309
    .line 310
    iget-object v5, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 311
    .line 312
    const v6, 0x7f080d7b

    .line 313
    .line 314
    .line 315
    invoke-virtual {v5, v6}, Landroid/view/ContextThemeWrapper;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v4, v1}, Landroid/graphics/drawable/RotateDrawable;->setFromDegrees(F)V

    .line 323
    .line 324
    .line 325
    iget-object v5, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 326
    .line 327
    invoke-virtual {v5}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 328
    .line 329
    .line 330
    move-result-object v5

    .line 331
    invoke-static {v5}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 332
    .line 333
    .line 334
    move-result v5

    .line 335
    if-eqz v5, :cond_3

    .line 336
    .line 337
    const/high16 v0, 0x42b40000    # 90.0f

    .line 338
    .line 339
    :cond_3
    invoke-virtual {v4, v0}, Landroid/graphics/drawable/RotateDrawable;->setToDegrees(F)V

    .line 340
    .line 341
    .line 342
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 343
    .line 344
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 345
    .line 346
    .line 347
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 348
    .line 349
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 354
    .line 355
    const v4, 0x800005

    .line 356
    .line 357
    .line 358
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 359
    .line 360
    const/4 v4, -0x2

    .line 361
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 362
    .line 363
    const/4 v4, -0x1

    .line 364
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 365
    .line 366
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 367
    .line 368
    iget v2, v2, Lcom/android/launcher3/F1;->T0:I

    .line 369
    .line 370
    invoke-virtual {v7, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 371
    .line 372
    .line 373
    move-result v2

    .line 374
    float-to-int v2, v2

    .line 375
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->q:Landroid/view/ViewGroup;

    .line 376
    .line 377
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getWidth()I

    .line 378
    .line 379
    .line 380
    move-result v4

    .line 381
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->o0()Z

    .line 382
    .line 383
    .line 384
    move-result v5

    .line 385
    if-eqz v5, :cond_4

    .line 386
    .line 387
    if-ge v2, v4, :cond_4

    .line 388
    .line 389
    const v4, 0x7f070b97

    .line 390
    .line 391
    .line 392
    invoke-virtual {v7, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 393
    .line 394
    .line 395
    move-result v4

    .line 396
    div-int/lit8 v4, v4, 0x2

    .line 397
    .line 398
    add-int/2addr v2, v4

    .line 399
    :cond_4
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 400
    .line 401
    .line 402
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 403
    .line 404
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 405
    .line 406
    .line 407
    const v0, 0x7f070b74

    .line 408
    .line 409
    .line 410
    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 415
    .line 416
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 417
    .line 418
    .line 419
    move-result v2

    .line 420
    if-ge v3, v2, :cond_7

    .line 421
    .line 422
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 423
    .line 424
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 429
    .line 430
    .line 431
    move-result-object v2

    .line 432
    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 433
    .line 434
    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 435
    .line 436
    if-nez v3, :cond_5

    .line 437
    .line 438
    div-int/lit8 v4, v0, 0x2

    .line 439
    .line 440
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 441
    .line 442
    .line 443
    goto :goto_1

    .line 444
    :cond_5
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 445
    .line 446
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 447
    .line 448
    .line 449
    move-result v4

    .line 450
    add-int/lit8 v4, v4, -0x1

    .line 451
    .line 452
    if-ne v3, v4, :cond_6

    .line 453
    .line 454
    div-int/lit8 v4, v0, 0x2

    .line 455
    .line 456
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 457
    .line 458
    .line 459
    goto :goto_1

    .line 460
    :cond_6
    div-int/lit8 v4, v0, 0x2

    .line 461
    .line 462
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 466
    .line 467
    .line 468
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 469
    .line 470
    goto :goto_0

    .line 471
    :cond_7
    return-void
.end method

.method private b1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->a1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->i:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroid/widget/ImageView;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->a1()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-static {v1, v2}, Lcom/android/launcher3/taskbar/M0;->Z0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    return-void
.end method

.method private c0(LN2/h;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, v0}, LN2/h;->e(Z)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->p2()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget v1, v0, Lcom/android/launcher3/h0;->j2:I

    .line 36
    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget p1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 40
    .line 41
    sub-int/2addr p1, v1

    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    sub-int/2addr p1, v0

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    int-to-float p1, v1

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    int-to-float v1, v1

    .line 59
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 62
    .line 63
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/W4;->b0()Landroid/graphics/Rect;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const/high16 v3, 0x40000000    # 2.0f

    .line 68
    .line 69
    if-eqz p1, :cond_4

    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    iget p1, v2, Landroid/graphics/Rect;->right:I

    .line 80
    .line 81
    int-to-float p1, p1

    .line 82
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 83
    .line 84
    int-to-float v0, v0

    .line 85
    add-float/2addr v0, p1

    .line 86
    sub-float/2addr v0, v1

    .line 87
    div-float p1, v0, v3

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLeft()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    :goto_0
    int-to-float p1, p1

    .line 97
    goto :goto_1

    .line 98
    :cond_4
    iget p1, v2, Landroid/graphics/Rect;->left:I

    .line 99
    .line 100
    int-to-float p1, p1

    .line 101
    sub-float/2addr p1, v1

    .line 102
    div-float/2addr p1, v3

    .line 103
    :goto_1
    float-to-int p1, p1

    .line 104
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLeft()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    sub-int/2addr p1, p0

    .line 111
    return p1
.end method

.method private c1()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/animation/ArgbEvaluator;->getInstance()Landroid/animation/ArgbEvaluator;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/M0;->f0(Landroid/animation/ArgbEvaluator;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sget-boolean v2, Lf1/a;->g:Z

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/M0;->g0(Landroid/animation/ArgbEvaluator;I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/M0;->U(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/l3;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/taskbar/l3;->t(IZ)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private d1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 4
    .line 5
    instance-of v1, v0, Lcom/android/launcher3/taskbar/V;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Lcom/android/launcher3/taskbar/V;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->C:Lcom/android/launcher3/anim/d;

    .line 12
    .line 13
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/taskbar/V;->s0(FI)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/M0;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->W0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static e0(I)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/StringJoiner;

    .line 2
    .line 3
    const-string v1, "|"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/StringJoiner;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    const-string v2, "FLAG_IME_SWITCHER_BUTTON_VISIBLE"

    .line 10
    .line 11
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    const-string v2, "FLAG_IME_VISIBLE"

    .line 16
    .line 17
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    const-string v2, "FLAG_BACK_DISMISS_IME"

    .line 22
    .line 23
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 v1, 0x8

    .line 27
    .line 28
    const-string v2, "FLAG_A11Y_VISIBLE"

    .line 29
    .line 30
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/16 v1, 0x10

    .line 34
    .line 35
    const-string v2, "FLAG_ONLY_BACK_FOR_BOUNCER_VISIBLE"

    .line 36
    .line 37
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/16 v1, 0x20

    .line 41
    .line 42
    const-string v2, "FLAG_KEYGUARD_VISIBLE"

    .line 43
    .line 44
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/16 v1, 0x40

    .line 48
    .line 49
    const-string v2, "FLAG_KEYGUARD_OCCLUDED"

    .line 50
    .line 51
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/16 v1, 0x80

    .line 55
    .line 56
    const-string v2, "FLAG_DISABLE_HOME"

    .line 57
    .line 58
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const/16 v1, 0x100

    .line 62
    .line 63
    const-string v2, "FLAG_DISABLE_RECENTS"

    .line 64
    .line 65
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const/16 v1, 0x200

    .line 69
    .line 70
    const-string v2, "FLAG_DISABLE_BACK"

    .line 71
    .line 72
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    const/16 v1, 0x400

    .line 76
    .line 77
    const-string v2, "FLAG_NOTIFICATION_SHADE_EXPANDED"

    .line 78
    .line 79
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/16 v1, 0x800

    .line 83
    .line 84
    const-string v2, "FLAG_SCREEN_PINNING_ACTIVE"

    .line 85
    .line 86
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const/16 v1, 0x1000

    .line 90
    .line 91
    const-string v2, "FLAG_VOICE_INTERACTION_WINDOW_SHOWING"

    .line 92
    .line 93
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    const v1, 0x8000

    .line 97
    .line 98
    .line 99
    const-string v2, "FLAG_KEYBOARD_SHORTCUT_HELPER_SHOWING"

    .line 100
    .line 101
    invoke-static {v0, p0, v1, v2}, Lcom/android/launcher3/util/n0;->a(Ljava/util/StringJoiner;IILjava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/util/StringJoiner;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->H0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f0(Landroid/animation/ArgbEvaluator;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->h0()Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    iget v1, p0, Lcom/android/launcher3/taskbar/M0;->s:I

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget p0, p0, Lcom/android/launcher3/taskbar/M0;->t:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, v0, v1, p0}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method private f1(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget p2, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 4
    .line 5
    or-int/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget p2, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 10
    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, p2

    .line 13
    iput p1, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/l3;Landroid/view/View;)Z
    .locals 1

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/l3;->n(ILandroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private g0(Landroid/animation/ArgbEvaluator;I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->G:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->E:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 8
    .line 9
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->F:Lcom/android/launcher3/anim/d;

    .line 10
    .line 11
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 12
    .line 13
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    mul-float/2addr v0, v1

    .line 18
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget p0, p0, Lcom/android/launcher3/taskbar/M0;->u:I

    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, v0, p2, p0}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public static synthetic h(Lcom/android/launcher3/taskbar/l3;Landroid/view/View;)V
    .locals 1

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/taskbar/l3;->m(ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/taskbar/M0;)[F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->w0()[F

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j(I)Z
    .locals 1

    .line 1
    and-int/lit8 v0, p0, 0x20

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    and-int/lit16 p0, p0, 0x800

    .line 6
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

.method public static synthetic k(Landroid/widget/ImageView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->performHapticFeedback(I)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static synthetic l(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->z0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l0()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 36
    .line 37
    .line 38
    const v5, 0x800003

    .line 39
    .line 40
    .line 41
    iput v5, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 42
    .line 43
    iget-object v5, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 44
    .line 45
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 46
    .line 47
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/I1;->B0()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    invoke-virtual {v5, v6}, Lcom/android/launcher3/taskbar/I1;->m2(I)V

    .line 52
    .line 53
    .line 54
    iget-boolean v5, v3, Lcom/android/launcher3/h0;->G0:Z

    .line 55
    .line 56
    if-eqz v5, :cond_1

    .line 57
    .line 58
    iget-boolean v5, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 59
    .line 60
    if-nez v5, :cond_2

    .line 61
    .line 62
    :cond_1
    iget v5, v3, Lcom/android/launcher3/h0;->Y0:F

    .line 63
    .line 64
    float-to-double v6, v5

    .line 65
    const-wide v8, 0x3fee666666666666L    # 0.95

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    cmpl-double v6, v6, v8

    .line 71
    .line 72
    if-lez v6, :cond_3

    .line 73
    .line 74
    float-to-double v5, v5

    .line 75
    const-wide v7, 0x3ff0cccccccccccdL    # 1.05

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    cmpg-double v5, v5, v7

    .line 81
    .line 82
    if-gez v5, :cond_3

    .line 83
    .line 84
    :cond_2
    const v3, 0x7f070b70

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 92
    .line 93
    .line 94
    const v3, 0x7f070b6e

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 102
    .line 103
    const v3, 0x7f070b6f

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    const v5, 0x7f070b7a

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 121
    .line 122
    .line 123
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->N0:Z

    .line 124
    .line 125
    if-nez v3, :cond_4

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_4
    const v3, 0x7f070ba2

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    div-int/lit8 v3, v3, 0x2

    .line 136
    .line 137
    sub-int v4, v5, v3

    .line 138
    .line 139
    :goto_0
    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 140
    .line 141
    const v3, 0x7f070b79

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 149
    .line 150
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 151
    .line 152
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 156
    .line 157
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/taskbar/M0;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/taskbar/M0;->C0(Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/taskbar/M0;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Runnable;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/launcher3/taskbar/l3;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/android/launcher3/taskbar/M0;->B0(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Runnable;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/launcher3/taskbar/l3;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private n0(Landroid/view/ViewGroup;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;)V
    .locals 14

    .line 1
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    iget-object v4, v0, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 6
    .line 7
    const v5, 0x7f0b00f4

    .line 8
    .line 9
    .line 10
    const v1, 0x7f080d7b

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    move-object v0, p0

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0;->Q(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;I)Landroid/widget/ImageView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 20
    .line 21
    new-instance v1, Lcom/android/launcher3/util/B1;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 24
    .line 25
    const/4 v6, 0x3

    .line 26
    invoke-direct {v1, v2, v6}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/android/launcher3/taskbar/M0;->P:Lcom/android/launcher3/util/B1;

    .line 30
    .line 31
    const/4 v7, 0x1

    .line 32
    invoke-virtual {v1, v7}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 36
    .line 37
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->P:Lcom/android/launcher3/util/B1;

    .line 40
    .line 41
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    new-instance v4, Lcom/android/launcher3/taskbar/m0;

    .line 46
    .line 47
    invoke-direct {v4, p0}, Lcom/android/launcher3/taskbar/m0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/util/v1$c;Ljava/util/function/IntPredicate;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/M0;->K:Z

    .line 57
    .line 58
    const/4 v2, 0x2

    .line 59
    if-eqz v1, :cond_0

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 62
    .line 63
    new-instance v3, Lcom/android/launcher3/taskbar/M0$e;

    .line 64
    .line 65
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->P:Lcom/android/launcher3/util/B1;

    .line 66
    .line 67
    invoke-virtual {v4, v2}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    new-instance v5, Lcom/android/launcher3/taskbar/p0;

    .line 72
    .line 73
    invoke-direct {v5}, Lcom/android/launcher3/taskbar/p0;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-direct {v3, v4, v5}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/util/v1$c;Ljava/util/function/IntPredicate;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 83
    .line 84
    new-instance v8, Lcom/android/launcher3/taskbar/M0$e;

    .line 85
    .line 86
    iget-object v9, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 87
    .line 88
    new-instance v10, Lcom/android/launcher3/taskbar/q0;

    .line 89
    .line 90
    invoke-direct {v10}, Lcom/android/launcher3/taskbar/q0;-><init>()V

    .line 91
    .line 92
    .line 93
    sget-object v11, Lcom/android/launcher3/G2;->m:Landroid/util/FloatProperty;

    .line 94
    .line 95
    const/high16 v12, 0x3f800000    # 1.0f

    .line 96
    .line 97
    const/4 v13, 0x0

    .line 98
    invoke-direct/range {v8 .. v13}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 105
    .line 106
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const v3, 0x7f070ba2

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 118
    .line 119
    invoke-virtual {v3}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-static {v3}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 128
    .line 129
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    if-nez v4, :cond_2

    .line 134
    .line 135
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 136
    .line 137
    new-instance v8, Lcom/android/launcher3/taskbar/M0$e;

    .line 138
    .line 139
    iget-object v9, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 140
    .line 141
    new-instance v10, Lcom/android/launcher3/taskbar/r0;

    .line 142
    .line 143
    invoke-direct {v10, p0}, Lcom/android/launcher3/taskbar/r0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 144
    .line 145
    .line 146
    sget-object v11, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 147
    .line 148
    if-eqz v3, :cond_1

    .line 149
    .line 150
    const/4 v2, -0x2

    .line 151
    :cond_1
    mul-int/2addr v1, v2

    .line 152
    int-to-float v12, v1

    .line 153
    const/4 v13, 0x0

    .line 154
    invoke-direct/range {v8 .. v13}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    :cond_2
    const/4 v2, 0x2

    .line 161
    const v5, 0x7f0b02d7

    .line 162
    .line 163
    .line 164
    const v1, 0x7f080d7d

    .line 165
    .line 166
    .line 167
    move-object v0, p0

    .line 168
    move-object v3, p1

    .line 169
    move-object/from16 v4, p3

    .line 170
    .line 171
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0;->Q(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;I)Landroid/widget/ImageView;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    iput-object v1, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 176
    .line 177
    new-instance v1, Lcom/android/launcher3/util/B1;

    .line 178
    .line 179
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 180
    .line 181
    invoke-direct {v1, v2, v6}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    .line 182
    .line 183
    .line 184
    iput-object v1, p0, Lcom/android/launcher3/taskbar/M0;->Q:Lcom/android/launcher3/util/B1;

    .line 185
    .line 186
    invoke-virtual {v1, v7}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 190
    .line 191
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 192
    .line 193
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->Q:Lcom/android/launcher3/util/B1;

    .line 194
    .line 195
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    new-instance v4, Lcom/android/launcher3/taskbar/s0;

    .line 200
    .line 201
    invoke-direct {v4, p0}, Lcom/android/launcher3/taskbar/s0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 202
    .line 203
    .line 204
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/util/v1$c;Ljava/util/function/IntPredicate;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    const/4 v2, 0x4

    .line 211
    const v5, 0x7f0b04bc

    .line 212
    .line 213
    .line 214
    const v1, 0x7f080d81

    .line 215
    .line 216
    .line 217
    move-object v3, p1

    .line 218
    move-object/from16 v4, p3

    .line 219
    .line 220
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0;->Q(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;I)Landroid/widget/ImageView;

    .line 221
    .line 222
    .line 223
    move-result-object v7

    .line 224
    iput-object v7, p0, Lcom/android/launcher3/taskbar/M0;->X:Landroid/widget/ImageView;

    .line 225
    .line 226
    iget-object v6, p0, Lcom/android/launcher3/taskbar/M0;->W:Lcom/android/launcher3/taskbar/R0;

    .line 227
    .line 228
    iget-object v8, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 229
    .line 230
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 231
    .line 232
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 233
    .line 234
    .line 235
    move-result-object v9

    .line 236
    new-instance v10, Lcom/android/launcher3/taskbar/t0;

    .line 237
    .line 238
    invoke-direct {v10, p0}, Lcom/android/launcher3/taskbar/t0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 239
    .line 240
    .line 241
    new-instance v11, Landroid/os/Handler;

    .line 242
    .line 243
    invoke-direct {v11}, Landroid/os/Handler;-><init>()V

    .line 244
    .line 245
    .line 246
    invoke-virtual/range {v6 .. v11}, Lcom/android/launcher3/taskbar/R0;->c(Landroid/view/View;Landroid/view/View;Lcom/android/launcher3/h0;Ljava/util/function/Supplier;Landroid/os/Handler;)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->X:Landroid/widget/ImageView;

    .line 250
    .line 251
    new-instance v1, Lcom/android/launcher3/taskbar/u0;

    .line 252
    .line 253
    invoke-direct {v1, p0, v4}, Lcom/android/launcher3/taskbar/u0;-><init>(Lcom/android/launcher3/taskbar/M0;Lcom/android/launcher3/taskbar/l3;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    .line 258
    .line 259
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 260
    .line 261
    new-instance v1, Lcom/android/launcher3/taskbar/M0$e;

    .line 262
    .line 263
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->X:Landroid/widget/ImageView;

    .line 264
    .line 265
    new-instance v3, Lcom/android/launcher3/taskbar/v0;

    .line 266
    .line 267
    invoke-direct {v3, p0}, Lcom/android/launcher3/taskbar/v0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 268
    .line 269
    .line 270
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Landroid/view/View;Ljava/util/function/IntPredicate;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    const v5, 0x7f0b0014

    .line 277
    .line 278
    .line 279
    const v6, 0x7f0e022c

    .line 280
    .line 281
    .line 282
    const v1, 0x7f080d7a

    .line 283
    .line 284
    .line 285
    const/16 v2, 0x10

    .line 286
    .line 287
    move-object/from16 v3, p2

    .line 288
    .line 289
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/M0;->R(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;II)Landroid/widget/ImageView;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0;->L:Landroid/widget/ImageView;

    .line 294
    .line 295
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 296
    .line 297
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 298
    .line 299
    new-instance v3, Lcom/android/launcher3/taskbar/w0;

    .line 300
    .line 301
    invoke-direct {v3}, Lcom/android/launcher3/taskbar/w0;-><init>()V

    .line 302
    .line 303
    .line 304
    invoke-direct {v2, p1, v3}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Landroid/view/View;Ljava/util/function/IntPredicate;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    new-instance p1, Landroid/widget/Space;

    .line 311
    .line 312
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 313
    .line 314
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-direct {p1, v1}, Landroid/widget/Space;-><init>(Landroid/content/Context;)V

    .line 319
    .line 320
    .line 321
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0;->Y:Landroid/widget/Space;

    .line 322
    .line 323
    new-instance v1, Lcom/android/launcher3/taskbar/x0;

    .line 324
    .line 325
    invoke-direct {v1, v4}, Lcom/android/launcher3/taskbar/x0;-><init>(Lcom/android/launcher3/taskbar/l3;)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {p1, v1}, Landroid/widget/Space;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 329
    .line 330
    .line 331
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->Y:Landroid/widget/Space;

    .line 332
    .line 333
    new-instance p1, Lcom/android/launcher3/taskbar/o0;

    .line 334
    .line 335
    invoke-direct {p1, v4}, Lcom/android/launcher3/taskbar/o0;-><init>(Lcom/android/launcher3/taskbar/l3;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {p0, p1}, Landroid/widget/Space;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 339
    .line 340
    .line 341
    return-void
.end method

.method public static synthetic o(Lcom/android/launcher3/taskbar/M0;Lcom/android/launcher3/taskbar/l3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/M0;->x0(Lcom/android/launcher3/taskbar/l3;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private o0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 10
    .line 11
    and-int/lit8 p0, p0, 0x8

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static synthetic p(Lcom/android/launcher3/taskbar/M0;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->v0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic q(Lcom/android/launcher3/taskbar/M0;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->u0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic r(Lcom/android/launcher3/taskbar/M0;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->y0(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic s(Lcom/android/launcher3/taskbar/l3;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/l3;->m(ILandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Lcom/android/launcher3/taskbar/M0;Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->F0(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x2

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic u0(I)Z
    .locals 4

    .line 1
    and-int/lit8 v0, p1, 0x20

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    and-int/lit8 v3, p1, 0x10

    .line 8
    .line 9
    if-nez v3, :cond_1

    .line 10
    .line 11
    and-int/lit8 v3, p1, 0x40

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v3, v2

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    move v3, v1

    .line 19
    :goto_1
    and-int/lit16 p1, p1, 0x200

    .line 20
    .line 21
    if-nez p1, :cond_4

    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_4

    .line 38
    .line 39
    :cond_2
    if-eqz v0, :cond_3

    .line 40
    .line 41
    if-eqz v3, :cond_4

    .line 42
    .line 43
    :cond_3
    return v1

    .line 44
    :cond_4
    return v2
.end method

.method public static synthetic v(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x4

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic v0(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    and-int/lit8 v0, p1, 0x10

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    and-int/lit8 v0, p1, 0x20

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->W0(I)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static synthetic w(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x20

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic w0()[F
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->X:Landroid/widget/ImageView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v1, p0, v0, v2}, Lcom/android/launcher3/N5;->m(Landroid/view/View;Landroid/view/View;[FZ)F

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static synthetic x(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x2

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic x0(Lcom/android/launcher3/taskbar/l3;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p1, v0, p2}, Lcom/android/launcher3/taskbar/l3;->m(ILandroid/view/View;)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->W:Lcom/android/launcher3/taskbar/R0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/R0;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic y(Lcom/android/launcher3/taskbar/l3;ILandroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/l3;->n(ILandroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic y0(I)Z
    .locals 1

    .line 1
    and-int/lit8 v0, p1, 0x20

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    and-int/lit16 p1, p1, 0x100

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->Z0()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static synthetic z(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x8

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private synthetic z0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/e4;->setAutoDim(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public D0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->T:Z

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
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->T:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/I1;->f2(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public E0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->T:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->K:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 12
    .line 13
    new-instance v1, Lcom/android/launcher3/taskbar/M0$c;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/M0$c;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/M0;->T:Z

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 43
    .line 44
    const/16 v1, 0x7e8

    .line 45
    .line 46
    const-string v2, "Taskbar Nav Buttons"

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/I1;->createDefaultWindowLayoutParams(ILjava/lang/String;)Landroid/view/WindowManager$LayoutParams;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 55
    .line 56
    invoke-virtual {v1, p0, v0}, Lcom/android/launcher3/taskbar/I1;->Z(Landroid/view/View;Landroid/view/WindowManager$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public G0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->R:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->onConfigurationChanged(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->l0()V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->a1()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public I0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/RotationButtonController;->unregisterListeners()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->R:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->hide()Z

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->D0()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->q:Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->r:Landroid/view/ViewGroup;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->i:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public J0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/W4;->b0()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->H0:Z

    .line 16
    .line 17
    if-nez v1, :cond_2

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->x:LN2/h;

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->z:Ljava/util/Optional;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/android/launcher3/taskbar/bubbles/m0;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/android/launcher3/taskbar/bubbles/m0;->b:Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/bubbles/g0;->d0()LN2/h;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/android/launcher3/taskbar/M0;->x:LN2/h;

    .line 65
    .line 66
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->x:LN2/h;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/M0;->b(LN2/h;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_0
    return-void
.end method

.method public K0(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/M0;->a0:I

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->X()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public L0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->d1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->e1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public N0(Landroid/view/View$AccessibilityDelegate;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, LG2/c;->j()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/taskbar/M0;->U0(Landroid/view/View;Landroid/view/View$AccessibilityDelegate;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->N:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public P0(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->V()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected Q(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;I)Landroid/widget/ImageView;
    .locals 7

    .line 1
    const v6, 0x7f0e0234

    .line 2
    .line 3
    .line 4
    move-object v0, p0

    .line 5
    move v1, p1

    .line 6
    move v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move v5, p5

    .line 10
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/taskbar/M0;->R(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;II)Landroid/widget/ImageView;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public Q0(Landroid/view/View$AccessibilityDelegate;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->O:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public R0(ZZ)V
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    goto :goto_1

    .line 8
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 9
    :goto_1
    const/16 v0, 0x20

    .line 10
    .line 11
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 12
    .line 13
    .line 14
    const/16 p1, 0x40

    .line 15
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->V()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public S0(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x4000

    .line 2
    .line 3
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->V()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public T(Lcom/android/launcher3/views/BaseDragLayer;Landroid/graphics/Region;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/views/BaseDragLayer<",
            "*>;",
            "Landroid/graphics/Region;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_2

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->i:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/taskbar/M0;->g:Landroid/graphics/Rect;

    .line 25
    .line 26
    invoke-virtual {p1, v2, v3}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->W:Lcom/android/launcher3/taskbar/R0;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/R0;->b()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->g:Landroid/graphics/Rect;

    .line 38
    .line 39
    iget v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 40
    .line 41
    iget-object v4, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Lcom/android/launcher3/h0;->J0()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    add-int/2addr v3, v4

    .line 52
    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->g:Landroid/graphics/Rect;

    .line 55
    .line 56
    sget-object v3, Landroid/graphics/Region$Op;->UNION:Landroid/graphics/Region$Op;

    .line 57
    .line 58
    invoke-virtual {p2, v2, v3}, Landroid/graphics/Region;->op(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 59
    .line 60
    .line 61
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void
.end method

.method public T0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/e4;->h(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method protected V0()V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 6
    .line 7
    .line 8
    move-result v6

    .line 9
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 12
    .line 13
    .line 14
    move-result v7

    .line 15
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->B0()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-static {v1, v8, v7, v3}, Lcom/android/launcher3/util/M;->a(Lcom/android/launcher3/h0;Landroid/content/res/Resources;ZZ)Landroid/graphics/Point;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 46
    .line 47
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget v4, v1, Landroid/graphics/Point;->x:I

    .line 52
    .line 53
    iput v4, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 54
    .line 55
    iget-object v4, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 56
    .line 57
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-nez v4, :cond_0

    .line 62
    .line 63
    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 67
    .line 68
    iput v1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 69
    .line 70
    :goto_0
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 71
    .line 72
    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Landroid/inputmethodservice/InputMethodService;->canImeRenderGesturalNavButtons()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    const/4 v9, 0x0

    .line 80
    const/4 v10, 0x1

    .line 81
    if-eqz v1, :cond_1

    .line 82
    .line 83
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->M0()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_1

    .line 90
    .line 91
    move v1, v10

    .line 92
    goto :goto_1

    .line 93
    :cond_1
    move v1, v9

    .line 94
    :goto_1
    iput-boolean v1, v0, Lcom/android/launcher3/taskbar/M0;->K:Z

    .line 95
    .line 96
    if-nez v1, :cond_4

    .line 97
    .line 98
    invoke-static {}, Landroid/view/inputmethod/Flags;->imeSwitcherRevamp()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    const v1, 0x1080459

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    const v1, 0x7f080d32

    .line 109
    .line 110
    .line 111
    :goto_2
    if-eqz v6, :cond_3

    .line 112
    .line 113
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->r:Landroid/view/ViewGroup;

    .line 114
    .line 115
    :goto_3
    move-object v3, v2

    .line 116
    goto :goto_4

    .line 117
    :cond_3
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->q:Landroid/view/ViewGroup;

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :goto_4
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 121
    .line 122
    iget-object v4, v2, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 123
    .line 124
    const v5, 0x7f0b031a

    .line 125
    .line 126
    .line 127
    const/16 v2, 0x8

    .line 128
    .line 129
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0;->Q(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;I)Landroid/widget/ImageView;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, v0, Lcom/android/launcher3/taskbar/M0;->S:Landroid/widget/ImageView;

    .line 134
    .line 135
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 136
    .line 137
    new-instance v3, Lcom/android/launcher3/taskbar/M0$e;

    .line 138
    .line 139
    new-instance v4, Lcom/android/launcher3/taskbar/J0;

    .line 140
    .line 141
    invoke-direct {v4, v7}, Lcom/android/launcher3/taskbar/J0;-><init>(Z)V

    .line 142
    .line 143
    .line 144
    invoke-direct {v3, v1, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Landroid/view/View;Ljava/util/function/IntPredicate;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    :cond_4
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 151
    .line 152
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 153
    .line 154
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 155
    .line 156
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 157
    .line 158
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/W4;->S()Lcom/android/launcher3/util/v1;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v3, v10}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    new-instance v4, Lcom/android/launcher3/taskbar/L0;

    .line 167
    .line 168
    invoke-direct {v4}, Lcom/android/launcher3/taskbar/L0;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/util/v1$c;Ljava/util/function/IntPredicate;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 178
    .line 179
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 180
    .line 181
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 182
    .line 183
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 184
    .line 185
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/W4;->S()Lcom/android/launcher3/util/v1;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    const/4 v4, 0x6

    .line 190
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    new-instance v4, Lcom/android/launcher3/taskbar/d0;

    .line 195
    .line 196
    invoke-direct {v4}, Lcom/android/launcher3/taskbar/d0;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/util/v1$c;Ljava/util/function/IntPredicate;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    if-nez v7, :cond_5

    .line 206
    .line 207
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 208
    .line 209
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 210
    .line 211
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 212
    .line 213
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 214
    .line 215
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/s2;->p()Lcom/android/launcher3/anim/d;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    new-instance v4, Lcom/android/launcher3/taskbar/e0;

    .line 220
    .line 221
    invoke-direct {v4}, Lcom/android/launcher3/taskbar/e0;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/anim/d;Ljava/util/function/IntPredicate;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    :cond_5
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->G:Lcom/android/launcher3/anim/d;

    .line 231
    .line 232
    const/high16 v2, 0x3f800000    # 1.0f

    .line 233
    .line 234
    iput v2, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 235
    .line 236
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 237
    .line 238
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->k1()Z

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    if-nez v1, :cond_6

    .line 243
    .line 244
    iget-boolean v1, v0, Lcom/android/launcher3/taskbar/M0;->v:Z

    .line 245
    .line 246
    if-nez v1, :cond_6

    .line 247
    .line 248
    move v1, v10

    .line 249
    goto :goto_5

    .line 250
    :cond_6
    move v1, v9

    .line 251
    :goto_5
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 252
    .line 253
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->Z0()Z

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-nez v6, :cond_8

    .line 258
    .line 259
    if-eqz v1, :cond_7

    .line 260
    .line 261
    goto :goto_6

    .line 262
    :cond_7
    move v10, v9

    .line 263
    :cond_8
    :goto_6
    if-nez v7, :cond_a

    .line 264
    .line 265
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 266
    .line 267
    new-instance v11, Lcom/android/launcher3/taskbar/M0$e;

    .line 268
    .line 269
    iget-object v12, v0, Lcom/android/launcher3/taskbar/M0;->C:Lcom/android/launcher3/anim/d;

    .line 270
    .line 271
    new-instance v13, Lcom/android/launcher3/taskbar/f0;

    .line 272
    .line 273
    const v3, 0x9402

    .line 274
    .line 275
    .line 276
    invoke-direct {v13, v3}, Lcom/android/launcher3/taskbar/f0;-><init>(I)V

    .line 277
    .line 278
    .line 279
    sget-object v17, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 280
    .line 281
    const/high16 v15, 0x3f800000    # 1.0f

    .line 282
    .line 283
    const/16 v16, 0x0

    .line 284
    .line 285
    move-object/from16 v14, v17

    .line 286
    .line 287
    invoke-direct/range {v11 .. v16}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    iget v1, v1, Lcom/android/launcher3/h0;->r3:I

    .line 300
    .line 301
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 302
    .line 303
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 304
    .line 305
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/N2;->k()I

    .line 306
    .line 307
    .line 308
    move-result v3

    .line 309
    sub-int/2addr v1, v3

    .line 310
    int-to-float v1, v1

    .line 311
    const/high16 v3, 0x40000000    # 2.0f

    .line 312
    .line 313
    div-float v18, v1, v3

    .line 314
    .line 315
    if-eqz v10, :cond_9

    .line 316
    .line 317
    const/4 v1, 0x0

    .line 318
    move/from16 v19, v1

    .line 319
    .line 320
    goto :goto_7

    .line 321
    :cond_9
    move/from16 v19, v18

    .line 322
    .line 323
    :goto_7
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 324
    .line 325
    new-instance v14, Lcom/android/launcher3/taskbar/M0$e;

    .line 326
    .line 327
    iget-object v15, v0, Lcom/android/launcher3/taskbar/M0;->A:Lcom/android/launcher3/anim/d;

    .line 328
    .line 329
    new-instance v3, Lcom/android/launcher3/taskbar/g0;

    .line 330
    .line 331
    invoke-direct {v3, v2}, Lcom/android/launcher3/taskbar/g0;-><init>(Z)V

    .line 332
    .line 333
    .line 334
    move-object/from16 v16, v3

    .line 335
    .line 336
    invoke-direct/range {v14 .. v19}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Ljava/lang/Object;Ljava/util/function/IntPredicate;Landroid/util/Property;FF)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 343
    .line 344
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 345
    .line 346
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->G:Lcom/android/launcher3/anim/d;

    .line 347
    .line 348
    new-instance v4, Lcom/android/launcher3/taskbar/h0;

    .line 349
    .line 350
    invoke-direct {v4}, Lcom/android/launcher3/taskbar/h0;-><init>()V

    .line 351
    .line 352
    .line 353
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/anim/d;Ljava/util/function/IntPredicate;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 360
    .line 361
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 362
    .line 363
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->F:Lcom/android/launcher3/anim/d;

    .line 364
    .line 365
    new-instance v4, Lcom/android/launcher3/taskbar/i0;

    .line 366
    .line 367
    invoke-direct {v4}, Lcom/android/launcher3/taskbar/i0;-><init>()V

    .line 368
    .line 369
    .line 370
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/anim/d;Ljava/util/function/IntPredicate;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    :cond_a
    if-eqz v10, :cond_b

    .line 377
    .line 378
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 379
    .line 380
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->q:Landroid/view/ViewGroup;

    .line 381
    .line 382
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 383
    .line 384
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 385
    .line 386
    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher3/taskbar/M0;->n0(Landroid/view/ViewGroup;Landroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;)V

    .line 387
    .line 388
    .line 389
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/M0;->a1()V

    .line 390
    .line 391
    .line 392
    const/16 v1, 0x2000

    .line 393
    .line 394
    invoke-direct {v0, v1, v7}, Lcom/android/launcher3/taskbar/M0;->f1(IZ)V

    .line 395
    .line 396
    .line 397
    if-nez v7, :cond_d

    .line 398
    .line 399
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 400
    .line 401
    new-instance v2, Lcom/android/launcher3/taskbar/M0$e;

    .line 402
    .line 403
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 404
    .line 405
    iget-object v3, v3, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 406
    .line 407
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/s2;->q()Lcom/android/launcher3/anim/d;

    .line 408
    .line 409
    .line 410
    move-result-object v3

    .line 411
    new-instance v4, Lcom/android/launcher3/taskbar/j0;

    .line 412
    .line 413
    invoke-direct {v4}, Lcom/android/launcher3/taskbar/j0;-><init>()V

    .line 414
    .line 415
    .line 416
    invoke-direct {v2, v3, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Lcom/android/launcher3/anim/d;Ljava/util/function/IntPredicate;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 420
    .line 421
    .line 422
    goto :goto_9

    .line 423
    :cond_b
    iget-boolean v1, v0, Lcom/android/launcher3/taskbar/M0;->K:Z

    .line 424
    .line 425
    if-nez v1, :cond_d

    .line 426
    .line 427
    iget-object v3, v0, Lcom/android/launcher3/taskbar/M0;->r:Landroid/view/ViewGroup;

    .line 428
    .line 429
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 430
    .line 431
    iget-object v4, v1, Lcom/android/launcher3/taskbar/R1;->c:Lcom/android/launcher3/taskbar/l3;

    .line 432
    .line 433
    const v5, 0x7f0b00f4

    .line 434
    .line 435
    .line 436
    const v1, 0x7f080d7b

    .line 437
    .line 438
    .line 439
    const/4 v2, 0x1

    .line 440
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/M0;->Q(IILandroid/view/ViewGroup;Lcom/android/launcher3/taskbar/l3;I)Landroid/widget/ImageView;

    .line 441
    .line 442
    .line 443
    move-result-object v1

    .line 444
    invoke-static {v8}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 445
    .line 446
    .line 447
    move-result v2

    .line 448
    if-eqz v2, :cond_c

    .line 449
    .line 450
    const/high16 v2, 0x42b40000    # 90.0f

    .line 451
    .line 452
    goto :goto_8

    .line 453
    :cond_c
    const/high16 v2, -0x3d4c0000    # -90.0f

    .line 454
    .line 455
    :goto_8
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 456
    .line 457
    .line 458
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 459
    .line 460
    new-instance v3, Lcom/android/launcher3/taskbar/M0$e;

    .line 461
    .line 462
    new-instance v4, Lcom/android/launcher3/taskbar/k0;

    .line 463
    .line 464
    invoke-direct {v4}, Lcom/android/launcher3/taskbar/k0;-><init>()V

    .line 465
    .line 466
    .line 467
    invoke-direct {v3, v1, v4}, Lcom/android/launcher3/taskbar/M0$e;-><init>(Landroid/view/View;Ljava/util/function/IntPredicate;)V

    .line 468
    .line 469
    .line 470
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    :cond_d
    :goto_9
    new-instance v10, Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 474
    .line 475
    sget-boolean v1, Lf1/a;->g:Z

    .line 476
    .line 477
    if-eqz v1, :cond_e

    .line 478
    .line 479
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->l:Landroid/content/Context;

    .line 480
    .line 481
    :goto_a
    move-object v11, v1

    .line 482
    goto :goto_b

    .line 483
    :cond_e
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 484
    .line 485
    goto :goto_a

    .line 486
    :goto_b
    const v20, 0x7f0704e8

    .line 487
    .line 488
    .line 489
    const v21, 0x7f050010

    .line 490
    .line 491
    .line 492
    const v12, 0x7f140034

    .line 493
    .line 494
    .line 495
    const v13, 0x7f0e01d8

    .line 496
    .line 497
    .line 498
    const v14, 0x7f0b04f7

    .line 499
    .line 500
    .line 501
    const v15, 0x7f07032a

    .line 502
    .line 503
    .line 504
    const v16, 0x7f070a3f

    .line 505
    .line 506
    .line 507
    const v17, 0x7f07032c

    .line 508
    .line 509
    .line 510
    const v18, 0x7f07032b

    .line 511
    .line 512
    .line 513
    const v19, 0x7f070329

    .line 514
    .line 515
    .line 516
    invoke-direct/range {v10 .. v21}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;-><init>(Landroid/content/Context;IIIIIIIIII)V

    .line 517
    .line 518
    .line 519
    iput-object v10, v0, Lcom/android/launcher3/taskbar/M0;->R:Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 520
    .line 521
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 522
    .line 523
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->e:Lcom/android/systemui/shared/rotation/RotationButtonController;

    .line 524
    .line 525
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->H:Lcom/android/launcher3/taskbar/M0$d;

    .line 526
    .line 527
    invoke-virtual {v1, v10, v2}, Lcom/android/systemui/shared/rotation/RotationButtonController;->setRotationButton(Lcom/android/systemui/shared/rotation/RotationButton;Lcom/android/systemui/shared/rotation/RotationButton$RotationButtonUpdatesCallback;)V

    .line 528
    .line 529
    .line 530
    if-eqz v7, :cond_f

    .line 531
    .line 532
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 533
    .line 534
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/e4;->e()V

    .line 535
    .line 536
    .line 537
    :cond_f
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/M0;->V()V

    .line 538
    .line 539
    .line 540
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 541
    .line 542
    new-instance v2, Lcom/android/launcher3/taskbar/I0;

    .line 543
    .line 544
    invoke-direct {v2}, Lcom/android/launcher3/taskbar/I0;-><init>()V

    .line 545
    .line 546
    .line 547
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 548
    .line 549
    .line 550
    new-instance v1, Lcom/android/launcher3/taskbar/M0$a;

    .line 551
    .line 552
    iget-object v2, v0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 553
    .line 554
    const/4 v3, 0x0

    .line 555
    invoke-direct {v1, v0, v2, v3, v9}, Lcom/android/launcher3/taskbar/M0$a;-><init>(Lcom/android/launcher3/taskbar/M0;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 556
    .line 557
    .line 558
    iput-object v1, v0, Lcom/android/launcher3/taskbar/M0;->U:Lcom/android/launcher3/views/BaseDragLayer;

    .line 559
    .line 560
    invoke-virtual {v1}, Lcom/android/launcher3/views/BaseDragLayer;->recreateControllers()V

    .line 561
    .line 562
    .line 563
    invoke-static {}, Lcom/android/launcher3/taskbar/bubbles/t;->G2()Z

    .line 564
    .line 565
    .line 566
    move-result v1

    .line 567
    if-eqz v1, :cond_10

    .line 568
    .line 569
    iget-object v1, v0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 570
    .line 571
    new-instance v2, Lcom/android/launcher3/taskbar/K0;

    .line 572
    .line 573
    invoke-direct {v2, v0}, Lcom/android/launcher3/taskbar/K0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 577
    .line 578
    .line 579
    :cond_10
    return-void
.end method

.method public X()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/M0;->M:J

    .line 10
    .line 11
    const-wide/16 v2, 0x2

    .line 12
    .line 13
    and-long/2addr v0, v2

    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move v0, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 25
    .line 26
    iget p0, p0, Lcom/android/launcher3/taskbar/M0;->a0:I

    .line 27
    .line 28
    xor-int/2addr v0, v1

    .line 29
    invoke-virtual {v2, p0, v0}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->transitionTo(IZ)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public X0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/e4;->setAutoDim(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->o:Landroid/os/Handler;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->b0:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0;->o:Landroid/os/Handler;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->b0:Ljava/lang/Runnable;

    .line 27
    .line 28
    const-wide/16 v0, 0x8ca

    .line 29
    .line 30
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public Y0(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->transitionTo(IZ)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/systemui/shared/statusbar/phone/BarTransitions;->finishAnimations()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
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
    const-string v1, "NavbarButtonsViewController:"

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
    const-string v1, "\tmState="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 35
    .line 36
    invoke-static {v1}, Lcom/android/launcher3/taskbar/M0;->e0(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

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
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v1, "\tmFloatingRotationButtonBounds="

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->I:Landroid/graphics/Rect;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\tmSysuiStateFlags="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/M0;->M:J

    .line 89
    .line 90
    invoke-static {v1, v2}, Lcom/android/systemui/shared/system/QuickStepContract;->getSystemUiStateString(J)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v1, "\tLast set nav button translationY="

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget v1, p0, Lcom/android/launcher3/taskbar/M0;->B:F

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, "\t\tmTaskbarNavButtonTranslationY="

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->y:Lcom/android/launcher3/anim/d;

    .line 143
    .line 144
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v1, "\t\tmTaskbarNavButtonTranslationYForInAppDisplay="

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->z:Lcom/android/launcher3/anim/d;

    .line 170
    .line 171
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v1, "\t\tmTaskbarNavButtonTranslationYForIme="

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->A:Lcom/android/launcher3/anim/d;

    .line 197
    .line 198
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string v1, "\t\tmTaskbarNavButtonDarkIntensity="

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->D:Lcom/android/launcher3/anim/d;

    .line 224
    .line 225
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 226
    .line 227
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v1, "\t\tmSlideInViewVisibleNavButtonColorOverride="

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->F:Lcom/android/launcher3/anim/d;

    .line 251
    .line 252
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 253
    .line 254
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string v1, "\t\tmOnTaskbarBackgroundNavButtonColorOverride="

    .line 273
    .line 274
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->E:Lcom/android/launcher3/anim/d;

    .line 278
    .line 279
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    new-instance v0, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    const-string v1, "\t\tmOnBackgroundNavButtonColorOverrideMultiplier="

    .line 300
    .line 301
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->G:Lcom/android/launcher3/anim/d;

    .line 305
    .line 306
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 307
    .line 308
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 319
    .line 320
    new-instance v1, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    const-string v2, "\t"

    .line 329
    .line 330
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->f(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 338
    .line 339
    .line 340
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 341
    .line 342
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-eqz v0, :cond_0

    .line 347
    .line 348
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->Z:Lcom/android/launcher3/taskbar/e4;

    .line 349
    .line 350
    new-instance v0, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 353
    .line 354
    .line 355
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/e4;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 366
    .line 367
    .line 368
    :cond_0
    return-void
.end method

.method public a0()Lcom/android/launcher3/util/B1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->P:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(LN2/h;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->x:LN2/h;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->W()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->Y()V

    .line 10
    .line 11
    .line 12
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->c0(LN2/h;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTranslationX(F)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0;->x:LN2/h;

    .line 23
    .line 24
    return-void
.end method

.method public b0()Lcom/android/launcher3/util/B1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->Q:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(LN2/h;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->x:LN2/h;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->W()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0;->x:LN2/h;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0;->c0(LN2/h;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->p:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-static {p1, v1, v0}, Lcom/android/launcher3/taskbar/a;->h(LN2/h;Landroid/view/View;F)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Lcom/android/launcher3/taskbar/l0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/l0;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0;->w:Landroid/animation/Animator;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public d0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->E:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public e1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->k:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->a1()Z

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
    iget-object v0, p0, Lcom/android/launcher3/taskbar/M0;->y:Lcom/android/launcher3/anim/d;

    .line 11
    .line 12
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/taskbar/M0;->A:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 17
    .line 18
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 19
    .line 20
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 21
    .line 22
    instance-of v3, v2, Lcom/android/launcher3/taskbar/V;

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    check-cast v2, Lcom/android/launcher3/taskbar/V;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/V;->x0()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/launcher3/taskbar/M0;->z:Lcom/android/launcher3/anim/d;

    .line 35
    .line 36
    iget v2, v2, Lcom/android/launcher3/anim/d;->d:F

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v2, 0x0

    .line 40
    :goto_0
    add-float/2addr v0, v1

    .line 41
    add-float/2addr v0, v2

    .line 42
    iput v0, p0, Lcom/android/launcher3/taskbar/M0;->B:F

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->n:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public g1(JZ)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/M0;->M:J

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/M0;->M0(J)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/M0;->V()V

    .line 12
    .line 13
    .line 14
    if-eqz p3, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->h:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance p1, Lcom/android/launcher3/taskbar/I0;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/android/launcher3/taskbar/I0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public h0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->D:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public h1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->W:Lcom/android/launcher3/taskbar/R0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/R0;->d(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->y:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public j0()Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->z:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public k0()Lcom/android/launcher3/util/G2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->W:Lcom/android/launcher3/taskbar/R0;

    .line 2
    .line 3
    return-object p0
.end method

.method public m0(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0;->J:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/M0;->V0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p0(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0;->I:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    float-to-int v0, v0

    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    float-to-int p1, p1

    .line 13
    invoke-virtual {p0, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public q0()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x80

    .line 4
    .line 5
    if-eqz p0, :cond_0

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

.method public r0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/M0;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method public s0()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    if-eqz p0, :cond_0

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

.method public t0()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/M0;->j:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x100

    .line 4
    .line 5
    if-eqz p0, :cond_0

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
