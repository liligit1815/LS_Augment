.class public LO0/f;
.super LO0/d;
.source "FolderAccessibilityHelper.java"


# instance fields
.field private final D:I

.field private final E:Lcom/android/launcher3/folder/FolderPagedView;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/CellLayout;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, LO0/d;-><init>(Lcom/android/launcher3/CellLayout;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/android/launcher3/folder/FolderPagedView;

    .line 9
    .line 10
    iput-object v0, p0, LO0/f;->E:Lcom/android/launcher3/folder/FolderPagedView;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    mul-int/2addr v0, v1

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    mul-int/2addr v0, p1

    .line 26
    iput v0, p0, LO0/f;->D:I

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method protected X(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LO0/d;->z:Landroid/content/Context;

    .line 2
    .line 3
    const p1, 0x7f140219

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method protected a0(I)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, LO0/d;->z:Landroid/content/Context;

    .line 2
    .line 3
    iget p0, p0, LO0/f;->D:I

    .line 4
    .line 5
    add-int/2addr p1, p0

    .line 6
    add-int/lit8 p1, p1, 0x1

    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const p1, 0x7f14027a

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method protected b0(I)I
    .locals 1

    .line 1
    iget-object v0, p0, LO0/f;->E:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->getAllocatedContentSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, LO0/f;->D:I

    .line 8
    .line 9
    sub-int/2addr v0, p0

    .line 10
    add-int/lit8 v0, v0, -0x1

    .line 11
    .line 12
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method
