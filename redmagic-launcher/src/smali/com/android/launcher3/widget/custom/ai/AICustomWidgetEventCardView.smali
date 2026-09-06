.class public Lcom/android/launcher3/widget/custom/ai/AICustomWidgetEventCardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "AICustomWidgetEventCardView.java"


# instance fields
.field private g:Lx1/v;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetEventCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetEventCardView;->g:Lx1/v;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lx1/v;

    .line 6
    .line 7
    const-string v1, "AICustomWidgetEventCardView"

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v0, p0, v1, v2}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetEventCardView;->g:Lx1/v;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetEventCardView;->g:Lx1/v;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method
