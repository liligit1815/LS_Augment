.class public Lcom/android/launcher3/AppWidgetResizeFrame$b;
.super Ljava/lang/Object;
.source "AppWidgetResizeFrame.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/AppWidgetResizeFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(ZZILcom/android/launcher3/AppWidgetResizeFrame$b;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 4
    .line 5
    add-int/2addr p1, p3

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 8
    .line 9
    :goto_0
    iput p1, p4, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    add-int/2addr p0, p3

    .line 16
    :cond_1
    iput p0, p4, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 17
    .line 18
    return-void
.end method

.method public b(ZZIIIILcom/android/launcher3/AppWidgetResizeFrame$b;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p7}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a(ZZILcom/android/launcher3/AppWidgetResizeFrame$b;)V

    .line 2
    .line 3
    .line 4
    iget p3, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 5
    .line 6
    if-gez p3, :cond_0

    .line 7
    .line 8
    const/4 p3, 0x0

    .line 9
    iput p3, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 10
    .line 11
    :cond_0
    iget p3, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 12
    .line 13
    if-le p3, p6, :cond_1

    .line 14
    .line 15
    iput p6, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p7}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-ge p3, p4, :cond_3

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget p3, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 26
    .line 27
    sub-int/2addr p3, p4

    .line 28
    iput p3, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    if-eqz p2, :cond_3

    .line 32
    .line 33
    iget p3, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 34
    .line 35
    add-int/2addr p3, p4

    .line 36
    iput p3, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 37
    .line 38
    :cond_3
    :goto_0
    invoke-virtual {p7}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    if-le p3, p5, :cond_5

    .line 43
    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    iget p1, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 47
    .line 48
    sub-int/2addr p1, p5

    .line 49
    iput p1, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_4
    if-eqz p2, :cond_5

    .line 53
    .line 54
    iget p1, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 55
    .line 56
    add-int/2addr p1, p5

    .line 57
    iput p1, p7, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 58
    .line 59
    :cond_5
    :goto_1
    if-eqz p2, :cond_6

    .line 60
    .line 61
    invoke-virtual {p7}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    sub-int/2addr p1, p0

    .line 70
    return p1

    .line 71
    :cond_6
    invoke-virtual {p0}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-virtual {p7}, Lcom/android/launcher3/AppWidgetResizeFrame$b;->e()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    sub-int/2addr p0, p1

    .line 80
    return p0
.end method

.method public c(I)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 4
    .line 5
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/N5;->c(III)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 4
    .line 5
    return-void
.end method

.method public e()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->b:I

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame$b;->a:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method
