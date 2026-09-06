.class public Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
.super Ljava/lang/Object;
.source "SurfaceTransaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SurfaceTransaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SurfaceProperties"
.end annotation


# instance fields
.field private final mSurface:Landroid/view/SurfaceControl;

.field final synthetic this$0:Lcom/android/quickstep/util/SurfaceTransaction;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SurfaceTransaction;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    move-result-object v0

    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    invoke-virtual {v0, v1, p1}, Landroid/view/SurfaceControl$Transaction;->setCornerRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    return-object p0
.end method

.method public setCornerRadius(FF)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 1

    .line 2
    const-string p2, "SurfaceTransaction"

    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    return-object p0

    :catch_0
    move-exception v0

    goto :goto_0

    .line 5
    :cond_0
    const-string v0, "setCornerRadius mSurface is null"

    invoke-static {p2, v0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 6
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 7
    const-string p1, "setCornerRadius exception"

    invoke-static {p2, p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object p0
.end method

.method public setLayer(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/SurfaceControl$Transaction;->setLayer(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 10
    .line 11
    invoke-static {v2}, Lcom/android/quickstep/util/SurfaceTransaction;->a(Lcom/android/quickstep/util/SurfaceTransaction;)[F

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/SurfaceControl$Transaction;->setMatrix(Landroid/view/SurfaceControl;Landroid/graphics/Matrix;[F)Landroid/view/SurfaceControl$Transaction;

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public setShadowRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/SurfaceControl$Transaction;->setShadowRadius(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public setShow()Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public setWindowBlurRadius(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Landroid/view/SurfaceControl$Transaction;->setSelfBlurRadius(Landroid/view/SurfaceControl;I)Landroid/view/SurfaceControl$Transaction;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "setWindowBlurRadius call method error, windowBlurRadius="

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, ", "

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "SurfaceTransaction"

    .line 43
    .line 44
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    :cond_0
    return-object p0
.end method

.method public setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->this$0:Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/util/SurfaceTransaction;->b(Lcom/android/quickstep/util/SurfaceTransaction;)Landroid/view/SurfaceControl$Transaction;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->mSurface:Landroid/view/SurfaceControl;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/SurfaceControl$Transaction;->setWindowCrop(Landroid/view/SurfaceControl;Landroid/graphics/Rect;)Landroid/view/SurfaceControl$Transaction;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method
