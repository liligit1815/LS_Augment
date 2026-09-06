.class Lcom/android/launcher3/taskbar/j2$b;
.super Landroid/view/View$DragShadowBuilder;
.source "TaskbarDragController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/j2;->G0(Lcom/android/launcher3/BubbleTextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/BubbleTextView;

.field final synthetic b:Lcom/android/launcher3/taskbar/j2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/j2;Landroid/view/View;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/taskbar/j2$b;->a:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDrawShadow(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->getEndScale()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/v;->draw(Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onProvideShadowMetrics(Landroid/graphics/Point;Landroid/graphics/Point;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/j2;->d0(Lcom/android/launcher3/taskbar/j2;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j2$b;->a:Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/widget/TextView;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "TaskbarDragController"

    .line 18
    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Point;->set(II)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v0, "Invalid icon size, dragSize="

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/android/launcher3/taskbar/j2;->d0(Lcom/android/launcher3/taskbar/j2;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, " viewWidth="

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$b;->a:Lcom/android/launcher3/BubbleTextView;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/android/launcher3/taskbar/j2;->d0(Lcom/android/launcher3/taskbar/j2;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->getDragRegionWidth()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    sub-int/2addr p1, v0

    .line 82
    div-int/lit8 p1, p1, 0x2

    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/android/launcher3/taskbar/j2;->d0(Lcom/android/launcher3/taskbar/j2;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 95
    .line 96
    invoke-virtual {v2}, Lcom/android/launcher3/dragndrop/v;->getDragRegionHeight()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    sub-int/2addr v0, v2

    .line 101
    div-int/lit8 v0, v0, 0x2

    .line 102
    .line 103
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 104
    .line 105
    invoke-static {v2}, Lcom/android/launcher3/taskbar/j2;->e0(Lcom/android/launcher3/taskbar/j2;)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    add-int/2addr v2, p1

    .line 110
    iget-object v3, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 111
    .line 112
    invoke-static {v3}, Lcom/android/launcher3/taskbar/j2;->f0(Lcom/android/launcher3/taskbar/j2;)I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    add-int/2addr v3, v0

    .line 117
    if-ltz v2, :cond_1

    .line 118
    .line 119
    if-ltz v3, :cond_1

    .line 120
    .line 121
    invoke-virtual {p2, v2, v3}, Landroid/graphics/Point;->set(II)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v2, "Invalid touch point, registrationXY=("

    .line 131
    .line 132
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 136
    .line 137
    invoke-static {v2}, Lcom/android/launcher3/taskbar/j2;->e0(Lcom/android/launcher3/taskbar/j2;)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v2, ", "

    .line 145
    .line 146
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2$b;->b:Lcom/android/launcher3/taskbar/j2;

    .line 150
    .line 151
    invoke-static {p0}, Lcom/android/launcher3/taskbar/j2;->f0(Lcom/android/launcher3/taskbar/j2;)I

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string p0, ") offsetXY=("

    .line 159
    .line 160
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string p0, ")"

    .line 173
    .line 174
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    return-void
.end method
