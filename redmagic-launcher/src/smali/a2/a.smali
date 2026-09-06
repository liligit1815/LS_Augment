.class public La2/a;
.super Lcom/android/launcher3/taskbar/b;
.source "TaskbarOverlayContext.java"


# instance fields
.field private final h:Lcom/android/launcher3/taskbar/I1;

.field private final i:La2/e;

.field private final j:Lcom/android/launcher3/taskbar/j2;

.field private final k:La2/h;

.field private final l:I

.field private final m:Lcom/android/launcher3/taskbar/o4;

.field private n:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/taskbar/I1;Lcom/android/launcher3/taskbar/R1;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->e1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/b;-><init>(Landroid/content/Context;Z)V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, La2/a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    iget-object p1, p3, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 11
    .line 12
    iput-object p1, p0, La2/a;->i:La2/e;

    .line 13
    .line 14
    new-instance p1, Lcom/android/launcher3/taskbar/j2;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/j2;-><init>(Lcom/android/launcher3/taskbar/b;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, La2/a;->j:Lcom/android/launcher3/taskbar/j2;

    .line 20
    .line 21
    invoke-virtual {p1, p3}, Lcom/android/launcher3/taskbar/j2;->l0(Lcom/android/launcher3/taskbar/R1;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, La2/h;

    .line 25
    .line 26
    invoke-direct {p1, p0}, La2/h;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, La2/a;->k:La2/h;

    .line 30
    .line 31
    iget-object p1, p3, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/a4;->Q()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, La2/a;->l:I

    .line 38
    .line 39
    iget-object p1, p3, Lcom/android/launcher3/taskbar/R1;->E:Lcom/android/launcher3/taskbar/o4;

    .line 40
    .line 41
    iput-object p1, p0, La2/a;->m:Lcom/android/launcher3/taskbar/o4;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/util/s;->onViewCreated()V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->i:La2/e;

    .line 2
    .line 3
    invoke-virtual {p0}, La2/e;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 1

    .line 1
    iget-object p0, p0, La2/a;->j:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/taskbar/B4;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/B4;-><init>(Lcom/android/launcher3/taskbar/j2;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public bridge synthetic getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    invoke-virtual {p0}, La2/a;->k()Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDeviceProfile()Lcom/android/launcher3/h0;
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->i:La2/e;

    .line 2
    .line 3
    invoke-virtual {p0}, La2/e;->k()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    invoke-virtual {p0}, La2/a;->l()Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    invoke-virtual {p0}, La2/a;->n()La2/h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getForeColor()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method

.method public k()Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;
    .locals 1

    .line 1
    iget-object p0, p0, La2/a;->k:La2/h;

    .line 2
    .line 3
    const v0, 0x7f0b00e7

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 11
    .line 12
    return-object p0
.end method

.method public l()Lcom/android/launcher3/taskbar/j2;
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->j:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()La2/h;
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->k:La2/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()La2/e;
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->i:La2/e;

    .line 2
    .line 3
    return-object p0
.end method

.method p()I
    .locals 0

    .line 1
    iget p0, p0, La2/a;->l:I

    .line 2
    .line 3
    return p0
.end method

.method q()Z
    .locals 1

    .line 1
    iget-object v0, p0, La2/a;->j:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/j2;->n0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, La2/a;->h:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->v0()Lcom/android/launcher3/taskbar/j2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/j2;->n0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->j:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/j2;->w0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;)V
    .locals 0

    .line 1
    iput-object p1, p0, La2/a;->n:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 2
    .line 3
    return-void
.end method

.method public startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, La2/a;->m:Lcom/android/launcher3/taskbar/o4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/o4;->P(Lcom/android/launcher3/util/y2$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
