.class public final Lcom/android/quickstep/RecentsModel_Factory;
.super Ljava/lang/Object;
.source "RecentsModel_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/RecentsModel;",
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

.field private final desktopVisibilityControllerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "LP1/k;",
            ">;"
        }
    .end annotation
.end field

.field private final displayControllerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;"
        }
    .end annotation
.end field

.field private final lockedUserStateProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/n1;",
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

.field private final themeManagerLazyProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ln1/C;",
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

.field private final trackerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/SystemUiProxy;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/TopTaskTracker;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/n1;",
            ">;",
            "Lg4/a<",
            "Ln1/C;",
            ">;",
            "Lg4/a<",
            "LP1/k;",
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
    iput-object p1, p0, Lcom/android/quickstep/RecentsModel_Factory;->contextProvider:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/RecentsModel_Factory;->systemUiProxyProvider:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/RecentsModel_Factory;->topTaskTrackerProvider:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/RecentsModel_Factory;->displayControllerProvider:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/RecentsModel_Factory;->lockedUserStateProvider:Lg4/a;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/RecentsModel_Factory;->themeManagerLazyProvider:Lg4/a;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/android/quickstep/RecentsModel_Factory;->desktopVisibilityControllerProvider:Lg4/a;

    .line 17
    .line 18
    iput-object p8, p0, Lcom/android/quickstep/RecentsModel_Factory;->trackerProvider:Lg4/a;

    .line 19
    .line 20
    return-void
.end method

.method public static create(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lcom/android/quickstep/RecentsModel_Factory;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/SystemUiProxy;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/TopTaskTracker;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/Z;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/n1;",
            ">;",
            "Lg4/a<",
            "Ln1/C;",
            ">;",
            "Lg4/a<",
            "LP1/k;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Lcom/android/quickstep/RecentsModel_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/RecentsModel_Factory;

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
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Lcom/android/quickstep/RecentsModel_Factory;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static newInstance(Landroid/content/Context;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/n1;Le4/a;LP1/k;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/RecentsModel;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/quickstep/SystemUiProxy;",
            "Lcom/android/quickstep/TopTaskTracker;",
            "Lcom/android/launcher3/util/Z;",
            "Lcom/android/launcher3/util/n1;",
            "Le4/a<",
            "Ln1/C;",
            ">;",
            "LP1/k;",
            "Lcom/android/launcher3/util/K;",
            ")",
            "Lcom/android/quickstep/RecentsModel;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/RecentsModel;

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
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Lcom/android/quickstep/RecentsModel;-><init>(Landroid/content/Context;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/n1;Le4/a;LP1/k;Lcom/android/launcher3/util/K;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/quickstep/RecentsModel;
    .locals 9

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/RecentsModel_Factory;->contextProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/content/Context;

    iget-object v0, p0, Lcom/android/quickstep/RecentsModel_Factory;->systemUiProxyProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/android/quickstep/SystemUiProxy;

    iget-object v0, p0, Lcom/android/quickstep/RecentsModel_Factory;->topTaskTrackerProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/android/quickstep/TopTaskTracker;

    iget-object v0, p0, Lcom/android/quickstep/RecentsModel_Factory;->displayControllerProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/android/launcher3/util/Z;

    iget-object v0, p0, Lcom/android/quickstep/RecentsModel_Factory;->lockedUserStateProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/android/launcher3/util/n1;

    iget-object v0, p0, Lcom/android/quickstep/RecentsModel_Factory;->themeManagerLazyProvider:Lg4/a;

    invoke-static {v0}, Lf4/b;->b(Lg4/a;)Le4/a;

    move-result-object v6

    iget-object v0, p0, Lcom/android/quickstep/RecentsModel_Factory;->desktopVisibilityControllerProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, LP1/k;

    iget-object p0, p0, Lcom/android/quickstep/RecentsModel_Factory;->trackerProvider:Lg4/a;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v8, p0

    check-cast v8, Lcom/android/launcher3/util/K;

    invoke-static/range {v1 .. v8}, Lcom/android/quickstep/RecentsModel_Factory;->newInstance(Landroid/content/Context;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/n1;Le4/a;LP1/k;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/RecentsModel;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel_Factory;->get()Lcom/android/quickstep/RecentsModel;

    move-result-object p0

    return-object p0
.end method
