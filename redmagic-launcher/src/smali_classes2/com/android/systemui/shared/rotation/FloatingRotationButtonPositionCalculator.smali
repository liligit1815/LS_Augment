.class public final Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;
.super Ljava/lang/Object;
.source "FloatingRotationButtonPositionCalculator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator$Position;
    }
.end annotation


# instance fields
.field private final defaultMargin:I

.field private final floatingRotationButtonPositionLeft:Z

.field private final taskbarMarginBottom:I

.field private final taskbarMarginLeft:I


# direct methods
.method public constructor <init>(IIIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->defaultMargin:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->taskbarMarginLeft:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->taskbarMarginBottom:I

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->floatingRotationButtonPositionLeft:Z

    .line 11
    .line 12
    return-void
.end method

.method private final resolveGravity(I)I
    .locals 8

    .line 1
    iget-boolean p0, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->floatingRotationButtonPositionLeft:Z

    .line 2
    .line 3
    const/16 v0, 0x53

    .line 4
    .line 5
    const/16 v1, 0x55

    .line 6
    .line 7
    const/16 v2, 0x35

    .line 8
    .line 9
    const/16 v3, 0x33

    .line 10
    .line 11
    const-string v4, "Invalid rotation "

    .line 12
    .line 13
    const/4 v5, 0x3

    .line 14
    const/4 v6, 0x2

    .line 15
    const/4 v7, 0x1

    .line 16
    if-eqz p0, :cond_4

    .line 17
    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    if-eq p1, v7, :cond_2

    .line 21
    .line 22
    if-eq p1, v6, :cond_1

    .line 23
    .line 24
    if-ne p1, v5, :cond_0

    .line 25
    .line 26
    return v3

    .line 27
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p0

    .line 48
    :cond_1
    return v2

    .line 49
    :cond_2
    return v1

    .line 50
    :cond_3
    return v0

    .line 51
    :cond_4
    if-eqz p1, :cond_8

    .line 52
    .line 53
    if-eq p1, v7, :cond_7

    .line 54
    .line 55
    if-eq p1, v6, :cond_6

    .line 56
    .line 57
    if-ne p1, v5, :cond_5

    .line 58
    .line 59
    return v0

    .line 60
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 61
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw p0

    .line 81
    :cond_6
    return v3

    .line 82
    :cond_7
    return v2

    .line 83
    :cond_8
    return v1
.end method


# virtual methods
.method public final calculatePosition(IZZ)Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator$Position;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    :cond_0
    if-eqz p2, :cond_1

    .line 7
    .line 8
    if-nez p3, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    const/4 v0, 0x0

    .line 12
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->resolveGravity(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget p2, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->taskbarMarginLeft:I

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_2
    iget p2, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->defaultMargin:I

    .line 22
    .line 23
    :goto_1
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget p0, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->taskbarMarginBottom:I

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_3
    iget p0, p0, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator;->defaultMargin:I

    .line 29
    .line 30
    :goto_2
    and-int/lit8 p3, p1, 0x5

    .line 31
    .line 32
    const/4 v0, 0x5

    .line 33
    if-ne p3, v0, :cond_4

    .line 34
    .line 35
    neg-int p2, p2

    .line 36
    :cond_4
    and-int/lit8 p3, p1, 0x50

    .line 37
    .line 38
    const/16 v0, 0x50

    .line 39
    .line 40
    if-ne p3, v0, :cond_5

    .line 41
    .line 42
    neg-int p0, p0

    .line 43
    :cond_5
    new-instance p3, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator$Position;

    .line 44
    .line 45
    invoke-direct {p3, p1, p2, p0}, Lcom/android/systemui/shared/rotation/FloatingRotationButtonPositionCalculator$Position;-><init>(III)V

    .line 46
    .line 47
    .line 48
    return-object p3
.end method
