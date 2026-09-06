.class public abstract LQ2/b;
.super Ljava/lang/Object;
.source "MagnetizedObject.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LQ2/b$a;,
        LQ2/b$b;,
        LQ2/b$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final A:LQ2/b$a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final c:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;"
        }
    .end annotation
.end field

.field private final d:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;"
        }
    .end annotation
.end field

.field private final e:LM2/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final f:[I

.field private final g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LQ2/b$c;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Landroid/view/VelocityTracker;

.field private final i:Landroid/os/Vibrator;

.field private final j:Landroid/os/VibrationAttributes;

.field private k:Landroid/graphics/PointF;

.field private l:I

.field private m:Z

.field private n:LQ2/b$c;

.field public o:LQ2/b$b;

.field private p:LM2/i$g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i$g<",
            "TT;>;"
        }
    .end annotation
.end field

.field private q:LM2/i$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i$c<",
            "TT;>;"
        }
    .end annotation
.end field

.field private r:Lu4/s;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/s<",
            "-",
            "LQ2/b$c;",
            "-",
            "Ljava/lang/Float;",
            "-",
            "Ljava/lang/Float;",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Lu4/a<",
            "Lh4/t;",
            ">;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private s:Z

.field private t:F

.field private u:F

.field private v:F

.field private w:F

.field private x:Z

.field private y:LM2/i$f;

.field private z:LM2/i$f;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LQ2/b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LQ2/b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LQ2/b;->A:LQ2/b$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;Landroidx/dynamicanimation/animation/g;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TT;",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "underlyingObject"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "xProperty"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "yProperty"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, LQ2/b;->a:Landroid/content/Context;

    .line 25
    .line 26
    iput-object p2, p0, LQ2/b;->b:Ljava/lang/Object;

    .line 27
    .line 28
    iput-object p3, p0, LQ2/b;->c:Landroidx/dynamicanimation/animation/g;

    .line 29
    .line 30
    iput-object p4, p0, LQ2/b;->d:Landroidx/dynamicanimation/animation/g;

    .line 31
    .line 32
    sget-object p3, LM2/i;->n:LM2/i$b;

    .line 33
    .line 34
    invoke-virtual {p3, p2}, LM2/i$b;->a(Ljava/lang/Object;)LM2/i;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iput-object p2, p0, LQ2/b;->e:LM2/i;

    .line 39
    .line 40
    const/4 p2, 0x2

    .line 41
    new-array p2, p2, [I

    .line 42
    .line 43
    iput-object p2, p0, LQ2/b;->f:[I

    .line 44
    .line 45
    new-instance p2, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p2, p0, LQ2/b;->g:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string p3, "obtain(...)"

    .line 57
    .line 58
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 62
    .line 63
    const-string p2, "vibrator"

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p2, "null cannot be cast to non-null type android.os.Vibrator"

    .line 70
    .line 71
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    check-cast p1, Landroid/os/Vibrator;

    .line 75
    .line 76
    iput-object p1, p0, LQ2/b;->i:Landroid/os/Vibrator;

    .line 77
    .line 78
    const/16 p1, 0x12

    .line 79
    .line 80
    invoke-static {p1}, Landroid/os/VibrationAttributes;->createForUsage(I)Landroid/os/VibrationAttributes;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string p2, "createForUsage(...)"

    .line 85
    .line 86
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iput-object p1, p0, LQ2/b;->j:Landroid/os/VibrationAttributes;

    .line 90
    .line 91
    new-instance p1, Landroid/graphics/PointF;

    .line 92
    .line 93
    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, LQ2/b;->k:Landroid/graphics/PointF;

    .line 97
    .line 98
    new-instance p1, LQ2/b$d;

    .line 99
    .line 100
    invoke-direct {p1, p0}, LQ2/b$d;-><init>(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, LQ2/b;->r:Lu4/s;

    .line 104
    .line 105
    const/4 p1, 0x1

    .line 106
    iput-boolean p1, p0, LQ2/b;->s:Z

    .line 107
    .line 108
    const/high16 p2, 0x40400000    # 3.0f

    .line 109
    .line 110
    iput p2, p0, LQ2/b;->t:F

    .line 111
    .line 112
    const/high16 p2, 0x457a0000    # 4000.0f

    .line 113
    .line 114
    iput p2, p0, LQ2/b;->u:F

    .line 115
    .line 116
    iput p2, p0, LQ2/b;->v:F

    .line 117
    .line 118
    const/high16 p2, 0x44fa0000    # 2000.0f

    .line 119
    .line 120
    iput p2, p0, LQ2/b;->w:F

    .line 121
    .line 122
    iput-boolean p1, p0, LQ2/b;->x:Z

    .line 123
    .line 124
    new-instance p1, LM2/i$f;

    .line 125
    .line 126
    const p2, 0x44bb8000    # 1500.0f

    .line 127
    .line 128
    .line 129
    const/high16 p3, 0x3f800000    # 1.0f

    .line 130
    .line 131
    invoke-direct {p1, p2, p3}, LM2/i$f;-><init>(FF)V

    .line 132
    .line 133
    .line 134
    iput-object p1, p0, LQ2/b;->y:LM2/i$f;

    .line 135
    .line 136
    iput-object p1, p0, LQ2/b;->z:LM2/i$f;

    .line 137
    .line 138
    return-void
.end method

.method public static synthetic a(LQ2/b;LQ2/b$c;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LQ2/b;->o(LQ2/b;LQ2/b$c;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(LQ2/b;LQ2/b$c;FFZLu4/a;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, LQ2/b;->e(LQ2/b$c;FFZLu4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final c(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sub-float/2addr v1, v2

    .line 19
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 25
    .line 26
    .line 27
    neg-float p0, v0

    .line 28
    neg-float v0, v1

    .line 29
    invoke-virtual {p1, p0, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private final e(LQ2/b$c;FFZLu4/a;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LQ2/b$c;",
            "FFZ",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, LQ2/b$c;->g()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LQ2/b;->b:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object v1, p0, LQ2/b;->f:[I

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, LQ2/b;->h(Ljava/lang/Object;[I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, LQ2/b$c;->d()Landroid/graphics/PointF;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    iget-object v1, p0, LQ2/b;->b:Ljava/lang/Object;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, LQ2/b;->l(Ljava/lang/Object;)F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/high16 v2, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v1, v2

    .line 26
    sub-float/2addr v0, v1

    .line 27
    iget-object v1, p0, LQ2/b;->f:[I

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    aget v1, v1, v3

    .line 31
    .line 32
    int-to-float v1, v1

    .line 33
    sub-float/2addr v0, v1

    .line 34
    invoke-virtual {p1}, LQ2/b$c;->d()Landroid/graphics/PointF;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 39
    .line 40
    iget-object v1, p0, LQ2/b;->b:Ljava/lang/Object;

    .line 41
    .line 42
    invoke-virtual {p0, v1}, LQ2/b;->g(Ljava/lang/Object;)F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    div-float/2addr v1, v2

    .line 47
    sub-float/2addr p1, v1

    .line 48
    iget-object v1, p0, LQ2/b;->f:[I

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    aget v1, v1, v2

    .line 52
    .line 53
    int-to-float v1, v1

    .line 54
    sub-float/2addr p1, v1

    .line 55
    if-eqz p4, :cond_0

    .line 56
    .line 57
    iget-object p4, p0, LQ2/b;->z:LM2/i$f;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object p4, p0, LQ2/b;->y:LM2/i$f;

    .line 61
    .line 62
    :goto_0
    invoke-virtual {p0}, LQ2/b;->f()V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, LQ2/b;->e:LM2/i;

    .line 66
    .line 67
    iget-object v4, p0, LQ2/b;->c:Landroidx/dynamicanimation/animation/g;

    .line 68
    .line 69
    iget-object v5, p0, LQ2/b;->b:Ljava/lang/Object;

    .line 70
    .line 71
    invoke-virtual {v4, v5}, Landroidx/dynamicanimation/animation/g;->getValue(Ljava/lang/Object;)F

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    add-float/2addr v5, v0

    .line 76
    invoke-virtual {v1, v4, v5, p2, p4}, LM2/i;->C(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;)LM2/i;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    iget-object v0, p0, LQ2/b;->d:Landroidx/dynamicanimation/animation/g;

    .line 81
    .line 82
    iget-object v1, p0, LQ2/b;->b:Ljava/lang/Object;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/g;->getValue(Ljava/lang/Object;)F

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    add-float/2addr v1, p1

    .line 89
    invoke-virtual {p2, v0, v1, p3, p4}, LM2/i;->C(Landroidx/dynamicanimation/animation/g;FFLM2/i$f;)LM2/i;

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, LQ2/b;->p:LM2/i$g;

    .line 93
    .line 94
    if-eqz p1, :cond_1

    .line 95
    .line 96
    iget-object p2, p0, LQ2/b;->e:LM2/i;

    .line 97
    .line 98
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p2, p1}, LM2/i;->i(LM2/i$g;)LM2/i;

    .line 102
    .line 103
    .line 104
    :cond_1
    iget-object p1, p0, LQ2/b;->q:LM2/i$c;

    .line 105
    .line 106
    if-eqz p1, :cond_2

    .line 107
    .line 108
    iget-object p2, p0, LQ2/b;->e:LM2/i;

    .line 109
    .line 110
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2, p1}, LM2/i;->h(LM2/i$c;)LM2/i;

    .line 114
    .line 115
    .line 116
    :cond_2
    if-eqz p5, :cond_3

    .line 117
    .line 118
    iget-object p1, p0, LQ2/b;->e:LM2/i;

    .line 119
    .line 120
    new-array p2, v2, [Lu4/a;

    .line 121
    .line 122
    aput-object p5, p2, v3

    .line 123
    .line 124
    invoke-virtual {p1, p2}, LM2/i;->I([Lu4/a;)LM2/i;

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object p0, p0, LQ2/b;->e:LM2/i;

    .line 128
    .line 129
    invoke-virtual {p0}, LM2/i;->F()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method private final m(LQ2/b$c;FFFF)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, LQ2/b;->s:Z

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
    invoke-virtual {p1}, LQ2/b$c;->c()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    cmpg-float v0, p3, v0

    .line 12
    .line 13
    if-gez v0, :cond_1

    .line 14
    .line 15
    iget v0, p0, LQ2/b;->u:F

    .line 16
    .line 17
    cmpl-float v0, p5, v0

    .line 18
    .line 19
    if-lez v0, :cond_3

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget v0, p0, LQ2/b;->u:F

    .line 23
    .line 24
    cmpg-float v0, p5, v0

    .line 25
    .line 26
    if-gez v0, :cond_3

    .line 27
    .line 28
    :goto_0
    const/4 v0, 0x0

    .line 29
    cmpg-float v0, p4, v0

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    div-float/2addr p5, p4

    .line 35
    mul-float/2addr p2, p5

    .line 36
    sub-float/2addr p3, p2

    .line 37
    invoke-virtual {p1}, LQ2/b$c;->c()F

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    sub-float/2addr p2, p3

    .line 42
    div-float/2addr p2, p5

    .line 43
    :goto_1
    invoke-virtual {p1}, LQ2/b$c;->f()Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    int-to-float p3, p3

    .line 52
    iget p0, p0, LQ2/b;->t:F

    .line 53
    .line 54
    mul-float/2addr p3, p0

    .line 55
    invoke-virtual {p1}, LQ2/b$c;->b()F

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    const/4 p4, 0x2

    .line 60
    int-to-float p4, p4

    .line 61
    div-float/2addr p3, p4

    .line 62
    sub-float/2addr p0, p3

    .line 63
    cmpl-float p0, p2, p0

    .line 64
    .line 65
    if-lez p0, :cond_3

    .line 66
    .line 67
    invoke-virtual {p1}, LQ2/b$c;->b()F

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    add-float/2addr p0, p3

    .line 72
    cmpg-float p0, p2, p0

    .line 73
    .line 74
    if-gez p0, :cond_3

    .line 75
    .line 76
    const/4 p0, 0x1

    .line 77
    return p0

    .line 78
    :cond_3
    return v1
.end method

.method private static final o(LQ2/b;LQ2/b$c;)Lh4/t;
    .locals 1

    .line 1
    invoke-virtual {p0}, LQ2/b;->i()LQ2/b$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1, p0}, LQ2/b$b;->b(LQ2/b$c;LQ2/b;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, LQ2/b;->n:LQ2/b$c;

    .line 10
    .line 11
    const/4 p1, 0x5

    .line 12
    invoke-direct {p0, p1}, LQ2/b;->t(I)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 16
    .line 17
    return-object p0
.end method

.method private final t(I)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, LQ2/b;->x:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LQ2/b;->i:Landroid/os/Vibrator;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/os/VibrationEffect;->createPredefined(I)Landroid/os/VibrationEffect;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, LQ2/b;->j:Landroid/os/VibrationAttributes;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p0}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;Landroid/os/VibrationAttributes;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public final d(LQ2/b$c;)V
    .locals 1

    .line 1
    const-string v0, "target"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LQ2/b;->g:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, LQ2/b$c;->g()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, LQ2/b;->e:LM2/i;

    .line 2
    .line 3
    iget-object v1, p0, LQ2/b;->c:Landroidx/dynamicanimation/animation/g;

    .line 4
    .line 5
    iget-object p0, p0, LQ2/b;->d:Landroidx/dynamicanimation/animation/g;

    .line 6
    .line 7
    filled-new-array {v1, p0}, [Landroidx/dynamicanimation/animation/g;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, LM2/i;->l([Landroidx/dynamicanimation/animation/g;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public abstract g(Ljava/lang/Object;)F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)F"
        }
    .end annotation
.end method

.method public abstract h(Ljava/lang/Object;[I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[I)V"
        }
    .end annotation
.end method

.method public final i()LQ2/b$b;
    .locals 0

    .line 1
    iget-object p0, p0, LQ2/b;->o:LQ2/b$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "magnetListener"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final j()Z
    .locals 0

    .line 1
    iget-object p0, p0, LQ2/b;->n:LQ2/b$c;

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

.method public final k()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LQ2/b;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract l(Ljava/lang/Object;)F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)F"
        }
    .end annotation
.end method

.method public final n(Landroid/view/MotionEvent;)Z
    .locals 17

    .line 1
    move-object/from16 v2, p0

    .line 2
    .line 3
    const-string v0, "ev"

    .line 4
    .line 5
    move-object/from16 v6, p1

    .line 6
    .line 7
    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, v2, LQ2/b;->g:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v7, 0x0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return v7

    .line 20
    :cond_0
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v8, 0x0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v2}, LQ2/b;->s()V

    .line 28
    .line 29
    .line 30
    iget-object v0, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 33
    .line 34
    .line 35
    iput-object v8, v2, LQ2/b;->n:LQ2/b$c;

    .line 36
    .line 37
    iget-object v0, v2, LQ2/b;->k:Landroid/graphics/PointF;

    .line 38
    .line 39
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawX()F

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawY()F

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {v0, v1, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 48
    .line 49
    .line 50
    iput-boolean v7, v2, LQ2/b;->m:Z

    .line 51
    .line 52
    :cond_1
    invoke-direct/range {p0 .. p1}, LQ2/b;->c(Landroid/view/MotionEvent;)V

    .line 53
    .line 54
    .line 55
    iget-boolean v0, v2, LQ2/b;->m:Z

    .line 56
    .line 57
    const/4 v9, 0x1

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawX()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v1, v2, LQ2/b;->k:Landroid/graphics/PointF;

    .line 65
    .line 66
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 67
    .line 68
    sub-float/2addr v0, v1

    .line 69
    float-to-double v0, v0

    .line 70
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawY()F

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    iget-object v4, v2, LQ2/b;->k:Landroid/graphics/PointF;

    .line 75
    .line 76
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 77
    .line 78
    sub-float/2addr v3, v4

    .line 79
    float-to-double v3, v3

    .line 80
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->hypot(DD)D

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    double-to-float v0, v0

    .line 85
    iget v1, v2, LQ2/b;->l:I

    .line 86
    .line 87
    int-to-float v1, v1

    .line 88
    cmpl-float v0, v0, v1

    .line 89
    .line 90
    if-lez v0, :cond_2

    .line 91
    .line 92
    iput-boolean v9, v2, LQ2/b;->m:Z

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    return v7

    .line 96
    :cond_3
    :goto_0
    iget-object v0, v2, LQ2/b;->g:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_5

    .line 107
    .line 108
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    move-object v3, v1

    .line 113
    check-cast v3, LQ2/b$c;

    .line 114
    .line 115
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawX()F

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    invoke-virtual {v3}, LQ2/b$c;->b()F

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    sub-float/2addr v4, v5

    .line 124
    float-to-double v4, v4

    .line 125
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawY()F

    .line 126
    .line 127
    .line 128
    move-result v10

    .line 129
    invoke-virtual {v3}, LQ2/b$c;->c()F

    .line 130
    .line 131
    .line 132
    move-result v11

    .line 133
    sub-float/2addr v10, v11

    .line 134
    float-to-double v10, v10

    .line 135
    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->hypot(DD)D

    .line 136
    .line 137
    .line 138
    move-result-wide v4

    .line 139
    double-to-float v4, v4

    .line 140
    invoke-virtual {v3}, LQ2/b$c;->e()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    int-to-float v3, v3

    .line 145
    cmpg-float v3, v4, v3

    .line 146
    .line 147
    if-gez v3, :cond_4

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_5
    move-object v1, v8

    .line 151
    :goto_1
    move-object v11, v1

    .line 152
    check-cast v11, LQ2/b$c;

    .line 153
    .line 154
    invoke-virtual {v2}, LQ2/b;->j()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_6

    .line 159
    .line 160
    if-eqz v11, :cond_6

    .line 161
    .line 162
    move v0, v9

    .line 163
    goto :goto_2

    .line 164
    :cond_6
    move v0, v7

    .line 165
    :goto_2
    invoke-virtual {v2}, LQ2/b;->j()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_7

    .line 170
    .line 171
    if-eqz v11, :cond_7

    .line 172
    .line 173
    iget-object v1, v2, LQ2/b;->n:LQ2/b$c;

    .line 174
    .line 175
    invoke-static {v1, v11}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-nez v1, :cond_7

    .line 180
    .line 181
    move v1, v9

    .line 182
    goto :goto_3

    .line 183
    :cond_7
    move v1, v7

    .line 184
    :goto_3
    const/4 v10, 0x5

    .line 185
    const/16 v12, 0x3e8

    .line 186
    .line 187
    if-nez v0, :cond_a

    .line 188
    .line 189
    if-eqz v1, :cond_8

    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_8
    if-nez v11, :cond_9

    .line 193
    .line 194
    invoke-virtual {v2}, LQ2/b;->j()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_9

    .line 199
    .line 200
    iget-object v0, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 201
    .line 202
    invoke-virtual {v0, v12}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v2}, LQ2/b;->f()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v2}, LQ2/b;->i()LQ2/b$b;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object v1, v2, LQ2/b;->n:LQ2/b$c;

    .line 213
    .line 214
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    iget-object v3, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 218
    .line 219
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    iget-object v4, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 224
    .line 225
    invoke-virtual {v4}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 226
    .line 227
    .line 228
    move-result v4

    .line 229
    const/4 v5, 0x0

    .line 230
    invoke-interface/range {v0 .. v5}, LQ2/b$b;->a(LQ2/b$c;LQ2/b;FFZ)V

    .line 231
    .line 232
    .line 233
    iput-object v8, v2, LQ2/b;->n:LQ2/b$c;

    .line 234
    .line 235
    const/4 v0, 0x2

    .line 236
    invoke-direct {v2, v0}, LQ2/b;->t(I)V

    .line 237
    .line 238
    .line 239
    :cond_9
    move v0, v10

    .line 240
    move v1, v12

    .line 241
    goto :goto_5

    .line 242
    :cond_a
    :goto_4
    iget-object v1, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 243
    .line 244
    invoke-virtual {v1, v12}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 245
    .line 246
    .line 247
    iget-object v1, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 248
    .line 249
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    iget-object v3, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 254
    .line 255
    invoke-virtual {v3}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    if-eqz v0, :cond_b

    .line 260
    .line 261
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    iget v4, v2, LQ2/b;->w:F

    .line 266
    .line 267
    cmpl-float v0, v0, v4

    .line 268
    .line 269
    if-lez v0, :cond_b

    .line 270
    .line 271
    return v7

    .line 272
    :cond_b
    iput-object v11, v2, LQ2/b;->n:LQ2/b$c;

    .line 273
    .line 274
    invoke-virtual {v2}, LQ2/b;->f()V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v2}, LQ2/b;->i()LQ2/b$b;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-static {v11}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 282
    .line 283
    .line 284
    invoke-interface {v0, v11, v2}, LQ2/b$b;->c(LQ2/b$c;LQ2/b;)V

    .line 285
    .line 286
    .line 287
    move v0, v10

    .line 288
    iget-object v10, v2, LQ2/b;->r:Lu4/s;

    .line 289
    .line 290
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 295
    .line 296
    .line 297
    move-result-object v13

    .line 298
    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 299
    .line 300
    const/4 v15, 0x0

    .line 301
    move/from16 v16, v12

    .line 302
    .line 303
    move-object v12, v1

    .line 304
    move/from16 v1, v16

    .line 305
    .line 306
    invoke-interface/range {v10 .. v15}, Lu4/s;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    invoke-direct {v2, v0}, LQ2/b;->t(I)V

    .line 310
    .line 311
    .line 312
    :goto_5
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getAction()I

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    if-ne v3, v9, :cond_11

    .line 317
    .line 318
    iget-object v3, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 319
    .line 320
    invoke-virtual {v3, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 321
    .line 322
    .line 323
    iget-object v1, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 324
    .line 325
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 326
    .line 327
    .line 328
    move-result v3

    .line 329
    iget-object v1, v2, LQ2/b;->h:Landroid/view/VelocityTracker;

    .line 330
    .line 331
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 332
    .line 333
    .line 334
    move-result v4

    .line 335
    invoke-virtual {v2}, LQ2/b;->f()V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v2}, LQ2/b;->j()Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-eqz v1, :cond_d

    .line 343
    .line 344
    neg-float v1, v4

    .line 345
    iget v5, v2, LQ2/b;->v:F

    .line 346
    .line 347
    cmpl-float v1, v1, v5

    .line 348
    .line 349
    if-lez v1, :cond_c

    .line 350
    .line 351
    invoke-virtual {v2}, LQ2/b;->i()LQ2/b$b;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    iget-object v1, v2, LQ2/b;->n:LQ2/b$c;

    .line 356
    .line 357
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    const/4 v5, 0x1

    .line 361
    invoke-interface/range {v0 .. v5}, LQ2/b$b;->a(LQ2/b$c;LQ2/b;FFZ)V

    .line 362
    .line 363
    .line 364
    goto :goto_6

    .line 365
    :cond_c
    invoke-virtual {v2}, LQ2/b;->i()LQ2/b$b;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    iget-object v3, v2, LQ2/b;->n:LQ2/b$c;

    .line 370
    .line 371
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 372
    .line 373
    .line 374
    invoke-interface {v1, v3, v2}, LQ2/b$b;->b(LQ2/b$c;LQ2/b;)V

    .line 375
    .line 376
    .line 377
    invoke-direct {v2, v0}, LQ2/b;->t(I)V

    .line 378
    .line 379
    .line 380
    :goto_6
    iput-object v8, v2, LQ2/b;->n:LQ2/b$c;

    .line 381
    .line 382
    return v9

    .line 383
    :cond_d
    iget-object v0, v2, LQ2/b;->g:Ljava/util/ArrayList;

    .line 384
    .line 385
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 386
    .line 387
    .line 388
    move-result-object v10

    .line 389
    :cond_e
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-eqz v0, :cond_f

    .line 394
    .line 395
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v11

    .line 399
    move-object v1, v11

    .line 400
    check-cast v1, LQ2/b$c;

    .line 401
    .line 402
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawX()F

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    move v5, v4

    .line 407
    move v4, v3

    .line 408
    invoke-virtual {v6}, Landroid/view/MotionEvent;->getRawY()F

    .line 409
    .line 410
    .line 411
    move-result v3

    .line 412
    move-object/from16 v0, p0

    .line 413
    .line 414
    invoke-direct/range {v0 .. v5}, LQ2/b;->m(LQ2/b$c;FFFF)Z

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    move-object v2, v0

    .line 419
    move v3, v4

    .line 420
    move v4, v5

    .line 421
    if-eqz v1, :cond_e

    .line 422
    .line 423
    move-object v8, v11

    .line 424
    :cond_f
    move-object v11, v8

    .line 425
    check-cast v11, LQ2/b$c;

    .line 426
    .line 427
    if-eqz v11, :cond_10

    .line 428
    .line 429
    invoke-virtual {v2}, LQ2/b;->i()LQ2/b$b;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    invoke-interface {v0, v11, v2}, LQ2/b$b;->c(LQ2/b$c;LQ2/b;)V

    .line 434
    .line 435
    .line 436
    iput-object v11, v2, LQ2/b;->n:LQ2/b$c;

    .line 437
    .line 438
    iget-object v10, v2, LQ2/b;->r:Lu4/s;

    .line 439
    .line 440
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 441
    .line 442
    .line 443
    move-result-object v12

    .line 444
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 445
    .line 446
    .line 447
    move-result-object v13

    .line 448
    sget-object v14, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 449
    .line 450
    new-instance v15, LQ2/a;

    .line 451
    .line 452
    invoke-direct {v15, v2, v11}, LQ2/a;-><init>(LQ2/b;LQ2/b$c;)V

    .line 453
    .line 454
    .line 455
    invoke-interface/range {v10 .. v15}, Lu4/s;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    return v9

    .line 459
    :cond_10
    return v7

    .line 460
    :cond_11
    invoke-virtual {v2}, LQ2/b;->j()Z

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    return v0
.end method

.method public final p(F)V
    .locals 0

    .line 1
    iput p1, p0, LQ2/b;->u:F

    .line 2
    .line 3
    return-void
.end method

.method public final q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LQ2/b;->x:Z

    .line 2
    .line 3
    return-void
.end method

.method public final r(LQ2/b$b;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LQ2/b;->o:LQ2/b$b;

    .line 7
    .line 8
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    iget-object v0, p0, LQ2/b;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, LQ2/b$c;

    .line 18
    .line 19
    invoke-virtual {v1}, LQ2/b$c;->g()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, LQ2/b;->g:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, LQ2/b;->g:Ljava/util/ArrayList;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, LQ2/b$c;

    .line 39
    .line 40
    invoke-virtual {v0}, LQ2/b$c;->f()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, LQ2/b;->l:I

    .line 57
    .line 58
    :cond_1
    return-void
.end method
