.class Lcom/zte/mifavor/widget/PagerSecond$c;
.super Ljava/lang/Object;
.source "PagerSecond.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/PagerSecond;->O()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/PagerSecond;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/PagerSecond;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$c;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$c;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$c;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->z(Lcom/zte/mifavor/widget/PagerSecond;)Landroidx/viewpager/widget/ViewPager;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/PagerSecond;->D(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$c;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->s(Lcom/zte/mifavor/widget/PagerSecond;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/PagerSecond;->F(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/zte/mifavor/widget/PagerSecond$c;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/zte/mifavor/widget/PagerSecond;->s(Lcom/zte/mifavor/widget/PagerSecond;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-static {p0, v0, v1}, Lcom/zte/mifavor/widget/PagerSecond;->H(Lcom/zte/mifavor/widget/PagerSecond;II)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
