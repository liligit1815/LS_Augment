.class public Lcom/android/launcher3/taskbar/TaskbarOverflowView;
.super Landroid/widget/FrameLayout;
.source "TaskbarOverflowView.java"

# interfaces
.implements Lcom/android/launcher3/G5;


# static fields
.field private static final C:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;"
        }
    .end annotation
.end field

.field private static final D:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;"
        }
    .end annotation
.end field

.field private static final E:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;"
        }
    .end annotation
.end field

.field private static final F:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;"
        }
    .end annotation
.end field

.field private static final G:Landroid/util/IntProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/IntProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;"
        }
    .end annotation
.end field

.field private static final H:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:F

.field private B:F

.field private g:Z

.field private final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;"
        }
    .end annotation
.end field

.field private i:I

.field private j:Landroid/graphics/Paint;

.field private final k:Lcom/android/launcher3/util/z1;

.field private l:F

.field private m:I

.field private n:I

.field private o:Z

.field private p:Landroid/animation/ValueAnimator;

.field private q:F

.field private r:F

.field private s:I

.field private t:F

.field private u:F

.field private v:F

.field private w:F

.field private x:F

.field private y:I

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$a;

    .line 2
    .line 3
    const-string v1, "itemIconCenterOffset"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->C:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$b;

    .line 11
    .line 12
    const-string v1, "itemIconColorFilterOpacity"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$b;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->D:Landroid/util/IntProperty;

    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$c;

    .line 20
    .line 21
    const-string v1, "itemIconSize"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$c;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->E:Landroid/util/FloatProperty;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$d;

    .line 29
    .line 30
    const-string v1, "itemIconStrokeWidth"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$d;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->F:Landroid/util/FloatProperty;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$e;

    .line 38
    .line 39
    const-string v1, "leaveBehindOpacity"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$e;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->G:Landroid/util/IntProperty;

    .line 45
    .line 46
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView$f;

    .line 47
    .line 48
    const-string v1, "leaveBehindSize"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$f;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->H:Landroid/util/FloatProperty;

    .line 54
    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Lcom/android/launcher3/util/z1;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/z1;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->k:Lcom/android/launcher3/util/z1;

    .line 17
    .line 18
    const/high16 p1, 0x3f800000    # 1.0f

    .line 19
    .line 20
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->l:F

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->x()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/android/systemui/shared/recents/model/Task;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->r:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->s:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->v:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->x:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->y:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->B:F

    .line 2
    .line 3
    return p0
.end method

.method private getStateTransitionAnimation()Landroid/animation/AnimatorSet;
    .locals 15

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 9
    .line 10
    .line 11
    sget-object v3, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->C:Landroid/util/FloatProperty;

    .line 12
    .line 13
    iget v5, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->q:F

    .line 14
    .line 15
    const-wide/16 v8, 0x0

    .line 16
    .line 17
    const-wide/16 v10, 0x1f4

    .line 18
    .line 19
    const/4 v4, 0x0

    .line 20
    const-wide/16 v6, 0x1f4

    .line 21
    .line 22
    move-object v2, p0

    .line 23
    invoke-direct/range {v2 .. v11}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p(Landroid/util/FloatProperty;FFJJJ)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    move-object v1, v2

    .line 28
    sget-object v2, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->D:Landroid/util/IntProperty;

    .line 29
    .line 30
    const-wide/16 v7, 0x0

    .line 31
    .line 32
    const-wide/16 v9, 0x190

    .line 33
    .line 34
    const/16 v3, 0xff

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    const-wide/16 v5, 0x258

    .line 38
    .line 39
    invoke-direct/range {v1 .. v10}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->q(Landroid/util/IntProperty;IIJJJ)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v11

    .line 43
    sget-object v2, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->E:Landroid/util/FloatProperty;

    .line 44
    .line 45
    iget v3, v1, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->u:F

    .line 46
    .line 47
    iget v4, v1, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->t:F

    .line 48
    .line 49
    const-wide/16 v9, 0x1f4

    .line 50
    .line 51
    const-wide/16 v5, 0x1f4

    .line 52
    .line 53
    invoke-direct/range {v1 .. v10}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p(Landroid/util/FloatProperty;FFJJJ)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object v12

    .line 57
    sget-object v2, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->F:Landroid/util/FloatProperty;

    .line 58
    .line 59
    iget v4, v1, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->w:F

    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    invoke-direct/range {v1 .. v10}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p(Landroid/util/FloatProperty;FFJJJ)Landroid/animation/ObjectAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v13

    .line 66
    sget-object v2, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->G:Landroid/util/IntProperty;

    .line 67
    .line 68
    const-wide/16 v7, 0x1f4

    .line 69
    .line 70
    const-wide/16 v9, 0x190

    .line 71
    .line 72
    const/16 v3, 0xff

    .line 73
    .line 74
    const/4 v4, 0x0

    .line 75
    const-wide/16 v5, 0x64

    .line 76
    .line 77
    invoke-direct/range {v1 .. v10}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->q(Landroid/util/IntProperty;IIJJJ)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v14

    .line 81
    sget-object v2, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->H:Landroid/util/FloatProperty;

    .line 82
    .line 83
    iget v3, v1, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->A:F

    .line 84
    .line 85
    iget v4, v1, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->z:F

    .line 86
    .line 87
    const-wide/16 v9, 0x0

    .line 88
    .line 89
    const-wide/16 v5, 0x1f4

    .line 90
    .line 91
    invoke-direct/range {v1 .. v10}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p(Landroid/util/FloatProperty;FFJJJ)Landroid/animation/ObjectAnimator;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const/4 v2, 0x6

    .line 96
    new-array v2, v2, [Landroid/animation/Animator;

    .line 97
    .line 98
    const/4 v3, 0x0

    .line 99
    aput-object p0, v2, v3

    .line 100
    .line 101
    const/4 p0, 0x1

    .line 102
    aput-object v11, v2, p0

    .line 103
    .line 104
    const/4 p0, 0x2

    .line 105
    aput-object v12, v2, p0

    .line 106
    .line 107
    const/4 p0, 0x3

    .line 108
    aput-object v13, v2, p0

    .line 109
    .line 110
    const/4 p0, 0x4

    .line 111
    aput-object v14, v2, p0

    .line 112
    .line 113
    const/4 p0, 0x5

    .line 114
    aput-object v1, v2, p0

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 117
    .line 118
    .line 119
    return-object v0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/taskbar/TaskbarOverflowView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->r:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/taskbar/TaskbarOverflowView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->s:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic j(Lcom/android/launcher3/taskbar/TaskbarOverflowView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->v:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/launcher3/taskbar/TaskbarOverflowView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->x:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/launcher3/taskbar/TaskbarOverflowView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->y:I

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic m(Lcom/android/launcher3/taskbar/TaskbarOverflowView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->B:F

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic n(Lcom/android/launcher3/taskbar/TaskbarOverflowView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method private o(Landroid/animation/ObjectAnimator;JJJ)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-wide p4, p6

    .line 10
    :goto_0
    invoke-virtual {p1, p4, p5}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private p(Landroid/util/FloatProperty;FFJJJ)Landroid/animation/ObjectAnimator;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;FFJJJ)",
            "Landroid/animation/ObjectAnimator;"
        }
    .end annotation

    .line 1
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    move v1, p2

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v1, p3

    .line 8
    :goto_0
    const/4 v2, 0x1

    .line 9
    new-array v2, v2, [F

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    aput v1, v2, v3

    .line 13
    .line 14
    invoke-static {p0, p1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    move-object v0, p0

    .line 19
    move-wide v2, p4

    .line 20
    move-wide v4, p6

    .line 21
    move-wide/from16 v6, p8

    .line 22
    .line 23
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o(Landroid/animation/ObjectAnimator;JJJ)V

    .line 24
    .line 25
    .line 26
    return-object v1
.end method

.method private q(Landroid/util/IntProperty;IIJJJ)Landroid/animation/ObjectAnimator;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/IntProperty<",
            "Lcom/android/launcher3/taskbar/TaskbarOverflowView;",
            ">;IIJJJ)",
            "Landroid/animation/ObjectAnimator;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move p2, p3

    .line 7
    :goto_0
    filled-new-array {p2}, [I

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p0, p1, p2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    move-object v0, p0

    .line 16
    move-wide v2, p4

    .line 17
    move-wide v4, p6

    .line 18
    move-wide/from16 v6, p8

    .line 19
    .line 20
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o(Landroid/animation/ObjectAnimator;JJJ)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method

.method private s(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->j:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->m:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->i:I

    .line 9
    .line 10
    int-to-float v0, v0

    .line 11
    const/high16 v1, 0x40000000    # 2.0f

    .line 12
    .line 13
    div-float/2addr v0, v1

    .line 14
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->v:F

    .line 15
    .line 16
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-float v3, v2

    .line 21
    div-float/2addr v3, v1

    .line 22
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v4, 0x4

    .line 29
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/lit8 v4, v1, -0x1

    .line 34
    .line 35
    :goto_0
    if-ltz v4, :cond_1

    .line 36
    .line 37
    iget-object v5, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    sub-int/2addr v6, v4

    .line 44
    add-int/lit8 v6, v6, -0x1

    .line 45
    .line 46
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Lcom/android/systemui/shared/recents/model/Task;

    .line 51
    .line 52
    iget-object v5, v5, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    if-nez v5, :cond_0

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    iget v6, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->r:F

    .line 58
    .line 59
    iget-boolean v7, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->g:Z

    .line 60
    .line 61
    invoke-direct {p0, v6, v7, v4, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->u(FZII)F

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    iget v7, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->r:F

    .line 66
    .line 67
    invoke-direct {p0, v7, v4, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->v(FII)F

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    const/4 v8, 0x0

    .line 84
    invoke-virtual {v5, v8, v8, v2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 85
    .line 86
    .line 87
    new-instance v8, Landroid/graphics/BlendModeColorFilter;

    .line 88
    .line 89
    iget v9, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->n:I

    .line 90
    .line 91
    iget v10, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->s:I

    .line 92
    .line 93
    invoke-static {v9, v10}, LB/a;->r(II)I

    .line 94
    .line 95
    .line 96
    move-result v9

    .line 97
    sget-object v10, Landroid/graphics/BlendMode;->SRC_ATOP:Landroid/graphics/BlendMode;

    .line 98
    .line 99
    invoke-direct {v8, v9, v10}, Landroid/graphics/BlendModeColorFilter;-><init>(ILandroid/graphics/BlendMode;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v5, v8}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 106
    .line 107
    .line 108
    add-float/2addr v6, v0

    .line 109
    sub-float/2addr v6, v3

    .line 110
    add-float/2addr v7, v0

    .line 111
    sub-float/2addr v7, v3

    .line 112
    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 113
    .line 114
    .line 115
    const v6, 0x3f6b851f    # 0.92f

    .line 116
    .line 117
    .line 118
    mul-float/2addr v6, v3

    .line 119
    iget v7, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->x:F

    .line 120
    .line 121
    add-float/2addr v6, v7

    .line 122
    iget-object v7, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->j:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {p1, v3, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 131
    .line 132
    .line 133
    :goto_1
    add-int/lit8 v4, v4, -0x1

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_1
    return-void
.end method

.method private t(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->j:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->n:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->y:I

    .line 6
    .line 7
    invoke-static {v1, v2}, LB/a;->r(II)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->i:I

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    const/high16 v1, 0x40000000    # 2.0f

    .line 18
    .line 19
    div-float/2addr v0, v1

    .line 20
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->B:F

    .line 21
    .line 22
    div-float/2addr v2, v1

    .line 23
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->j:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {p1, v0, v0, v2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private u(FZII)F
    .locals 1

    .line 1
    const/4 p0, -0x1

    .line 2
    const/4 v0, 0x1

    .line 3
    if-ne p3, v0, :cond_2

    .line 4
    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    :cond_0
    :goto_0
    move p0, v0

    .line 8
    :cond_1
    :goto_1
    int-to-float p0, p0

    .line 9
    mul-float/2addr p0, p1

    .line 10
    return p0

    .line 11
    :cond_2
    if-nez p3, :cond_4

    .line 12
    .line 13
    const/4 p3, 0x3

    .line 14
    if-ne p4, p3, :cond_3

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_3
    if-eqz p2, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_4
    sub-int/2addr p4, v0

    .line 22
    if-ne p3, p4, :cond_5

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_5
    if-eqz p2, :cond_1

    .line 28
    .line 29
    goto :goto_0
.end method

.method private v(FII)F
    .locals 1

    .line 1
    const/4 p0, 0x2

    .line 2
    if-ne p3, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    add-int/2addr p2, v0

    .line 8
    div-int/2addr p3, p0

    .line 9
    if-gt p2, p3, :cond_1

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    :cond_1
    int-to-float p0, v0

    .line 13
    mul-float/2addr p0, p1

    .line 14
    return p0
.end method

.method public static w(ILandroid/view/ViewGroup;II)Lcom/android/launcher3/taskbar/TaskbarOverflowView;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 15
    .line 16
    iput p2, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->i:I

    .line 17
    .line 18
    int-to-float p1, p2

    .line 19
    int-to-float p2, p3

    .line 20
    const/high16 p3, 0x40000000    # 2.0f

    .line 21
    .line 22
    mul-float/2addr p2, p3

    .line 23
    sub-float/2addr p1, p2

    .line 24
    const p2, 0x3f6b851f    # 0.92f

    .line 25
    .line 26
    .line 27
    mul-float/2addr p1, p2

    .line 28
    div-float/2addr p1, p3

    .line 29
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->A:F

    .line 30
    .line 31
    const v0, 0x3f547ae1    # 0.83f

    .line 32
    .line 33
    .line 34
    mul-float/2addr v0, p1

    .line 35
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->z:F

    .line 36
    .line 37
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->B:F

    .line 38
    .line 39
    const/high16 v1, 0x41200000    # 10.0f

    .line 40
    .line 41
    div-float v1, p1, v1

    .line 42
    .line 43
    iput v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->w:F

    .line 44
    .line 45
    iput v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->x:F

    .line 46
    .line 47
    mul-float v2, p1, p3

    .line 48
    .line 49
    const v3, 0x3f1c28f6    # 0.61f

    .line 50
    .line 51
    .line 52
    mul-float/2addr v2, v3

    .line 53
    iput v2, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->t:F

    .line 54
    .line 55
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->u:F

    .line 56
    .line 57
    iput v2, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->v:F

    .line 58
    .line 59
    mul-float/2addr v2, p2

    .line 60
    div-float/2addr v2, p3

    .line 61
    sub-float/2addr p1, v2

    .line 62
    sub-float/2addr p1, v1

    .line 63
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->q:F

    .line 64
    .line 65
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->r:F

    .line 66
    .line 67
    return-object p0
.end method

.method private x()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->g:Z

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Paint;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->j:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const v1, 0x10602a6

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->m:I

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const v1, 0x1010212

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->n:I

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public getIsActive()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public getItemIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/android/launcher3/taskbar/m3;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/m3;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getReorderBounceScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public getTranslateDelegate()Lcom/android/launcher3/util/z1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->k:Lcom/android/launcher3/util/z1;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->s(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->t(Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIsActive(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->reverse()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->getStateTransitionAnimation()Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x2

    .line 29
    new-array v0, v0, [F

    .line 30
    .line 31
    fill-array-data v0, :array_0

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    const-wide/16 v1, 0x12c

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const-wide/16 v1, 0x1f4

    .line 48
    .line 49
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->o:Z

    .line 55
    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    sget-object v1, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    sget-object v1, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    :goto_1
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    new-instance v1, Lcom/android/launcher3/taskbar/TaskbarOverflowView$g;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$g;-><init>(Lcom/android/launcher3/taskbar/TaskbarOverflowView;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    new-instance v1, Lcom/android/launcher3/taskbar/TaskbarOverflowView$h;

    .line 79
    .line 80
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView$h;-><init>(Lcom/android/launcher3/taskbar/TaskbarOverflowView;Landroid/animation/AnimatorSet;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->p:Landroid/animation/ValueAnimator;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    nop

    .line 93
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public setItems(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setReorderBounceScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->l:F

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y(Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/systemui/shared/recents/model/Task;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 19
    .line 20
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 21
    .line 22
    iget-object v2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 23
    .line 24
    iget v2, v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 25
    .line 26
    if-ne v1, v2, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->h:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    add-int/lit8 p1, p1, -0x4

    .line 40
    .line 41
    if-lt v0, p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method
