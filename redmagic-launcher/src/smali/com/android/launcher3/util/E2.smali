.class public Lcom/android/launcher3/util/E2;
.super Ljava/lang/Object;
.source "SystemUiController.java"


# instance fields
.field private final a:Landroid/view/View;

.field private final b:[I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    new-array v0, v0, [I

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/util/E2;->b:[I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/util/E2;->a:Landroid/view/View;

    .line 10
    .line 11
    return-void
.end method

.method private a(II)I
    .locals 0

    .line 1
    and-int/lit8 p0, p1, 0x1

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    or-int/lit8 p2, p2, 0x10

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    and-int/lit8 p0, p1, 0x2

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    and-int/lit8 p2, p2, -0x11

    .line 13
    .line 14
    :cond_1
    :goto_0
    and-int/lit8 p0, p1, 0x4

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    or-int/lit16 p0, p2, 0x2000

    .line 19
    .line 20
    return p0

    .line 21
    :cond_2
    and-int/lit8 p0, p1, 0x8

    .line 22
    .line 23
    if-eqz p0, :cond_3

    .line 24
    .line 25
    and-int/lit16 p0, p2, -0x2001

    .line 26
    .line 27
    return p0

    .line 28
    :cond_3
    return p2
.end method


# virtual methods
.method public b(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/E2;->b:[I

    .line 2
    .line 3
    aget v1, v0, p1

    .line 4
    .line 5
    if-ne v1, p2, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    aput p2, v0, p1

    .line 9
    .line 10
    iget-object p2, p0, Lcom/android/launcher3/util/E2;->a:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/view/View;->getSystemUiVisibility()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iget-object v0, p0, Lcom/android/launcher3/util/E2;->b:[I

    .line 17
    .line 18
    array-length v1, v0

    .line 19
    const/4 v2, 0x0

    .line 20
    move v3, p2

    .line 21
    :goto_0
    if-ge v2, v1, :cond_1

    .line 22
    .line 23
    aget v4, v0, v2

    .line 24
    .line 25
    invoke-direct {p0, v4, v3}, Lcom/android/launcher3/util/E2;->a(II)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v1, "updateUiState setSystemUiVisibility: oldFlags="

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v1, ",newFlags="

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, ",state="

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string v0, "SystemUiController"

    .line 74
    .line 75
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    if-eq v3, p2, :cond_2

    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/util/E2;->a:Landroid/view/View;

    .line 81
    .line 82
    invoke-virtual {p0, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 83
    .line 84
    .line 85
    :cond_2
    :goto_1
    return-void
.end method

.method public c(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p2, 0x5

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/16 p2, 0xa

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/H5$g;->a()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/H5$g;->f()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v1, -0x1

    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, 0x1

    .line 28
    if-ne p1, v1, :cond_0

    .line 29
    .line 30
    move p1, v3

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move p1, v2

    .line 33
    :goto_0
    const/high16 v1, -0x1000000

    .line 34
    .line 35
    if-eq v0, v1, :cond_2

    .line 36
    .line 37
    const/high16 v1, -0x5a000000

    .line 38
    .line 39
    if-ne v0, v1, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move v0, v2

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    :goto_1
    move v0, v3

    .line 45
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v4, "updateUiState: isLightStatus-isLightNav"

    .line 51
    .line 52
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v4, "-"

    .line 59
    .line 60
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v4, "SystemUiController"

    .line 71
    .line 72
    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    const/4 p1, 0x4

    .line 78
    goto :goto_3

    .line 79
    :cond_3
    const/16 p1, 0x8

    .line 80
    .line 81
    :goto_3
    if-eqz v0, :cond_4

    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_4
    const/4 v3, 0x2

    .line 85
    :goto_4
    or-int/2addr p1, v3

    .line 86
    invoke-virtual {p0, v2, p1}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public e(II)V
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    :cond_0
    const/high16 v1, -0x1000000

    .line 6
    .line 7
    if-nez p2, :cond_1

    .line 8
    .line 9
    move p2, v1

    .line 10
    :cond_1
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    if-ne p2, v0, :cond_2

    .line 13
    .line 14
    move p2, v3

    .line 15
    goto :goto_0

    .line 16
    :cond_2
    move p2, v2

    .line 17
    :goto_0
    if-eq p1, v1, :cond_4

    .line 18
    .line 19
    const/high16 v0, -0x5a000000

    .line 20
    .line 21
    if-ne p1, v0, :cond_3

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_3
    move p1, v2

    .line 25
    goto :goto_2

    .line 26
    :cond_4
    :goto_1
    move p1, v3

    .line 27
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "updateUiStateWithColor: isLightStatus-isLightNav"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, "-"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "SystemUiController"

    .line 53
    .line 54
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    if-eqz p2, :cond_5

    .line 58
    .line 59
    const/4 p2, 0x4

    .line 60
    goto :goto_3

    .line 61
    :cond_5
    const/16 p2, 0x8

    .line 62
    .line 63
    :goto_3
    if-eqz p1, :cond_6

    .line 64
    .line 65
    goto :goto_4

    .line 66
    :cond_6
    const/4 v3, 0x2

    .line 67
    :goto_4
    or-int p1, p2, v3

    .line 68
    .line 69
    invoke-virtual {p0, v2, p1}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 70
    .line 71
    .line 72
    return-void
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
    const-string v1, "mStates="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/util/E2;->b:[I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
