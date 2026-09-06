.class public Lcom/android/launcher3/widget/w0;
.super Lcom/android/launcher3/widget/i;
.source "MoreWidgetViewHolder.java"


# instance fields
.field private b:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/i;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b03e0

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 14
    .line 15
    const v0, 0x7f0b03e1

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/widget/w0;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public b(Lcom/android/launcher3/widget/v;Lcom/android/launcher3/widget/C;Z)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 8
    .line 9
    iget-object v0, p2, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const v1, 0x7f070206

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    float-to-int v0, v0

    .line 23
    iput v0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p2, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const v1, 0x7f070205

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    float-to-int v0, v0

    .line 45
    iput v0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 48
    .line 49
    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p1, Lcom/android/launcher3/widget/v;->a:Ljava/util/ArrayList;

    .line 53
    .line 54
    iget-object p3, p0, Lcom/android/launcher3/widget/w0;->b:Landroid/widget/TextView;

    .line 55
    .line 56
    iget-object v0, p2, Lcom/android/launcher3/widget/C;->g:Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-virtual {p3, v1, v1, v0, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->s()Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    if-eqz p3, :cond_1

    .line 71
    .line 72
    iget-object p3, p0, Lcom/android/launcher3/widget/w0;->b:Landroid/widget/TextView;

    .line 73
    .line 74
    iget-object v0, p2, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const v1, 0x7f0701f9

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-virtual {p3, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 89
    .line 90
    .line 91
    :cond_1
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 92
    .line 93
    new-instance v0, Lcom/android/launcher3/widget/w0$a;

    .line 94
    .line 95
    invoke-direct {v0, p0, p2, p1}, Lcom/android/launcher3/widget/w0$a;-><init>(Lcom/android/launcher3/widget/w0;Lcom/android/launcher3/widget/C;Ljava/util/ArrayList;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method
