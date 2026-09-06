.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AIBubbleWidgetBubbleContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->Q(ZLjava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Ljava/util/ArrayList;

.field final synthetic i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;ZLjava/util/ArrayList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->h:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "updateViews animatorSet onAnimationEnd"

    .line 5
    .line 6
    const-string v0, "AIBubbleWidgetBubbleContainer"

    .line 7
    .line 8
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {p1, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Landroid/animation/AnimatorSet;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->l(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "updateViews onAnimationEnd mWaitingUpdateViewsAnimatorEndDataList not null fromSettings="

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->g:Z

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, " dataList="

    .line 41
    .line 42
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->h:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->m(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    new-instance v1, Ljava/util/ArrayList;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;->i:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->l(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    invoke-virtual {p1, v0, v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->Q(ZLjava/util/ArrayList;Z)V

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method
