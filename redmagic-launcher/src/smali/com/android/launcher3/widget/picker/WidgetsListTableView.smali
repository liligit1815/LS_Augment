.class public Lcom/android/launcher3/widget/picker/WidgetsListTableView;
.super Landroid/widget/TableLayout;
.source "WidgetsListTableView.java"


# instance fields
.field private g:Lcom/android/launcher3/widget/picker/U;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/TableLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected onCreateDrawableState(I)[I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListTableView;->g:Lcom/android/launcher3/widget/picker/U;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/widget/TableLayout;->onCreateDrawableState(I)[I

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/widget/picker/U;->g:[I

    .line 11
    .line 12
    array-length v0, v0

    .line 13
    add-int/2addr p1, v0

    .line 14
    invoke-super {p0, p1}, Landroid/widget/TableLayout;->onCreateDrawableState(I)[I

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/WidgetsListTableView;->g:Lcom/android/launcher3/widget/picker/U;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/U;->g:[I

    .line 21
    .line 22
    invoke-static {p1, p0}, Landroid/widget/TableLayout;->mergeDrawableStates([I[I)[I

    .line 23
    .line 24
    .line 25
    return-object p1
.end method

.method public setListDrawableState(Lcom/android/launcher3/widget/picker/U;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/WidgetsListTableView;->g:Lcom/android/launcher3/widget/picker/U;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/WidgetsListTableView;->g:Lcom/android/launcher3/widget/picker/U;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/TableLayout;->refreshDrawableState()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
