.class public final Lcom/android/quickstep/util/GestureExclusionManager$exclusionListener$1;
.super Landroid/view/ISystemGestureExclusionListener$Stub;
.source "GestureExclusionManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/GestureExclusionManager;-><init>(Landroid/view/IWindowManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/GestureExclusionManager;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/GestureExclusionManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/GestureExclusionManager$exclusionListener$1;->this$0:Lcom/android/quickstep/util/GestureExclusionManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ISystemGestureExclusionListener$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;Landroid/graphics/Region;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/util/GestureExclusionManager$exclusionListener$1;->onSystemGestureExclusionChanged$lambda$1(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;Landroid/graphics/Region;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onSystemGestureExclusionChanged$lambda$1(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;Landroid/graphics/Region;)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/GestureExclusionManager;->access$setLastExclusionRegion$p(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p2}, Lcom/android/quickstep/util/GestureExclusionManager;->access$setLastUnrestrictedOrNull$p(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/quickstep/util/GestureExclusionManager;->access$getListeners$p(Lcom/android/quickstep/util/GestureExclusionManager;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;

    .line 26
    .line 27
    invoke-interface {v0, p1, p2}, Lcom/android/quickstep/util/GestureExclusionManager$ExclusionListener;->onGestureExclusionChanged(Landroid/graphics/Region;Landroid/graphics/Region;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public onSystemGestureExclusionChanged(ILandroid/graphics/Region;Landroid/graphics/Region;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/GestureExclusionManager$exclusionListener$1;->this$0:Lcom/android/quickstep/util/GestureExclusionManager;

    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/util/d0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p2, p3}, Lcom/android/quickstep/util/d0;-><init>(Lcom/android/quickstep/util/GestureExclusionManager;Landroid/graphics/Region;Landroid/graphics/Region;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
