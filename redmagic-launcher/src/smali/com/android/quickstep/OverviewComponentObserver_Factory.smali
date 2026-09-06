.class public final Lcom/android/quickstep/OverviewComponentObserver_Factory;
.super Ljava/lang/Object;
.source "OverviewComponentObserver_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/quickstep/OverviewComponentObserver;",
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

.field private final lifecycleTrackerProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field

.field private final recentsDisplayModelProvider:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/quickstep/fallback/window/RecentsDisplayModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/fallback/window/RecentsDisplayModel;",
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
    iput-object p1, p0, Lcom/android/quickstep/OverviewComponentObserver_Factory;->contextProvider:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/OverviewComponentObserver_Factory;->recentsDisplayModelProvider:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/OverviewComponentObserver_Factory;->lifecycleTrackerProvider:Lg4/a;

    .line 9
    .line 10
    return-void
.end method

.method public static create(Lg4/a;Lg4/a;Lg4/a;)Lcom/android/quickstep/OverviewComponentObserver_Factory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/quickstep/fallback/window/RecentsDisplayModel;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Lcom/android/quickstep/OverviewComponentObserver_Factory;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/OverviewComponentObserver_Factory;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/quickstep/OverviewComponentObserver_Factory;-><init>(Lg4/a;Lg4/a;Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static newInstance(Landroid/content/Context;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/OverviewComponentObserver;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/OverviewComponentObserver;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/quickstep/OverviewComponentObserver;-><init>(Landroid/content/Context;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/launcher3/util/K;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public get()Lcom/android/quickstep/OverviewComponentObserver;
    .locals 2

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/OverviewComponentObserver_Factory;->contextProvider:Lg4/a;

    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lcom/android/quickstep/OverviewComponentObserver_Factory;->recentsDisplayModelProvider:Lg4/a;

    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    iget-object p0, p0, Lcom/android/quickstep/OverviewComponentObserver_Factory;->lifecycleTrackerProvider:Lg4/a;

    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/util/K;

    invoke-static {v0, v1, p0}, Lcom/android/quickstep/OverviewComponentObserver_Factory;->newInstance(Landroid/content/Context;Lcom/android/quickstep/fallback/window/RecentsDisplayModel;Lcom/android/launcher3/util/K;)Lcom/android/quickstep/OverviewComponentObserver;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewComponentObserver_Factory;->get()Lcom/android/quickstep/OverviewComponentObserver;

    move-result-object p0

    return-object p0
.end method
