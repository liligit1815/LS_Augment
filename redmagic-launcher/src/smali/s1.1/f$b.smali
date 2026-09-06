.class Ls1/f$b;
.super Ls1/f$a;
.source "BubbleIconFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final h:Landroid/graphics/Rect;

.field final i:Landroid/graphics/drawable/Drawable;

.field final synthetic j:Ls1/f;


# direct methods
.method constructor <init>(Ls1/f;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ls1/f$b;->j:Ls1/f;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1, p1}, Ls1/f$a;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ls1/f$b;->h:Landroid/graphics/Rect;

    .line 13
    .line 14
    iput-object p2, p0, Ls1/f$b;->i:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ls1/f$a;->getIconMask()Landroid/graphics/Path;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ls1/f$b;->j:Ls1/f;

    .line 13
    .line 14
    invoke-static {v1}, Ls1/f;->m0(Ls1/f;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ls1/f$b;->h:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBounds()Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ls1/f$b;->h:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget-object v2, p0, Ls1/f$b;->j:Ls1/f;

    .line 33
    .line 34
    invoke-static {v2}, Ls1/f;->n0(Ls1/f;)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget-object v3, p0, Ls1/f$b;->j:Ls1/f;

    .line 39
    .line 40
    invoke-static {v3}, Ls1/f;->n0(Ls1/f;)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Rect;->inset(II)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ls1/f$b;->h:Landroid/graphics/Rect;

    .line 48
    .line 49
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 50
    .line 51
    int-to-float v2, v2

    .line 52
    iget v1, v1, Landroid/graphics/Rect;->top:I

    .line 53
    .line 54
    int-to-float v1, v1

    .line 55
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ls1/f$b;->i:Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    iget-object v2, p0, Ls1/f$b;->h:Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    iget-object v3, p0, Ls1/f$b;->h:Landroid/graphics/Rect;

    .line 67
    .line 68
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    const/4 v4, 0x0

    .line 73
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ls1/f$b;->i:Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
