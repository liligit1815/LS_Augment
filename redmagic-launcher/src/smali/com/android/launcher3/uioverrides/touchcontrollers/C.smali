.class public Lcom/android/launcher3/uioverrides/touchcontrollers/C;
.super Ljava/lang/Object;
.source "StatusBarTouchController.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;


# instance fields
.field private final g:Lcom/android/launcher3/C2;

.field private final h:Lcom/android/quickstep/SystemUiProxy;

.field private final i:F

.field private j:I

.field private final k:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private l:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 15
    .line 16
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    mul-int/lit8 p1, p1, 0x2

    .line 25
    .line 26
    int-to-float p1, p1

    .line 27
    iput p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->i:F

    .line 28
    .line 29
    new-instance p1, Landroid/util/SparseArray;

    .line 30
    .line 31
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 35
    .line 36
    return-void
.end method

.method private a(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/H4;->d(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "StatusBarController"

    .line 7
    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 13
    .line 14
    invoke-interface {v0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    const v3, 0x78000c7d

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v3}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 57
    .line 58
    sub-int/2addr v4, v0

    .line 59
    int-to-float v0, v4

    .line 60
    cmpl-float v0, v3, v0

    .line 61
    .line 62
    if-lez v0, :cond_1

    .line 63
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v3, "canInterceptTouch, Y: "

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p1, " Height:"

    .line 82
    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    return v1

    .line 107
    :cond_1
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->isActive()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    return p0

    .line 122
    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v0, "canInterceptTouch  isInState:"

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 133
    .line 134
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 135
    .line 136
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    return v1
.end method

.method private b(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->isActive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->j:I

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->onStatusBarTouchEvent(Landroid/view/MotionEvent;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/4 v0, 0x1

    .line 25
    if-eq p0, v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 p1, 0x3

    .line 32
    if-ne p0, p1, :cond_1

    .line 33
    .line 34
    :cond_0
    invoke-static {}, Lh1/a;->t()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method private c(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setWindowSlippery  enable:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "StatusBarController"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 36
    .line 37
    const/high16 v1, 0x20000000

    .line 38
    .line 39
    or-int/2addr p1, v1

    .line 40
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 44
    .line 45
    const v1, -0x20000001

    .line 46
    .line 47
    .line 48
    and-int/2addr p1, v1

    .line 49
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 50
    .line 51
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "mCanIntercept:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->l:Z

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, "mLastAction:"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget v1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->j:I

    .line 40
    .line 41
    invoke-static {v1}, Landroid/view/MotionEvent;->actionToString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, "mSysUiProxy available:"

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->isActive()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "StatusBarController"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string p0, "onControllerInterceptTouchEvent: isDragging return false!"

    .line 17
    .line 18
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return v2

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->H(Lcom/android/launcher3/C2;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    new-instance p1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v0, "onControllerInterceptTouchEvent isTouchingScrollableViewInAIFutureWidget return "

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return v2

    .line 59
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->m(Lcom/android/launcher3/C2;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    new-instance p1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v0, "onControllerInterceptTouchEvent isTouchingGroupWidget return "

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    return v2

    .line 96
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-nez v0, :cond_4

    .line 109
    .line 110
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->a(Landroid/view/MotionEvent;)Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    iput-boolean v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->l:Z

    .line 115
    .line 116
    if-nez v4, :cond_3

    .line 117
    .line 118
    return v2

    .line 119
    :cond_3
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 120
    .line 121
    invoke-virtual {v4}, Landroid/util/SparseArray;->clear()V

    .line 122
    .line 123
    .line 124
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 125
    .line 126
    new-instance v5, Landroid/graphics/PointF;

    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    invoke-direct {v5, v6, v7}, Landroid/graphics/PointF;-><init>(FF)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v4, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    const/4 v5, 0x5

    .line 148
    if-ne v4, v5, :cond_5

    .line 149
    .line 150
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 151
    .line 152
    new-instance v5, Landroid/graphics/PointF;

    .line 153
    .line 154
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    invoke-direct {v5, v6, v7}, Landroid/graphics/PointF;-><init>(FF)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v4, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    :cond_5
    :goto_0
    iget-boolean v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->l:Z

    .line 169
    .line 170
    if-nez v4, :cond_6

    .line 171
    .line 172
    return v2

    .line 173
    :cond_6
    const/4 v4, 0x2

    .line 174
    if-ne v0, v4, :cond_8

    .line 175
    .line 176
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 177
    .line 178
    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->contains(I)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_8

    .line 183
    .line 184
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 185
    .line 186
    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    if-eqz v0, :cond_8

    .line 191
    .line 192
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 193
    .line 194
    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    if-eqz v0, :cond_8

    .line 199
    .line 200
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 205
    .line 206
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    check-cast v4, Landroid/graphics/PointF;

    .line 211
    .line 212
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 213
    .line 214
    sub-float/2addr v0, v4

    .line 215
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->k:Landroid/util/SparseArray;

    .line 220
    .line 221
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    check-cast v3, Landroid/graphics/PointF;

    .line 226
    .line 227
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 228
    .line 229
    sub-float/2addr v1, v3

    .line 230
    iget v3, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->i:F

    .line 231
    .line 232
    cmpl-float v3, v0, v3

    .line 233
    .line 234
    if-lez v3, :cond_7

    .line 235
    .line 236
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    cmpl-float v0, v0, v3

    .line 241
    .line 242
    if-lez v0, :cond_7

    .line 243
    .line 244
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    const/4 v3, 0x1

    .line 249
    if-ne v0, v3, :cond_7

    .line 250
    .line 251
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setAction(I)V

    .line 252
    .line 253
    .line 254
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->b(Landroid/view/MotionEvent;)V

    .line 255
    .line 256
    .line 257
    invoke-direct {p0, v3}, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->c(Z)V

    .line 258
    .line 259
    .line 260
    return v3

    .line 261
    :cond_7
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    iget v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->i:F

    .line 266
    .line 267
    cmpl-float p1, p1, v0

    .line 268
    .line 269
    if-lez p1, :cond_8

    .line 270
    .line 271
    iput-boolean v2, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->l:Z

    .line 272
    .line 273
    :cond_8
    return v2
.end method

.method public final onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/4 v2, 0x3

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return v1

    .line 13
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->b(Landroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->g:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->e1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 27
    .line 28
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/C;->c(Z)V

    .line 33
    .line 34
    .line 35
    return v1
.end method
