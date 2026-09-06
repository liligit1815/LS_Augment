.class public final synthetic Lcom/android/quickstep/util/z;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/AsyncClockEventDelegate;

.field public final synthetic b:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/z;->a:Lcom/android/quickstep/util/AsyncClockEventDelegate;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/z;->b:Landroid/content/Intent;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/z;->a:Lcom/android/quickstep/util/AsyncClockEventDelegate;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/z;->b:Landroid/content/Intent;

    .line 4
    .line 5
    check-cast p1, Landroid/content/BroadcastReceiver;

    .line 6
    .line 7
    check-cast p2, Landroid/os/Handler;

    .line 8
    .line 9
    invoke-static {v0, p0, p1, p2}, Lcom/android/quickstep/util/AsyncClockEventDelegate;->b(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/content/Intent;Landroid/content/BroadcastReceiver;Landroid/os/Handler;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
