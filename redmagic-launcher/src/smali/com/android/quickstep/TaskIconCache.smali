.class public final Lcom/android/quickstep/TaskIconCache;
.super Ljava/lang/Object;
.source "TaskIconCache.kt"

# interfaces
.implements Lcom/android/quickstep/task/thumbnail/data/TaskIconDataSource;
.implements Lcom/android/launcher3/util/Z$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/TaskIconCache$Companion;,
        Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;,
        Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;,
        Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;
    }
.end annotation


# static fields
.field private static final AIGC_COMPONENT_NAME:Ljava/lang/String;

.field private static final AIGC_PACKAGE_NAME:Ljava/lang/String;

.field public static final Companion:Lcom/android/quickstep/TaskIconCache$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private _iconFactory:Ls1/b;

.field private final bgExecutor:Ljava/util/concurrent/Executor;

.field private final context:Landroid/content/Context;

.field private defaultIconBase:Ls1/d;

.field private final defaultIcons:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ls1/d;",
            ">;"
        }
    .end annotation
.end field

.field private final iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/util/TaskKeyLruCache<",
            "Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final iconProvider:Ls1/T;

.field private isLowRam:Z

.field private taskVisualsChangeListener:Lcom/android/quickstep/util/TaskVisualsChangeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/TaskIconCache$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/TaskIconCache$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/TaskIconCache;->Companion:Lcom/android/quickstep/TaskIconCache$Companion;

    .line 8
    .line 9
    const-class v0, Lcom/android/quickstep/TaskIconCache;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "getSimpleName(...)"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/quickstep/TaskIconCache;->TAG:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "com.zte.aigc"

    .line 23
    .line 24
    sput-object v0, Lcom/android/quickstep/TaskIconCache;->AIGC_PACKAGE_NAME:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "com.zte.aigc/com.zte.aigc.ui.settings.functions.AigcFunctionListActivity"

    .line 27
    .line 28
    sput-object v0, Lcom/android/quickstep/TaskIconCache;->AIGC_COMPONENT_NAME:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ls1/T;Lcom/android/launcher3/util/Z;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bgExecutor"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "iconProvider"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "displayController"

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
    iput-object p1, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/android/quickstep/TaskIconCache;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 27
    .line 28
    iput-object p3, p0, Lcom/android/quickstep/TaskIconCache;->iconProvider:Ls1/T;

    .line 29
    .line 30
    invoke-static {}, Lx1/O;->C2()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    invoke-static {}, Lx1/O;->l2()Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-nez p2, :cond_1

    .line 41
    .line 42
    invoke-static {}, Lx1/O;->D2()Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/4 p2, 0x0

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    const/4 p2, 0x1

    .line 56
    :goto_1
    iput-boolean p2, p0, Lcom/android/quickstep/TaskIconCache;->isLowRam:Z

    .line 57
    .line 58
    new-instance p2, Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-boolean p3, p0, Lcom/android/quickstep/TaskIconCache;->isLowRam:Z

    .line 65
    .line 66
    if-eqz p3, :cond_2

    .line 67
    .line 68
    const p3, 0x7f0c00e4

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    const p3, 0x7f0c00e3

    .line 73
    .line 74
    .line 75
    :goto_2
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getInteger(I)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-direct {p2, p1}, Lcom/android/quickstep/util/TaskKeyLruCache;-><init>(I)V

    .line 80
    .line 81
    .line 82
    iput-object p2, p0, Lcom/android/quickstep/TaskIconCache;->iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 83
    .line 84
    new-instance p1, Landroid/util/SparseArray;

    .line 85
    .line 86
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object p1, p0, Lcom/android/quickstep/TaskIconCache;->defaultIcons:Landroid/util/SparseArray;

    .line 90
    .line 91
    invoke-virtual {p4, p0}, Lcom/android/launcher3/util/Z;->o(Lcom/android/launcher3/util/Z$b;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/TaskIconCache;Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/TaskIconCache;->invalidateCacheEntries$lambda$7(Lcom/android/quickstep/TaskIconCache;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getAIGC_COMPONENT_NAME$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TaskIconCache;->AIGC_COMPONENT_NAME:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getAIGC_PACKAGE_NAME$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TaskIconCache;->AIGC_PACKAGE_NAME:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getTAG$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TaskIconCache;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic b(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/TaskIconCache;->invalidateCacheEntries$lambda$7$lambda$6(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Lcom/android/quickstep/TaskIconCache;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/TaskIconCache;->clearCache$lambda$5(Lcom/android/quickstep/TaskIconCache;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final clearCache$lambda$5(Lcom/android/quickstep/TaskIconCache;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TaskIconCache;->resetFactory()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final createIconFactory()Ls1/b;
    .locals 4

    .line 1
    new-instance v0, Ls1/b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Lcom/android/launcher3/util/Z;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lcom/android/launcher3/util/Z$c;->l()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const v3, 0x7f070b17

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-direct {v0, v1, v2, p0}, Ls1/b;-><init>(Landroid/content/Context;II)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public static synthetic d(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/TaskIconCache;->getIconInBackgroundMFV$lambda$13(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final dispatchIconUpdate(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->taskVisualsChangeListener:Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/quickstep/util/TaskVisualsChangeListener;->onTaskIconChanged(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/TaskIconCache;->getIconInBackgroundMFV$lambda$14(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/quickstep/TaskIconCache;->getIconInBackground$lambda$4(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/TaskIconCache;->getIconInBackground$lambda$3(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final getBitmapInfo(Landroid/graphics/drawable/Drawable;IIZ)Ls1/d;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TaskIconCache;->getIconFactory()Ls1/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    invoke-virtual {v0, p3}, Ls1/b;->j0(I)V

    .line 6
    .line 7
    .line 8
    new-instance p3, Ls1/b$c;

    .line 9
    .line 10
    invoke-direct {p3}, Ls1/b$c;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, LD1/t;

    .line 22
    .line 23
    invoke-static {p2}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p2}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p3, p0}, Ls1/b$c;->f(Lcom/android/launcher3/util/N2;)Ls1/b$c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p4}, Ls1/b$c;->b(Z)Ls1/b$c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 p2, 0x0

    .line 40
    invoke-virtual {p0, p2}, Ls1/b$c;->a(I)Ls1/b$c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p1, p0}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "createBadgedIconBitmap(...)"

    .line 49
    .line 50
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-static {v0, p1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-object p0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 60
    :catchall_1
    move-exception p1

    .line 61
    invoke-static {v0, p0}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    throw p1
.end method

.method private final getCacheEntry(Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/TaskKeyLruCache;->getAndInvalidateIfModified(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->taskDescription:Landroid/app/ActivityManager$TaskDescription;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 17
    .line 18
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget v2, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 22
    .line 23
    invoke-direct {p0, v0, v2}, Lcom/android/quickstep/TaskIconCache;->getIcon(Landroid/app/ActivityManager$TaskDescription;I)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, 0x0

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    .line 31
    .line 32
    iget-object v5, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-direct {v4, v5, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 39
    .line 40
    .line 41
    iget v2, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/app/ActivityManager$TaskDescription;->getPrimaryColor()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-direct {p0, v4, v2, v0, v3}, Lcom/android/quickstep/TaskIconCache;->getBitmapInfo(Landroid/graphics/drawable/Drawable;IIZ)Ls1/d;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v2, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v2, 0x0

    .line 58
    :goto_0
    move-object v5, v0

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    invoke-static {}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/PackageManagerWrapper;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    iget v5, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 69
    .line 70
    invoke-virtual {v2, v4, v5}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    if-eqz v2, :cond_2

    .line 75
    .line 76
    iget-object v4, p0, Lcom/android/quickstep/TaskIconCache;->iconProvider:Ls1/T;

    .line 77
    .line 78
    invoke-virtual {v4, v2}, Ls1/T;->j(Landroid/content/pm/ComponentInfo;)Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    const-string v5, "getIcon(...)"

    .line 83
    .line 84
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget v5, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/app/ActivityManager$TaskDescription;->getPrimaryColor()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v6, v2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 94
    .line 95
    invoke-virtual {v6}, Landroid/content/pm/ApplicationInfo;->isInstantApp()Z

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    invoke-direct {p0, v4, v5, v0, v6}, Lcom/android/quickstep/TaskIconCache;->getBitmapInfo(Landroid/graphics/drawable/Drawable;IIZ)Ls1/d;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v4, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 104
    .line 105
    invoke-virtual {v0, v4}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    goto :goto_0

    .line 110
    :cond_2
    iget v0, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 111
    .line 112
    invoke-direct {p0, v0}, Lcom/android/quickstep/TaskIconCache;->getDefaultIcon(I)Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    goto :goto_0

    .line 117
    :goto_1
    if-nez v2, :cond_3

    .line 118
    .line 119
    invoke-static {}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/PackageManagerWrapper;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 128
    .line 129
    invoke-virtual {v0, v2, v1}, Lcom/android/systemui/shared/system/PackageManagerWrapper;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    :cond_3
    if-nez v2, :cond_4

    .line 134
    .line 135
    new-instance v4, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 136
    .line 137
    invoke-static {v5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    const/16 v11, 0x3e

    .line 141
    .line 142
    const/4 v12, 0x0

    .line 143
    const/4 v6, 0x0

    .line 144
    const/4 v7, 0x0

    .line 145
    const/4 v8, 0x0

    .line 146
    const/4 v9, 0x0

    .line 147
    const/4 v10, 0x0

    .line 148
    invoke-direct/range {v4 .. v12}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;ZZZILkotlin/jvm/internal/j;)V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_4
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_5

    .line 157
    .line 158
    new-instance v4, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 159
    .line 160
    invoke-static {v5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 164
    .line 165
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 166
    .line 167
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 168
    .line 169
    iget-object v6, p1, Lcom/android/systemui/shared/recents/model/Task;->taskDescription:Landroid/app/ActivityManager$TaskDescription;

    .line 170
    .line 171
    invoke-static {v0, v2, v1, v6}, Lcom/android/quickstep/util/IconLabelUtil;->getBadgedContentDescription(Landroid/content/Context;Landroid/content/pm/ActivityInfo;ILandroid/app/ActivityManager$TaskDescription;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 176
    .line 177
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v2, v0}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {v0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    const-string v0, "trim(...)"

    .line 190
    .line 191
    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    const/16 v11, 0x38

    .line 195
    .line 196
    const/4 v12, 0x0

    .line 197
    const/4 v8, 0x0

    .line 198
    const/4 v9, 0x0

    .line 199
    const/4 v10, 0x0

    .line 200
    invoke-direct/range {v4 .. v12}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;ZZZILkotlin/jvm/internal/j;)V

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_5
    new-instance v4, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 205
    .line 206
    invoke-static {v5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 210
    .line 211
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 212
    .line 213
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 214
    .line 215
    iget-object v6, p1, Lcom/android/systemui/shared/recents/model/Task;->taskDescription:Landroid/app/ActivityManager$TaskDescription;

    .line 216
    .line 217
    invoke-static {v0, v2, v1, v6}, Lcom/android/quickstep/util/IconLabelUtil;->getBadgedContentDescription(Landroid/content/Context;Landroid/content/pm/ActivityInfo;ILandroid/app/ActivityManager$TaskDescription;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v6

    .line 221
    const/16 v11, 0x3c

    .line 222
    .line 223
    const/4 v12, 0x0

    .line 224
    const/4 v7, 0x0

    .line 225
    const/4 v8, 0x0

    .line 226
    const/4 v9, 0x0

    .line 227
    const/4 v10, 0x0

    .line 228
    invoke-direct/range {v4 .. v12}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;ZZZILkotlin/jvm/internal/j;)V

    .line 229
    .line 230
    .line 231
    :goto_2
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 232
    .line 233
    invoke-direct {p0, v0, v2, v4}, Lcom/android/quickstep/TaskIconCache;->updateTitleIfNeeded(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/content/pm/ActivityInfo;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V

    .line 234
    .line 235
    .line 236
    sget-object v0, Lcom/android/quickstep/views/TaskView;->Companion:Lcom/android/quickstep/views/TaskView$Companion;

    .line 237
    .line 238
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 239
    .line 240
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/TaskView$Companion;->isAppLocked(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    invoke-virtual {v4, v0}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->setLocked(Z)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 252
    .line 253
    invoke-static {v0, p1, v3}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkTaskSupportSplit(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;Z)Z

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    invoke-virtual {v4, v0}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->setSupportSplit(Z)V

    .line 258
    .line 259
    .line 260
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 261
    .line 262
    invoke-static {v0, p1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkActivitySupportResize(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;)Z

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    invoke-virtual {v4, v0}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->setSupportResize(Z)V

    .line 267
    .line 268
    .line 269
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 270
    .line 271
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 272
    .line 273
    invoke-virtual {p0, p1, v4}, Lcom/android/quickstep/util/TaskKeyLruCache;->put(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    return-object v4
.end method

.method private final getDefaultIcon(I)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->defaultIcons:Landroid/util/SparseArray;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/TaskIconCache;->defaultIconBase:Ls1/d;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/TaskIconCache;->getIconFactory()Ls1/b;

    .line 9
    .line 10
    .line 11
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    :try_start_1
    iget-object v2, p0, Lcom/android/quickstep/TaskIconCache;->iconProvider:Ls1/T;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ls1/b;->d0(Ls1/T;)Ls1/d;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-string v3, "makeDefaultIcon(...)"

    .line 19
    .line 20
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 21
    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    :try_start_2
    invoke-static {v1, v3}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 25
    .line 26
    .line 27
    move-object v1, v2

    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_2

    .line 31
    :catchall_1
    move-exception p0

    .line 32
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 33
    :catchall_2
    move-exception p1

    .line 34
    :try_start_4
    invoke-static {v1, p0}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    throw p1

    .line 38
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/TaskIconCache;->defaultIcons:Landroid/util/SparseArray;

    .line 39
    .line 40
    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-ltz v2, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/android/quickstep/TaskIconCache;->defaultIcons:Landroid/util/SparseArray;

    .line 47
    .line 48
    invoke-virtual {p1, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Ls1/d;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    sget-object v2, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 65
    .line 66
    iget-object v3, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, LD1/t;

    .line 73
    .line 74
    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v2, v3}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    sget-object v3, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/N2;->a(Lcom/android/launcher3/util/p0;)Lcom/android/launcher3/util/p0;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v1, v2}, Ls1/d;->t(Lcom/android/launcher3/util/p0;)Ls1/d;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v2, p0, Lcom/android/quickstep/TaskIconCache;->defaultIcons:Landroid/util/SparseArray;

    .line 93
    .line 94
    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 98
    .line 99
    invoke-virtual {v1, p0}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 104
    .line 105
    .line 106
    :goto_1
    monitor-exit v0

    .line 107
    return-object p0

    .line 108
    :goto_2
    monitor-exit v0

    .line 109
    throw p0
.end method

.method private final getIcon(Landroid/app/ActivityManager$TaskDescription;I)Landroid/graphics/Bitmap;
    .locals 0

    .line 8
    invoke-virtual {p1}, Landroid/app/ActivityManager$TaskDescription;->getInMemoryIcon()Landroid/graphics/Bitmap;

    move-result-object p0

    if-nez p0, :cond_0

    .line 9
    invoke-virtual {p1}, Landroid/app/ActivityManager$TaskDescription;->getIconFilename()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2}, Landroid/app/ActivityManager$TaskDescription;->loadTaskDescriptionIcon(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method private final getIconFactory()Ls1/b;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/TaskIconCache;->createIconFactory()Ls1/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->_iconFactory:Ls1/b;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/quickstep/TaskIconCache;->createIconFactory()Ls1/b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/android/quickstep/TaskIconCache;->_iconFactory:Ls1/b;

    .line 21
    .line 22
    :cond_1
    return-object v0
.end method

.method private static final getIconInBackground$lambda$3(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskIconCache;->getCacheEntry(Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final getIconInBackground$lambda$4(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V
    .locals 2

    .line 1
    const-string v0, "result"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getContentDescription()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getTitle()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getContentDescription()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getTitle()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-interface {p1, v0, v1, p3}, Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;->onTaskIconReceived(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 40
    .line 41
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 42
    .line 43
    invoke-direct {p2, p0}, Lcom/android/quickstep/TaskIconCache;->dispatchIconUpdate(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private static final getIconInBackgroundMFV$lambda$13(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskIconCache;->getCacheEntry(Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final getIconInBackgroundMFV$lambda$14(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V
    .locals 8

    .line 1
    const-string v0, "result"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getContentDescription()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getTitle()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getContentDescription()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getTitle()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->isLocked()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getSupportSplit()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-virtual {p3}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getSupportResize()Z

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    move-object v1, p1

    .line 61
    invoke-interface/range {v1 .. v7}, Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;->onTaskIconReceivedMFV(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 65
    .line 66
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 67
    .line 68
    invoke-direct {p2, p0}, Lcom/android/quickstep/TaskIconCache;->dispatchIconUpdate(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private static final invalidateCacheEntries$lambda$7(Lcom/android/quickstep/TaskIconCache;Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 2
    .line 3
    new-instance v0, Lcom/android/quickstep/Z4;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/Z4;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/TaskKeyLruCache;->removeAll(Ljava/util/function/Predicate;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static final invalidateCacheEntries$lambda$7$lambda$6(Ljava/lang/String;Landroid/os/UserHandle;Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Z
    .locals 1

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    iget p1, p2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 21
    .line 22
    if-ne p0, p1, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method private final resetFactory()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/TaskIconCache;->_iconFactory:Ls1/b;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/TaskKeyLruCache;->evictAll()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final updateTitleIfNeeded(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/content/pm/ActivityInfo;Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    sget-object v0, Lcom/android/quickstep/TaskIconCache;->AIGC_COMPONENT_NAME:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getComponent()Landroid/content/ComponentName;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {v0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget p1, p2, Landroid/content/pm/ActivityInfo;->labelRes:I

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->context:Landroid/content/Context;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object v0, p2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p2, p2, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1, p2}, Landroid/content/pm/PackageManager;->getText(Ljava/lang/String;ILandroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p3, p0}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->setTitle(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catch_0
    move-exception p0

    .line 49
    sget-object p1, Lcom/android/quickstep/TaskIconCache;->TAG:Ljava/lang/String;

    .line 50
    .line 51
    new-instance p2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string p3, "updateTitleIfNeeded: error e = "

    .line 57
    .line 58
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final clearCache()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/f5;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/f5;-><init>(Lcom/android/quickstep/TaskIconCache;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getIcon(Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    .line 2
    new-instance v0, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    if-nez p0, :cond_0

    const-string p0, ""

    :cond_0
    move-object v2, p0

    iget-object v3, p1, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    const-string p0, "title"

    invoke-static {v3, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v7, 0x38

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v8}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;ZZZILkotlin/jvm/internal/j;)V

    return-object v0

    .line 3
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskIconCache;->getCacheEntry(Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    move-result-object p2

    .line 4
    invoke-virtual {p2}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 5
    invoke-virtual {p2}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getContentDescription()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 6
    invoke-virtual {p2}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->getTitle()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 7
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskIconCache;->dispatchIconUpdate(I)V

    return-object p2
.end method

.method public final getIconInBackground(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;)Lcom/android/launcher3/util/w;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;",
            ")",
            "Lcom/android/launcher3/util/w<",
            "*>;"
        }
    .end annotation

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "callback"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, ""

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    move-object p0, v1

    .line 25
    :cond_0
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move-object v1, p1

    .line 31
    :goto_0
    invoke-interface {p2, v0, p0, v1}, Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;->onTaskIconReceived(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    :cond_2
    new-instance v0, Lcom/android/launcher3/util/w;

    .line 37
    .line 38
    new-instance v1, Lcom/android/quickstep/a5;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/a5;-><init>(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 44
    .line 45
    const-string v3, "MAIN_EXECUTOR"

    .line 46
    .line 47
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v3, Lcom/android/quickstep/b5;

    .line 51
    .line 52
    invoke-direct {v3, p1, p2, p0}, Lcom/android/quickstep/b5;-><init>(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;Lcom/android/quickstep/TaskIconCache;)V

    .line 53
    .line 54
    .line 55
    const/16 v5, 0x8

    .line 56
    .line 57
    const/4 v6, 0x0

    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;Ljava/lang/Runnable;ILkotlin/jvm/internal/j;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 63
    .line 64
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public final getIconInBackgroundMFV(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/views/TaskContainer;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;)Lcom/android/launcher3/util/w;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Lcom/android/quickstep/views/TaskContainer;",
            "Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;",
            ")",
            "Lcom/android/launcher3/util/w<",
            "*>;"
        }
    .end annotation

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "container"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "callback"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->isLocked()Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p2, Lcom/android/quickstep/views/TaskContainer;->supportSplit:Ljava/lang/Boolean;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p2, Lcom/android/quickstep/views/TaskContainer;->supportResize:Ljava/lang/Boolean;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v2, p1, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, ""

    .line 45
    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    move-object v3, v0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    move-object v3, p0

    .line 51
    :goto_0
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->title:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p0, :cond_1

    .line 54
    .line 55
    move-object v4, v0

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    move-object v4, p0

    .line 58
    :goto_1
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->isLocked()Ljava/lang/Boolean;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iget-object v6, p2, Lcom/android/quickstep/views/TaskContainer;->supportSplit:Ljava/lang/Boolean;

    .line 63
    .line 64
    iget-object v7, p2, Lcom/android/quickstep/views/TaskContainer;->supportResize:Ljava/lang/Boolean;

    .line 65
    .line 66
    move-object v1, p3

    .line 67
    invoke-interface/range {v1 .. v7}, Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;->onTaskIconReceivedMFV(Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    return-object p0

    .line 72
    :cond_2
    move-object v1, p3

    .line 73
    new-instance v0, Lcom/android/launcher3/util/w;

    .line 74
    .line 75
    move-object p2, v1

    .line 76
    new-instance v1, Lcom/android/quickstep/c5;

    .line 77
    .line 78
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/c5;-><init>(Lcom/android/quickstep/TaskIconCache;Lcom/android/systemui/shared/recents/model/Task;)V

    .line 79
    .line 80
    .line 81
    sget-object v2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 82
    .line 83
    const-string p3, "MAIN_EXECUTOR"

    .line 84
    .line 85
    invoke-static {v2, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    new-instance v3, Lcom/android/quickstep/d5;

    .line 89
    .line 90
    invoke-direct {v3, p1, p2, p0}, Lcom/android/quickstep/d5;-><init>(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallbackMFV;Lcom/android/quickstep/TaskIconCache;)V

    .line 91
    .line 92
    .line 93
    const/16 v5, 0x8

    .line 94
    .line 95
    const/4 v6, 0x0

    .line 96
    const/4 v4, 0x0

    .line 97
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/util/w;-><init>(Ljava/util/function/Supplier;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;Ljava/lang/Runnable;ILkotlin/jvm/internal/j;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 101
    .line 102
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    return-object v0
.end method

.method public final getTaskVisualsChangeListener()Lcom/android/quickstep/util/TaskVisualsChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->taskVisualsChangeListener:Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final invalidateCacheEntries(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 2

    .line 1
    const-string v0, "pkg"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "handle"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/TaskIconCache;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    new-instance v1, Lcom/android/quickstep/e5;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1, p2}, Lcom/android/quickstep/e5;-><init>(Lcom/android/quickstep/TaskIconCache;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final isLowRam()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/TaskIconCache;->isLowRam:Z

    .line 2
    .line 3
    return p0
.end method

.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "info"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    and-int/lit8 p1, p3, 0x4

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/TaskIconCache;->clearCache()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final onTaskRemoved(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V
    .locals 1

    .line 1
    const-string v0, "taskKey"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TaskKeyLruCache;->remove(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final registerTaskVisualsChangeListener(Lcom/android/quickstep/util/TaskVisualsChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskIconCache;->taskVisualsChangeListener:Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public final removeTaskVisualsChangeListener()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/TaskIconCache;->taskVisualsChangeListener:Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 3
    .line 4
    return-void
.end method

.method public final setLowRam(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/TaskIconCache;->isLowRam:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setTaskVisualsChangeListener(Lcom/android/quickstep/util/TaskVisualsChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskIconCache;->taskVisualsChangeListener:Lcom/android/quickstep/util/TaskVisualsChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public final updateIconCacheLockedState(Lcom/android/systemui/shared/recents/model/Task;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/TaskIconCache;->iconCache:Lcom/android/quickstep/util/TaskKeyLruCache;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TaskKeyLruCache;->getAndInvalidateIfModified(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/android/quickstep/TaskIconCache$TaskCacheEntry;->setLocked(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
