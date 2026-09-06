.class public Lcom/android/launcher3/testing/TestInformationHandler;
.super Ljava/lang/Object;
.source "TestInformationHandler.java"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/testing/TestInformationHandler$c;
    }
.end annotation


# static fields
.field private static final sActivities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static sActivitiesCreatedCount:I

.field private static sActivityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

.field private static sEvents:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mDeviceProfile:Lcom/android/launcher3/h0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/android/launcher3/testing/TestInformationHandler;->sActivities:Ljava/util/Set;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    sput v0, Lcom/android/launcher3/testing/TestInformationHandler;->sActivitiesCreatedCount:I

    .line 18
    .line 19
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

.method static bridge synthetic A()Ljava/util/Set;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/testing/TestInformationHandler;->sActivities:Ljava/util/Set;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic B()I
    .locals 1

    .line 1
    sget v0, Lcom/android/launcher3/testing/TestInformationHandler;->sActivitiesCreatedCount:I

    .line 2
    .line 3
    return v0
.end method

.method static bridge synthetic C(I)V
    .locals 0

    .line 1
    sput p0, Lcom/android/launcher3/testing/TestInformationHandler;->sActivitiesCreatedCount:I

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic a(Ljava/util/function/Supplier;Ljava/util/function/Function;Lcom/android/launcher3/testing/TestInformationHandler$c;)Landroid/os/Bundle;
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-interface {p1, p0}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "response"

    .line 19
    .line 20
    invoke-interface {p2, p1, v0, p0}, Lcom/android/launcher3/testing/TestInformationHandler$c;->a(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-object p1
.end method

.method public static synthetic b(Lcom/android/launcher3/testing/TestInformationHandler;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->lambda$call$1(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/launcher3/testing/TestInformationHandler;Lcom/android/launcher3/F1;Lcom/android/launcher3/C2;)Landroid/graphics/Point;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/testing/TestInformationHandler;->lambda$call$13(Lcom/android/launcher3/F1;Lcom/android/launcher3/C2;)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static createFinalizationObserver(Ljava/util/concurrent/CountDownLatch;)V
    .locals 1
    .annotation build Le/a;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/testing/TestInformationHandler$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/testing/TestInformationHandler$b;-><init>(Ljava/util/concurrent/CountDownLatch;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->t1(Lcom/android/launcher3/v;)Lcom/android/launcher3/widget/picker/WidgetsRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/D;->p()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic f(Lcom/android/launcher3/C2;)Ljava/util/ArrayList;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-object v0
.end method

.method public static synthetic g()Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object v0
.end method

.method private static getDescendantRectRelativeToDragLayerForCell(Lcom/android/launcher3/C2;Lcom/android/launcher3/CellLayout;IIII)Landroid/graphics/Rect;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v5, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 8
    .line 9
    .line 10
    move-object v0, p1

    .line 11
    move v1, p2

    .line 12
    move v2, p3

    .line 13
    move v3, p4

    .line 14
    move v4, p5

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/CellLayout;->r(IIIILandroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    iget p1, v5, Landroid/graphics/Rect;->left:I

    .line 19
    .line 20
    iget p2, v5, Landroid/graphics/Rect;->top:I

    .line 21
    .line 22
    filled-new-array {p1, p2}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget p2, v5, Landroid/graphics/Rect;->right:I

    .line 27
    .line 28
    iget p3, v5, Landroid/graphics/Rect;->bottom:I

    .line 29
    .line 30
    filled-new-array {p2, p3}, [I

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0, p2}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[I)F

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    aget p3, p1, p0

    .line 42
    .line 43
    const/4 p4, 0x1

    .line 44
    aget p1, p1, p4

    .line 45
    .line 46
    aget p0, p2, p0

    .line 47
    .line 48
    aget p2, p2, p4

    .line 49
    .line 50
    invoke-virtual {v5, p3, p1, p0, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 51
    .line 52
    .line 53
    return-object v5
.end method

.method protected static getFromExecutorSync(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/util/concurrent/Callable<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    new-instance p1, Ljava/lang/RuntimeException;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    throw p1
.end method

.method public static getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/launcher3/testing/TestInformationHandler$c<",
            "TT;>;",
            "Ljava/util/function/Function<",
            "Lcom/android/launcher3/C2;",
            "TT;>;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/testing/a;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lcom/android/launcher3/testing/a;-><init>(Lcom/android/launcher3/util/H$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1, v1}, Lcom/android/launcher3/testing/TestInformationHandler;->getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method protected static getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/launcher3/testing/TestInformationHandler$c<",
            "TT;>;",
            "Ljava/util/function/Function<",
            "TS;TT;>;",
            "Ljava/util/function/Supplier<",
            "TS;>;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/testing/l;

    .line 4
    .line 5
    invoke-direct {v1, p2, p1, p0}, Lcom/android/launcher3/testing/l;-><init>(Ljava/util/function/Supplier;Ljava/util/function/Function;Lcom/android/launcher3/testing/TestInformationHandler$c;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/TestInformationHandler;->getFromExecutorSync(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/os/Bundle;

    .line 13
    .line 14
    return-object p0
.end method

.method public static synthetic h(ILcom/android/launcher3/C2;)Landroid/graphics/Point;
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    const/4 v5, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x1

    .line 8
    move v2, p0

    .line 9
    move-object v0, p1

    .line 10
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/testing/TestInformationHandler;->getDescendantRectRelativeToDragLayerForCell(Lcom/android/launcher3/C2;Lcom/android/launcher3/CellLayout;IIII)Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Landroid/graphics/Point;

    .line 15
    .line 16
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    iget v1, p0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    sub-int/2addr v1, v0

    .line 21
    div-int/lit8 v1, v1, 0x3

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    iget v1, p0, Landroid/graphics/Rect;->top:I

    .line 25
    .line 26
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 27
    .line 28
    sub-int/2addr p0, v1

    .line 29
    div-int/lit8 p0, p0, 0x3

    .line 30
    .line 31
    add-int/2addr v1, p0

    .line 32
    invoke-direct {p1, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 33
    .line 34
    .line 35
    return-object p1
.end method

.method public static synthetic i(Landroid/app/Activity;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, " ("

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string p0, "destroyed"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p0, "current"

    .line 32
    .line 33
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, ")"

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static synthetic j(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getBottom()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBottom()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    sub-int/2addr v0, v1

    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    add-int/2addr v0, p0

    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic k(Landroid/view/WindowInsets;)Landroid/graphics/Insets;
    .locals 2

    .line 1
    invoke-static {p0}, LJ/Y;->v(Landroid/view/WindowInsets;)LJ/Y;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, LJ/Y$k;->c()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {}, LJ/Y$k;->i()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    or-int/2addr v0, v1

    .line 14
    invoke-virtual {p0, v0}, LJ/Y;->f(I)LB/b;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, LB/b;->d()Landroid/graphics/Insets;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic l(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getClipBounds()Landroid/graphics/Rect;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method private synthetic lambda$call$1(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/testing/TestInformationHandler;->isLauncherInitialized()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic lambda$call$13(Lcom/android/launcher3/F1;Lcom/android/launcher3/C2;)Landroid/graphics/Point;
    .locals 1

    .line 1
    new-instance p2, Landroid/graphics/Point;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->H0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    iget v0, p1, Lcom/android/launcher3/F1;->H0:I

    .line 14
    .line 15
    mul-int/2addr p0, v0

    .line 16
    iget p1, p1, Lcom/android/launcher3/F1;->G0:I

    .line 17
    .line 18
    invoke-direct {p2, p0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 19
    .line 20
    .line 21
    return-object p2
.end method

.method private synthetic lambda$call$20()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lz1/k2;->j()V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/Q3;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/android/launcher3/Q3;-><init>(Lcom/android/launcher3/D3;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic lambda$call$21()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lz1/k2;->j()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lz1/k2;->f()V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 26
    .line 27
    new-instance v1, Lcom/android/launcher3/Q3;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Lcom/android/launcher3/Q3;-><init>(Lcom/android/launcher3/D3;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic n(Landroid/view/WindowInsets;)Landroid/graphics/Insets;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Landroid/graphics/Insets;->NONE:Landroid/graphics/Insets;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getSystemGestureInsets()Landroid/graphics/Insets;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getSystemWindowInsets()Landroid/graphics/Insets;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Landroid/graphics/Insets;->max(Landroid/graphics/Insets;Landroid/graphics/Insets;)Landroid/graphics/Insets;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static newInstance(Landroid/content/Context;)Lcom/android/launcher3/testing/TestInformationHandler;
    .locals 2

    .line 1
    const-class v0, Lcom/android/launcher3/testing/TestInformationHandler;

    .line 2
    .line 3
    const v1, 0x7f14043b

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0, v1}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/testing/TestInformationHandler;

    .line 11
    .line 12
    return-object p0
.end method

.method public static synthetic o(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/H;->getCreatedContext()Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->s2()LQ1/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v0, p0}, LQ1/d;->d(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic p(I)[Ljava/lang/String;
    .locals 0

    .line 1
    new-array p0, p0, [Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(Lcom/android/launcher3/C2;)[I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    filled-new-array {v0, p0}, [I

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic r(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sub-float/2addr v0, v1

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/G;->n()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    mul-float/2addr p0, v0

    .line 23
    float-to-int p0, p0

    .line 24
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method private static runGcAndFinalizersSync()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Runtime;->gc()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Runtime;->runFinalization()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Lcom/android/launcher3/testing/TestInformationHandler;->createFinalizationObserver(Ljava/util/concurrent/CountDownLatch;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Runtime;->gc()V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ljava/lang/Runtime;->runFinalization()V

    .line 36
    .line 37
    .line 38
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 39
    .line 40
    const-wide/16 v2, 0x64

    .line 41
    .line 42
    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 43
    .line 44
    .line 45
    move-result v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    new-instance v1, Ljava/lang/RuntimeException;

    .line 51
    .line 52
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    throw v1
.end method

.method public static synthetic s(Landroid/graphics/Rect;Lcom/android/launcher3/C2;)Landroid/graphics/Point;
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move-object v2, v0

    .line 14
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 15
    .line 16
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    iget v4, p0, Landroid/graphics/Rect;->top:I

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    move-object v1, p1

    .line 29
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/testing/TestInformationHandler;->getDescendantRectRelativeToDragLayerForCell(Lcom/android/launcher3/C2;Lcom/android/launcher3/CellLayout;IIII)Landroid/graphics/Rect;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Landroid/graphics/Point;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerX()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-direct {p1, v0, p0}, Landroid/graphics/Point;-><init>(II)V

    .line 44
    .line 45
    .line 46
    return-object p1
.end method

.method public static synthetic t(Lcom/android/launcher3/C2;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isStarted()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic u(Lcom/android/launcher3/testing/TestInformationHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/testing/TestInformationHandler;->lambda$call$20()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/testing/TestInformationHandler;->sEvents:Ljava/util/Collection;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const/16 p0, 0x2f

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {v0, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0

    .line 34
    :cond_0
    return-void
.end method

.method public static synthetic x(Lcom/android/launcher3/C2;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/D;->l(I)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic y(Lcom/android/launcher3/testing/TestInformationHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/testing/TestInformationHandler;->lambda$call$21()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z(Lcom/android/launcher3/C2;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/D;->i(I)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0
.end method


# virtual methods
.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    new-instance v2, Landroid/os/Bundle;

    .line 4
    .line 5
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 6
    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/os/Bundle;->getClassLoader()Ljava/lang/ClassLoader;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p3, v3}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    const/4 v4, -0x1

    .line 32
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    sparse-switch v5, :sswitch_data_0

    .line 37
    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :sswitch_0
    const-string v5, "start-drag-threshold"

    .line 42
    .line 43
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_1
    const/16 v4, 0x2f

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :sswitch_1
    const-string v5, "icon-height"

    .line 56
    .line 57
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :cond_2
    const/16 v4, 0x2e

    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :sswitch_2
    const-string v5, "hotseat-cell-center"

    .line 70
    .line 71
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_3

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :cond_3
    const/16 v4, 0x2d

    .line 80
    .line 81
    goto/16 :goto_0

    .line 82
    .line 83
    :sswitch_3
    const-string v5, "enable-grid-only-overview"

    .line 84
    .line 85
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_4

    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :cond_4
    const/16 v4, 0x2c

    .line 94
    .line 95
    goto/16 :goto_0

    .line 96
    .line 97
    :sswitch_4
    const-string v5, "get-hotseat-icon-names"

    .line 98
    .line 99
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-nez p1, :cond_5

    .line 104
    .line 105
    goto/16 :goto_0

    .line 106
    .line 107
    :cond_5
    const/16 v4, 0x2b

    .line 108
    .line 109
    goto/16 :goto_0

    .line 110
    .line 111
    :sswitch_5
    const-string v5, "get-activities-created-count"

    .line 112
    .line 113
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_6

    .line 118
    .line 119
    goto/16 :goto_0

    .line 120
    .line 121
    :cond_6
    const/16 v4, 0x2a

    .line 122
    .line 123
    goto/16 :goto_0

    .line 124
    .line 125
    :sswitch_6
    const-string v5, "is-launcher-activity-started"

    .line 126
    .line 127
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-nez p1, :cond_7

    .line 132
    .line 133
    goto/16 :goto_0

    .line 134
    .line 135
    :cond_7
    const/16 v4, 0x29

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :sswitch_7
    const-string v5, "get-test-events"

    .line 140
    .line 141
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_8

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_8
    const/16 v4, 0x28

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_8
    const-string v5, "all-apps-bottom-padding"

    .line 154
    .line 155
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-nez p1, :cond_9

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_9
    const/16 v4, 0x27

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :sswitch_9
    const-string v5, "is-predictive-back-swipe-enabled"

    .line 168
    .line 169
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-nez p1, :cond_a

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_a
    const/16 v4, 0x26

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_a
    const-string v5, "freeze-app-list"

    .line 182
    .line 183
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-nez p1, :cond_b

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_b
    const/16 v4, 0x25

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :sswitch_b
    const-string v5, "target-insets"

    .line 196
    .line 197
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-nez p1, :cond_c

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :cond_c
    const/16 v4, 0x24

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :sswitch_c
    const-string v5, "is-transient-taskbar"

    .line 210
    .line 211
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-nez p1, :cond_d

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_d
    const/16 v4, 0x23

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :sswitch_d
    const-string v5, "has-touch-interaction-service"

    .line 224
    .line 225
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-nez p1, :cond_e

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :cond_e
    const/16 v4, 0x22

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_e
    const-string v5, "taskbar-shown-on-home"

    .line 238
    .line 239
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-nez p1, :cond_f

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :cond_f
    const/16 v4, 0x21

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :sswitch_f
    const-string v5, "workspace-cell-center"

    .line 252
    .line 253
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-nez p1, :cond_10

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :cond_10
    const/16 v4, 0x20

    .line 262
    .line 263
    goto/16 :goto_0

    .line 264
    .line 265
    :sswitch_10
    const-string v5, "widgets-scroll-y"

    .line 266
    .line 267
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    if-nez p1, :cond_11

    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :cond_11
    const/16 v4, 0x1f

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_11
    const-string v5, "get-activities"

    .line 280
    .line 281
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-nez p1, :cond_12

    .line 286
    .line 287
    goto/16 :goto_0

    .line 288
    .line 289
    :cond_12
    const/16 v4, 0x1e

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_12
    const-string v5, "get-split-selection-active"

    .line 294
    .line 295
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    if-nez p1, :cond_13

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :cond_13
    const/16 v4, 0x1d

    .line 304
    .line 305
    goto/16 :goto_0

    .line 306
    .line 307
    :sswitch_13
    const-string v5, "home-to-all-apps-swipe-height"

    .line 308
    .line 309
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-nez p1, :cond_14

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :cond_14
    const/16 v4, 0x1c

    .line 318
    .line 319
    goto/16 :goto_0

    .line 320
    .line 321
    :sswitch_14
    const-string v5, "all-apps-top-padding"

    .line 322
    .line 323
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result p1

    .line 327
    if-nez p1, :cond_15

    .line 328
    .line 329
    goto/16 :goto_0

    .line 330
    .line 331
    :cond_15
    const/16 v4, 0x1b

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :sswitch_15
    const-string v5, "model-queue-cleared"

    .line 336
    .line 337
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    if-nez p1, :cond_16

    .line 342
    .line 343
    goto/16 :goto_0

    .line 344
    .line 345
    :cond_16
    const/16 v4, 0x1a

    .line 346
    .line 347
    goto/16 :goto_0

    .line 348
    .line 349
    :sswitch_16
    const-string v5, "workspace-columns-rows"

    .line 350
    .line 351
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-nez p1, :cond_17

    .line 356
    .line 357
    goto/16 :goto_0

    .line 358
    .line 359
    :cond_17
    const/16 v4, 0x19

    .line 360
    .line 361
    goto/16 :goto_0

    .line 362
    .line 363
    :sswitch_17
    const-string v5, "window-insets"

    .line 364
    .line 365
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result p1

    .line 369
    if-nez p1, :cond_18

    .line 370
    .line 371
    goto/16 :goto_0

    .line 372
    .line 373
    :cond_18
    const/16 v4, 0x18

    .line 374
    .line 375
    goto/16 :goto_0

    .line 376
    .line 377
    :sswitch_18
    const-string v5, "enable_rotation"

    .line 378
    .line 379
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    if-nez p1, :cond_19

    .line 384
    .line 385
    goto/16 :goto_0

    .line 386
    .line 387
    :cond_19
    const/16 v4, 0x17

    .line 388
    .line 389
    goto/16 :goto_0

    .line 390
    .line 391
    :sswitch_19
    const-string v5, "num-all-apps-columns"

    .line 392
    .line 393
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    if-nez p1, :cond_1a

    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :cond_1a
    const/16 v4, 0x16

    .line 402
    .line 403
    goto/16 :goto_0

    .line 404
    .line 405
    :sswitch_1a
    const-string v5, "pid"

    .line 406
    .line 407
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result p1

    .line 411
    if-nez p1, :cond_1b

    .line 412
    .line 413
    goto/16 :goto_0

    .line 414
    .line 415
    :cond_1b
    const/16 v4, 0x15

    .line 416
    .line 417
    goto/16 :goto_0

    .line 418
    .line 419
    :sswitch_1b
    const-string v5, "gc"

    .line 420
    .line 421
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    move-result p1

    .line 425
    if-nez p1, :cond_1c

    .line 426
    .line 427
    goto/16 :goto_0

    .line 428
    .line 429
    :cond_1c
    const/16 v4, 0x14

    .line 430
    .line 431
    goto/16 :goto_0

    .line 432
    .line 433
    :sswitch_1c
    const-string v5, "mock-sensor-rotation"

    .line 434
    .line 435
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result p1

    .line 439
    if-nez p1, :cond_1d

    .line 440
    .line 441
    goto/16 :goto_0

    .line 442
    .line 443
    :cond_1d
    const/16 v4, 0x13

    .line 444
    .line 445
    goto/16 :goto_0

    .line 446
    .line 447
    :sswitch_1d
    const-string v5, "unfreeze-app-list"

    .line 448
    .line 449
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 450
    .line 451
    .line 452
    move-result p1

    .line 453
    if-nez p1, :cond_1e

    .line 454
    .line 455
    goto/16 :goto_0

    .line 456
    .line 457
    :cond_1e
    const/16 v4, 0x12

    .line 458
    .line 459
    goto/16 :goto_0

    .line 460
    .line 461
    :sswitch_1e
    const-string v5, "enable-debug-tracing"

    .line 462
    .line 463
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 464
    .line 465
    .line 466
    move-result p1

    .line 467
    if-nez p1, :cond_1f

    .line 468
    .line 469
    goto/16 :goto_0

    .line 470
    .line 471
    :cond_1f
    const/16 v4, 0x11

    .line 472
    .line 473
    goto/16 :goto_0

    .line 474
    .line 475
    :sswitch_1f
    const-string v5, "is-launcher-initialized"

    .line 476
    .line 477
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 478
    .line 479
    .line 480
    move-result p1

    .line 481
    if-nez p1, :cond_20

    .line 482
    .line 483
    goto/16 :goto_0

    .line 484
    .line 485
    :cond_20
    const/16 v4, 0x10

    .line 486
    .line 487
    goto/16 :goto_0

    .line 488
    .line 489
    :sswitch_20
    const-string v5, "apps-list-scroll-y"

    .line 490
    .line 491
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    if-nez p1, :cond_21

    .line 496
    .line 497
    goto/16 :goto_0

    .line 498
    .line 499
    :cond_21
    const/16 v4, 0xf

    .line 500
    .line 501
    goto/16 :goto_0

    .line 502
    .line 503
    :sswitch_21
    const-string v5, "get-had-nontest-events"

    .line 504
    .line 505
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 506
    .line 507
    .line 508
    move-result p1

    .line 509
    if-nez p1, :cond_22

    .line 510
    .line 511
    goto/16 :goto_0

    .line 512
    .line 513
    :cond_22
    const/16 v4, 0xe

    .line 514
    .line 515
    goto/16 :goto_0

    .line 516
    .line 517
    :sswitch_22
    const-string v5, "cell-layout-boarder-height"

    .line 518
    .line 519
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 520
    .line 521
    .line 522
    move-result p1

    .line 523
    if-nez p1, :cond_23

    .line 524
    .line 525
    goto/16 :goto_0

    .line 526
    .line 527
    :cond_23
    const/16 v4, 0xd

    .line 528
    .line 529
    goto/16 :goto_0

    .line 530
    .line 531
    :sswitch_23
    const-string v5, "clear-data"

    .line 532
    .line 533
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    move-result p1

    .line 537
    if-nez p1, :cond_24

    .line 538
    .line 539
    goto/16 :goto_0

    .line 540
    .line 541
    :cond_24
    const/16 v4, 0xc

    .line 542
    .line 543
    goto/16 :goto_0

    .line 544
    .line 545
    :sswitch_24
    const-string v5, "reinitialize-data"

    .line 546
    .line 547
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 548
    .line 549
    .line 550
    move-result p1

    .line 551
    if-nez p1, :cond_25

    .line 552
    .line 553
    goto/16 :goto_0

    .line 554
    .line 555
    :cond_25
    const/16 v4, 0xb

    .line 556
    .line 557
    goto/16 :goto_0

    .line 558
    .line 559
    :sswitch_25
    const-string v5, "workspace-cell-layout-size"

    .line 560
    .line 561
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 562
    .line 563
    .line 564
    move-result p1

    .line 565
    if-nez p1, :cond_26

    .line 566
    .line 567
    goto/16 :goto_0

    .line 568
    .line 569
    :cond_26
    const/16 v4, 0xa

    .line 570
    .line 571
    goto/16 :goto_0

    .line 572
    .line 573
    :sswitch_26
    const-string v5, "app-list-freeze-flags"

    .line 574
    .line 575
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 576
    .line 577
    .line 578
    move-result p1

    .line 579
    if-nez p1, :cond_27

    .line 580
    .line 581
    goto/16 :goto_0

    .line 582
    .line 583
    :cond_27
    const/16 v4, 0x9

    .line 584
    .line 585
    goto/16 :goto_0

    .line 586
    .line 587
    :sswitch_27
    const-string v5, "start-event-logging"

    .line 588
    .line 589
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 590
    .line 591
    .line 592
    move-result p1

    .line 593
    if-nez p1, :cond_28

    .line 594
    .line 595
    goto/16 :goto_0

    .line 596
    .line 597
    :cond_28
    const/16 v4, 0x8

    .line 598
    .line 599
    goto/16 :goto_0

    .line 600
    .line 601
    :sswitch_28
    const-string v5, "recents-window-enabled"

    .line 602
    .line 603
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 604
    .line 605
    .line 606
    move-result p1

    .line 607
    if-nez p1, :cond_29

    .line 608
    .line 609
    goto :goto_0

    .line 610
    :cond_29
    const/4 v4, 0x7

    .line 611
    goto :goto_0

    .line 612
    :sswitch_29
    const-string v5, "enable-taskbar-navbar-unification"

    .line 613
    .line 614
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 615
    .line 616
    .line 617
    move-result p1

    .line 618
    if-nez p1, :cond_2a

    .line 619
    .line 620
    goto :goto_0

    .line 621
    :cond_2a
    const/4 v4, 0x6

    .line 622
    goto :goto_0

    .line 623
    :sswitch_2a
    const-string v5, "is-two-panel"

    .line 624
    .line 625
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    move-result p1

    .line 629
    if-nez p1, :cond_2b

    .line 630
    .line 631
    goto :goto_0

    .line 632
    :cond_2b
    const/4 v4, 0x5

    .line 633
    goto :goto_0

    .line 634
    :sswitch_2b
    const-string v5, "gesture-region"

    .line 635
    .line 636
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 637
    .line 638
    .line 639
    move-result p1

    .line 640
    if-nez p1, :cond_2c

    .line 641
    .line 642
    goto :goto_0

    .line 643
    :cond_2c
    const/4 v4, 0x4

    .line 644
    goto :goto_0

    .line 645
    :sswitch_2c
    const-string v5, "is-tablet"

    .line 646
    .line 647
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 648
    .line 649
    .line 650
    move-result p1

    .line 651
    if-nez p1, :cond_2d

    .line 652
    .line 653
    goto :goto_0

    .line 654
    :cond_2d
    const/4 v4, 0x3

    .line 655
    goto :goto_0

    .line 656
    :sswitch_2d
    const-string v5, "workspace-current-page-index"

    .line 657
    .line 658
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 659
    .line 660
    .line 661
    move-result p1

    .line 662
    if-nez p1, :cond_2e

    .line 663
    .line 664
    goto :goto_0

    .line 665
    :cond_2e
    const/4 v4, 0x2

    .line 666
    goto :goto_0

    .line 667
    :sswitch_2e
    const-string v5, "stop-event-logging"

    .line 668
    .line 669
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 670
    .line 671
    .line 672
    move-result p1

    .line 673
    if-nez p1, :cond_2f

    .line 674
    .line 675
    goto :goto_0

    .line 676
    :cond_2f
    move v4, v1

    .line 677
    goto :goto_0

    .line 678
    :sswitch_2f
    const-string v5, "disable-debug-tracing"

    .line 679
    .line 680
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 681
    .line 682
    .line 683
    move-result p1

    .line 684
    if-nez p1, :cond_30

    .line 685
    .line 686
    goto :goto_0

    .line 687
    :cond_30
    move v4, v0

    .line 688
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 689
    .line 690
    .line 691
    return-object v3

    .line 692
    :pswitch_0
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 693
    .line 694
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 695
    .line 696
    .line 697
    move-result-object p0

    .line 698
    const-string p1, "response"

    .line 699
    .line 700
    const p2, 0x7f07026a

    .line 701
    .line 702
    .line 703
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 704
    .line 705
    .line 706
    move-result p2

    .line 707
    const p3, 0x7f0709ee

    .line 708
    .line 709
    .line 710
    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 711
    .line 712
    .line 713
    move-result p0

    .line 714
    add-int/2addr p2, p0

    .line 715
    invoke-virtual {v2, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 716
    .line 717
    .line 718
    return-object v2

    .line 719
    :pswitch_1
    const-string p1, "response"

    .line 720
    .line 721
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 722
    .line 723
    iget p0, p0, Lcom/android/launcher3/h0;->H2:I

    .line 724
    .line 725
    invoke-virtual {v2, p1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 726
    .line 727
    .line 728
    return-object v2

    .line 729
    :pswitch_2
    const-string p0, "index"

    .line 730
    .line 731
    invoke-virtual {p3, p0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 732
    .line 733
    .line 734
    move-result p0

    .line 735
    new-instance p1, Lcom/android/launcher3/testing/g;

    .line 736
    .line 737
    invoke-direct {p1}, Lcom/android/launcher3/testing/g;-><init>()V

    .line 738
    .line 739
    .line 740
    new-instance p2, Lcom/android/launcher3/testing/m;

    .line 741
    .line 742
    invoke-direct {p2, p0}, Lcom/android/launcher3/testing/m;-><init>(I)V

    .line 743
    .line 744
    .line 745
    invoke-static {p1, p2}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 746
    .line 747
    .line 748
    move-result-object p0

    .line 749
    return-object p0

    .line 750
    :pswitch_3
    const-string p0, "response"

    .line 751
    .line 752
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 753
    .line 754
    .line 755
    move-result p1

    .line 756
    invoke-virtual {v2, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 757
    .line 758
    .line 759
    return-object v2

    .line 760
    :pswitch_4
    new-instance p0, Lcom/android/launcher3/testing/u;

    .line 761
    .line 762
    invoke-direct {p0}, Lcom/android/launcher3/testing/u;-><init>()V

    .line 763
    .line 764
    .line 765
    new-instance p1, Lcom/android/launcher3/testing/v;

    .line 766
    .line 767
    invoke-direct {p1}, Lcom/android/launcher3/testing/v;-><init>()V

    .line 768
    .line 769
    .line 770
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 771
    .line 772
    .line 773
    move-result-object p0

    .line 774
    return-object p0

    .line 775
    :pswitch_5
    const-string p0, "response"

    .line 776
    .line 777
    sget p1, Lcom/android/launcher3/testing/TestInformationHandler;->sActivitiesCreatedCount:I

    .line 778
    .line 779
    invoke-virtual {v2, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 780
    .line 781
    .line 782
    return-object v2

    .line 783
    :pswitch_6
    new-instance p0, Lcom/android/launcher3/testing/i;

    .line 784
    .line 785
    invoke-direct {p0}, Lcom/android/launcher3/testing/i;-><init>()V

    .line 786
    .line 787
    .line 788
    new-instance p1, Lcom/android/launcher3/testing/B;

    .line 789
    .line 790
    invoke-direct {p1}, Lcom/android/launcher3/testing/B;-><init>()V

    .line 791
    .line 792
    .line 793
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 794
    .line 795
    .line 796
    move-result-object p0

    .line 797
    if-eqz p0, :cond_31

    .line 798
    .line 799
    return-object p0

    .line 800
    :cond_31
    const-string p0, "response"

    .line 801
    .line 802
    invoke-virtual {v2, p0, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 803
    .line 804
    .line 805
    return-object v2

    .line 806
    :pswitch_7
    sget-object p0, Lcom/android/launcher3/testing/TestInformationHandler;->sEvents:Ljava/util/Collection;

    .line 807
    .line 808
    if-nez p0, :cond_32

    .line 809
    .line 810
    return-object v2

    .line 811
    :cond_32
    monitor-enter p0

    .line 812
    :try_start_0
    const-string p1, "response"

    .line 813
    .line 814
    new-instance p2, Ljava/util/ArrayList;

    .line 815
    .line 816
    sget-object p3, Lcom/android/launcher3/testing/TestInformationHandler;->sEvents:Ljava/util/Collection;

    .line 817
    .line 818
    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 819
    .line 820
    .line 821
    invoke-virtual {v2, p1, p2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 822
    .line 823
    .line 824
    monitor-exit p0

    .line 825
    return-object v2

    .line 826
    :catchall_0
    move-exception p1

    .line 827
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 828
    throw p1

    .line 829
    :pswitch_8
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 830
    .line 831
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 832
    .line 833
    .line 834
    new-instance p1, Lcom/android/launcher3/testing/o;

    .line 835
    .line 836
    invoke-direct {p1}, Lcom/android/launcher3/testing/o;-><init>()V

    .line 837
    .line 838
    .line 839
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 840
    .line 841
    .line 842
    move-result-object p0

    .line 843
    return-object p0

    .line 844
    :pswitch_9
    const-string p1, "response"

    .line 845
    .line 846
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 847
    .line 848
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->L0:Z

    .line 849
    .line 850
    invoke-virtual {v2, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 851
    .line 852
    .line 853
    return-object v2

    .line 854
    :pswitch_a
    new-instance p0, Lcom/android/launcher3/testing/i;

    .line 855
    .line 856
    invoke-direct {p0}, Lcom/android/launcher3/testing/i;-><init>()V

    .line 857
    .line 858
    .line 859
    new-instance p1, Lcom/android/launcher3/testing/C;

    .line 860
    .line 861
    invoke-direct {p1}, Lcom/android/launcher3/testing/C;-><init>()V

    .line 862
    .line 863
    .line 864
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 865
    .line 866
    .line 867
    move-result-object p0

    .line 868
    return-object p0

    .line 869
    :pswitch_b
    new-instance p1, Lcom/android/launcher3/testing/G;

    .line 870
    .line 871
    invoke-direct {p1}, Lcom/android/launcher3/testing/G;-><init>()V

    .line 872
    .line 873
    .line 874
    new-instance p2, Lcom/android/launcher3/testing/H;

    .line 875
    .line 876
    invoke-direct {p2}, Lcom/android/launcher3/testing/H;-><init>()V

    .line 877
    .line 878
    .line 879
    new-instance p3, Lcom/android/launcher3/testing/I;

    .line 880
    .line 881
    invoke-direct {p3, p0}, Lcom/android/launcher3/testing/I;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;)V

    .line 882
    .line 883
    .line 884
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/testing/TestInformationHandler;->getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;

    .line 885
    .line 886
    .line 887
    move-result-object p0

    .line 888
    return-object p0

    .line 889
    :pswitch_c
    const-string p1, "response"

    .line 890
    .line 891
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 892
    .line 893
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    .line 894
    .line 895
    .line 896
    move-result p0

    .line 897
    invoke-virtual {v2, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 898
    .line 899
    .line 900
    return-object v2

    .line 901
    :pswitch_d
    const-string p0, "response"

    .line 902
    .line 903
    invoke-virtual {v2, p0, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 904
    .line 905
    .line 906
    return-object v2

    .line 907
    :pswitch_e
    const-string p1, "response"

    .line 908
    .line 909
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 910
    .line 911
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->U(Landroid/content/Context;)Z

    .line 912
    .line 913
    .line 914
    move-result p0

    .line 915
    invoke-virtual {v2, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 916
    .line 917
    .line 918
    return-object v2

    .line 919
    :pswitch_f
    const-string p0, "cell-span"

    .line 920
    .line 921
    invoke-virtual {p3, p0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 922
    .line 923
    .line 924
    move-result-object p0

    .line 925
    check-cast p0, Landroid/graphics/Rect;

    .line 926
    .line 927
    new-instance p1, Lcom/android/launcher3/testing/g;

    .line 928
    .line 929
    invoke-direct {p1}, Lcom/android/launcher3/testing/g;-><init>()V

    .line 930
    .line 931
    .line 932
    new-instance p2, Lcom/android/launcher3/testing/h;

    .line 933
    .line 934
    invoke-direct {p2, p0}, Lcom/android/launcher3/testing/h;-><init>(Landroid/graphics/Rect;)V

    .line 935
    .line 936
    .line 937
    invoke-static {p1, p2}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 938
    .line 939
    .line 940
    move-result-object p0

    .line 941
    return-object p0

    .line 942
    :pswitch_10
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 943
    .line 944
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 945
    .line 946
    .line 947
    new-instance p1, Lcom/android/launcher3/testing/F;

    .line 948
    .line 949
    invoke-direct {p1}, Lcom/android/launcher3/testing/F;-><init>()V

    .line 950
    .line 951
    .line 952
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 953
    .line 954
    .line 955
    move-result-object p0

    .line 956
    return-object p0

    .line 957
    :pswitch_11
    const-string p0, "response"

    .line 958
    .line 959
    sget-object p1, Lcom/android/launcher3/testing/TestInformationHandler;->sActivities:Ljava/util/Set;

    .line 960
    .line 961
    invoke-interface {p1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 962
    .line 963
    .line 964
    move-result-object p1

    .line 965
    new-instance p2, Lcom/android/launcher3/testing/x;

    .line 966
    .line 967
    invoke-direct {p2}, Lcom/android/launcher3/testing/x;-><init>()V

    .line 968
    .line 969
    .line 970
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 971
    .line 972
    .line 973
    move-result-object p1

    .line 974
    new-instance p2, Lcom/android/launcher3/testing/y;

    .line 975
    .line 976
    invoke-direct {p2}, Lcom/android/launcher3/testing/y;-><init>()V

    .line 977
    .line 978
    .line 979
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 980
    .line 981
    .line 982
    move-result-object p1

    .line 983
    check-cast p1, [Ljava/lang/String;

    .line 984
    .line 985
    invoke-virtual {v2, p0, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 986
    .line 987
    .line 988
    return-object v2

    .line 989
    :pswitch_12
    const-string p0, "response"

    .line 990
    .line 991
    sget-object p1, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 992
    .line 993
    invoke-virtual {p1}, Lcom/android/launcher3/util/H;->getCreatedContext()Lcom/android/launcher3/views/k;

    .line 994
    .line 995
    .line 996
    move-result-object p1

    .line 997
    check-cast p1, Lcom/android/launcher3/C2;

    .line 998
    .line 999
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->isSplitSelectionActive()Z

    .line 1000
    .line 1001
    .line 1002
    move-result p1

    .line 1003
    invoke-virtual {v2, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1004
    .line 1005
    .line 1006
    return-object v2

    .line 1007
    :pswitch_13
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 1008
    .line 1009
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 1010
    .line 1011
    .line 1012
    new-instance p1, Lcom/android/launcher3/testing/b;

    .line 1013
    .line 1014
    invoke-direct {p1}, Lcom/android/launcher3/testing/b;-><init>()V

    .line 1015
    .line 1016
    .line 1017
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1018
    .line 1019
    .line 1020
    move-result-object p0

    .line 1021
    return-object p0

    .line 1022
    :pswitch_14
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 1023
    .line 1024
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 1025
    .line 1026
    .line 1027
    new-instance p1, Lcom/android/launcher3/testing/n;

    .line 1028
    .line 1029
    invoke-direct {p1}, Lcom/android/launcher3/testing/n;-><init>()V

    .line 1030
    .line 1031
    .line 1032
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1033
    .line 1034
    .line 1035
    move-result-object p0

    .line 1036
    return-object p0

    .line 1037
    :pswitch_15
    sget-object p0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 1038
    .line 1039
    new-instance p1, Lcom/android/launcher3/testing/z;

    .line 1040
    .line 1041
    invoke-direct {p1}, Lcom/android/launcher3/testing/z;-><init>()V

    .line 1042
    .line 1043
    .line 1044
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getFromExecutorSync(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 1045
    .line 1046
    .line 1047
    move-result-object p0

    .line 1048
    check-cast p0, Landroid/os/Bundle;

    .line 1049
    .line 1050
    return-object p0

    .line 1051
    :pswitch_16
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 1052
    .line 1053
    iget-object p2, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 1054
    .line 1055
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 1056
    .line 1057
    .line 1058
    move-result-object p1

    .line 1059
    check-cast p1, Lcom/android/launcher3/F1;

    .line 1060
    .line 1061
    new-instance p2, Lcom/android/launcher3/testing/g;

    .line 1062
    .line 1063
    invoke-direct {p2}, Lcom/android/launcher3/testing/g;-><init>()V

    .line 1064
    .line 1065
    .line 1066
    new-instance p3, Lcom/android/launcher3/testing/j;

    .line 1067
    .line 1068
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/testing/j;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;Lcom/android/launcher3/F1;)V

    .line 1069
    .line 1070
    .line 1071
    invoke-static {p2, p3}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1072
    .line 1073
    .line 1074
    move-result-object p0

    .line 1075
    return-object p0

    .line 1076
    :pswitch_17
    new-instance p1, Lcom/android/launcher3/testing/G;

    .line 1077
    .line 1078
    invoke-direct {p1}, Lcom/android/launcher3/testing/G;-><init>()V

    .line 1079
    .line 1080
    .line 1081
    new-instance p2, Lcom/android/launcher3/testing/J;

    .line 1082
    .line 1083
    invoke-direct {p2}, Lcom/android/launcher3/testing/J;-><init>()V

    .line 1084
    .line 1085
    .line 1086
    new-instance p3, Lcom/android/launcher3/testing/I;

    .line 1087
    .line 1088
    invoke-direct {p3, p0}, Lcom/android/launcher3/testing/I;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;)V

    .line 1089
    .line 1090
    .line 1091
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/testing/TestInformationHandler;->getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;

    .line 1092
    .line 1093
    .line 1094
    move-result-object p0

    .line 1095
    return-object p0

    .line 1096
    :pswitch_18
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 1097
    .line 1098
    new-instance p1, Lcom/android/launcher3/testing/d;

    .line 1099
    .line 1100
    invoke-direct {p1, p2}, Lcom/android/launcher3/testing/d;-><init>(Ljava/lang/String;)V

    .line 1101
    .line 1102
    .line 1103
    invoke-virtual {p0, p1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 1104
    .line 1105
    .line 1106
    return-object v2

    .line 1107
    :pswitch_19
    const-string p1, "response"

    .line 1108
    .line 1109
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 1110
    .line 1111
    iget p0, p0, Lcom/android/launcher3/h0;->M2:I

    .line 1112
    .line 1113
    invoke-virtual {v2, p1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1114
    .line 1115
    .line 1116
    return-object v2

    .line 1117
    :pswitch_1a
    const-string p0, "response"

    .line 1118
    .line 1119
    invoke-static {}, Landroid/system/Os;->getpid()I

    .line 1120
    .line 1121
    .line 1122
    move-result p1

    .line 1123
    invoke-virtual {v2, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1124
    .line 1125
    .line 1126
    return-object v2

    .line 1127
    :pswitch_1b
    invoke-static {}, Lcom/android/launcher3/testing/TestInformationHandler;->runGcAndFinalizersSync()V

    .line 1128
    .line 1129
    .line 1130
    return-object v2

    .line 1131
    :pswitch_1c
    sput-boolean v1, Lc2/b;->b:Z

    .line 1132
    .line 1133
    return-object v2

    .line 1134
    :pswitch_1d
    new-instance p0, Lcom/android/launcher3/testing/i;

    .line 1135
    .line 1136
    invoke-direct {p0}, Lcom/android/launcher3/testing/i;-><init>()V

    .line 1137
    .line 1138
    .line 1139
    new-instance p1, Lcom/android/launcher3/testing/D;

    .line 1140
    .line 1141
    invoke-direct {p1}, Lcom/android/launcher3/testing/D;-><init>()V

    .line 1142
    .line 1143
    .line 1144
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1145
    .line 1146
    .line 1147
    move-result-object p0

    .line 1148
    return-object p0

    .line 1149
    :pswitch_1e
    sput-boolean v1, Lc2/b;->a:Z

    .line 1150
    .line 1151
    sput-boolean v1, Ls1/j;->i:Z

    .line 1152
    .line 1153
    return-object v2

    .line 1154
    :pswitch_1f
    new-instance p1, Lcom/android/launcher3/testing/i;

    .line 1155
    .line 1156
    invoke-direct {p1}, Lcom/android/launcher3/testing/i;-><init>()V

    .line 1157
    .line 1158
    .line 1159
    new-instance p2, Lcom/android/launcher3/testing/p;

    .line 1160
    .line 1161
    invoke-direct {p2, p0}, Lcom/android/launcher3/testing/p;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;)V

    .line 1162
    .line 1163
    .line 1164
    new-instance p0, Lcom/android/launcher3/testing/A;

    .line 1165
    .line 1166
    invoke-direct {p0}, Lcom/android/launcher3/testing/A;-><init>()V

    .line 1167
    .line 1168
    .line 1169
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/testing/TestInformationHandler;->getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;

    .line 1170
    .line 1171
    .line 1172
    move-result-object p0

    .line 1173
    return-object p0

    .line 1174
    :pswitch_20
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 1175
    .line 1176
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 1177
    .line 1178
    .line 1179
    new-instance p1, Lcom/android/launcher3/testing/E;

    .line 1180
    .line 1181
    invoke-direct {p1}, Lcom/android/launcher3/testing/E;-><init>()V

    .line 1182
    .line 1183
    .line 1184
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1185
    .line 1186
    .line 1187
    move-result-object p0

    .line 1188
    return-object p0

    .line 1189
    :pswitch_21
    const-string p0, "response"

    .line 1190
    .line 1191
    sget-boolean p1, Lcom/android/launcher3/testing/K;->b:Z

    .line 1192
    .line 1193
    invoke-virtual {v2, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1194
    .line 1195
    .line 1196
    return-object v2

    .line 1197
    :pswitch_22
    const-string p1, "response"

    .line 1198
    .line 1199
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 1200
    .line 1201
    iget-object p0, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 1202
    .line 1203
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 1204
    .line 1205
    invoke-virtual {v2, p1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1206
    .line 1207
    .line 1208
    return-object v2

    .line 1209
    :pswitch_23
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    .line 1210
    .line 1211
    .line 1212
    move-result-wide p1

    .line 1213
    :try_start_1
    sget-object p3, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 1214
    .line 1215
    new-instance v0, Lcom/android/launcher3/testing/t;

    .line 1216
    .line 1217
    invoke-direct {v0, p0}, Lcom/android/launcher3/testing/t;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;)V

    .line 1218
    .line 1219
    .line 1220
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1221
    .line 1222
    .line 1223
    invoke-static {p1, p2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1224
    .line 1225
    .line 1226
    return-object v2

    .line 1227
    :catchall_1
    move-exception p0

    .line 1228
    invoke-static {p1, p2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1229
    .line 1230
    .line 1231
    throw p0

    .line 1232
    :pswitch_24
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    .line 1233
    .line 1234
    .line 1235
    move-result-wide p1

    .line 1236
    :try_start_2
    sget-object p3, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 1237
    .line 1238
    new-instance v0, Lcom/android/launcher3/testing/s;

    .line 1239
    .line 1240
    invoke-direct {v0, p0}, Lcom/android/launcher3/testing/s;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;)V

    .line 1241
    .line 1242
    .line 1243
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1244
    .line 1245
    .line 1246
    invoke-static {p1, p2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1247
    .line 1248
    .line 1249
    return-object v2

    .line 1250
    :catchall_2
    move-exception p0

    .line 1251
    invoke-static {p1, p2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 1252
    .line 1253
    .line 1254
    throw p0

    .line 1255
    :pswitch_25
    new-instance p0, Lcom/android/launcher3/testing/e;

    .line 1256
    .line 1257
    invoke-direct {p0}, Lcom/android/launcher3/testing/e;-><init>()V

    .line 1258
    .line 1259
    .line 1260
    new-instance p1, Lcom/android/launcher3/testing/f;

    .line 1261
    .line 1262
    invoke-direct {p1}, Lcom/android/launcher3/testing/f;-><init>()V

    .line 1263
    .line 1264
    .line 1265
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1266
    .line 1267
    .line 1268
    move-result-object p0

    .line 1269
    return-object p0

    .line 1270
    :pswitch_26
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 1271
    .line 1272
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 1273
    .line 1274
    .line 1275
    new-instance p1, Lcom/android/launcher3/testing/q;

    .line 1276
    .line 1277
    invoke-direct {p1}, Lcom/android/launcher3/testing/q;-><init>()V

    .line 1278
    .line 1279
    .line 1280
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1281
    .line 1282
    .line 1283
    move-result-object p0

    .line 1284
    return-object p0

    .line 1285
    :pswitch_27
    new-instance p0, Ljava/util/ArrayList;

    .line 1286
    .line 1287
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 1288
    .line 1289
    .line 1290
    sput-object p0, Lcom/android/launcher3/testing/TestInformationHandler;->sEvents:Ljava/util/Collection;

    .line 1291
    .line 1292
    new-instance p0, Lcom/android/launcher3/testing/r;

    .line 1293
    .line 1294
    invoke-direct {p0}, Lcom/android/launcher3/testing/r;-><init>()V

    .line 1295
    .line 1296
    .line 1297
    invoke-static {p0}, Lcom/android/launcher3/testing/K;->g(Ljava/util/function/BiConsumer;)V

    .line 1298
    .line 1299
    .line 1300
    return-object v2

    .line 1301
    :pswitch_28
    const-string p0, "response"

    .line 1302
    .line 1303
    invoke-static {}, Lcom/android/launcher3/y0;->F()Z

    .line 1304
    .line 1305
    .line 1306
    move-result p1

    .line 1307
    if-nez p1, :cond_33

    .line 1308
    .line 1309
    invoke-static {}, Lcom/android/launcher3/y0;->r()Z

    .line 1310
    .line 1311
    .line 1312
    move-result p1

    .line 1313
    if-eqz p1, :cond_34

    .line 1314
    .line 1315
    :cond_33
    move v0, v1

    .line 1316
    :cond_34
    invoke-virtual {v2, p0, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1317
    .line 1318
    .line 1319
    return-object v2

    .line 1320
    :pswitch_29
    const-string p0, "response"

    .line 1321
    .line 1322
    sget-boolean p1, Lf1/a;->g:Z

    .line 1323
    .line 1324
    invoke-virtual {v2, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1325
    .line 1326
    .line 1327
    return-object v2

    .line 1328
    :pswitch_2a
    const-string p1, "response"

    .line 1329
    .line 1330
    sget-object p2, Lf1/a;->c:Lf1/a$a;

    .line 1331
    .line 1332
    invoke-virtual {p2}, Lf1/a$a;->c()Z

    .line 1333
    .line 1334
    .line 1335
    move-result p2

    .line 1336
    if-eqz p2, :cond_35

    .line 1337
    .line 1338
    goto :goto_1

    .line 1339
    :cond_35
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 1340
    .line 1341
    iget-boolean v0, p0, Lcom/android/launcher3/h0;->K0:Z

    .line 1342
    .line 1343
    :goto_1
    invoke-virtual {v2, p1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1344
    .line 1345
    .line 1346
    return-object v2

    .line 1347
    :pswitch_2b
    new-instance p1, Lcom/android/launcher3/testing/G;

    .line 1348
    .line 1349
    invoke-direct {p1}, Lcom/android/launcher3/testing/G;-><init>()V

    .line 1350
    .line 1351
    .line 1352
    new-instance p2, Lcom/android/launcher3/testing/c;

    .line 1353
    .line 1354
    invoke-direct {p2}, Lcom/android/launcher3/testing/c;-><init>()V

    .line 1355
    .line 1356
    .line 1357
    new-instance p3, Lcom/android/launcher3/testing/I;

    .line 1358
    .line 1359
    invoke-direct {p3, p0}, Lcom/android/launcher3/testing/I;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;)V

    .line 1360
    .line 1361
    .line 1362
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/testing/TestInformationHandler;->getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;

    .line 1363
    .line 1364
    .line 1365
    move-result-object p0

    .line 1366
    return-object p0

    .line 1367
    :pswitch_2c
    const-string p1, "response"

    .line 1368
    .line 1369
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 1370
    .line 1371
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->G0:Z

    .line 1372
    .line 1373
    invoke-virtual {v2, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1374
    .line 1375
    .line 1376
    return-object v2

    .line 1377
    :pswitch_2d
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 1378
    .line 1379
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 1380
    .line 1381
    .line 1382
    new-instance p1, Lcom/android/launcher3/testing/k;

    .line 1383
    .line 1384
    invoke-direct {p1}, Lcom/android/launcher3/testing/k;-><init>()V

    .line 1385
    .line 1386
    .line 1387
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 1388
    .line 1389
    .line 1390
    move-result-object p0

    .line 1391
    return-object p0

    .line 1392
    :pswitch_2e
    invoke-static {v3}, Lcom/android/launcher3/testing/K;->g(Ljava/util/function/BiConsumer;)V

    .line 1393
    .line 1394
    .line 1395
    sput-object v3, Lcom/android/launcher3/testing/TestInformationHandler;->sEvents:Ljava/util/Collection;

    .line 1396
    .line 1397
    return-object v2

    .line 1398
    :pswitch_2f
    sput-boolean v0, Lc2/b;->a:Z

    .line 1399
    .line 1400
    sput-boolean v0, Ls1/j;->i:Z

    .line 1401
    .line 1402
    return-object v2

    .line 1403
    :sswitch_data_0
    .sparse-switch
        -0x7e105add -> :sswitch_2f
        -0x71e9cb5f -> :sswitch_2e
        -0x703886e0 -> :sswitch_2d
        -0x6dd7a797 -> :sswitch_2c
        -0x5d02a008 -> :sswitch_2b
        -0x48da05a0 -> :sswitch_2a
        -0x4860c40f -> :sswitch_29
        -0x40be1ca7 -> :sswitch_28
        -0x3a4636ff -> :sswitch_27
        -0x3a20180c -> :sswitch_26
        -0x36ccc0ef -> :sswitch_25
        -0x2eb09acc -> :sswitch_24
        -0x2e75bcd6 -> :sswitch_23
        -0x2e5acf07 -> :sswitch_22
        -0x2c10c6e0 -> :sswitch_21
        -0x25d3e253 -> :sswitch_20
        -0x1405cf16 -> :sswitch_1f
        -0xcab8382 -> :sswitch_1e
        -0x7e26c79 -> :sswitch_1d
        -0x7f4a12 -> :sswitch_1c
        0xcdc -> :sswitch_1b
        0x1b18b -> :sswitch_1a
        0x23ee395 -> :sswitch_19
        0x6f79eba -> :sswitch_18
        0x6fb0373 -> :sswitch_17
        0xc1f8001 -> :sswitch_16
        0xeb8ef4c -> :sswitch_15
        0xfeb5f6a -> :sswitch_14
        0x11da58c5 -> :sswitch_13
        0x17eba511 -> :sswitch_12
        0x1cbb46c4 -> :sswitch_11
        0x1ceb16d7 -> :sswitch_10
        0x1e8681e8 -> :sswitch_f
        0x1fa75832 -> :sswitch_e
        0x23b480f9 -> :sswitch_d
        0x24658e48 -> :sswitch_c
        0x2c0406b2 -> :sswitch_b
        0x2dcdc740 -> :sswitch_a
        0x2efd8f13 -> :sswitch_9
        0x3252dcfe -> :sswitch_8
        0x36426ebd -> :sswitch_7
        0x3c8feb6d -> :sswitch_6
        0x5791a6a1 -> :sswitch_5
        0x63082da6 -> :sswitch_4
        0x6ade98bd -> :sswitch_3
        0x709f15a5 -> :sswitch_2
        0x7a5274fb -> :sswitch_1
        0x7f975bdd -> :sswitch_0
    .end sparse-switch

    .line 1404
    .line 1405
    .line 1406
    .line 1407
    .line 1408
    .line 1409
    .line 1410
    .line 1411
    .line 1412
    .line 1413
    .line 1414
    .line 1415
    .line 1416
    .line 1417
    .line 1418
    .line 1419
    .line 1420
    .line 1421
    .line 1422
    .line 1423
    .line 1424
    .line 1425
    .line 1426
    .line 1427
    .line 1428
    .line 1429
    .line 1430
    .line 1431
    .line 1432
    .line 1433
    .line 1434
    .line 1435
    .line 1436
    .line 1437
    .line 1438
    .line 1439
    .line 1440
    .line 1441
    .line 1442
    .line 1443
    .line 1444
    .line 1445
    .line 1446
    .line 1447
    .line 1448
    .line 1449
    .line 1450
    .line 1451
    .line 1452
    .line 1453
    .line 1454
    .line 1455
    .line 1456
    .line 1457
    .line 1458
    .line 1459
    .line 1460
    .line 1461
    .line 1462
    .line 1463
    .line 1464
    .line 1465
    .line 1466
    .line 1467
    .line 1468
    .line 1469
    .line 1470
    .line 1471
    .line 1472
    .line 1473
    .line 1474
    .line 1475
    .line 1476
    .line 1477
    .line 1478
    .line 1479
    .line 1480
    .line 1481
    .line 1482
    .line 1483
    .line 1484
    .line 1485
    .line 1486
    .line 1487
    .line 1488
    .line 1489
    .line 1490
    .line 1491
    .line 1492
    .line 1493
    .line 1494
    .line 1495
    .line 1496
    .line 1497
    .line 1498
    .line 1499
    .line 1500
    .line 1501
    .line 1502
    .line 1503
    .line 1504
    .line 1505
    .line 1506
    .line 1507
    .line 1508
    .line 1509
    .line 1510
    .line 1511
    .line 1512
    .line 1513
    .line 1514
    .line 1515
    .line 1516
    .line 1517
    .line 1518
    .line 1519
    .line 1520
    .line 1521
    .line 1522
    .line 1523
    .line 1524
    .line 1525
    .line 1526
    .line 1527
    .line 1528
    .line 1529
    .line 1530
    .line 1531
    .line 1532
    .line 1533
    .line 1534
    .line 1535
    .line 1536
    .line 1537
    .line 1538
    .line 1539
    .line 1540
    .line 1541
    .line 1542
    .line 1543
    .line 1544
    .line 1545
    .line 1546
    .line 1547
    .line 1548
    .line 1549
    .line 1550
    .line 1551
    .line 1552
    .line 1553
    .line 1554
    .line 1555
    .line 1556
    .line 1557
    .line 1558
    .line 1559
    .line 1560
    .line 1561
    .line 1562
    .line 1563
    .line 1564
    .line 1565
    .line 1566
    .line 1567
    .line 1568
    .line 1569
    .line 1570
    .line 1571
    .line 1572
    .line 1573
    .line 1574
    .line 1575
    .line 1576
    .line 1577
    .line 1578
    .line 1579
    .line 1580
    .line 1581
    .line 1582
    .line 1583
    .line 1584
    .line 1585
    .line 1586
    .line 1587
    .line 1588
    .line 1589
    .line 1590
    .line 1591
    .line 1592
    .line 1593
    .line 1594
    .line 1595
    .line 1596
    .line 1597
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getWindowInsets()Landroid/view/WindowInsets;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/H;->getCreatedContext()Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/F1;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 16
    .line 17
    sget-object v0, Lcom/android/launcher3/testing/TestInformationHandler;->sActivityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/testing/TestInformationHandler$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/android/launcher3/testing/TestInformationHandler$a;-><init>(Lcom/android/launcher3/testing/TestInformationHandler;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/launcher3/testing/TestInformationHandler;->sActivityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Landroid/app/Application;

    .line 33
    .line 34
    sget-object p1, Lcom/android/launcher3/testing/TestInformationHandler;->sActivityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method protected isLauncherInitialized()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/H;->getCreatedContext()Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mContext:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->s0()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method
