.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleContainer.java"

# interfaces
.implements Landroid/animation/TimeAnimator$TimeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v(ZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTimeUpdate(Landroid/animation/TimeAnimator;JJ)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->i(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p4

    .line 7
    sub-long p4, p2, p4

    .line 8
    .line 9
    invoke-static {p4, p5}, Ljava/lang/Math;->abs(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide p4

    .line 13
    const-wide/16 v0, 0x3e8

    .line 14
    .line 15
    cmp-long p1, p4, v0

    .line 16
    .line 17
    const-string p4, "AIBubbleWidgetBubbleContainer"

    .line 18
    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    new-instance p1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string p5, "doBubbleViewListFloatingAnim onTimeUpdate curTime="

    .line 27
    .line 28
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 42
    .line 43
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->n(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;J)V

    .line 44
    .line 45
    .line 46
    :cond_0
    const/4 p1, 0x0

    .line 47
    move p5, p1

    .line 48
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->h(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ge p5, v0, :cond_4

    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->h(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 71
    .line 72
    const-wide/16 v1, 0x0

    .line 73
    .line 74
    cmp-long v1, p2, v1

    .line 75
    .line 76
    if-nez v1, :cond_1

    .line 77
    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v2, "doBubbleViewListFloatingAnim onTimeUpdate i="

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, ", alpha="

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getAlpha()F

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v2, ", tranX="

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTranslationX()F

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v2, ", tranY="

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTranslationY()F

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-static {p4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    :cond_1
    const v1, 0x7f0b0077

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    instance-of v2, v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;

    .line 142
    .line 143
    if-eqz v2, :cond_3

    .line 144
    .line 145
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;

    .line 146
    .line 147
    invoke-static {v1, p2, p3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;J)Landroid/graphics/PointF;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTranslationX()F

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 156
    .line 157
    cmpl-float v2, v2, v3

    .line 158
    .line 159
    if-nez v2, :cond_2

    .line 160
    .line 161
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTranslationY()F

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    iget v3, v1, Landroid/graphics/PointF;->y:F

    .line 166
    .line 167
    cmpl-float v2, v2, v3

    .line 168
    .line 169
    if-eqz v2, :cond_3

    .line 170
    .line 171
    :cond_2
    iget v2, v1, Landroid/graphics/PointF;->x:F

    .line 172
    .line 173
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 174
    .line 175
    .line 176
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 179
    .line 180
    .line 181
    :cond_3
    add-int/lit8 p5, p5, 0x1

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_4
    const-wide/16 p4, 0x1388

    .line 186
    .line 187
    cmp-long p2, p2, p4

    .line 188
    .line 189
    if-ltz p2, :cond_5

    .line 190
    .line 191
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;->a:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 192
    .line 193
    const/4 p2, 0x1

    .line 194
    invoke-static {p0, p1, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->q(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;ZZZ)V

    .line 195
    .line 196
    .line 197
    :cond_5
    return-void
.end method
