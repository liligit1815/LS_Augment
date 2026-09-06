.class public Lcom/android/launcher3/util/X1;
.super Ljava/lang/Object;
.source "RotationUtils.java"


# direct methods
.method public static a(II)I
    .locals 0

    .line 1
    sub-int/2addr p1, p0

    .line 2
    if-gez p1, :cond_0

    .line 3
    .line 4
    add-int/lit8 p1, p1, 0x4

    .line 5
    .line 6
    :cond_0
    return p1
.end method

.method public static b(Landroid/graphics/Rect;I)V
    .locals 3

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iget p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 13
    .line 14
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    iget v1, p0, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iget v2, p0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v1, "unknown rotation: "

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw p0

    .line 47
    :cond_1
    iget p1, p0, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    iget v0, p0, Landroid/graphics/Rect;->bottom:I

    .line 50
    .line 51
    iget v1, p0, Landroid/graphics/Rect;->left:I

    .line 52
    .line 53
    iget v2, p0, Landroid/graphics/Rect;->top:I

    .line 54
    .line 55
    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    iget p1, p0, Landroid/graphics/Rect;->top:I

    .line 60
    .line 61
    iget v0, p0, Landroid/graphics/Rect;->right:I

    .line 62
    .line 63
    iget v1, p0, Landroid/graphics/Rect;->bottom:I

    .line 64
    .line 65
    iget v2, p0, Landroid/graphics/Rect;->left:I

    .line 66
    .line 67
    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 68
    .line 69
    .line 70
    :cond_3
    return-void
.end method

.method public static c(Landroid/graphics/Point;I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "unknown rotation: "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw p0

    .line 36
    :cond_1
    :goto_0
    iget p1, p0, Landroid/graphics/Point;->y:I

    .line 37
    .line 38
    iget v0, p0, Landroid/graphics/Point;->x:I

    .line 39
    .line 40
    invoke-virtual {p0, p1, v0}, Landroid/graphics/Point;->set(II)V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method
