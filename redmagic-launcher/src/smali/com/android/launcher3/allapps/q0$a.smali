.class public Lcom/android/launcher3/allapps/q0$a;
.super Lcom/android/launcher3/allapps/q0;
.source "SectionDecorationHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/q0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final u:I

.field private final v:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/allapps/q0;II)V
    .locals 7

    .line 1
    iget-object v1, p1, Lcom/android/launcher3/allapps/q0;->l:Landroid/content/Context;

    .line 2
    .line 3
    iget v2, p1, Lcom/android/launcher3/allapps/q0;->n:I

    .line 4
    .line 5
    iget-boolean v3, p1, Lcom/android/launcher3/allapps/q0;->o:Z

    .line 6
    .line 7
    iget-boolean v4, p1, Lcom/android/launcher3/allapps/q0;->p:Z

    .line 8
    .line 9
    iget-boolean v5, p1, Lcom/android/launcher3/allapps/q0;->q:Z

    .line 10
    .line 11
    iget-boolean v6, p1, Lcom/android/launcher3/allapps/q0;->r:Z

    .line 12
    .line 13
    move-object v0, p0

    .line 14
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/allapps/q0;-><init>(Landroid/content/Context;IZZZZ)V

    .line 15
    .line 16
    .line 17
    iput p2, v0, Lcom/android/launcher3/allapps/q0$a;->u:I

    .line 18
    .line 19
    iput p3, v0, Lcom/android/launcher3/allapps/q0$a;->v:I

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public e(Lcom/android/launcher3/allapps/q0;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p2}, Landroid/view/View;->getScaleY()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    mul-float/2addr v0, v1

    .line 11
    float-to-int v0, v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/allapps/q0;->e:Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    int-to-float v2, v2

    .line 19
    invoke-virtual {p2}, Landroid/view/View;->getY()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    int-to-float v4, v4

    .line 28
    invoke-virtual {p2}, Landroid/view/View;->getY()F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    int-to-float v0, v0

    .line 33
    add-float/2addr p2, v0

    .line 34
    invoke-virtual {v1, v2, v3, v4, p2}, Landroid/graphics/RectF;->union(FFFF)V

    .line 35
    .line 36
    .line 37
    iget-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->s:Z

    .line 38
    .line 39
    iget-boolean v0, p1, Lcom/android/launcher3/allapps/q0;->s:Z

    .line 40
    .line 41
    or-int/2addr p2, v0

    .line 42
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->s:Z

    .line 43
    .line 44
    iget-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->q:Z

    .line 45
    .line 46
    iget-boolean v0, p1, Lcom/android/launcher3/allapps/q0;->q:Z

    .line 47
    .line 48
    or-int/2addr p2, v0

    .line 49
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->q:Z

    .line 50
    .line 51
    iget-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->r:Z

    .line 52
    .line 53
    iget-boolean v0, p1, Lcom/android/launcher3/allapps/q0;->r:Z

    .line 54
    .line 55
    or-int/2addr p2, v0

    .line 56
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->r:Z

    .line 57
    .line 58
    iget-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->t:Z

    .line 59
    .line 60
    iget-boolean v0, p1, Lcom/android/launcher3/allapps/q0;->t:Z

    .line 61
    .line 62
    or-int/2addr p2, v0

    .line 63
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->t:Z

    .line 64
    .line 65
    iget-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->o:Z

    .line 66
    .line 67
    iget-boolean v0, p1, Lcom/android/launcher3/allapps/q0;->o:Z

    .line 68
    .line 69
    or-int/2addr p2, v0

    .line 70
    iput-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->o:Z

    .line 71
    .line 72
    iget-boolean p2, p0, Lcom/android/launcher3/allapps/q0;->p:Z

    .line 73
    .line 74
    iget-boolean p1, p1, Lcom/android/launcher3/allapps/q0;->p:Z

    .line 75
    .line 76
    or-int/2addr p1, p2

    .line 77
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/q0;->p:Z

    .line 78
    .line 79
    return-void
.end method

.method public f(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/q0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->e:Landroid/graphics/RectF;

    .line 5
    .line 6
    iget v1, p0, Lcom/android/launcher3/allapps/q0$a;->u:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Lcom/android/launcher3/allapps/q0$a;->v:I

    .line 16
    .line 17
    sub-int/2addr v1, v2

    .line 18
    int-to-float v1, v1

    .line 19
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->f:Landroid/graphics/Paint;

    .line 22
    .line 23
    iget v1, p0, Lcom/android/launcher3/allapps/q0;->h:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/allapps/q0;->f:Landroid/graphics/Paint;

    .line 29
    .line 30
    iget v1, p0, Lcom/android/launcher3/allapps/q0;->n:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/q0;->b(Landroid/graphics/Canvas;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
