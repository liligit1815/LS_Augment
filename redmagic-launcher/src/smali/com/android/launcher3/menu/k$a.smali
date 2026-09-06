.class Lcom/android/launcher3/menu/k$a;
.super Ljava/lang/Object;
.source "MenuItemViewEffect.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/k;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/menu/k;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/menu/k;->b(Lcom/android/launcher3/menu/k;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/menu/k;->b(Lcom/android/launcher3/menu/k;)Landroid/widget/TextView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/android/launcher3/menu/k;->b(Lcom/android/launcher3/menu/k;)Landroid/widget/TextView;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Landroid/widget/TextView;->getLineCount()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    int-to-float v1, v1

    .line 39
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 40
    .line 41
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 42
    .line 43
    sub-float/2addr v2, v0

    .line 44
    mul-float/2addr v1, v2

    .line 45
    iget-object v0, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/android/launcher3/menu/k;->b(Lcom/android/launcher3/menu/k;)Landroid/widget/TextView;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Landroid/widget/TextView;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    int-to-float v0, v0

    .line 56
    cmpl-float v0, v1, v0

    .line 57
    .line 58
    if-lez v0, :cond_1

    .line 59
    .line 60
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const/4 v1, 0x0

    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    iget-object v0, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/android/launcher3/menu/k;->b(Lcom/android/launcher3/menu/k;)Landroid/widget/TextView;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object p0, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const v2, 0x7f0706e2

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-virtual {v0, v1, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/android/launcher3/menu/k;->b(Lcom/android/launcher3/menu/k;)Landroid/widget/TextView;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object p0, p0, Lcom/android/launcher3/menu/k$a;->g:Lcom/android/launcher3/menu/k;

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const v2, 0x7f0706e3

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-virtual {v0, v1, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 114
    .line 115
    .line 116
    :cond_1
    return-void
.end method
