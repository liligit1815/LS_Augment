.class public Lcom/android/launcher3/taskbar/s2$a;
.super Ljava/lang/Object;
.source "TaskbarDragLayerController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/s2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/s2;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/s2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/taskbar/s2;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s2;->i(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/R1;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/N2;->f(Landroid/graphics/Canvas;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public b()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s2;->h(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/launcher3/taskbar/s2;->h(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/android/launcher3/taskbar/s2;->h(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/I1;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s2;->h(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/I1;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->R0()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/util/M;->a(Lcom/android/launcher3/h0;Landroid/content/res/Resources;ZZ)Landroid/graphics/Point;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 49
    .line 50
    const/4 v1, -0x1

    .line 51
    if-ne p0, v1, :cond_0

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->n0()Lcom/android/launcher3/util/Z$c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 58
    .line 59
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 60
    .line 61
    :cond_0
    return p0

    .line 62
    :cond_1
    iget p0, v0, Lcom/android/launcher3/h0;->r3:I

    .line 63
    .line 64
    return p0
.end method

.method public c()[Lcom/android/launcher3/util/G2;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s2;->h(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->v0()Lcom/android/launcher3/taskbar/j2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/launcher3/taskbar/s2;->i(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/R1;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->o:Lcom/android/launcher3/taskbar/H2;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/android/launcher3/taskbar/s2;->i(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/R1;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v2, v2, Lcom/android/launcher3/taskbar/R1;->d:Lcom/android/launcher3/taskbar/M0;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/M0;->k0()Lcom/android/launcher3/util/G2;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s2;->j(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/b4;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 v3, 0x4

    .line 38
    new-array v3, v3, [Lcom/android/launcher3/util/G2;

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    aput-object v0, v3, v4

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    aput-object v1, v3, v0

    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    aput-object v2, v3, v0

    .line 48
    .line 49
    const/4 v0, 0x3

    .line 50
    aput-object p0, v3, v0

    .line 51
    .line 52
    return-object v3
.end method

.method public d(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/s2;->h(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 v0, 0x4

    .line 18
    if-ne p1, v0, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/android/launcher3/taskbar/s2;->i(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/R1;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/o4;->q()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s2;->i(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/R1;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/o4;->h()V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s2;->h(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->S1()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s2;->i(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/a4;->x0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s2$a;->a:Lcom/android/launcher3/taskbar/s2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/s2;->i(Lcom/android/launcher3/taskbar/s2;)Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->q:Lcom/android/launcher3/taskbar/N2;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/N2;->r(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
