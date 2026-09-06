.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AIBubbleWidgetBubbleContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->F(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

.field final synthetic h:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

.field final synthetic i:F

.field final synthetic j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->h:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->i:F

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
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
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    instance-of p1, p1, Landroid/graphics/drawable/AnimationDrawable;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Landroid/view/ViewGroup;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 69
    .line 70
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->h:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 80
    .line 81
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-virtual {p1, v1, v0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->Q(ZLjava/util/ArrayList;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    const/16 v0, 0xff

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 110
    .line 111
    .line 112
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 113
    .line 114
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->i:F

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 120
    .line 121
    const v0, 0x7f0b007b

    .line 122
    .line 123
    .line 124
    const/4 v1, 0x0

    .line 125
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->h:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 135
    .line 136
    invoke-static {p1, p0}, Lcom/android/launcher3/widget/custom/bubble/l;->q0(Landroid/content/Context;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    instance-of p1, p1, Landroid/graphics/drawable/AnimationDrawable;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->k(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->h:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->j:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->k(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;->h:Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method
