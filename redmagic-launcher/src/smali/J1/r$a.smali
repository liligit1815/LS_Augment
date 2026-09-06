.class LJ1/r$a;
.super Ljava/lang/Object;
.source "SecondaryDragController.java"

# interfaces
.implements Lcom/android/launcher3/n0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ1/r;->x([I)Lcom/android/launcher3/n0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LJ1/r;


# direct methods
.method constructor <init>(LJ1/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, LJ1/r$a;->g:LJ1/r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
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
    .locals 0

    .line 1
    return-void
.end method

.method public I(Lcom/android/launcher3/n0$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public J(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public l(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget-object p1, p0, LJ1/r$a;->g:LJ1/r;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/j;->y()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, LJ1/r$a;->g:LJ1/r;

    .line 8
    .line 9
    invoke-static {v0}, LJ1/r;->V(LJ1/r;)Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f0702bd

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    cmpl-float p1, p1, v0

    .line 28
    .line 29
    if-lez p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, LJ1/r$a;->g:LJ1/r;

    .line 32
    .line 33
    invoke-static {p1}, LJ1/r;->W(LJ1/r;)Lcom/android/launcher3/views/k;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k0(Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, LJ1/r$a;->g:LJ1/r;

    .line 44
    .line 45
    invoke-static {p0}, LJ1/r;->X(LJ1/r;)Lcom/android/launcher3/views/k;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ1/r$a;->g:LJ1/r;

    .line 2
    .line 3
    invoke-static {p0}, LJ1/r;->U(LJ1/r;)Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->getPinnedAppsAdapter()LJ1/m;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    invoke-virtual {p0, p2}, LJ1/m;->i(Lcom/android/launcher3/model/data/y;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
