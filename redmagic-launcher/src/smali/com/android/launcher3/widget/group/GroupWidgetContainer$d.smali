.class Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "GroupWidgetContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/group/GroupWidgetContainer;->n(IZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->k(Lcom/android/launcher3/widget/group/GroupWidgetContainer;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->h(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, 0x0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 27
    .line 28
    invoke-static {v2}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->h(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    rem-int/2addr p1, v2

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    move p1, v1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move p1, v0

    .line 38
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v3, "onAnimationEnd getScrollY="

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getScrollY()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v3, " isRunning="

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 63
    .line 64
    invoke-static {v3}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v3, " mIsTouching="

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 81
    .line 82
    invoke-static {v3}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->d(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v3, " mPageHeight="

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 95
    .line 96
    invoke-static {v3}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->h(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v3, " justPage="

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    const-string v3, "GroupWidgetContainer"

    .line 116
    .line 117
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 121
    .line 122
    invoke-static {v2}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->i(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Landroid/animation/ValueAnimator;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-nez v2, :cond_1

    .line 131
    .line 132
    iget-object v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 133
    .line 134
    invoke-static {v2}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->d(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-nez v2, :cond_1

    .line 139
    .line 140
    if-eqz p1, :cond_1

    .line 141
    .line 142
    iget-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 143
    .line 144
    invoke-static {p1}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->b(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    if-eqz p1, :cond_1

    .line 149
    .line 150
    iget-object p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetContainer$d;->g:Lcom/android/launcher3/widget/group/GroupWidgetContainer;

    .line 151
    .line 152
    invoke-static {p0}, Lcom/android/launcher3/widget/group/GroupWidgetContainer;->b(Lcom/android/launcher3/widget/group/GroupWidgetContainer;)Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    const-wide/16 v2, 0x1f4

    .line 157
    .line 158
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->d(ZZJ)V

    .line 159
    .line 160
    .line 161
    :cond_1
    return-void
.end method
