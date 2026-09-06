.class public final synthetic Lcom/android/quickstep/util/M;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lg1/c;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/android/quickstep/dagger/QuickstepBaseAppComponent;->getContextualSearchStateManager()Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
