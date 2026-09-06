.class public Lcom/android/wm/shell/shared/a;
.super Ljava/lang/Object;
.source "CounterRotator.java"


# instance fields
.field private a:Landroid/view/SurfaceControl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/wm/shell/shared/a;->a:Landroid/view/SurfaceControl;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wm/shell/shared/a;->a:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1, p2, p0}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(Landroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wm/shell/shared/a;->a:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1, p0}, Landroid/view/SurfaceControl$Transaction;->remove(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c()Landroid/view/SurfaceControl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wm/shell/shared/a;->a:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;IFF)V
    .locals 3

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Landroid/view/SurfaceControl$Builder;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/view/SurfaceControl$Builder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "Transition Unrotate"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/SurfaceControl$Builder;->setName(Ljava/lang/String;)Landroid/view/SurfaceControl$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/SurfaceControl$Builder;->setContainerLayer()Landroid/view/SurfaceControl$Builder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p2}, Landroid/view/SurfaceControl$Builder;->setParent(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2}, Landroid/view/SurfaceControl$Builder;->build()Landroid/view/SurfaceControl;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iput-object p2, p0, Lcom/android/wm/shell/shared/a;->a:Landroid/view/SurfaceControl;

    .line 28
    .line 29
    invoke-static {p1, p2, p3}, Landroid/util/RotationUtils;->rotateSurface(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;I)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Landroid/graphics/Point;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-direct {p2, v0, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 36
    .line 37
    .line 38
    rem-int/lit8 v0, p3, 0x2

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    move v2, p5

    .line 43
    move p5, p4

    .line 44
    move p4, v2

    .line 45
    :cond_1
    float-to-int p4, p4

    .line 46
    float-to-int p5, p5

    .line 47
    invoke-static {p2, p3, p4, p5}, Landroid/util/RotationUtils;->rotatePoint(Landroid/graphics/Point;III)V

    .line 48
    .line 49
    .line 50
    iget-object p3, p0, Lcom/android/wm/shell/shared/a;->a:Landroid/view/SurfaceControl;

    .line 51
    .line 52
    iget p4, p2, Landroid/graphics/Point;->x:I

    .line 53
    .line 54
    int-to-float p4, p4

    .line 55
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 56
    .line 57
    int-to-float p2, p2

    .line 58
    invoke-virtual {p1, p3, p4, p2}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/android/wm/shell/shared/a;->a:Landroid/view/SurfaceControl;

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Landroid/view/SurfaceControl$Transaction;->show(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 64
    .line 65
    .line 66
    return-void
.end method
