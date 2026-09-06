.class Lcom/google/android/material/timepicker/ClockFaceView$b;
.super LJ/a;
.source "ClockFaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/timepicker/ClockFaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic j:Lcom/google/android/material/timepicker/ClockFaceView;


# direct methods
.method constructor <init>(Lcom/google/android/material/timepicker/ClockFaceView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/timepicker/ClockFaceView$b;->j:Lcom/google/android/material/timepicker/ClockFaceView;

    .line 2
    .line 3
    invoke-direct {p0}, LJ/a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g(Landroid/view/View;LK/d;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2}, LJ/a;->g(Landroid/view/View;LK/d;)V

    .line 2
    .line 3
    .line 4
    sget v0, LX2/f;->B:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-lez v3, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/material/timepicker/ClockFaceView$b;->j:Lcom/google/android/material/timepicker/ClockFaceView;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/google/android/material/timepicker/ClockFaceView;->r(Lcom/google/android/material/timepicker/ClockFaceView;)Landroid/util/SparseArray;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    add-int/lit8 v0, v3, -0x1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p2, p0}, LK/d;->M0(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 v5, 0x0

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const/4 v1, 0x0

    .line 41
    const/4 v2, 0x1

    .line 42
    const/4 v4, 0x1

    .line 43
    invoke-static/range {v1 .. v6}, LK/d$f;->g(IIIIZZ)LK/d$f;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p2, p0}, LK/d;->l0(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    invoke-virtual {p2, p0}, LK/d;->j0(Z)V

    .line 52
    .line 53
    .line 54
    sget-object p0, LK/d$a;->i:LK/d$a;

    .line 55
    .line 56
    invoke-virtual {p2, p0}, LK/d;->b(LK/d$a;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public j(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 9

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iget-object p2, p0, Lcom/google/android/material/timepicker/ClockFaceView$b;->j:Lcom/google/android/material/timepicker/ClockFaceView;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/google/android/material/timepicker/ClockFaceView;->s(Lcom/google/android/material/timepicker/ClockFaceView;)Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p1, p2}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/google/android/material/timepicker/ClockFaceView$b;->j:Lcom/google/android/material/timepicker/ClockFaceView;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/google/android/material/timepicker/ClockFaceView;->s(Lcom/google/android/material/timepicker/ClockFaceView;)Landroid/graphics/Rect;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float v6, p1

    .line 29
    iget-object p1, p0, Lcom/google/android/material/timepicker/ClockFaceView$b;->j:Lcom/google/android/material/timepicker/ClockFaceView;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/google/android/material/timepicker/ClockFaceView;->s(Lcom/google/android/material/timepicker/ClockFaceView;)Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    int-to-float v7, p1

    .line 40
    iget-object p1, p0, Lcom/google/android/material/timepicker/ClockFaceView$b;->j:Lcom/google/android/material/timepicker/ClockFaceView;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/google/android/material/timepicker/ClockFaceView;->p(Lcom/google/android/material/timepicker/ClockFaceView;)Lcom/google/android/material/timepicker/ClockHandView;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const/4 v5, 0x0

    .line 47
    const/4 v8, 0x0

    .line 48
    move-wide v3, v1

    .line 49
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p1, p2}, Lcom/google/android/material/timepicker/ClockHandView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/google/android/material/timepicker/ClockFaceView$b;->j:Lcom/google/android/material/timepicker/ClockFaceView;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/google/android/material/timepicker/ClockFaceView;->p(Lcom/google/android/material/timepicker/ClockFaceView;)Lcom/google/android/material/timepicker/ClockHandView;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 v5, 0x1

    .line 63
    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Lcom/google/android/material/timepicker/ClockHandView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x1

    .line 71
    return p0

    .line 72
    :cond_0
    invoke-super {p0, p1, p2, p3}, LJ/a;->j(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method
