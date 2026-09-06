.class public Lcom/zte/mifavor/widget/PagerSecond$f;
.super Lcom/zte/mifavor/widget/TextViewZTE;
.source "PagerSecond.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/PagerSecond;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field final synthetic i:Lcom/zte/mifavor/widget/PagerSecond;


# direct methods
.method public constructor <init>(Lcom/zte/mifavor/widget/PagerSecond;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$f;->i:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lcom/zte/mifavor/widget/TextViewZTE;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isFocused()Z
    .locals 2
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "focus"
    .end annotation

    .line 1
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/text/TextUtils$TruncateAt;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-super {p0}, Landroid/widget/TextView;->isFocused()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$f;->i:Lcom/zte/mifavor/widget/PagerSecond;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->k(Lcom/zte/mifavor/widget/PagerSecond;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "--tab:"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "PagerSecond"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$f;->i:Lcom/zte/mifavor/widget/PagerSecond;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->w(Lcom/zte/mifavor/widget/PagerSecond;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/high16 v2, -0x80000000

    .line 56
    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$f;->i:Lcom/zte/mifavor/widget/PagerSecond;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/zte/mifavor/widget/PagerSecond;->r(Lcom/zte/mifavor/widget/PagerSecond;)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-static {p1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    if-ne v0, v2, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Lcom/zte/mifavor/widget/PagerSecond$f;->i:Lcom/zte/mifavor/widget/PagerSecond;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/zte/mifavor/widget/PagerSecond;->r(Lcom/zte/mifavor/widget/PagerSecond;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-le v1, v0, :cond_3

    .line 82
    .line 83
    iget-object p1, p0, Lcom/zte/mifavor/widget/PagerSecond$f;->i:Lcom/zte/mifavor/widget/PagerSecond;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/zte/mifavor/widget/PagerSecond;->r(Lcom/zte/mifavor/widget/PagerSecond;)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
