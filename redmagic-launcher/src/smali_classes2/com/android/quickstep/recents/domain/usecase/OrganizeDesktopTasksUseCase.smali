.class public final Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;
.super Ljava/lang/Object;
.source "OrganizeDesktopTasksUseCase.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$Companion;,
        Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;
    }
.end annotation


# static fields
.field private static final Companion:Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$Companion;

.field public static final HORIZONTAL_SPACE_BETWEEN_TASKS:I = 0x18
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final MAXIMUM_TASK_HEIGHT:I = 0x320
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final OVERVIEW_INSET_LEFT_RIGHT:I = 0x10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final OVERVIEW_INSET_TOP_BOTTOM:I = 0x10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final VERTICAL_SPACE_BETWEEN_TASKS:I = 0x18
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->Companion:Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final centerTaskWindows(Landroid/graphics/Rect;ILjava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "I",
            "Ljava/util/List<",
            "+",
            "Landroid/graphics/RectF;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Landroid/graphics/RectF;

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/graphics/RectF;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/graphics/RectF;

    .line 25
    .line 26
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 27
    .line 28
    new-instance v2, Lkotlin/jvm/internal/B;

    .line 29
    .line 30
    invoke-direct {v2}, Lkotlin/jvm/internal/B;-><init>()V

    .line 31
    .line 32
    .line 33
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 34
    .line 35
    sub-int/2addr v3, p2

    .line 36
    int-to-float p2, v3

    .line 37
    const/high16 v3, 0x40000000    # 2.0f

    .line 38
    .line 39
    div-float v4, p2, v3

    .line 40
    .line 41
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    move v5, p0

    .line 46
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    add-int/lit8 v6, v5, 0x1

    .line 57
    .line 58
    if-gez v5, :cond_1

    .line 59
    .line 60
    invoke-static {}, Li4/m;->r()V

    .line 61
    .line 62
    .line 63
    :cond_1
    check-cast p0, Landroid/graphics/RectF;

    .line 64
    .line 65
    iget v3, p0, Landroid/graphics/RectF;->top:F

    .line 66
    .line 67
    cmpg-float v3, v3, v1

    .line 68
    .line 69
    if-nez v3, :cond_2

    .line 70
    .line 71
    move v3, v1

    .line 72
    move-object v1, p1

    .line 73
    move p1, v3

    .line 74
    move-object v3, p3

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    move-object v1, p1

    .line 77
    move-object v3, p3

    .line 78
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->centerTaskWindows$batchCenterDesktopTaskWindows(Landroid/graphics/RectF;Landroid/graphics/Rect;Lkotlin/jvm/internal/B;Ljava/util/List;FI)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 82
    .line 83
    .line 84
    iget p1, p0, Landroid/graphics/RectF;->top:F

    .line 85
    .line 86
    iput v5, v2, Lkotlin/jvm/internal/B;->g:I

    .line 87
    .line 88
    :goto_1
    iget p0, p0, Landroid/graphics/RectF;->right:F

    .line 89
    .line 90
    iput p0, v0, Landroid/graphics/RectF;->right:F

    .line 91
    .line 92
    move-object p3, v1

    .line 93
    move v1, p1

    .line 94
    move-object p1, p3

    .line 95
    move-object p3, v3

    .line 96
    move v5, v6

    .line 97
    goto :goto_0

    .line 98
    :cond_3
    move-object v1, p1

    .line 99
    move-object v3, p3

    .line 100
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->centerTaskWindows$batchCenterDesktopTaskWindows(Landroid/graphics/RectF;Landroid/graphics/Rect;Lkotlin/jvm/internal/B;Ljava/util/List;FI)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method private static final centerTaskWindows$batchCenterDesktopTaskWindows(Landroid/graphics/RectF;Landroid/graphics/Rect;Lkotlin/jvm/internal/B;Ljava/util/List;FI)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/RectF;",
            "Landroid/graphics/Rect;",
            "Lkotlin/jvm/internal/B;",
            "Ljava/util/List<",
            "+",
            "Landroid/graphics/RectF;",
            ">;FI)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Landroid/graphics/RectF;->left:F

    .line 2
    .line 3
    iget p0, p0, Landroid/graphics/RectF;->right:F

    .line 4
    .line 5
    add-float/2addr v0, p0

    .line 6
    const/high16 p0, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, p0

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    int-to-float p0, p0

    .line 14
    sub-float/2addr p0, v0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-static {p0, p1}, LA4/d;->b(FF)F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    iget p1, p2, Lkotlin/jvm/internal/B;->g:I

    .line 21
    .line 22
    :goto_0
    if-ge p1, p5, :cond_0

    .line 23
    .line 24
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Landroid/graphics/RectF;

    .line 29
    .line 30
    invoke-virtual {p2, p0, p4}, Landroid/graphics/RectF;->offset(FF)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-void
.end method

.method private final findOptimalHeightAndBalancedWidth(Landroid/graphics/Rect;Ljava/util/List;)Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    const/4 v6, 0x1

    .line 18
    add-int/2addr v5, v6

    .line 19
    const/16 v7, 0x18

    .line 20
    .line 21
    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    add-int/lit8 v8, v5, 0x18

    .line 26
    .line 27
    int-to-float v8, v8

    .line 28
    const/high16 v9, 0x3f000000    # 0.5f

    .line 29
    .line 30
    mul-float/2addr v8, v9

    .line 31
    const/4 v10, 0x0

    .line 32
    move v11, v10

    .line 33
    :cond_0
    :goto_0
    new-instance v12, Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-direct {v12, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 36
    .line 37
    .line 38
    iput v4, v12, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    float-to-int v13, v8

    .line 41
    const/16 v14, 0x320

    .line 42
    .line 43
    invoke-static {v14, v13}, Ljava/lang/Math;->min(II)I

    .line 44
    .line 45
    .line 46
    move-result v15

    .line 47
    invoke-direct {v0, v12, v2, v15}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->fitWindowRectsInBounds(Landroid/graphics/Rect;Ljava/util/List;I)Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;

    .line 48
    .line 49
    .line 50
    move-result-object v12

    .line 51
    invoke-virtual {v12}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->getAllWindowsFit()Z

    .line 52
    .line 53
    .line 54
    move-result v15

    .line 55
    invoke-virtual {v12}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->getCalculatedBounds()Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v16

    .line 59
    invoke-virtual {v12}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->getMinRight()I

    .line 60
    .line 61
    .line 62
    move-result v17

    .line 63
    invoke-virtual {v12}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->getMaxRight()I

    .line 64
    .line 65
    .line 66
    move-result v12

    .line 67
    if-eqz v11, :cond_3

    .line 68
    .line 69
    if-nez v15, :cond_2

    .line 70
    .line 71
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_2
    iget v13, v1, Landroid/graphics/Rect;->left:I

    .line 75
    .line 76
    if-gt v12, v13, :cond_5

    .line 77
    .line 78
    move v6, v10

    .line 79
    goto :goto_2

    .line 80
    :cond_3
    if-eqz v15, :cond_4

    .line 81
    .line 82
    move v7, v13

    .line 83
    goto :goto_1

    .line 84
    :cond_4
    move v5, v13

    .line 85
    :goto_1
    add-int v8, v7, v5

    .line 86
    .line 87
    int-to-float v8, v8

    .line 88
    mul-float/2addr v8, v9

    .line 89
    float-to-int v13, v8

    .line 90
    if-ne v13, v7, :cond_5

    .line 91
    .line 92
    move v11, v6

    .line 93
    :cond_5
    if-eqz v15, :cond_0

    .line 94
    .line 95
    if-eqz v11, :cond_0

    .line 96
    .line 97
    sub-int v13, v12, v17

    .line 98
    .line 99
    if-gt v13, v3, :cond_1

    .line 100
    .line 101
    add-int/lit8 v4, v12, -0x1

    .line 102
    .line 103
    move v3, v13

    .line 104
    goto :goto_0

    .line 105
    :goto_2
    if-eqz v6, :cond_6

    .line 106
    .line 107
    new-instance v3, Landroid/graphics/Rect;

    .line 108
    .line 109
    invoke-direct {v3, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 110
    .line 111
    .line 112
    iput v4, v3, Landroid/graphics/Rect;->right:I

    .line 113
    .line 114
    float-to-int v1, v8

    .line 115
    invoke-static {v14, v1}, Ljava/lang/Math;->min(II)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    invoke-direct {v0, v3, v2, v1}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->fitWindowRectsInBounds(Landroid/graphics/Rect;Ljava/util/List;I)Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;->getCalculatedBounds()Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    return-object v0

    .line 128
    :cond_6
    return-object v16
.end method

.method private final fitWindowRectsInBounds(Landroid/graphics/Rect;Ljava/util/List;I)Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;I)",
            "Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    new-instance v3, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iget v4, v0, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    iget v5, v0, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iget v6, v0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    move v8, v6

    .line 21
    const/4 v9, 0x0

    .line 22
    move v6, v5

    .line 23
    move v5, v4

    .line 24
    :goto_0
    if-ge v9, v2, :cond_3

    .line 25
    .line 26
    move-object/from16 v10, p2

    .line 27
    .line 28
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v11

    .line 32
    check-cast v11, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 33
    .line 34
    invoke-virtual {v11}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getBounds()Landroid/graphics/Rect;

    .line 35
    .line 36
    .line 37
    move-result-object v11

    .line 38
    int-to-float v12, v1

    .line 39
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    .line 40
    .line 41
    .line 42
    move-result v13

    .line 43
    int-to-float v13, v13

    .line 44
    div-float/2addr v12, v13

    .line 45
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    .line 46
    .line 47
    .line 48
    move-result v11

    .line 49
    int-to-float v11, v11

    .line 50
    mul-float/2addr v11, v12

    .line 51
    float-to-int v11, v11

    .line 52
    add-int/lit8 v12, v1, 0x18

    .line 53
    .line 54
    add-int v13, v4, v11

    .line 55
    .line 56
    add-int/lit8 v13, v13, 0x18

    .line 57
    .line 58
    iget v14, v0, Landroid/graphics/Rect;->right:I

    .line 59
    .line 60
    if-le v13, v14, :cond_2

    .line 61
    .line 62
    invoke-static {v8, v4}, Ljava/lang/Math;->min(II)I

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    add-int/2addr v6, v12

    .line 71
    add-int/2addr v12, v6

    .line 72
    iget v13, v0, Landroid/graphics/Rect;->bottom:I

    .line 73
    .line 74
    if-gt v12, v13, :cond_1

    .line 75
    .line 76
    iget v12, v0, Landroid/graphics/Rect;->left:I

    .line 77
    .line 78
    add-int v13, v12, v11

    .line 79
    .line 80
    add-int/lit8 v13, v13, 0x18

    .line 81
    .line 82
    iget v14, v0, Landroid/graphics/Rect;->right:I

    .line 83
    .line 84
    if-le v13, v14, :cond_0

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_0
    move v4, v12

    .line 88
    goto :goto_2

    .line 89
    :cond_1
    :goto_1
    const/4 v7, 0x0

    .line 90
    goto :goto_3

    .line 91
    :cond_2
    :goto_2
    new-instance v12, Landroid/graphics/RectF;

    .line 92
    .line 93
    int-to-float v13, v4

    .line 94
    int-to-float v14, v6

    .line 95
    add-int v15, v4, v11

    .line 96
    .line 97
    int-to-float v15, v15

    .line 98
    add-int v7, v6, v1

    .line 99
    .line 100
    int-to-float v7, v7

    .line 101
    invoke-direct {v12, v13, v14, v15, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 102
    .line 103
    .line 104
    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    add-int/lit8 v11, v11, 0x18

    .line 108
    .line 109
    add-int/2addr v4, v11

    .line 110
    add-int/lit8 v9, v9, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    const/4 v7, 0x1

    .line 114
    :goto_3
    invoke-static {v8, v4}, Ljava/lang/Math;->min(II)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    new-instance v2, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;

    .line 123
    .line 124
    invoke-direct {v2, v7, v3, v0, v1}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase$FitWindowResult;-><init>(ZLjava/util/List;II)V

    .line 125
    .line 126
    .line 127
    return-object v2
.end method

.method private final getLayoutEffectiveBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x10

    .line 7
    .line 8
    invoke-virtual {p0, p1, p1}, Landroid/graphics/Rect;->inset(II)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public final run(Landroid/graphics/Rect;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "desktopBounds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskBounds"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_7

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_3

    .line 24
    .line 25
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    move-object v2, v1

    .line 45
    check-cast v2, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getBounds()Landroid/graphics/Rect;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-eqz p2, :cond_3

    .line 66
    .line 67
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->getLayoutEffectiveBounds(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->findOptimalHeightAndBalancedWidth(Landroid/graphics/Rect;Ljava/util/List;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_6

    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Landroid/graphics/RectF;

    .line 95
    .line 96
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 97
    .line 98
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_4

    .line 103
    .line 104
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Landroid/graphics/RectF;

    .line 109
    .line 110
    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    .line 111
    .line 112
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    goto :goto_1

    .line 117
    :cond_4
    float-to-int v1, v2

    .line 118
    invoke-direct {p0, p1, v1, p2}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->centerTaskWindows(Landroid/graphics/Rect;ILjava/util/List;)V

    .line 119
    .line 120
    .line 121
    new-instance p0, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    const/4 v1, 0x0

    .line 131
    :goto_2
    if-ge v1, p1, :cond_5

    .line 132
    .line 133
    new-instance v2, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 134
    .line 135
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    check-cast v3, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;

    .line 140
    .line 141
    invoke-virtual {v3}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;->getTaskId()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    check-cast v4, Landroid/graphics/RectF;

    .line 150
    .line 151
    new-instance v5, Landroid/graphics/Rect;

    .line 152
    .line 153
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 157
    .line 158
    .line 159
    invoke-direct {v2, v3, v5}, Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;-><init>(ILandroid/graphics/Rect;)V

    .line 160
    .line 161
    .line 162
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    add-int/lit8 v1, v1, 0x1

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_5
    return-object p0

    .line 169
    :cond_6
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 170
    .line 171
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 172
    .line 173
    .line 174
    throw p0

    .line 175
    :cond_7
    :goto_3
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    return-object p0
.end method
