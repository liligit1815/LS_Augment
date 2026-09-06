.class public Lcom/android/launcher3/popup/P$o;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "o"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 6

    .line 1
    const v1, 0x7f080c97

    .line 2
    .line 3
    .line 4
    const/high16 v2, 0x7f140000

    .line 5
    .line 6
    move-object v0, p0

    .line 7
    move-object v3, p1

    .line 8
    move-object v4, p2

    .line 9
    move-object v5, p3

    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p1, v1, v0}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v2, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    instance-of v4, v3, Lcom/android/launcher3/model/data/I;

    .line 22
    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    move-object v4, v3

    .line 26
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    filled-new-array {v3}, [Lcom/android/launcher3/model/data/y;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v0, v4, v3}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Lx1/O$b;

    .line 54
    .line 55
    invoke-direct {p1, v2}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/D3;->K(Ljava/util/ArrayList;Z)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method
