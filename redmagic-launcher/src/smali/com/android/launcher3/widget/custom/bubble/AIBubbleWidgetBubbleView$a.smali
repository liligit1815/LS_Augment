.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$a;
.super Landroid/view/ViewOutlineProvider;
.source "AIBubbleWidgetBubbleView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;I)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$a;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$a;->a:I

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    iget v3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$a;->a:I

    .line 10
    .line 11
    sub-int/2addr v2, v3

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$a;->a:I

    .line 17
    .line 18
    sub-int/2addr v3, p0

    .line 19
    invoke-direct {v0, v1, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    int-to-float p0, p0

    .line 27
    const/high16 p1, 0x40000000    # 2.0f

    .line 28
    .line 29
    div-float/2addr p0, p1

    .line 30
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    int-to-float p0, p0

    .line 35
    invoke-virtual {p2, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
