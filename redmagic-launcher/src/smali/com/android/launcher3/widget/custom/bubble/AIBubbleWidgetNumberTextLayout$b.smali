.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$b;
.super Ljava/lang/Object;
.source "AIBubbleWidgetNumberTextLayout.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$b;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$b;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;->f(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout$b;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetNumberTextLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
