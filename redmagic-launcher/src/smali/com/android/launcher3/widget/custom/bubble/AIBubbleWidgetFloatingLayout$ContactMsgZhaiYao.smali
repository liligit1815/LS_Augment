.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;
.super Ljava/lang/Object;
.source "AIBubbleWidgetFloatingLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ContactMsgZhaiYao"
.end annotation

.annotation build Le/a;
.end annotation


# instance fields
.field contactName:Ljava/lang/String;

.field msgDataList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;",
            ">;"
        }
    .end annotation
.end field

.field pendingIntent:Landroid/app/PendingIntent;

.field unreadCount:I

.field zhaiYao:Ljava/lang/String;

.field zhaiYaoQueryKeyWord:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->contactName:Ljava/lang/String;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->msgDataList:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/android/launcher3/widget/custom/bubble/y;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;->a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->isQueryAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->isResultAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->needGetZhaiYao()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->updateMsgDataList(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private isQueryAvailable()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->contactName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->unreadCount:I

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private isResultAvailable()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->contactName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->unreadCount:I

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->msgDataList:Ljava/util/ArrayList;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->zhaiYaoQueryKeyWord:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method private needGetZhaiYao()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->zhaiYaoQueryKeyWord:Ljava/lang/String;

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
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->zhaiYaoQueryKeyWord:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "\n"

    .line 14
    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/16 v0, 0x1e

    .line 26
    .line 27
    if-le p0, v0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    return v1
.end method

.method private updateMsgDataList(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Lcom/android/launcher3/widget/custom/bubble/x;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/android/launcher3/widget/custom/bubble/x;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->M()Ljava/util/Comparator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->msgDataList:Ljava/util/ArrayList;

    .line 39
    .line 40
    new-instance p1, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    move v3, v2

    .line 47
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-ge v2, v4, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;->noteContent:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    add-int/2addr v5, v3

    .line 66
    add-int/lit8 v5, v5, 0x1

    .line 67
    .line 68
    const/16 v6, 0x2bc

    .line 69
    .line 70
    if-ge v5, v6, :cond_1

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    check-cast v5, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;

    .line 77
    .line 78
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    add-int/lit8 v4, v4, 0x1

    .line 86
    .line 87
    add-int/2addr v3, v4

    .line 88
    add-int/lit8 v2, v2, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    add-int/lit8 v2, v2, -0x1

    .line 101
    .line 102
    :goto_1
    if-ltz v2, :cond_3

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;

    .line 109
    .line 110
    iget-object v3, v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$MsgData;->noteContent:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    if-eqz v2, :cond_2

    .line 116
    .line 117
    const-string v3, "\n"

    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    :cond_2
    add-int/lit8 v2, v2, -0x1

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->zhaiYaoQueryKeyWord:Ljava/lang/String;

    .line 141
    .line 142
    return-void

    .line 143
    :cond_4
    :goto_2
    new-instance p1, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->msgDataList:Ljava/util/ArrayList;

    .line 149
    .line 150
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->zhaiYaoQueryKeyWord:Ljava/lang/String;

    .line 151
    .line 152
    return-void
.end method


# virtual methods
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
    const-string v1, "ContactMsgZhaiYao{contactName="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->contactName:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", unreadCount="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->unreadCount:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", pendingIntent="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->pendingIntent:Landroid/app/PendingIntent;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v1, 0x0

    .line 38
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, ", needGetZhaiYao="

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout$ContactMsgZhaiYao;->needGetZhaiYao()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, "}"

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
