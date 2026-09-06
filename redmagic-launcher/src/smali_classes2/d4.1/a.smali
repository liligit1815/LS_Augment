.class public Ld4/a;
.super Ljava/lang/Object;
.source "AbsListViewOverScrollDecorAdapter.java"

# interfaces
.implements Ld4/c;


# instance fields
.field protected final a:Landroid/widget/AbsListView;


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ld4/a;->d()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ld4/a;->e()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/AbsListView;->getCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/2addr v2, v0

    .line 20
    iget-object v3, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    sub-int/2addr v0, v4

    .line 24
    invoke-virtual {v3, v0}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lt v2, v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/widget/AbsListView;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-object p0, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getListPaddingBottom()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    sub-int/2addr v1, p0

    .line 47
    if-le v0, v1, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_1
    :goto_0
    return v4
.end method

.method public e()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v2, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-gtz v2, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ld4/a;->a:Landroid/widget/AbsListView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getListPaddingTop()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-ge v0, p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return v1

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method
