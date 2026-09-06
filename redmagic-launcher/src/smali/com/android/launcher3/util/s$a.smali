.class public final Lcom/android/launcher3/util/s$a;
.super Ljava/lang/Object;
.source "BaseContext.kt"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/util/s;->onViewCreated()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/util/s;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/s$a;->f(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/s;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/s$a;->e(Lcom/android/launcher3/util/s;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowVisibilityChangeListener;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/s$a;->h(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowVisibilityChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/util/s;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/s$a;->g(Lcom/android/launcher3/util/s;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final e(Lcom/android/launcher3/util/s;Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/s;->access$updateState(Lcom/android/launcher3/util/s;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final f(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final g(Lcom/android/launcher3/util/s;I)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/s;->access$updateState(Lcom/android/launcher3/util/s;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final h(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowVisibilityChangeListener;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewTreeObserver;->removeOnWindowVisibilityChangeListener(Landroid/view/ViewTreeObserver$OnWindowVisibilityChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "getRootView(...)"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 16
    .line 17
    invoke-static {v0, v2}, LW/q;->a(Landroid/view/View;LW/d;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 28
    .line 29
    invoke-static {v0, v1}, Le0/g;->a(Landroid/view/View;Le0/f;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/launcher3/util/s;->access$getLifecycleRegistry$p(Lcom/android/launcher3/util/s;)Landroidx/lifecycle/i;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Landroidx/lifecycle/g$a;->ON_CREATE:Landroidx/lifecycle/g$a;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroidx/lifecycle/i;->h(Landroidx/lifecycle/g$a;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 48
    .line 49
    new-instance v1, Lcom/android/launcher3/util/o;

    .line 50
    .line 51
    invoke-direct {v1, v0}, Lcom/android/launcher3/util/o;-><init>(Lcom/android/launcher3/util/s;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->addOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/android/launcher3/util/s;->access$getFinishActions$p(Lcom/android/launcher3/util/s;)Lcom/android/launcher3/util/Y1;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v2, Lcom/android/launcher3/util/p;

    .line 64
    .line 65
    invoke-direct {v2, p1, v1}, Lcom/android/launcher3/util/p;-><init>(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    sget-boolean v0, Lcom/android/launcher3/N5;->h:Z

    .line 72
    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 76
    .line 77
    new-instance v1, Lcom/android/launcher3/util/q;

    .line 78
    .line 79
    invoke-direct {v1, v0}, Lcom/android/launcher3/util/q;-><init>(Lcom/android/launcher3/util/s;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->addOnWindowVisibilityChangeListener(Landroid/view/ViewTreeObserver$OnWindowVisibilityChangeListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 86
    .line 87
    invoke-static {p0}, Lcom/android/launcher3/util/s;->access$getFinishActions$p(Lcom/android/launcher3/util/s;)Lcom/android/launcher3/util/Y1;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance v0, Lcom/android/launcher3/util/r;

    .line 92
    .line 93
    invoke-direct {v0, p1, v1}, Lcom/android/launcher3/util/r;-><init>(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnWindowVisibilityChangeListener;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/util/s;->access$getDestroyOnDetach$p(Lcom/android/launcher3/util/s;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/util/s$a;->g:Lcom/android/launcher3/util/s;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/util/s;->onViewDestroyed()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
