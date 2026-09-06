.class LP1/h$a;
.super Ljava/lang/Object;
.source "DepthController.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LP1/h;->x()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LP1/h;


# direct methods
.method constructor <init>(LP1/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, LP1/h$a;->g:LP1/h;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(LP1/h$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LP1/h$a;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/view/CrossWindowBlurListeners;->getInstance()Landroid/view/CrossWindowBlurListeners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, LP1/h$a;->g:LP1/h;

    .line 6
    .line 7
    invoke-static {v1}, LP1/h;->k(LP1/h;)Lcom/android/launcher3/C2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/app/Activity;->getMainExecutor()Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object p0, p0, LP1/h$a;->g:LP1/h;

    .line 16
    .line 17
    invoke-static {p0}, LP1/h;->f(LP1/h;)Ljava/util/function/Consumer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Landroid/view/CrossWindowBlurListeners;->addListener(Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v0, LP1/g;

    .line 4
    .line 5
    invoke-direct {v0, p0}, LP1/g;-><init>(LP1/h$a;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, LP1/h$a;->g:LP1/h;

    .line 12
    .line 13
    invoke-static {p1}, LP1/h;->j(LP1/h;)Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, LP1/h$a;->g:LP1/h;

    .line 22
    .line 23
    invoke-static {v0}, LP1/h;->g(LP1/h;)Ljava/lang/Runnable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1, v0}, Lcom/android/launcher3/views/ScrimView;->addOpaquenessListener(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, LP1/h$a;->g:LP1/h;

    .line 31
    .line 32
    invoke-virtual {p0}, LP1/h;->applyDepthAndBlur()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/h$a;->g:LP1/h;

    .line 2
    .line 3
    invoke-static {p0}, LP1/h;->i(LP1/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
