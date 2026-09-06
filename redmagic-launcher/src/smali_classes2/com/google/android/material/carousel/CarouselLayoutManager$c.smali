.class Lcom/google/android/material/carousel/CarouselLayoutManager$c;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "CarouselLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/carousel/CarouselLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# instance fields
.field private final g:Landroid/graphics/Paint;

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->g:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->h:Ljava/util/List;

    .line 21
    .line 22
    const/high16 p0, 0x40a00000    # 5.0f

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 25
    .line 26
    .line 27
    const p0, -0xff01

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method a(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/material/carousel/f$c;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->h:Ljava/util/List;

    .line 6
    .line 7
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p3}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;->onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->g:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual/range {p2 .. p2}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sget v3, LX2/d;->t:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 19
    .line 20
    .line 21
    iget-object v1, v0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->h:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/google/android/material/carousel/f$c;

    .line 38
    .line 39
    iget-object v3, v0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->g:Landroid/graphics/Paint;

    .line 40
    .line 41
    iget v4, v2, Lcom/google/android/material/carousel/f$c;->c:F

    .line 42
    .line 43
    const v5, -0xff01

    .line 44
    .line 45
    .line 46
    const v6, -0xffff01

    .line 47
    .line 48
    .line 49
    invoke-static {v5, v6, v4}, LB/a;->e(IIF)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 61
    .line 62
    invoke-virtual {v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->e()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    iget v5, v2, Lcom/google/android/material/carousel/f$c;->b:F

    .line 69
    .line 70
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 75
    .line 76
    invoke-static {v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->i(Lcom/google/android/material/carousel/CarouselLayoutManager;)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    int-to-float v6, v3

    .line 81
    iget v7, v2, Lcom/google/android/material/carousel/f$c;->b:F

    .line 82
    .line 83
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 88
    .line 89
    invoke-static {v2}, Lcom/google/android/material/carousel/CarouselLayoutManager;->j(Lcom/google/android/material/carousel/CarouselLayoutManager;)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    int-to-float v8, v2

    .line 94
    iget-object v9, v0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->g:Landroid/graphics/Paint;

    .line 95
    .line 96
    move-object/from16 v4, p1

    .line 97
    .line 98
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 107
    .line 108
    invoke-static {v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->k(Lcom/google/android/material/carousel/CarouselLayoutManager;)I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    int-to-float v11, v3

    .line 113
    iget v12, v2, Lcom/google/android/material/carousel/f$c;->b:F

    .line 114
    .line 115
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/google/android/material/carousel/CarouselLayoutManager;

    .line 120
    .line 121
    invoke-static {v3}, Lcom/google/android/material/carousel/CarouselLayoutManager;->l(Lcom/google/android/material/carousel/CarouselLayoutManager;)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    int-to-float v13, v3

    .line 126
    iget v14, v2, Lcom/google/android/material/carousel/f$c;->b:F

    .line 127
    .line 128
    iget-object v15, v0, Lcom/google/android/material/carousel/CarouselLayoutManager$c;->g:Landroid/graphics/Paint;

    .line 129
    .line 130
    move-object/from16 v10, p1

    .line 131
    .line 132
    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_1
    return-void
.end method
