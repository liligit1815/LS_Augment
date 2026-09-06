.class public Lcom/zte/mifavor/widget/w;
.super Landroid/widget/PopupWindow;
.source "ZTEPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/w$a;
    }
.end annotation


# instance fields
.field public a:[Ljava/lang/CharSequence;

.field private b:Lcom/zte/mifavor/widget/ListViewZTE;

.field private c:Landroid/widget/AdapterView$OnItemClickListener;

.field private d:Landroid/content/Context;

.field private e:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, -0x2

    .line 2
    invoke-direct {p0, v0, v0}, Landroid/widget/PopupWindow;-><init>(II)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a([Ljava/lang/CharSequence;Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/w;->a:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/mifavor/widget/w;->c:Landroid/widget/AdapterView$OnItemClickListener;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget p2, LR3/i;->x:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/zte/mifavor/widget/w;->e:Landroid/view/View;

    .line 19
    .line 20
    sget p2, LR3/g;->I0:I

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/zte/mifavor/widget/ListViewZTE;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/zte/mifavor/widget/w;->b:Lcom/zte/mifavor/widget/ListViewZTE;

    .line 29
    .line 30
    iget-object p1, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget p2, LR3/e;->U:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    div-int/lit8 p1, p1, 0x2

    .line 43
    .line 44
    iget-object p2, p0, Lcom/zte/mifavor/widget/w;->b:Lcom/zte/mifavor/widget/ListViewZTE;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p2, v0, p1, v0, p1}, Landroid/widget/ListView;->setPaddingRelative(IIII)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/zte/mifavor/widget/w;->b:Lcom/zte/mifavor/widget/ListViewZTE;

    .line 51
    .line 52
    new-instance p2, Lcom/zte/mifavor/widget/w$a;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 55
    .line 56
    sget v1, LR3/i;->w:I

    .line 57
    .line 58
    iget-object v2, p0, Lcom/zte/mifavor/widget/w;->a:[Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-direct {p2, v0, v1, v2}, Lcom/zte/mifavor/widget/w$a;-><init>(Landroid/content/Context;I[Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/zte/mifavor/widget/w;->e:Landroid/view/View;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/zte/mifavor/widget/w;->b:Lcom/zte/mifavor/widget/ListViewZTE;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/zte/mifavor/widget/w;->c:Landroid/widget/AdapterView$OnItemClickListener;

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public b(Landroid/view/View;Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, LR3/f;->j:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->update()V

    .line 27
    .line 28
    .line 29
    new-instance v0, Landroid/graphics/Point;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/ViewRootImpl;->getLastTouchPoint(Landroid/graphics/Point;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget v1, LR3/e;->i0:I

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object v1, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget v2, LR3/e;->j0:I

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iget-object v2, p0, Lcom/zte/mifavor/widget/w;->d:Landroid/content/Context;

    .line 68
    .line 69
    const-string v3, "window"

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Landroid/view/WindowManager;

    .line 76
    .line 77
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3}, Landroid/view/Display;->getHeight()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Landroid/view/Display;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-nez v4, :cond_3

    .line 98
    .line 99
    iget v4, v0, Landroid/graphics/Point;->y:I

    .line 100
    .line 101
    div-int/lit8 v3, v3, 0x2

    .line 102
    .line 103
    if-le v4, v3, :cond_1

    .line 104
    .line 105
    iget-object v3, p0, Lcom/zte/mifavor/widget/w;->a:[Ljava/lang/CharSequence;

    .line 106
    .line 107
    array-length v3, v3

    .line 108
    mul-int/2addr p1, v3

    .line 109
    sub-int/2addr v4, p1

    .line 110
    iput v4, v0, Landroid/graphics/Point;->y:I

    .line 111
    .line 112
    :cond_1
    iget p1, v0, Landroid/graphics/Point;->x:I

    .line 113
    .line 114
    div-int/lit8 v2, v2, 0x2

    .line 115
    .line 116
    if-le p1, v2, :cond_2

    .line 117
    .line 118
    sub-int/2addr p1, v1

    .line 119
    iput p1, v0, Landroid/graphics/Point;->x:I

    .line 120
    .line 121
    :cond_2
    iget p1, v0, Landroid/graphics/Point;->x:I

    .line 122
    .line 123
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 124
    .line 125
    const/4 v1, 0x0

    .line 126
    invoke-virtual {p0, p2, v1, p1, v0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 127
    .line 128
    .line 129
    :cond_3
    return-void
.end method
