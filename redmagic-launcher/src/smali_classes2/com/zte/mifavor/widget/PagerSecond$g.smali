.class Lcom/zte/mifavor/widget/PagerSecond$g;
.super Ljava/lang/Object;
.source "PagerSecond.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/PagerSecond;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "g"
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/PagerSecond;


# direct methods
.method private constructor <init>(Lcom/zte/mifavor/widget/PagerSecond;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/zte/mifavor/widget/PagerSecond;Lcom/zte/mifavor/widget/o;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/PagerSecond$g;-><init>(Lcom/zte/mifavor/widget/PagerSecond;)V

    return-void
.end method


# virtual methods
.method public a(IFI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/zte/mifavor/widget/PagerSecond;->D(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->s(Lcom/zte/mifavor/widget/PagerSecond;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/PagerSecond;->F(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 16
    .line 17
    invoke-static {v0, p2}, Lcom/zte/mifavor/widget/PagerSecond;->E(Lcom/zte/mifavor/widget/PagerSecond;F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->B(Lcom/zte/mifavor/widget/PagerSecond;)Landroid/widget/LinearLayout;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-float v1, v1

    .line 35
    mul-float/2addr v1, p2

    .line 36
    float-to-int v1, v1

    .line 37
    invoke-static {v0, p1, v1}, Lcom/zte/mifavor/widget/PagerSecond;->H(Lcom/zte/mifavor/widget/PagerSecond;II)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->invalidate()V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->i:Landroidx/viewpager/widget/ViewPager$j;

    .line 48
    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    invoke-interface {p0, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager$j;->a(IFI)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->z(Lcom/zte/mifavor/widget/PagerSecond;)Landroidx/viewpager/widget/ViewPager;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v0, v1, v2}, Lcom/zte/mifavor/widget/PagerSecond;->H(Lcom/zte/mifavor/widget/PagerSecond;II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond;->i:Landroidx/viewpager/widget/ViewPager$j;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-interface {p0, p1}, Landroidx/viewpager/widget/ViewPager$j;->b(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public c(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/zte/mifavor/widget/PagerSecond;->G(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/zte/mifavor/widget/PagerSecond;->F(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/zte/mifavor/widget/PagerSecond;->i:Landroidx/viewpager/widget/ViewPager$j;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {v0, p1}, Landroidx/viewpager/widget/ViewPager$j;->c(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond$g;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/zte/mifavor/widget/PagerSecond;->I(Lcom/zte/mifavor/widget/PagerSecond;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
