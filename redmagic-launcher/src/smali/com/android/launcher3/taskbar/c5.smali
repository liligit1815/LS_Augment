.class public final Lcom/android/launcher3/taskbar/c5;
.super Ljava/lang/Object;
.source "VoiceInteractionWindowController.kt"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;
.implements Lcom/android/launcher3/taskbar/R1$a;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private final h:Z

.field private final i:Lcom/android/launcher3/taskbar/L1;

.field private final j:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

.field private k:Lcom/android/launcher3/taskbar/R1;

.field private l:Lcom/android/launcher3/views/BaseDragLayer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/views/BaseDragLayer<",
            "Lcom/android/launcher3/taskbar/I1;",
            ">;"
        }
    .end annotation
.end field

.field private m:Landroid/view/WindowManager$LayoutParams;

.field private n:Z

.field private o:Landroid/view/View$OnAttachStateChangeListener;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/c5;->g:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->h:Z

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/taskbar/L1;

    .line 29
    .line 30
    invoke-direct {v0, p1}, Lcom/android/launcher3/taskbar/L1;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/taskbar/c5;->i:Lcom/android/launcher3/taskbar/L1;

    .line 34
    .line 35
    new-instance p1, Lcom/android/launcher3/taskbar/b5;

    .line 36
    .line 37
    invoke-direct {p1}, Lcom/android/launcher3/taskbar/b5;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/android/launcher3/taskbar/c5;->j:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/c5;Lu4/a;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/c5;->n(Lcom/android/launcher3/taskbar/c5;Lu4/a;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/c5;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/c5;->m(Lcom/android/launcher3/taskbar/c5;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/c5;->o(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/c5;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/c5;->l(Lcom/android/launcher3/taskbar/c5;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic g(Lcom/android/launcher3/taskbar/c5;)Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->j:Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic h(Lcom/android/launcher3/taskbar/c5;)Lcom/android/launcher3/taskbar/L1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->i:Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic i(Lcom/android/launcher3/taskbar/c5;Landroid/view/View$OnAttachStateChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/c5;->o:Landroid/view/View$OnAttachStateChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method private final k(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->g:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/android/launcher3/taskbar/c5;->m:Landroid/view/WindowManager$LayoutParams;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/I1;->Z(Landroid/view/View;Landroid/view/WindowManager$LayoutParams;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/taskbar/Y4;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/Y4;-><init>(Lcom/android/launcher3/taskbar/c5;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->k:Lcom/android/launcher3/taskbar/R1;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const-string v0, "controllers"

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    :cond_1
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/s2;->C(Z)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Lcom/android/launcher3/taskbar/Z4;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/Z4;-><init>(Lcom/android/launcher3/taskbar/c5;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    if-eqz p1, :cond_2

    .line 42
    .line 43
    invoke-interface {v0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 48
    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    new-instance v1, Lcom/android/launcher3/taskbar/a5;

    .line 52
    .line 53
    invoke-direct {v1, p0, v0}, Lcom/android/launcher3/taskbar/a5;-><init>(Lcom/android/launcher3/taskbar/c5;Lu4/a;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/taskbar/c5;->q(Landroid/view/View;Lu4/a;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    return-void
.end method

.method private static final l(Lcom/android/launcher3/taskbar/c5;)Lh4/t;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->k:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "controllers"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s2;->C(Z)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 18
    .line 19
    return-object p0
.end method

.method private static final m(Lcom/android/launcher3/taskbar/c5;)Lh4/t;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->g:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/I1;->f2(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 9
    .line 10
    return-object p0
.end method

.method private static final n(Lcom/android/launcher3/taskbar/c5;Lu4/a;)Lh4/t;
    .locals 3

    .line 1
    sget-object v0, Lu2/I;->a:Lu2/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->g:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v2, "getDragLayer(...)"

    .line 15
    .line 16
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, p0, p1}, Lu2/I;->c(Landroid/view/View;Landroid/view/View;Lu4/a;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 23
    .line 24
    return-object p0
.end method

.method private static final o(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Region;->setEmpty()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private final q(Landroid/view/View;Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->o:Landroid/view/View$OnAttachStateChangeListener;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/taskbar/c5$b;

    .line 17
    .line 18
    invoke-direct {v0, p2, p1, p0}, Lcom/android/launcher3/taskbar/c5$b;-><init>(Lu4/a;Landroid/view/View;Lcom/android/launcher3/taskbar/c5;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/taskbar/c5;->o:Landroid/view/View$OnAttachStateChangeListener;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    const-string v0, "prefix"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "pw"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "VoiceInteractionWindowController:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->h:Z

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, "\tisSeparateBackgroundEnabled="

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->n:Z

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, "\tisVoiceInteractionWindowVisible="

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 82
    .line 83
    if-eqz p0, :cond_0

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isAttachedToWindow()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    goto :goto_0

    .line 94
    :cond_0
    const/4 p0, 0x0

    .line 95
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string p1, "\tisSeparateTaskbarBackgroundAttachedToWindow="

    .line 104
    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public b(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->i:Lcom/android/launcher3/taskbar/L1;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/L1;->l(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public final j(Lcom/android/launcher3/taskbar/R1;)V
    .locals 2

    .line 1
    const-string v0, "controllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/c5;->k:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->h:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->g:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    new-instance v1, Lcom/android/launcher3/taskbar/c5$a;

    .line 16
    .line 17
    invoke-direct {v1, p1, p0, v0}, Lcom/android/launcher3/taskbar/c5$a;-><init>(Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/c5;Lcom/android/launcher3/taskbar/I1;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/views/BaseDragLayer;->recreateControllers()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/c5;->g:Lcom/android/launcher3/taskbar/I1;

    .line 34
    .line 35
    const/16 v0, 0x7f6

    .line 36
    .line 37
    const-string v1, "VoiceInteractionTaskbarBackground"

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/taskbar/I1;->createDefaultWindowLayoutParams(ILjava/lang/String;)Landroid/view/WindowManager$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/android/launcher3/taskbar/c5;->m:Landroid/view/WindowManager$LayoutParams;

    .line 44
    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    invoke-virtual {p1, p0}, Landroid/view/WindowManager$LayoutParams;->setSystemApplicationOverlay(Z)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/c5;->r(ZZ)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->l:Lcom/android/launcher3/views/BaseDragLayer;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/taskbar/c5;->o:Landroid/view/View$OnAttachStateChangeListener;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final r(ZZ)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->n:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_7

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->g:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/c5;->n:Z

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->k:Lcom/android/launcher3/taskbar/R1;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    const-string v2, "controllers"

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    move-object v0, v1

    .line 34
    :cond_2
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/W4;->S()Lcom/android/launcher3/util/v1;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v3, 0x5

    .line 41
    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-wide/16 v3, 0x12c

    .line 50
    .line 51
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v5, p0, Lcom/android/launcher3/taskbar/c5;->k:Lcom/android/launcher3/taskbar/R1;

    .line 56
    .line 57
    if-nez v5, :cond_3

    .line 58
    .line 59
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    move-object v5, v1

    .line 63
    :cond_3
    iget-object v5, v5, Lcom/android/launcher3/taskbar/R1;->k:Lcom/android/launcher3/taskbar/U0;

    .line 64
    .line 65
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/U0;->l()Lcom/android/launcher3/util/v1;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    const/4 v6, 0x2

    .line 70
    invoke-virtual {v5, v6}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v5, p1}, Lcom/android/launcher3/util/v1$c;->b(F)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    const-wide/16 v6, 0xb4

    .line 79
    .line 80
    invoke-virtual {v5, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    new-instance v6, Landroid/animation/AnimatorSet;

    .line 85
    .line 86
    invoke-direct {v6}, Landroid/animation/AnimatorSet;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v6, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v6, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 93
    .line 94
    .line 95
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/c5;->h:Z

    .line 96
    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/launcher3/taskbar/c5;->k:Lcom/android/launcher3/taskbar/R1;

    .line 100
    .line 101
    if-nez v0, :cond_4

    .line 102
    .line 103
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_4
    move-object v1, v0

    .line 108
    :goto_1
    iget-object v0, v1, Lcom/android/launcher3/taskbar/R1;->f:Lcom/android/launcher3/taskbar/s2;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s2;->l()Lcom/android/launcher3/anim/d;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string v0, "setDuration(...)"

    .line 123
    .line 124
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v6, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 128
    .line 129
    .line 130
    :cond_5
    invoke-virtual {v6}, Landroid/animation/AnimatorSet;->start()V

    .line 131
    .line 132
    .line 133
    if-eqz p2, :cond_6

    .line 134
    .line 135
    invoke-virtual {v6}, Landroid/animation/AnimatorSet;->end()V

    .line 136
    .line 137
    .line 138
    :cond_6
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/c5;->h:Z

    .line 139
    .line 140
    if-eqz p1, :cond_7

    .line 141
    .line 142
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/c5;->k(Z)V

    .line 143
    .line 144
    .line 145
    :cond_7
    :goto_2
    return-void
.end method
