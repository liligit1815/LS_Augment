.class public final Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;
.super Ljava/lang/Object;
.source "UnfoldAnimationBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;
    }
.end annotation


# static fields
.field private static final CLIP_CHILDREN:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "Landroid/view/ViewGroup;",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private static final CLIP_TO_PADDING:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "Landroid/view/ViewGroup;",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;

.field private static final MAX_WIDTH_INSET_FRACTION:F = 0.04f

.field private static final SCALE_LAUNCHER_FROM:F = 0.92f

.field private static final TRANSLATION_PERCENTAGE:F = 0.08f


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;

    .line 7
    .line 8
    sget-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;->INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;

    .line 9
    .line 10
    sput-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->CLIP_CHILDREN:Lu4/p;

    .line 11
    .line 12
    sget-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_TO_PADDING$1;->INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_TO_PADDING$1;

    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->CLIP_TO_PADDING:Lu4/p;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;Lcom/android/launcher3/CellLayout;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->buildUnfoldAnimation$lambda$0(Ljava/util/ArrayList;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;Lcom/android/launcher3/CellLayout;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final addChildrenAnimation(Landroid/view/ViewGroup;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;)V
    .locals 10

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array v0, p0, [I

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x0

    .line 9
    move v3, v2

    .line 10
    :goto_0
    if-ge v3, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    invoke-virtual {v5, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 17
    .line 18
    .line 19
    const v4, 0x3da3d70a    # 0.08f

    .line 20
    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    aget v6, v0, v2

    .line 25
    .line 26
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    div-int/2addr v7, p0

    .line 31
    add-int/2addr v6, v7

    .line 32
    iget v7, p3, Landroid/graphics/Point;->x:I

    .line 33
    .line 34
    div-int/2addr v7, p0

    .line 35
    sub-int/2addr v7, v6

    .line 36
    sget-object v6, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 37
    .line 38
    int-to-float v7, v7

    .line 39
    mul-float/2addr v7, v4

    .line 40
    const/4 v8, 0x0

    .line 41
    sget-object v9, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 42
    .line 43
    move-object v4, p4

    .line 44
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    const/4 v6, 0x1

    .line 49
    aget v6, v0, v6

    .line 50
    .line 51
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    div-int/2addr v7, p0

    .line 56
    add-int/2addr v6, v7

    .line 57
    iget v7, p3, Landroid/graphics/Point;->y:I

    .line 58
    .line 59
    div-int/2addr v7, p0

    .line 60
    sub-int/2addr v7, v6

    .line 61
    sget-object v6, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 62
    .line 63
    int-to-float v7, v7

    .line 64
    mul-float/2addr v7, v4

    .line 65
    const/4 v8, 0x0

    .line 66
    sget-object v9, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 67
    .line 68
    move-object v4, p4

    .line 69
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 70
    .line 71
    .line 72
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 73
    .line 74
    move-object p4, v4

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    return-void
.end method

.method public static synthetic b(Lu4/l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->buildUnfoldAnimation$lambda$1(Lu4/l;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final buildUnfoldAnimation$lambda$0(Ljava/util/ArrayList;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;Lcom/android/launcher3/CellLayout;)Lh4/t;
    .locals 2

    .line 1
    const-string v0, "cellLayout"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p4, v1, p0}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->setClipChildren(Landroid/view/ViewGroup;ZLjava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, p4, v1, p0}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->setClipToPadding(Landroid/view/ViewGroup;ZLjava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p4}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p4, "getShortcutsAndWidgets(...)"

    .line 20
    .line 21
    invoke-static {p0, p4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->addChildrenAnimation(Landroid/view/ViewGroup;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 28
    .line 29
    return-object p0
.end method

.method private static final buildUnfoldAnimation$lambda$1(Lu4/l;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "null cannot be cast to non-null type com.android.launcher3.CellLayout"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    check-cast p1, Lcom/android/launcher3/CellLayout;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static final buildUnfoldAnimation$lambda$3(Ljava/util/ArrayList;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->getAction()Lu4/p;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->getTarget()Landroid/view/ViewGroup;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->getValue()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {v0, v1, p1}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public static synthetic c(Ljava/util/ArrayList;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->buildUnfoldAnimation$lambda$3(Ljava/util/ArrayList;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final setClipChildren(Landroid/view/ViewGroup;ZLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Z",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eq p0, p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;

    .line 11
    .line 12
    sget-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->CLIP_CHILDREN:Lu4/p;

    .line 13
    .line 14
    invoke-direct {p2, v0, p1, p0}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;-><init>(Lu4/p;Landroid/view/ViewGroup;Z)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private final setClipToPadding(Landroid/view/ViewGroup;ZLjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Z",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eq p0, p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;

    .line 11
    .line 12
    sget-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->CLIP_TO_PADDING:Lu4/p;

    .line 13
    .line 14
    invoke-direct {p2, v0, p1, p0}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;-><init>(Lu4/p;Landroid/view/ViewGroup;Z)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public final buildUnfoldAnimation(Lcom/android/launcher3/uioverrides/QuickstepLauncher;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;)V
    .locals 9

    .line 1
    const-string v1, "launcher"

    .line 2
    .line 3
    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "screenSize"

    .line 7
    .line 8
    invoke-static {p3, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "anim"

    .line 12
    .line 13
    invoke-static {p4, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v6, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v7, Lcom/android/quickstep/util/unfold/g;

    .line 22
    .line 23
    invoke-direct {v7, v6, p2, p3, p4}, Lcom/android/quickstep/util/unfold/g;-><init>(Ljava/util/ArrayList;ZLandroid/graphics/Point;Lcom/android/launcher3/anim/V;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string p3, "getWorkspace(...)"

    .line 31
    .line 32
    invoke-static {v1, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    new-instance v2, Lcom/android/quickstep/util/unfold/h;

    .line 40
    .line 41
    invoke-direct {v2, v7}, Lcom/android/quickstep/util/unfold/h;-><init>(Lu4/l;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V4;->forEachVisiblePage(Ljava/util/function/Consumer;)V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-direct {p0, v1, v2, v6}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->setClipChildren(Landroid/view/ViewGroup;ZLjava/util/List;)V

    .line 49
    .line 50
    .line 51
    const/4 v2, 0x1

    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    invoke-direct {p0, v1, v2, v6}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;->setClipToPadding(Landroid/view/ViewGroup;ZLjava/util/List;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Lcom/android/launcher3/Workspace;->setPivotToScaleWithSelf(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    const/high16 v2, 0x3f800000    # 1.0f

    .line 74
    .line 75
    invoke-static {p0, p1, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    sget-object p1, Lcom/android/launcher3/G2;->c:Lcom/android/launcher3/util/y1;

    .line 80
    .line 81
    invoke-virtual {p1, v8}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const v3, 0x3f6b851f    # 0.92f

    .line 86
    .line 87
    .line 88
    const/high16 v4, 0x3f800000    # 1.0f

    .line 89
    .line 90
    move-object v0, p4

    .line 91
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 92
    .line 93
    .line 94
    sget-object p1, Lcom/android/launcher3/G2;->d:Lcom/android/launcher3/util/y1;

    .line 95
    .line 96
    invoke-virtual {p1, v8}, Lcom/android/launcher3/util/y1;->n(Ljava/lang/Integer;)Landroid/util/FloatProperty;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    move-object v1, p3

    .line 101
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 102
    .line 103
    .line 104
    move-object p1, v1

    .line 105
    if-eqz p2, :cond_1

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/android/launcher3/Hotseat;->getQsb()Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    instance-of p2, p2, Lcom/android/launcher3/util/u0;

    .line 112
    .line 113
    if-eqz p2, :cond_0

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/android/launcher3/Hotseat;->getQsb()Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    const-string p3, "null cannot be cast to non-null type com.android.launcher3.util.HorizontalInsettableView"

    .line 120
    .line 121
    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    move-object v1, p2

    .line 125
    check-cast v1, Lcom/android/launcher3/util/u0;

    .line 126
    .line 127
    sget-object v2, Lcom/android/launcher3/util/u0;->a:Landroid/util/FloatProperty;

    .line 128
    .line 129
    const v3, 0x3d23d70a    # 0.04f

    .line 130
    .line 131
    .line 132
    const/4 v4, 0x0

    .line 133
    move-object v5, p0

    .line 134
    move-object v0, p4

    .line 135
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 136
    .line 137
    .line 138
    :cond_0
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    invoke-interface {v7, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    :cond_1
    new-instance p0, Lcom/android/quickstep/util/unfold/i;

    .line 145
    .line 146
    invoke-direct {p0, v6}, Lcom/android/quickstep/util/unfold/i;-><init>(Ljava/util/ArrayList;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p4, p0}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method
