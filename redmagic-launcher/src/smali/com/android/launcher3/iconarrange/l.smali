.class public Lcom/android/launcher3/iconarrange/l;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "RecyclerViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/iconarrange/l$b;,
        Lcom/android/launcher3/iconarrange/l$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/view/LayoutInflater;

.field private c:Lcom/android/launcher3/C2;

.field private d:Lcom/android/launcher3/iconarrange/l$b;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/android/launcher3/C2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/drawable/Drawable;",
            ">;",
            "Lcom/android/launcher3/C2;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/l;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/iconarrange/l;->c:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/l;->b:Landroid/view/LayoutInflater;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/iconarrange/l;Lcom/android/launcher3/iconarrange/l$a;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/iconarrange/l;->g(Lcom/android/launcher3/iconarrange/l$a;ILandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic g(Lcom/android/launcher3/iconarrange/l$a;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/l;->d:Lcom/android/launcher3/iconarrange/l$b;

    .line 2
    .line 3
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    invoke-interface {p0, p1, p2, p3}, Lcom/android/launcher3/iconarrange/l$b;->a(Landroid/view/View;II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/l;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Lcom/android/launcher3/iconarrange/l$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/l;->d:Lcom/android/launcher3/iconarrange/l$b;

    .line 2
    .line 3
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    .line 1
    check-cast p1, Lcom/android/launcher3/iconarrange/l$a;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const v3, 0x7f040499

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v3, v2}, Lcom/android/launcher3/util/F2;->f(Landroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/l;->c:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/menu/c;->k()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-ne v0, p2, :cond_0

    .line 40
    .line 41
    iget-object v0, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setSelected(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object v0, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setSelected(Z)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object v0, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/l;->c:Lcom/android/launcher3/C2;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->u()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 71
    .line 72
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/l;->c:Lcom/android/launcher3/C2;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Lcom/android/launcher3/X3;->t()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 83
    .line 84
    iget-object v1, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 90
    .line 91
    check-cast v0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;

    .line 92
    .line 93
    invoke-virtual {v0, p2}, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->setPosition(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 97
    .line 98
    check-cast v0, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/MenuIconArrangeItem;->a()V

    .line 101
    .line 102
    .line 103
    iget-object v0, p1, Lcom/android/launcher3/iconarrange/l$a;->a:Landroid/widget/FrameLayout;

    .line 104
    .line 105
    new-instance v1, Lcom/android/launcher3/iconarrange/k;

    .line 106
    .line 107
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/iconarrange/k;-><init>(Lcom/android/launcher3/iconarrange/l;Lcom/android/launcher3/iconarrange/l$a;I)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/iconarrange/l;->b:Landroid/view/LayoutInflater;

    .line 2
    .line 3
    const v0, 0x7f0e010e

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p2, Lcom/android/launcher3/iconarrange/l$a;

    .line 12
    .line 13
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/iconarrange/l$a;-><init>(Lcom/android/launcher3/iconarrange/l;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-object p2
.end method
