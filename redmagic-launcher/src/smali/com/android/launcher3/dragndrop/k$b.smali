.class Lcom/android/launcher3/dragndrop/k$b;
.super Lcom/android/launcher3/dragndrop/k;
.source "DragDriver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/dragndrop/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field private final c:Lcom/android/launcher3/dragndrop/j;


# direct methods
.method constructor <init>(Lcom/android/launcher3/dragndrop/j;Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/dragndrop/j;",
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/dragndrop/k;-><init>(Lcom/android/launcher3/dragndrop/k$a;Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/k;->b:Ljava/util/function/Consumer;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const/4 p1, 0x3

    .line 14
    if-eq v0, p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/android/launcher3/dragndrop/k$a;->e()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 26
    .line 27
    invoke-virtual {v2, p1}, Lcom/android/launcher3/dragndrop/j;->D(Landroid/view/MotionEvent;)F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->E(Landroid/view/MotionEvent;)F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-interface {v0, v2, p0}, Lcom/android/launcher3/dragndrop/k$a;->c(FF)V

    .line 38
    .line 39
    .line 40
    :goto_0
    return v1
.end method

.method public d(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/k;->b:Ljava/util/function/Consumer;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_2

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq v0, v2, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x3

    .line 17
    if-eq v0, p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 21
    .line 22
    invoke-interface {p0}, Lcom/android/launcher3/dragndrop/k$a;->e()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 29
    .line 30
    invoke-virtual {v2, p1}, Lcom/android/launcher3/dragndrop/j;->D(Landroid/view/MotionEvent;)F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->E(Landroid/view/MotionEvent;)F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-interface {v0, v2, p0}, Lcom/android/launcher3/dragndrop/k$a;->b(FF)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 47
    .line 48
    invoke-virtual {v2, p1}, Lcom/android/launcher3/dragndrop/j;->D(Landroid/view/MotionEvent;)F

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 53
    .line 54
    invoke-virtual {v3, p1}, Lcom/android/launcher3/dragndrop/j;->E(Landroid/view/MotionEvent;)F

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-interface {v0, v2, v3}, Lcom/android/launcher3/dragndrop/k$a;->b(FF)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 64
    .line 65
    invoke-virtual {v2, p1}, Lcom/android/launcher3/dragndrop/j;->D(Landroid/view/MotionEvent;)F

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k$b;->c:Lcom/android/launcher3/dragndrop/j;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->E(Landroid/view/MotionEvent;)F

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-interface {v0, v2, p0}, Lcom/android/launcher3/dragndrop/k$a;->c(FF)V

    .line 76
    .line 77
    .line 78
    :goto_0
    return v1
.end method
