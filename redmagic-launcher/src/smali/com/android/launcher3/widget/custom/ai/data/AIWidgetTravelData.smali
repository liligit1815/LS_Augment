.class public Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;
.super Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;
.source "AIWidgetTravelData.java"


# static fields
.field public static final DATA_KEY_STRING_FLIGHT:Ljava/lang/String; = "flight"

.field public static final DATA_KEY_STRING_HOTEL:Ljava/lang/String; = "hotel"

.field public static final DATA_KEY_STRING_TRAIN:Ljava/lang/String; = "train"

.field public static final TAG:Ljava/lang/String; = "TravelData"


# instance fields
.field public dataKeyString:Ljava/lang/String;

.field public fromStation:Ljava/lang/String;

.field public fromTime:Ljava/lang/String;

.field public toStation:Ljava/lang/String;

.field public toTime:Ljava/lang/String;

.field public travelDate:Ljava/lang/String;

.field public travelNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->travelNumber:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->travelNumber:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->travelDate:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->travelDate:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toTime:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toTime:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromStation:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromStation:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toStation:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toStation:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->dataKeyString:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->dataKeyString:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {p0, p1}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_1

    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    return p0

    .line 81
    :cond_1
    return v1
.end method

.method public isAvailable()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->travelNumber:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromStation:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toStation:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0, v1}, Lcom/android/launcher3/widget/custom/ai/n;->I(Ljava/lang/String;Z)J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    const-wide/16 v4, 0x0

    .line 41
    .line 42
    cmp-long p0, v2, v4

    .line 43
    .line 44
    if-lez p0, :cond_0

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_0
    return v1
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
    const-string v1, "AIWidgetTravelData{travelNumber="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->travelNumber:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", fromStation="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromStation:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", toStation="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toStation:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", fromTime="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", toTime="

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->toTime:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, "}"

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
