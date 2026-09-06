.class public Lcom/zte/mifavor/widget/DialogButtonBar;
.super Landroid/widget/LinearLayout;
.source "DialogButtonBar.java"


# instance fields
.field private g:[Landroid/view/View;

.field private h:[Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x3

    .line 5
    new-array p1, p1, [Landroid/view/View;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->g:[Landroid/view/View;

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    new-array p1, p1, [Landroid/view/View;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 13
    .line 14
    return-void
.end method

.method private a()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->g:[Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-object v2, v0, v1

    .line 5
    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const v2, 0x102001a

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    aput-object v2, v0, v1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->g:[Landroid/view/View;

    .line 19
    .line 20
    const v2, 0x102001b

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, 0x1

    .line 28
    aput-object v2, v0, v3

    .line 29
    .line 30
    iget-object v0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->g:[Landroid/view/View;

    .line 31
    .line 32
    const v2, 0x1020019

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const/4 v4, 0x2

    .line 40
    aput-object v2, v0, v4

    .line 41
    .line 42
    iget-object v0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 43
    .line 44
    sget v2, LR3/g;->x:I

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    aput-object v2, v0, v1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 53
    .line 54
    sget v1, LR3/g;->y:I

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    aput-object p0, v0, v3

    .line 61
    .line 62
    return-void
.end method

.method private b()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DialogButtonBar;->a()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v0

    .line 7
    move v3, v2

    .line 8
    :goto_0
    iget-object v4, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->g:[Landroid/view/View;

    .line 9
    .line 10
    array-length v5, v4

    .line 11
    if-ge v2, v5, :cond_1

    .line 12
    .line 13
    aget-object v4, v4, v2

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-nez v4, :cond_0

    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->g:[Landroid/view/View;

    .line 26
    .line 27
    aget-object v1, v1, v2

    .line 28
    .line 29
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v2, 0x3

    .line 33
    const/4 v5, 0x1

    .line 34
    if-ne v3, v2, :cond_2

    .line 35
    .line 36
    iget-object v1, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 37
    .line 38
    aget-object v1, v1, v0

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 44
    .line 45
    aget-object p0, p0, v5

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    const/16 v2, 0x8

    .line 52
    .line 53
    if-ne v3, v5, :cond_3

    .line 54
    .line 55
    iget-object v1, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 56
    .line 57
    aget-object v0, v1, v0

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 63
    .line 64
    aget-object p0, p0, v5

    .line 65
    .line 66
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    const/4 v6, 0x2

    .line 71
    if-ne v3, v6, :cond_5

    .line 72
    .line 73
    aget-object v3, v4, v5

    .line 74
    .line 75
    if-ne v1, v3, :cond_4

    .line 76
    .line 77
    iget-object v1, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 78
    .line 79
    aget-object v1, v1, v0

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 85
    .line 86
    aget-object p0, p0, v5

    .line 87
    .line 88
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_4
    iget-object v1, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 93
    .line 94
    aget-object v1, v1, v0

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/zte/mifavor/widget/DialogButtonBar;->h:[Landroid/view/View;

    .line 100
    .line 101
    aget-object p0, p0, v5

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    :cond_5
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/widget/DialogButtonBar;->b()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
