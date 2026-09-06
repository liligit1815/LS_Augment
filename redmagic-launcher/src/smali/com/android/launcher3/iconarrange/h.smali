.class public Lcom/android/launcher3/iconarrange/h;
.super Ljava/lang/Object;
.source "IconDragonAnim.java"


# instance fields
.field private a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation
.end field

.field private b:I

.field private c:I

.field private d:Lcom/android/launcher3/iconarrange/g;

.field private e:F


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/launcher3/iconarrange/h;->e:F

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/h;->a:Ljava/util/ArrayList;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    const-string p0, "IconDragonAnim"

    .line 21
    .line 22
    const-string p1, "dragingViews error"

    .line 23
    .line 24
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private d(IILcom/android/launcher3/dragndrop/v;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/h;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    const-string v1, "IconDragonAnim"

    .line 4
    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    if-eqz p3, :cond_5

    .line 16
    .line 17
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/v;->getIconConvergeAnim()Lcom/android/launcher3/iconarrange/g;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/v;->getInitialScale()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/android/launcher3/iconarrange/h;->e:F

    .line 29
    .line 30
    invoke-virtual {p3}, Lcom/android/launcher3/dragndrop/v;->getIconConvergeAnim()Lcom/android/launcher3/iconarrange/g;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/h;->d:Lcom/android/launcher3/iconarrange/g;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/h;->a:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    mul-int/lit8 v0, v0, 0x14

    .line 43
    .line 44
    add-int/lit8 v0, v0, -0x14

    .line 45
    .line 46
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/h;->a:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    move v9, v0

    .line 53
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 64
    .line 65
    new-instance v8, Landroid/graphics/Rect;

    .line 66
    .line 67
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    if-nez v3, :cond_2

    .line 75
    .line 76
    const-string v0, "structureDragonDrawable getIcon is null, skip!"

    .line 77
    .line 78
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {v0, v8}, Lcom/android/launcher3/BubbleTextView;->d0(Landroid/graphics/Rect;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getDragonDrawable()Lcom/android/launcher3/iconarrange/a;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    if-nez v4, :cond_3

    .line 90
    .line 91
    new-instance v4, Lcom/android/launcher3/iconarrange/a;

    .line 92
    .line 93
    iget v5, p0, Lcom/android/launcher3/iconarrange/h;->e:F

    .line 94
    .line 95
    invoke-direct {v4, v3, p3, v5}, Lcom/android/launcher3/iconarrange/a;-><init>(Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/dragndrop/v;F)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v4}, Lcom/android/launcher3/BubbleTextView;->setDragonDrawable(Lcom/android/launcher3/iconarrange/a;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    move-object v3, v4

    .line 102
    iget v6, p0, Lcom/android/launcher3/iconarrange/h;->b:I

    .line 103
    .line 104
    iget v7, p0, Lcom/android/launcher3/iconarrange/h;->c:I

    .line 105
    .line 106
    move v4, p1

    .line 107
    move v5, p2

    .line 108
    invoke-virtual/range {v3 .. v9}, Lcom/android/launcher3/iconarrange/a;->i(IIIILandroid/graphics/Rect;I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3}, Lcom/android/launcher3/iconarrange/a;->l()V

    .line 112
    .line 113
    .line 114
    add-int/lit8 v9, v9, -0x14

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_4
    return-void

    .line 118
    :cond_5
    :goto_1
    const-string p0, "structureDragonDrawable dragView error!"

    .line 119
    .line 120
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_6
    :goto_2
    const-string p0, "structureDragonDrawable mDragingViews error!"

    .line 125
    .line 126
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/h;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/h;->d:Lcom/android/launcher3/iconarrange/g;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/g;->e()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_3

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/h;->a:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getDragonDrawable()Lcom/android/launcher3/iconarrange/a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Lcom/android/launcher3/iconarrange/a;->draw(Landroid/graphics/Canvas;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const-string v0, "IconDragonAnim"

    .line 52
    .line 53
    const-string v1, "getDragonDrawable error!"

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    :goto_1
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/iconarrange/h;->b:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/iconarrange/h;->c:I

    .line 4
    .line 5
    return-void
.end method

.method public c(Lcom/android/launcher3/dragndrop/v;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p1}, Lcom/android/launcher3/iconarrange/h;->d(IILcom/android/launcher3/dragndrop/v;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/android/launcher3/iconarrange/h;->b:I

    .line 5
    .line 6
    iput p3, p0, Lcom/android/launcher3/iconarrange/h;->c:I

    .line 7
    .line 8
    return-void
.end method
