.class Lcom/android/launcher3/widget/custom/bubble/l$b;
.super Landroid/content/BroadcastReceiver;
.source "AIBubbleWidgetDataHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/bubble/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/widget/custom/bubble/l;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/bubble/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/l$b;->a:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, ""

    .line 9
    .line 10
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v0, "mDateChangedOrSetTimeReceiver action="

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "AIBubbleWidgetDataHelper"

    .line 28
    .line 29
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    const-string p2, "android.intent.action.DATE_CHANGED"

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    const-string v0, "android.intent.action.TIME_SET"

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    const-string v0, "android.intent.action.TIMEZONE_CHANGED"

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/l$b;->a:Lcom/android/launcher3/widget/custom/bubble/l;

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/custom/bubble/l;->g(Lcom/android/launcher3/widget/custom/bubble/l;Z)V

    .line 60
    .line 61
    .line 62
    :cond_2
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/l;->n(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getFloatingLayout()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->h0()V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    return-void
.end method
