.class public Lcom/android/launcher3/folder/A0;
.super Ljava/lang/Object;
.source "PreviewItemManager.java"


# static fields
.field private static final n:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/folder/A0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Lcom/android/launcher3/folder/FolderIcon;

.field public c:I

.field private d:F

.field private e:I

.field private f:I

.field private g:Landroid/graphics/drawable/Drawable;

.field private h:I

.field private i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/folder/y0;",
            ">;"
        }
    .end annotation
.end field

.field private j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/folder/y0;",
            ">;"
        }
    .end annotation
.end field

.field private final k:F

.field private l:F

.field private m:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/A0$a;

    .line 2
    .line 3
    const-string v1, "currentPageItemsTransX"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/folder/A0$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/folder/A0;->n:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/android/launcher3/folder/A0;->d:F

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/android/launcher3/folder/A0;->e:I

    .line 10
    .line 11
    iput v0, p0, Lcom/android/launcher3/folder/A0;->f:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/folder/A0;->g:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/android/launcher3/folder/A0;->h:I

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/launcher3/folder/A0;->j:Ljava/util/ArrayList;

    .line 32
    .line 33
    const/high16 v0, 0x43480000    # 200.0f

    .line 34
    .line 35
    iput v0, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/android/launcher3/folder/A0;->a:Landroid/content/Context;

    .line 42
    .line 43
    iput-object p1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 50
    .line 51
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget p1, p1, Lcom/android/launcher3/h0;->X1:I

    .line 56
    .line 57
    iput p1, p0, Lcom/android/launcher3/folder/A0;->c:I

    .line 58
    .line 59
    const/high16 p1, 0x3f800000    # 1.0f

    .line 60
    .line 61
    invoke-static {p1}, Lcom/android/launcher3/N5;->i(F)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    int-to-float p1, p1

    .line 66
    iput p1, p0, Lcom/android/launcher3/folder/A0;->k:F

    .line 67
    .line 68
    return-void
.end method

.method private C(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;III)V
    .locals 9

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/A0;->x(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/folder/e0;

    .line 5
    .line 6
    const/16 v7, 0x190

    .line 7
    .line 8
    const/4 v8, 0x0

    .line 9
    move v6, p5

    .line 10
    move-object v1, p0

    .line 11
    move-object v2, p1

    .line 12
    move v3, p3

    .line 13
    move v5, p4

    .line 14
    move v4, p5

    .line 15
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/folder/e0;-><init>(Lcom/android/launcher3/folder/A0;Lcom/android/launcher3/folder/y0;IIIIILjava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, v2, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/e0;->e(Lcom/android/launcher3/folder/e0;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    iget-object p0, v2, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/folder/e0;->d()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iput-object v0, v2, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/folder/A0;Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/A0;->r(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/launcher3/folder/A0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/folder/A0;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/folder/A0;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/folder/A0;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 2
    .line 3
    return-void
.end method

.method private h(II)V
    .locals 6

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/A0;->d:F

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    cmpl-float v0, v0, p1

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/folder/A0;->e:I

    .line 9
    .line 10
    if-ne v0, p2, :cond_1

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/folder/A0;->f:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    :goto_0
    iput p1, p0, Lcom/android/launcher3/folder/A0;->d:F

    .line 25
    .line 26
    iput p2, p0, Lcom/android/launcher3/folder/A0;->e:I

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/android/launcher3/folder/A0;->f:I

    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 37
    .line 38
    iget-object v0, p1, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v3, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 45
    .line 46
    iget-object v2, v3, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 47
    .line 48
    iget v4, p0, Lcom/android/launcher3/folder/A0;->e:I

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/folder/u0;->Z0(Landroid/content/Context;Lcom/android/launcher3/views/k;Landroid/view/View;II)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lf1/a;->D:Lf1/a$a;

    .line 58
    .line 59
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget p2, p0, Lcom/android/launcher3/folder/A0;->d:F

    .line 72
    .line 73
    float-to-int p2, p2

    .line 74
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/folder/i0;->d(IZ)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 89
    .line 90
    iget-object p2, p1, Lcom/android/launcher3/folder/FolderIcon;->p:Lcom/android/launcher3/folder/a;

    .line 91
    .line 92
    iget-object v0, p1, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 93
    .line 94
    iget v0, v0, Lcom/android/launcher3/folder/u0;->q:I

    .line 95
    .line 96
    iget v1, p0, Lcom/android/launcher3/folder/A0;->d:F

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-virtual {p2, v0, v1, p1}, Lcom/android/launcher3/folder/a;->f(IFZ)V

    .line 107
    .line 108
    .line 109
    :goto_1
    const/4 p1, 0x0

    .line 110
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/A0;->B(Z)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method private m(Landroid/graphics/Canvas;Lcom/android/launcher3/folder/y0;Landroid/graphics/PointF;ZLandroid/graphics/Path;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, p5}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 7
    .line 8
    .line 9
    :cond_0
    iget p4, p3, Landroid/graphics/PointF;->x:F

    .line 10
    .line 11
    iget p5, p2, Lcom/android/launcher3/folder/y0;->b:F

    .line 12
    .line 13
    add-float/2addr p4, p5

    .line 14
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 15
    .line 16
    iget p5, p2, Lcom/android/launcher3/folder/y0;->c:F

    .line 17
    .line 18
    add-float/2addr p3, p5

    .line 19
    invoke-virtual {p1, p4, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 20
    .line 21
    .line 22
    iget p3, p2, Lcom/android/launcher3/folder/y0;->d:F

    .line 23
    .line 24
    invoke-virtual {p1, p3, p3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 25
    .line 26
    .line 27
    iget-object p3, p2, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    if-eqz p3, :cond_4

    .line 30
    .line 31
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 36
    .line 37
    .line 38
    iget p5, p4, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    neg-int p5, p5

    .line 41
    int-to-float p5, p5

    .line 42
    iget v0, p4, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    neg-int v0, v0

    .line 45
    int-to-float v0, v0

    .line 46
    invoke-virtual {p1, p5, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 47
    .line 48
    .line 49
    iget-object p5, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 50
    .line 51
    iget-object p5, p5, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 52
    .line 53
    invoke-static {p5}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 54
    .line 55
    .line 56
    move-result-object p5

    .line 57
    invoke-virtual {p5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 58
    .line 59
    .line 60
    move-result-object p5

    .line 61
    iget p5, p5, Lcom/android/launcher3/h0;->Q1:I

    .line 62
    .line 63
    int-to-float p5, p5

    .line 64
    invoke-static {}, Lx1/O;->C3()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getIconSize()I

    .line 75
    .line 76
    .line 77
    move-result p5

    .line 78
    int-to-float p5, p5

    .line 79
    :cond_1
    move v3, p5

    .line 80
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    .line 81
    .line 82
    .line 83
    move-result p5

    .line 84
    int-to-float p5, p5

    .line 85
    div-float p5, v3, p5

    .line 86
    .line 87
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    int-to-float p4, p4

    .line 92
    div-float p4, v3, p4

    .line 93
    .line 94
    invoke-virtual {p1, p5, p4}, Landroid/graphics/Canvas;->scale(FF)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p2, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 98
    .line 99
    iget-boolean p4, p2, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 100
    .line 101
    if-nez p4, :cond_3

    .line 102
    .line 103
    iget-boolean p2, p2, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 104
    .line 105
    if-eqz p2, :cond_2

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 109
    .line 110
    .line 111
    move-object v0, p1

    .line 112
    goto :goto_1

    .line 113
    :cond_3
    :goto_0
    new-instance v5, Landroid/graphics/Paint;

    .line 114
    .line 115
    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 116
    .line 117
    .line 118
    const/4 v1, 0x0

    .line 119
    const/4 v2, 0x0

    .line 120
    move v4, v3

    .line 121
    move-object v0, p1

    .line 122
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;)I

    .line 123
    .line 124
    .line 125
    invoke-virtual {p3, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    const p1, 0x7f060258

    .line 135
    .line 136
    .line 137
    invoke-static {p0, p1}, Lz/a;->c(Landroid/content/Context;I)I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    sget-object p1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 142
    .line 143
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 147
    .line 148
    .line 149
    :goto_1
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_4
    move-object v0, p1

    .line 154
    :goto_2
    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method private n(Lcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->h:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Lcom/android/launcher3/h0;->B1:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/folder/A0;->g:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    div-float v1, v0, v1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 24
    .line 25
    iget p0, p0, Lcom/android/launcher3/folder/u0;->q:I

    .line 26
    .line 27
    int-to-float p0, p0

    .line 28
    sub-float/2addr p0, v0

    .line 29
    const/high16 v0, 0x40000000    # 2.0f

    .line 30
    .line 31
    div-float/2addr p0, v0

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    const-string p1, "PreviewItemManager"

    .line 35
    .line 36
    const-string v0, "getFinalIconParams--params == null"

    .line 37
    .line 38
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    new-instance p1, Lcom/android/launcher3/folder/y0;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-direct {p1, v0, v0, v0}, Lcom/android/launcher3/folder/y0;-><init>(FFF)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-virtual {p1, p0, p0, v1}, Lcom/android/launcher3/folder/y0;->a(FFF)V

    .line 48
    .line 49
    .line 50
    return-object p1
.end method

.method private q(Lcom/android/launcher3/model/data/I;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method private synthetic r(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    if-ne v0, p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/A0;->x(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method A(Ljava/util/function/Predicate;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v2, :cond_2

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/android/launcher3/folder/y0;

    .line 20
    .line 21
    iget-object v4, v2, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    invoke-interface {p1, v4}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-nez v4, :cond_1

    .line 28
    .line 29
    iget-object v4, v2, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 30
    .line 31
    instance-of v5, v4, Lcom/android/launcher3/model/data/l;

    .line 32
    .line 33
    if-eqz v5, :cond_0

    .line 34
    .line 35
    check-cast v4, Lcom/android/launcher3/model/data/l;

    .line 36
    .line 37
    invoke-virtual {v4, p1}, Lcom/android/launcher3/model/data/m;->w(Ljava/util/function/Predicate;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-eqz v4, :cond_0

    .line 42
    .line 43
    :cond_1
    iget-object v1, v2, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 44
    .line 45
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher3/folder/A0;->x(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;)V

    .line 46
    .line 47
    .line 48
    move v1, v3

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->j:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_5

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Lcom/android/launcher3/folder/y0;

    .line 67
    .line 68
    iget-object v4, v2, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 69
    .line 70
    invoke-interface {p1, v4}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-nez v4, :cond_4

    .line 75
    .line 76
    iget-object v4, v2, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 77
    .line 78
    instance-of v5, v4, Lcom/android/launcher3/model/data/l;

    .line 79
    .line 80
    if-eqz v5, :cond_3

    .line 81
    .line 82
    check-cast v4, Lcom/android/launcher3/model/data/l;

    .line 83
    .line 84
    invoke-virtual {v4, p1}, Lcom/android/launcher3/model/data/m;->w(Ljava/util/function/Predicate;)Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_3

    .line 89
    .line 90
    :cond_4
    iget-object v1, v2, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 91
    .line 92
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher3/folder/A0;->x(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;)V

    .line 93
    .line 94
    .line 95
    move v1, v3

    .line 96
    goto :goto_1

    .line 97
    :cond_5
    if-eqz v1, :cond_6

    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 102
    .line 103
    .line 104
    :cond_6
    return-void
.end method

.method B(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    iget-object v2, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p0, v1, v2, p1}, Lcom/android/launcher3/folder/A0;->g(ILjava/util/ArrayList;Z)V

    .line 11
    .line 12
    .line 13
    iput v0, p0, Lcom/android/launcher3/folder/A0;->h:I

    .line 14
    .line 15
    return-void
.end method

.method D(Landroid/graphics/drawable/Drawable;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/android/launcher3/folder/y0;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    if-ne v2, p1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return v0
.end method

.method f(ZZI)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget v3, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 7
    .line 8
    cmpl-float v3, v3, v2

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    goto :goto_3

    .line 13
    :cond_0
    const/high16 v3, 0x43480000    # 200.0f

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget v4, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 18
    .line 19
    cmpl-float v4, v4, v3

    .line 20
    .line 21
    if-nez v4, :cond_1

    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_1
    if-eqz p3, :cond_2

    .line 25
    .line 26
    move v4, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_2
    move v4, v1

    .line 29
    :goto_0
    iput-boolean v4, p0, Lcom/android/launcher3/folder/A0;->m:Z

    .line 30
    .line 31
    if-eqz v4, :cond_5

    .line 32
    .line 33
    const/16 v4, 0xc8

    .line 34
    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iput v3, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 38
    .line 39
    move p1, v1

    .line 40
    goto :goto_1

    .line 41
    :cond_3
    iput v2, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 42
    .line 43
    move p1, v4

    .line 44
    move v4, v1

    .line 45
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/folder/A0;->j:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p0, p3, v2, v1}, Lcom/android/launcher3/folder/A0;->g(ILjava/util/ArrayList;Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/folder/A0;->u()V

    .line 51
    .line 52
    .line 53
    sget-object p3, Lcom/android/launcher3/folder/A0;->n:Landroid/util/FloatProperty;

    .line 54
    .line 55
    int-to-float v2, v4

    .line 56
    int-to-float p1, p1

    .line 57
    const/4 v3, 0x2

    .line 58
    new-array v3, v3, [F

    .line 59
    .line 60
    aput v2, v3, v1

    .line 61
    .line 62
    aput p1, v3, v0

    .line 63
    .line 64
    invoke-static {p0, p3, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance p3, Lcom/android/launcher3/folder/A0$c;

    .line 69
    .line 70
    invoke-direct {p3, p0}, Lcom/android/launcher3/folder/A0$c;-><init>(Lcom/android/launcher3/folder/A0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    if-eqz p2, :cond_4

    .line 77
    .line 78
    const-wide/16 p2, 0x12c

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_4
    const-wide/16 p2, 0x0

    .line 82
    .line 83
    :goto_2
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 84
    .line 85
    .line 86
    const p0, 0x3e6b851f    # 0.23f

    .line 87
    .line 88
    .line 89
    const/high16 p2, 0x3f800000    # 1.0f

    .line 90
    .line 91
    const p3, 0x3f028f5c    # 0.51f

    .line 92
    .line 93
    .line 94
    const v0, 0x3dcccccd    # 0.1f

    .line 95
    .line 96
    .line 97
    invoke-static {p3, v0, p0, p2}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 105
    .line 106
    .line 107
    :cond_5
    :goto_3
    return-void
.end method

.method g(ILjava/util/ArrayList;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/folder/y0;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/FolderIcon;->E(I)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/lit8 v1, v1, -0x1

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-le v1, v2, :cond_1

    .line 36
    .line 37
    new-instance v1, Lcom/android/launcher3/folder/y0;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-direct {v1, v2, v2, v2}, Lcom/android/launcher3/folder/y0;-><init>(FFF)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    if-nez p1, :cond_2

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    :goto_2
    move v7, p1

    .line 54
    goto :goto_3

    .line 55
    :cond_2
    sget p1, Lcom/android/launcher3/folder/i0;->k:I

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :goto_3
    const/4 p1, 0x0

    .line 59
    move v4, p1

    .line 60
    :goto_4
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-ge v4, p1, :cond_8

    .line 65
    .line 66
    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    move-object v3, p1

    .line 71
    check-cast v3, Lcom/android/launcher3/folder/y0;

    .line 72
    .line 73
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 78
    .line 79
    invoke-virtual {p0, v3, p1}, Lcom/android/launcher3/folder/A0;->x(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;)V

    .line 80
    .line 81
    .line 82
    if-nez p3, :cond_5

    .line 83
    .line 84
    iget-object p1, v3, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 85
    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/android/launcher3/folder/e0;->d()V

    .line 89
    .line 90
    .line 91
    :cond_3
    invoke-virtual {p0, v4, v7, v3}, Lcom/android/launcher3/folder/A0;->i(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/android/launcher3/folder/A0;->g:Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    if-nez p1, :cond_4

    .line 97
    .line 98
    iget-object p1, v3, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 99
    .line 100
    iput-object p1, p0, Lcom/android/launcher3/folder/A0;->g:Landroid/graphics/drawable/Drawable;

    .line 101
    .line 102
    :cond_4
    move-object v2, p0

    .line 103
    goto :goto_5

    .line 104
    :cond_5
    new-instance v1, Lcom/android/launcher3/folder/e0;

    .line 105
    .line 106
    iget v5, p0, Lcom/android/launcher3/folder/A0;->h:I

    .line 107
    .line 108
    const/16 v8, 0x190

    .line 109
    .line 110
    const/4 v9, 0x0

    .line 111
    move v6, v4

    .line 112
    move-object v2, p0

    .line 113
    invoke-direct/range {v1 .. v9}, Lcom/android/launcher3/folder/e0;-><init>(Lcom/android/launcher3/folder/A0;Lcom/android/launcher3/folder/y0;IIIIILjava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, v3, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 117
    .line 118
    if-eqz p0, :cond_7

    .line 119
    .line 120
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/e0;->e(Lcom/android/launcher3/folder/e0;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_6

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :cond_6
    iget-object p0, v3, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/android/launcher3/folder/e0;->d()V

    .line 130
    .line 131
    .line 132
    :cond_7
    iput-object v1, v3, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/android/launcher3/folder/e0;->g()V

    .line 135
    .line 136
    .line 137
    :goto_5
    add-int/lit8 v4, v4, 0x1

    .line 138
    .line 139
    move-object p0, v2

    .line 140
    goto :goto_4

    .line 141
    :cond_8
    return-void
.end method

.method i(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    invoke-direct {p0, p3}, Lcom/android/launcher3/folder/A0;->n(Lcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sget-object v0, Lf1/a;->D:Lf1/a$a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 36
    .line 37
    invoke-virtual {p2, p1, p3, v0, p0}, Lcom/android/launcher3/folder/i0;->a(ILcom/android/launcher3/folder/y0;Lcom/android/launcher3/h0;Lcom/android/launcher3/folder/FolderIcon;)Lcom/android/launcher3/folder/y0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRule()Lcom/android/launcher3/folder/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/folder/a;->a(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public j(ZLjava/lang/Runnable;)Lcom/android/launcher3/folder/e0;
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    new-instance v1, Lcom/android/launcher3/folder/e0;

    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    move-object v3, p1

    .line 13
    check-cast v3, Lcom/android/launcher3/folder/y0;

    .line 14
    .line 15
    const/4 v7, -0x1

    .line 16
    const/16 v8, 0xc8

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x2

    .line 20
    const/4 v6, -0x1

    .line 21
    move-object v2, p0

    .line 22
    move-object v9, p2

    .line 23
    invoke-direct/range {v1 .. v9}, Lcom/android/launcher3/folder/e0;-><init>(Lcom/android/launcher3/folder/A0;Lcom/android/launcher3/folder/y0;IIIIILjava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_0
    move-object v2, p0

    .line 28
    move-object v9, p2

    .line 29
    new-instance p0, Lcom/android/launcher3/folder/e0;

    .line 30
    .line 31
    iget-object p1, v2, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    move-object v4, p1

    .line 38
    check-cast v4, Lcom/android/launcher3/folder/y0;

    .line 39
    .line 40
    const/4 v8, 0x2

    .line 41
    move-object v10, v9

    .line 42
    const/16 v9, 0x15e

    .line 43
    .line 44
    const/4 v5, -0x1

    .line 45
    const/4 v6, -0x1

    .line 46
    const/4 v7, 0x0

    .line 47
    move-object v3, v2

    .line 48
    move-object v2, p0

    .line 49
    invoke-direct/range {v2 .. v10}, Lcom/android/launcher3/folder/e0;-><init>(Lcom/android/launcher3/folder/A0;Lcom/android/launcher3/folder/y0;IIIIILjava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    return-object v2
.end method

.method public k(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getSaveCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderIcon;->getFolderBackground()Lcom/android/launcher3/folder/u0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/folder/u0;->C0()Landroid/graphics/Path;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    sget-object v2, Lf1/a;->D:Lf1/a$a;

    .line 16
    .line 17
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/A0;->z(Lcom/android/launcher3/folder/u0;)Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v7}, Landroid/graphics/Path;->reset()V

    .line 36
    .line 37
    .line 38
    new-instance v3, Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 44
    .line 45
    invoke-virtual {v7, v3, v2}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-boolean v2, p0, Lcom/android/launcher3/folder/A0;->m:Z

    .line 49
    .line 50
    const/4 v8, 0x0

    .line 51
    const/4 v9, 0x1

    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    new-instance v5, Landroid/graphics/PointF;

    .line 55
    .line 56
    iget v2, v1, Lcom/android/launcher3/folder/u0;->r:I

    .line 57
    .line 58
    int-to-float v2, v2

    .line 59
    iget v3, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 60
    .line 61
    add-float/2addr v2, v3

    .line 62
    iget v3, v1, Lcom/android/launcher3/folder/u0;->s:I

    .line 63
    .line 64
    int-to-float v3, v3

    .line 65
    invoke-direct {v5, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 66
    .line 67
    .line 68
    iget v2, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 69
    .line 70
    iget v3, p0, Lcom/android/launcher3/folder/A0;->k:F

    .line 71
    .line 72
    cmpl-float v2, v2, v3

    .line 73
    .line 74
    if-lez v2, :cond_1

    .line 75
    .line 76
    move v6, v9

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    move v6, v8

    .line 79
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/folder/A0;->j:Ljava/util/ArrayList;

    .line 80
    .line 81
    move-object v2, p0

    .line 82
    move-object v3, p1

    .line 83
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/folder/A0;->l(Landroid/graphics/Canvas;Ljava/util/ArrayList;Landroid/graphics/PointF;ZLandroid/graphics/Path;)V

    .line 84
    .line 85
    .line 86
    const/high16 p0, -0x3cb80000    # -200.0f

    .line 87
    .line 88
    iget p1, v2, Lcom/android/launcher3/folder/A0;->l:F

    .line 89
    .line 90
    add-float/2addr p1, p0

    .line 91
    goto :goto_1

    .line 92
    :cond_2
    move-object v2, p0

    .line 93
    move-object v3, p1

    .line 94
    const/4 p1, 0x0

    .line 95
    :goto_1
    new-instance v5, Landroid/graphics/PointF;

    .line 96
    .line 97
    iget p0, v1, Lcom/android/launcher3/folder/u0;->r:I

    .line 98
    .line 99
    int-to-float p0, p0

    .line 100
    add-float/2addr p0, p1

    .line 101
    iget v1, v1, Lcom/android/launcher3/folder/u0;->s:I

    .line 102
    .line 103
    int-to-float v1, v1

    .line 104
    invoke-direct {v5, p0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 105
    .line 106
    .line 107
    iget p0, v2, Lcom/android/launcher3/folder/A0;->k:F

    .line 108
    .line 109
    neg-float p0, p0

    .line 110
    cmpg-float p0, p1, p0

    .line 111
    .line 112
    if-gez p0, :cond_3

    .line 113
    .line 114
    move v6, v9

    .line 115
    goto :goto_2

    .line 116
    :cond_3
    move v6, v8

    .line 117
    :goto_2
    iget-object v4, v2, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/folder/A0;->l(Landroid/graphics/Canvas;Ljava/util/ArrayList;Landroid/graphics/PointF;ZLandroid/graphics/Path;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public l(Landroid/graphics/Canvas;Ljava/util/ArrayList;Landroid/graphics/PointF;ZLandroid/graphics/Path;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/folder/y0;",
            ">;",
            "Landroid/graphics/PointF;",
            "Z",
            "Landroid/graphics/Path;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    sub-int/2addr v0, v1

    .line 7
    :goto_0
    if-ltz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    move-object v5, v2

    .line 14
    check-cast v5, Lcom/android/launcher3/folder/y0;

    .line 15
    .line 16
    iget-boolean v2, v5, Lcom/android/launcher3/folder/y0;->f:Z

    .line 17
    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    iget v2, v5, Lcom/android/launcher3/folder/y0;->a:F

    .line 21
    .line 22
    const/high16 v3, -0x40000000    # -2.0f

    .line 23
    .line 24
    cmpl-float v2, v2, v3

    .line 25
    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    move v2, v1

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v2, 0x0

    .line 31
    :goto_1
    or-int v7, v2, p4

    .line 32
    .line 33
    move-object v3, p0

    .line 34
    move-object v4, p1

    .line 35
    move-object v6, p3

    .line 36
    move-object v8, p5

    .line 37
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/folder/A0;->m(Landroid/graphics/Canvas;Lcom/android/launcher3/folder/y0;Landroid/graphics/PointF;ZLandroid/graphics/Path;)V

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    move-object v3, p0

    .line 42
    move-object v4, p1

    .line 43
    move-object v6, p3

    .line 44
    move-object v8, p5

    .line 45
    :goto_2
    add-int/lit8 v0, v0, -0x1

    .line 46
    .line 47
    move-object p0, v3

    .line 48
    move-object p1, v4

    .line 49
    move-object p3, v6

    .line 50
    move-object p5, v8

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    return-void
.end method

.method public o()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/folder/y0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget v1, Lcom/android/launcher3/folder/i0;->k:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p1, v0

    .line 16
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ge p1, v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/android/launcher3/folder/y0;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    if-eqz p0, :cond_1

    .line 35
    .line 36
    iput-boolean p2, p0, Lcom/android/launcher3/folder/y0;->f:Z

    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public s(Ljava/util/List;Ljava/util/List;Lcom/android/launcher3/model/data/y;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Lcom/android/launcher3/model/data/y;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v5

    .line 5
    iget-object v6, p0, Lcom/android/launcher3/folder/A0;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    invoke-virtual {p0, v7, v6, v7}, Lcom/android/launcher3/folder/A0;->g(ILjava/util/ArrayList;Z)V

    .line 9
    .line 10
    .line 11
    new-instance v8, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 31
    .line 32
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    invoke-virtual {v1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_0

    .line 43
    .line 44
    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move p3, v7

    .line 49
    :goto_1
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-ge p3, v0, :cond_2

    .line 54
    .line 55
    invoke-interface {v8, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {p2, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/android/launcher3/folder/y0;

    .line 68
    .line 69
    invoke-virtual {p0, v0, v5, v1}, Lcom/android/launcher3/folder/A0;->i(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;

    .line 70
    .line 71
    .line 72
    invoke-interface {v8, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    move-object v2, v0

    .line 77
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 78
    .line 79
    invoke-interface {v8, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-interface {p2, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    const/4 v3, -0x3

    .line 88
    move-object v0, p0

    .line 89
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/A0;->C(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;III)V

    .line 90
    .line 91
    .line 92
    add-int/lit8 p3, p3, 0x1

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    move-object v0, p0

    .line 96
    move v4, v7

    .line 97
    :goto_2
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-ge v4, p0, :cond_4

    .line 102
    .line 103
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-interface {p1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-ltz v3, :cond_3

    .line 112
    .line 113
    if-eq v4, v3, :cond_3

    .line 114
    .line 115
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    move-object v1, p0

    .line 120
    check-cast v1, Lcom/android/launcher3/folder/y0;

    .line 121
    .line 122
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    move-object v2, p0

    .line 127
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 128
    .line 129
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/A0;->C(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;III)V

    .line 130
    .line 131
    .line 132
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_4
    new-instance p0, Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 138
    .line 139
    .line 140
    invoke-interface {p0, p2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 141
    .line 142
    .line 143
    move p2, v7

    .line 144
    :goto_3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    if-ge p2, p3, :cond_5

    .line 149
    .line 150
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    move-object v2, p3

    .line 155
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 156
    .line 157
    invoke-interface {p1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    const/4 p3, 0x0

    .line 162
    invoke-virtual {v0, v3, v5, p3}, Lcom/android/launcher3/folder/A0;->i(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    const/4 v4, -0x2

    .line 167
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/A0;->C(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;III)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v6, v7, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    add-int/lit8 p2, p2, 0x1

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_5
    :goto_4
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-ge v7, p0, :cond_7

    .line 181
    .line 182
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    check-cast p0, Lcom/android/launcher3/folder/y0;

    .line 187
    .line 188
    iget-object p0, p0, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 189
    .line 190
    if-eqz p0, :cond_6

    .line 191
    .line 192
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    check-cast p0, Lcom/android/launcher3/folder/y0;

    .line 197
    .line 198
    iget-object p0, p0, Lcom/android/launcher3/folder/y0;->e:Lcom/android/launcher3/folder/e0;

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/android/launcher3/folder/e0;->g()V

    .line 201
    .line 202
    .line 203
    :cond_6
    add-int/lit8 v7, v7, 0x1

    .line 204
    .line 205
    goto :goto_4

    .line 206
    :cond_7
    return-void
.end method

.method t(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move v1, v0

    .line 7
    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher3/folder/A0;->m:Z

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/android/launcher3/folder/A0;->l:F

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/A0;->j:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p0, p1, v1, v0}, Lcom/android/launcher3/folder/A0;->g(ILjava/util/ArrayList;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/folder/A0;->u()V

    .line 20
    .line 21
    .line 22
    sget-object p1, Lcom/android/launcher3/folder/A0;->n:Landroid/util/FloatProperty;

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    fill-array-data v0, :array_0

    .line 28
    .line 29
    .line 30
    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Lcom/android/launcher3/folder/A0$b;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/A0$b;-><init>(Lcom/android/launcher3/folder/A0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 v0, 0x64

    .line 43
    .line 44
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 45
    .line 46
    .line 47
    const-wide/16 v0, 0x12c

    .line 48
    .line 49
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x43480000    # 200.0f
    .end array-data
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method v(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/apppairs/AppPairIcon;->getIconDrawableArea()Lcom/android/launcher3/apppairs/AppPairIconGraphic;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->getDrawable()Lcom/android/launcher3/apppairs/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object v0, p1

    .line 18
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/folder/A0;->h(II)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/folder/A0;->g:Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    return-object v0
.end method

.method public w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->g:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/folder/A0;->h(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public x(Lcom/android/launcher3/folder/y0;Lcom/android/launcher3/model/data/y;)V
    .locals 5

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    move-object v0, p2

    .line 7
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/A0;->q(Lcom/android/launcher3/model/data/I;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/folder/A0;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {v2, v0}, Ln1/r;->B(Landroid/content/Context;Lcom/android/launcher3/model/data/z;)Ln1/r;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p1, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/folder/A0;->a:Landroid/content/Context;

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    invoke-virtual {v0, v2, v3}, Lcom/android/launcher3/model/data/z;->G(Landroid/content/Context;I)Ls1/o;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p1, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    :goto_0
    iget-object v0, p1, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    iget v2, p0, Lcom/android/launcher3/folder/A0;->c:I

    .line 36
    .line 37
    invoke-virtual {v0, v1, v1, v2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    instance-of v0, p2, Lcom/android/launcher3/model/data/l;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    move-object v0, p2

    .line 46
    check-cast v0, Lcom/android/launcher3/model/data/l;

    .line 47
    .line 48
    new-instance v2, LW0/b;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/android/launcher3/folder/A0;->a:Landroid/content/Context;

    .line 51
    .line 52
    const/4 v4, 0x2

    .line 53
    invoke-direct {v2, v3, v4}, LW0/b;-><init>(Landroid/content/Context;I)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v2}, Lcom/android/launcher3/apppairs/AppPairIconGraphic;->a(Lcom/android/launcher3/model/data/l;LW0/b;)Lcom/android/launcher3/apppairs/a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p1, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    iget v2, p0, Lcom/android/launcher3/folder/A0;->c:I

    .line 63
    .line 64
    invoke-virtual {v0, v1, v1, v2, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_1
    iput-object p2, p1, Lcom/android/launcher3/folder/y0;->h:Lcom/android/launcher3/model/data/y;

    .line 68
    .line 69
    iget-object v0, p1, Lcom/android/launcher3/folder/y0;->g:Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    iget-object v1, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 74
    .line 75
    .line 76
    instance-of v0, p2, Lcom/android/launcher3/model/data/z;

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    check-cast p2, Lcom/android/launcher3/model/data/z;

    .line 81
    .line 82
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget-object v1, Lcom/android/launcher3/S3;->b:Lt1/g;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lt1/g;->b(Lt1/g;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/launcher3/folder/A0;->a:Landroid/content/Context;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Lcom/android/launcher3/folder/z0;

    .line 105
    .line 106
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/folder/z0;-><init>(Lcom/android/launcher3/folder/A0;Lcom/android/launcher3/folder/y0;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1, p2}, Ls1/P;->W0(Ls1/P$a;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/util/w;

    .line 110
    .line 111
    .line 112
    :cond_3
    return-void
.end method

.method public y(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/A0;->c:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/android/launcher3/folder/A0;->c:I

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public z(Lcom/android/launcher3/folder/u0;)Landroid/graphics/Rect;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/folder/u0;->H0()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/folder/A0;->b:Lcom/android/launcher3/folder/FolderIcon;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRuleMFV()Lcom/android/launcher3/folder/i0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Lcom/android/launcher3/folder/i0;->d:I

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-le v0, p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sub-int/2addr v0, p0

    .line 25
    div-int/lit8 v0, v0, 0x2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v0, v1

    .line 29
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-le v2, p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    sub-int/2addr v1, p0

    .line 40
    div-int/lit8 v1, v1, 0x2

    .line 41
    .line 42
    :cond_1
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Rect;->inset(II)V

    .line 43
    .line 44
    .line 45
    return-object p1
.end method
