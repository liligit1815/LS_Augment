.class Lcom/android/launcher3/folder/g0$b;
.super Lcom/android/launcher3/folder/g0;
.source "LauncherDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private final b:Lcom/android/launcher3/views/k;

.field private c:Lz1/J3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/k;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, v0}, Lcom/android/launcher3/folder/g0;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/folder/h0;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/android/launcher3/folder/g0$b;->b:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method b(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    return-void
.end method

.method c(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public e()Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method f()Lz1/J3;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/g0$b;->c:Lz1/J3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/folder/g0$b;->b:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$b;->b:Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v0, v3, v1, v2}, Lcom/android/launcher3/D3;->o0(ZLc1/c;Lz1/y0$b;)Lz1/J3;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/android/launcher3/folder/g0$b;->c:Lz1/J3;

    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/g0$b;->c:Lz1/J3;

    .line 32
    .line 33
    return-object p0
.end method

.method g(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/g0$b;->b:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/Folder;->setDragController(Lcom/android/launcher3/dragndrop/j;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method h(Landroid/view/MotionEvent;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/folder/Folder;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-virtual {p3, p0}, Lcom/android/launcher3/a;->close(Z)V

    .line 3
    .line 4
    .line 5
    return p0
.end method

.method i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method j(Lcom/android/launcher3/folder/Folder;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
