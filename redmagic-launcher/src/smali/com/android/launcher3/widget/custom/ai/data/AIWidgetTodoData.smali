.class public Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;
.super Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;
.source "AIWidgetTodoData.java"


# instance fields
.field private mAllDay:Z

.field private mEndTime:Ljava/lang/String;

.field private mEndTimeLong:J

.field private mEventId:Ljava/lang/Long;

.field private mEventType:I

.field private mPlace:Ljava/lang/String;

.field private mStartTime:Ljava/lang/String;

.field private mStartTimeLong:J

.field private mTitle:Ljava/lang/String;


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
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

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
    check-cast p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mTitle:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mTitle:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mStartTime:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mStartTime:Ljava/lang/String;

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
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mAllDay:Z

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-boolean v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mAllDay:Z

    .line 36
    .line 37
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEndTime:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEndTime:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEventType:I

    .line 58
    .line 59
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget v2, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEventType:I

    .line 64
    .line 65
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v0, v2}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mPlace:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mPlace:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p0, p1}, Lx1/O;->p5(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_1

    .line 84
    .line 85
    const/4 p0, 0x1

    .line 86
    return p0

    .line 87
    :cond_1
    return v1
.end method

.method public getEndTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEndTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndTimeLong()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEndTimeLong:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEventId()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEventId:Ljava/lang/Long;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getEventType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEventType:I

    .line 2
    .line 3
    return p0
.end method

.method public getPlace()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mPlace:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mStartTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartTimeLong()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mStartTimeLong:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mTitle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public isAllDay()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mAllDay:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAllDay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mAllDay:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEndTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEndTime:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setEndTimeLong(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEndTimeLong:J

    .line 2
    .line 3
    return-void
.end method

.method public setEventId(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEventId:Ljava/lang/Long;

    .line 6
    .line 7
    return-void
.end method

.method public setEventType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEventType:I

    .line 2
    .line 3
    return-void
.end method

.method public setPlace(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mPlace:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStartTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mStartTime:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStartTimeLong(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mStartTimeLong:J

    .line 2
    .line 3
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mTitle:Ljava/lang/String;

    .line 2
    .line 3
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
    const-string v1, "AIWidgetTodoData{t= "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mTitle:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " type="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEventType:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, " allDay="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, " s="

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mStartTime:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v1, " e="

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->mEndTime:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p0, "}"

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method
