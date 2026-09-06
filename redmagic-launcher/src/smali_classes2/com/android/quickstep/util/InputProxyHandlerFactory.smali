.class public Lcom/android/quickstep/util/InputProxyHandlerFactory;
.super Ljava/lang/Object;
.source "InputProxyHandlerFactory.java"

# interfaces
.implements Ljava/util/function/Supplier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Supplier<",
        "Lcom/android/quickstep/InputConsumer;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

.field private final mGestureState:Lcom/android/quickstep/GestureState;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/BaseContainerInterface;Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/InputProxyHandlerFactory;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/InputProxyHandlerFactory;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public get()Lcom/android/quickstep/InputConsumer;
    .locals 4

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/util/InputProxyHandlerFactory;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/InputProxyHandlerFactory;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    move-result p0

    invoke-static {p0}, Lcom/android/quickstep/InputConsumer;->createNoOpInputConsumer(I)Lcom/android/quickstep/InputConsumer;

    move-result-object p0

    return-object p0

    .line 4
    :cond_0
    new-instance v1, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;

    iget-object p0, p0, Lcom/android/quickstep/util/InputProxyHandlerFactory;->mGestureState:Lcom/android/quickstep/GestureState;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v1, p0, v0, v2, v3}, Lcom/android/quickstep/inputconsumers/OverviewInputConsumer;-><init>(Lcom/android/quickstep/GestureState;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/systemui/shared/system/InputMonitorCompat;Z)V

    return-object v1
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputProxyHandlerFactory;->get()Lcom/android/quickstep/InputConsumer;

    move-result-object p0

    return-object p0
.end method
