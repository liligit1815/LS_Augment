.class public final Lcom/android/launcher3/util/o3;
.super Ljava/lang/Object;
.source "WeakCleanupSet.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/o3$b;
    }
.end annotation


# instance fields
.field private final a:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/o3$b;",
            ">;"
        }
    .end annotation
.end field

.field private b:Z


# direct methods
.method public constructor <init>(LW/d;)V
    .locals 2

    .line 1
    const-string v0, "owner"

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
    new-instance v0, Ljava/util/WeakHashMap;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/android/launcher3/util/o3;->a:Ljava/util/Set;

    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 21
    .line 22
    new-instance v1, Lcom/android/launcher3/util/n3;

    .line 23
    .line 24
    invoke-direct {v1, p1, p0}, Lcom/android/launcher3/util/n3;-><init>(LW/d;Lcom/android/launcher3/util/o3;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(LW/d;Lcom/android/launcher3/util/o3;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/o3;->b(LW/d;Lcom/android/launcher3/util/o3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final b(LW/d;Lcom/android/launcher3/util/o3;)V
    .locals 1

    .line 1
    invoke-interface {p0}, LW/d;->getLifecycle()Landroidx/lifecycle/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/android/launcher3/util/o3$a;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/android/launcher3/util/o3$a;-><init>(Lcom/android/launcher3/util/o3;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/lifecycle/g;->a(LW/c;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static final synthetic c(Lcom/android/launcher3/util/o3;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/o3;->a:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Lcom/android/launcher3/util/o3;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/util/o3;->b:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final e(Lcom/android/launcher3/util/o3$b;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/launcher3/util/o3;->b:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Lcom/android/launcher3/util/o3$b;->onOwnerDestroyed()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/util/o3;->a:Ljava/util/Set;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method
