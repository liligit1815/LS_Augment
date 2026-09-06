.class public final Lcom/android/quickstep/util/GestureExclusionManager;
.super Ljava/lang/Object;
.source "GestureExclusionManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/GestureExclusionManager$Companion;,
        Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/GestureExclusionManager$Companion;

.field public static final EMPTY_REGION:Landroid/graphics/Region;

.field public static final INSTANCE:Lcom/android/quickstep/util/GestureExclusionManager;

.field private static final TAG:Ljava/lang/String; = "GestureExclusionManager"


# instance fields
.field private final exclusionListener:Landroid/view/ISystemGestureExclusionListener$Stub;

.field private lastExclusionRegion:Landroid/graphics/Region;

.field private lastUnrestrictedOrNull:Landroid/graphics/Region;

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;",
            ">;"
        }
    .end annotation
.end field

.field private final windowManager:Landroid/view/IWindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/GestureExclusionManager$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/GestureExclusionManager$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/GestureExclusionManager;->Companion:Lcom/android/quickstep/util/GestureExclusionManager$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/util/GestureExclusionManager;

    .line 10
    .line 11
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/GestureExclusionManager;-><init>(Landroid/view/IWindowManager;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/android/quickstep/util/GestureExclusionManager;->INSTANCE:Lcom/android/quickstep/util/GestureExclusionManager;

    .line 22
    .line 23
    new-instance v0, Landroid/graphics/Region;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/android/quickstep/util/GestureExclusionManager;->EMPTY_REGION:Landroid/graphics/Region;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/view/IWindowManager;)V
    .locals 1

    .line 1
    const-string v0, "windowManager"

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
    iput-object p1, p0, Lcom/android/quickstep/util/GestureExclusionManager;->windowManager:Landroid/view/IWindowManager;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/util/GestureExclusionManager;->listeners:Ljava/util/List;

    .line 17
    .line 18
    new-instance p1, Lcom/android/quickstep/util/GestureExclusionManager$exclusionListener$1;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/GestureExclusionManager$exclusionListener$1;-><init>(Lcom/android/quickstep/util/GestureExclusionManager;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/quickstep/util/GestureExclusionManager;->exclusionListener:Landroid/view/ISystemGestureExclusionListener$Stub;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/GestureExclusionManager;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/GestureExclusionManager;->removeListener$lambda$1(Lcom/android/quickstep/util/GestureExclusionManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getListeners$p(Lcom/android/quickstep/util/GestureExclusionManager;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->listeners:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$setLastExclusionRegion$p(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/GestureExclusionManager;->lastExclusionRegion:Landroid/graphics/Region;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setLastUnrestrictedOrNull$p(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/GestureExclusionManager;->lastUnrestrictedOrNull:Landroid/graphics/Region;

    .line 2
    .line 3
    return-void
.end method

.method private static final addListener$lambda$0(Lcom/android/quickstep/util/GestureExclusionManager;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->windowManager:Landroid/view/IWindowManager;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->exclusionListener:Landroid/view/ISystemGestureExclusionListener$Stub;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p0, v1}, Landroid/view/IWindowManager;->registerSystemGestureExclusionListener(Landroid/view/ISystemGestureExclusionListener;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    const-string v0, "GestureExclusionManager"

    .line 12
    .line 13
    const-string v1, "Failed to register gesture exclusion listener"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/GestureExclusionManager;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/GestureExclusionManager;->addListener$lambda$0(Lcom/android/quickstep/util/GestureExclusionManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic getExclusionListener$annotations()V
    .locals 0

    .line 1
    return-void
.end method

.method private static final removeListener$lambda$1(Lcom/android/quickstep/util/GestureExclusionManager;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->windowManager:Landroid/view/IWindowManager;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->exclusionListener:Landroid/view/ISystemGestureExclusionListener$Stub;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p0, v1}, Landroid/view/IWindowManager;->unregisterSystemGestureExclusionListener(Landroid/view/ISystemGestureExclusionListener;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    const-string v0, "GestureExclusionManager"

    .line 12
    .line 13
    const-string v1, "Failed to unregister gesture exclusion listener"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final addListener(Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;)V
    .locals 2

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->listeners:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/android/quickstep/util/GestureExclusionManager;->listeners:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/util/b0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/b0;-><init>(Lcom/android/quickstep/util/GestureExclusionManager;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->lastExclusionRegion:Landroid/graphics/Region;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->lastUnrestrictedOrNull:Landroid/graphics/Region;

    .line 33
    .line 34
    invoke-interface {p1, v0, p0}, Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;->onGestureExclusionChanged(Landroid/graphics/Region;Landroid/graphics/Region;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final getExclusionListener()Landroid/view/ISystemGestureExclusionListener$Stub;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->exclusionListener:Landroid/view/ISystemGestureExclusionListener$Stub;

    .line 2
    .line 3
    return-object p0
.end method

.method public final removeListener(Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/GestureExclusionManager;->listeners:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/quickstep/util/GestureExclusionManager;->listeners:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 23
    .line 24
    new-instance v0, Lcom/android/quickstep/util/c0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/c0;-><init>(Lcom/android/quickstep/util/GestureExclusionManager;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
