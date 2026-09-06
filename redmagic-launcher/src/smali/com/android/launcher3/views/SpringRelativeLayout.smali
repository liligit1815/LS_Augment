.class public Lcom/android/launcher3/views/SpringRelativeLayout;
.super Landroid/widget/RelativeLayout;
.source "SpringRelativeLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/SpringRelativeLayout$b;,
        Lcom/android/launcher3/views/SpringRelativeLayout$a;
    }
.end annotation


# instance fields
.field private final g:Landroid/widget/EdgeEffect;

.field private final h:Landroid/widget/EdgeEffect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/SpringRelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p3, Landroid/widget/EdgeEffect;

    invoke-direct {p3, p1, p2}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p3, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->g:Landroid/widget/EdgeEffect;

    .line 4
    new-instance p3, Landroid/widget/EdgeEffect;

    invoke-direct {p3, p1, p2}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p3, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->h:Landroid/widget/EdgeEffect;

    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/views/SpringRelativeLayout;)Landroid/widget/EdgeEffect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->g:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->g:Landroid/widget/EdgeEffect;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->g:Landroid/widget/EdgeEffect;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    invoke-virtual {v2, v3, v4}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->g:Landroid/widget/EdgeEffect;

    .line 34
    .line 35
    invoke-virtual {v2, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->postInvalidateOnAnimation()V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->h:Landroid/widget/EdgeEffect;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    neg-int v4, v2

    .line 68
    int-to-float v4, v4

    .line 69
    int-to-float v5, v3

    .line 70
    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 71
    .line 72
    .line 73
    const/high16 v4, 0x43340000    # 180.0f

    .line 74
    .line 75
    int-to-float v5, v2

    .line 76
    invoke-virtual {p1, v4, v5, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->h:Landroid/widget/EdgeEffect;

    .line 80
    .line 81
    invoke-virtual {v1, v2, v3}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->h:Landroid/widget/EdgeEffect;

    .line 85
    .line 86
    invoke-virtual {v1, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->postInvalidateOnAnimation()V

    .line 93
    .line 94
    .line 95
    :cond_2
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 96
    .line 97
    .line 98
    :cond_3
    return-void
.end method

.method protected e(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->h:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/widget/EdgeEffect;->onPull(FF)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected f(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->h:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g()Landroidx/recyclerview/widget/RecyclerView$EdgeEffectFactory;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/views/SpringRelativeLayout$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/views/SpringRelativeLayout$b;-><init>(Lcom/android/launcher3/views/SpringRelativeLayout;Lcom/android/launcher3/views/X;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/SpringRelativeLayout;->h:Landroid/widget/EdgeEffect;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
