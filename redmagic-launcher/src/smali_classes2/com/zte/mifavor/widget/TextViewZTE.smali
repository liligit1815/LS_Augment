.class public Lcom/zte/mifavor/widget/TextViewZTE;
.super Landroid/widget/TextView;
.source "TextViewZTE.java"


# instance fields
.field private g:J

.field private h:Lcom/zte/mifavor/widget/g;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/widget/TextViewZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x1010084

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/TextViewZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/zte/mifavor/widget/TextViewZTE;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const-wide/16 v0, -0x1

    .line 5
    iput-wide v0, p0, Lcom/zte/mifavor/widget/TextViewZTE;->g:J

    .line 6
    new-instance p1, Lcom/zte/mifavor/widget/g;

    invoke-direct {p1}, Lcom/zte/mifavor/widget/g;-><init>()V

    iput-object p1, p0, Lcom/zte/mifavor/widget/TextViewZTE;->h:Lcom/zte/mifavor/widget/g;

    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVerticalScrollBarEnabled(Z)V

    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHorizontalScrollBarEnabled(Z)V

    const/4 p1, 0x2

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOverScrollMode(I)V

    .line 10
    iget-object p1, p0, Lcom/zte/mifavor/widget/TextViewZTE;->h:Lcom/zte/mifavor/widget/g;

    invoke-virtual {p1, p0, p2, p3, p4}, Lcom/zte/mifavor/widget/g;->b(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private b(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_0

    .line 8
    .line 9
    if-nez v0, :cond_4

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/mifavor/widget/TextViewZTE;->a(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)[Landroid/text/style/ClickableSpan;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    if-eqz p3, :cond_4

    .line 16
    .line 17
    array-length v3, p3

    .line 18
    if-eqz v3, :cond_4

    .line 19
    .line 20
    if-ne v0, v2, :cond_2

    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    iget-wide v5, p0, Lcom/zte/mifavor/widget/TextViewZTE;->g:J

    .line 27
    .line 28
    sub-long/2addr v3, v5

    .line 29
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    int-to-long v5, p0

    .line 34
    cmp-long p0, v3, v5

    .line 35
    .line 36
    if-lez p0, :cond_1

    .line 37
    .line 38
    return v1

    .line 39
    :cond_1
    aget-object p0, p3, v1

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p2}, Landroid/text/Selection;->removeSelection(Landroid/text/Spannable;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    if-nez v0, :cond_3

    .line 49
    .line 50
    aget-object p1, p3, v1

    .line 51
    .line 52
    invoke-interface {p2, p1}, Landroid/text/Spannable;->getSpanStart(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    aget-object p3, p3, v1

    .line 57
    .line 58
    invoke-interface {p2, p3}, Landroid/text/Spannable;->getSpanEnd(Ljava/lang/Object;)I

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    invoke-static {p2, p1, p3}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide p1

    .line 69
    iput-wide p1, p0, Lcom/zte/mifavor/widget/TextViewZTE;->g:J

    .line 70
    .line 71
    :cond_3
    :goto_0
    return v2

    .line 72
    :cond_4
    return v1
.end method


# virtual methods
.method public a(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)[Landroid/text/style/ClickableSpan;
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_1
    :goto_0
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    float-to-int p0, p0

    .line 18
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    float-to-int p3, p3

    .line 23
    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sub-int/2addr p0, v0

    .line 28
    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingTop()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    sub-int/2addr p3, v0

    .line 33
    invoke-virtual {p1}, Landroid/widget/TextView;->getScrollX()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    invoke-virtual {p1}, Landroid/widget/TextView;->getScrollY()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    add-int/2addr p3, v0

    .line 43
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, p3}, Landroid/text/Layout;->getLineForVertical(I)I

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    int-to-float p0, p0

    .line 52
    invoke-virtual {p1, p3, p0}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    const-class p1, Landroid/text/style/ClickableSpan;

    .line 57
    .line 58
    invoke-interface {p2, p0, p0, p1}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, [Landroid/text/style/ClickableSpan;

    .line 63
    .line 64
    return-object p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    instance-of v1, v0, Landroid/text/Spannable;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/TextView;->getLinksClickable()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, Landroid/text/Spannable;

    .line 18
    .line 19
    invoke-direct {p0, p0, v0, p1}, Lcom/zte/mifavor/widget/TextViewZTE;->b(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method public setTextAppearance(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/zte/mifavor/widget/TextViewZTE;->h:Lcom/zte/mifavor/widget/g;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/g;->d(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setTextFontScale(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/TextViewZTE;->h:Lcom/zte/mifavor/widget/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/g;->c(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
