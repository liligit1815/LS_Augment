.class public Lcom/android/launcher3/util/window/a;
.super Ljava/lang/Object;
.source "CachedDisplayInfo.java"


# static fields
.field private static final d:Landroid/view/DisplayCutout;


# instance fields
.field public final a:Landroid/graphics/Point;

.field public final b:I

.field public final c:Landroid/view/DisplayCutout;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Landroid/view/DisplayCutout;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Insets;->NONE:Landroid/graphics/Insets;

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    const/4 v5, 0x0

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct/range {v0 .. v5}, Landroid/view/DisplayCutout;-><init>(Landroid/graphics/Insets;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/android/launcher3/util/window/a;->d:Landroid/view/DisplayCutout;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Point;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroid/graphics/Point;-><init>(II)V

    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/util/window/a;-><init>(Landroid/graphics/Point;I)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Point;I)V
    .locals 1

    .line 2
    sget-object v0, Lcom/android/launcher3/util/window/a;->d:Landroid/view/DisplayCutout;

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/util/window/a;-><init>(Landroid/graphics/Point;ILandroid/view/DisplayCutout;)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Point;ILandroid/view/DisplayCutout;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 5
    iput p2, p0, Lcom/android/launcher3/util/window/a;->b:I

    if-nez p3, :cond_0

    .line 6
    sget-object p3, Lcom/android/launcher3/util/window/a;->d:Landroid/view/DisplayCutout;

    :cond_0
    iput-object p3, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/util/window/d;)Lcom/android/launcher3/util/window/a;
    .locals 9

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/window/a;->b:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Landroid/graphics/Point;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/util/window/a;->b:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v1, v2}, Lcom/android/launcher3/util/X1;->a(II)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v0, v1}, Lcom/android/launcher3/util/X1;->c(Landroid/graphics/Point;I)V

    .line 21
    .line 22
    .line 23
    iget-object v4, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 26
    .line 27
    iget v5, v1, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    iget v6, v1, Landroid/graphics/Point;->y:I

    .line 30
    .line 31
    iget v7, p0, Lcom/android/launcher3/util/window/a;->b:I

    .line 32
    .line 33
    const/4 v8, 0x0

    .line 34
    move-object v3, p1

    .line 35
    invoke-virtual/range {v3 .. v8}, Lcom/android/launcher3/util/window/d;->rotateCutout(Landroid/view/DisplayCutout;IIII)Landroid/view/DisplayCutout;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Lcom/android/launcher3/util/window/a;

    .line 40
    .line 41
    invoke-direct {p1, v0, v2, p0}, Lcom/android/launcher3/util/window/a;-><init>(Landroid/graphics/Point;ILandroid/view/DisplayCutout;)V

    .line 42
    .line 43
    .line 44
    return-object p1
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
    instance-of v1, p1, Lcom/android/launcher3/util/window/a;

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
    check-cast p1, Lcom/android/launcher3/util/window/a;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/util/window/a;->b:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/launcher3/util/window/a;->b:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 22
    .line 23
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v3, p1, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v3, p1, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iget-object v3, p1, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 64
    .line 65
    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object p0, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    iget-object p1, p1, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-ne p0, p1, :cond_2

    .line 84
    .line 85
    return v0

    .line 86
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/util/window/a;->b:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v4, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 30
    .line 31
    invoke-virtual {v4}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget-object p0, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/DisplayCutout;->getSafeInsetBottom()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "CachedDisplayInfo{size="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", cutout="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", rotation="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget p0, p0, Lcom/android/launcher3/util/window/a;->b:I

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x7d

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
