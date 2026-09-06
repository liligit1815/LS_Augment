.class public Lcom/android/launcher3/uioverrides/touchcontrollers/K;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TaskViewTouchControllerDeprecated.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;
.implements Lcom/android/launcher3/touch/H$d;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CONTAINER:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Lcom/android/launcher3/util/G2;",
        "Lcom/android/launcher3/touch/H$d;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final E:Landroid/os/VibrationEffect;

.field public static F:F

.field public static final G:F


# instance fields
.field private A:F

.field private B:Z

.field private C:F

.field private D:F

.field protected final g:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TCONTAINER;"
        }
    .end annotation
.end field

.field private final h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

.field private final i:Lcom/android/launcher3/touch/H;

.field private final j:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field

.field private final k:Landroid/graphics/Rect;

.field private final l:Z

.field private m:Lcom/android/launcher3/anim/q;

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:Z

.field private r:F

.field private s:F

.field private t:F

.field private u:Z

.field private v:Lcom/android/launcher3/util/s0;

.field private w:Ljava/lang/Float;

.field private x:Lcom/android/quickstep/views/TaskView;

.field private y:Z

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/VibrationConstants;->EFFECT_TEXTURE_TICK:Landroid/os/VibrationEffect;

    .line 2
    .line 3
    sput-object v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->E:Landroid/os/VibrationEffect;

    .line 4
    .line 5
    invoke-static {}, Lx1/O;->k3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const v0, 0x3e99999a    # 0.3f

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    :goto_0
    sput v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->G:F

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TCONTAINER;",
            "Lcom/android/launcher3/uioverrides/touchcontrollers/I;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

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
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->k:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/K$a;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/K;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->v:Lcom/android/launcher3/util/s0;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->y:Z

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->z:F

    .line 29
    .line 30
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->C:F

    .line 31
    .line 32
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 33
    .line 34
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 35
    .line 36
    move-object p2, p1

    .line 37
    check-cast p2, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 38
    .line 39
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 44
    .line 45
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-interface {p2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getUpDownSwipeDirection()Lcom/android/launcher3/touch/H$c;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    new-instance v0, Lcom/android/launcher3/touch/H;

    .line 66
    .line 67
    invoke-direct {v0, p1, p0, p2}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->i:Lcom/android/launcher3/touch/H;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const v1, 0x7f0706cf

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    int-to-float p2, p2

    .line 84
    const/high16 v1, 0x3f800000    # 1.0f

    .line 85
    .line 86
    mul-float/2addr p2, v1

    .line 87
    sget v1, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->G:F

    .line 88
    .line 89
    div-float/2addr p2, v1

    .line 90
    sput p2, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->F:F

    .line 91
    .line 92
    const p2, 0x3f4ccccd    # 0.8f

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, p2}, Lcom/android/launcher3/touch/H;->x(F)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const p2, 0x7f070a20

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->A:F

    .line 110
    .line 111
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/uioverrides/touchcontrollers/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    and-int/lit16 p1, p1, 0x100

    .line 6
    .line 7
    const-string v0, "TaskViewTouchControllerDeprecated"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 21
    .line 22
    .line 23
    :cond_0
    const-string p0, "Not intercepting edge swipe on nav bar."

    .line 24
    .line 25
    invoke-static {v0, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->m()V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 37
    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->g0:Z

    .line 49
    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 53
    .line 54
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 55
    .line 56
    const v0, 0x7d2afc96

    .line 57
    .line 58
    .line 59
    invoke-static {p1, v0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-eqz p1, :cond_5

    .line 64
    .line 65
    return v1

    .line 66
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 67
    .line 68
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 69
    .line 70
    const v2, 0x7ff8febf

    .line 71
    .line 72
    .line 73
    invoke-static {p1, v2}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-eqz p1, :cond_5

    .line 78
    .line 79
    const-string p0, "Not intercepting, open floating view blocking touch."

    .line 80
    .line 81
    invoke-static {v0, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return v1

    .line 85
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 86
    .line 87
    invoke-interface {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->isRecentsInteractive()Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    return p0
.end method

.method private c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->i:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->i:Lcom/android/launcher3/touch/H;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->y:Z

    .line 21
    .line 22
    return-void
.end method

.method private e(F)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 6
    .line 7
    .line 8
    iget-boolean v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->B:Z

    .line 9
    .line 10
    iget-object v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x0

    .line 21
    iput-object v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move/from16 v2, p1

    .line 25
    .line 26
    :goto_0
    iget-object v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const v4, 0x7f0706d3

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    neg-float v4, v3

    .line 40
    invoke-static {v2, v4, v3}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->d(F)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/4 v4, 0x0

    .line 49
    const/4 v5, 0x1

    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    iget-object v6, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->v:Lcom/android/launcher3/util/s0;

    .line 53
    .line 54
    invoke-virtual {v6}, Lcom/android/launcher3/util/s0;->b()Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_1

    .line 59
    .line 60
    move v6, v5

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move v6, v4

    .line 63
    :goto_1
    if-eqz v6, :cond_2

    .line 64
    .line 65
    move v3, v4

    .line 66
    :cond_2
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 67
    .line 68
    if-eqz v7, :cond_3

    .line 69
    .line 70
    iget v8, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->z:F

    .line 71
    .line 72
    sget v9, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->G:F

    .line 73
    .line 74
    mul-float/2addr v8, v9

    .line 75
    invoke-virtual {v7, v8}, Lcom/android/quickstep/views/RecentsView;->setVerticalDragProgress(F)V

    .line 76
    .line 77
    .line 78
    :cond_3
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 79
    .line 80
    invoke-virtual {v7}, Lcom/android/launcher3/anim/q;->q()F

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    new-instance v8, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v9, "onDragEndMFV: progress="

    .line 90
    .line 91
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v9, ",velocity="

    .line 98
    .line 99
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v9, ",goingUp="

    .line 106
    .line 107
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v9, ",blockedFling="

    .line 114
    .line 115
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    const-string v9, "TaskViewTouchControllerDeprecated"

    .line 126
    .line 127
    invoke-static {v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    if-eqz v3, :cond_5

    .line 131
    .line 132
    if-eqz v1, :cond_4

    .line 133
    .line 134
    iget-boolean v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->n:Z

    .line 135
    .line 136
    if-ne v1, v3, :cond_4

    .line 137
    .line 138
    :goto_2
    move v4, v5

    .line 139
    :cond_4
    move v10, v4

    .line 140
    goto :goto_3

    .line 141
    :cond_5
    if-eqz v1, :cond_4

    .line 142
    .line 143
    iget v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->D:F

    .line 144
    .line 145
    cmpl-float v3, v7, v3

    .line 146
    .line 147
    if-lez v3, :cond_4

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :goto_3
    const/high16 v3, 0x3f800000    # 1.0f

    .line 151
    .line 152
    if-eqz v10, :cond_6

    .line 153
    .line 154
    sub-float v7, v3, v7

    .line 155
    .line 156
    :cond_6
    invoke-static {v2, v7}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 157
    .line 158
    .line 159
    move-result-wide v7

    .line 160
    if-eqz v6, :cond_7

    .line 161
    .line 162
    if-nez v10, :cond_7

    .line 163
    .line 164
    invoke-static {v2}, Lcom/android/launcher3/G2;->a(F)I

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    int-to-long v11, v4

    .line 169
    mul-long/2addr v7, v11

    .line 170
    :cond_7
    move-wide v11, v7

    .line 171
    const-wide/16 v13, 0x12c

    .line 172
    .line 173
    const-wide/16 v15, 0x1c2

    .line 174
    .line 175
    invoke-static/range {v11 .. v16}, Lcom/android/launcher3/N5;->d(JJJ)J

    .line 176
    .line 177
    .line 178
    move-result-wide v13

    .line 179
    iget-object v4, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 180
    .line 181
    new-instance v6, Lcom/android/launcher3/uioverrides/touchcontrollers/J;

    .line 182
    .line 183
    invoke-direct {v6, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/J;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/K;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v4, v6}, Lcom/android/launcher3/anim/q;->v(Ljava/lang/Runnable;)V

    .line 187
    .line 188
    .line 189
    iget-object v8, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 190
    .line 191
    iget-object v9, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 192
    .line 193
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 194
    .line 195
    .line 196
    move-result v11

    .line 197
    iget v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->t:F

    .line 198
    .line 199
    invoke-virtual/range {v8 .. v14}, Lcom/android/launcher3/anim/q;->y(Landroid/content/Context;ZFFJ)V

    .line 200
    .line 201
    .line 202
    if-eqz v1, :cond_8

    .line 203
    .line 204
    if-eqz v10, :cond_8

    .line 205
    .line 206
    iget-boolean v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->y:Z

    .line 207
    .line 208
    if-nez v1, :cond_8

    .line 209
    .line 210
    sget-object v1, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 211
    .line 212
    iget-object v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 213
    .line 214
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    check-cast v1, Lcom/android/launcher3/util/V2;

    .line 219
    .line 220
    const/4 v2, 0x7

    .line 221
    sget-object v4, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->E:Landroid/os/VibrationEffect;

    .line 222
    .line 223
    invoke-virtual {v1, v2, v3, v4}, Lcom/android/launcher3/util/V2;->m(IFLandroid/os/VibrationEffect;)V

    .line 224
    .line 225
    .line 226
    iput-boolean v5, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->y:Z

    .line 227
    .line 228
    :cond_8
    iput-boolean v5, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 229
    .line 230
    return v5
.end method

.method private f(Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;FZ)Z
    .locals 5

    .line 1
    invoke-interface {p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

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
    cmpl-float v0, p2, v2

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    sget v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->F:F

    .line 14
    .line 15
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ne v0, v1, :cond_1

    .line 25
    .line 26
    cmpg-float v0, p2, v2

    .line 27
    .line 28
    if-gez v0, :cond_1

    .line 29
    .line 30
    sget v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->F:F

    .line 31
    .line 32
    neg-float v0, v0

    .line 33
    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-interface {p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getRotation()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v3, 0x3

    .line 43
    if-ne v0, v3, :cond_2

    .line 44
    .line 45
    cmpl-float v0, p2, v2

    .line 46
    .line 47
    if-lez v0, :cond_2

    .line 48
    .line 49
    sget v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->F:F

    .line 50
    .line 51
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    :cond_2
    :goto_0
    iput p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->z:F

    .line 56
    .line 57
    const/high16 v0, 0x3f800000    # 1.0f

    .line 58
    .line 59
    if-eqz p3, :cond_5

    .line 60
    .line 61
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 62
    .line 63
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->s:F

    .line 64
    .line 65
    mul-float/2addr v3, p2

    .line 66
    invoke-static {v3, v2, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 71
    .line 72
    .line 73
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 74
    .line 75
    invoke-virtual {p3}, Lcom/android/launcher3/anim/q;->q()F

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    const/high16 v0, 0x3f000000    # 0.5f

    .line 80
    .line 81
    cmpl-float p3, p3, v0

    .line 82
    .line 83
    if-lez p3, :cond_6

    .line 84
    .line 85
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 86
    .line 87
    invoke-virtual {p3}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    if-eqz p3, :cond_4

    .line 92
    .line 93
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 94
    .line 95
    invoke-virtual {p3}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p3}, Lcom/android/quickstep/views/RecentsView;->getFocusedTaskView()Lcom/android/quickstep/views/TaskView;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    if-eqz p3, :cond_3

    .line 107
    .line 108
    const p3, 0x7f070275

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    const p3, 0x7f070274

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_4
    const p3, 0x7f070273

    .line 117
    .line 118
    .line 119
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 120
    .line 121
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    neg-float v0, v0

    .line 130
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 135
    .line 136
    instance-of v0, p1, Lcom/android/quickstep/orientation/LandscapePagedViewHandler;

    .line 137
    .line 138
    if-eqz v0, :cond_6

    .line 139
    .line 140
    instance-of v0, p1, Lcom/android/quickstep/orientation/SeascapePagedViewHandler;

    .line 141
    .line 142
    if-nez v0, :cond_6

    .line 143
    .line 144
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 145
    .line 146
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    iput-object p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_5
    iget-object p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 162
    .line 163
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->s:F

    .line 164
    .line 165
    mul-float/2addr v3, p2

    .line 166
    sget v4, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->G:F

    .line 167
    .line 168
    mul-float/2addr v3, v4

    .line 169
    invoke-static {v3, v2, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 174
    .line 175
    .line 176
    :cond_6
    :goto_2
    iget p3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->C:F

    .line 177
    .line 178
    sub-float p3, p2, p3

    .line 179
    .line 180
    cmpl-float v0, p3, v2

    .line 181
    .line 182
    if-eqz v0, :cond_7

    .line 183
    .line 184
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    .line 185
    .line 186
    invoke-interface {p1, p3, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->B:Z

    .line 191
    .line 192
    :cond_7
    iput p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->C:F

    .line 193
    .line 194
    return v1
.end method

.method private g(Z)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->n:Z

    .line 6
    .line 7
    if-ne v1, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->o:Z

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    :cond_1
    if-nez p1, :cond_3

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->p:Z

    .line 19
    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void

    .line 23
    :cond_3
    if-eqz v0, :cond_4

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->n:Z

    .line 50
    .line 51
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 52
    .line 53
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 54
    .line 55
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 60
    .line 61
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 62
    .line 63
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-interface {v0, v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryDimension(Landroid/view/View;Lcom/android/launcher3/h0;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    mul-int/lit8 v1, v1, 0x2

    .line 72
    .line 73
    int-to-long v7, v1

    .line 74
    iget-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    .line 75
    .line 76
    invoke-interface {v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getTaskDragDisplacementFactor(Z)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 81
    .line 82
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 83
    .line 84
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 85
    .line 86
    invoke-interface {v3}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-interface {v0, v2, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryDimension(Landroid/view/View;Lcom/android/launcher3/h0;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz p1, :cond_5

    .line 95
    .line 96
    sget-object v12, Lcom/android/launcher3/anim/L;->E:Landroid/view/animation/Interpolator;

    .line 97
    .line 98
    new-instance v3, Lcom/android/launcher3/anim/V;

    .line 99
    .line 100
    invoke-direct {v3, v7, v8}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 104
    .line 105
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 106
    .line 107
    const/4 v9, 0x0

    .line 108
    const/4 v10, 0x0

    .line 109
    const/4 v5, 0x1

    .line 110
    const/4 v6, 0x1

    .line 111
    move v11, p1

    .line 112
    invoke-virtual/range {v2 .. v11}, Lcom/android/quickstep/views/RecentsView;->createTaskDismissAnimation(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/views/TaskView;ZZJZZZ)V

    .line 113
    .line 114
    .line 115
    neg-int p1, v0

    .line 116
    int-to-float p1, p1

    .line 117
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->t:F

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    move v11, p1

    .line 121
    sget-object v12, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 122
    .line 123
    new-instance v3, Lcom/android/launcher3/anim/V;

    .line 124
    .line 125
    invoke-direct {v3, v7, v8}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 126
    .line 127
    .line 128
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 129
    .line 130
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 131
    .line 132
    const/4 v9, 0x0

    .line 133
    const/4 v10, 0x0

    .line 134
    const/4 v5, 0x1

    .line 135
    const/4 v6, 0x0

    .line 136
    invoke-virtual/range {v2 .. v11}, Lcom/android/quickstep/views/RecentsView;->createTaskDismissAnimation(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/views/TaskView;ZZJZZZ)V

    .line 137
    .line 138
    .line 139
    sget p1, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->F:F

    .line 140
    .line 141
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->t:F

    .line 142
    .line 143
    :goto_1
    iget p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->t:F

    .line 144
    .line 145
    int-to-float v0, v1

    .line 146
    mul-float/2addr p1, v0

    .line 147
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->t:F

    .line 148
    .line 149
    invoke-virtual {v3}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p1, v12}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 163
    .line 164
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 165
    .line 166
    invoke-interface {p1, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->onUserControlledAnimationCreated(Lcom/android/launcher3/anim/q;)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 179
    .line 180
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 181
    .line 182
    .line 183
    const/high16 p1, 0x3f800000    # 1.0f

    .line 184
    .line 185
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->t:F

    .line 186
    .line 187
    div-float/2addr p1, v0

    .line 188
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->s:F

    .line 189
    .line 190
    return-void
.end method


# virtual methods
.method public d(F)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->A:F

    .line 6
    .line 7
    cmpl-float p0, p1, p0

    .line 8
    .line 9
    if-lez p0, :cond_0

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

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->c()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v3, "Not intercepting touch."

    .line 27
    .line 28
    const-string v4, "TaskViewTouchControllerDeprecated"

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    if-nez v0, :cond_d

    .line 32
    .line 33
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->b(Landroid/view/MotionEvent;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    xor-int/lit8 v6, v0, 0x1

    .line 38
    .line 39
    iput-boolean v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->q:Z

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    invoke-static {v4, v3}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return v5

    .line 47
    :cond_2
    const/4 v0, 0x0

    .line 48
    move-object v7, v0

    .line 49
    move v6, v5

    .line 50
    :goto_0
    iget-object v8, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 51
    .line 52
    invoke-virtual {v8}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    if-ge v6, v8, :cond_5

    .line 57
    .line 58
    iget-object v8, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 59
    .line 60
    invoke-virtual {v8, v6}, Lcom/android/quickstep/views/RecentsView;->getTaskViewAt(I)Lcom/android/quickstep/views/TaskView;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    if-eqz v8, :cond_3

    .line 65
    .line 66
    iget-object v9, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 67
    .line 68
    invoke-virtual {v9, v8}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    if-eqz v9, :cond_3

    .line 73
    .line 74
    iget-object v9, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 75
    .line 76
    check-cast v9, Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    invoke-interface {v9}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 79
    .line 80
    .line 81
    move-result-object v9

    .line 82
    invoke-virtual {v9, v8, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    if-eqz v9, :cond_3

    .line 87
    .line 88
    move-object v7, v8

    .line 89
    goto :goto_1

    .line 90
    :cond_3
    if-nez v8, :cond_4

    .line 91
    .line 92
    new-instance v8, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v9, "onControllerInterceptTouchEvent,  view is null! i=="

    .line 98
    .line 99
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    invoke-static {v4, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    :cond_4
    :goto_1
    add-int/lit8 v6, v6, 0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    iget-object v8, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v8}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v9

    if-eqz v9, :ls_stack_candidate_done

    iget-object v9, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    check-cast v9, Lcom/android/launcher3/views/k;

    invoke-interface {v9}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    move-result-object v9

    invoke-static {v8, v9, p1}, Lcom/android/quickstep/views/LsNativeStack;->findTouchedTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/launcher3/views/BaseDragLayer;Landroid/view/MotionEvent;)Lcom/android/quickstep/views/TaskView;

    move-result-object v7

    :ls_stack_candidate_done
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 116
    .line 117
    if-eqz v6, :cond_6

    .line 118
    .line 119
    iget-object v8, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 120
    .line 121
    if-ne v7, v8, :cond_6

    .line 122
    .line 123
    goto/16 :goto_5

    .line 124
    .line 125
    :cond_6
    if-eqz v6, :cond_7

    .line 126
    .line 127
    const-string v6, "Swiping on a new task"

    .line 128
    .line 129
    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 133
    .line 134
    invoke-virtual {v6}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->end()V

    .line 139
    .line 140
    .line 141
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->c()V

    .line 142
    .line 143
    .line 144
    :cond_7
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->isNativeStackStyle()Z

    move-result v8

    if-eqz v8, :ls_native_task_scan

    if-eqz v7, :cond_b

    iget-object v8, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    invoke-interface {v8}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->isRecentsModal()Z

    move-result v8

    if-nez v8, :cond_b

    iput-object v7, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v0

    iget-boolean v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    invoke-interface {v0, v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getUpDirection(Z)I

    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->o:Z

    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->p:Z

    const v0, 0x3ecccccd    # 0.4f

    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->D:F

    goto :goto_4

    :ls_native_task_scan

    .line 145
    .line 146
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 147
    .line 148
    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;->iterator()Ljava/util/Iterator;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    :cond_8
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    if-eqz v7, :cond_b

    .line 161
    .line 162
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v7

    .line 166
    check-cast v7, Lcom/android/quickstep/views/TaskView;

    .line 167
    .line 168
    if-eqz v7, :cond_8

    .line 169
    .line 170
    iget-object v8, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 171
    .line 172
    invoke-virtual {v8, v7}, Lcom/android/quickstep/views/RecentsView;->isTaskViewVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    if-eqz v8, :cond_8

    .line 177
    .line 178
    iget-object v8, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 179
    .line 180
    check-cast v8, Lcom/android/launcher3/views/k;

    .line 181
    .line 182
    invoke-interface {v8}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    invoke-virtual {v8, v7, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 187
    .line 188
    .line 189
    move-result v8

    .line 190
    if-eqz v8, :cond_8

    .line 191
    .line 192
    iget-object v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->h:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 193
    .line 194
    invoke-interface {v6}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->isRecentsModal()Z

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    if-eqz v6, :cond_9

    .line 199
    .line 200
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_9
    iput-object v7, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 204
    .line 205
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 206
    .line 207
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget-boolean v6, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    .line 212
    .line 213
    invoke-interface {v0, v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getUpDirection(Z)I

    .line 214
    .line 215
    .line 216
    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->o:Z

    .line 217
    .line 218
    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->p:Z

    .line 219
    .line 220
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 221
    .line 222
    invoke-virtual {v0, v7}, Lcom/android/quickstep/views/RecentsView;->isOnGridBottomRow(Lcom/android/quickstep/views/TaskView;)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_a

    .line 227
    .line 228
    const v0, 0x3e4ccccd    # 0.2f

    .line 229
    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_a
    const v0, 0x3ecccccd    # 0.4f

    .line 233
    .line 234
    .line 235
    :goto_2
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->D:F

    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_b
    :goto_3
    move v1, v5

    .line 239
    :goto_4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 240
    .line 241
    if-nez v0, :cond_c

    .line 242
    .line 243
    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->q:Z

    .line 244
    .line 245
    const-string p0, "Not intercepting touch, no task to drag."

    .line 246
    .line 247
    invoke-static {v4, p0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    return v5

    .line 251
    :cond_c
    move v2, v5

    .line 252
    :goto_5
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->i:Lcom/android/launcher3/touch/H;

    .line 253
    .line 254
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 255
    .line 256
    .line 257
    :cond_d
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->q:Z

    .line 258
    .line 259
    if-eqz v0, :cond_e

    .line 260
    .line 261
    invoke-static {v4, v3}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    return v5

    .line 265
    :cond_e
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 266
    .line 267
    .line 268
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->i:Lcom/android/launcher3/touch/H;

    .line 269
    .line 270
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->i:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onDrag(F)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->r:F

    .line 14
    .line 15
    add-float/2addr p1, v2

    .line 16
    const/4 v2, 0x0

    .line 17
    cmpl-float v3, p1, v2

    .line 18
    .line 19
    if-nez v3, :cond_1

    .line 20
    .line 21
    iget-boolean v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->n:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-boolean v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    .line 25
    .line 26
    invoke-interface {v0, p1, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    :goto_0
    iget-boolean v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->n:Z

    .line 31
    .line 32
    if-eq v3, v4, :cond_2

    .line 33
    .line 34
    invoke-direct {p0, v3}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->v:Lcom/android/launcher3/util/s0;

    .line 38
    .line 39
    invoke-virtual {v4}, Lcom/android/launcher3/util/s0;->a()V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->v:Lcom/android/launcher3/util/s0;

    .line 44
    .line 45
    invoke-virtual {v4}, Lcom/android/launcher3/util/s0;->c()V

    .line 46
    .line 47
    .line 48
    :goto_1
    invoke-direct {p0, v0, p1, v3}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->f(Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;FZ)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    return v1

    .line 55
    :cond_3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 56
    .line 57
    if-eqz v3, :cond_7

    .line 58
    .line 59
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/android/launcher3/anim/q;->q()F

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    const/high16 v4, 0x3f000000    # 0.5f

    .line 66
    .line 67
    cmpg-float v3, v3, v4

    .line 68
    .line 69
    if-gez v3, :cond_4

    .line 70
    .line 71
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 72
    .line 73
    iget p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->s:F

    .line 74
    .line 75
    mul-float/2addr p1, p0

    .line 76
    const/high16 p0, 0x40000000    # 2.0f

    .line 77
    .line 78
    div-float/2addr p1, p0

    .line 79
    invoke-static {p1, v2, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-virtual {v3, p0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 84
    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_6

    .line 94
    .line 95
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    const p1, 0x7f070275

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    const p1, 0x7f070274

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_6
    const p1, 0x7f070272

    .line 112
    .line 113
    .line 114
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    neg-float p1, p1

    .line 125
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 130
    .line 131
    const/4 p1, 0x0

    .line 132
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_7
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 136
    .line 137
    iget p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->s:F

    .line 138
    .line 139
    mul-float/2addr p1, p0

    .line 140
    invoke-static {p1, v2, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    invoke-virtual {v3, p0}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 145
    .line 146
    .line 147
    :goto_3
    return v1
.end method

.method public onDragEnd(F)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct/range {p0 .. p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->e(F)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    iput-object v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move/from16 v1, p1

    .line 23
    .line 24
    :goto_0
    iget-object v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->x:Lcom/android/quickstep/views/TaskView;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const v3, 0x7f0706d2

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    neg-float v3, v2

    .line 38
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-boolean v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    const/4 v4, 0x1

    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->i:Lcom/android/launcher3/touch/H;

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    move v2, v4

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move v2, v3

    .line 59
    :goto_1
    if-eqz v2, :cond_3

    .line 60
    .line 61
    iget-object v5, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->v:Lcom/android/launcher3/util/s0;

    .line 62
    .line 63
    invoke-virtual {v5}, Lcom/android/launcher3/util/s0;->b()Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-eqz v5, :cond_3

    .line 68
    .line 69
    move v5, v4

    .line 70
    goto :goto_2

    .line 71
    :cond_3
    move v5, v3

    .line 72
    :goto_2
    if-eqz v5, :cond_4

    .line 73
    .line 74
    move v2, v3

    .line 75
    :cond_4
    iget-object v6, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 76
    .line 77
    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    iget-boolean v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    .line 82
    .line 83
    invoke-interface {v6, v1, v7}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    iget-object v7, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 88
    .line 89
    invoke-virtual {v7}, Lcom/android/launcher3/anim/q;->q()F

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    iget-object v8, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 94
    .line 95
    invoke-virtual {v8}, Lcom/android/launcher3/anim/q;->o()F

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    if-eqz v2, :cond_6

    .line 100
    .line 101
    iget-boolean v2, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->n:Z

    .line 102
    .line 103
    if-ne v6, v2, :cond_5

    .line 104
    .line 105
    :goto_3
    move v3, v4

    .line 106
    :cond_5
    move v10, v3

    .line 107
    goto :goto_4

    .line 108
    :cond_6
    const/high16 v2, 0x3f000000    # 0.5f

    .line 109
    .line 110
    cmpl-float v2, v8, v2

    .line 111
    .line 112
    if-lez v2, :cond_5

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :goto_4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 116
    .line 117
    if-eqz v10, :cond_7

    .line 118
    .line 119
    sub-float v7, v2, v7

    .line 120
    .line 121
    :cond_7
    invoke-static {v1, v7}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 122
    .line 123
    .line 124
    move-result-wide v7

    .line 125
    if-eqz v5, :cond_8

    .line 126
    .line 127
    if-nez v10, :cond_8

    .line 128
    .line 129
    invoke-static {v1}, Lcom/android/launcher3/G2;->a(F)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    int-to-long v11, v3

    .line 134
    mul-long/2addr v7, v11

    .line 135
    :cond_8
    move-wide v11, v7

    .line 136
    const-wide/16 v13, 0x12c

    .line 137
    .line 138
    const-wide/16 v15, 0x258

    .line 139
    .line 140
    invoke-static/range {v11 .. v16}, Lcom/android/launcher3/N5;->d(JJJ)J

    .line 141
    .line 142
    .line 143
    move-result-wide v13

    .line 144
    iget-object v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 145
    .line 146
    new-instance v5, Lcom/android/launcher3/uioverrides/touchcontrollers/J;

    .line 147
    .line 148
    invoke-direct {v5, v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/J;-><init>(Lcom/android/launcher3/uioverrides/touchcontrollers/K;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v3, v5}, Lcom/android/launcher3/anim/q;->v(Ljava/lang/Runnable;)V

    .line 152
    .line 153
    .line 154
    iget-object v8, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 155
    .line 156
    iget-object v9, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 157
    .line 158
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 159
    .line 160
    .line 161
    move-result v11

    .line 162
    iget v12, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->t:F

    .line 163
    .line 164
    invoke-virtual/range {v8 .. v14}, Lcom/android/launcher3/anim/q;->y(Landroid/content/Context;ZFFJ)V

    .line 165
    .line 166
    .line 167
    if-eqz v6, :cond_9

    .line 168
    .line 169
    if-eqz v10, :cond_9

    .line 170
    .line 171
    iget-boolean v1, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->y:Z

    .line 172
    .line 173
    if-nez v1, :cond_9

    .line 174
    .line 175
    sget-object v1, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 176
    .line 177
    iget-object v3, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g:Landroid/content/Context;

    .line 178
    .line 179
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    check-cast v1, Lcom/android/launcher3/util/V2;

    .line 184
    .line 185
    const/4 v3, 0x7

    .line 186
    sget-object v5, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->E:Landroid/os/VibrationEffect;

    .line 187
    .line 188
    invoke-virtual {v1, v3, v2, v5}, Lcom/android/launcher3/util/V2;->m(IFLandroid/os/VibrationEffect;)V

    .line 189
    .line 190
    .line 191
    iput-boolean v4, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->y:Z

    .line 192
    .line 193
    :cond_9
    iput-boolean v4, v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 194
    .line 195
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->u:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p1, "TaskViewTouchControllerDeprecated"

    .line 7
    .line 8
    const-string v0, "Handling touch."

    .line 9
    .line 10
    invoke-static {p1, v0}, Lcom/android/launcher3/N5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->l:Z

    .line 24
    .line 25
    invoke-interface {p1, p2, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isGoingUp(FZ)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->g(Z)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->r:F

    .line 34
    .line 35
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->z:F

    .line 36
    .line 37
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->j:Lcom/android/quickstep/views/RecentsView;

    .line 38
    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    invoke-virtual {p2, p1}, Lcom/android/quickstep/views/RecentsView;->setVerticalDragProgress(F)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->q()F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    iget p2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->s:F

    .line 50
    .line 51
    div-float/2addr p1, p2

    .line 52
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->r:F

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->m:Lcom/android/launcher3/anim/q;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->u()V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->v:Lcom/android/launcher3/util/s0;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/util/s0;->d()V

    .line 62
    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;->w:Ljava/lang/Float;

    .line 66
    .line 67
    return-void
.end method
