.class public abstract Lcom/android/launcher3/keyboard/a;
.super Ljava/lang/Object;
.source "ItemFocusIndicatorHelper.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/keyboard/a$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/animation/ValueAnimator$AnimatorUpdateListener;"
    }
.end annotation


# static fields
.field public static final v:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/keyboard/a;",
            ">;"
        }
    .end annotation
.end field

.field public static final w:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/keyboard/a;",
            ">;"
        }
    .end annotation
.end field

.field private static final x:Landroid/animation/RectEvaluator;

.field private static final y:Landroid/graphics/Rect;

.field private static final z:Landroid/graphics/Rect;


# instance fields
.field private final g:Landroid/view/View;

.field protected final h:Landroid/graphics/Paint;

.field private final i:Landroid/graphics/Paint;

.field protected j:I

.field private final k:Landroid/graphics/Rect;

.field private l:Z

.field private m:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private n:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private o:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private p:F

.field private q:Landroid/animation/ObjectAnimator;

.field private r:F

.field private s:F

.field private t:F

.field protected u:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/keyboard/a$a;

    .line 2
    .line 3
    const-string v1, "alpha"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/keyboard/a$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/keyboard/a;->v:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/keyboard/a$b;

    .line 11
    .line 12
    const-string v1, "shift"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/keyboard/a$b;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/keyboard/a;->w:Landroid/util/FloatProperty;

    .line 18
    .line 19
    new-instance v0, Landroid/animation/RectEvaluator;

    .line 20
    .line 21
    new-instance v1, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-direct {v0, v1}, Landroid/animation/RectEvaluator;-><init>(Landroid/graphics/Rect;)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/launcher3/keyboard/a;->x:Landroid/animation/RectEvaluator;

    .line 30
    .line 31
    new-instance v0, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lcom/android/launcher3/keyboard/a;->y:Landroid/graphics/Rect;

    .line 37
    .line 38
    new-instance v0, Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 41
    .line 42
    .line 43
    sput-object v0, Lcom/android/launcher3/keyboard/a;->z:Landroid/graphics/Rect;

    .line 44
    .line 45
    return-void
.end method

.method public varargs constructor <init>(Landroid/view/View;[I)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/keyboard/a;->h:Landroid/graphics/Paint;

    .line 11
    .line 12
    new-instance v2, Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Lcom/android/launcher3/keyboard/a;->i:Landroid/graphics/Paint;

    .line 18
    .line 19
    new-instance v3, Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v3, p0, Lcom/android/launcher3/keyboard/a;->k:Landroid/graphics/Rect;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    iput-boolean v3, p0, Lcom/android/launcher3/keyboard/a;->l:Z

    .line 28
    .line 29
    iput-boolean v1, p0, Lcom/android/launcher3/keyboard/a;->u:Z

    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/launcher3/keyboard/a;->g:Landroid/view/View;

    .line 32
    .line 33
    aget v4, p2, v3

    .line 34
    .line 35
    const/high16 v5, -0x1000000

    .line 36
    .line 37
    or-int/2addr v4, v5

    .line 38
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    array-length v4, p2

    .line 48
    if-le v4, v1, :cond_0

    .line 49
    .line 50
    invoke-static {}, Lx1/O;->k1()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_0

    .line 55
    .line 56
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 57
    .line 58
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    const v7, 0x7f070331

    .line 66
    .line 67
    .line 68
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    int-to-float v6, v6

    .line 73
    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const v6, 0x7f070330

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    int-to-float v0, v0

    .line 88
    iput v0, p0, Lcom/android/launcher3/keyboard/a;->s:F

    .line 89
    .line 90
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 91
    .line 92
    .line 93
    aget v0, p2, v1

    .line 94
    .line 95
    or-int/2addr v0, v5

    .line 96
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    int-to-float v0, v0

    .line 108
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    const v0, 0x7f07032f

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    int-to-float p1, p1

    .line 123
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->t:F

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_0
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    const v0, 0x7f070402

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    int-to-float p1, p1

    .line 143
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->s:F

    .line 144
    .line 145
    :goto_0
    aget p1, p2, v3

    .line 146
    .line 147
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->j:I

    .line 152
    .line 153
    const/4 p1, 0x0

    .line 154
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/a;->j(F)V

    .line 155
    .line 156
    .line 157
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->p:F

    .line 158
    .line 159
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/keyboard/a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/keyboard/a;->r:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/keyboard/a;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/keyboard/a;->p:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/keyboard/a;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->p:F

    .line 2
    .line 3
    return-void
.end method

.method private g()Landroid/graphics/Rect;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a;->n:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/keyboard/a;->l(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a;->n:Ljava/lang/Object;

    .line 12
    .line 13
    sget-object v1, Lcom/android/launcher3/keyboard/a;->y:Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/keyboard/a;->m(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Lcom/android/launcher3/keyboard/a;->p:F

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    cmpl-float v0, v0, v2

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a;->o:Ljava/lang/Object;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v2, Lcom/android/launcher3/keyboard/a;->z:Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/keyboard/a;->m(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/android/launcher3/keyboard/a;->x:Landroid/animation/RectEvaluator;

    .line 35
    .line 36
    iget p0, p0, Lcom/android/launcher3/keyboard/a;->p:F

    .line 37
    .line 38
    invoke-virtual {v0, p0, v1, v2}, Landroid/animation/RectEvaluator;->evaluate(FLandroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_0
    return-object v1

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method


# virtual methods
.method protected d(Ljava/lang/Object;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget-object v2, p0, Lcom/android/launcher3/keyboard/a;->m:Ljava/lang/Object;

    .line 4
    .line 5
    if-eq v2, p1, :cond_0

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    const/4 v3, 0x0

    .line 12
    if-eqz p2, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/keyboard/a;->f()V

    .line 15
    .line 16
    .line 17
    iget v2, p0, Lcom/android/launcher3/keyboard/a;->r:F

    .line 18
    .line 19
    const v4, 0x3e4ccccd    # 0.2f

    .line 20
    .line 21
    .line 22
    cmpl-float v2, v2, v4

    .line 23
    .line 24
    const/high16 v4, 0x3f800000    # 1.0f

    .line 25
    .line 26
    if-lez v2, :cond_1

    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/launcher3/keyboard/a;->o:Ljava/lang/Object;

    .line 29
    .line 30
    sget-object v2, Lcom/android/launcher3/keyboard/a;->v:Landroid/util/FloatProperty;

    .line 31
    .line 32
    new-array v5, v1, [F

    .line 33
    .line 34
    aput v4, v5, v0

    .line 35
    .line 36
    invoke-static {v2, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    sget-object v5, Lcom/android/launcher3/keyboard/a;->w:Landroid/util/FloatProperty;

    .line 41
    .line 42
    new-array v6, v1, [F

    .line 43
    .line 44
    aput v4, v6, v0

    .line 45
    .line 46
    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    filled-new-array {v2, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Lcom/android/launcher3/keyboard/a;->q:Landroid/animation/ObjectAnimator;

    .line 59
    .line 60
    new-instance v2, Lcom/android/launcher3/keyboard/a$c;

    .line 61
    .line 62
    invoke-direct {v2, p0, p1, v1}, Lcom/android/launcher3/keyboard/a$c;-><init>(Lcom/android/launcher3/keyboard/a;Ljava/lang/Object;Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/a;->k(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    sget-object v2, Lcom/android/launcher3/keyboard/a;->v:Landroid/util/FloatProperty;

    .line 73
    .line 74
    new-array v1, v1, [F

    .line 75
    .line 76
    aput v4, v1, v0

    .line 77
    .line 78
    invoke-static {v2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/android/launcher3/keyboard/a;->q:Landroid/animation/ObjectAnimator;

    .line 91
    .line 92
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/keyboard/a;->m:Ljava/lang/Object;

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    if-ne v2, p1, :cond_3

    .line 96
    .line 97
    iput-object v3, p0, Lcom/android/launcher3/keyboard/a;->m:Ljava/lang/Object;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/android/launcher3/keyboard/a;->f()V

    .line 100
    .line 101
    .line 102
    sget-object v2, Lcom/android/launcher3/keyboard/a;->v:Landroid/util/FloatProperty;

    .line 103
    .line 104
    new-array v1, v1, [F

    .line 105
    .line 106
    const/4 v4, 0x0

    .line 107
    aput v4, v1, v0

    .line 108
    .line 109
    invoke-static {v2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    filled-new-array {v1}, [Landroid/animation/PropertyValuesHolder;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {p0, v1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, p0, Lcom/android/launcher3/keyboard/a;->q:Landroid/animation/ObjectAnimator;

    .line 122
    .line 123
    new-instance v2, Lcom/android/launcher3/keyboard/a$c;

    .line 124
    .line 125
    invoke-direct {v2, p0, v3, v0}, Lcom/android/launcher3/keyboard/a$c;-><init>(Lcom/android/launcher3/keyboard/a;Ljava/lang/Object;Z)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 129
    .line 130
    .line 131
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/keyboard/a;->h()V

    .line 132
    .line 133
    .line 134
    if-eqz p2, :cond_4

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_4
    move-object p1, v3

    .line 138
    :goto_2
    iput-object p1, p0, Lcom/android/launcher3/keyboard/a;->m:Ljava/lang/Object;

    .line 139
    .line 140
    iget-object p1, p0, Lcom/android/launcher3/keyboard/a;->q:Landroid/animation/ObjectAnimator;

    .line 141
    .line 142
    if-eqz p1, :cond_5

    .line 143
    .line 144
    invoke-virtual {p1, p0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/android/launcher3/keyboard/a;->q:Landroid/animation/ObjectAnimator;

    .line 148
    .line 149
    const-wide/16 p1, 0x96

    .line 150
    .line 151
    invoke-virtual {p0, p1, p2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 156
    .line 157
    .line 158
    :cond_5
    :goto_3
    return-void
.end method

.method public e(Landroid/graphics/Canvas;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/android/launcher3/keyboard/a;->r:F

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    cmpg-float v1, v1, v2

    .line 7
    .line 8
    if-lez v1, :cond_5

    .line 9
    .line 10
    iget-boolean v1, v0, Lcom/android/launcher3/keyboard/a;->u:Z

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_2

    .line 15
    .line 16
    :cond_0
    invoke-direct {v0}, Lcom/android/launcher3/keyboard/a;->g()Landroid/graphics/Rect;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_5

    .line 21
    .line 22
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-static {}, Lx1/O;->k1()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    iget-object v2, v0, Lcom/android/launcher3/keyboard/a;->h:Landroid/graphics/Paint;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    float-to-int v2, v2

    .line 41
    int-to-double v3, v2

    .line 42
    const-wide/high16 v5, 0x3ff8000000000000L    # 1.5

    .line 43
    .line 44
    mul-double/2addr v3, v5

    .line 45
    double-to-int v3, v3

    .line 46
    invoke-virtual {v1, v3, v3}, Landroid/graphics/Rect;->inset(II)V

    .line 47
    .line 48
    .line 49
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 50
    .line 51
    int-to-float v5, v3

    .line 52
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 53
    .line 54
    int-to-float v6, v3

    .line 55
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 56
    .line 57
    int-to-float v7, v3

    .line 58
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    .line 59
    .line 60
    int-to-float v8, v3

    .line 61
    iget v9, v0, Lcom/android/launcher3/keyboard/a;->t:F

    .line 62
    .line 63
    iget-object v11, v0, Lcom/android/launcher3/keyboard/a;->i:Landroid/graphics/Paint;

    .line 64
    .line 65
    move v10, v9

    .line 66
    move-object/from16 v4, p1

    .line 67
    .line 68
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 69
    .line 70
    .line 71
    neg-int v2, v2

    .line 72
    invoke-virtual {v1, v2, v2}, Landroid/graphics/Rect;->inset(II)V

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object v2, v0, Lcom/android/launcher3/keyboard/a;->k:Landroid/graphics/Rect;

    .line 76
    .line 77
    invoke-virtual {v2, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lx1/O;->k1()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1}, Lcom/android/launcher3/H5$g;->a()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iget-object v2, v0, Lcom/android/launcher3/keyboard/a;->h:Landroid/graphics/Paint;

    .line 99
    .line 100
    iget-object v3, v0, Lcom/android/launcher3/keyboard/a;->g:Landroid/view/View;

    .line 101
    .line 102
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    const/4 v4, -0x1

    .line 107
    if-ne v1, v4, :cond_2

    .line 108
    .line 109
    const v1, 0x7f06020a

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    const v1, 0x7f060209

    .line 114
    .line 115
    .line 116
    :goto_0
    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 121
    .line 122
    .line 123
    iget-object v1, v0, Lcom/android/launcher3/keyboard/a;->n:Ljava/lang/Object;

    .line 124
    .line 125
    instance-of v2, v1, Lcom/android/launcher3/widget/T;

    .line 126
    .line 127
    if-eqz v2, :cond_3

    .line 128
    .line 129
    iget-object v1, v0, Lcom/android/launcher3/keyboard/a;->g:Landroid/view/View;

    .line 130
    .line 131
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const v2, 0x7f070404

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    int-to-float v1, v1

    .line 143
    iput v1, v0, Lcom/android/launcher3/keyboard/a;->s:F

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_3
    instance-of v1, v1, Lcom/android/launcher3/views/DoubleShadowBubbleTextView;

    .line 147
    .line 148
    if-eqz v1, :cond_4

    .line 149
    .line 150
    iget-object v1, v0, Lcom/android/launcher3/keyboard/a;->g:Landroid/view/View;

    .line 151
    .line 152
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    const v2, 0x7f070403

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    int-to-float v1, v1

    .line 164
    iput v1, v0, Lcom/android/launcher3/keyboard/a;->s:F

    .line 165
    .line 166
    :cond_4
    :goto_1
    iget-object v1, v0, Lcom/android/launcher3/keyboard/a;->k:Landroid/graphics/Rect;

    .line 167
    .line 168
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 169
    .line 170
    int-to-float v13, v2

    .line 171
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 172
    .line 173
    int-to-float v14, v2

    .line 174
    iget v2, v1, Landroid/graphics/Rect;->right:I

    .line 175
    .line 176
    int-to-float v15, v2

    .line 177
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 178
    .line 179
    int-to-float v1, v1

    .line 180
    iget v2, v0, Lcom/android/launcher3/keyboard/a;->s:F

    .line 181
    .line 182
    iget-object v3, v0, Lcom/android/launcher3/keyboard/a;->h:Landroid/graphics/Paint;

    .line 183
    .line 184
    move/from16 v18, v2

    .line 185
    .line 186
    move-object/from16 v12, p1

    .line 187
    .line 188
    move/from16 v16, v1

    .line 189
    .line 190
    move/from16 v17, v2

    .line 191
    .line 192
    move-object/from16 v19, v3

    .line 193
    .line 194
    invoke-virtual/range {v12 .. v19}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 195
    .line 196
    .line 197
    const/4 v1, 0x1

    .line 198
    iput-boolean v1, v0, Lcom/android/launcher3/keyboard/a;->l:Z

    .line 199
    .line 200
    :cond_5
    :goto_2
    return-void
.end method

.method protected f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a;->q:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/keyboard/a;->q:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected h()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/keyboard/a;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a;->g:Landroid/view/View;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/keyboard/a;->k:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->invalidate(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/keyboard/a;->l:Z

    .line 14
    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/keyboard/a;->g()Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/keyboard/a;->g:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->invalidate(Landroid/graphics/Rect;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/keyboard/a;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected j(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->r:F

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a;->h:Landroid/graphics/Paint;

    .line 4
    .line 5
    iget v1, p0, Lcom/android/launcher3/keyboard/a;->j:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    mul-float/2addr p1, v1

    .line 9
    float-to-int p1, p1

    .line 10
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/keyboard/a;->i:Landroid/graphics/Paint;

    .line 14
    .line 15
    iget v0, p0, Lcom/android/launcher3/keyboard/a;->r:F

    .line 16
    .line 17
    iget p0, p0, Lcom/android/launcher3/keyboard/a;->j:I

    .line 18
    .line 19
    int-to-float p0, p0

    .line 20
    mul-float/2addr v0, p0

    .line 21
    float-to-int p0, v0

    .line 22
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method protected k(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/keyboard/a;->n:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->p:F

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/android/launcher3/keyboard/a;->o:Ljava/lang/Object;

    .line 17
    .line 18
    return-void
.end method

.method protected l(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public abstract m(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/graphics/Rect;",
            ")V"
        }
    .end annotation
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/keyboard/a;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
