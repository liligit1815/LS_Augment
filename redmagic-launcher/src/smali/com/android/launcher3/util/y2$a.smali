.class public Lcom/android/launcher3/util/y2$a;
.super Ljava/lang/Object;
.source "SplitConfigurationOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/y2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public final b:Landroid/graphics/Rect;

.field public final c:Landroid/graphics/Rect;

.field private final d:F

.field private final e:F

.field private final f:F

.field private final g:F

.field public final h:I

.field public final i:Z

.field public final j:Z

.field public final k:I

.field public final l:I


# direct methods
.method public constructor <init>(Landroid/graphics/Rect;Landroid/graphics/Rect;III)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/y2$a;->a:Landroid/graphics/Rect;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/y2$a;->b:Landroid/graphics/Rect;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/util/y2$a;->k:I

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/util/y2$a;->l:I

    .line 11
    .line 12
    iput p5, p0, Lcom/android/launcher3/util/y2$a;->h:I

    .line 13
    .line 14
    iget p3, p2, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    iget p4, p1, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    const/4 p5, 0x1

    .line 19
    const/4 v0, 0x0

    .line 20
    if-le p3, p4, :cond_0

    .line 21
    .line 22
    new-instance p3, Landroid/graphics/Rect;

    .line 23
    .line 24
    iget p4, p1, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 27
    .line 28
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 29
    .line 30
    iget v3, p2, Landroid/graphics/Rect;->top:I

    .line 31
    .line 32
    invoke-direct {p3, p4, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 33
    .line 34
    .line 35
    iput-object p3, p0, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    .line 36
    .line 37
    iput-boolean p5, p0, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/android/launcher3/util/y2$a;->j:Z

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance p3, Landroid/graphics/Rect;

    .line 43
    .line 44
    iget p4, p1, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 47
    .line 48
    iget v2, p2, Landroid/graphics/Rect;->left:I

    .line 49
    .line 50
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 51
    .line 52
    invoke-direct {p3, p4, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 53
    .line 54
    .line 55
    iput-object p3, p0, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    .line 56
    .line 57
    iput-boolean v0, p0, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 58
    .line 59
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 64
    .line 65
    .line 66
    move-result p4

    .line 67
    if-le p3, p4, :cond_1

    .line 68
    .line 69
    iput-boolean p5, p0, Lcom/android/launcher3/util/y2$a;->j:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    iput-boolean v0, p0, Lcom/android/launcher3/util/y2$a;->j:Z

    .line 73
    .line 74
    :goto_0
    iget p3, p2, Landroid/graphics/Rect;->right:I

    .line 75
    .line 76
    iget p4, p1, Landroid/graphics/Rect;->left:I

    .line 77
    .line 78
    sub-int/2addr p3, p4

    .line 79
    int-to-float p3, p3

    .line 80
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 81
    .line 82
    iget p4, p1, Landroid/graphics/Rect;->top:I

    .line 83
    .line 84
    sub-int/2addr p2, p4

    .line 85
    int-to-float p2, p2

    .line 86
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 87
    .line 88
    .line 89
    move-result p4

    .line 90
    int-to-float p4, p4

    .line 91
    div-float/2addr p4, p3

    .line 92
    iput p4, p0, Lcom/android/launcher3/util/y2$a;->e:F

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    int-to-float p1, p1

    .line 99
    div-float/2addr p1, p2

    .line 100
    iput p1, p0, Lcom/android/launcher3/util/y2$a;->d:F

    .line 101
    .line 102
    iget-object p1, p0, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    int-to-float p1, p1

    .line 109
    div-float/2addr p1, p3

    .line 110
    iput p1, p0, Lcom/android/launcher3/util/y2$a;->f:F

    .line 111
    .line 112
    iget-object p1, p0, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    .line 113
    .line 114
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    int-to-float p1, p1

    .line 119
    div-float/2addr p1, p2

    .line 120
    iput p1, p0, Lcom/android/launcher3/util/y2$a;->g:F

    .line 121
    .line 122
    return-void
.end method


# virtual methods
.method public a()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/util/y2$a;->g:F

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget p0, p0, Lcom/android/launcher3/util/y2$a;->f:F

    .line 9
    .line 10
    return p0
.end method

.method public b()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/util/y2$a;->d:F

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget p0, p0, Lcom/android/launcher3/util/y2$a;->e:F

    .line 9
    .line 10
    return p0
.end method

.method public c()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/util/y2$a;->a()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-float/2addr v0, p0

    .line 10
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    sub-float/2addr p0, v0

    .line 13
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "LeftTop: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/util/y2$a;->a:Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", taskId: "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v2, p0, Lcom/android/launcher3/util/y2$a;->k:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, "\nRightBottom: "

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/android/launcher3/util/y2$a;->b:Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget v1, p0, Lcom/android/launcher3/util/y2$a;->l:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, "\nDivider: "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/util/y2$a;->c:Landroid/graphics/Rect;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\nAppsVertical? "

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/android/launcher3/util/y2$a;->i:Z

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, "\nsnapPosition: "

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget p0, p0, Lcom/android/launcher3/util/y2$a;->h:I

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method
