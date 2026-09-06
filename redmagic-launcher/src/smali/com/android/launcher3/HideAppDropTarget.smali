.class public Lcom/android/launcher3/HideAppDropTarget;
.super Lcom/android/launcher3/ButtonDropTarget;
.source "HideAppDropTarget.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/HideAppDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/high16 p2, 0x7f140000

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 15
    .line 16
    const p1, 0x7f080c97

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public getAccessibilityAction()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    instance-of v2, p1, Lcom/android/launcher3/model/data/I;

    .line 36
    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    filled-new-array {p1}, [Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 51
    .line 52
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    new-instance p1, Lx1/O$b;

    .line 61
    .line 62
    invoke-direct {p1, v1}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/D3;->K(Ljava/util/ArrayList;Z)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/ButtonDropTarget;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f080c97

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected setupItemInfo(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    return-void
.end method

.method public x(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected y(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object p1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0
.end method
