.class public Lcom/android/launcher3/folder/g0;
.super Ljava/lang/Object;
.source "LauncherDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/folder/g0$b;
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/C2;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/folder/h0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/g0;-><init>(Lcom/android/launcher3/C2;)V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static d(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/g0;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/android/launcher3/folder/g0;

    .line 6
    .line 7
    check-cast p0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/g0;-><init>(Lcom/android/launcher3/C2;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance v0, Lcom/android/launcher3/folder/g0$b;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/g0$b;-><init>(Lcom/android/launcher3/views/k;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method b(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/Workspace;->F0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V

    .line 8
    .line 9
    .line 10
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
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->forEachVisiblePage(Ljava/util/function/Consumer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e()Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method f()Lz1/J3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method g(Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/Folder;->setDragController(Lcom/android/launcher3/dragndrop/j;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->U1()Lcom/android/launcher3/keyboard/b;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p2, p0}, Landroid/widget/FrameLayout;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method h(Landroid/view/MotionEvent;Lcom/android/launcher3/views/BaseDragLayer;Lcom/android/launcher3/folder/Folder;)Z
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/android/launcher3/C2;->D1()LO0/r;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-virtual {p3}, LO0/c;->f()Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    const/4 v0, 0x1

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->R1()Lcom/android/launcher3/DropTargetBar;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_1
    return v0
.end method

.method i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/g0;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->N2()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method j(Lcom/android/launcher3/folder/Folder;)Z
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/g0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/folder/g0$a;-><init>(Lcom/android/launcher3/folder/g0;Lcom/android/launcher3/folder/Folder;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getLastItem()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    iget-object p0, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderIcon;->f0(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 21
    .line 22
    .line 23
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method
