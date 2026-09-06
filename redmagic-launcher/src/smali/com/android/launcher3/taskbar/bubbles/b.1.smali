.class public final Lcom/android/launcher3/taskbar/bubbles/b;
.super Lcom/android/launcher3/taskbar/bubbles/u;
.source "BubbleBarItem.kt"


# instance fields
.field private c:LN2/k;

.field private d:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

.field private e:Landroid/graphics/Bitmap;

.field private f:Landroid/graphics/Bitmap;

.field private g:I

.field private h:Landroid/graphics/Path;

.field private i:Ljava/lang/String;

.field private j:LW1/m;


# direct methods
.method public constructor <init>(LN2/k;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;ILandroid/graphics/Path;Ljava/lang/String;LW1/m;)V
    .locals 2

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "view"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "badge"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "icon"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "dotPath"

    .line 22
    .line 23
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "appName"

    .line 27
    .line 28
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, LN2/k;->g()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "getKey(...)"

    .line 36
    .line 37
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-direct {p0, v0, p2, v1}, Lcom/android/launcher3/taskbar/bubbles/u;-><init>(Ljava/lang/String;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lkotlin/jvm/internal/j;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->c:LN2/k;

    .line 45
    .line 46
    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/b;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 47
    .line 48
    iput-object p3, p0, Lcom/android/launcher3/taskbar/bubbles/b;->e:Landroid/graphics/Bitmap;

    .line 49
    .line 50
    iput-object p4, p0, Lcom/android/launcher3/taskbar/bubbles/b;->f:Landroid/graphics/Bitmap;

    .line 51
    .line 52
    iput p5, p0, Lcom/android/launcher3/taskbar/bubbles/b;->g:I

    .line 53
    .line 54
    iput-object p6, p0, Lcom/android/launcher3/taskbar/bubbles/b;->h:Landroid/graphics/Path;

    .line 55
    .line 56
    iput-object p7, p0, Lcom/android/launcher3/taskbar/bubbles/b;->i:Ljava/lang/String;

    .line 57
    .line 58
    iput-object p8, p0, Lcom/android/launcher3/taskbar/bubbles/b;->j:LW1/m;

    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->e:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public final e()Landroid/graphics/Path;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->h:Landroid/graphics/Path;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/b;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->c:LN2/k;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/b;->c:LN2/k;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 25
    .line 26
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/b;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 27
    .line 28
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->e:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/b;->e:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_4

    .line 44
    .line 45
    return v2

    .line 46
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->f:Landroid/graphics/Bitmap;

    .line 47
    .line 48
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/b;->f:Landroid/graphics/Bitmap;

    .line 49
    .line 50
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_5

    .line 55
    .line 56
    return v2

    .line 57
    :cond_5
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->g:I

    .line 58
    .line 59
    iget v3, p1, Lcom/android/launcher3/taskbar/bubbles/b;->g:I

    .line 60
    .line 61
    if-eq v1, v3, :cond_6

    .line 62
    .line 63
    return v2

    .line 64
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->h:Landroid/graphics/Path;

    .line 65
    .line 66
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/b;->h:Landroid/graphics/Path;

    .line 67
    .line 68
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_7

    .line 73
    .line 74
    return v2

    .line 75
    :cond_7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->i:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/android/launcher3/taskbar/bubbles/b;->i:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-nez v1, :cond_8

    .line 84
    .line 85
    return v2

    .line 86
    :cond_8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->j:LW1/m;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/android/launcher3/taskbar/bubbles/b;->j:LW1/m;

    .line 89
    .line 90
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-nez p0, :cond_9

    .line 95
    .line 96
    return v2

    .line 97
    :cond_9
    return v0
.end method

.method public final f()LW1/m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->j:LW1/m;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->f:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()LN2/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->c:LN2/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->c:LN2/k;

    .line 2
    .line 3
    invoke-virtual {v0}, LN2/k;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->e:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x1f

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->f:Landroid/graphics/Bitmap;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x1f

    .line 35
    .line 36
    iget v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->g:I

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x1f

    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->h:Landroid/graphics/Path;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/graphics/Path;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x1f

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->i:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    add-int/2addr v0, v1

    .line 61
    mul-int/lit8 v0, v0, 0x1f

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->j:LW1/m;

    .line 64
    .line 65
    if-nez p0, :cond_0

    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {p0}, LW1/m;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    :goto_0
    add-int/2addr v0, p0

    .line 74
    return v0
.end method

.method public final i(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->i:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public final j(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->e:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    return-void
.end method

.method public final k(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public final l(Landroid/graphics/Path;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->h:Landroid/graphics/Path;

    .line 7
    .line 8
    return-void
.end method

.method public final m(LW1/m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->j:LW1/m;

    .line 2
    .line 3
    return-void
.end method

.method public final n(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->f:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    return-void
.end method

.method public final o(LN2/k;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->c:LN2/k;

    .line 7
    .line 8
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->c:LN2/k;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/bubbles/b;->d:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/bubbles/b;->e:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/taskbar/bubbles/b;->f:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    iget v4, p0, Lcom/android/launcher3/taskbar/bubbles/b;->g:I

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/taskbar/bubbles/b;->h:Landroid/graphics/Path;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/android/launcher3/taskbar/bubbles/b;->i:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/b;->j:LW1/m;

    .line 16
    .line 17
    new-instance v7, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v8, "BubbleBarBubble(info="

    .line 23
    .line 24
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, ", view="

    .line 31
    .line 32
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v0, ", badge="

    .line 39
    .line 40
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v0, ", icon="

    .line 47
    .line 48
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v0, ", dotColor="

    .line 55
    .line 56
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, ", dotPath="

    .line 63
    .line 64
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, ", appName="

    .line 71
    .line 72
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v0, ", flyoutMessage="

    .line 79
    .line 80
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p0, ")"

    .line 87
    .line 88
    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method
