.class public final Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;
.super Ljava/lang/Object;
.source "ContextualSearchStateManager_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/util/ContextualSearchStateManager;",
        ">;"
    }
.end annotation


# instance fields
.field private final contextProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final lifeCycleProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field

.field private final settingsCacheProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;"
        }
    .end annotation
.end field

.field private final systemUiProxyProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/quickstep/SystemUiProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final topTaskTrackerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/quickstep/TopTaskTracker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/SystemUiProxy;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/TopTaskTracker;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->contextProvider:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->settingsCacheProvider:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->systemUiProxyProvider:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->topTaskTrackerProvider:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->lifeCycleProvider:Lg4/a;

    .line 13
    .line 14
    return-void
.end method

.method public static create(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/p2;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/SystemUiProxy;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/TopTaskTracker;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static newInstance(Landroid/content/Context;Lcom/android/launcher3/util/p2;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/util/ContextualSearchStateManager;
    .locals 6

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/ContextualSearchStateManager;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p2;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/K;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/quickstep/util/ContextualSearchStateManager;
    .locals 4

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->contextProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->settingsCacheProvider:Lg4/a;

    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/util/p2;

    iget-object v2, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->systemUiProxyProvider:Lg4/a;

    invoke-interface {v2}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/quickstep/SystemUiProxy;

    iget-object v3, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->topTaskTrackerProvider:Lg4/a;

    invoke-interface {v3}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/quickstep/TopTaskTracker;

    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->lifeCycleProvider:Lg4/a;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/util/K;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->newInstance(Landroid/content/Context;Lcom/android/launcher3/util/p2;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/util/ContextualSearchStateManager;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager_Factory;->get()Lcom/android/quickstep/util/ContextualSearchStateManager;

    move-result-object p0

    return-object p0
.end method
