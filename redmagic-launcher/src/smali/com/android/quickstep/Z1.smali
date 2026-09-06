.class public final synthetic Lcom/android/quickstep/Z1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/QuickstepTestInformationHandler;

.field public final synthetic b:Ljava/util/function/Consumer;

.field public final synthetic c:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/QuickstepTestInformationHandler;Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/Z1;->a:Lcom/android/quickstep/QuickstepTestInformationHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/Z1;->b:Ljava/util/function/Consumer;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/Z1;->c:Ljava/util/concurrent/CountDownLatch;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/Z1;->a:Lcom/android/quickstep/QuickstepTestInformationHandler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/Z1;->b:Ljava/util/function/Consumer;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/Z1;->c:Ljava/util/concurrent/CountDownLatch;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/QuickstepTestInformationHandler;->E(Lcom/android/quickstep/QuickstepTestInformationHandler;Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;)Lcom/android/quickstep/util/TISBindHelper;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
