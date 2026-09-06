.class public Lcom/android/launcher3/popup/P$e;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string v0, "paintbucket"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    const v3, 0x7f140414

    .line 8
    .line 9
    .line 10
    move-object v1, p0

    .line 11
    move-object v4, p1

    .line 12
    move-object v5, p2

    .line 13
    move-object v6, p3

    .line 14
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
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
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    iget v1, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 35
    .line 36
    iget v0, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 37
    .line 38
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of v0, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    move-object v0, p1

    .line 47
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getTintBackgroundColor()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    new-instance v1, Lcom/android/launcher3/popup/P$e$a;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/popup/P$e$a;-><init>(Lcom/android/launcher3/popup/P$e;Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->X(Landroid/view/View;ILT1/d;)Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method
