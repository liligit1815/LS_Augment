.class Lcom/android/quickstep/util/SurfaceTransactionApplier$1;
.super Ljava/lang/Object;
.source "SurfaceTransactionApplier.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field final synthetic val$targetView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SurfaceTransactionApplier;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SurfaceTransactionApplier$1;->this$0:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/SurfaceTransactionApplier$1;->val$targetView:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/util/SurfaceTransactionApplier$1;->this$0:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->c(Lcom/android/quickstep/util/SurfaceTransactionApplier;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/quickstep/util/SurfaceTransactionApplier$1;->val$targetView:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/quickstep/util/SurfaceTransactionApplier$1;->this$0:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/util/SurfaceTransactionApplier$1;->val$targetView:Landroid/view/View;

    .line 17
    .line 18
    invoke-static {p1, p0}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->d(Lcom/android/quickstep/util/SurfaceTransactionApplier;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
