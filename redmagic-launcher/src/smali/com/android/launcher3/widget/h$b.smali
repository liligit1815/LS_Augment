.class Lcom/android/launcher3/widget/h$b;
.super Landroid/view/ViewOutlineProvider;
.source "BaseLauncherAppWidgetHostView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/h;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    instance-of v0, p1, Lcom/android/launcher3/dragndrop/J;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/launcher3/widget/h;->o(Lcom/android/launcher3/widget/h;)Landroid/graphics/Rect;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/widget/h;->p(Lcom/android/launcher3/widget/h;)F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, v1}, Landroid/graphics/Outline;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/android/launcher3/widget/h;->n(Lcom/android/launcher3/widget/h;)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/android/launcher3/widget/h;->n(Lcom/android/launcher3/widget/h;)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eq p1, v0, :cond_1

    .line 58
    .line 59
    new-instance v0, Landroid/graphics/Rect;

    .line 60
    .line 61
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 62
    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 66
    .line 67
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 82
    .line 83
    invoke-static {p0}, Lcom/android/launcher3/widget/h;->p(Lcom/android/launcher3/widget/h;)F

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    invoke-virtual {p2, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, v1}, Landroid/graphics/Outline;->setAlpha(F)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 95
    .line 96
    invoke-static {p1}, Lcom/android/launcher3/widget/h;->q(Lcom/android/launcher3/widget/h;)Landroid/graphics/Rect;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_4

    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 107
    .line 108
    invoke-static {p1}, Lcom/android/launcher3/widget/h;->p(Lcom/android/launcher3/widget/h;)F

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    cmpg-float p1, p1, v1

    .line 113
    .line 114
    if-gtz p1, :cond_2

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    invoke-static {}, Lm1/a;->a()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_3

    .line 122
    .line 123
    iget-object p1, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 124
    .line 125
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const v2, 0x7f0701c5

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    int-to-float v0, v0

    .line 141
    invoke-static {p1, v0}, Lcom/android/launcher3/widget/h;->r(Lcom/android/launcher3/widget/h;F)V

    .line 142
    .line 143
    .line 144
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 145
    .line 146
    invoke-static {p1}, Lcom/android/launcher3/widget/h;->q(Lcom/android/launcher3/widget/h;)Landroid/graphics/Rect;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iget-object p0, p0, Lcom/android/launcher3/widget/h$b;->a:Lcom/android/launcher3/widget/h;

    .line 151
    .line 152
    invoke-static {p0}, Lcom/android/launcher3/widget/h;->p(Lcom/android/launcher3/widget/h;)F

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2, v1}, Landroid/graphics/Outline;->setAlpha(F)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_4
    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Outline;->setEmpty()V

    .line 164
    .line 165
    .line 166
    return-void
.end method
