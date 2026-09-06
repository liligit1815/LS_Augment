.class public Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;
.super Landroid/widget/FrameLayout;
.source "AIFutureWidgetAIAssistantBgLayout.java"


# instance fields
.field private g:Landroid/widget/ImageView;

.field private h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 2

    .line 1
    const-string v0, "AIFutureWidgetAIAssistantBgLayout"

    .line 2
    .line 3
    const-string v1, "onAIFutureScreenWidgetHostViewRemoved"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->n()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected b(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x8

    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->g:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->g:Landroid/widget/ImageView;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->g:Landroid/widget/ImageView;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {}, Lx1/S;->r()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const-string v0, "ai_future_widget_red_magic"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string v0, "ai_future_widget_demi"

    .line 43
    .line 44
    :goto_0
    invoke-static {p0, v0}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method protected getDigitalHumanLayout()Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b00a0

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->g:Landroid/widget/ImageView;

    .line 14
    .line 15
    const v0, 0x7f0b00a1

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 25
    .line 26
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->q()Landroid/util/Pair;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v1, Landroid/graphics/Point;

    .line 33
    .line 34
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Landroid/graphics/Rect;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->g:Landroid/widget/ImageView;

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    instance-of v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 45
    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->g:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 55
    .line 56
    iget v3, v1, Landroid/graphics/Point;->x:I

    .line 57
    .line 58
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 59
    .line 60
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 61
    .line 62
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 63
    .line 64
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 65
    .line 66
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 67
    .line 68
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 69
    .line 70
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 71
    .line 72
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 73
    .line 74
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 75
    .line 76
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 77
    .line 78
    iput v0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->g:Landroid/widget/ImageView;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 92
    .line 93
    if-eqz v0, :cond_1

    .line 94
    .line 95
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Lcom/android/launcher3/C2;

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    iget v2, v2, Lcom/android/launcher3/h0;->T0:I

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget v1, v1, Lcom/android/launcher3/h0;->U0:I

    .line 120
    .line 121
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    const/high16 v2, 0x43340000    # 180.0f

    .line 126
    .line 127
    invoke-static {v2}, Lcom/android/launcher3/N5;->i(F)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    sub-int/2addr v1, v2

    .line 132
    mul-int/lit8 v3, v1, 0x2

    .line 133
    .line 134
    add-int/2addr v3, v2

    .line 135
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 136
    .line 137
    const/4 v3, 0x0

    .line 138
    invoke-static {v3}, Lcom/android/launcher3/N5;->i(F)I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 143
    .line 144
    rsub-int/lit8 v1, v1, 0x0

    .line 145
    .line 146
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 147
    .line 148
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 149
    .line 150
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->h:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->z(I)V

    .line 156
    .line 157
    .line 158
    :cond_1
    const/4 v0, 0x1

    .line 159
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIAssistantBgLayout;->b(Z)V

    .line 160
    .line 161
    .line 162
    return-void
.end method
