.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$e;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleContainer.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)I
    .locals 6

    .line 1
    if-eqz p1, :cond_8

    .line 2
    .line 3
    if-eqz p2, :cond_8

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_8

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p2, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/4 v0, -0x1

    .line 27
    const/4 v1, 0x1

    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    iget-boolean p0, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->doubleApp:Z

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    return v1

    .line 35
    :cond_1
    return v0

    .line 36
    :cond_2
    invoke-static {}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {p0, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-static {}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v3, p2, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 51
    .line 52
    invoke-interface {v2, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-ltz p0, :cond_3

    .line 57
    .line 58
    if-ltz v2, :cond_3

    .line 59
    .line 60
    sub-int/2addr p0, v2

    .line 61
    return p0

    .line 62
    :cond_3
    if-ltz p0, :cond_4

    .line 63
    .line 64
    if-gez v2, :cond_4

    .line 65
    .line 66
    return v0

    .line 67
    :cond_4
    if-gez p0, :cond_5

    .line 68
    .line 69
    if-ltz v2, :cond_5

    .line 70
    .line 71
    return v1

    .line 72
    :cond_5
    iget-wide v2, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->time:J

    .line 73
    .line 74
    iget-wide v4, p2, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->time:J

    .line 75
    .line 76
    cmp-long p0, v2, v4

    .line 77
    .line 78
    if-eqz p0, :cond_7

    .line 79
    .line 80
    cmp-long p0, v2, v4

    .line 81
    .line 82
    if-ltz p0, :cond_6

    .line 83
    .line 84
    return v0

    .line 85
    :cond_6
    return v1

    .line 86
    :cond_7
    iget-object p0, p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 87
    .line 88
    iget-object p1, p2, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    return p0

    .line 95
    :cond_8
    :goto_0
    const/4 p0, 0x0

    .line 96
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$e;->a(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
