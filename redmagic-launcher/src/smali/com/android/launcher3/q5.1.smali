.class public Lcom/android/launcher3/q5;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Lcom/android/launcher3/X3$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/q5$J;,
        Lcom/android/launcher3/q5$H;,
        Lcom/android/launcher3/q5$G;,
        Lcom/android/launcher3/q5$E;,
        Lcom/android/launcher3/q5$D;,
        Lcom/android/launcher3/q5$K;,
        Lcom/android/launcher3/q5$I;,
        Lcom/android/launcher3/q5$F;
    }
.end annotation


# static fields
.field private static final U:Z

.field public static final V:J

.field public static final W:J

.field public static final X:Landroid/view/animation/Interpolator;

.field public static final Y:Landroid/view/animation/Interpolator;

.field public static final Z:Landroid/view/animation/Interpolator;

.field public static final a0:Landroid/view/animation/Interpolator;

.field public static final b0:Landroid/view/animation/Interpolator;

.field private static final c0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final A:Landroid/graphics/RectF;

.field private final B:Landroid/graphics/RectF;

.field C:Landroid/view/RemoteAnimationTarget;

.field public D:Z

.field public E:Z

.field private F:Landroid/animation/AnimatorSet;

.field private G:Landroid/animation/AnimatorSet;

.field private H:Lcom/android/quickstep/util/RectFSpringAnim;

.field public I:Z

.field private final J:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private K:Ljava/lang/Runnable;

.field protected L:Lcom/android/quickstep/util/animation/AnimationRecord;

.field protected M:Lcom/android/launcher3/anim/P;

.field private N:Z

.field private O:I

.field private P:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private Q:Lcom/android/launcher3/anim/x;

.field private R:I

.field private S:I

.field private T:Ljava/lang/String;

.field protected final g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field protected final h:Lcom/android/launcher3/dragndrop/DragLayer;

.field protected final i:Landroid/os/Handler;

.field private final j:F

.field private final k:F

.field private final l:F

.field private m:Lcom/android/launcher3/q5$J;

.field private final n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;",
            ">;"
        }
    .end annotation
.end field

.field private o:Lcom/android/launcher3/h0;

.field private p:Lcom/android/launcher3/M2$b;

.field private q:Lcom/android/launcher3/M2$b;

.field private r:Lcom/android/launcher3/M2$b;

.field private s:Landroid/window/RemoteTransition;

.field private final t:Lcom/android/launcher3/q5$H;

.field private u:Lcom/android/quickstep/LauncherBackAnimationController;

.field private final v:Landroid/animation/AnimatorListenerAdapter;

.field private w:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Integer;",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private final x:Landroid/view/animation/Interpolator;

.field private final y:Landroid/view/animation/Interpolator;

.field private final z:Lcom/android/quickstep/SystemUiProxy;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    const-string v0, "persist.debug.shell_starting_surface"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/android/launcher3/q5;->U:Z

    .line 9
    .line 10
    sget v0, Lcom/android/launcher3/anim/C;->Q:I

    .line 11
    .line 12
    int-to-long v0, v0

    .line 13
    sput-wide v0, Lcom/android/launcher3/q5;->V:J

    .line 14
    .line 15
    const-wide/16 v2, 0x85

    .line 16
    .line 17
    sub-long/2addr v0, v2

    .line 18
    sput-wide v0, Lcom/android/launcher3/q5;->W:J

    .line 19
    .line 20
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-direct {v0, v1, v1, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/android/launcher3/q5;->X:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 31
    .line 32
    const v3, 0x3e4ccccd    # 0.2f

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v3, v1, v2, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/android/launcher3/q5;->Y:Landroid/view/animation/Interpolator;

    .line 39
    .line 40
    new-instance v4, Lcom/android/quickstep/util/animation/OSpringInterpolator;

    .line 41
    .line 42
    const-wide/16 v9, 0x0

    .line 43
    .line 44
    const/high16 v11, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const-wide v5, 0x4062200000000000L    # 145.0

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 52
    .line 53
    invoke-direct/range {v4 .. v11}, Lcom/android/quickstep/util/animation/OSpringInterpolator;-><init>(DDDF)V

    .line 54
    .line 55
    .line 56
    sput-object v4, Lcom/android/launcher3/q5;->Z:Landroid/view/animation/Interpolator;

    .line 57
    .line 58
    new-instance v5, Lcom/android/quickstep/util/animation/OSpringInterpolator;

    .line 59
    .line 60
    const-wide/16 v10, 0x0

    .line 61
    .line 62
    const/high16 v12, 0x3f800000    # 1.0f

    .line 63
    .line 64
    const-wide/high16 v6, 0x404e000000000000L    # 60.0

    .line 65
    .line 66
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 67
    .line 68
    invoke-direct/range {v5 .. v12}, Lcom/android/quickstep/util/animation/OSpringInterpolator;-><init>(DDDF)V

    .line 69
    .line 70
    .line 71
    sput-object v5, Lcom/android/launcher3/q5;->a0:Landroid/view/animation/Interpolator;

    .line 72
    .line 73
    new-instance v6, Lcom/android/quickstep/util/animation/OSpringInterpolator;

    .line 74
    .line 75
    const-wide/16 v11, 0x0

    .line 76
    .line 77
    const/high16 v13, 0x3f800000    # 1.0f

    .line 78
    .line 79
    const-wide v7, 0x4072c00000000000L    # 300.0

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    .line 85
    .line 86
    invoke-direct/range {v6 .. v13}, Lcom/android/quickstep/util/animation/OSpringInterpolator;-><init>(DDDF)V

    .line 87
    .line 88
    .line 89
    sput-object v6, Lcom/android/launcher3/q5;->b0:Landroid/view/animation/Interpolator;

    .line 90
    .line 91
    new-instance v0, Ljava/util/ArrayList;

    .line 92
    .line 93
    const-string v1, "com.google.android.calendar"

    .line 94
    .line 95
    const-string v2, "com.teamtalk.im"

    .line 96
    .line 97
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lcom/android/launcher3/q5;->c0:Ljava/util/ArrayList;

    .line 109
    .line 110
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/q5$J;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/q5$J;-><init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/v5;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/q5;->m:Lcom/android/launcher3/q5$J;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/q5;->n:Ljava/util/List;

    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/q5$k;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/android/launcher3/q5$k;-><init>(Lcom/android/launcher3/q5;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/q5;->v:Landroid/animation/AnimatorListenerAdapter;

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/launcher3/q5;->A:Landroid/graphics/RectF;

    .line 32
    .line 33
    new-instance v0, Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/q5;->B:Landroid/graphics/RectF;

    .line 39
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/launcher3/q5;->J:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 64
    .line 65
    new-instance v0, Landroid/os/Handler;

    .line 66
    .line 67
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/android/launcher3/q5;->i:Landroid/os/Handler;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 81
    .line 82
    new-instance v0, Lcom/android/quickstep/LauncherBackAnimationController;

    .line 83
    .line 84
    invoke-direct {v0, p1, p0}, Lcom/android/quickstep/LauncherBackAnimationController;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/q5;)V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const v1, 0x7f0701d1

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    int-to-float v1, v1

    .line 101
    iput v1, p0, Lcom/android/launcher3/q5;->j:F

    .line 102
    .line 103
    const v1, 0x7f0701d0

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    int-to-float v1, v1

    .line 111
    iput v1, p0, Lcom/android/launcher3/q5;->k:F

    .line 112
    .line 113
    const v1, 0x7f0706d1

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    int-to-float v0, v0

    .line 121
    iput v0, p0, Lcom/android/launcher3/q5;->l:F

    .line 122
    .line 123
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 124
    .line 125
    .line 126
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 127
    .line 128
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 133
    .line 134
    iput-object v0, p0, Lcom/android/launcher3/q5;->z:Lcom/android/quickstep/SystemUiProxy;

    .line 135
    .line 136
    sget-boolean v1, Lcom/android/launcher3/q5;->U:Z

    .line 137
    .line 138
    if-eqz v1, :cond_0

    .line 139
    .line 140
    new-instance v1, Lcom/android/launcher3/q5$s;

    .line 141
    .line 142
    const/4 v2, 0x5

    .line 143
    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/q5$s;-><init>(Lcom/android/launcher3/q5;I)V

    .line 144
    .line 145
    .line 146
    iput-object v1, p0, Lcom/android/launcher3/q5;->w:Ljava/util/LinkedHashMap;

    .line 147
    .line 148
    iget-object v1, p0, Lcom/android/launcher3/q5;->m:Lcom/android/launcher3/q5$J;

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->setStartingWindowListener(LV2/b;)V

    .line 151
    .line 152
    .line 153
    :cond_0
    sget-object v0, Lcom/android/launcher3/anim/L;->x:Landroid/view/animation/Interpolator;

    .line 154
    .line 155
    iput-object v0, p0, Lcom/android/launcher3/q5;->x:Landroid/view/animation/Interpolator;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/android/launcher3/q5;->y:Landroid/view/animation/Interpolator;

    .line 158
    .line 159
    new-instance v0, Lcom/android/launcher3/q5$H;

    .line 160
    .line 161
    invoke-direct {v0, p1}, Lcom/android/launcher3/q5$H;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 162
    .line 163
    .line 164
    iput-object v0, p0, Lcom/android/launcher3/q5;->t:Lcom/android/launcher3/q5$H;

    .line 165
    .line 166
    new-instance v0, Lcom/android/launcher3/p5;

    .line 167
    .line 168
    invoke-direct {v0, p0}, Lcom/android/launcher3/p5;-><init>(Lcom/android/launcher3/q5;)V

    .line 169
    .line 170
    .line 171
    iput-object v0, p0, Lcom/android/launcher3/q5;->K:Ljava/lang/Runnable;

    .line 172
    .line 173
    new-instance v0, Lcom/android/launcher3/anim/P;

    .line 174
    .line 175
    iget-object v1, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 176
    .line 177
    invoke-direct {v0, p1, v1}, Lcom/android/launcher3/anim/P;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/h0;)V

    .line 178
    .line 179
    .line 180
    iput-object v0, p0, Lcom/android/launcher3/q5;->M:Lcom/android/launcher3/anim/P;

    .line 181
    .line 182
    new-instance v0, Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .line 186
    .line 187
    iput-object v0, p0, Lcom/android/launcher3/q5;->P:Ljava/util/List;

    .line 188
    .line 189
    new-instance v0, Lcom/android/launcher3/anim/x;

    .line 190
    .line 191
    invoke-direct {v0, p1}, Lcom/android/launcher3/anim/x;-><init>(Lcom/android/launcher3/C2;)V

    .line 192
    .line 193
    .line 194
    iput-object v0, p0, Lcom/android/launcher3/q5;->Q:Lcom/android/launcher3/anim/x;

    .line 195
    .line 196
    return-void
.end method

.method static bridge synthetic A(Lcom/android/launcher3/q5;Landroid/animation/Animator;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q5;->K(Landroid/animation/Animator;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private A0([Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_0

    .line 5
    .line 6
    aget-object v3, p1, v2

    .line 7
    .line 8
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 9
    .line 10
    if-eqz v4, :cond_1

    .line 11
    .line 12
    add-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v3, 0x0

    .line 16
    :cond_1
    if-nez v3, :cond_2

    .line 17
    .line 18
    new-instance p1, Landroid/graphics/Rect;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 21
    .line 22
    iget p2, p0, Lcom/android/launcher3/h0;->T0:I

    .line 23
    .line 24
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 25
    .line 26
    invoke-direct {p1, v1, v1, p2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 27
    .line 28
    .line 29
    return-object p1

    .line 30
    :cond_2
    new-instance p1, Landroid/graphics/Rect;

    .line 31
    .line 32
    iget-object v0, v3, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {p1, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, v3, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    iget-object v0, v3, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 46
    .line 47
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 48
    .line 49
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 50
    .line 51
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 52
    .line 53
    .line 54
    :goto_1
    if-eqz p2, :cond_5

    .line 55
    .line 56
    rem-int/lit8 v0, p2, 0x2

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    if-ne v0, v1, :cond_4

    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 62
    .line 63
    iget v0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 64
    .line 65
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 66
    .line 67
    rsub-int/lit8 p2, p2, 0x4

    .line 68
    .line 69
    invoke-static {p1, v0, p0, p2}, Lcom/android/launcher3/N5;->X(Landroid/graphics/Rect;III)V

    .line 70
    .line 71
    .line 72
    return-object p1

    .line 73
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 74
    .line 75
    iget v0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 76
    .line 77
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 78
    .line 79
    rsub-int/lit8 p2, p2, 0x4

    .line 80
    .line 81
    invoke-static {p1, v0, p0, p2}, Lcom/android/launcher3/N5;->X(Landroid/graphics/Rect;III)V

    .line 82
    .line 83
    .line 84
    :cond_5
    return-object p1
.end method

.method static bridge synthetic B(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/q5;->P(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private B0([Landroid/view/RemoteAnimationTarget;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, LO2/d;->c(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_EXIT_TRANSITIONS_BUGFIX:Landroid/window/DesktopModeFlags;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Lcom/android/launcher3/h5;

    .line 26
    .line 27
    invoke-direct {p1}, Lcom/android/launcher3/h5;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method static bridge synthetic C(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/q5;->S(Landroid/animation/AnimatorSet;Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private C0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    const-class v0, Landroid/app/role/RoleManager;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/app/role/RoleManager;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const-string v0, "android.app.role.HOME"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/app/role/RoleManager;->isRoleHeld(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method static bridge synthetic D(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/q5;->p0([Landroid/view/RemoteAnimationTarget;)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic E(Lcom/android/launcher3/q5;ZIZ)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/q5;->q0(ZIZ)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic F(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/q5;->x0([Landroid/view/RemoteAnimationTarget;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic F0(Lcom/android/quickstep/views/RecentsView;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/RecentsView;->setFreezeViewVisibility(Z)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, p1, v1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->Z()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->q4()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method static bridge synthetic G(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q5;->A0([Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic G0(LP1/h;Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object p2, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Lcom/android/launcher3/V3;->e(Landroid/content/Context;)F

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    sget-object p2, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/android/quickstep/util/BaseDepthController;->stateDepth:Lcom/android/launcher3/util/v1$c;

    .line 26
    .line 27
    invoke-virtual {p2, p1, p0}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method static bridge synthetic H(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q5;->N0([Landroid/view/RemoteAnimationTarget;I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic H0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/q5;->E:Z

    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic I()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/q5;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method private synthetic I0(ILcom/android/launcher3/anim/C;Landroid/graphics/RectF;F)V
    .locals 0

    .line 1
    const p3, 0x3f7fbe77    # 0.999f

    .line 2
    .line 3
    .line 4
    cmpl-float p3, p4, p3

    .line 5
    .line 6
    if-lez p3, :cond_1

    .line 7
    .line 8
    iget-boolean p3, p0, Lcom/android/launcher3/q5;->I:Z

    .line 9
    .line 10
    if-nez p3, :cond_1

    .line 11
    .line 12
    const/4 p3, 0x1

    .line 13
    iput-boolean p3, p0, Lcom/android/launcher3/q5;->I:Z

    .line 14
    .line 15
    iget-object p3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 16
    .line 17
    invoke-static {p3, p1}, Lcom/android/quickstep/views/CapsuleView;->getContentTextOnCapsule(Lcom/android/launcher3/C2;I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p2, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 30
    .line 31
    const/16 p2, 0xc

    .line 32
    .line 33
    invoke-virtual {p1, p0, p2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method static bridge synthetic J([Landroid/view/RemoteAnimationTarget;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic J0(ILcom/android/launcher3/anim/C;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/q5;->I:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/q5;->I:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 9
    .line 10
    invoke-static {v0, p1}, Lcom/android/quickstep/views/CapsuleView;->getContentTextOnCapsule(Lcom/android/launcher3/C2;I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p2, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 23
    .line 24
    const/16 p2, 0xc

    .line 25
    .line 26
    invoke-virtual {p1, p0, p2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method private K(Landroid/animation/Animator;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/q5;->m0(I)Lcom/android/launcher3/anim/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic K0(Landroid/graphics/RectF;F)V
    .locals 0

    .line 1
    const/high16 p1, 0x3f000000    # 0.5f

    .line 2
    .line 3
    cmpl-float p1, p2, p1

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/android/launcher3/q5;->I:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/android/launcher3/q5;->I:Z

    .line 13
    .line 14
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    const/16 p2, 0xc

    .line 21
    .line 22
    invoke-virtual {p1, p0, p2}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private L(Lcom/android/quickstep/util/RectFSpringAnim;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/android/launcher3/q5;->m0(I)Lcom/android/launcher3/anim/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic L0(Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    sget-object p2, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 5
    .line 6
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-virtual {p2, p1, p3}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 11
    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    const/4 p3, 0x0

    .line 15
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->q4()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lx1/O;->Y2()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->m0()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method private M(Landroid/view/RemoteAnimationDefinition;)V
    .locals 7

    .line 1
    new-instance v0, Lcom/android/launcher3/q5$K;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/q5$K;-><init>(Lcom/android/launcher3/q5;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/q5;->p:Lcom/android/launcher3/M2$b;

    .line 7
    .line 8
    new-instance v1, Landroid/view/RemoteAnimationAdapter;

    .line 9
    .line 10
    new-instance v2, Lcom/android/launcher3/M2;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/q5;->i:Landroid/os/Handler;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/q5;->p:Lcom/android/launcher3/M2$b;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-direct {v2, v0, p0, v3}, Lcom/android/launcher3/M2;-><init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v3, 0xfa

    .line 21
    .line 22
    const-wide/16 v5, 0x0

    .line 23
    .line 24
    invoke-direct/range {v1 .. v6}, Landroid/view/RemoteAnimationAdapter;-><init>(Landroid/view/IRemoteAnimationRunner;JJ)V

    .line 25
    .line 26
    .line 27
    const/16 p0, 0xd

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, p0, v0, v1}, Landroid/view/RemoteAnimationDefinition;->addRemoteAnimation(IILandroid/view/RemoteAnimationAdapter;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic M0()V
    .locals 3

    .line 1
    const-string v0, "QuickstepTransitionManager"

    .line 2
    .line 3
    const-string v1, "Reset flag"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iput-boolean v2, v1, Lcom/android/launcher3/anim/C;->D:Z

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 28
    .line 29
    iput-boolean v2, v0, Lcom/android/launcher3/anim/C;->E:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->e0()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private N([Landroid/view/RemoteAnimationTarget;)Z
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    array-length v1, p1

    .line 4
    if-ge v0, v1, :cond_2

    .line 5
    .line 6
    aget-object v1, p1, v0

    .line 7
    .line 8
    iget v2, v1, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    iget-boolean v1, v1, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 13
    .line 14
    and-int/2addr p0, v1

    .line 15
    :cond_0
    if-nez p0, :cond_1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_2
    return p0
.end method

.method private N0([Landroid/view/RemoteAnimationTarget;I)Z
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_1

    .line 5
    .line 6
    aget-object v3, p1, v2

    .line 7
    .line 8
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 9
    .line 10
    if-ne v4, p2, :cond_0

    .line 11
    .line 12
    iget-object v3, v3, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    iget-object v3, v3, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    iget-object v4, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 21
    .line 22
    invoke-virtual {v4}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v3, v4}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return v1
.end method

.method private static O()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/systemui/shared/Flags;->returnAnimationFrameworkLibrary()Z

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
    return v0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    return v0
.end method

.method private P(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V
    .locals 9

    .line 1
    sget-boolean v1, LU2/a;->a:Z

    .line 2
    .line 3
    const/4 v6, 0x0

    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    invoke-static {v2}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sget-object v3, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 13
    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    new-array v3, v6, [Landroid/animation/Animator;

    .line 23
    .line 24
    invoke-virtual {v2, p1, v3}, Lcom/android/launcher3/statemanager/d;->d0(Landroid/animation/AnimatorSet;[Landroid/animation/Animator;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    sget-object v2, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/android/launcher3/anim/C;

    .line 46
    .line 47
    invoke-static {}, Lx1/O;->Y2()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const/4 v4, 0x0

    .line 52
    if-nez v3, :cond_4

    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/q5;->q:Lcom/android/launcher3/M2$b;

    .line 55
    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    invoke-interface {v3}, Lcom/android/launcher3/M2$b;->getAppTransitionParamForInterrupt()Lu2/e;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    if-eqz v3, :cond_4

    .line 63
    .line 64
    :cond_2
    invoke-virtual {v2}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    move-object v1, p1

    .line 71
    goto :goto_0

    .line 72
    :cond_3
    move-object v1, v4

    .line 73
    :goto_0
    invoke-virtual {v3, v1}, Lu2/e;->j(Landroid/animation/AnimatorSet;)V

    .line 74
    .line 75
    .line 76
    :cond_4
    invoke-virtual {v2}, Lcom/android/launcher3/anim/C;->C()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    if-nez v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {v2, p2}, Lcom/android/launcher3/anim/C;->o0(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    invoke-static {}, Lx1/O;->Y2()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    const/4 v8, 0x1

    .line 90
    if-eqz v2, :cond_8

    .line 91
    .line 92
    invoke-static {}, Lx1/O;->k1()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-nez v2, :cond_8

    .line 97
    .line 98
    invoke-static {}, Lx1/O;->W2()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_7

    .line 103
    .line 104
    invoke-static {}, Lx1/O;->X2()Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_6

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_6
    move-object v0, p0

    .line 112
    move-object v1, p2

    .line 113
    move-object v2, p3

    .line 114
    move-object v3, p4

    .line 115
    move-object v4, p5

    .line 116
    move v5, p6

    .line 117
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/q5;->u0(Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    :goto_1
    move-object v4, v1

    .line 122
    goto :goto_3

    .line 123
    :cond_7
    :goto_2
    invoke-virtual {p0, p3, p4, p5, v8}, Lcom/android/launcher3/q5;->r0([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    goto :goto_1

    .line 128
    :cond_8
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/q5;->s0(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 129
    .line 130
    .line 131
    :goto_3
    if-eqz v4, :cond_9

    .line 132
    .line 133
    int-to-long v1, v7

    .line 134
    invoke-virtual {v4, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 138
    .line 139
    .line 140
    :cond_9
    if-eqz p6, :cond_b

    .line 141
    .line 142
    invoke-direct {p0, v8, v7, v6}, Lcom/android/launcher3/q5;->q0(ZIZ)Landroid/util/Pair;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v2, Landroid/animation/Animator;

    .line 149
    .line 150
    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 154
    .line 155
    sget-object v3, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 156
    .line 157
    invoke-interface {v2, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    if-nez v2, :cond_a

    .line 162
    .line 163
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 164
    .line 165
    sget-object v3, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 166
    .line 167
    invoke-interface {v2, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-nez v2, :cond_a

    .line 172
    .line 173
    invoke-static {}, Lx1/O;->Y2()Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-nez v2, :cond_a

    .line 178
    .line 179
    new-instance v2, Lcom/android/launcher3/q5$x;

    .line 180
    .line 181
    invoke-direct {v2, p0, v1}, Lcom/android/launcher3/q5$x;-><init>(Lcom/android/launcher3/q5;Landroid/util/Pair;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_a
    new-instance v2, Lcom/android/launcher3/q5$y;

    .line 189
    .line 190
    invoke-direct {v2, p0, v1}, Lcom/android/launcher3/q5$y;-><init>(Lcom/android/launcher3/q5;Landroid/util/Pair;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 194
    .line 195
    .line 196
    :cond_b
    return-void
.end method

.method private S(Landroid/animation/AnimatorSet;Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V
    .locals 9

    .line 1
    sget-boolean v0, LU2/a;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v2, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 13
    .line 14
    if-eq v0, v2, :cond_1

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-array v2, v1, [Landroid/animation/Animator;

    .line 23
    .line 24
    invoke-virtual {v0, p1, v2}, Lcom/android/launcher3/statemanager/d;->d0(Landroid/animation/AnimatorSet;[Landroid/animation/Animator;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-static {}, Lx1/O;->Y2()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/q5;->q:Lcom/android/launcher3/M2$b;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-interface {v0}, Lcom/android/launcher3/M2$b;->getAppTransitionParamForInterrupt()Lu2/e;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    :cond_2
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, p1}, Lu2/e;->j(Landroid/animation/AnimatorSet;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    invoke-static {}, Lx1/O;->Y2()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const/4 v2, 0x1

    .line 69
    if-eqz v0, :cond_6

    .line 70
    .line 71
    invoke-static {}, Lx1/O;->W2()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_4

    .line 76
    .line 77
    invoke-static {}, Lx1/O;->X2()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    :cond_4
    move-object v3, p0

    .line 84
    move-object v5, p3

    .line 85
    move-object v6, p4

    .line 86
    move-object v7, p5

    .line 87
    move v8, p6

    .line 88
    goto :goto_0

    .line 89
    :cond_5
    move-object v3, p0

    .line 90
    move-object v4, p2

    .line 91
    move-object v5, p3

    .line 92
    move-object v6, p4

    .line 93
    move-object v7, p5

    .line 94
    move v8, p6

    .line 95
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/q5;->u0(Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    goto :goto_1

    .line 100
    :goto_0
    invoke-virtual {v3, v5, v6, v7, v2}, Lcom/android/launcher3/q5;->r0([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    :goto_1
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_6
    move-object v3, p0

    .line 109
    move-object v4, p2

    .line 110
    move-object v5, p3

    .line 111
    move-object v6, p4

    .line 112
    move-object v7, p5

    .line 113
    move v8, p6

    .line 114
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/q5;->t0(Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 119
    .line 120
    .line 121
    :goto_2
    invoke-static {}, Lx1/O;->Y2()Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-nez p0, :cond_8

    .line 126
    .line 127
    if-eqz v8, :cond_8

    .line 128
    .line 129
    iget-object p0, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 130
    .line 131
    invoke-static {p0}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    invoke-direct {v3, v2, p0, v1}, Lcom/android/launcher3/q5;->q0(ZIZ)Landroid/util/Pair;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    iget-object p2, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 140
    .line 141
    check-cast p2, Landroid/animation/Animator;

    .line 142
    .line 143
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 144
    .line 145
    .line 146
    iget-object p2, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 147
    .line 148
    sget-object p3, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 149
    .line 150
    invoke-interface {p2, p3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    if-nez p2, :cond_7

    .line 155
    .line 156
    iget-object p2, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 157
    .line 158
    sget-object p3, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 159
    .line 160
    invoke-interface {p2, p3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    if-nez p2, :cond_7

    .line 165
    .line 166
    invoke-static {}, Lx1/O;->Y2()Z

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    if-nez p2, :cond_7

    .line 171
    .line 172
    new-instance p2, Lcom/android/launcher3/q5$z;

    .line 173
    .line 174
    invoke-direct {p2, v3, p0}, Lcom/android/launcher3/q5$z;-><init>(Lcom/android/launcher3/q5;Landroid/util/Pair;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_7
    new-instance p2, Lcom/android/launcher3/q5$A;

    .line 182
    .line 183
    invoke-direct {p2, v3, p0}, Lcom/android/launcher3/q5$A;-><init>(Lcom/android/launcher3/q5;Landroid/util/Pair;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 187
    .line 188
    .line 189
    :cond_8
    return-void
.end method

.method private T(Landroid/view/View;Lcom/android/launcher3/util/Y1;)Lu2/p;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->V0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->shouldUseBackgroundAnimation()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v4, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/q5;->m:Lcom/android/launcher3/q5$J;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    :goto_0
    move-object v5, v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    new-instance v0, Lcom/android/launcher3/q5$J;

    .line 36
    .line 37
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/q5$J;-><init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/v5;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :goto_1
    const/4 v7, 0x0

    .line 42
    const/4 v3, 0x1

    .line 43
    move-object v2, p1

    .line 44
    move-object v6, p2

    .line 45
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/q5$G;->d(Landroid/view/View;ZLcom/android/launcher3/C2;Lcom/android/launcher3/q5$J;Lcom/android/launcher3/util/Y1;Landroid/window/WindowAnimationState;)Lcom/android/launcher3/q5$G;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    move-object v2, p1

    .line 51
    move-object v6, p2

    .line 52
    :goto_2
    if-eqz v1, :cond_2

    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_2
    new-instance v1, Lcom/android/launcher3/q5$E;

    .line 56
    .line 57
    invoke-direct {v1, p0, v2, v6}, Lcom/android/launcher3/q5$E;-><init>(Lcom/android/launcher3/q5;Landroid/view/View;Lcom/android/launcher3/util/Y1;)V

    .line 58
    .line 59
    .line 60
    :goto_3
    iput-object v1, p0, Lcom/android/launcher3/q5;->q:Lcom/android/launcher3/M2$b;

    .line 61
    .line 62
    new-instance p1, Lcom/android/launcher3/M2;

    .line 63
    .line 64
    iget-object p2, p0, Lcom/android/launcher3/q5;->i:Landroid/os/Handler;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/q5;->q:Lcom/android/launcher3/M2$b;

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    invoke-direct {p1, p2, p0, v0}, Lcom/android/launcher3/M2;-><init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V

    .line 70
    .line 71
    .line 72
    return-object p1
.end method

.method public static X(Lu2/s;)Landroid/content/ComponentName;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object v1, v1, Landroid/app/ActivityManager$RunningTaskInfo;->baseIntent:Landroid/content/Intent;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 20
    .line 21
    iget-object v1, v1, Landroid/app/ActivityManager$RunningTaskInfo;->baseIntent:Landroid/content/Intent;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 38
    .line 39
    iget-object p0, p0, Landroid/app/ActivityManager$RunningTaskInfo;->baseIntent:Landroid/content/Intent;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    iget-object p0, p0, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 47
    .line 48
    iget-object v1, p0, Landroid/app/ActivityManager$RunningTaskInfo;->origActivity:Landroid/content/ComponentName;

    .line 49
    .line 50
    iget-object v2, p0, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 51
    .line 52
    iget-object v3, p0, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 53
    .line 54
    iget-object p0, p0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 55
    .line 56
    filled-new-array {v1, v2, v3, p0}, [Landroid/content/ComponentName;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 v1, 0x0

    .line 61
    :goto_0
    const/4 v2, 0x4

    .line 62
    if-ge v1, v2, :cond_3

    .line 63
    .line 64
    aget-object v2, p0, v1

    .line 65
    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    return-object v2

    .line 75
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    :goto_1
    return-object v0
.end method

.method private X0(Landroid/view/RemoteAnimationTarget;)Z
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->q3:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-boolean p1, p1, Landroid/view/RemoteAnimationTarget;->willShowImeOnTarget:Z

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method private Y(Landroid/view/RemoteAnimationTarget;)Landroid/view/View;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    iget-object v1, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    iget-object v2, v1, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 10
    .line 11
    iget-object v3, v1, Landroid/app/ActivityManager$RunningTaskInfo;->origActivity:Landroid/content/ComponentName;

    .line 12
    .line 13
    iget-object v4, v1, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 14
    .line 15
    iget-object v1, v1, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 16
    .line 17
    filled-new-array {v2, v3, v4, v1}, [Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    const/4 v3, 0x4

    .line 23
    if-ge v2, v3, :cond_2

    .line 24
    .line 25
    aget-object v3, v1, v2

    .line 26
    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    move-object v1, v0

    .line 44
    :goto_1
    if-nez v1, :cond_3

    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_3
    iget-object v0, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 48
    .line 49
    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->launchCookies:Ljava/util/ArrayList;

    .line 50
    .line 51
    if-nez v0, :cond_4

    .line 52
    .line 53
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 54
    .line 55
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/android/launcher3/util/z2;->a(Ljava/util/List;)Lcom/android/launcher3/util/z2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 62
    .line 63
    iget p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->userId:I

    .line 64
    .line 65
    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->t5(Lcom/android/launcher3/util/z2;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_5
    :goto_2
    return-object v0
.end method

.method private Y0([Landroid/view/RemoteAnimationTarget;)Z
    .locals 6

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, v0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    if-ge v1, p0, :cond_2

    .line 6
    .line 7
    aget-object v3, p1, v1

    .line 8
    .line 9
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    if-ne v4, v5, :cond_1

    .line 13
    .line 14
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    if-gt v2, v5, :cond_0

    .line 17
    .line 18
    iget-object v3, v3, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/app/WindowConfiguration;->getWindowingMode()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, 0x6

    .line 25
    if-ne v3, v4, :cond_1

    .line 26
    .line 27
    :cond_0
    return v5

    .line 28
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    return v0
.end method

.method private Z0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/android/launcher3/V3;

    .line 28
    .line 29
    iget-object v3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 30
    .line 31
    invoke-interface {v1, v3}, Lcom/android/launcher3/statemanager/a;->getBlur(Landroid/content/Context;)F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v1, v2

    .line 37
    :goto_0
    invoke-virtual {v0, v1}, LP1/h;->H(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {v0, v1}, LP1/h;->K(F)V

    .line 48
    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->isDragLayerContentAnim(Lcom/android/launcher3/C2;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const-string v0, "QuickstepTransitionManager"

    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    cmpl-float p1, p1, v2

    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    const-string p1, "skipContentAnimation, reset draglayer alpha 1f"

    .line 77
    .line 78
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getAlpha()F

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    cmpl-float p1, p1, v2

    .line 102
    .line 103
    if-eqz p1, :cond_2

    .line 104
    .line 105
    const-string p1, "skipContentAnimation, reset workspace alpha 1f"

    .line 106
    .line 107
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 117
    .line 118
    .line 119
    :cond_2
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Z)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    sget-object v2, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {p0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/ViewGroup;->resetPivot()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, v1}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/view/ViewGroup;->resetPivot()V

    .line 39
    .line 40
    .line 41
    if-eqz p3, :cond_0

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->k0()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_0

    .line 52
    .line 53
    invoke-virtual {p3, v1}, Landroid/widget/RelativeLayout;->setScaleX(F)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p3, v1}, Landroid/widget/RelativeLayout;->setScaleY(F)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p3, v1}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3}, Landroid/widget/RelativeLayout;->resetPivot()V

    .line 63
    .line 64
    .line 65
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->N0()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 80
    .line 81
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->k:Z

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    :cond_1
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setScaleX(F)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setScaleY(F)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p4, v1}, Lcom/android/launcher3/LongClickTextView;->setAlpha(F)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p4}, Landroid/widget/TextView;->resetPivot()V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    if-eqz v0, :cond_3

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 107
    .line 108
    .line 109
    :cond_3
    :goto_0
    if-nez p5, :cond_4

    .line 110
    .line 111
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->m0()V

    .line 124
    .line 125
    .line 126
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->q4()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/q5;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/q5;->L0(Landroid/view/View;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b0([Lu2/s;I)Lu2/s;
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_1

    .line 4
    .line 5
    aget-object v2, p0, v1

    .line 6
    .line 7
    iget v3, v2, Lu2/s;->m:I

    .line 8
    .line 9
    if-ne v3, p1, :cond_0

    .line 10
    .line 11
    return-object v2

    .line 12
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public static synthetic c(Lcom/android/launcher3/q5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/q5;->H0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/q5;LP1/h;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q5;->G0(LP1/h;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/q5;Landroid/graphics/RectF;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q5;->K0(Landroid/graphics/RectF;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e1()V
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->s:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

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
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/app/Activity;->unregisterRemoteAnimations()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/android/launcher3/q5;->p:Lcom/android/launcher3/M2$b;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/q5;->q:Lcom/android/launcher3/M2$b;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/q5;ILcom/android/launcher3/anim/C;Landroid/graphics/RectF;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/q5;->I0(ILcom/android/launcher3/anim/C;Landroid/graphics/RectF;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/anim/C;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic h(Landroid/view/RemoteAnimationTarget;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/ActivityManager$RunningTaskInfo;->isFreeform()Z

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

.method public static synthetic i(Lcom/android/launcher3/taskbar/V;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/V;->u0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private i0()Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [F

    .line 13
    .line 14
    fill-array-data v1, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-wide v2, Lcom/android/launcher3/q5;->V:J

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 27
    .line 28
    sget-object v3, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 29
    .line 30
    invoke-interface {v2, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    new-instance v2, Lcom/android/launcher3/f5;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/f5;-><init>(Lcom/android/launcher3/q5;LP1/h;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-object v1

    .line 45
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic j(Lcom/android/launcher3/q5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/q5;->M0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/q5;Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/q5;->F0(Lcom/android/quickstep/views/RecentsView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)Lcom/android/quickstep/util/RectFSpringAnim;
    .locals 31

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move-object/from16 v13, p5

    .line 6
    .line 7
    const/4 v10, 0x1

    .line 8
    new-instance v3, Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 11
    .line 12
    .line 13
    array-length v4, v2

    .line 14
    const/4 v5, 0x0

    .line 15
    :goto_0
    if-ge v5, v4, :cond_1

    .line 16
    .line 17
    aget-object v6, v2, v5

    .line 18
    .line 19
    iget v7, v6, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 20
    .line 21
    if-ne v7, v10, :cond_0

    .line 22
    .line 23
    iget-boolean v4, v6, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    .line 24
    .line 25
    move v8, v4

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    add-int/2addr v5, v10

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v6, 0x0

    .line 30
    const/4 v8, 0x0

    .line 31
    :goto_1
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-interface {v4}, Lcom/android/launcher3/globalsearch/s;->b()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_2

    .line 50
    .line 51
    move v4, v10

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    const/4 v4, 0x0

    .line 54
    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v7, "isAppLocationAnimRunning="

    .line 60
    .line 61
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v7, " "

    .line 68
    .line 69
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget v7, v1, Lcom/android/launcher3/q5;->R:I

    .line 73
    .line 74
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    const-string v7, "QuickstepTransitionManager"

    .line 82
    .line 83
    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lx1/O;->Y2()Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-eqz v5, :cond_3

    .line 91
    .line 92
    invoke-static {}, Lx1/O;->k1()Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-nez v5, :cond_3

    .line 97
    .line 98
    move v5, v10

    .line 99
    goto :goto_3

    .line 100
    :cond_3
    const/4 v5, 0x0

    .line 101
    :goto_3
    new-instance v7, Landroid/graphics/RectF;

    .line 102
    .line 103
    invoke-direct {v7}, Landroid/graphics/RectF;-><init>()V

    .line 104
    .line 105
    .line 106
    if-nez v4, :cond_5

    .line 107
    .line 108
    if-nez v5, :cond_5

    .line 109
    .line 110
    iget v4, v1, Lcom/android/launcher3/q5;->R:I

    .line 111
    .line 112
    invoke-static {v4}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 113
    .line 114
    .line 115
    move-result v4

    .line 116
    if-eqz v4, :cond_4

    .line 117
    .line 118
    goto :goto_4

    .line 119
    :cond_4
    const/4 v15, 0x0

    .line 120
    goto :goto_5

    .line 121
    :cond_5
    :goto_4
    move v15, v10

    .line 122
    :goto_5
    sget-object v4, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 123
    .line 124
    iget-object v5, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 125
    .line 126
    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    move-object v14, v4

    .line 135
    check-cast v14, Lcom/android/launcher3/anim/C;

    .line 136
    .line 137
    instance-of v4, v13, Lcom/android/launcher3/widget/T;

    .line 138
    .line 139
    const/4 v9, 0x5

    .line 140
    const/16 v16, 0x0

    .line 141
    .line 142
    const/4 v12, 0x3

    .line 143
    const/high16 v10, 0x3f800000    # 1.0f

    .line 144
    .line 145
    const/4 v11, 0x0

    .line 146
    if-eqz v4, :cond_7

    .line 147
    .line 148
    if-nez v15, :cond_7

    .line 149
    .line 150
    new-instance v4, Landroid/util/Size;

    .line 151
    .line 152
    iget-object v7, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 153
    .line 154
    iget v5, v7, Lcom/android/launcher3/h0;->V0:I

    .line 155
    .line 156
    iget v7, v7, Lcom/android/launcher3/h0;->W0:I

    .line 157
    .line 158
    invoke-direct {v4, v5, v7}, Landroid/util/Size;-><init>(II)V

    .line 159
    .line 160
    .line 161
    iget-object v5, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 162
    .line 163
    invoke-static {v5, v6}, Lcom/android/quickstep/views/FloatingWidgetView;->getDefaultBackgroundColor(Landroid/content/Context;Landroid/view/RemoteAnimationTarget;)I

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    move v6, v9

    .line 168
    move v9, v5

    .line 169
    move-object v5, v3

    .line 170
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 171
    .line 172
    move v7, v6

    .line 173
    move-object v6, v4

    .line 174
    move-object v4, v13

    .line 175
    check-cast v4, Lcom/android/launcher3/widget/T;

    .line 176
    .line 177
    iget-object v7, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 178
    .line 179
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->O0:Z

    .line 180
    .line 181
    if-eqz v7, :cond_6

    .line 182
    .line 183
    move v7, v11

    .line 184
    :goto_6
    const/4 v0, 0x5

    .line 185
    goto :goto_7

    .line 186
    :cond_6
    invoke-static {v3}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 187
    .line 188
    .line 189
    move-result v7

    .line 190
    goto :goto_6

    .line 191
    :goto_7
    invoke-static/range {v3 .. v9}, Lcom/android/quickstep/views/FloatingWidgetView;->getFloatingWidgetView(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)Lcom/android/quickstep/views/FloatingWidgetView;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    move/from16 v20, v8

    .line 196
    .line 197
    move-object/from16 v21, v3

    .line 198
    .line 199
    move/from16 v19, v10

    .line 200
    .line 201
    move-object v4, v13

    .line 202
    move-object/from16 v3, v16

    .line 203
    .line 204
    move-object/from16 v23, v3

    .line 205
    .line 206
    const/4 v6, 0x0

    .line 207
    const/4 v9, 0x2

    .line 208
    const/16 v22, -0x1

    .line 209
    .line 210
    move-object v13, v5

    .line 211
    goto/16 :goto_10

    .line 212
    .line 213
    :cond_7
    move-object v5, v3

    .line 214
    move/from16 v20, v8

    .line 215
    .line 216
    move v0, v9

    .line 217
    if-eqz v13, :cond_c

    .line 218
    .line 219
    sget-object v3, Lcom/android/launcher3/E5;->e:Lcom/android/launcher3/util/I;

    .line 220
    .line 221
    iget-object v4, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 222
    .line 223
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    check-cast v3, Lcom/android/launcher3/E5;

    .line 228
    .line 229
    invoke-virtual {v3}, Lcom/android/launcher3/E5;->m()Z

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    if-nez v3, :cond_c

    .line 234
    .line 235
    if-nez v15, :cond_c

    .line 236
    .line 237
    new-instance v8, Landroid/graphics/RectF;

    .line 238
    .line 239
    invoke-direct {v8}, Landroid/graphics/RectF;-><init>()V

    .line 240
    .line 241
    .line 242
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 243
    .line 244
    invoke-virtual {v3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    if-nez v4, :cond_8

    .line 249
    .line 250
    move-object/from16 v6, v16

    .line 251
    .line 252
    goto :goto_8

    .line 253
    :cond_8
    iget-object v4, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 254
    .line 255
    invoke-virtual {v4}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 256
    .line 257
    .line 258
    move-result-object v4

    .line 259
    invoke-virtual {v4, v13}, Lcom/android/launcher3/taskbar/o4;->i(Landroid/view/View;)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    move-object v6, v4

    .line 264
    :goto_8
    const/4 v7, 0x1

    .line 265
    const/4 v9, 0x0

    .line 266
    move-object v4, v5

    .line 267
    const/4 v5, 0x0

    .line 268
    move-object/from16 v30, v13

    .line 269
    .line 270
    move-object v13, v4

    .line 271
    move-object/from16 v4, v30

    .line 272
    .line 273
    invoke-static/range {v3 .. v9}, Lcom/android/launcher3/views/FloatingIconView;->v(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    instance-of v6, v5, Lcom/android/launcher3/model/data/y;

    .line 282
    .line 283
    if-eqz v6, :cond_9

    .line 284
    .line 285
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 286
    .line 287
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/y;->isInHotseat()Z

    .line 288
    .line 289
    .line 290
    move-result v6

    .line 291
    if-eqz v6, :cond_a

    .line 292
    .line 293
    iget-object v7, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 294
    .line 295
    invoke-virtual {v7, v5}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->u5(Lcom/android/launcher3/model/data/y;)I

    .line 296
    .line 297
    .line 298
    move-result v5

    .line 299
    int-to-float v5, v5

    .line 300
    invoke-virtual {v13, v5, v11}, Landroid/graphics/RectF;->offset(FF)V

    .line 301
    .line 302
    .line 303
    goto :goto_9

    .line 304
    :cond_9
    const/4 v6, 0x0

    .line 305
    :cond_a
    :goto_9
    invoke-virtual {v13, v8}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 306
    .line 307
    .line 308
    instance-of v5, v4, Lcom/android/launcher3/BubbleTextView;

    .line 309
    .line 310
    if-eqz v5, :cond_b

    .line 311
    .line 312
    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    .line 313
    .line 314
    .line 315
    move-result v5

    .line 316
    iget-object v7, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 317
    .line 318
    iget v7, v7, Lcom/android/launcher3/h0;->B1:I

    .line 319
    .line 320
    int-to-float v7, v7

    .line 321
    div-float/2addr v5, v7

    .line 322
    invoke-virtual {v14}, Lcom/android/launcher3/anim/C;->T()I

    .line 323
    .line 324
    .line 325
    move-result v7

    .line 326
    int-to-float v7, v7

    .line 327
    mul-float/2addr v7, v5

    .line 328
    invoke-virtual {v13, v7, v7}, Landroid/graphics/RectF;->inset(FF)V

    .line 329
    .line 330
    .line 331
    goto :goto_a

    .line 332
    :cond_b
    move v5, v10

    .line 333
    :goto_a
    move/from16 v19, v5

    .line 334
    .line 335
    move-object/from16 v21, v16

    .line 336
    .line 337
    move-object/from16 v23, v21

    .line 338
    .line 339
    :goto_b
    const/4 v9, 0x2

    .line 340
    :goto_c
    const/16 v22, -0x1

    .line 341
    .line 342
    goto/16 :goto_10

    .line 343
    .line 344
    :cond_c
    move-object v4, v13

    .line 345
    move-object v13, v5

    .line 346
    iget v3, v1, Lcom/android/launcher3/q5;->R:I

    .line 347
    .line 348
    if-eq v3, v12, :cond_d

    .line 349
    .line 350
    if-ne v3, v0, :cond_e

    .line 351
    .line 352
    :cond_d
    const/4 v9, 0x2

    .line 353
    goto :goto_e

    .line 354
    :cond_e
    const/4 v5, 0x4

    .line 355
    if-ne v3, v5, :cond_10

    .line 356
    .line 357
    new-instance v3, Landroid/graphics/RectF;

    .line 358
    .line 359
    invoke-direct {v3, v11, v11, v10, v10}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 360
    .line 361
    .line 362
    iget-object v5, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 363
    .line 364
    iget v6, v1, Lcom/android/launcher3/q5;->S:I

    .line 365
    .line 366
    invoke-static {v5, v6, v7}, Lcom/android/quickstep/views/CapsuleView;->getCapsuleView(Lcom/android/launcher3/C2;ILandroid/graphics/RectF;)Lcom/android/quickstep/views/CapsuleView;

    .line 367
    .line 368
    .line 369
    move-result-object v23

    .line 370
    if-nez v23, :cond_f

    .line 371
    .line 372
    const/4 v5, -0x1

    .line 373
    iput v5, v1, Lcom/android/launcher3/q5;->S:I

    .line 374
    .line 375
    invoke-direct {v1}, Lcom/android/launcher3/q5;->n0()Landroid/graphics/RectF;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    invoke-virtual {v13, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 380
    .line 381
    .line 382
    move-object/from16 v3, v16

    .line 383
    .line 384
    goto :goto_d

    .line 385
    :cond_f
    iget-object v5, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 386
    .line 387
    const/16 v26, 0x1

    .line 388
    .line 389
    const/16 v28, 0x0

    .line 390
    .line 391
    const/16 v24, 0x0

    .line 392
    .line 393
    const/16 v25, 0x0

    .line 394
    .line 395
    move-object/from16 v27, v3

    .line 396
    .line 397
    move-object/from16 v22, v5

    .line 398
    .line 399
    invoke-static/range {v22 .. v28}, Lcom/android/launcher3/views/FloatingIconView;->v(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    invoke-virtual {v13, v7}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 404
    .line 405
    .line 406
    :goto_d
    move/from16 v19, v10

    .line 407
    .line 408
    move-object/from16 v21, v16

    .line 409
    .line 410
    const/4 v6, 0x0

    .line 411
    goto :goto_b

    .line 412
    :cond_10
    const/4 v9, 0x2

    .line 413
    iput v9, v1, Lcom/android/launcher3/q5;->R:I

    .line 414
    .line 415
    invoke-direct {v1}, Lcom/android/launcher3/q5;->n0()Landroid/graphics/RectF;

    .line 416
    .line 417
    .line 418
    move-result-object v3

    .line 419
    invoke-virtual {v13, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 420
    .line 421
    .line 422
    goto :goto_f

    .line 423
    :goto_e
    iget-object v5, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 424
    .line 425
    invoke-static {v5, v3}, Lcom/android/launcher3/anim/C;->U(Lcom/android/launcher3/statemanager/h;I)Landroid/graphics/RectF;

    .line 426
    .line 427
    .line 428
    move-result-object v3

    .line 429
    invoke-virtual {v13, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 430
    .line 431
    .line 432
    :goto_f
    move/from16 v19, v10

    .line 433
    .line 434
    move-object/from16 v3, v16

    .line 435
    .line 436
    move-object/from16 v21, v3

    .line 437
    .line 438
    move-object/from16 v23, v21

    .line 439
    .line 440
    const/4 v6, 0x0

    .line 441
    goto :goto_c

    .line 442
    :goto_10
    iget v5, v1, Lcom/android/launcher3/q5;->R:I

    .line 443
    .line 444
    invoke-static {v5}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 445
    .line 446
    .line 447
    move-result v5

    .line 448
    if-nez v5, :cond_13

    .line 449
    .line 450
    invoke-static {}, Lx1/O;->Y2()Z

    .line 451
    .line 452
    .line 453
    move-result v5

    .line 454
    if-eqz v5, :cond_13

    .line 455
    .line 456
    invoke-static {}, Lx1/O;->W2()Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-nez v0, :cond_12

    .line 461
    .line 462
    invoke-static {}, Lx1/O;->X2()Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-eqz v0, :cond_11

    .line 467
    .line 468
    move-object/from16 v0, p3

    .line 469
    .line 470
    move-object/from16 v3, p4

    .line 471
    .line 472
    move-object v4, v2

    .line 473
    const/4 v5, 0x0

    .line 474
    move-object/from16 v2, p1

    .line 475
    .line 476
    goto :goto_11

    .line 477
    :cond_11
    move-object/from16 v5, p7

    .line 478
    .line 479
    move/from16 v6, p8

    .line 480
    .line 481
    move-object v0, v1

    .line 482
    move-object v3, v4

    .line 483
    move-object/from16 v1, p1

    .line 484
    .line 485
    move-object/from16 v4, p6

    .line 486
    .line 487
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/q5;->l0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)V

    .line 488
    .line 489
    .line 490
    goto :goto_12

    .line 491
    :cond_12
    move-object v4, v2

    .line 492
    move-object/from16 v2, p1

    .line 493
    .line 494
    move-object/from16 v0, p3

    .line 495
    .line 496
    move-object/from16 v3, p4

    .line 497
    .line 498
    const/4 v5, 0x0

    .line 499
    :goto_11
    invoke-virtual {v1, v4, v0, v3, v5}, Lcom/android/launcher3/q5;->r0([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 504
    .line 505
    .line 506
    :goto_12
    return-object v16

    .line 507
    :cond_13
    move-object v4, v2

    .line 508
    move-object/from16 v2, p1

    .line 509
    .line 510
    if-eqz v21, :cond_14

    .line 511
    .line 512
    const/4 v5, 0x1

    .line 513
    iput v5, v1, Lcom/android/launcher3/q5;->R:I

    .line 514
    .line 515
    :cond_14
    iget-object v5, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 516
    .line 517
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->p3:Z

    .line 518
    .line 519
    new-instance v5, Lcom/android/quickstep/util/RectFSpringAnim;

    .line 520
    .line 521
    new-instance v7, Lcom/android/quickstep/util/RectFSpringAnim$MFVSpringConfig;

    .line 522
    .line 523
    iget-object v2, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 524
    .line 525
    move-object v8, v3

    .line 526
    iget-object v3, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 527
    .line 528
    move-object/from16 v24, v7

    .line 529
    .line 530
    const/high16 v7, 0x3f800000    # 1.0f

    .line 531
    .line 532
    move-object/from16 v25, v8

    .line 533
    .line 534
    iget v8, v1, Lcom/android/launcher3/q5;->R:I

    .line 535
    .line 536
    move-object/from16 v4, p7

    .line 537
    .line 538
    move-object v0, v5

    .line 539
    move-object v5, v13

    .line 540
    move-object/from16 v9, v21

    .line 541
    .line 542
    move-object/from16 v10, v25

    .line 543
    .line 544
    move-object v13, v1

    .line 545
    move-object/from16 v1, v24

    .line 546
    .line 547
    invoke-direct/range {v1 .. v8}, Lcom/android/quickstep/util/RectFSpringAnim$MFVSpringConfig;-><init>(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/RectF;Landroid/graphics/RectF;ZFI)V

    .line 548
    .line 549
    .line 550
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim;-><init>(Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;)V

    .line 551
    .line 552
    .line 553
    const/4 v1, 0x1

    .line 554
    iput-boolean v1, v13, Lcom/android/launcher3/q5;->E:Z

    .line 555
    .line 556
    new-instance v1, Lcom/android/launcher3/i5;

    .line 557
    .line 558
    invoke-direct {v1, v13}, Lcom/android/launcher3/i5;-><init>(Lcom/android/launcher3/q5;)V

    .line 559
    .line 560
    .line 561
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 562
    .line 563
    .line 564
    move-result-object v1

    .line 565
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 566
    .line 567
    .line 568
    iget-object v1, v13, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 569
    .line 570
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 571
    .line 572
    .line 573
    move-result-object v1

    .line 574
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 575
    .line 576
    .line 577
    move-result v1

    .line 578
    int-to-float v1, v1

    .line 579
    if-eqz v23, :cond_15

    .line 580
    .line 581
    move-object/from16 v2, v23

    .line 582
    .line 583
    :goto_13
    const/4 v3, 0x0

    .line 584
    goto :goto_14

    .line 585
    :cond_15
    if-nez v15, :cond_16

    .line 586
    .line 587
    move-object/from16 v2, p5

    .line 588
    .line 589
    goto :goto_13

    .line 590
    :cond_16
    move-object/from16 v2, v16

    .line 591
    .line 592
    goto :goto_13

    .line 593
    :goto_14
    invoke-virtual {v14, v2, v3}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 594
    .line 595
    .line 596
    move-result v2

    .line 597
    invoke-virtual/range {p7 .. p7}, Landroid/graphics/RectF;->width()F

    .line 598
    .line 599
    .line 600
    move-result v3

    .line 601
    invoke-virtual/range {p7 .. p7}, Landroid/graphics/RectF;->height()F

    .line 602
    .line 603
    .line 604
    move-result v4

    .line 605
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    .line 606
    .line 607
    .line 608
    move-result v3

    .line 609
    div-float v7, p8, v3

    .line 610
    .line 611
    new-instance v4, Landroid/graphics/Rect;

    .line 612
    .line 613
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 614
    .line 615
    .line 616
    move-object/from16 v3, p7

    .line 617
    .line 618
    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 619
    .line 620
    .line 621
    move-object v3, v5

    .line 622
    new-instance v5, Landroid/graphics/Rect;

    .line 623
    .line 624
    iget-object v8, v13, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 625
    .line 626
    iget v11, v8, Lcom/android/launcher3/h0;->T0:I

    .line 627
    .line 628
    iget v8, v8, Lcom/android/launcher3/h0;->U0:I

    .line 629
    .line 630
    const/4 v12, 0x0

    .line 631
    invoke-direct {v5, v12, v12, v11, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 632
    .line 633
    .line 634
    if-eqz v10, :cond_19

    .line 635
    .line 636
    invoke-virtual {v0, v10}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 637
    .line 638
    .line 639
    new-instance v8, Lcom/android/launcher3/j5;

    .line 640
    .line 641
    invoke-direct {v8, v0}, Lcom/android/launcher3/j5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 642
    .line 643
    .line 644
    invoke-virtual {v10, v8}, Lcom/android/launcher3/views/FloatingIconView;->setOnTargetChangeListener(Ljava/lang/Runnable;)V

    .line 645
    .line 646
    .line 647
    new-instance v8, Lcom/android/launcher3/k5;

    .line 648
    .line 649
    invoke-direct {v8, v0}, Lcom/android/launcher3/k5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 650
    .line 651
    .line 652
    invoke-virtual {v10, v8}, Lcom/android/launcher3/views/FloatingIconView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 653
    .line 654
    .line 655
    new-instance v12, Landroid/graphics/RectF;

    .line 656
    .line 657
    invoke-direct {v12}, Landroid/graphics/RectF;-><init>()V

    .line 658
    .line 659
    .line 660
    new-instance v8, Landroid/graphics/RectF;

    .line 661
    .line 662
    invoke-direct {v8}, Landroid/graphics/RectF;-><init>()V

    .line 663
    .line 664
    .line 665
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 666
    .line 667
    .line 668
    move-result v9

    .line 669
    if-eqz v9, :cond_17

    .line 670
    .line 671
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 672
    .line 673
    .line 674
    move-result v9

    .line 675
    int-to-float v9, v9

    .line 676
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 677
    .line 678
    .line 679
    move-result v11

    .line 680
    :goto_15
    int-to-float v11, v11

    .line 681
    div-float/2addr v9, v11

    .line 682
    move/from16 v16, v9

    .line 683
    .line 684
    goto :goto_16

    .line 685
    :cond_17
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 686
    .line 687
    .line 688
    move-result v9

    .line 689
    int-to-float v9, v9

    .line 690
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 691
    .line 692
    .line 693
    move-result v11

    .line 694
    goto :goto_15

    .line 695
    :goto_16
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 696
    .line 697
    .line 698
    move-result v9

    .line 699
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 700
    .line 701
    .line 702
    move-result v11

    .line 703
    div-float v17, v9, v11

    .line 704
    .line 705
    iget v9, v13, Lcom/android/launcher3/q5;->S:I

    .line 706
    .line 707
    move/from16 v11, v22

    .line 708
    .line 709
    if-eq v9, v11, :cond_18

    .line 710
    .line 711
    if-eqz v23, :cond_18

    .line 712
    .line 713
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 714
    .line 715
    .line 716
    move-result-object v9

    .line 717
    iget-object v11, v13, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 718
    .line 719
    move/from16 v18, v1

    .line 720
    .line 721
    const/16 v1, 0xd

    .line 722
    .line 723
    invoke-virtual {v9, v11, v1}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 724
    .line 725
    .line 726
    iget v1, v13, Lcom/android/launcher3/q5;->S:I

    .line 727
    .line 728
    new-instance v9, Lcom/android/launcher3/l5;

    .line 729
    .line 730
    invoke-direct {v9, v13, v1, v14}, Lcom/android/launcher3/l5;-><init>(Lcom/android/launcher3/q5;ILcom/android/launcher3/anim/C;)V

    .line 731
    .line 732
    .line 733
    invoke-virtual {v0, v9}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 734
    .line 735
    .line 736
    new-instance v9, Lcom/android/launcher3/m5;

    .line 737
    .line 738
    invoke-direct {v9, v13, v1, v14}, Lcom/android/launcher3/m5;-><init>(Lcom/android/launcher3/q5;ILcom/android/launcher3/anim/C;)V

    .line 739
    .line 740
    .line 741
    invoke-static {v9}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 742
    .line 743
    .line 744
    move-result-object v1

    .line 745
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 746
    .line 747
    .line 748
    :goto_17
    move-object v1, v0

    .line 749
    goto :goto_18

    .line 750
    :cond_18
    move/from16 v18, v1

    .line 751
    .line 752
    goto :goto_17

    .line 753
    :goto_18
    new-instance v0, Lcom/android/launcher3/q5$f;

    .line 754
    .line 755
    move-object v13, v8

    .line 756
    const/4 v8, 0x0

    .line 757
    move/from16 v11, v18

    .line 758
    .line 759
    move-object/from16 v18, v3

    .line 760
    .line 761
    move-object/from16 v29, v1

    .line 762
    .line 763
    move v9, v2

    .line 764
    move-object/from16 v20, v10

    .line 765
    .line 766
    move-object/from16 v28, v14

    .line 767
    .line 768
    move-object/from16 v1, p0

    .line 769
    .line 770
    move-object/from16 v2, p2

    .line 771
    .line 772
    move-object/from16 v14, p5

    .line 773
    .line 774
    move v10, v6

    .line 775
    move/from16 v6, p8

    .line 776
    .line 777
    invoke-direct/range {v0 .. v20}, Lcom/android/launcher3/q5$f;-><init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIFZFLandroid/graphics/RectF;Landroid/graphics/RectF;Landroid/view/View;ZFFLandroid/graphics/RectF;FLcom/android/launcher3/views/FloatingIconView;)V

    .line 778
    .line 779
    .line 780
    move-object/from16 v14, v29

    .line 781
    .line 782
    invoke-virtual {v14, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 783
    .line 784
    .line 785
    goto/16 :goto_1d

    .line 786
    .line 787
    :cond_19
    move v11, v1

    .line 788
    move-object v1, v5

    .line 789
    move-object/from16 v28, v14

    .line 790
    .line 791
    move-object v14, v0

    .line 792
    move v0, v2

    .line 793
    move-object v5, v3

    .line 794
    if-eqz v9, :cond_1c

    .line 795
    .line 796
    invoke-virtual {v14, v9}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 797
    .line 798
    .line 799
    new-instance v0, Lcom/android/launcher3/j5;

    .line 800
    .line 801
    invoke-direct {v0, v14}, Lcom/android/launcher3/j5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 802
    .line 803
    .line 804
    invoke-virtual {v9, v0}, Lcom/android/quickstep/views/FloatingWidgetView;->setOnTargetChangeListener(Ljava/lang/Runnable;)V

    .line 805
    .line 806
    .line 807
    new-instance v0, Lcom/android/launcher3/k5;

    .line 808
    .line 809
    invoke-direct {v0, v14}, Lcom/android/launcher3/k5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 810
    .line 811
    .line 812
    invoke-virtual {v9, v0}, Lcom/android/quickstep/views/FloatingWidgetView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 813
    .line 814
    .line 815
    move-object/from16 v21, v9

    .line 816
    .line 817
    invoke-virtual/range {v21 .. v21}, Lcom/android/quickstep/views/FloatingWidgetView;->getInitialCornerRadius()F

    .line 818
    .line 819
    .line 820
    move-result v9

    .line 821
    if-eqz v20, :cond_1a

    .line 822
    .line 823
    const/16 v23, 0x0

    .line 824
    .line 825
    goto :goto_19

    .line 826
    :cond_1a
    const/high16 v23, 0x3f800000    # 1.0f

    .line 827
    .line 828
    :goto_19
    const/high16 v25, 0x3f800000    # 1.0f

    .line 829
    .line 830
    const/high16 v26, 0x3f800000    # 1.0f

    .line 831
    .line 832
    const/16 v24, 0x0

    .line 833
    .line 834
    move-object/from16 v22, p7

    .line 835
    .line 836
    invoke-virtual/range {v21 .. v26}, Lcom/android/quickstep/views/FloatingWidgetView;->update(Landroid/graphics/RectF;FFFF)V

    .line 837
    .line 838
    .line 839
    move-object/from16 v3, v21

    .line 840
    .line 841
    invoke-virtual {v14, v3}, Lcom/android/quickstep/util/RectFSpringAnim;->addDelayedAnimatorListener(Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;)V

    .line 842
    .line 843
    .line 844
    new-instance v0, Lcom/android/launcher3/n5;

    .line 845
    .line 846
    invoke-direct {v0, v14}, Lcom/android/launcher3/n5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 847
    .line 848
    .line 849
    move-object/from16 v2, v16

    .line 850
    .line 851
    invoke-virtual {v3, v0, v2}, Lcom/android/quickstep/views/FloatingWidgetView;->setDelayedFinishRunnable(Ljava/lang/Runnable;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 852
    .line 853
    .line 854
    invoke-virtual {v3, v9}, Lcom/android/quickstep/views/FloatingWidgetView;->setCornerRadius(F)V

    .line 855
    .line 856
    .line 857
    if-eqz v20, :cond_1b

    .line 858
    .line 859
    const/4 v12, 0x0

    .line 860
    goto :goto_1a

    .line 861
    :cond_1b
    const/high16 v12, 0x3f800000    # 1.0f

    .line 862
    .line 863
    :goto_1a
    new-instance v0, Lcom/android/launcher3/q5$g;

    .line 864
    .line 865
    const/4 v8, 0x1

    .line 866
    move-object/from16 v2, p2

    .line 867
    .line 868
    move-object/from16 v13, p5

    .line 869
    .line 870
    move/from16 v6, p8

    .line 871
    .line 872
    move v10, v11

    .line 873
    move-object v11, v3

    .line 874
    move-object v3, v5

    .line 875
    move-object v5, v1

    .line 876
    move-object/from16 v1, p0

    .line 877
    .line 878
    invoke-direct/range {v0 .. v13}, Lcom/android/launcher3/q5$g;-><init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIFFLcom/android/quickstep/views/FloatingWidgetView;FLandroid/view/View;)V

    .line 879
    .line 880
    .line 881
    invoke-virtual {v14, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 882
    .line 883
    .line 884
    goto :goto_1d

    .line 885
    :cond_1c
    move-object v2, v1

    .line 886
    move-object/from16 v1, p0

    .line 887
    .line 888
    iget v3, v1, Lcom/android/launcher3/q5;->R:I

    .line 889
    .line 890
    const/4 v6, 0x3

    .line 891
    if-ne v3, v6, :cond_1e

    .line 892
    .line 893
    new-instance v3, Lcom/android/launcher3/o5;

    .line 894
    .line 895
    invoke-direct {v3, v1}, Lcom/android/launcher3/o5;-><init>(Lcom/android/launcher3/q5;)V

    .line 896
    .line 897
    .line 898
    invoke-virtual {v14, v3}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 899
    .line 900
    .line 901
    :cond_1d
    :goto_1b
    move v9, v0

    .line 902
    goto :goto_1c

    .line 903
    :cond_1e
    const/4 v6, 0x5

    .line 904
    if-ne v3, v6, :cond_1d

    .line 905
    .line 906
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 907
    .line 908
    iget-object v6, v1, Lcom/android/launcher3/q5;->T:Ljava/lang/String;

    .line 909
    .line 910
    invoke-static {v3, v6}, Lcom/zte/toolsdk/producer/AnimationEndNotifier;->notifyAnimationEnd(Landroid/content/Context;Ljava/lang/String;)Z

    .line 911
    .line 912
    .line 913
    goto :goto_1b

    .line 914
    :goto_1c
    new-instance v0, Lcom/android/launcher3/q5$I;

    .line 915
    .line 916
    iget v8, v1, Lcom/android/launcher3/q5;->R:I

    .line 917
    .line 918
    move/from16 v6, p8

    .line 919
    .line 920
    move-object v3, v5

    .line 921
    move-object v5, v2

    .line 922
    move-object/from16 v2, p2

    .line 923
    .line 924
    invoke-direct/range {v0 .. v9}, Lcom/android/launcher3/q5$I;-><init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIF)V

    .line 925
    .line 926
    .line 927
    invoke-virtual {v14, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 928
    .line 929
    .line 930
    :goto_1d
    new-instance v0, Lcom/android/launcher3/q5$h;

    .line 931
    .line 932
    move-object/from16 v1, p0

    .line 933
    .line 934
    move-object/from16 v4, p1

    .line 935
    .line 936
    move-object/from16 v3, p2

    .line 937
    .line 938
    move-object/from16 v6, p6

    .line 939
    .line 940
    move-object v5, v14

    .line 941
    move-object/from16 v2, v28

    .line 942
    .line 943
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/q5$h;-><init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/anim/C;[Landroid/view/RemoteAnimationTarget;Landroid/animation/AnimatorSet;Lcom/android/quickstep/util/RectFSpringAnim;Landroid/graphics/PointF;)V

    .line 944
    .line 945
    .line 946
    move-object v1, v4

    .line 947
    move-object/from16 v29, v5

    .line 948
    .line 949
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 950
    .line 951
    .line 952
    const/4 v9, 0x2

    .line 953
    new-array v0, v9, [F

    .line 954
    .line 955
    fill-array-data v0, :array_0

    .line 956
    .line 957
    .line 958
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 959
    .line 960
    .line 961
    move-result-object v0

    .line 962
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 963
    .line 964
    .line 965
    sget-boolean v0, Lf1/a;->H:Z

    .line 966
    .line 967
    if-nez v0, :cond_1f

    .line 968
    .line 969
    sget v0, Lcom/android/launcher3/anim/C;->T:I

    .line 970
    .line 971
    int-to-long v2, v0

    .line 972
    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 973
    .line 974
    .line 975
    :cond_1f
    return-object v29

    .line 976
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic l(Lcom/android/launcher3/q5;ILcom/android/launcher3/anim/C;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/q5;->J0(ILcom/android/launcher3/anim/C;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)V
    .locals 10

    .line 1
    new-instance v4, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p5, v4}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    new-instance v5, Landroid/graphics/Rect;

    .line 10
    .line 11
    iget-object p4, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 12
    .line 13
    iget v0, p4, Lcom/android/launcher3/h0;->T0:I

    .line 14
    .line 15
    iget p4, p4, Lcom/android/launcher3/h0;->U0:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {v5, v1, v1, v0, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 19
    .line 20
    .line 21
    sget-object p4, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p4, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    check-cast p4, Lcom/android/launcher3/anim/C;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p4, v0, v1}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    invoke-virtual {p5}, Landroid/graphics/RectF;->width()F

    .line 41
    .line 42
    .line 43
    move-result p4

    .line 44
    invoke-virtual {p5}, Landroid/graphics/RectF;->height()F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-static {p4, v0}, Ljava/lang/Math;->min(FF)F

    .line 49
    .line 50
    .line 51
    move-result p4

    .line 52
    div-float v7, p6, p4

    .line 53
    .line 54
    invoke-direct {p0}, Lcom/android/launcher3/q5;->n0()Landroid/graphics/RectF;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    new-instance v0, Lcom/android/launcher3/q5$u;

    .line 59
    .line 60
    const/4 v8, 0x2

    .line 61
    move-object v1, p0

    .line 62
    move-object v2, p2

    .line 63
    move/from16 v6, p6

    .line 64
    .line 65
    invoke-direct/range {v0 .. v9}, Lcom/android/launcher3/q5$u;-><init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIF)V

    .line 66
    .line 67
    .line 68
    const/4 p2, 0x2

    .line 69
    new-array p2, p2, [F

    .line 70
    .line 71
    fill-array-data p2, :array_0

    .line 72
    .line 73
    .line 74
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    sget-wide v4, Lcom/android/launcher3/q5;->V:J

    .line 79
    .line 80
    invoke-virtual {p2, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    .line 83
    sget-object p4, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 84
    .line 85
    invoke-virtual {p2, p4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 86
    .line 87
    .line 88
    new-instance p4, Lcom/android/launcher3/q5$v;

    .line 89
    .line 90
    invoke-direct {p4, p0, p5, v3, v0}, Lcom/android/launcher3/q5$v;-><init>(Lcom/android/launcher3/q5;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/launcher3/q5$I;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2, p4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    nop

    .line 101
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static bridge synthetic m(Lcom/android/launcher3/q5;)Lcom/android/launcher3/M2$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->q:Lcom/android/launcher3/M2$b;

    .line 2
    .line 3
    return-object p0
.end method

.method private m0(I)Lcom/android/launcher3/anim/g;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/q5$j;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/q5$j;-><init>(Lcom/android/launcher3/q5;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/q5;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->F:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method private n0()Landroid/graphics/RectF;
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->Y2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/android/launcher3/anim/C;->b0(Lcom/android/launcher3/h0;)Landroid/graphics/RectF;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget v1, p0, Lcom/android/launcher3/h0;->B1:I

    .line 37
    .line 38
    div-int/lit8 v1, v1, 0x2

    .line 39
    .line 40
    iget v2, p0, Lcom/android/launcher3/h0;->V0:I

    .line 41
    .line 42
    iget v3, p0, Lcom/android/launcher3/h0;->W0:I

    .line 43
    .line 44
    invoke-interface {v0, v2, v3}, Lcom/android/launcher3/touch/G;->getPrimaryValue(II)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    int-to-float v2, v2

    .line 49
    iget v3, p0, Lcom/android/launcher3/h0;->V0:I

    .line 50
    .line 51
    iget v4, p0, Lcom/android/launcher3/h0;->W0:I

    .line 52
    .line 53
    invoke-interface {v0, v3, v4}, Lcom/android/launcher3/touch/G;->getSecondaryValue(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    int-to-float v0, v0

    .line 58
    const/high16 v3, 0x40000000    # 2.0f

    .line 59
    .line 60
    div-float/2addr v2, v3

    .line 61
    div-float/2addr v0, v3

    .line 62
    iget p0, p0, Lcom/android/launcher3/h0;->f2:I

    .line 63
    .line 64
    int-to-float p0, p0

    .line 65
    sub-float/2addr v0, p0

    .line 66
    new-instance p0, Landroid/graphics/RectF;

    .line 67
    .line 68
    int-to-float v1, v1

    .line 69
    sub-float v3, v2, v1

    .line 70
    .line 71
    sub-float v4, v0, v1

    .line 72
    .line 73
    add-float/2addr v2, v1

    .line 74
    add-float/2addr v0, v1

    .line 75
    invoke-direct {p0, v3, v4, v2, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 76
    .line 77
    .line 78
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/q5;)Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-object p0
.end method

.method private o0(Lcom/android/launcher3/C2;Z)Ljava/lang/Runnable;
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    sget-object p0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 26
    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/d5;

    .line 29
    .line 30
    move-object v1, p1

    .line 31
    move v6, p2

    .line 32
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/d5;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Z)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/q5;)Landroid/animation/AnimatorListenerAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->v:Landroid/animation/AnimatorListenerAdapter;

    .line 2
    .line 3
    return-object p0
.end method

.method private p0([Landroid/view/RemoteAnimationTarget;)Landroid/animation/Animator;
    .locals 14

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 2
    .line 3
    .line 4
    move-result v9

    .line 5
    new-instance v12, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 8
    .line 9
    invoke-direct {v12, v0}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    new-instance v10, Landroid/graphics/Matrix;

    .line 13
    .line 14
    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v7, Landroid/graphics/Point;

    .line 18
    .line 19
    invoke-direct {v7}, Landroid/graphics/Point;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v8, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    const/high16 v1, 0x3f800000    # 1.0f

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    new-array v2, v2, [F

    .line 32
    .line 33
    fill-array-data v2, :array_0

    .line 34
    .line 35
    .line 36
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v13

    .line 40
    iget-object v2, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 41
    .line 42
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->O0:Z

    .line 43
    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    move v11, v0

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    move v11, v2

    .line 55
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/q5;->N([Landroid/view/RemoteAnimationTarget;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    move v5, v0

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    iget v2, p0, Lcom/android/launcher3/q5;->l:F

    .line 64
    .line 65
    move v5, v2

    .line 66
    :goto_1
    const/16 v2, 0xfa

    .line 67
    .line 68
    int-to-long v3, v2

    .line 69
    invoke-virtual {v13, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    .line 72
    invoke-direct {p0, p1}, Lcom/android/launcher3/q5;->B0([Landroid/view/RemoteAnimationTarget;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-eqz v3, :cond_2

    .line 77
    .line 78
    iget v4, p0, Lcom/android/launcher3/q5;->k:F

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    iget v4, p0, Lcom/android/launcher3/q5;->j:F

    .line 82
    .line 83
    :goto_2
    if-eqz v3, :cond_3

    .line 84
    .line 85
    const v1, 0x3f733333    # 0.95f

    .line 86
    .line 87
    .line 88
    :cond_3
    if-eqz v3, :cond_4

    .line 89
    .line 90
    sget-object v3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 91
    .line 92
    const/high16 v6, 0x42c80000    # 100.0f

    .line 93
    .line 94
    int-to-float v2, v2

    .line 95
    invoke-static {v3, v0, v6, v2}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    goto :goto_3

    .line 100
    :cond_4
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 101
    .line 102
    const/high16 v3, 0x42fa0000    # 125.0f

    .line 103
    .line 104
    int-to-float v2, v2

    .line 105
    const/high16 v6, 0x41c80000    # 25.0f

    .line 106
    .line 107
    invoke-static {v0, v6, v3, v2}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    :goto_3
    new-instance v2, Lcom/android/launcher3/q5$i;

    .line 112
    .line 113
    move v3, v4

    .line 114
    move-object v4, v0

    .line 115
    move-object v0, v2

    .line 116
    move v2, v3

    .line 117
    move-object v6, p1

    .line 118
    move v3, v1

    .line 119
    move-object v1, p0

    .line 120
    invoke-direct/range {v0 .. v12}, Lcom/android/launcher3/q5$i;-><init>(Lcom/android/launcher3/q5;FFLandroid/view/animation/Interpolator;F[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Point;Landroid/graphics/Rect;ILandroid/graphics/Matrix;FLcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v13, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 124
    .line 125
    .line 126
    return-object v13

    .line 127
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static bridge synthetic q(Lcom/android/launcher3/q5;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/q5;->O:I

    .line 2
    .line 3
    return p0
.end method

.method private q0(ZIZ)Landroid/util/Pair;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZIZ)",
            "Landroid/util/Pair<",
            "Landroid/animation/AnimatorSet;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    const/high16 v3, 0x3f800000    # 1.0f

    .line 9
    .line 10
    const/4 v4, 0x2

    .line 11
    const/4 v5, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    new-array v6, v4, [F

    .line 15
    .line 16
    aput v3, v6, v5

    .line 17
    .line 18
    aput v1, v6, v2

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-array v6, v4, [F

    .line 22
    .line 23
    aput v1, v6, v5

    .line 24
    .line 25
    aput v3, v6, v2

    .line 26
    .line 27
    :goto_0
    if-eqz p1, :cond_1

    .line 28
    .line 29
    new-array v1, v4, [F

    .line 30
    .line 31
    aput v3, v1, v5

    .line 32
    .line 33
    iget-object v7, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 34
    .line 35
    iget v7, v7, Lcom/android/launcher3/h0;->s1:F

    .line 36
    .line 37
    aput v7, v1, v2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-array v1, v4, [F

    .line 41
    .line 42
    iget-object v7, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 43
    .line 44
    iget v7, v7, Lcom/android/launcher3/h0;->s1:F

    .line 45
    .line 46
    aput v7, v1, v5

    .line 47
    .line 48
    aput v3, v1, v2

    .line 49
    .line 50
    :goto_1
    iget-object v7, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->i4()V

    .line 53
    .line 54
    .line 55
    iget-object v7, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 56
    .line 57
    sget-object v8, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 58
    .line 59
    invoke-interface {v7, v8}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eqz v7, :cond_4

    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    sget-object v8, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 76
    .line 77
    invoke-virtual {v8, p1}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    check-cast v9, Ljava/lang/Float;

    .line 82
    .line 83
    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    iget-object v10, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 88
    .line 89
    iget-boolean v10, v10, Lcom/android/launcher3/h0;->G0:Z

    .line 90
    .line 91
    if-eqz v10, :cond_2

    .line 92
    .line 93
    new-array v6, v4, [F

    .line 94
    .line 95
    aput v3, v6, v5

    .line 96
    .line 97
    aput v3, v6, v2

    .line 98
    .line 99
    :cond_2
    aget v2, v6, v5

    .line 100
    .line 101
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 102
    .line 103
    .line 104
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 105
    .line 106
    invoke-static {p1, v2, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    const-wide/16 v10, 0xd9

    .line 111
    .line 112
    invoke-virtual {v2, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 113
    .line 114
    .line 115
    sget-object v3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 116
    .line 117
    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 118
    .line 119
    .line 120
    const/4 v3, 0x0

    .line 121
    invoke-virtual {p1, v4, v3}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 122
    .line 123
    .line 124
    new-instance v3, Lcom/android/launcher3/q5$B;

    .line 125
    .line 126
    invoke-direct {v3, p0, p1}, Lcom/android/launcher3/q5$B;-><init>(Lcom/android/launcher3/q5;Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 130
    .line 131
    .line 132
    if-nez p3, :cond_3

    .line 133
    .line 134
    aget p3, v1, v5

    .line 135
    .line 136
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    invoke-virtual {v8, p1, p3}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p1, v8, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object p3

    .line 147
    sget-object v1, LJ0/h;->w:Landroid/view/animation/Interpolator;

    .line 148
    .line 149
    invoke-virtual {p3, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 150
    .line 151
    .line 152
    const-wide/16 v3, 0x15e

    .line 153
    .line 154
    invoke-virtual {p3, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, p3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 158
    .line 159
    .line 160
    :cond_3
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 161
    .line 162
    .line 163
    new-instance p3, Lcom/android/launcher3/a5;

    .line 164
    .line 165
    invoke-direct {p3, p0, p1, v7, v9}, Lcom/android/launcher3/a5;-><init>(Lcom/android/launcher3/q5;Landroid/view/View;FF)V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_4
    iget-object p3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 170
    .line 171
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 172
    .line 173
    invoke-interface {p3, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 174
    .line 175
    .line 176
    move-result p3

    .line 177
    if-eqz p3, :cond_5

    .line 178
    .line 179
    invoke-virtual {p0, v0, v6, v1}, Lcom/android/launcher3/q5;->R(Landroid/animation/AnimatorSet;[F[F)Ljava/lang/Runnable;

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    goto :goto_2

    .line 184
    :cond_5
    iget-object p3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 185
    .line 186
    invoke-static {p3, v0, v5}, Lcom/android/launcher3/anim/C;->v0(Lcom/android/launcher3/C2;Landroid/animation/AnimatorSet;I)V

    .line 187
    .line 188
    .line 189
    iget-object p3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 190
    .line 191
    invoke-direct {p0, p3, p1}, Lcom/android/launcher3/q5;->o0(Lcom/android/launcher3/C2;Z)Ljava/lang/Runnable;

    .line 192
    .line 193
    .line 194
    move-result-object p3

    .line 195
    :goto_2
    int-to-long p0, p2

    .line 196
    invoke-virtual {v0, p0, p1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 197
    .line 198
    .line 199
    new-instance p0, Landroid/util/Pair;

    .line 200
    .line 201
    invoke-direct {p0, v0, p3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    return-object p0
.end method

.method static bridge synthetic r(Lcom/android/launcher3/q5;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->y:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic s(Lcom/android/launcher3/q5;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->n:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method private s0(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
    .locals 30

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v11, p2

    .line 4
    .line 5
    move-object/from16 v0, p3

    .line 6
    .line 7
    const/4 v12, 0x2

    .line 8
    const/4 v13, 0x1

    .line 9
    new-instance v14, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 10
    .line 11
    const/4 v15, 0x0

    .line 12
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v9

    .line 16
    move-object/from16 v2, p4

    .line 17
    .line 18
    move-object/from16 v3, p5

    .line 19
    .line 20
    invoke-direct {v14, v0, v2, v3, v15}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 24
    .line 25
    .line 26
    move-result v10

    .line 27
    invoke-direct {v1, v0, v10}, Lcom/android/launcher3/q5;->A0([Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, v1, Lcom/android/launcher3/q5;->z:Lcom/android/quickstep/SystemUiProxy;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/android/quickstep/SystemUiProxy;->getHomeVisibilityState()Lcom/android/quickstep/HomeVisibilityState;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3}, Lcom/android/quickstep/HomeVisibilityState;->getNavbarInsetPosition()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    filled-new-array {v3}, [I

    .line 42
    .line 43
    .line 44
    move-result-object v16

    .line 45
    invoke-virtual {v14}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTarget()Landroid/view/RemoteAnimationTarget;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-direct {v1, v3}, Lcom/android/launcher3/q5;->X0(Landroid/view/RemoteAnimationTarget;)Z

    .line 50
    .line 51
    .line 52
    move-result v17

    .line 53
    if-eqz v17, :cond_0

    .line 54
    .line 55
    aget v3, v16, v15

    .line 56
    .line 57
    iget v4, v2, Landroid/graphics/Rect;->bottom:I

    .line 58
    .line 59
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 64
    .line 65
    :cond_0
    invoke-direct {v1, v0}, Lcom/android/launcher3/q5;->N([Landroid/view/RemoteAnimationTarget;)Z

    .line 66
    .line 67
    .line 68
    move-result v26

    .line 69
    new-instance v6, Landroid/graphics/RectF;

    .line 70
    .line 71
    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    .line 72
    .line 73
    .line 74
    new-instance v20, Landroid/graphics/RectF;

    .line 75
    .line 76
    invoke-direct/range {v20 .. v20}, Landroid/graphics/RectF;-><init>()V

    .line 77
    .line 78
    .line 79
    move-object v5, v2

    .line 80
    iget-object v2, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    if-eqz v3, :cond_2

    .line 87
    .line 88
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 89
    .line 90
    invoke-static {v3}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-nez v3, :cond_1

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_1
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 98
    .line 99
    invoke-virtual {v3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {v3, v11}, Lcom/android/launcher3/taskbar/o4;->i(Landroid/view/View;)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    :goto_0
    move-object v4, v3

    .line 108
    move-object v3, v6

    .line 109
    goto :goto_2

    .line 110
    :cond_2
    :goto_1
    const/4 v3, 0x0

    .line 111
    goto :goto_0

    .line 112
    :goto_2
    xor-int/lit8 v6, v26, 0x1

    .line 113
    .line 114
    const/4 v8, 0x1

    .line 115
    move-object v7, v5

    .line 116
    const/4 v5, 0x0

    .line 117
    move/from16 v18, v15

    .line 118
    .line 119
    move-object v15, v3

    .line 120
    move-object v3, v11

    .line 121
    move-object v11, v7

    .line 122
    move-object/from16 v7, v20

    .line 123
    .line 124
    invoke-static/range {v2 .. v8}, Lcom/android/launcher3/views/FloatingIconView;->v(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/view/View;Landroid/view/View;ZLandroid/graphics/RectF;Z)Lcom/android/launcher3/views/FloatingIconView;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    move-object v4, v7

    .line 129
    sget-object v5, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 130
    .line 131
    iget-object v6, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 132
    .line 133
    invoke-virtual {v6}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-virtual {v5, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    check-cast v5, Lcom/android/launcher3/anim/C;

    .line 142
    .line 143
    invoke-virtual {v5}, Lcom/android/launcher3/anim/C;->T()I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    int-to-float v6, v6

    .line 148
    invoke-virtual {v15, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 149
    .line 150
    .line 151
    instance-of v7, v3, Lcom/android/launcher3/BubbleTextView;

    .line 152
    .line 153
    if-eqz v7, :cond_3

    .line 154
    .line 155
    invoke-virtual {v15}, Landroid/graphics/RectF;->width()F

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    iget-object v8, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 160
    .line 161
    iget v8, v8, Lcom/android/launcher3/h0;->B1:I

    .line 162
    .line 163
    int-to-float v8, v8

    .line 164
    div-float/2addr v7, v8

    .line 165
    mul-float/2addr v6, v7

    .line 166
    invoke-virtual {v15, v6, v6}, Landroid/graphics/RectF;->inset(FF)V

    .line 167
    .line 168
    .line 169
    :cond_3
    move-object v6, v15

    .line 170
    new-instance v15, Landroid/graphics/Rect;

    .line 171
    .line 172
    invoke-direct {v15}, Landroid/graphics/Rect;-><init>()V

    .line 173
    .line 174
    .line 175
    new-instance v22, Landroid/graphics/Matrix;

    .line 176
    .line 177
    invoke-direct/range {v22 .. v22}, Landroid/graphics/Matrix;-><init>()V

    .line 178
    .line 179
    .line 180
    new-instance v7, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 181
    .line 182
    invoke-direct {v7, v2}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v14, v7}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v14}, Lcom/android/quickstep/RemoteAnimationTargets;->getNavBarRemoteAnimationTarget()Landroid/view/RemoteAnimationTarget;

    .line 189
    .line 190
    .line 191
    move-result-object v24

    .line 192
    move v8, v12

    .line 193
    new-array v12, v8, [I

    .line 194
    .line 195
    iget-object v8, v1, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 196
    .line 197
    invoke-virtual {v8, v12}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 198
    .line 199
    .line 200
    sget-boolean v8, Lcom/android/launcher3/q5;->U:Z

    .line 201
    .line 202
    if-eqz v8, :cond_5

    .line 203
    .line 204
    invoke-virtual {v14}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTargetTaskId()I

    .line 205
    .line 206
    .line 207
    move-result v8

    .line 208
    invoke-static {v9, v9}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    iget-object v13, v1, Lcom/android/launcher3/q5;->w:Ljava/util/LinkedHashMap;

    .line 213
    .line 214
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {v13, v0, v9}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    check-cast v0, Landroid/util/Pair;

    .line 223
    .line 224
    iget-object v9, v1, Lcom/android/launcher3/q5;->w:Ljava/util/LinkedHashMap;

    .line 225
    .line 226
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v8

    .line 230
    invoke-virtual {v9, v8}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 234
    .line 235
    check-cast v0, Ljava/lang/Integer;

    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    const/4 v8, 0x1

    .line 242
    if-ne v0, v8, :cond_4

    .line 243
    .line 244
    move/from16 v20, v8

    .line 245
    .line 246
    goto :goto_3

    .line 247
    :cond_4
    move/from16 v20, v18

    .line 248
    .line 249
    :goto_3
    move/from16 v13, v20

    .line 250
    .line 251
    :goto_4
    move-object v0, v2

    .line 252
    goto :goto_5

    .line 253
    :cond_5
    move v8, v13

    .line 254
    move/from16 v13, v18

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :goto_5
    new-instance v2, Lcom/android/launcher3/q5$D;

    .line 258
    .line 259
    iget-object v9, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 260
    .line 261
    invoke-virtual {v9}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 262
    .line 263
    .line 264
    move-result-object v9

    .line 265
    move-object/from16 v21, v4

    .line 266
    .line 267
    iget-object v4, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 268
    .line 269
    move/from16 v20, v8

    .line 270
    .line 271
    aget v8, v12, v18

    .line 272
    .line 273
    move-object v3, v9

    .line 274
    aget v9, v12, v20

    .line 275
    .line 276
    move-object/from16 v23, v5

    .line 277
    .line 278
    move-object v5, v11

    .line 279
    invoke-virtual {v0}, Lcom/android/launcher3/views/FloatingIconView;->B()Z

    .line 280
    .line 281
    .line 282
    move-result v11

    .line 283
    move-object/from16 v25, v7

    .line 284
    .line 285
    move/from16 p4, v10

    .line 286
    .line 287
    move v10, v13

    .line 288
    const/16 v19, 0x2

    .line 289
    .line 290
    move-object/from16 v7, p2

    .line 291
    .line 292
    move-object v13, v0

    .line 293
    move-object/from16 v0, v23

    .line 294
    .line 295
    invoke-direct/range {v2 .. v11}, Lcom/android/launcher3/q5$D;-><init>(Landroid/content/res/Resources;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/view/View;IIZZ)V

    .line 296
    .line 297
    .line 298
    move-object v11, v7

    .line 299
    iget v3, v2, Lcom/android/launcher3/q5$D;->a:I

    .line 300
    .line 301
    iget v4, v2, Lcom/android/launcher3/q5$D;->c:I

    .line 302
    .line 303
    div-int/lit8 v7, v4, 0x2

    .line 304
    .line 305
    sub-int/2addr v3, v7

    .line 306
    iget v7, v2, Lcom/android/launcher3/q5$D;->b:I

    .line 307
    .line 308
    iget v8, v2, Lcom/android/launcher3/q5$D;->d:I

    .line 309
    .line 310
    div-int/lit8 v9, v8, 0x2

    .line 311
    .line 312
    sub-int/2addr v7, v9

    .line 313
    add-int/2addr v4, v3

    .line 314
    add-int/2addr v8, v7

    .line 315
    invoke-virtual {v15, v3, v7, v4, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 316
    .line 317
    .line 318
    new-instance v19, Landroid/graphics/RectF;

    .line 319
    .line 320
    invoke-direct/range {v19 .. v19}, Landroid/graphics/RectF;-><init>()V

    .line 321
    .line 322
    .line 323
    move/from16 v3, v17

    .line 324
    .line 325
    new-instance v17, Landroid/graphics/RectF;

    .line 326
    .line 327
    invoke-direct/range {v17 .. v17}, Landroid/graphics/RectF;-><init>()V

    .line 328
    .line 329
    .line 330
    new-instance v23, Landroid/graphics/Point;

    .line 331
    .line 332
    invoke-direct/range {v23 .. v23}, Landroid/graphics/Point;-><init>()V

    .line 333
    .line 334
    .line 335
    new-instance v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 336
    .line 337
    new-instance v7, Landroid/graphics/RectF;

    .line 338
    .line 339
    invoke-direct {v7, v5}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 340
    .line 341
    .line 342
    new-instance v8, Landroid/graphics/PointF;

    .line 343
    .line 344
    const/high16 v9, 0x3f800000    # 1.0f

    .line 345
    .line 346
    move/from16 p5, v3

    .line 347
    .line 348
    const/4 v3, 0x0

    .line 349
    invoke-direct {v8, v3, v9}, Landroid/graphics/PointF;-><init>(FF)V

    .line 350
    .line 351
    .line 352
    move/from16 v9, v18

    .line 353
    .line 354
    invoke-direct {v4, v6, v7, v8, v9}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;Z)V

    .line 355
    .line 356
    .line 357
    new-instance v7, Lcom/android/launcher3/q5$C;

    .line 358
    .line 359
    invoke-direct {v7, v1, v11, v14}, Lcom/android/launcher3/q5$C;-><init>(Lcom/android/launcher3/q5;Landroid/view/View;Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {v4, v7}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 363
    .line 364
    .line 365
    iget-object v7, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 366
    .line 367
    invoke-virtual {v7}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 368
    .line 369
    .line 370
    move-result-object v7

    .line 371
    invoke-static {v7}, Lcom/android/systemui/shared/system/QuickStepContract;->supportsRoundedCornersOnWindows(Landroid/content/res/Resources;)Z

    .line 372
    .line 373
    .line 374
    move-result v7

    .line 375
    if-eqz v7, :cond_7

    .line 376
    .line 377
    iget v7, v2, Lcom/android/launcher3/q5$D;->l:F

    .line 378
    .line 379
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 380
    .line 381
    .line 382
    move-result v8

    .line 383
    int-to-float v8, v8

    .line 384
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 385
    .line 386
    .line 387
    move-result v18

    .line 388
    div-float v8, v8, v18

    .line 389
    .line 390
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 391
    .line 392
    .line 393
    move-result v3

    .line 394
    int-to-float v3, v3

    .line 395
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 396
    .line 397
    .line 398
    move-result v27

    .line 399
    div-float v3, v3, v27

    .line 400
    .line 401
    cmpl-float v3, v8, v3

    .line 402
    .line 403
    if-lez v3, :cond_6

    .line 404
    .line 405
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 406
    .line 407
    .line 408
    move-result v3

    .line 409
    goto :goto_6

    .line 410
    :cond_6
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    .line 411
    .line 412
    .line 413
    move-result v3

    .line 414
    :goto_6
    mul-float/2addr v7, v3

    .line 415
    const/4 v8, 0x1

    .line 416
    invoke-virtual {v0, v11, v8}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 417
    .line 418
    .line 419
    move-result v3

    .line 420
    mul-float/2addr v7, v3

    .line 421
    move v3, v7

    .line 422
    goto :goto_7

    .line 423
    :cond_7
    const/4 v3, 0x0

    .line 424
    :goto_7
    iget-object v7, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 425
    .line 426
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->O0:Z

    .line 427
    .line 428
    if-eqz v7, :cond_8

    .line 429
    .line 430
    const/4 v7, 0x0

    .line 431
    goto :goto_8

    .line 432
    :cond_8
    iget-object v7, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 433
    .line 434
    invoke-static {v7}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 435
    .line 436
    .line 437
    move-result v7

    .line 438
    :goto_8
    if-eqz v26, :cond_9

    .line 439
    .line 440
    const/4 v8, 0x0

    .line 441
    goto :goto_9

    .line 442
    :cond_9
    iget v8, v1, Lcom/android/launcher3/q5;->l:F

    .line 443
    .line 444
    :goto_9
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 445
    .line 446
    .line 447
    move-result v27

    .line 448
    const/4 v9, 0x1

    .line 449
    invoke-virtual {v0, v11, v9}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 450
    .line 451
    .line 452
    move-result v20

    .line 453
    mul-float v9, v27, v20

    .line 454
    .line 455
    invoke-virtual {v4, v9}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 456
    .line 457
    .line 458
    invoke-virtual {v4, v7}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setEndRadius(F)V

    .line 459
    .line 460
    .line 461
    new-instance v9, Landroid/graphics/RectF;

    .line 462
    .line 463
    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 467
    .line 468
    .line 469
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 470
    .line 471
    .line 472
    move-object/from16 v18, v0

    .line 473
    .line 474
    const/4 v9, 0x0

    .line 475
    new-instance v0, Lcom/android/launcher3/q5$a;

    .line 476
    .line 477
    move-object/from16 v29, v4

    .line 478
    .line 479
    move-object v9, v5

    .line 480
    move v4, v7

    .line 481
    move v5, v8

    .line 482
    move-object v8, v14

    .line 483
    move-object/from16 v7, v16

    .line 484
    .line 485
    move-object/from16 v20, v21

    .line 486
    .line 487
    const/16 v28, 0x0

    .line 488
    .line 489
    move-object/from16 v21, p3

    .line 490
    .line 491
    move/from16 v16, p4

    .line 492
    .line 493
    move-object v14, v13

    .line 494
    move v13, v10

    .line 495
    move-object v10, v6

    .line 496
    move/from16 v6, p5

    .line 497
    .line 498
    invoke-direct/range {v0 .. v25}, Lcom/android/launcher3/q5$a;-><init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/q5$D;FFFZ[ILcom/android/quickstep/RemoteAnimationTargets;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/view/View;[IZLcom/android/launcher3/views/FloatingIconView;Landroid/graphics/Rect;ILandroid/graphics/RectF;Lcom/android/launcher3/anim/C;Landroid/graphics/RectF;Landroid/graphics/RectF;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;Landroid/graphics/Point;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 499
    .line 500
    .line 501
    new-instance v2, Lcom/android/launcher3/q5$b;

    .line 502
    .line 503
    invoke-direct {v2, v1, v0}, Lcom/android/launcher3/q5$b;-><init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/MultiValueUpdateListener;)V

    .line 504
    .line 505
    .line 506
    move-object/from16 v3, v29

    .line 507
    .line 508
    invoke-virtual {v3, v2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;)V

    .line 509
    .line 510
    .line 511
    const/4 v8, 0x1

    .line 512
    const/4 v9, 0x0

    .line 513
    invoke-virtual {v0, v9, v8}, Lcom/android/quickstep/util/MultiValueUpdateListener;->onUpdate(FZ)V

    .line 514
    .line 515
    .line 516
    iget-object v0, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 517
    .line 518
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    if-nez v26, :cond_a

    .line 523
    .line 524
    if-eqz p6, :cond_a

    .line 525
    .line 526
    if-eqz v0, :cond_b

    .line 527
    .line 528
    :cond_a
    move-object/from16 v0, p1

    .line 529
    .line 530
    goto :goto_a

    .line 531
    :cond_b
    invoke-direct {v1}, Lcom/android/launcher3/q5;->i0()Landroid/animation/ValueAnimator;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    new-array v2, v8, [Landroid/animation/Animator;

    .line 536
    .line 537
    aput-object v0, v2, v28

    .line 538
    .line 539
    move-object/from16 v0, p1

    .line 540
    .line 541
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 542
    .line 543
    .line 544
    :goto_a
    new-instance v2, Lcom/android/launcher3/q5$c;

    .line 545
    .line 546
    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/q5$c;-><init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 547
    .line 548
    .line 549
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 550
    .line 551
    .line 552
    return-object v3
.end method

.method static bridge synthetic t(Lcom/android/launcher3/q5;)Lcom/android/quickstep/SystemUiProxy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->z:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    return-object p0
.end method

.method private t0(Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v10, p2

    .line 4
    .line 5
    const/4 v14, 0x2

    .line 6
    invoke-static {v10}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-direct {v1, v10, v0}, Lcom/android/launcher3/q5;->A0([Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object v5

    .line 14
    invoke-direct {v1, v10}, Lcom/android/launcher3/q5;->N([Landroid/view/RemoteAnimationTarget;)Z

    .line 15
    .line 16
    .line 17
    move-result v20

    .line 18
    new-instance v17, Landroid/graphics/RectF;

    .line 19
    .line 20
    invoke-direct/range {v17 .. v17}, Landroid/graphics/RectF;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v6, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v7, Landroid/graphics/Matrix;

    .line 29
    .line 30
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    move-object/from16 v3, p3

    .line 37
    .line 38
    move-object/from16 v4, p4

    .line 39
    .line 40
    invoke-direct {v0, v10, v3, v4, v2}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTarget()Landroid/view/RemoteAnimationTarget;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    sget-boolean v4, Lcom/android/launcher3/q5;->U:Z

    .line 50
    .line 51
    if-eqz v4, :cond_1

    .line 52
    .line 53
    iget-object v4, v1, Lcom/android/launcher3/q5;->w:Ljava/util/LinkedHashMap;

    .line 54
    .line 55
    iget v8, v3, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 56
    .line 57
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_0

    .line 66
    .line 67
    iget-object v4, v1, Lcom/android/launcher3/q5;->w:Ljava/util/LinkedHashMap;

    .line 68
    .line 69
    iget v8, v3, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 70
    .line 71
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    invoke-virtual {v4, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Landroid/util/Pair;

    .line 80
    .line 81
    iget-object v4, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v4, Ljava/lang/Integer;

    .line 84
    .line 85
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    goto :goto_0

    .line 90
    :cond_0
    move v4, v2

    .line 91
    :goto_0
    iget-object v8, v1, Lcom/android/launcher3/q5;->w:Ljava/util/LinkedHashMap;

    .line 92
    .line 93
    iget v9, v3, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 94
    .line 95
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v9

    .line 99
    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_1
    move v4, v2

    .line 104
    :goto_1
    if-nez v4, :cond_2

    .line 105
    .line 106
    iget-object v4, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 107
    .line 108
    invoke-static {v4, v3}, Lcom/android/quickstep/views/FloatingWidgetView;->getDefaultBackgroundColor(Landroid/content/Context;Landroid/view/RemoteAnimationTarget;)I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    :cond_2
    move/from16 v21, v4

    .line 113
    .line 114
    iget-object v3, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 115
    .line 116
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->O0:Z

    .line 117
    .line 118
    const/4 v4, 0x0

    .line 119
    if-eqz v3, :cond_3

    .line 120
    .line 121
    move/from16 v19, v4

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 125
    .line 126
    invoke-static {v3}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    move/from16 v19, v3

    .line 131
    .line 132
    :goto_2
    iget-object v15, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 133
    .line 134
    new-instance v3, Landroid/util/Size;

    .line 135
    .line 136
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    invoke-direct {v3, v8, v9}, Landroid/util/Size;-><init>(II)V

    .line 145
    .line 146
    .line 147
    move-object/from16 v16, p1

    .line 148
    .line 149
    move-object/from16 v18, v3

    .line 150
    .line 151
    invoke-static/range {v15 .. v21}, Lcom/android/quickstep/views/FloatingWidgetView;->getFloatingWidgetView(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Landroid/util/Size;FZI)Lcom/android/quickstep/views/FloatingWidgetView;

    .line 152
    .line 153
    .line 154
    move-result-object v11

    .line 155
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 156
    .line 157
    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-static {v3}, Lcom/android/systemui/shared/system/QuickStepContract;->supportsRoundedCornersOnWindows(Landroid/content/res/Resources;)Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-eqz v3, :cond_4

    .line 166
    .line 167
    invoke-virtual {v11}, Lcom/android/quickstep/views/FloatingWidgetView;->getInitialCornerRadius()F

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    :cond_4
    new-instance v13, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 172
    .line 173
    invoke-direct {v13, v11}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v13}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteAnimationTargets;->getNavBarRemoteAnimationTarget()Landroid/view/RemoteAnimationTarget;

    .line 180
    .line 181
    .line 182
    move-result-object v12

    .line 183
    new-instance v15, Landroid/animation/AnimatorSet;

    .line 184
    .line 185
    invoke-direct {v15}, Landroid/animation/AnimatorSet;-><init>()V

    .line 186
    .line 187
    .line 188
    sget-object v3, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 189
    .line 190
    iget-object v8, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 191
    .line 192
    invoke-virtual {v8}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 193
    .line 194
    .line 195
    move-result-object v8

    .line 196
    invoke-virtual {v3, v8}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    move-object v8, v3

    .line 201
    check-cast v8, Lcom/android/launcher3/anim/C;

    .line 202
    .line 203
    new-array v3, v14, [F

    .line 204
    .line 205
    fill-array-data v3, :array_0

    .line 206
    .line 207
    .line 208
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    sget v9, Lcom/android/launcher3/anim/C;->S:I

    .line 213
    .line 214
    move-object/from16 p1, v15

    .line 215
    .line 216
    int-to-long v14, v9

    .line 217
    invoke-virtual {v3, v14, v15}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 218
    .line 219
    .line 220
    sget-object v9, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 221
    .line 222
    invoke-virtual {v3, v9}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v3, v11}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 226
    .line 227
    .line 228
    new-instance v9, Lcom/android/launcher3/q5$d;

    .line 229
    .line 230
    invoke-direct {v9, v1, v0}, Lcom/android/launcher3/q5$d;-><init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v3, v9}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 234
    .line 235
    .line 236
    new-instance v0, Lcom/android/launcher3/g5;

    .line 237
    .line 238
    move-object/from16 v14, p1

    .line 239
    .line 240
    invoke-direct {v0, v8, v14}, Lcom/android/launcher3/g5;-><init>(Lcom/android/launcher3/anim/C;Landroid/animation/AnimatorSet;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v11, v0}, Lcom/android/quickstep/views/FloatingWidgetView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 244
    .line 245
    .line 246
    new-instance v0, Lcom/android/launcher3/q5$e;

    .line 247
    .line 248
    move/from16 p1, v2

    .line 249
    .line 250
    move-object v15, v3

    .line 251
    move v2, v4

    .line 252
    move-object/from16 v4, v17

    .line 253
    .line 254
    move/from16 v3, v19

    .line 255
    .line 256
    move/from16 v9, v20

    .line 257
    .line 258
    invoke-direct/range {v0 .. v13}, Lcom/android/launcher3/q5$e;-><init>(Lcom/android/launcher3/q5;FFLandroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Matrix;Lcom/android/launcher3/anim/C;Z[Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/FloatingWidgetView;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v15, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 262
    .line 263
    .line 264
    if-nez v20, :cond_6

    .line 265
    .line 266
    if-nez p5, :cond_5

    .line 267
    .line 268
    goto :goto_3

    .line 269
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher3/q5;->i0()Landroid/animation/ValueAnimator;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    const/4 v1, 0x2

    .line 274
    new-array v1, v1, [Landroid/animation/Animator;

    .line 275
    .line 276
    aput-object v15, v1, p1

    .line 277
    .line 278
    const/4 v2, 0x1

    .line 279
    aput-object v0, v1, v2

    .line 280
    .line 281
    invoke-virtual {v14, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 282
    .line 283
    .line 284
    return-object v14

    .line 285
    :cond_6
    :goto_3
    invoke-virtual {v14, v15}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 286
    .line 287
    .line 288
    return-object v14

    .line 289
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static bridge synthetic u(Lcom/android/launcher3/q5;)Ljava/util/LinkedHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->w:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method private u0(Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v13, p2

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-static {v13}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 9
    .line 10
    .line 11
    move-result v10

    .line 12
    invoke-direct {v1, v13, v10}, Lcom/android/launcher3/q5;->A0([Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-direct {v1, v13}, Lcom/android/launcher3/q5;->N([Landroid/view/RemoteAnimationTarget;)Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    new-instance v5, Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v6, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v7, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 31
    .line 32
    new-instance v8, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 35
    .line 36
    .line 37
    const/4 v9, 0x1

    .line 38
    invoke-static {v7, v0, v9, v6, v8}, Lcom/android/launcher3/views/FloatingIconView;->y(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 39
    .line 40
    .line 41
    sget-object v7, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 42
    .line 43
    iget-object v8, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 44
    .line 45
    invoke-virtual {v8}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    invoke-virtual {v7, v8}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    check-cast v7, Lcom/android/launcher3/anim/C;

    .line 54
    .line 55
    invoke-virtual {v7}, Lcom/android/launcher3/anim/C;->T()I

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    int-to-float v8, v8

    .line 60
    invoke-virtual {v5, v6}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 61
    .line 62
    .line 63
    instance-of v6, v0, Lcom/android/launcher3/BubbleTextView;

    .line 64
    .line 65
    if-eqz v6, :cond_0

    .line 66
    .line 67
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    iget-object v11, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 72
    .line 73
    iget v11, v11, Lcom/android/launcher3/h0;->B1:I

    .line 74
    .line 75
    int-to-float v11, v11

    .line 76
    div-float/2addr v6, v11

    .line 77
    mul-float/2addr v8, v6

    .line 78
    invoke-virtual {v5, v8, v8}, Landroid/graphics/RectF;->inset(FF)V

    .line 79
    .line 80
    .line 81
    :cond_0
    new-instance v6, Landroid/graphics/Rect;

    .line 82
    .line 83
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 84
    .line 85
    .line 86
    new-instance v14, Landroid/graphics/Matrix;

    .line 87
    .line 88
    invoke-direct {v14}, Landroid/graphics/Matrix;-><init>()V

    .line 89
    .line 90
    .line 91
    new-instance v8, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 92
    .line 93
    const/4 v11, 0x0

    .line 94
    move-object/from16 v12, p3

    .line 95
    .line 96
    move-object/from16 v15, p4

    .line 97
    .line 98
    invoke-direct {v8, v13, v12, v15, v11}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 99
    .line 100
    .line 101
    new-instance v11, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 102
    .line 103
    iget-object v12, v1, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 104
    .line 105
    invoke-direct {v11, v12}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v8, v11}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v8}, Lcom/android/quickstep/RemoteAnimationTargets;->getNavBarRemoteAnimationTarget()Landroid/view/RemoteAnimationTarget;

    .line 112
    .line 113
    .line 114
    move-result-object v16

    .line 115
    new-array v12, v2, [I

    .line 116
    .line 117
    iget-object v15, v1, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 118
    .line 119
    invoke-virtual {v15, v12}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 120
    .line 121
    .line 122
    move-object/from16 v17, v11

    .line 123
    .line 124
    new-instance v11, Landroid/graphics/RectF;

    .line 125
    .line 126
    invoke-direct {v11}, Landroid/graphics/RectF;-><init>()V

    .line 127
    .line 128
    .line 129
    new-instance v15, Landroid/graphics/Point;

    .line 130
    .line 131
    invoke-direct {v15}, Landroid/graphics/Point;-><init>()V

    .line 132
    .line 133
    .line 134
    new-array v2, v2, [F

    .line 135
    .line 136
    fill-array-data v2, :array_0

    .line 137
    .line 138
    .line 139
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    move/from16 v18, v10

    .line 144
    .line 145
    sget-wide v9, Lcom/android/launcher3/q5;->V:J

    .line 146
    .line 147
    invoke-virtual {v2, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 148
    .line 149
    .line 150
    sget-object v9, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 151
    .line 152
    invoke-virtual {v2, v9}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 153
    .line 154
    .line 155
    new-instance v9, Lcom/android/launcher3/q5$p;

    .line 156
    .line 157
    invoke-direct {v9, v1, v0, v8}, Lcom/android/launcher3/q5$p;-><init>(Lcom/android/launcher3/q5;Landroid/view/View;Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2, v9}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    int-to-float v8, v8

    .line 168
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 169
    .line 170
    .line 171
    move-result v9

    .line 172
    div-float/2addr v8, v9

    .line 173
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    int-to-float v9, v9

    .line 178
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 179
    .line 180
    .line 181
    move-result v10

    .line 182
    div-float/2addr v9, v10

    .line 183
    cmpl-float v8, v8, v9

    .line 184
    .line 185
    if-lez v8, :cond_1

    .line 186
    .line 187
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 188
    .line 189
    .line 190
    move-result v8

    .line 191
    goto :goto_0

    .line 192
    :cond_1
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 193
    .line 194
    .line 195
    move-result v8

    .line 196
    :goto_0
    int-to-float v8, v8

    .line 197
    const/4 v9, 0x1

    .line 198
    invoke-virtual {v7, v0, v9}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    mul-float/2addr v8, v0

    .line 203
    iget-object v0, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 204
    .line 205
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 206
    .line 207
    if-eqz v0, :cond_2

    .line 208
    .line 209
    const/4 v0, 0x0

    .line 210
    goto :goto_1

    .line 211
    :cond_2
    iget-object v0, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 212
    .line 213
    invoke-static {v0}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    :goto_1
    if-eqz v4, :cond_3

    .line 218
    .line 219
    const/4 v4, 0x0

    .line 220
    goto :goto_2

    .line 221
    :cond_3
    iget v4, v1, Lcom/android/launcher3/q5;->l:F

    .line 222
    .line 223
    :goto_2
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 224
    .line 225
    .line 226
    move-result v7

    .line 227
    int-to-float v7, v7

    .line 228
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 229
    .line 230
    .line 231
    move-result v10

    .line 232
    int-to-float v10, v10

    .line 233
    div-float/2addr v7, v10

    .line 234
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 235
    .line 236
    .line 237
    move-result v10

    .line 238
    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    .line 239
    .line 240
    .line 241
    move-result v19

    .line 242
    div-float v10, v10, v19

    .line 243
    .line 244
    move-object/from16 v19, v2

    .line 245
    .line 246
    move-object v2, v5

    .line 247
    move v5, v0

    .line 248
    new-instance v0, Lcom/android/launcher3/q5$q;

    .line 249
    .line 250
    move-object v9, v6

    .line 251
    move-object/from16 v20, v19

    .line 252
    .line 253
    move v6, v4

    .line 254
    move v4, v8

    .line 255
    move v8, v7

    .line 256
    move v7, v10

    .line 257
    move/from16 v10, v18

    .line 258
    .line 259
    invoke-direct/range {v0 .. v17}, Lcom/android/launcher3/q5$q;-><init>(Lcom/android/launcher3/q5;Landroid/graphics/RectF;Landroid/graphics/Rect;FFFFFLandroid/graphics/Rect;ILandroid/graphics/RectF;[I[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;Landroid/graphics/Point;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 260
    .line 261
    .line 262
    move-object v1, v0

    .line 263
    move-object/from16 v0, v20

    .line 264
    .line 265
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 266
    .line 267
    .line 268
    const/4 v2, 0x0

    .line 269
    const/4 v9, 0x1

    .line 270
    invoke-virtual {v1, v2, v9}, Lcom/android/quickstep/util/MultiValueUpdateListener;->onUpdate(FZ)V

    .line 271
    .line 272
    .line 273
    return-object v0

    .line 274
    nop

    .line 275
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static bridge synthetic v(Lcom/android/launcher3/q5;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->P:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic w(Lcom/android/launcher3/q5;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/q5;->N:Z

    .line 2
    .line 3
    return-void
.end method

.method private static w0([Landroid/view/RemoteAnimationTarget;)I
    .locals 6

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v1, v0, :cond_1

    .line 5
    .line 6
    aget-object v3, p0, v1

    .line 7
    .line 8
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->rotationChange:I

    .line 9
    .line 10
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-le v4, v5, :cond_0

    .line 19
    .line 20
    iget v2, v3, Landroid/view/RemoteAnimationTarget;->rotationChange:I

    .line 21
    .line 22
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return v2
.end method

.method static bridge synthetic x(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5;->F:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method private x0([Landroid/view/RemoteAnimationTarget;)V
    .locals 7

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    const/4 v3, 0x1

    .line 5
    const/4 v4, 0x0

    .line 6
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget-object v5, p1, v2

    .line 9
    .line 10
    iget v6, v5, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 11
    .line 12
    if-ne v6, v3, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move-object v5, v4

    .line 19
    :goto_1
    iput v1, p0, Lcom/android/launcher3/q5;->R:I

    .line 20
    .line 21
    const/4 p1, -0x1

    .line 22
    iput p1, p0, Lcom/android/launcher3/q5;->S:I

    .line 23
    .line 24
    iput-object v4, p0, Lcom/android/launcher3/q5;->T:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 27
    .line 28
    invoke-static {v0, v5, v3}, Lcom/android/launcher3/anim/C;->t(Lcom/android/launcher3/statemanager/h;Landroid/view/RemoteAnimationTarget;Z)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    iput v0, p0, Lcom/android/launcher3/q5;->R:I

    .line 36
    .line 37
    :cond_2
    invoke-static {v5}, Lcom/android/launcher3/anim/C;->n(Landroid/view/RemoteAnimationTarget;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/android/launcher3/q5;->T:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    const/4 p1, 0x5

    .line 46
    iput p1, p0, Lcom/android/launcher3/q5;->R:I

    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 50
    .line 51
    invoke-static {v0, v5, v1}, Lcom/android/launcher3/anim/C;->j(Lcom/android/launcher3/statemanager/h;Landroid/view/RemoteAnimationTarget;Z)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eq v0, p1, :cond_5

    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    invoke-static {v1, v0}, Lcom/android/quickstep/views/CapsuleView;->getContentTextOnCapsule(Lcom/android/launcher3/C2;I)V

    .line 60
    .line 61
    .line 62
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/android/launcher3/anim/C;->H:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_4
    move v0, p1

    .line 82
    :goto_2
    if-eq v0, p1, :cond_5

    .line 83
    .line 84
    const/4 p1, 0x4

    .line 85
    iput p1, p0, Lcom/android/launcher3/q5;->R:I

    .line 86
    .line 87
    iput v0, p0, Lcom/android/launcher3/q5;->S:I

    .line 88
    .line 89
    :cond_5
    return-void
.end method

.method static bridge synthetic y(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5;->H:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 2
    .line 3
    return-void
.end method

.method public static y0(Z)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p0}, Lcom/android/launcher3/q5;->z0(ZZ)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method static bridge synthetic z(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5;->G:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method public static z0(ZZ)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/16 p0, 0x258

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    const/16 p0, 0x3e8

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    const/16 p0, 0x12c

    .line 18
    .line 19
    return p0
.end method


# virtual methods
.method protected D0(Landroid/view/View;[Landroid/view/RemoteAnimationTarget;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/V3;

    .line 12
    .line 13
    iget-boolean v0, v0, Lcom/android/launcher3/V3;->c:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/TaskViewUtils;->findTaskViewToLaunch(Lcom/android/quickstep/views/RecentsView;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;)Lcom/android/quickstep/views/TaskView;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public E0([Lu2/s;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p0}, Lcom/android/launcher3/q5;->b0([Lu2/s;I)Lu2/s;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-static {p1}, Lcom/android/launcher3/q5;->X(Lu2/s;)Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p1, Lu2/s;->g:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public O0()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/q5;->e1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->f1()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->setStartingWindowListener(LV2/b;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/android/launcher3/N;->b:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/q5;->n:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    const-string v0, "QuickstepTransitionManager"

    .line 43
    .line 44
    const-string v2, "IllegalState: Failed to run onEndCallback created from getActivityLaunchOptions()"

    .line 45
    .line 46
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/q5;->n:Ljava/util/List;

    .line 50
    .line 51
    new-instance v2, Lcom/android/launcher3/b5;

    .line 52
    .line 53
    invoke-direct {v2}, Lcom/android/launcher3/b5;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/q5;->n:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 62
    .line 63
    .line 64
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lu2/e;->h()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/q5;->m:Lcom/android/launcher3/q5$J;

    .line 86
    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    iput-object v1, p0, Lcom/android/launcher3/q5;->m:Lcom/android/launcher3/q5$J;

    .line 90
    .line 91
    :cond_1
    iput-object v1, p0, Lcom/android/launcher3/q5;->L:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/android/launcher3/q5;->Q:Lcom/android/launcher3/anim/x;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/android/launcher3/anim/x;->g()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public P0()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/q5;->C0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/q5;->i:Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/android/quickstep/LauncherBackAnimationController;->registerBackCallbacks(Landroid/os/Handler;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->unregisterBackCallbacks()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected Q(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v7

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move-object v8, v0

    .line 14
    check-cast v8, Lcom/android/quickstep/views/RecentsView;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 19
    .line 20
    .line 21
    move-result-object v9

    .line 22
    const/4 v10, 0x0

    .line 23
    move-object v1, p1

    .line 24
    move-object v2, p2

    .line 25
    move-object v3, p3

    .line 26
    move-object v4, p4

    .line 27
    move-object/from16 v5, p5

    .line 28
    .line 29
    move/from16 v6, p6

    .line 30
    .line 31
    invoke-static/range {v1 .. v10}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsLaunchAnimator(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;ZLcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsView;LP1/h;Landroid/window/TransitionInfo;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public Q0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "OLintNullPointCheckForParameter"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "recordTransition #"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimationId()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "QuickstepTransitionManager"

    .line 23
    .line 24
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/android/launcher3/q5;->N:Z

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimationId()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/android/launcher3/q5;->O:I

    .line 35
    .line 36
    new-instance v0, Lcom/android/launcher3/q5$F;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/android/launcher3/q5$F;-><init>(Lcom/android/launcher3/q5;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method protected R(Landroid/animation/AnimatorSet;[F[F)Ljava/lang/Runnable;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->CONTENT_ALPHA:Landroid/util/FloatProperty;

    .line 10
    .line 11
    invoke-static {v0, v1, p2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-wide/16 v1, 0xd9

    .line 16
    .line 17
    invoke-virtual {p2, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    invoke-virtual {p2, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 26
    .line 27
    .line 28
    const/4 p2, 0x1

    .line 29
    invoke-virtual {v0, p2}, Lcom/android/quickstep/views/RecentsView;->setFreezeViewVisibility(Z)V

    .line 30
    .line 31
    .line 32
    sget-object p2, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 33
    .line 34
    invoke-static {v0, p2, p3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget-object p3, LJ0/h;->w:Landroid/view/animation/Interpolator;

    .line 39
    .line 40
    invoke-virtual {p2, p3}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 41
    .line 42
    .line 43
    const-wide/16 v1, 0x15e

    .line 44
    .line 45
    invoke-virtual {p2, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 49
    .line 50
    .line 51
    new-instance p1, Lcom/android/launcher3/e5;

    .line 52
    .line 53
    invoke-direct {p1, p0, v0}, Lcom/android/launcher3/e5;-><init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/views/RecentsView;)V

    .line 54
    .line 55
    .line 56
    return-object p1
.end method

.method public R0()V
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->s:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

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
    new-instance v0, Landroid/view/RemoteAnimationDefinition;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/view/RemoteAnimationDefinition;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v0}, Lcom/android/launcher3/q5;->M(Landroid/view/RemoteAnimationDefinition;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/app/Activity;->registerRemoteAnimations(Landroid/view/RemoteAnimationDefinition;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public S0()V
    .locals 7

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/quickstep/SystemUiProxy;->shareTransactionQueue()V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lf1/a;->s:Lf1/a$a;

    .line 15
    .line 16
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    new-instance v1, Lcom/android/launcher3/q5$K;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/android/launcher3/q5$K;-><init>(Lcom/android/launcher3/q5;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/android/launcher3/q5;->r:Lcom/android/launcher3/M2$b;

    .line 30
    .line 31
    new-instance v1, Landroid/window/RemoteTransition;

    .line 32
    .line 33
    new-instance v2, Lcom/android/launcher3/M2;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/android/launcher3/q5;->i:Landroid/os/Handler;

    .line 36
    .line 37
    iget-object v4, p0, Lcom/android/launcher3/q5;->r:Lcom/android/launcher3/M2$b;

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    invoke-direct {v2, v3, v4, v5}, Lcom/android/launcher3/M2;-><init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Lu2/p;->y2()Landroid/window/IRemoteTransition;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/app/Activity;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v4, "QuickstepLaunchHome"

    .line 54
    .line 55
    invoke-direct {v1, v2, v3, v4}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Lcom/android/launcher3/q5;->s:Landroid/window/RemoteTransition;

    .line 59
    .line 60
    new-instance v1, Landroid/window/TransitionFilter;

    .line 61
    .line 62
    invoke-direct {v1}, Landroid/window/TransitionFilter;-><init>()V

    .line 63
    .line 64
    .line 65
    const/16 v2, 0x100

    .line 66
    .line 67
    iput v2, v1, Landroid/window/TransitionFilter;->mNotFlags:I

    .line 68
    .line 69
    new-instance v2, Landroid/window/TransitionFilter$Requirement;

    .line 70
    .line 71
    invoke-direct {v2}, Landroid/window/TransitionFilter$Requirement;-><init>()V

    .line 72
    .line 73
    .line 74
    new-instance v3, Landroid/window/TransitionFilter$Requirement;

    .line 75
    .line 76
    invoke-direct {v3}, Landroid/window/TransitionFilter$Requirement;-><init>()V

    .line 77
    .line 78
    .line 79
    new-instance v4, Landroid/window/TransitionFilter$Requirement;

    .line 80
    .line 81
    invoke-direct {v4}, Landroid/window/TransitionFilter$Requirement;-><init>()V

    .line 82
    .line 83
    .line 84
    filled-new-array {v2, v3, v4}, [Landroid/window/TransitionFilter$Requirement;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    iput-object v2, v1, Landroid/window/TransitionFilter;->mRequirements:[Landroid/window/TransitionFilter$Requirement;

    .line 89
    .line 90
    aget-object v2, v2, v5

    .line 91
    .line 92
    const/4 v3, 0x2

    .line 93
    iput v3, v2, Landroid/window/TransitionFilter$Requirement;->mActivityType:I

    .line 94
    .line 95
    iget-object v4, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 96
    .line 97
    invoke-virtual {v4}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    iput-object v4, v2, Landroid/window/TransitionFilter$Requirement;->mTopActivity:Landroid/content/ComponentName;

    .line 102
    .line 103
    iget-object v2, v1, Landroid/window/TransitionFilter;->mRequirements:[Landroid/window/TransitionFilter$Requirement;

    .line 104
    .line 105
    aget-object v4, v2, v5

    .line 106
    .line 107
    const/4 v5, 0x3

    .line 108
    const/4 v6, 0x1

    .line 109
    filled-new-array {v6, v5}, [I

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    iput-object v5, v4, Landroid/window/TransitionFilter$Requirement;->mModes:[I

    .line 114
    .line 115
    iput v6, v4, Landroid/window/TransitionFilter$Requirement;->mOrder:I

    .line 116
    .line 117
    aget-object v4, v2, v6

    .line 118
    .line 119
    iput v6, v4, Landroid/window/TransitionFilter$Requirement;->mActivityType:I

    .line 120
    .line 121
    const/4 v5, 0x4

    .line 122
    filled-new-array {v3, v5}, [I

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    iput-object v5, v4, Landroid/window/TransitionFilter$Requirement;->mModes:[I

    .line 127
    .line 128
    aget-object v2, v2, v3

    .line 129
    .line 130
    iput-boolean v6, v2, Landroid/window/TransitionFilter$Requirement;->mNot:Z

    .line 131
    .line 132
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 133
    .line 134
    iput-object v3, v2, Landroid/window/TransitionFilter$Requirement;->mCustomAnimation:Ljava/lang/Boolean;

    .line 135
    .line 136
    iput-boolean v6, v2, Landroid/window/TransitionFilter$Requirement;->mMustBeTask:Z

    .line 137
    .line 138
    iput-boolean v6, v2, Landroid/window/TransitionFilter$Requirement;->mMustBeIndependent:Z

    .line 139
    .line 140
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 147
    .line 148
    iget-object v2, p0, Lcom/android/launcher3/q5;->s:Landroid/window/RemoteTransition;

    .line 149
    .line 150
    invoke-virtual {v0, v2, v1}, Lcom/android/quickstep/SystemUiProxy;->registerRemoteTransition(Landroid/window/RemoteTransition;Landroid/window/TransitionFilter;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 154
    .line 155
    if-eqz v0, :cond_1

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->registerComponentCallbacks()V

    .line 158
    .line 159
    .line 160
    invoke-direct {p0}, Lcom/android/launcher3/q5;->C0()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_1

    .line 165
    .line 166
    iget-object v0, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/android/launcher3/q5;->i:Landroid/os/Handler;

    .line 169
    .line 170
    invoke-virtual {v0, p0}, Lcom/android/quickstep/LauncherBackAnimationController;->registerBackCallbacks(Landroid/os/Handler;)V

    .line 171
    .line 172
    .line 173
    :cond_1
    :goto_0
    return-void
.end method

.method public T0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->K:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/q5;->K:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/q5;->K:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public U([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;FZ)Lcom/android/quickstep/util/BackAnimState;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p4

    .line 4
    .line 5
    move/from16 v1, p5

    .line 6
    .line 7
    iget-object v2, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-static {v3}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->g0:Z

    .line 20
    .line 21
    const/4 v9, 0x0

    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2, v9}, Lcom/android/launcher3/a;->close(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const/4 v10, 0x0

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v2, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 33
    .line 34
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->g0:Z

    .line 39
    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    move-object v11, v10

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/q5;->a0([Landroid/view/RemoteAnimationTarget;)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    move-object v11, v2

    .line 49
    :goto_0
    invoke-static {}, Lcom/android/launcher3/q5;->O()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    if-eqz v11, :cond_2

    .line 56
    .line 57
    invoke-virtual {v11}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    instance-of v3, v2, Lcom/android/launcher3/model/data/y;

    .line 62
    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->shouldUseBackgroundAnimation()Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_2

    .line 72
    .line 73
    new-instance v15, Lcom/android/launcher3/util/Y1;

    .line 74
    .line 75
    invoke-direct {v15}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v2, Landroid/window/WindowAnimationState;

    .line 79
    .line 80
    invoke-direct {v2}, Landroid/window/WindowAnimationState;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v7, v2, Landroid/window/WindowAnimationState;->bounds:Landroid/graphics/RectF;

    .line 84
    .line 85
    iput v1, v2, Landroid/window/WindowAnimationState;->topRightRadius:F

    .line 86
    .line 87
    iput v1, v2, Landroid/window/WindowAnimationState;->topLeftRadius:F

    .line 88
    .line 89
    iput v1, v2, Landroid/window/WindowAnimationState;->bottomRightRadius:F

    .line 90
    .line 91
    iput v1, v2, Landroid/window/WindowAnimationState;->bottomLeftRadius:F

    .line 92
    .line 93
    iget-object v13, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 94
    .line 95
    iget-object v14, v0, Lcom/android/launcher3/q5;->m:Lcom/android/launcher3/q5$J;

    .line 96
    .line 97
    const/4 v12, 0x0

    .line 98
    move-object/from16 v16, v2

    .line 99
    .line 100
    invoke-static/range {v11 .. v16}, Lcom/android/launcher3/q5$G;->d(Landroid/view/View;ZLcom/android/launcher3/C2;Lcom/android/launcher3/q5$J;Lcom/android/launcher3/util/Y1;Landroid/window/WindowAnimationState;)Lcom/android/launcher3/q5$G;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    if-eqz v3, :cond_2

    .line 105
    .line 106
    new-instance v8, Lcom/android/launcher3/q5$l;

    .line 107
    .line 108
    invoke-direct {v8, v0, v15}, Lcom/android/launcher3/q5$l;-><init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/util/Y1;)V

    .line 109
    .line 110
    .line 111
    const/4 v4, 0x2

    .line 112
    move-object/from16 v5, p1

    .line 113
    .line 114
    move-object/from16 v6, p2

    .line 115
    .line 116
    move-object/from16 v7, p3

    .line 117
    .line 118
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/q5$G;->e(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 119
    .line 120
    .line 121
    new-instance v0, Lcom/android/quickstep/util/AlreadyStartedBackAnimState;

    .line 122
    .line 123
    invoke-direct {v0, v15}, Lcom/android/quickstep/util/AlreadyStartedBackAnimState;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 124
    .line 125
    .line 126
    return-object v0

    .line 127
    :cond_2
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 128
    .line 129
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 130
    .line 131
    .line 132
    iget-object v2, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 133
    .line 134
    invoke-virtual {v2}, Lcom/android/launcher3/v;->isForceInvisible()Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    const/4 v12, 0x1

    .line 139
    if-nez v2, :cond_4

    .line 140
    .line 141
    move-object/from16 v2, p1

    .line 142
    .line 143
    invoke-direct {v0, v2, v9}, Lcom/android/launcher3/q5;->N0([Landroid/view/RemoteAnimationTarget;I)Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-eqz v3, :cond_3

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_3
    move v13, v9

    .line 151
    goto :goto_2

    .line 152
    :cond_4
    move-object/from16 v2, p1

    .line 153
    .line 154
    :goto_1
    move v13, v12

    .line 155
    :goto_2
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/q5;->Y0([Landroid/view/RemoteAnimationTarget;)Z

    .line 156
    .line 157
    .line 158
    move-result v14

    .line 159
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    if-nez v3, :cond_5

    .line 164
    .line 165
    xor-int/lit8 v3, p6, 0x1

    .line 166
    .line 167
    move v15, v3

    .line 168
    goto :goto_3

    .line 169
    :cond_5
    move v15, v12

    .line 170
    :goto_3
    if-nez v14, :cond_8

    .line 171
    .line 172
    iget-object v3, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 173
    .line 174
    sget-object v4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 175
    .line 176
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    if-nez v3, :cond_8

    .line 181
    .line 182
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 183
    .line 184
    .line 185
    iget-object v3, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 186
    .line 187
    invoke-static {v3}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    const v4, 0x7f070c38

    .line 192
    .line 193
    .line 194
    invoke-interface {v3, v4}, Lx2/h;->a(I)F

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    new-instance v6, Landroid/graphics/PointF;

    .line 199
    .line 200
    const/4 v4, 0x0

    .line 201
    neg-float v3, v3

    .line 202
    invoke-direct {v6, v4, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 203
    .line 204
    .line 205
    sget-object v3, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 206
    .line 207
    iget-object v4, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 208
    .line 209
    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    check-cast v3, Lcom/android/launcher3/anim/C;

    .line 218
    .line 219
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    iget-boolean v4, v4, Lu2/e;->m:Z

    .line 224
    .line 225
    if-eqz v4, :cond_6

    .line 226
    .line 227
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    invoke-virtual {v4}, Lu2/e;->c()Landroid/graphics/RectF;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    invoke-virtual {v7, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    invoke-virtual {v3}, Lu2/e;->f()F

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    move v8, v3

    .line 247
    move-object/from16 v4, p3

    .line 248
    .line 249
    move-object v5, v11

    .line 250
    move-object/from16 v3, p2

    .line 251
    .line 252
    goto :goto_4

    .line 253
    :cond_6
    move/from16 v8, p5

    .line 254
    .line 255
    move-object/from16 v3, p2

    .line 256
    .line 257
    move-object/from16 v4, p3

    .line 258
    .line 259
    move-object v5, v11

    .line 260
    :goto_4
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/q5;->k0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)Lcom/android/quickstep/util/RectFSpringAnim;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    move-object v11, v5

    .line 265
    iget-object v2, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 266
    .line 267
    sget-object v4, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 268
    .line 269
    invoke-interface {v2, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    if-eqz v2, :cond_7

    .line 274
    .line 275
    move v2, v12

    .line 276
    goto :goto_5

    .line 277
    :cond_7
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 278
    .line 279
    .line 280
    move v2, v9

    .line 281
    goto :goto_5

    .line 282
    :cond_8
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/q5;->p0([Landroid/view/RemoteAnimationTarget;)Landroid/animation/Animator;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 287
    .line 288
    .line 289
    move v2, v9

    .line 290
    move-object v3, v10

    .line 291
    :goto_5
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 292
    .line 293
    .line 294
    move-result v4

    .line 295
    if-eqz v4, :cond_a

    .line 296
    .line 297
    new-instance v4, Lcom/android/launcher3/q5$m;

    .line 298
    .line 299
    invoke-direct {v4, v0}, Lcom/android/launcher3/q5$m;-><init>(Lcom/android/launcher3/q5;)V

    .line 300
    .line 301
    .line 302
    if-eqz v3, :cond_9

    .line 303
    .line 304
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 305
    .line 306
    .line 307
    goto :goto_6

    .line 308
    :cond_9
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 309
    .line 310
    .line 311
    :cond_a
    :goto_6
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 312
    .line 313
    .line 314
    move-result v4

    .line 315
    if-nez v4, :cond_b

    .line 316
    .line 317
    if-eqz p6, :cond_b

    .line 318
    .line 319
    goto :goto_7

    .line 320
    :cond_b
    move v12, v9

    .line 321
    :goto_7
    if-nez v13, :cond_c

    .line 322
    .line 323
    if-eqz v12, :cond_19

    .line 324
    .line 325
    :cond_c
    const/16 v4, 0x9

    .line 326
    .line 327
    if-eqz v3, :cond_d

    .line 328
    .line 329
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 334
    .line 335
    .line 336
    move-result v5

    .line 337
    if-eqz v5, :cond_d

    .line 338
    .line 339
    invoke-direct {v0, v3, v4}, Lcom/android/launcher3/q5;->L(Lcom/android/quickstep/util/RectFSpringAnim;I)V

    .line 340
    .line 341
    .line 342
    goto :goto_8

    .line 343
    :cond_d
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/q5;->B0([Landroid/view/RemoteAnimationTarget;)Z

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    if-eqz v5, :cond_e

    .line 348
    .line 349
    const/16 v5, 0x75

    .line 350
    .line 351
    invoke-direct {v0, v1, v5}, Lcom/android/launcher3/q5;->K(Landroid/animation/Animator;I)V

    .line 352
    .line 353
    .line 354
    :cond_e
    if-eqz v14, :cond_f

    .line 355
    .line 356
    const/16 v4, 0x4e

    .line 357
    .line 358
    :cond_f
    invoke-direct {v0, v1, v4}, Lcom/android/launcher3/q5;->K(Landroid/animation/Animator;I)V

    .line 359
    .line 360
    .line 361
    :goto_8
    invoke-static {}, Lcom/android/launcher3/y0;->t0()Z

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    if-nez v4, :cond_11

    .line 366
    .line 367
    new-instance v4, Lcom/android/launcher3/q5$n;

    .line 368
    .line 369
    invoke-direct {v4, v0}, Lcom/android/launcher3/q5$n;-><init>(Lcom/android/launcher3/q5;)V

    .line 370
    .line 371
    .line 372
    if-eqz p6, :cond_10

    .line 373
    .line 374
    if-eqz v3, :cond_10

    .line 375
    .line 376
    invoke-virtual {v3, v4}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 377
    .line 378
    .line 379
    goto :goto_9

    .line 380
    :cond_10
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 381
    .line 382
    .line 383
    :cond_11
    :goto_9
    iget-object v4, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 384
    .line 385
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 386
    .line 387
    .line 388
    move-result-object v4

    .line 389
    new-array v5, v9, [Landroid/animation/Animator;

    .line 390
    .line 391
    invoke-virtual {v4, v1, v5}, Lcom/android/launcher3/statemanager/d;->d0(Landroid/animation/AnimatorSet;[Landroid/animation/Animator;)V

    .line 392
    .line 393
    .line 394
    iget-object v4, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 395
    .line 396
    sget-object v5, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 397
    .line 398
    invoke-interface {v4, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 399
    .line 400
    .line 401
    move-result v4

    .line 402
    if-eqz v4, :cond_13

    .line 403
    .line 404
    if-nez p6, :cond_13

    .line 405
    .line 406
    sget-boolean v4, Lf1/a;->H:Z

    .line 407
    .line 408
    if-nez v4, :cond_12

    .line 409
    .line 410
    invoke-static {}, Lx1/O;->Y2()Z

    .line 411
    .line 412
    .line 413
    move-result v4

    .line 414
    if-eqz v4, :cond_13

    .line 415
    .line 416
    if-nez v3, :cond_13

    .line 417
    .line 418
    :cond_12
    const/16 v4, 0x64

    .line 419
    .line 420
    invoke-direct {v0, v9, v4, v2}, Lcom/android/launcher3/q5;->q0(ZIZ)Landroid/util/Pair;

    .line 421
    .line 422
    .line 423
    move-result-object v2

    .line 424
    iget-object v4, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 425
    .line 426
    check-cast v4, Landroid/animation/Animator;

    .line 427
    .line 428
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 429
    .line 430
    .line 431
    new-instance v4, Lcom/android/launcher3/q5$o;

    .line 432
    .line 433
    invoke-direct {v4, v0, v2}, Lcom/android/launcher3/q5$o;-><init>(Lcom/android/launcher3/q5;Landroid/util/Pair;)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 437
    .line 438
    .line 439
    goto :goto_a

    .line 440
    :cond_13
    if-eqz v15, :cond_19

    .line 441
    .line 442
    iget-object v2, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 443
    .line 444
    sget-object v4, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 445
    .line 446
    invoke-interface {v2, v4}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 447
    .line 448
    .line 449
    move-result v2

    .line 450
    if-nez v2, :cond_19

    .line 451
    .line 452
    sget-boolean v2, Lf1/a;->H:Z

    .line 453
    .line 454
    if-nez v2, :cond_14

    .line 455
    .line 456
    if-nez v14, :cond_14

    .line 457
    .line 458
    invoke-static {}, Lx1/O;->Y2()Z

    .line 459
    .line 460
    .line 461
    move-result v4

    .line 462
    if-eqz v4, :cond_19

    .line 463
    .line 464
    if-nez v3, :cond_19

    .line 465
    .line 466
    :cond_14
    iget-object v4, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 467
    .line 468
    sget-object v5, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 469
    .line 470
    invoke-interface {v4, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 471
    .line 472
    .line 473
    move-result v4

    .line 474
    if-nez v4, :cond_19

    .line 475
    .line 476
    iget-object v4, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 477
    .line 478
    sget-object v5, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 479
    .line 480
    invoke-interface {v4, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 481
    .line 482
    .line 483
    move-result v4

    .line 484
    if-nez v4, :cond_19

    .line 485
    .line 486
    if-nez v2, :cond_15

    .line 487
    .line 488
    if-nez v14, :cond_15

    .line 489
    .line 490
    invoke-static {}, Lx1/O;->Y2()Z

    .line 491
    .line 492
    .line 493
    move-result v2

    .line 494
    if-eqz v2, :cond_18

    .line 495
    .line 496
    if-nez v3, :cond_18

    .line 497
    .line 498
    :cond_15
    if-nez v14, :cond_16

    .line 499
    .line 500
    invoke-static {}, Lx1/O;->Y2()Z

    .line 501
    .line 502
    .line 503
    move-result v2

    .line 504
    if-eqz v2, :cond_17

    .line 505
    .line 506
    :cond_16
    move-object v11, v10

    .line 507
    :cond_17
    invoke-static {v11}, Lcom/android/launcher3/anim/C;->h0(Landroid/view/View;)V

    .line 508
    .line 509
    .line 510
    :cond_18
    new-instance v2, Lcom/android/quickstep/util/WorkspaceRevealAnim;

    .line 511
    .line 512
    iget-object v0, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 513
    .line 514
    invoke-direct {v2, v0, v9}, Lcom/android/quickstep/util/WorkspaceRevealAnim;-><init>(Lcom/android/launcher3/C2;Z)V

    .line 515
    .line 516
    .line 517
    invoke-virtual {v2}, Lcom/android/quickstep/util/WorkspaceRevealAnim;->getAnimators()Landroid/animation/AnimatorSet;

    .line 518
    .line 519
    .line 520
    move-result-object v0

    .line 521
    sget v2, Lcom/android/launcher3/anim/C;->T:I

    .line 522
    .line 523
    int-to-long v4, v2

    .line 524
    invoke-virtual {v0, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 525
    .line 526
    .line 527
    invoke-virtual {v0, v10}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 531
    .line 532
    .line 533
    :cond_19
    :goto_a
    new-instance v0, Lcom/android/quickstep/util/AnimatorBackState;

    .line 534
    .line 535
    invoke-direct {v0, v3, v1}, Lcom/android/quickstep/util/AnimatorBackState;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;Landroid/animation/AnimatorSet;)V

    .line 536
    .line 537
    .line 538
    return-object v0
.end method

.method public U0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->J:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V([Lu2/s;[Lu2/s;[Lu2/s;ZLandroid/graphics/RectF;FLcom/android/launcher3/M2$a;Z)Lcom/android/quickstep/util/BackAnimState;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v9, p8

    .line 4
    .line 5
    iget-object v1, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->g0:Z

    .line 12
    .line 13
    const/4 v10, 0x0

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1, v10}, Lcom/android/launcher3/a;->close(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    new-instance v5, Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 28
    .line 29
    sget-object v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->REMOTE_CLOSE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 30
    .line 31
    invoke-direct {v5, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 32
    .line 33
    .line 34
    if-eqz v9, :cond_1

    .line 35
    .line 36
    move/from16 v7, p6

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/high16 v1, -0x40800000    # -1.0f

    .line 40
    .line 41
    move v7, v1

    .line 42
    :goto_0
    invoke-static/range {p1 .. p1}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q5;->a0([Landroid/view/RemoteAnimationTarget;)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 51
    .line 52
    invoke-virtual {v3}, Lcom/android/launcher3/v;->isForceInvisible()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    const/4 v11, 0x1

    .line 57
    if-nez v3, :cond_3

    .line 58
    .line 59
    invoke-direct {v0, v1, v10}, Lcom/android/launcher3/q5;->N0([Landroid/view/RemoteAnimationTarget;I)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    move v12, v10

    .line 67
    goto :goto_2

    .line 68
    :cond_3
    :goto_1
    move v12, v11

    .line 69
    :goto_2
    invoke-direct {v0, v1}, Lcom/android/launcher3/q5;->Y0([Landroid/view/RemoteAnimationTarget;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-direct {v0, v1}, Lcom/android/launcher3/q5;->Y0([Landroid/view/RemoteAnimationTarget;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    const/4 v13, 0x0

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    move-object v8, v13

    .line 81
    goto :goto_3

    .line 82
    :cond_4
    move-object v8, v2

    .line 83
    :goto_3
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Lcom/android/launcher3/globalsearch/s;->b()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_5

    .line 102
    .line 103
    move v1, v11

    .line 104
    goto :goto_4

    .line 105
    :cond_5
    move v1, v10

    .line 106
    :goto_4
    iget v2, v0, Lcom/android/launcher3/q5;->R:I

    .line 107
    .line 108
    invoke-static {v2}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-nez v2, :cond_7

    .line 113
    .line 114
    if-eqz v1, :cond_6

    .line 115
    .line 116
    goto :goto_5

    .line 117
    :cond_6
    move v1, v10

    .line 118
    goto :goto_6

    .line 119
    :cond_7
    :goto_5
    move v1, v11

    .line 120
    :goto_6
    if-eqz p4, :cond_8

    .line 121
    .line 122
    :goto_7
    move-object v14, v5

    .line 123
    goto/16 :goto_e

    .line 124
    .line 125
    :cond_8
    if-nez v1, :cond_9

    .line 126
    .line 127
    if-nez v3, :cond_9

    .line 128
    .line 129
    move-object/from16 v1, p1

    .line 130
    .line 131
    move-object/from16 v2, p2

    .line 132
    .line 133
    move-object/from16 v3, p3

    .line 134
    .line 135
    move-object/from16 v6, p5

    .line 136
    .line 137
    move-object/from16 v4, p7

    .line 138
    .line 139
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/q5;->a1([Lu2/s;[Lu2/s;[Lu2/s;Lcom/android/launcher3/M2$a;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/graphics/RectF;F)V

    .line 140
    .line 141
    .line 142
    goto :goto_7

    .line 143
    :cond_9
    move-object/from16 v15, p1

    .line 144
    .line 145
    move-object v14, v5

    .line 146
    iget-object v1, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 147
    .line 148
    invoke-static {v1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    const v2, 0x7f070c38

    .line 153
    .line 154
    .line 155
    invoke-interface {v1, v2}, Lx2/h;->a(I)F

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    new-instance v6, Landroid/graphics/PointF;

    .line 160
    .line 161
    const/4 v2, 0x0

    .line 162
    neg-float v1, v1

    .line 163
    invoke-direct {v6, v2, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v14}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimatorSet()Landroid/animation/AnimatorSet;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-static {v15}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-static/range {p2 .. p2}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-static/range {p3 .. p3}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    move-object v5, v8

    .line 183
    move v8, v7

    .line 184
    move-object/from16 v7, p5

    .line 185
    .line 186
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/q5;->k0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)Lcom/android/quickstep/util/RectFSpringAnim;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    iget-object v2, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 191
    .line 192
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v2}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    check-cast v2, Lcom/android/launcher3/V3;

    .line 201
    .line 202
    array-length v2, v15

    .line 203
    move v3, v10

    .line 204
    move v4, v11

    .line 205
    :goto_8
    if-ge v3, v2, :cond_c

    .line 206
    .line 207
    aget-object v5, v15, v3

    .line 208
    .line 209
    iget v6, v5, Lu2/s;->m:I

    .line 210
    .line 211
    if-ne v6, v11, :cond_a

    .line 212
    .line 213
    iget-boolean v6, v5, Lu2/s;->g:Z

    .line 214
    .line 215
    and-int/2addr v4, v6

    .line 216
    invoke-static {v5}, Lcom/android/launcher3/q5;->X(Lu2/s;)Landroid/content/ComponentName;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    if-eqz v5, :cond_a

    .line 221
    .line 222
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    const-string v6, "com.teamtalk.im"

    .line 227
    .line 228
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v5

    .line 232
    if-eqz v5, :cond_a

    .line 233
    .line 234
    move v4, v10

    .line 235
    :cond_a
    if-nez v4, :cond_b

    .line 236
    .line 237
    goto :goto_9

    .line 238
    :cond_b
    add-int/lit8 v3, v3, 0x1

    .line 239
    .line 240
    goto :goto_8

    .line 241
    :cond_c
    :goto_9
    if-eqz v9, :cond_d

    .line 242
    .line 243
    move v4, v11

    .line 244
    :cond_d
    const-string v2, "QuickstepTransitionManager"

    .line 245
    .line 246
    if-eqz v12, :cond_f

    .line 247
    .line 248
    sget-object v3, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 249
    .line 250
    invoke-virtual {v3}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    if-eqz v3, :cond_e

    .line 255
    .line 256
    goto :goto_a

    .line 257
    :cond_e
    if-eqz v9, :cond_14

    .line 258
    .line 259
    const-string v3, "Skip content animation for LauncherBackRunner"

    .line 260
    .line 261
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    .line 263
    .line 264
    invoke-direct {v0, v9}, Lcom/android/launcher3/q5;->Z0(Z)V

    .line 265
    .line 266
    .line 267
    goto :goto_d

    .line 268
    :cond_f
    :goto_a
    invoke-virtual {v14}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimationId()I

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    const/4 v5, -0x1

    .line 273
    if-ne v3, v5, :cond_10

    .line 274
    .line 275
    iget-object v3, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 276
    .line 277
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-virtual {v3, v14, v11}, Lcom/android/launcher3/statemanager/d;->f0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    if-eqz v3, :cond_11

    .line 289
    .line 290
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    invoke-virtual {v3}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    const/4 v5, 0x7

    .line 299
    invoke-virtual {v3, v5}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->cancel(I)V

    .line 300
    .line 301
    .line 302
    goto :goto_b

    .line 303
    :cond_10
    iget-object v3, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 304
    .line 305
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 306
    .line 307
    .line 308
    move-result-object v3

    .line 309
    invoke-virtual {v3, v14, v10}, Lcom/android/launcher3/statemanager/d;->f0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 310
    .line 311
    .line 312
    :cond_11
    :goto_b
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/q5;->E0([Lu2/s;)Z

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    if-nez v3, :cond_13

    .line 317
    .line 318
    if-eqz v4, :cond_12

    .line 319
    .line 320
    goto :goto_c

    .line 321
    :cond_12
    invoke-virtual {v0, v14, v13}, Lcom/android/launcher3/q5;->c1(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/view/View;)V

    .line 322
    .line 323
    .line 324
    goto :goto_d

    .line 325
    :cond_13
    :goto_c
    const-string v3, "Skip content animation"

    .line 326
    .line 327
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    .line 329
    .line 330
    invoke-direct {v0, v9}, Lcom/android/launcher3/q5;->Z0(Z)V

    .line 331
    .line 332
    .line 333
    :cond_14
    :goto_d
    move-object v13, v1

    .line 334
    :goto_e
    new-instance v0, Lcom/android/quickstep/util/AnimatorBackStateMulti;

    .line 335
    .line 336
    invoke-direct {v0, v13, v14}, Lcom/android/quickstep/util/AnimatorBackStateMulti;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 337
    .line 338
    .line 339
    return-object v0
.end method

.method public V0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    iput-boolean v2, v1, Lcom/android/launcher3/anim/C;->D:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 21
    .line 22
    iput-boolean v2, v1, Lcom/android/launcher3/anim/C;->E:Z

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 31
    .line 32
    iput-boolean v2, v0, Lcom/android/launcher3/anim/C;->K:Z

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/q5;->K:Ljava/lang/Runnable;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p0, p0, Lcom/android/launcher3/q5;->K:Ljava/lang/Runnable;

    .line 45
    .line 46
    const-wide/16 v1, 0x12c

    .line 47
    .line 48
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public W(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    return-void
.end method

.method public W0(Lcom/android/quickstep/util/animation/AnimationRecord;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setRecentAnimRecord: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "QuickstepTransitionManager"

    .line 19
    .line 20
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/q5;->L:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 24
    .line 25
    return-void
.end method

.method public Z(Lu2/s;)Landroid/view/View;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    iget-object v1, p1, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_2

    .line 9
    :cond_0
    iget-object v2, v1, Landroid/app/ActivityManager$RunningTaskInfo;->baseActivity:Landroid/content/ComponentName;

    .line 10
    .line 11
    iget-object v3, v1, Landroid/app/ActivityManager$RunningTaskInfo;->origActivity:Landroid/content/ComponentName;

    .line 12
    .line 13
    iget-object v4, v1, Landroid/app/ActivityManager$RunningTaskInfo;->realActivity:Landroid/content/ComponentName;

    .line 14
    .line 15
    iget-object v1, v1, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 16
    .line 17
    filled-new-array {v2, v3, v4, v1}, [Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    const/4 v3, 0x4

    .line 23
    if-ge v2, v3, :cond_2

    .line 24
    .line 25
    aget-object v3, v1, v2

    .line 26
    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    move-object v1, v0

    .line 44
    :goto_1
    if-nez v1, :cond_3

    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_3
    iget-object v0, p1, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 48
    .line 49
    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->launchCookies:Ljava/util/ArrayList;

    .line 50
    .line 51
    if-nez v0, :cond_4

    .line 52
    .line 53
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 54
    .line 55
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/android/launcher3/util/z2;->a(Ljava/util/List;)Lcom/android/launcher3/util/z2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object p1, p1, Lu2/s;->w:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 62
    .line 63
    iget p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->userId:I

    .line 64
    .line 65
    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->t5(Lcom/android/launcher3/util/z2;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_5
    :goto_2
    return-object v0
.end method

.method public a0([Landroid/view/RemoteAnimationTarget;)Landroid/view/View;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

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
    return-object v1

    .line 11
    :cond_0
    array-length v0, p1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v0, :cond_2

    .line 14
    .line 15
    aget-object v3, p1, v2

    .line 16
    .line 17
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    if-ne v4, v5, :cond_1

    .line 21
    .line 22
    invoke-direct {p0, v3}, Lcom/android/launcher3/q5;->Y(Landroid/view/RemoteAnimationTarget;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iput-object v3, p0, Lcom/android/launcher3/q5;->C:Landroid/view/RemoteAnimationTarget;

    .line 27
    .line 28
    if-eqz v4, :cond_1

    .line 29
    .line 30
    return-object v4

    .line 31
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return-object v1
.end method

.method public a1([Lu2/s;[Lu2/s;[Lu2/s;Lcom/android/launcher3/M2$a;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/graphics/RectF;F)V
    .locals 11

    .line 1
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/q5;->E0([Lu2/s;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    invoke-static {p1}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/q5;->a0([Landroid/view/RemoteAnimationTarget;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v1, "startAppCloseAnimator launcherView: "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "QuickstepTransitionManager"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    const/4 v10, 0x0

    .line 40
    if-eqz v5, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 43
    .line 44
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 45
    .line 46
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/q5;->M:Lcom/android/launcher3/anim/P;

    .line 53
    .line 54
    invoke-static {p1}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/q5;->j0([Lu2/s;I)Landroid/graphics/RectF;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    move-object v1, p1

    .line 67
    move-object v2, p2

    .line 68
    move-object v3, p3

    .line 69
    move-object v7, p4

    .line 70
    move-object/from16 v6, p5

    .line 71
    .line 72
    move-object/from16 v8, p6

    .line 73
    .line 74
    move/from16 v9, p7

    .line 75
    .line 76
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/anim/P;->p([Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;F)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    move-object/from16 v6, p5

    .line 81
    .line 82
    iget-object p2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 83
    .line 84
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-static {p3}, Lcom/android/launcher3/widget/I0;->b(Landroid/content/Context;)F

    .line 89
    .line 90
    .line 91
    move-result p3

    .line 92
    invoke-static {p1, v10, p2, p3, v10}, Lcom/android/launcher3/anim/y;->b([Lu2/s;ZLcom/android/launcher3/C2;FZ)Landroid/animation/ValueAnimator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {v6, p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Landroid/animation/Animator;)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 100
    .line 101
    sget-object p2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 102
    .line 103
    invoke-interface {p1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-nez p1, :cond_3

    .line 108
    .line 109
    invoke-static {}, Lx1/O;->Y2()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_3

    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 116
    .line 117
    sget-object p2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 118
    .line 119
    invoke-interface {p1, p2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-nez p1, :cond_2

    .line 124
    .line 125
    new-instance p1, LQ1/f;

    .line 126
    .line 127
    invoke-direct {p1}, LQ1/f;-><init>()V

    .line 128
    .line 129
    .line 130
    const/16 p2, 0xe

    .line 131
    .line 132
    iput p2, p1, LQ1/f;->i:I

    .line 133
    .line 134
    const-wide/16 p2, 0x0

    .line 135
    .line 136
    iput-wide p2, p1, LQ1/f;->g:J

    .line 137
    .line 138
    iget-object p2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 139
    .line 140
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    sget-object p3, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 145
    .line 146
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 147
    .line 148
    invoke-virtual {p2, p3, v0, p1}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p2}, Landroid/animation/AnimatorSet;->start()V

    .line 153
    .line 154
    .line 155
    iget-object p2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 156
    .line 157
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 162
    .line 163
    const/4 v0, 0x1

    .line 164
    invoke-virtual {p2, v0}, Lcom/android/launcher3/V4;->forceFinishScroller(Z)V

    .line 165
    .line 166
    .line 167
    iget-object p2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 168
    .line 169
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 174
    .line 175
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->forceOnPageTransitionEndCallback()V

    .line 176
    .line 177
    .line 178
    iget-object p2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 179
    .line 180
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p2}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    sget-object v0, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 189
    .line 190
    invoke-virtual {p2, v0, p3, p1}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 191
    .line 192
    .line 193
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isAppOpenType()Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    invoke-virtual {p0, v6, p1, v10}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V

    .line 204
    .line 205
    .line 206
    :cond_3
    :goto_1
    return-void
.end method

.method public b1(Landroid/view/View;[Lu2/s;[Lu2/s;[Lu2/s;Lcom/android/launcher3/M2$a;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V
    .locals 14

    .line 1
    move-object/from16 v2, p2

    .line 2
    .line 3
    move-object/from16 v8, p6

    .line 4
    .line 5
    instance-of v0, p1, Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v10, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-static {v4}, Lcom/android/launcher3/widget/I0;->b(Landroid/content/Context;)F

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-static {v2, v10, v0, v4, v3}, Lcom/android/launcher3/anim/y;->b([Lu2/s;ZLcom/android/launcher3/C2;FZ)Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v8, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Landroid/animation/Animator;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v8, p1}, Lcom/android/launcher3/q5;->c1(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, v8, v10}, Lcom/android/launcher3/statemanager/d;->f0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, v8, v3}, Lcom/android/launcher3/statemanager/d;->f0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V

    .line 48
    .line 49
    .line 50
    invoke-static {v2}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-direct {p0, v0, v10}, Lcom/android/launcher3/q5;->N0([Landroid/view/RemoteAnimationTarget;I)Z

    .line 55
    .line 56
    .line 57
    move-result v11

    .line 58
    invoke-static {v2}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    invoke-static {v2}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v2}, Lu2/s;->i([Lu2/s;)[Landroid/view/RemoteAnimationTarget;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-static {v4}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-direct {p0, v0, v4}, Lcom/android/launcher3/q5;->A0([Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    array-length v0, v2

    .line 83
    move v4, v3

    .line 84
    move v6, v10

    .line 85
    :goto_0
    if-ge v4, v0, :cond_3

    .line 86
    .line 87
    aget-object v9, v2, v4

    .line 88
    .line 89
    iget v12, v9, Lu2/s;->m:I

    .line 90
    .line 91
    if-eqz v12, :cond_1

    .line 92
    .line 93
    const/4 v13, 0x2

    .line 94
    if-ne v12, v13, :cond_2

    .line 95
    .line 96
    :cond_1
    iget-boolean v12, v9, Lu2/s;->g:Z

    .line 97
    .line 98
    and-int/2addr v6, v12

    .line 99
    invoke-static {v9}, Lcom/android/launcher3/q5;->X(Lu2/s;)Landroid/content/ComponentName;

    .line 100
    .line 101
    .line 102
    move-result-object v9

    .line 103
    if-eqz v9, :cond_2

    .line 104
    .line 105
    sget-object v12, Lcom/android/launcher3/q5;->c0:Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-virtual {v9}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v9

    .line 115
    if-eqz v9, :cond_2

    .line 116
    .line 117
    move v6, v3

    .line 118
    :cond_2
    if-nez v6, :cond_4

    .line 119
    .line 120
    :cond_3
    move v12, v6

    .line 121
    goto :goto_1

    .line 122
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/q5;->M:Lcom/android/launcher3/anim/P;

    .line 126
    .line 127
    xor-int/lit8 v6, v12, 0x1

    .line 128
    .line 129
    move-object v1, p1

    .line 130
    move-object/from16 v3, p3

    .line 131
    .line 132
    move-object/from16 v4, p4

    .line 133
    .line 134
    move-object/from16 v9, p5

    .line 135
    .line 136
    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher3/anim/P;->s(Landroid/view/View;[Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/Rect;ZILcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;)V

    .line 137
    .line 138
    .line 139
    if-nez v11, :cond_6

    .line 140
    .line 141
    if-nez v12, :cond_5

    .line 142
    .line 143
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_5

    .line 150
    .line 151
    invoke-static {p1, v10}, LU0/e;->d(Landroid/view/View;Z)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_5

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_5
    return-void

    .line 159
    :cond_6
    :goto_2
    invoke-virtual {p0, v8, p1}, Lcom/android/launcher3/q5;->c1(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/view/View;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->F:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/q5;->H:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/util/RectFSpringAnim;->end()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public c1(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "startLauncherContentAnimation, animType: "

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimType()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, ", "

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const-string v0, "QuickstepTransitionManager"

    .line 41
    .line 42
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isAppOpenType()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public d0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->G:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d1(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->t:Lcom/android/launcher3/q5$H;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/q5$H;->a(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5;->J:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/q5;->J:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/lang/Runnable;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/q5;->J:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public f0(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/q5;->D0(Landroid/view/View;[Landroid/view/RemoteAnimationTarget;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Lcom/android/launcher3/t;

    .line 17
    .line 18
    invoke-direct {v3, v1}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v3}, Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;->register(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Lcom/android/launcher3/q5;->n:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v3, Lcom/android/launcher3/q5$w;

    .line 30
    .line 31
    invoke-direct {v3, p0, v2}, Lcom/android/launcher3/q5$w;-><init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/util/TaskRestartedDuringLaunchListener;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/q5;->T(Landroid/view/View;Lcom/android/launcher3/util/Y1;)Lu2/p;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    const-wide/16 v2, 0x150

    .line 44
    .line 45
    :goto_0
    move-wide v6, v2

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    sget-wide v2, Lcom/android/launcher3/q5;->V:J

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :goto_1
    const-wide/16 v2, 0xd8

    .line 51
    .line 52
    sub-long v8, v6, v2

    .line 53
    .line 54
    new-instance v4, Landroid/view/RemoteAnimationAdapter;

    .line 55
    .line 56
    invoke-direct/range {v4 .. v9}, Landroid/view/RemoteAnimationAdapter;-><init>(Landroid/view/IRemoteAnimationRunner;JJ)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Landroid/window/RemoteTransition;

    .line 60
    .line 61
    invoke-virtual {v5}, Lu2/p;->y2()Landroid/window/IRemoteTransition;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/app/Activity;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    const-string v5, "QuickstepLaunch"

    .line 72
    .line 73
    invoke-direct {v0, v2, v3, v5}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v4, v0}, Landroid/app/ActivityOptions;->makeRemoteAnimation(Landroid/view/RemoteAnimationAdapter;Landroid/window/RemoteTransition;)Landroid/app/ActivityOptions;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v2, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 81
    .line 82
    invoke-static {v1, v2}, Lcom/android/quickstep/util/AnimUtils;->completeRunnableListCallback(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/views/k;)Landroid/os/IRemoteCallback;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v0, v2}, Landroid/app/ActivityOptions;->setOnAnimationAbortListener(Landroid/os/IRemoteCallback;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/app/ActivityOptions;->setOnAnimationFinishedListener(Landroid/os/IRemoteCallback;)V

    .line 90
    .line 91
    .line 92
    if-eqz p1, :cond_1

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    instance-of v2, v2, Lcom/android/launcher3/model/data/y;

    .line 99
    .line 100
    if-eqz v2, :cond_1

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 107
    .line 108
    iget v2, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 109
    .line 110
    const/4 v3, -0x1

    .line 111
    if-ne v2, v3, :cond_1

    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 118
    .line 119
    iget v2, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 120
    .line 121
    if-ne v2, v3, :cond_1

    .line 122
    .line 123
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    if-nez v2, :cond_1

    .line 134
    .line 135
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 140
    .line 141
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 142
    .line 143
    if-ne p1, v3, :cond_1

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_1
    invoke-static {p2}, Lcom/android/launcher3/util/z2;->c(Lcom/android/launcher3/model/data/y;)Landroid/os/IBinder;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {v0, p1}, Landroid/app/ActivityOptions;->setLaunchCookie(Landroid/os/IBinder;)V

    .line 151
    .line 152
    .line 153
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-static {}, Lcom/android/launcher3/y0;->F0()Z

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    if-eqz p2, :cond_2

    .line 164
    .line 165
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    if-eqz p2, :cond_2

    .line 170
    .line 171
    if-eqz p1, :cond_2

    .line 172
    .line 173
    const/4 p2, 0x1

    .line 174
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/V;->u0(Z)V

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 178
    .line 179
    new-instance p2, Lcom/android/launcher3/t;

    .line 180
    .line 181
    invoke-direct {p2, v1}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 182
    .line 183
    .line 184
    const/4 v2, 0x3

    .line 185
    invoke-virtual {p0, v2, p2}, Lcom/android/launcher3/v;->addEventCallback(ILjava/lang/Runnable;)V

    .line 186
    .line 187
    .line 188
    new-instance p0, Lcom/android/launcher3/c5;

    .line 189
    .line 190
    invoke-direct {p0, p1}, Lcom/android/launcher3/c5;-><init>(Lcom/android/launcher3/taskbar/V;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 194
    .line 195
    .line 196
    :cond_2
    new-instance p0, Lcom/android/launcher3/util/b;

    .line 197
    .line 198
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    .line 199
    .line 200
    .line 201
    return-object p0
.end method

.method protected f1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/quickstep/SystemUiProxy;->unshareTransactionQueue()V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lf1/a;->s:Lf1/a$a;

    .line 15
    .line 16
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/q5;->s:Landroid/window/RemoteTransition;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/q5;->s:Landroid/window/RemoteTransition;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->unregisterRemoteTransition(Landroid/window/RemoteTransition;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/android/launcher3/q5;->s:Landroid/window/RemoteTransition;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/android/launcher3/q5;->r:Lcom/android/launcher3/M2$b;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 47
    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/android/quickstep/LauncherBackAnimationController;->unregisterBackCallbacks()V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/android/quickstep/LauncherBackAnimationController;->unregisterComponentCallbacks()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/android/launcher3/q5;->u:Lcom/android/quickstep/LauncherBackAnimationController;

    .line 59
    .line 60
    :cond_2
    :goto_0
    return-void
.end method

.method public g0()Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->M:Lcom/android/launcher3/anim/P;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/anim/N;->f()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h0()Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5;->M:Lcom/android/launcher3/anim/P;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/anim/N;->g()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j0([Lu2/s;I)Landroid/graphics/RectF;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget v2, v1, Lcom/android/launcher3/h0;->T0:I

    .line 6
    .line 7
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-direct {v0, v3, v3, v2, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 11
    .line 12
    .line 13
    array-length v1, p1

    .line 14
    :goto_0
    if-ge v3, v1, :cond_5

    .line 15
    .line 16
    aget-object v2, p1, v3

    .line 17
    .line 18
    iget v4, v2, Lu2/s;->m:I

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    if-ne v4, v5, :cond_4

    .line 22
    .line 23
    iget-object p1, v2, Lu2/s;->r:Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, v2, Lu2/s;->j:Landroid/graphics/Rect;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    iget-object p1, v2, Lu2/s;->n:Landroid/graphics/Point;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget v1, p1, Landroid/graphics/Point;->x:I

    .line 41
    .line 42
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, p1}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_1
    if-eqz p2, :cond_3

    .line 48
    .line 49
    rem-int/lit8 p1, p2, 0x2

    .line 50
    .line 51
    if-ne p1, v5, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 54
    .line 55
    iget p1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 56
    .line 57
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 58
    .line 59
    rsub-int/lit8 p2, p2, 0x4

    .line 60
    .line 61
    invoke-static {v0, p1, p0, p2}, Lcom/android/launcher3/N5;->X(Landroid/graphics/Rect;III)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 66
    .line 67
    iget p1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 68
    .line 69
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 70
    .line 71
    rsub-int/lit8 p2, p2, 0x4

    .line 72
    .line 73
    invoke-static {v0, p1, p0, p2}, Lcom/android/launcher3/N5;->X(Landroid/graphics/Rect;III)V

    .line 74
    .line 75
    .line 76
    :cond_3
    :goto_2
    new-instance p0, Landroid/graphics/RectF;

    .line 77
    .line 78
    iget p1, v0, Landroid/graphics/Rect;->left:I

    .line 79
    .line 80
    int-to-float p1, p1

    .line 81
    iget p2, v0, Landroid/graphics/Rect;->top:I

    .line 82
    .line 83
    int-to-float p2, p2

    .line 84
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 85
    .line 86
    int-to-float v1, v1

    .line 87
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 88
    .line 89
    int-to-float v0, v0

    .line 90
    invoke-direct {p0, p1, p2, v1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 91
    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    new-instance p0, Landroid/graphics/RectF;

    .line 98
    .line 99
    iget p1, v0, Landroid/graphics/Rect;->left:I

    .line 100
    .line 101
    int-to-float p1, p1

    .line 102
    iget p2, v0, Landroid/graphics/Rect;->top:I

    .line 103
    .line 104
    int-to-float p2, p2

    .line 105
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 106
    .line 107
    int-to-float v1, v1

    .line 108
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 109
    .line 110
    int-to-float v0, v0

    .line 111
    invoke-direct {p0, p1, p2, v1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 112
    .line 113
    .line 114
    return-object p0
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    return-void
.end method

.method public r0([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v12, Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-direct {v12}, Landroid/graphics/Matrix;-><init>()V

    .line 6
    .line 7
    .line 8
    xor-int/lit8 v11, p4, 0x1

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/RemoteAnimationTargets;

    .line 11
    .line 12
    move-object/from16 v10, p1

    .line 13
    .line 14
    move-object/from16 v2, p2

    .line 15
    .line 16
    move-object/from16 v3, p3

    .line 17
    .line 18
    invoke-direct {v0, v10, v2, v3, v11}, Lcom/android/quickstep/RemoteAnimationTargets;-><init>([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;I)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 24
    .line 25
    invoke-direct {v2, v3}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v10}, Lcom/android/launcher3/q5;->w0([Landroid/view/RemoteAnimationTarget;)I

    .line 32
    .line 33
    .line 34
    move-result v15

    .line 35
    new-instance v14, Landroid/graphics/Point;

    .line 36
    .line 37
    invoke-direct {v14}, Landroid/graphics/Point;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v3, v1, Lcom/android/launcher3/q5;->o:Lcom/android/launcher3/h0;

    .line 41
    .line 42
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->O0:Z

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    move v13, v4

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 50
    .line 51
    invoke-static {v3}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    move v13, v3

    .line 56
    :goto_0
    const/high16 v3, 0x3f800000    # 1.0f

    .line 57
    .line 58
    const/4 v5, 0x2

    .line 59
    new-array v5, v5, [F

    .line 60
    .line 61
    fill-array-data v5, :array_0

    .line 62
    .line 63
    .line 64
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    if-eqz p4, :cond_1

    .line 69
    .line 70
    sget v6, Lcom/android/launcher3/anim/C;->Q:I

    .line 71
    .line 72
    :goto_1
    int-to-long v6, v6

    .line 73
    goto :goto_2

    .line 74
    :cond_1
    sget v6, Lcom/android/launcher3/anim/C;->T:I

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :goto_2
    sget-object v8, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 78
    .line 79
    invoke-virtual {v5, v8}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v5, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 83
    .line 84
    .line 85
    new-instance v8, Lcom/android/launcher3/q5$r;

    .line 86
    .line 87
    invoke-direct {v8, v1, v0}, Lcom/android/launcher3/q5$r;-><init>(Lcom/android/launcher3/q5;Lcom/android/quickstep/RemoteAnimationTargets;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5, v8}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 91
    .line 92
    .line 93
    if-eqz p4, :cond_2

    .line 94
    .line 95
    const v0, 0x3f59999a    # 0.85f

    .line 96
    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_2
    move v0, v3

    .line 100
    :goto_3
    if-eqz p4, :cond_3

    .line 101
    .line 102
    move v8, v3

    .line 103
    goto :goto_4

    .line 104
    :cond_3
    const v8, 0x3f547ae1    # 0.83f

    .line 105
    .line 106
    .line 107
    :goto_4
    move-wide/from16 v19, v6

    .line 108
    .line 109
    if-eqz p4, :cond_4

    .line 110
    .line 111
    move v6, v4

    .line 112
    move v7, v6

    .line 113
    :goto_5
    move-object v9, v5

    .line 114
    move-wide/from16 v4, v19

    .line 115
    .line 116
    goto :goto_6

    .line 117
    :cond_4
    move v7, v3

    .line 118
    move v6, v4

    .line 119
    goto :goto_5

    .line 120
    :goto_6
    if-eqz p4, :cond_5

    .line 121
    .line 122
    goto :goto_7

    .line 123
    :cond_5
    move v3, v6

    .line 124
    :goto_7
    sget-object v6, Lcom/android/launcher3/anim/L;->U:Landroid/view/animation/Interpolator;

    .line 125
    .line 126
    move-object/from16 v16, v2

    .line 127
    .line 128
    move v2, v0

    .line 129
    new-instance v0, Lcom/android/launcher3/q5$t;

    .line 130
    .line 131
    move-object/from16 v17, v9

    .line 132
    .line 133
    move-object v9, v6

    .line 134
    move/from16 v18, v8

    .line 135
    .line 136
    move v8, v3

    .line 137
    move/from16 v3, v18

    .line 138
    .line 139
    move-object/from16 v18, v17

    .line 140
    .line 141
    invoke-direct/range {v0 .. v16}, Lcom/android/launcher3/q5$t;-><init>(Lcom/android/launcher3/q5;FFJLandroid/view/animation/Interpolator;FFLandroid/view/animation/Interpolator;[Landroid/view/RemoteAnimationTarget;ILandroid/graphics/Matrix;FLandroid/graphics/Point;ILcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 142
    .line 143
    .line 144
    move-object/from16 v9, v18

    .line 145
    .line 146
    invoke-virtual {v9, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 147
    .line 148
    .line 149
    return-object v9

    .line 150
    nop

    .line 151
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public v0()Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "getRecentAnimRecord: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/q5;->L:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "QuickstepTransitionManager"

    .line 21
    .line 22
    invoke-static {v1, v0}, LM3/a;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/q5;->L:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 26
    .line 27
    return-object p0
.end method
