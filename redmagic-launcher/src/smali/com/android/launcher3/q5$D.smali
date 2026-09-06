.class Lcom/android/launcher3/q5$D;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/q5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "D"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:F

.field public final j:F

.field public final k:F

.field public final l:F

.field public final m:F


# direct methods
.method constructor <init>(Landroid/content/res/Resources;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/view/View;IIZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 9
    .line 10
    .line 11
    move-result p8

    .line 12
    invoke-static {p2, p8}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    .line 16
    .line 17
    .line 18
    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    .line 19
    .line 20
    .line 21
    instance-of p2, p5, Lcom/android/launcher3/BubbleTextView;

    .line 22
    .line 23
    const/high16 p8, 0x3f800000    # 1.0f

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    instance-of p2, p2, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 32
    .line 33
    if-nez p2, :cond_0

    .line 34
    .line 35
    check-cast p5, Lcom/android/launcher3/BubbleTextView;

    .line 36
    .line 37
    invoke-virtual {p5}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p2}, Ls1/o;->d()F

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move p2, p8

    .line 49
    :goto_0
    iput p2, p0, Lcom/android/launcher3/q5$D;->k:F

    .line 50
    .line 51
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    int-to-float p2, p2

    .line 56
    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    .line 57
    .line 58
    .line 59
    move-result p5

    .line 60
    div-float/2addr p2, p5

    .line 61
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 62
    .line 63
    .line 64
    move-result p5

    .line 65
    int-to-float p5, p5

    .line 66
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    .line 67
    .line 68
    .line 69
    move-result p9

    .line 70
    div-float/2addr p5, p9

    .line 71
    invoke-static {p2, p5}, Ljava/lang/Math;->min(FF)F

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    iput p2, p0, Lcom/android/launcher3/q5$D;->l:F

    .line 76
    .line 77
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerX()I

    .line 78
    .line 79
    .line 80
    move-result p5

    .line 81
    sub-int/2addr p5, p6

    .line 82
    int-to-float p5, p5

    .line 83
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerY()I

    .line 84
    .line 85
    .line 86
    move-result p6

    .line 87
    sub-int/2addr p6, p7

    .line 88
    int-to-float p6, p6

    .line 89
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerX()F

    .line 90
    .line 91
    .line 92
    move-result p7

    .line 93
    sub-float/2addr p5, p7

    .line 94
    iput p5, p0, Lcom/android/launcher3/q5$D;->i:F

    .line 95
    .line 96
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerY()F

    .line 97
    .line 98
    .line 99
    move-result p5

    .line 100
    sub-float/2addr p6, p5

    .line 101
    iput p6, p0, Lcom/android/launcher3/q5$D;->j:F

    .line 102
    .line 103
    iput p8, p0, Lcom/android/launcher3/q5$D;->m:F

    .line 104
    .line 105
    const-string p5, "starting_surface_icon_size"

    .line 106
    .line 107
    const/16 p6, 0x6c

    .line 108
    .line 109
    invoke-static {p5, p1, p6}, Lc2/a;->b(Ljava/lang/String;Landroid/content/res/Resources;I)I

    .line 110
    .line 111
    .line 112
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerX()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iput p1, p0, Lcom/android/launcher3/q5$D;->a:I

    .line 117
    .line 118
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerY()I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput p1, p0, Lcom/android/launcher3/q5$D;->b:I

    .line 123
    .line 124
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    mul-float/2addr p1, p2

    .line 129
    float-to-int p1, p1

    .line 130
    iput p1, p0, Lcom/android/launcher3/q5$D;->c:I

    .line 131
    .line 132
    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    mul-float/2addr p1, p2

    .line 137
    float-to-int p1, p1

    .line 138
    iput p1, p0, Lcom/android/launcher3/q5$D;->d:I

    .line 139
    .line 140
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    iput p1, p0, Lcom/android/launcher3/q5$D;->g:I

    .line 145
    .line 146
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    iput p1, p0, Lcom/android/launcher3/q5$D;->h:I

    .line 151
    .line 152
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerX()I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iput p1, p0, Lcom/android/launcher3/q5$D;->e:I

    .line 157
    .line 158
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerY()I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    iput p1, p0, Lcom/android/launcher3/q5$D;->f:I

    .line 163
    .line 164
    return-void
.end method
