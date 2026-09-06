.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$a;
.super Landroid/view/ViewOutlineProvider;
.source "AIBubbleWidgetNumberTextLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;I)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$a;->a:I

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
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$a;->a:I

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$a;->a:I

    .line 12
    .line 13
    sub-int/2addr p1, p0

    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p2, p0, v0, v1, p1}, Landroid/graphics/Outline;->setRect(IIII)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
