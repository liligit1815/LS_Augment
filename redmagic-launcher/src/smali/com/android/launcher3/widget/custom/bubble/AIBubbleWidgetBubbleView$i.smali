.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$i;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AIBubbleWidgetBubbleView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->q(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

.field final synthetic h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$i;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$i;->g:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$i;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView$i;->g:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->t(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
