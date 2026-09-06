.class Landroidx/appcompat/view/menu/e$a;
.super Landroid/widget/BaseAdapter;
.source "ListMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/view/menu/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private g:I

.field final synthetic h:Landroidx/appcompat/view/menu/e;


# direct methods
.method public constructor <init>(Landroidx/appcompat/view/menu/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Landroidx/appcompat/view/menu/e$a;->g:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/e$a;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method a()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/appcompat/view/menu/e;->i:Landroidx/appcompat/view/menu/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/g;->v()Landroidx/appcompat/view/menu/i;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 12
    .line 13
    iget-object v1, v1, Landroidx/appcompat/view/menu/e;->i:Landroidx/appcompat/view/menu/g;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/g;->z()Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    :goto_0
    if-ge v3, v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Landroidx/appcompat/view/menu/i;

    .line 31
    .line 32
    if-ne v4, v0, :cond_0

    .line 33
    .line 34
    iput v3, p0, Landroidx/appcompat/view/menu/e$a;->g:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 v0, -0x1

    .line 41
    iput v0, p0, Landroidx/appcompat/view/menu/e$a;->g:I

    .line 42
    .line 43
    return-void
.end method

.method public b(I)Landroidx/appcompat/view/menu/i;
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/appcompat/view/menu/e;->i:Landroidx/appcompat/view/menu/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/g;->z()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 10
    .line 11
    iget v1, v1, Landroidx/appcompat/view/menu/e;->k:I

    .line 12
    .line 13
    add-int/2addr p1, v1

    .line 14
    iget p0, p0, Landroidx/appcompat/view/menu/e$a;->g:I

    .line 15
    .line 16
    if-ltz p0, :cond_0

    .line 17
    .line 18
    if-lt p1, p0, :cond_0

    .line 19
    .line 20
    add-int/lit8 p1, p1, 0x1

    .line 21
    .line 22
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Landroidx/appcompat/view/menu/i;

    .line 27
    .line 28
    return-object p0
.end method

.method public getCount()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/appcompat/view/menu/e;->i:Landroidx/appcompat/view/menu/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/g;->z()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 14
    .line 15
    iget v1, v1, Landroidx/appcompat/view/menu/e;->k:I

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    iget p0, p0, Landroidx/appcompat/view/menu/e$a;->g:I

    .line 19
    .line 20
    if-gez p0, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 24
    .line 25
    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/appcompat/view/menu/e$a;->b(I)Landroidx/appcompat/view/menu/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Landroidx/appcompat/view/menu/e$a;->h:Landroidx/appcompat/view/menu/e;

    .line 5
    .line 6
    iget-object v1, p2, Landroidx/appcompat/view/menu/e;->h:Landroid/view/LayoutInflater;

    .line 7
    .line 8
    iget p2, p2, Landroidx/appcompat/view/menu/e;->m:I

    .line 9
    .line 10
    invoke-virtual {v1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    :cond_0
    move-object p3, p2

    .line 15
    check-cast p3, Landroidx/appcompat/view/menu/n$a;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroidx/appcompat/view/menu/e$a;->b(I)Landroidx/appcompat/view/menu/i;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p3, p0, v0}, Landroidx/appcompat/view/menu/n$a;->c(Landroidx/appcompat/view/menu/i;I)V

    .line 22
    .line 23
    .line 24
    return-object p2
.end method

.method public notifyDataSetChanged()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/e$a;->a()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
