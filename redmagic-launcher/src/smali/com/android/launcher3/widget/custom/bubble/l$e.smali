.class Lcom/android/launcher3/widget/custom/bubble/l$e;
.super Ljava/lang/Object;
.source "AIBubbleWidgetDataHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/custom/bubble/l;->t(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:J

.field final synthetic h:Ljava/util/ArrayList;

.field final synthetic i:Ljava/util/ArrayList;

.field final synthetic j:Lcom/android/launcher3/widget/custom/bubble/l;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/l;JLjava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->j:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->g:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->h:Ljava/util/ArrayList;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->i:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "asyncGetSettingsAIBubbleDataListAndRefreshViews mainThreadRunnable on delay update="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-wide v1, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->g:J

    .line 12
    .line 13
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->j:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 14
    .line 15
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/bubble/l;->e(Lcom/android/launcher3/widget/custom/bubble/l;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    cmp-long v1, v1, v3

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, " list="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->h:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, " curAsyncTime="

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-wide v4, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->g:J

    .line 47
    .line 48
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, " mLastAsyncGetTime="

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->j:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 57
    .line 58
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/bubble/l;->e(Lcom/android/launcher3/widget/custom/bubble/l;)J

    .line 59
    .line 60
    .line 61
    move-result-wide v4

    .line 62
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "AIBubbleWidgetDataHelper"

    .line 70
    .line 71
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    iget-wide v0, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->g:J

    .line 75
    .line 76
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->j:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 77
    .line 78
    invoke-static {v4}, Lcom/android/launcher3/widget/custom/bubble/l;->e(Lcom/android/launcher3/widget/custom/bubble/l;)J

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    cmp-long v0, v0, v4

    .line 83
    .line 84
    if-nez v0, :cond_1

    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->i:Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_1

    .line 97
    .line 98
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getBubbleContainer()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/l$e;->h:Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-virtual {v1, v2, v4, v3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->Q(ZLjava/util/ArrayList;Z)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    return-void
.end method
