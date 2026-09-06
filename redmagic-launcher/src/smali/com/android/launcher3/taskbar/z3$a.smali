.class Lcom/android/launcher3/taskbar/z3$a;
.super Ljava/lang/Object;
.source "TaskbarPopupController.java"

# interfaces
.implements Lcom/android/launcher3/popup/PopupContainerWithArrow$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/z3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field protected final g:Landroid/graphics/Point;

.field final synthetic h:Lcom/android/launcher3/taskbar/z3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/z3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/z3$a;->h:Lcom/android/launcher3/taskbar/z3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Point;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/taskbar/z3$a;->g:Landroid/graphics/Point;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->setWillDrawIcon(Z)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Landroid/graphics/Point;

    .line 21
    .line 22
    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/taskbar/z3$a;->g:Landroid/graphics/Point;

    .line 26
    .line 27
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconCenter()Landroid/graphics/Point;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 34
    .line 35
    sub-int/2addr v3, v4

    .line 36
    iput v3, v2, Landroid/graphics/Point;->x:I

    .line 37
    .line 38
    iget-object v3, p0, Lcom/android/launcher3/taskbar/z3$a;->g:Landroid/graphics/Point;

    .line 39
    .line 40
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3$a;->h:Lcom/android/launcher3/taskbar/z3;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/android/launcher3/taskbar/z3;->h(Lcom/android/launcher3/taskbar/z3;)Lcom/android/launcher3/taskbar/I1;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget p0, p0, Lcom/android/launcher3/h0;->u3:I

    .line 53
    .line 54
    sub-int/2addr v3, p0

    .line 55
    iput v3, v2, Landroid/graphics/Point;->y:I

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 66
    .line 67
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Lcom/android/launcher3/taskbar/j2;

    .line 72
    .line 73
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/taskbar/j2;->E0(Lcom/android/launcher3/shortcuts/DeepShortcutView;Landroid/graphics/Point;)Z

    .line 74
    .line 75
    .line 76
    return v1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/z3$a;->g:Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    float-to-int p1, p1

    .line 18
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    float-to-int p2, p2

    .line 23
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Point;->set(II)V

    .line 24
    .line 25
    .line 26
    :goto_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method
