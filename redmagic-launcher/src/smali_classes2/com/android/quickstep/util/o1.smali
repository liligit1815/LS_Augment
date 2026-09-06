.class public final synthetic Lcom/android/quickstep/util/o1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/SurfaceTransactionApplier;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/o1;->g:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/o1;->g:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->onApplyMessage(Landroid/os/Message;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
