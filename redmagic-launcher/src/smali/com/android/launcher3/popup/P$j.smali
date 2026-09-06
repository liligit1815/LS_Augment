.class public Lcom/android/launcher3/popup/P$j;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "j"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 7

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/launcher3/model/data/p;->m:I

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    const-string v0, "icon_size_large"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "icon_size_small"

    .line 17
    .line 18
    :goto_0
    invoke-static {p1, v0}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const v3, 0x7f140415

    .line 23
    .line 24
    .line 25
    move-object v1, p0

    .line 26
    move-object v4, p1

    .line 27
    move-object v5, p2

    .line 28
    move-object v6, p3

    .line 29
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    check-cast p1, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    iget v1, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 11
    .line 12
    iget v0, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 13
    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 21
    .line 22
    iget v1, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 23
    .line 24
    iget v0, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 25
    .line 26
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    iget v0, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 35
    .line 36
    iget p0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 37
    .line 38
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    instance-of p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 43
    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->M0()V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
