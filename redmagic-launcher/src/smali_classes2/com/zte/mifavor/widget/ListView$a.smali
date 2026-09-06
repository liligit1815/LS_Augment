.class Lcom/zte/mifavor/widget/ListView$a;
.super Ljava/lang/Object;
.source "ListView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/ListView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/ListView$a$a;
    }
.end annotation


# instance fields
.field private a:Landroid/util/SparseArray;

.field private b:I

.field final synthetic c:Lcom/zte/mifavor/widget/ListView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/ListView;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/util/SparseArray;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p1, v0}, Landroid/util/SparseArray;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->a:Landroid/util/SparseArray;

    .line 13
    .line 14
    iput v0, p0, Lcom/zte/mifavor/widget/ListView$a;->b:I

    .line 15
    .line 16
    return-void
.end method

.method private a()I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lcom/zte/mifavor/widget/ListView$a;->b:I

    .line 4
    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    iget-object v2, p0, Lcom/zte/mifavor/widget/ListView$a;->a:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/zte/mifavor/widget/ListView$a$a;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget v2, v2, Lcom/zte/mifavor/widget/ListView$a$a;->a:I

    .line 18
    .line 19
    add-int/2addr v1, v2

    .line 20
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ListView$a;->a:Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/zte/mifavor/widget/ListView$a$a;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Lcom/zte/mifavor/widget/ListView$a$a;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/zte/mifavor/widget/ListView$a$a;-><init>(Lcom/zte/mifavor/widget/ListView$a;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget p0, v0, Lcom/zte/mifavor/widget/ListView$a$a;->b:I

    .line 39
    .line 40
    sub-int/2addr v1, p0

    .line 41
    return v1
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/zte/mifavor/widget/ListView$a;->b:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p3}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-object p3, p0, Lcom/zte/mifavor/widget/ListView$a;->a:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {p3, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Lcom/zte/mifavor/widget/ListView$a$a;

    .line 17
    .line 18
    if-nez p3, :cond_0

    .line 19
    .line 20
    new-instance p3, Lcom/zte/mifavor/widget/ListView$a$a;

    .line 21
    .line 22
    invoke-direct {p3, p0}, Lcom/zte/mifavor/widget/ListView$a$a;-><init>(Lcom/zte/mifavor/widget/ListView$a;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    iput p4, p3, Lcom/zte/mifavor/widget/ListView$a$a;->a:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    iput p4, p3, Lcom/zte/mifavor/widget/ListView$a$a;->b:I

    .line 36
    .line 37
    iget-object p4, p0, Lcom/zte/mifavor/widget/ListView$a;->a:Landroid/util/SparseArray;

    .line 38
    .line 39
    invoke-virtual {p4, p2, p3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget p2, p3, Lcom/zte/mifavor/widget/ListView$a$a;->a:I

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/zte/mifavor/widget/ListView$a;->a()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    div-int/2addr p2, p1

    .line 55
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/zte/mifavor/widget/ListView;->c(Lcom/zte/mifavor/widget/ListView;)I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    sub-int/2addr p3, p2

    .line 62
    invoke-static {p1, p3}, Lcom/zte/mifavor/widget/ListView;->d(Lcom/zte/mifavor/widget/ListView;I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/zte/mifavor/widget/ListView;->b(Lcom/zte/mifavor/widget/ListView;)Lb4/e;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/zte/mifavor/widget/ListView;->c(Lcom/zte/mifavor/widget/ListView;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-virtual {p1, p0}, Lb4/e;->C(I)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/zte/mifavor/widget/ListView;->a(Lcom/zte/mifavor/widget/ListView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/zte/mifavor/widget/ListView;->b(Lcom/zte/mifavor/widget/ListView;)Lb4/e;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-nez p2, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/zte/mifavor/widget/ListView;->b(Lcom/zte/mifavor/widget/ListView;)Lb4/e;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lb4/e;->t()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 33
    .line 34
    const/4 p2, -0x1

    .line 35
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 39
    .line 40
    const/4 p2, 0x1

    .line 41
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 45
    .line 46
    const/4 p2, 0x0

    .line 47
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView$a;->c:Lcom/zte/mifavor/widget/ListView;

    .line 52
    .line 53
    invoke-static {p0}, Lcom/zte/mifavor/widget/ListView;->b(Lcom/zte/mifavor/widget/ListView;)Lb4/e;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/16 p2, 0x3e9

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Lb4/e;->x(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method
