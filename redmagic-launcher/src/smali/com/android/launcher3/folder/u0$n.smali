.class Lcom/android/launcher3/folder/u0$n;
.super Ljava/lang/Object;
.source "PreviewBackground.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->k0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Landroid/graphics/Rect;

.field final synthetic i:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;ILandroid/graphics/Rect;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/folder/u0$n;->g:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/folder/u0$n;->h:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Landroid/graphics/drawable/Drawable;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget v0, p0, Lcom/android/launcher3/folder/u0$n;->g:I

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    mul-float/2addr v0, p1

    .line 15
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/android/launcher3/folder/u0;->v(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    new-instance v6, Landroid/graphics/Rect;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$n;->h:Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-direct {v6, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 32
    .line 33
    .line 34
    iget v0, v6, Landroid/graphics/Rect;->left:I

    .line 35
    .line 36
    sub-int/2addr v0, p1

    .line 37
    iput v0, v6, Landroid/graphics/Rect;->left:I

    .line 38
    .line 39
    iget v0, v6, Landroid/graphics/Rect;->top:I

    .line 40
    .line 41
    sub-int/2addr v0, p1

    .line 42
    iput v0, v6, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    iget v0, v6, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    add-int/2addr v0, p1

    .line 47
    iput v0, v6, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    iget v0, v6, Landroid/graphics/Rect;->bottom:I

    .line 50
    .line 51
    add-int/2addr v0, p1

    .line 52
    iput v0, v6, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->v(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, v6}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->o(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/blur/b;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-eqz p1, :cond_0

    .line 76
    .line 77
    new-instance v7, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 83
    .line 84
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->u(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->w(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->x(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    new-instance p1, Lcom/android/launcher3/folder/v0;

    .line 110
    .line 111
    invoke-direct {p1}, Lcom/android/launcher3/folder/v0;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 118
    .line 119
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->o(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/blur/b;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 124
    .line 125
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    iget-object v4, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 130
    .line 131
    invoke-static {v4}, Lcom/android/launcher3/folder/u0;->v(Lcom/android/launcher3/folder/u0;)Landroid/graphics/drawable/Drawable;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    const/4 v2, 0x0

    .line 136
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/blur/b;->b(ZLcom/android/launcher3/CellLayout;Lcom/android/launcher3/folder/u0;Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;Ljava/util/ArrayList;)V

    .line 137
    .line 138
    .line 139
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 140
    .line 141
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    if-eqz p1, :cond_1

    .line 146
    .line 147
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$n;->i:Lcom/android/launcher3/folder/u0;

    .line 148
    .line 149
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 154
    .line 155
    .line 156
    :cond_1
    return-void
.end method
