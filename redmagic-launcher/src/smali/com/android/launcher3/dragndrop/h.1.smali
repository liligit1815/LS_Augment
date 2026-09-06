.class public abstract Lcom/android/launcher3/dragndrop/h;
.super Ljava/lang/Object;
.source "BaseItemDragListener.java"

# interfaces
.implements Landroid/view/View$OnDragListener;
.implements Lcom/android/launcher3/m0;
.implements Lcom/android/launcher3/dragndrop/p$a;
.implements Lcom/android/launcher3/util/H$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/view/View$OnDragListener;",
        "Lcom/android/launcher3/m0;",
        "Lcom/android/launcher3/dragndrop/p$a;",
        "Lcom/android/launcher3/util/H$b<",
        "Lcom/android/launcher3/C2;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Landroid/graphics/Rect;

.field private final h:I

.field private final i:I

.field private final j:Ljava/lang/String;

.field protected k:Lcom/android/launcher3/C2;

.field private l:Lcom/android/launcher3/dragndrop/j;

.field private m:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public constructor <init>(Landroid/graphics/Rect;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/h;->g:Landroid/graphics/Rect;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/dragndrop/h;->h:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/dragndrop/h;->i:I

    .line 9
    .line 10
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/h;->j:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(D)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->d3()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public b(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 13
    .line 14
    const/high16 p1, 0x3f000000    # 0.5f

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public c(Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 4
    .line 5
    const/high16 p1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method protected abstract e()Lcom/android/launcher3/widget/H0;
.end method

.method public f()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.android.launcher3.drag_and_drop/"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/h;->j:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public g(Lcom/android/launcher3/C2;Z)Z
    .locals 2

    .line 1
    invoke-static {p1, p2}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 9
    .line 10
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2, p0}, Landroid/widget/FrameLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->s2()LQ1/d;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    const/4 v0, 0x2

    .line 25
    invoke-virtual {p2, v0}, LQ1/d;->o(I)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/h;->l:Lcom/android/launcher3/dragndrop/j;

    .line 35
    .line 36
    const/4 p1, 0x4

    .line 37
    invoke-static {p1}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/h;->m:Ljava/util/concurrent/ScheduledExecutorService;

    .line 42
    .line 43
    new-instance p2, Lcom/android/launcher3/dragndrop/g;

    .line 44
    .line 45
    invoke-direct {p2, p0}, Lcom/android/launcher3/dragndrop/g;-><init>(Lcom/android/launcher3/dragndrop/h;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 v0, 0x3e8

    .line 49
    .line 50
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 51
    .line 52
    invoke-interface {p1, p2, v0, v1, p0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method protected h(Landroid/view/DragEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p0}, Lcom/android/launcher3/dragndrop/h;->i(Landroid/view/DragEvent;Lcom/android/launcher3/dragndrop/p$a;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected i(Landroid/view/DragEvent;Lcom/android/launcher3/dragndrop/p$a;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/DragEvent;->getClipDescription()Landroid/content/ClipDescription;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/h;->f()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v5, Landroid/graphics/Point;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    float-to-int v0, v0

    .line 25
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    float-to-int p1, p1

    .line 30
    invoke-direct {v5, v0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 31
    .line 32
    .line 33
    new-instance v7, Lcom/android/launcher3/dragndrop/p;

    .line 34
    .line 35
    invoke-direct {v7}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v5, v7, Lcom/android/launcher3/dragndrop/p;->c:Landroid/graphics/Point;

    .line 39
    .line 40
    iput-object p2, v7, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/h;->e()Lcom/android/launcher3/widget/H0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Landroid/graphics/Rect;

    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/h;->g:Landroid/graphics/Rect;

    .line 49
    .line 50
    invoke-direct {v2, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 51
    .line 52
    .line 53
    iget v3, p0, Lcom/android/launcher3/dragndrop/h;->h:I

    .line 54
    .line 55
    iget v4, p0, Lcom/android/launcher3/dragndrop/h;->i:I

    .line 56
    .line 57
    move-object v6, p0

    .line 58
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/widget/H0;->x(Landroid/graphics/Rect;IILandroid/graphics/Point;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_1
    :goto_0
    const-string p0, "BaseItemDragListener"

    .line 64
    .line 65
    const-string p1, "Someone started a dragAndDrop before us."

    .line 66
    .line 67
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    return p0
.end method

.method public bridge synthetic init(Lcom/android/launcher3/views/k;Z)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/dragndrop/h;->g(Lcom/android/launcher3/C2;Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "pin_item_drag_listener"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v0, Landroid/os/Handler;

    .line 27
    .line 28
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Lcom/android/launcher3/dragndrop/f;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Lcom/android/launcher3/dragndrop/f;-><init>(Lcom/android/launcher3/dragndrop/h;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->s2()LQ1/d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, LQ1/d;->o(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/h;->m:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/h;->m:Ljava/util/concurrent/ScheduledExecutorService;

    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/h;->k:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_5

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/h;->l:Lcom/android/launcher3/dragndrop/j;

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    invoke-virtual {p2}, Landroid/view/DragEvent;->getAction()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eq p1, v1, :cond_3

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/h;->l:Lcom/android/launcher3/dragndrop/j;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/h;->l:Lcom/android/launcher3/dragndrop/j;

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Lcom/android/launcher3/dragndrop/j;->M(Landroid/view/DragEvent;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_3
    :goto_0
    invoke-virtual {p0, p2}, Lcom/android/launcher3/dragndrop/h;->h(Landroid/view/DragEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    return v1

    .line 51
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/h;->j()V

    .line 52
    .line 53
    .line 54
    return v0

    .line 55
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/h;->j()V

    .line 56
    .line 57
    .line 58
    return v0
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/h;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
