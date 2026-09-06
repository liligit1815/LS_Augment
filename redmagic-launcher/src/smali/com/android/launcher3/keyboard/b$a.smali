.class public Lcom/android/launcher3/keyboard/b$a;
.super Lcom/android/launcher3/keyboard/b;
.source "ViewGroupFocusHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/keyboard/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private C:I

.field private D:I

.field private E:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/keyboard/b;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x7f070b14

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    float-to-int v0, v0

    .line 16
    iput v0, p0, Lcom/android/launcher3/keyboard/b$a;->C:I

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const v1, 0x7f0c00f7

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/android/launcher3/keyboard/b$a;->D:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const v0, 0x7f0c00f6

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/android/launcher3/keyboard/b$a;->E:I

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method protected bridge synthetic l(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-super {p0, p1}, Lcom/android/launcher3/keyboard/b;->n(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic m(Ljava/lang/Object;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/keyboard/b$a;->q(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/keyboard/b;->q(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget p1, p2, Landroid/graphics/Rect;->left:I

    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/keyboard/b$a;->C:I

    .line 7
    .line 8
    sub-int/2addr p1, p0

    .line 9
    iput p1, p2, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    iget p1, p2, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    sub-int/2addr p1, p0

    .line 14
    iput p1, p2, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    iget p1, p2, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    add-int/2addr p1, p0

    .line 19
    iput p1, p2, Landroid/graphics/Rect;->right:I

    .line 20
    .line 21
    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    add-int/2addr p1, p0

    .line 24
    iput p1, p2, Landroid/graphics/Rect;->bottom:I

    .line 25
    .line 26
    return-void
.end method

.method public r(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/keyboard/a;->h:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/high16 v1, -0x1000000

    .line 4
    .line 5
    or-int/2addr v1, p1

    .line 6
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 7
    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iget p1, p0, Lcom/android/launcher3/keyboard/b$a;->D:I

    .line 13
    .line 14
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->j:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget p1, p0, Lcom/android/launcher3/keyboard/b$a;->E:I

    .line 18
    .line 19
    iput p1, p0, Lcom/android/launcher3/keyboard/a;->j:I

    .line 20
    .line 21
    :goto_0
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/keyboard/a;->j(F)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/keyboard/a;->u:Z

    .line 2
    .line 3
    return-void
.end method
