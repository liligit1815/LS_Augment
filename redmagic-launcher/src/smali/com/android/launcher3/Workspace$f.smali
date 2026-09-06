.class Lcom/android/launcher3/Workspace$f;
.super LO0/a;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/Workspace;->h3(Lc1/a;Lcom/android/launcher3/dragndrop/p;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic i:Lcom/android/launcher3/Workspace;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Workspace;Landroid/view/ViewGroup;Ljava/util/function/Function;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace$f;->i:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, LO0/a;-><init>(Landroid/view/ViewGroup;Ljava/util/function/Function;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected a(ZLcom/android/launcher3/n0$a;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, LO0/a;->a(ZLcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/Workspace$f;->i:Lcom/android/launcher3/Workspace;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0, p1}, LO0/a;->b(Lcom/android/launcher3/CellLayout;Z)V

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p1, p2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    instance-of p1, p1, Lcom/android/launcher3/model/data/A;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/Workspace$f;->i:Lcom/android/launcher3/Workspace;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x4

    .line 34
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
