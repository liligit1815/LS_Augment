.class public final Lcom/android/quickstep/views/RecentsViewUtils;
.super Ljava/lang/Object;
.source "RecentsViewUtils.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/RecentsViewUtils$Companion;,
        Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;,
        Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/RecentsViewUtils$Companion;

.field public static final DESK_EXPLODE_PROGRESS:Lcom/android/quickstep/views/RecentsViewUtils$Companion$RecentsViewFloatProperty;

.field private static final TEMP_RECT:Landroid/graphics/Rect;


# instance fields
.field private deskExplodeProgress:F

.field private final recentsView:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field

.field private selectedTaskView:Lcom/android/quickstep/views/TaskView;

.field private final taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/RecentsViewUtils$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/RecentsViewUtils$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/RecentsViewUtils;->Companion:Lcom/android/quickstep/views/RecentsViewUtils$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/views/RecentsViewUtils$Companion$RecentsViewFloatProperty;

    .line 10
    .line 11
    sget-object v1, Lcom/android/quickstep/views/RecentsViewUtils$Companion$DESK_EXPLODE_PROGRESS$1;->INSTANCE:Lcom/android/quickstep/views/RecentsViewUtils$Companion$DESK_EXPLODE_PROGRESS$1;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/RecentsViewUtils$Companion$RecentsViewFloatProperty;-><init>(LB4/h;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/android/quickstep/views/RecentsViewUtils;->DESK_EXPLODE_PROGRESS:Lcom/android/quickstep/views/RecentsViewUtils$Companion$RecentsViewFloatProperty;

    .line 17
    .line 18
    new-instance v0, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/android/quickstep/views/RecentsViewUtils;->TEMP_RECT:Landroid/graphics/Rect;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "recentsView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 17
    .line 18
    return-void
.end method

.method public static final synthetic access$getTEMP_RECT$cp()Landroid/graphics/Rect;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/views/RecentsViewUtils;->TEMP_RECT:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object v0
.end method

.method private final getCarouselType(Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/quickstep/views/DesktopTaskView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;->DESKTOP:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;->FULL_SCREEN:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;

    .line 9
    .line 10
    return-object p0
.end method

.method private final getDesktopTaskViewCount()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    instance-of v0, p0, Ljava/util/Collection;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 33
    .line 34
    instance-of v0, v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    if-gez v1, :cond_1

    .line 41
    .line 42
    invoke-static {}, Li4/m;->q()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    return v1
.end method

.method private final getDeviceProfile()Lcom/android/launcher3/h0;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    const-string v0, "null cannot be cast to non-null type com.android.quickstep.views.RecentsViewContainer"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic getFirstTaskViewInCarousel$default(Lcom/android/quickstep/views/RecentsViewUtils;ZLcom/android/quickstep/views/TaskView;ILjava/lang/Object;)Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/RecentsViewUtils;->getFirstTaskViewInCarousel(ZLcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/views/TaskView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private final getRowRect(Landroid/view/View;Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/graphics/Rect;->setEmpty()V

    if-eqz p1, :cond_0

    .line 2
    sget-object p0, Lcom/android/quickstep/views/RecentsViewUtils;->TEMP_RECT:Landroid/graphics/Rect;

    invoke-virtual {p1, p0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 3
    invoke-virtual {p3, p0}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    :cond_0
    if-eqz p2, :cond_1

    .line 4
    sget-object p0, Lcom/android/quickstep/views/RecentsViewUtils;->TEMP_RECT:Landroid/graphics/Rect;

    invoke-virtual {p2, p0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 5
    invoke-virtual {p3, p0}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    :cond_1
    return-void
.end method

.method private final getRowRect(Lcom/android/launcher3/util/x0;Landroid/graphics/Rect;)V
    .locals 3

    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7
    invoke-virtual {p2}, Landroid/graphics/Rect;->setEmpty()V

    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/x0;->v(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewFromTaskViewId(I)Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/x0;->v(I)I

    move-result p1

    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewFromTaskViewId(I)Lcom/android/quickstep/views/TaskView;

    move-result-object p1

    .line 10
    invoke-direct {p0, v0, p1, p2}, Lcom/android/quickstep/views/RecentsViewUtils;->getRowRect(Landroid/view/View;Landroid/view/View;Landroid/graphics/Rect;)V

    return-void
.end method

.method private final getTaskMenu()Lcom/android/quickstep/views/TaskMenuView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    const/16 v0, 0x800

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of v0, p0, Lcom/android/quickstep/views/TaskMenuView;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/android/quickstep/views/TaskMenuView;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method private final onSelectedTaskViewUpdated(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/TaskView;->setModalScale(F)V

    .line 15
    .line 16
    .line 17
    :cond_1
    if-eqz p1, :cond_2

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/TaskView;->setModalPivot(Landroid/graphics/PointF;)V

    .line 21
    .line 22
    .line 23
    :cond_2
    if-nez p2, :cond_3

    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView;->mTempRect:Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->getModalTaskSize(Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/RecentsView;->getTaskBounds(Lcom/android/quickstep/views/TaskView;)Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    neg-int v0, v0

    .line 38
    iget v1, p0, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    neg-int v1, v1

    .line 41
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    neg-int v0, v0

    .line 47
    iget v1, p0, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    neg-int v1, v1

    .line 50
    invoke-virtual {p0, v0, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    int-to-float v0, v0

    .line 58
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    int-to-float v1, v1

    .line 63
    div-float/2addr v0, v1

    .line 64
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    int-to-float v1, v1

    .line 69
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    int-to-float v2, v2

    .line 74
    div-float/2addr v1, v2

    .line 75
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    new-instance v1, Landroid/graphics/PointF;

    .line 80
    .line 81
    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {p1, p0, v1}, Lcom/android/launcher3/N5;->q(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/PointF;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, v0}, Lcom/android/quickstep/views/TaskView;->setModalScale(F)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, v1}, Lcom/android/quickstep/views/TaskView;->setModalPivot(Landroid/graphics/PointF;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private final toIntArray(Ljava/util/List;)Lcom/android/launcher3/util/x0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/android/launcher3/util/x0;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/x0;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Number;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-object p0
.end method

.method private static final updateCentralTask$isInExpectedScrollPosition(Lcom/android/quickstep/views/RecentsViewUtils;Lcom/android/quickstep/views/TaskView;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->isTaskInExpectedScrollPosition(Lcom/android/quickstep/views/TaskView;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method


# virtual methods
.method public final applyAttachAlpha(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

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
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RUNNING_TASK_ATTACH_ALPHA:Landroid/util/FloatProperty;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    check-cast v2, Ljava/lang/Number;

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {p0, v1, v2, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->isVisibleInCarousel(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Z)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    const/high16 v2, 0x3f800000    # 1.0f

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    const/4 v2, 0x0

    .line 65
    :goto_1
    invoke-virtual {v1, v2}, Lcom/android/quickstep/views/TaskView;->setAttachAlpha(F)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-void
.end method

.method public final createDesktopTaskViewForActiveDesk(Lcom/android/wm/shell/shared/i;)Lcom/android/quickstep/views/DesktopTaskView;
    .locals 4

    .line 1
    const-string v0, "groupedTaskInfo"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    sget-object v1, Lcom/android/quickstep/views/TaskViewType;->DESKTOP:Lcom/android/quickstep/views/TaskViewType;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewFromPool(Lcom/android/quickstep/views/TaskViewType;)Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "null cannot be cast to non-null type com.android.quickstep.views.DesktopTaskView"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    check-cast v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->E()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "getTaskInfoList(...)"

    .line 26
    .line 27
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ljava/util/ArrayList;

    .line 31
    .line 32
    const/16 v3, 0xa

    .line 33
    .line 34
    invoke-static {v1, v3}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 39
    .line 40
    .line 41
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_0

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Landroid/app/TaskInfo;

    .line 56
    .line 57
    invoke-static {v3}, Lcom/android/systemui/shared/recents/model/Task;->from(Landroid/app/TaskInfo;)Lcom/android/systemui/shared/recents/model/Task;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    new-instance v1, Lcom/android/quickstep/util/DesktopTask;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->x()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->w()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-direct {v1, v3, p1, v2}, Lcom/android/quickstep/util/DesktopTask;-><init>(IILjava/util/List;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/android/quickstep/views/RecentsView;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 81
    .line 82
    const-string v2, "mOrientationState"

    .line 83
    .line 84
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mTaskOverlayFactory:Lcom/android/quickstep/TaskOverlayFactory;

    .line 90
    .line 91
    const-string v2, "mTaskOverlayFactory"

    .line 92
    .line 93
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1, p1, p0}, Lcom/android/quickstep/views/DesktopTaskView;->bind(Lcom/android/quickstep/util/DesktopTask;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/quickstep/TaskOverlayFactory;)V

    .line 97
    .line 98
    .line 99
    return-object v0
.end method

.method public final getAccessibilityChildren()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-static {p0}, LJ/N;->a(Landroid/view/ViewGroup;)LC4/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, LC4/h;->n(LC4/e;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Li4/m;->t0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final getActiveDeskIdOnThisDisplay()I
    .locals 2

    .line 1
    sget-object v0, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, LP1/k;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, p0}, LP1/k;->o(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public final getBottomRowIdArray()Lcom/android/launcher3/util/x0;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowTaskViews()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v2, 0xa

    .line 8
    .line 9
    invoke-static {v0, v2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

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
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/RecentsViewUtils;->toIntArray(Ljava/util/List;)Lcom/android/launcher3/util/x0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final getBottomRowTaskViews()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    move-object v3, v2

    .line 23
    check-cast v3, Lcom/android/quickstep/views/TaskView;

    .line 24
    .line 25
    iget-object v4, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    iget-object v4, v4, Lcom/android/quickstep/views/RecentsView;->mTopRowIdSet:Lcom/android/launcher3/util/z0;

    .line 28
    .line 29
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_0

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_0

    .line 44
    .line 45
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-object v1
.end method

.method public final getDeskExplodeProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->deskExplodeProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getDesktopTaskViewForDeskId(I)Lcom/android/quickstep/views/DesktopTaskView;
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-object v1

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    move-object v2, v0

    .line 23
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 24
    .line 25
    instance-of v3, v2, Lcom/android/quickstep/views/DesktopTaskView;

    .line 26
    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    check-cast v2, Lcom/android/quickstep/views/DesktopTaskView;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/android/quickstep/views/DesktopTaskView;->getDeskId()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-ne v2, p1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    move-object v0, v1

    .line 39
    :goto_0
    instance-of p0, v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    check-cast v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_3
    return-object v1
.end method

.method public final getExpectedCurrentTask(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/views/TaskView;
    .locals 2

    .line 1
    if-nez p1, :cond_4

    .line 2
    .line 3
    if-nez p2, :cond_3

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    move-object v0, p2

    .line 22
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 23
    .line 24
    instance-of v1, v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/y0;->V()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isExternalDisplay()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 p2, 0x0

    .line 42
    :cond_2
    :goto_0
    check-cast p2, Lcom/android/quickstep/views/TaskView;

    .line 43
    .line 44
    if-nez p2, :cond_3

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 47
    .line 48
    invoke-static {p0}, Li4/m;->n0(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Lcom/android/quickstep/views/TaskView;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_3
    return-object p2

    .line 56
    :cond_4
    return-object p1
.end method

.method public final getFirstLargeTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
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
    move-object v2, v1

    .line 18
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->isSplitSelectionActive()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    instance-of v2, v2, Lcom/android/quickstep/views/DesktopTaskView;

    .line 35
    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v1, 0x0

    .line 40
    :cond_2
    :goto_0
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 41
    .line 42
    return-object v1
.end method

.method public final getFirstNonDesktopTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->C()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    move-object v1, v0

    .line 24
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 25
    .line 26
    instance-of v1, v1, Lcom/android/quickstep/views/DesktopTaskView;

    .line 27
    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v0, 0x0

    .line 32
    :goto_0
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 36
    .line 37
    invoke-static {p0}, Li4/m;->b0(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/android/quickstep/views/TaskView;

    .line 42
    .line 43
    return-object p0
.end method

.method public final getFirstSmallTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    move-object v1, v0

    .line 18
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_0
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 29
    .line 30
    return-object v0
.end method

.method public final getFirstTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-static {p0}, Li4/m;->b0(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    return-object p0
.end method

.method public final getFirstTaskViewInCarousel(Z)Lcom/android/quickstep/views/TaskView;
    .locals 2

    .line 1
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/RecentsViewUtils;->getFirstTaskViewInCarousel$default(Lcom/android/quickstep/views/RecentsViewUtils;ZLcom/android/quickstep/views/TaskView;ILjava/lang/Object;)Lcom/android/quickstep/views/TaskView;

    move-result-object p0

    return-object p0
.end method

.method public final getFirstTaskViewInCarousel(ZLcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/views/TaskView;
    .locals 3

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 4
    invoke-virtual {p0, v2, p2, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->isVisibleInCarousel(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 5
    :goto_0
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    return-object v1
.end method

.method public final getGridTaskCount()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    instance-of v0, p0, Ljava/util/Collection;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridTask()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    if-gez v1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Li4/m;->q()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return v1
.end method

.method public final getLargeTaskViewIds()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    move-object v2, v1

    .line 23
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance p0, Ljava/util/ArrayList;

    .line 36
    .line 37
    const/16 v1, 0xa

    .line 38
    .line 39
    invoke-static {v0, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-interface {p0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    return-object p0
.end method

.method public final getLargeTaskViews()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    move-object v2, v1

    .line 23
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method

.method public final getLargeTileCount()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    instance-of v0, p0, Ljava/util/Collection;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    if-gez v1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Li4/m;->q()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return v1
.end method

.method public final getLastLargeTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    move-object v2, v1

    .line 19
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    move-object v0, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 30
    .line 31
    return-object v0
.end method

.method public final getLastTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-static {p0}, Li4/m;->n0(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    return-object p0
.end method

.method public final getLastTaskViewInCarousel(Z)Lcom/android/quickstep/views/TaskView;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    move-object v3, v2

    .line 19
    check-cast v3, Lcom/android/quickstep/views/TaskView;

    .line 20
    .line 21
    iget-object v4, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {p0, v3, v4, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->isVisibleInCarousel(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Z)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    move-object v1, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 36
    .line 37
    return-object v1
.end method

.method public final getNonDesktopTaskViewCount()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    instance-of v0, p0, Ljava/util/Collection;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 33
    .line 34
    instance-of v0, v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    if-gez v1, :cond_1

    .line 41
    .line 42
    invoke-static {}, Li4/m;->q()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    return v1
.end method

.method public final getRunningTaskExpectedIndex(Lcom/android/quickstep/views/TaskView;)I
    .locals 6

    .line 1
    const-string v0, "runningTaskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/DesksUtils$Companion;->areMultiDesksFlagsEnabled()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    instance-of v0, p1, Lcom/android/quickstep/views/DesktopTaskView;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    move-object v3, v2

    .line 36
    check-cast v3, Lcom/android/quickstep/views/TaskView;

    .line 37
    .line 38
    instance-of v4, v3, Lcom/android/quickstep/views/DesktopTaskView;

    .line 39
    .line 40
    if-eqz v4, :cond_0

    .line 41
    .line 42
    check-cast v3, Lcom/android/quickstep/views/DesktopTaskView;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/android/quickstep/views/DesktopTaskView;->getDeskId()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eq v4, v1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/android/quickstep/views/DesktopTaskView;->getDeskId()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    move-object v4, p1

    .line 55
    check-cast v4, Lcom/android/quickstep/views/DesktopTaskView;

    .line 56
    .line 57
    invoke-virtual {v4}, Lcom/android/quickstep/views/DesktopTaskView;->getDeskId()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-gt v3, v4, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const/4 v2, 0x0

    .line 65
    :goto_0
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 66
    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 70
    .line 71
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    return p0

    .line 76
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->G0:Z

    .line 91
    .line 92
    if-eqz v2, :cond_f

    .line 93
    .line 94
    invoke-static {}, Lcom/android/launcher3/y0;->C()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    const/4 v2, 0x0

    .line 99
    if-eqz v1, :cond_a

    .line 100
    .line 101
    instance-of v1, p1, Lcom/android/quickstep/views/DesktopTaskView;

    .line 102
    .line 103
    if-nez v1, :cond_a

    .line 104
    .line 105
    invoke-static {}, Lcom/android/launcher3/y0;->V()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_8

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isExternalDisplay()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_5

    .line 116
    .line 117
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 118
    .line 119
    instance-of v3, v1, Ljava/util/Collection;

    .line 120
    .line 121
    if-eqz v3, :cond_3

    .line 122
    .line 123
    move-object v3, v1

    .line 124
    check-cast v3, Ljava/util/Collection;

    .line 125
    .line 126
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-eqz v3, :cond_3

    .line 131
    .line 132
    :goto_1
    move v3, v2

    .line 133
    goto :goto_4

    .line 134
    :cond_3
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    move v3, v2

    .line 139
    :cond_4
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-eqz v4, :cond_9

    .line 144
    .line 145
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    check-cast v4, Lcom/android/quickstep/views/TaskView;

    .line 150
    .line 151
    instance-of v5, v4, Lcom/android/quickstep/views/DesktopTaskView;

    .line 152
    .line 153
    if-eqz v5, :cond_4

    .line 154
    .line 155
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskView;->isExternalDisplay()Z

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    if-eqz v4, :cond_4

    .line 160
    .line 161
    add-int/lit8 v3, v3, 0x1

    .line 162
    .line 163
    if-gez v3, :cond_4

    .line 164
    .line 165
    invoke-static {}, Li4/m;->q()V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_5
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 170
    .line 171
    instance-of v3, v1, Ljava/util/Collection;

    .line 172
    .line 173
    if-eqz v3, :cond_6

    .line 174
    .line 175
    move-object v3, v1

    .line 176
    check-cast v3, Ljava/util/Collection;

    .line 177
    .line 178
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    if-eqz v3, :cond_6

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_6
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    move v3, v2

    .line 190
    :cond_7
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    if-eqz v4, :cond_9

    .line 195
    .line 196
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    check-cast v4, Lcom/android/quickstep/views/TaskView;

    .line 201
    .line 202
    instance-of v5, v4, Lcom/android/quickstep/views/DesktopTaskView;

    .line 203
    .line 204
    if-eqz v5, :cond_7

    .line 205
    .line 206
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskView;->isExternalDisplay()Z

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    if-nez v4, :cond_7

    .line 211
    .line 212
    add-int/lit8 v3, v3, 0x1

    .line 213
    .line 214
    if-gez v3, :cond_7

    .line 215
    .line 216
    invoke-static {}, Li4/m;->q()V

    .line 217
    .line 218
    .line 219
    goto :goto_3

    .line 220
    :cond_8
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getDesktopTaskViewCount()I

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    :cond_9
    :goto_4
    add-int/2addr v0, v3

    .line 225
    :cond_a
    invoke-static {}, Lcom/android/launcher3/y0;->V()Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    if-eqz v1, :cond_e

    .line 230
    .line 231
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isExternalDisplay()Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-nez p1, :cond_e

    .line 236
    .line 237
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 238
    .line 239
    instance-of p1, p0, Ljava/util/Collection;

    .line 240
    .line 241
    if-eqz p1, :cond_b

    .line 242
    .line 243
    move-object p1, p0

    .line 244
    check-cast p1, Ljava/util/Collection;

    .line 245
    .line 246
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    if-eqz p1, :cond_b

    .line 251
    .line 252
    goto :goto_6

    .line 253
    :cond_b
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    :cond_c
    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    if-eqz p1, :cond_d

    .line 262
    .line 263
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 268
    .line 269
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->isExternalDisplay()Z

    .line 270
    .line 271
    .line 272
    move-result p1

    .line 273
    if-eqz p1, :cond_c

    .line 274
    .line 275
    add-int/lit8 v2, v2, 0x1

    .line 276
    .line 277
    if-gez v2, :cond_c

    .line 278
    .line 279
    invoke-static {}, Li4/m;->q()V

    .line 280
    .line 281
    .line 282
    goto :goto_5

    .line 283
    :cond_d
    :goto_6
    add-int/2addr v0, v2

    .line 284
    :cond_e
    return v0

    .line 285
    :cond_f
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 286
    .line 287
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 288
    .line 289
    .line 290
    move-result p0

    .line 291
    if-eq p0, v1, :cond_10

    .line 292
    .line 293
    return p0

    .line 294
    :cond_10
    return v0
.end method

.method public final getSelectedTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->selectedTaskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainerById(I)Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public final getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTopRowIdArray()Lcom/android/launcher3/util/x0;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowTaskViews()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v2, 0xa

    .line 8
    .line 9
    invoke-static {v0, v2}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

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
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-direct {p0, v1}, Lcom/android/quickstep/views/RecentsViewUtils;->toIntArray(Ljava/util/List;)Lcom/android/launcher3/util/x0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final getTopRowTaskViews()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    move-object v3, v2

    .line 23
    check-cast v3, Lcom/android/quickstep/views/TaskView;

    .line 24
    .line 25
    iget-object v4, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    iget-object v4, v4, Lcom/android/quickstep/views/RecentsView;->mTopRowIdSet:Lcom/android/launcher3/util/z0;

    .line 28
    .line 29
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskView;->getTaskViewId()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v4, v3}, Lcom/android/launcher3/util/z0;->contains(I)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-object v1
.end method

.method public final hasTaskViews()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    invoke-static {p0}, Li4/m;->O(Ljava/lang/Iterable;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final isAnySmallTaskFullyVisible()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 2
    .line 3
    instance-of v1, v0, Ljava/util/Collection;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    move-object v1, v0

    .line 9
    check-cast v1, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    return v2

    .line 18
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 41
    .line 42
    invoke-virtual {v3, v1}, Lcom/android/quickstep/views/RecentsView;->isTaskViewFullyVisible(Lcom/android/quickstep/views/TaskView;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_2
    return v2
.end method

.method public final isVisibleInCarousel(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;Z)Z
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->getCarouselType(Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0, p2}, Lcom/android/quickstep/views/RecentsViewUtils;->getCarouselType(Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/views/RecentsViewUtils$TaskViewCarousel;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-ne p1, p0, :cond_1

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final screenshotTasks(Lcom/android/quickstep/views/TaskView;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRecentsAnimationController()Lcom/android/quickstep/RecentsAnimationController;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Li4/F;->d()Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/16 v0, 0xa

    .line 24
    .line 25
    invoke-static {p1, v0}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-static {v0}, Li4/F;->a(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/16 v1, 0x10

    .line 34
    .line 35
    invoke-static {v0, v1}, LA4/d;->c(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 40
    .line 41
    invoke-direct {v1, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget-object v2, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 65
    .line 66
    iget v2, v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 67
    .line 68
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 77
    .line 78
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationController;->screenshotTask(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v2, v0}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Lh4/l;->c()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v0}, Lh4/l;->d()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    return-object v1
.end method

.method public final setDeskExplodeProgress(F)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->deskExplodeProgress:F

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    instance-of v2, v1, Lcom/android/quickstep/views/DesktopTaskView;

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 47
    .line 48
    iget v1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->deskExplodeProgress:F

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/DesktopTaskView;->setExplodeProgress(F)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    return-void
.end method

.method public final setSelectedTaskView(Lcom/android/quickstep/views/TaskView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->selectedTaskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsViewUtils;->selectedTaskView:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->onSelectedTaskViewUpdated(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final shouldInterceptKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getTaskMenu()Lcom/android/quickstep/views/TaskMenuView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x1

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-ne p0, v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/16 p1, 0x3d

    .line 32
    .line 33
    if-ne p0, p1, :cond_1

    .line 34
    .line 35
    :goto_0
    return v0

    .line 36
    :cond_1
    return v1
.end method

.method public final sortDesktopTasksToFront(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "tasks"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    move-object v2, v1

    .line 31
    check-cast v2, Lcom/android/quickstep/util/GroupTask;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/android/quickstep/util/GroupTask;->taskViewType:Lcom/android/quickstep/views/TaskViewType;

    .line 34
    .line 35
    sget-object v3, Lcom/android/quickstep/views/TaskViewType;->DESKTOP:Lcom/android/quickstep/views/TaskViewType;

    .line 36
    .line 37
    if-ne v2, v3, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance p1, Lh4/l;

    .line 48
    .line 49
    invoke-direct {p1, p0, v0}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Lh4/l;->a()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/util/List;

    .line 57
    .line 58
    invoke-virtual {p1}, Lh4/l;->b()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Ljava/util/List;

    .line 63
    .line 64
    sget-object v0, Lcom/android/quickstep/util/DesksUtils;->Companion:Lcom/android/quickstep/util/DesksUtils$Companion;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/android/quickstep/util/DesksUtils$Companion;->areMultiDesksFlagsEnabled()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    new-instance v0, Lcom/android/quickstep/views/RecentsViewUtils$sortDesktopTasksToFront$$inlined$sortedBy$1;

    .line 73
    .line 74
    invoke-direct {v0}, Lcom/android/quickstep/views/RecentsViewUtils$sortDesktopTasksToFront$$inlined$sortedBy$1;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {p0, v0}, Li4/m;->x0(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    :cond_2
    invoke-static {p1, p0}, Li4/m;->r0(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method public final sortExternalDisplayTasksToFront(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "tasks"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    move-object v2, v1

    .line 31
    check-cast v2, Lcom/android/quickstep/util/GroupTask;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Li4/m;->d0(Ljava/util/List;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/android/systemui/shared/recents/model/Task;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/android/quickstep/util/ExternalDisplaysKt;->isExternalDisplay(Lcom/android/systemui/shared/recents/model/Task;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance p1, Lh4/l;

    .line 58
    .line 59
    invoke-direct {p1, p0, v0}, Lh4/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lh4/l;->a()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ljava/util/List;

    .line 67
    .line 68
    invoke-virtual {p1}, Lh4/l;->b()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Ljava/util/List;

    .line 73
    .line 74
    invoke-static {p1, p0}, Li4/m;->r0(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public final updateCentralTask()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 19
    :goto_1
    iget-object v2, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getFocusedTaskView()Lcom/android/quickstep/views/TaskView;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-static {p0, v2}, Lcom/android/quickstep/views/RecentsViewUtils;->updateCentralTask$isInExpectedScrollPosition(Lcom/android/quickstep/views/RecentsViewUtils;Lcom/android/quickstep/views/TaskView;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskView;->getTaskIdSet()Ljava/util/Set;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    goto :goto_2

    .line 54
    :cond_3
    invoke-static {p0, v3}, Lcom/android/quickstep/views/RecentsViewUtils;->updateCentralTask$isInExpectedScrollPosition(Lcom/android/quickstep/views/RecentsViewUtils;Lcom/android/quickstep/views/TaskView;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskView;->getTaskIdSet()Ljava/util/Set;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    goto :goto_2

    .line 68
    :cond_4
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :goto_2
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mRecentsViewModel:Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->updateCentralTaskIds(Ljava/util/Set;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final updateChildTaskOrientations()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViews()Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "getTaskViews(...)"

    .line 8
    .line 9
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 27
    .line 28
    iget-object v3, v0, Lcom/android/quickstep/views/RecentsView;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 29
    .line 30
    const-string v4, "mOrientationState"

    .line 31
    .line 32
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v3}, Lcom/android/quickstep/views/TaskView;->setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-static {v0}, LJ/N;->a(Landroid/view/ViewGroup;)LC4/e;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1}, LC4/e;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Landroid/view/View;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->isRtl()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    xor-int/lit8 v3, v3, 0x1

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutDirection(I)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    iget-object v0, v0, Lcom/android/quickstep/views/RecentsView;->mOrientationState:Lcom/android/quickstep/util/RecentsOrientedState;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/quickstep/util/RecentsOrientedState;->isRecentsActivityRotationAllowed()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getTaskMenu()Lcom/android/quickstep/views/TaskMenuView;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskMenuView;->onRotationChanged()V

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public final updateTaskViewDeadZoneRect(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    const-string v0, "outTaskViewRowRect"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "outTopRowRect"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "outBottomRowRect"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->b()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->taskViews:Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/android/quickstep/views/TaskView;

    .line 54
    .line 55
    sget-object v1, Lcom/android/quickstep/views/RecentsViewUtils;->TEMP_RECT:Landroid/graphics/Rect;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getHitRect(Landroid/graphics/Rect;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->setEmpty()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p3}, Landroid/graphics/Rect;->setEmpty()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getLastTaskView()Lcom/android/quickstep/views/TaskView;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-direct {p0, p2, p3, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->getRowRect(Landroid/view/View;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getFirstLargeTaskView()Lcom/android/quickstep/views/TaskView;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getLastLargeTaskView()Lcom/android/quickstep/views/TaskView;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-direct {p0, v0, v1, p1}, Lcom/android/quickstep/views/RecentsViewUtils;->getRowRect(Landroid/view/View;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getTopRowIdArray()Lcom/android/launcher3/util/x0;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-direct {p0, v0, p2}, Lcom/android/quickstep/views/RecentsViewUtils;->getRowRect(Lcom/android/launcher3/util/x0;Landroid/graphics/Rect;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsViewUtils;->getBottomRowIdArray()Lcom/android/launcher3/util/x0;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-direct {p0, v0, p3}, Lcom/android/quickstep/views/RecentsViewUtils;->getRowRect(Lcom/android/launcher3/util/x0;Landroid/graphics/Rect;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2}, Landroid/graphics/Rect;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_3

    .line 113
    .line 114
    move-object v0, p2

    .line 115
    goto :goto_1

    .line 116
    :cond_3
    invoke-virtual {p3}, Landroid/graphics/Rect;->isEmpty()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_8

    .line 121
    .line 122
    move-object v0, p3

    .line 123
    :goto_1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isRtl()Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_4

    .line 130
    .line 131
    iget p0, p1, Landroid/graphics/Rect;->left:I

    .line 132
    .line 133
    iget v0, v0, Landroid/graphics/Rect;->right:I

    .line 134
    .line 135
    if-le p0, v0, :cond_5

    .line 136
    .line 137
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_4
    iget p0, p1, Landroid/graphics/Rect;->right:I

    .line 141
    .line 142
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 143
    .line 144
    if-ge p0, v0, :cond_5

    .line 145
    .line 146
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 147
    .line 148
    :cond_5
    :goto_2
    invoke-virtual {p2}, Landroid/graphics/Rect;->isEmpty()Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-nez p0, :cond_8

    .line 153
    .line 154
    invoke-virtual {p3}, Landroid/graphics/Rect;->isEmpty()Z

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    if-eqz p0, :cond_6

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_6
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-gt p0, p1, :cond_7

    .line 170
    .line 171
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 172
    .line 173
    iget p1, p3, Landroid/graphics/Rect;->top:I

    .line 174
    .line 175
    if-ge p0, p1, :cond_8

    .line 176
    .line 177
    iput p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 178
    .line 179
    return-void

    .line 180
    :cond_7
    iget p0, p3, Landroid/graphics/Rect;->top:I

    .line 181
    .line 182
    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 183
    .line 184
    if-le p0, p1, :cond_8

    .line 185
    .line 186
    iput p1, p3, Landroid/graphics/Rect;->top:I

    .line 187
    .line 188
    :cond_8
    :goto_3
    return-void
.end method
