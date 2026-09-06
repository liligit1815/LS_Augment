.class public final synthetic Lcom/android/quickstep/util/n1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/graphics/HardwareRenderer$FrameDrawingCallback;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field public final synthetic h:I

.field public final synthetic i:Lcom/android/quickstep/util/SurfaceTransaction;

.field public final synthetic j:Landroid/view/SurfaceControl$Transaction;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SurfaceTransactionApplier;ILcom/android/quickstep/util/SurfaceTransaction;Landroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/n1;->g:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/util/n1;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/n1;->i:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/n1;->j:Landroid/view/SurfaceControl$Transaction;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onFrameDraw(J)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/n1;->g:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/n1;->h:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/n1;->i:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/n1;->j:Landroid/view/SurfaceControl$Transaction;

    .line 8
    .line 9
    move-wide v4, p1

    .line 10
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->b(Lcom/android/quickstep/util/SurfaceTransactionApplier;ILcom/android/quickstep/util/SurfaceTransaction;Landroid/view/SurfaceControl$Transaction;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
