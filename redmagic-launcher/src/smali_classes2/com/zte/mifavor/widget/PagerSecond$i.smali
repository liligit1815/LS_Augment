.class public Lcom/zte/mifavor/widget/PagerSecond$i;
.super Landroid/widget/LinearLayout;
.source "PagerSecond.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/PagerSecond;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "i"
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/PagerSecond;


# direct methods
.method public constructor <init>(Lcom/zte/mifavor/widget/PagerSecond;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result v0

    const-string v1, "PagerSecond"

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "----container:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->w(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    move v0, v2

    .line 4
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 6
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 7
    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 v4, 0x3f800000    # 1.0f

    .line 8
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 9
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 10
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void

    .line 11
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    .line 12
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->d(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v3

    if-gt v0, v3, :cond_3

    .line 13
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->l(Lcom/zte/mifavor/widget/PagerSecond;)F

    move-result v0

    goto :goto_2

    .line 14
    :cond_3
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->e(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v3

    if-ne v0, v3, :cond_4

    .line 15
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->m(Lcom/zte/mifavor/widget/PagerSecond;)F

    move-result v0

    goto :goto_2

    .line 16
    :cond_4
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->f(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v3

    if-ne v0, v3, :cond_5

    .line 17
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->n(Lcom/zte/mifavor/widget/PagerSecond;)F

    move-result v0

    goto :goto_2

    .line 18
    :cond_5
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->g(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v3

    if-ne v0, v3, :cond_6

    .line 19
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->o(Lcom/zte/mifavor/widget/PagerSecond;)F

    move-result v0

    goto :goto_2

    .line 20
    :cond_6
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->h(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v3

    if-eq v0, v3, :cond_9

    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->i(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v3

    if-ne v0, v3, :cond_7

    goto :goto_1

    .line 21
    :cond_7
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v3}, Lcom/zte/mifavor/widget/PagerSecond;->j(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v3

    if-lt v0, v3, :cond_8

    .line 22
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->q(Lcom/zte/mifavor/widget/PagerSecond;)F

    move-result v0

    goto :goto_2

    .line 23
    :cond_8
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->l(Lcom/zte/mifavor/widget/PagerSecond;)F

    move-result v0

    goto :goto_2

    .line 24
    :cond_9
    :goto_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->p(Lcom/zte/mifavor/widget/PagerSecond;)F

    move-result v0

    .line 25
    :goto_2
    iget-object v3, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-virtual {v3}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result v3

    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    const/4 v5, 0x1

    if-lt v4, v5, :cond_16

    if-gtz v3, :cond_a

    goto/16 :goto_7

    .line 27
    :cond_a
    iget-object v4, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    int-to-float v5, v3

    mul-float/2addr v0, v5

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v0, v5

    float-to-int v0, v0

    invoke-static {v4, v0}, Lcom/zte/mifavor/widget/PagerSecond;->C(Lcom/zte/mifavor/widget/PagerSecond;I)V

    .line 28
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 29
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {p1}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result p1

    if-eqz p1, :cond_b

    .line 30
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "<<<parent="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ",TabMaxLimit="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->r(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    move p1, v2

    move v0, p1

    move v4, v0

    .line 31
    :goto_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    const-string v6, ":"

    if-ge p1, v5, :cond_e

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 33
    iget-object v7, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v7}, Lcom/zte/mifavor/widget/PagerSecond;->r(Lcom/zte/mifavor/widget/PagerSecond;)I

    move-result v7

    const/high16 v8, -0x80000000

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    invoke-virtual {v5, v7, p2}, Landroid/view/View;->measure(II)V

    .line 34
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v0, v7

    .line 35
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    iget-object v7, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v7}, Lcom/zte/mifavor/widget/PagerSecond;->r(Lcom/zte/mifavor/widget/PagerSecond;)I

    .line 36
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    if-le v7, v4, :cond_c

    .line 37
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 38
    :cond_c
    iget-object v7, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v7}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 39
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "measure "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    :cond_e
    sub-int p1, v3, v0

    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "excessSpace="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ",maxWidth="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    :cond_f
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->u(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result v0

    if-nez v0, :cond_13

    if-lez p1, :cond_13

    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    div-int v0, v3, v0

    const/high16 v5, 0x40000000    # 2.0f

    if-lt v0, v4, :cond_11

    .line 44
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {p1}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result p1

    if-eqz p1, :cond_10

    .line 45
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "avg tab:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    div-int v0, v3, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_10
    move p1, v2

    .line 46
    :goto_4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_13

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    div-int v4, v3, v4

    .line 49
    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 50
    invoke-virtual {v0, v4, p2}, Landroid/view/View;->measure(II)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_4

    .line 51
    :cond_11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    div-int/2addr p1, v0

    .line 52
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "avg space:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_12
    move v0, v2

    .line 54
    :goto_5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v0, v3, :cond_13

    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 56
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v4, p1

    .line 57
    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {v3, v4, p2}, Landroid/view/View;->measure(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 58
    :cond_13
    :goto_6
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    if-ge v2, p1, :cond_15

    .line 59
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 60
    iget-object p2, p0, Lcom/zte/mifavor/widget/PagerSecond$i;->g:Lcom/zte/mifavor/widget/PagerSecond;

    invoke-static {p2}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    move-result p2

    if-eqz p2, :cond_14

    .line 61
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "final "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_15
    return-void

    .line 62
    :cond_16
    :goto_7
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method
