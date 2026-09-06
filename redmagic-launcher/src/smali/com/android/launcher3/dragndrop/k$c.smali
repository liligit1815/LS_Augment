.class Lcom/android/launcher3/dragndrop/k$c;
.super Lcom/android/launcher3/dragndrop/k;
.source "DragDriver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/dragndrop/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "c"
.end annotation


# instance fields
.field private final c:J

.field d:F

.field e:F


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
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/android/launcher3/dragndrop/k$c;->d:F

    .line 6
    .line 7
    iput p1, p0, Lcom/android/launcher3/dragndrop/k$c;->e:F

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    iput-wide p1, p0, Lcom/android/launcher3/dragndrop/k$c;->c:J

    .line 14
    .line 15
    return-void
.end method

.method private e(Landroid/view/DragEvent;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    if-eq v0, v2, :cond_1

    .line 10
    .line 11
    const/4 v2, 0x4

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :goto_0
    move v6, v1

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v6, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_2
    const/4 v1, 0x0

    .line 20
    goto :goto_0

    .line 21
    :goto_1
    iget-wide v2, p0, Lcom/android/launcher3/dragndrop/k$c;->c:J

    .line 22
    .line 23
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v8

    .line 35
    const/4 v9, 0x0

    .line 36
    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k;->b:Ljava/util/function/Consumer;

    .line 41
    .line 42
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public b(Landroid/view/DragEvent;)Z
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/k$c;->e(Landroid/view/DragEvent;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :pswitch_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 15
    .line 16
    invoke-interface {p0}, Lcom/android/launcher3/dragndrop/k$a;->d()V

    .line 17
    .line 18
    .line 19
    :pswitch_1
    return v1

    .line 20
    :pswitch_2
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 21
    .line 22
    invoke-interface {p0}, Lcom/android/launcher3/dragndrop/k$a;->e()V

    .line 23
    .line 24
    .line 25
    return v1

    .line 26
    :pswitch_3
    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/android/launcher3/dragndrop/k$c;->d:F

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Lcom/android/launcher3/dragndrop/k$c;->e:F

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-interface {v0, v2, p1}, Lcom/android/launcher3/dragndrop/k$a;->b(FF)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 52
    .line 53
    iget v0, p0, Lcom/android/launcher3/dragndrop/k$c;->d:F

    .line 54
    .line 55
    iget p0, p0, Lcom/android/launcher3/dragndrop/k$c;->e:F

    .line 56
    .line 57
    invoke-interface {p1, v0, p0}, Lcom/android/launcher3/dragndrop/k$a;->c(FF)V

    .line 58
    .line 59
    .line 60
    return v1

    .line 61
    :pswitch_4
    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Lcom/android/launcher3/dragndrop/k$c;->d:F

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Lcom/android/launcher3/dragndrop/k$c;->e:F

    .line 72
    .line 73
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/k;->a:Lcom/android/launcher3/dragndrop/k$a;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-interface {p0, v0, p1}, Lcom/android/launcher3/dragndrop/k$a;->b(FF)V

    .line 84
    .line 85
    .line 86
    return v1

    .line 87
    :pswitch_5
    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput v0, p0, Lcom/android/launcher3/dragndrop/k$c;->d:F

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iput p1, p0, Lcom/android/launcher3/dragndrop/k$c;->e:F

    .line 98
    .line 99
    return v1

    .line 100
    nop

    .line 101
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
