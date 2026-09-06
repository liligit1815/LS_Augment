.class public final Lcom/android/launcher3/taskbar/bubbles/w;
.super Ljava/lang/Object;
.source "BubbleBarLocationDropTarget.kt"

# interfaces
.implements Lcom/android/launcher3/n0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/bubbles/w$a;
    }
.end annotation


# instance fields
.field private final g:LN2/h;

.field private final h:Lcom/android/launcher3/taskbar/bubbles/w$a;

.field private i:Z


# direct methods
.method public constructor <init>(LN2/h;Lcom/android/launcher3/taskbar/bubbles/w$a;)V
    .locals 1

    .line 1
    const-string v0, "bubbleBarLocation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bubbleBarDragListener"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/w;->g:LN2/h;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/w;->h:Lcom/android/launcher3/taskbar/bubbles/w$a;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public D()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public G(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    const-string v0, "dragObject"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/w;->i:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/w;->i:Z

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/w;->h:Lcom/android/launcher3/taskbar/bubbles/w$a;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/w;->g:LN2/h;

    .line 17
    .line 18
    invoke-interface {p1, p0}, Lcom/android/launcher3/taskbar/bubbles/w$a;->a(LN2/h;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public I(Lcom/android/launcher3/n0$a;)Z
    .locals 0

    .line 1
    const-string p0, "dragObject"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public J(Lcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    const-string v0, "dragObject"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/w;->i:Z

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/bubbles/w;->i:Z

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/w;->h:Lcom/android/launcher3/taskbar/bubbles/w$a;

    .line 15
    .line 16
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/w$a;->b()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    const-string v0, "outRect"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/w;->h:Lcom/android/launcher3/taskbar/bubbles/w$a;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/w;->g:LN2/h;

    .line 9
    .line 10
    invoke-interface {v0, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/w$a;->c(LN2/h;Landroid/graphics/Rect;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public getDropView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/w;->h:Lcom/android/launcher3/taskbar/bubbles/w$a;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/bubbles/w$a;->getDropView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    const-string p0, "dragObject"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    const-string v0, "dragObject"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "options"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/w;->h:Lcom/android/launcher3/taskbar/bubbles/w$a;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/w;->g:LN2/h;

    .line 19
    .line 20
    invoke-interface {p2, p0, p1}, Lcom/android/launcher3/taskbar/bubbles/w$a;->d(LN2/h;Lcom/android/launcher3/model/data/y;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
