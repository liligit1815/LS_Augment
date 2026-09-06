.class public Lcom/zte/toolsdk/common/CardMessage;
.super Ljava/lang/Object;
.source "CardMessage.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/common/CardMessage$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/zte/toolsdk/common/CardMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final KEY_DISPLAY_PRIORITY:Ljava/lang/String; = "display_priority"

.field public static final KEY_DISPLAY_STYLE:Ljava/lang/String; = "display_style"

.field public static final KEY_LAUNCH_ACTION:Ljava/lang/String; = "launch_action"

.field public static final KEY_MINI_CARD:Ljava/lang/String; = "mini_remote_views"

.field public static final KEY_SMALL_CARD:Ljava/lang/String; = "small_remote_views"

.field public static final PRIORITY_LARGE:I = 0x1

.field public static final PRIORITY_SMALL:I = 0x2

.field public static final STYLE_COLORED:I = 0x2

.field public static final STYLE_TRANSPARENT:I = 0x1

.field public static final TYPE_PUSH_CARD:I = 0x1

.field public static final TYPE_REMOVE_CARD:I = 0x3

.field public static final TYPE_RESPONSE:I = 0x4

.field public static final TYPE_UPDATE_CARD:I = 0x2


# instance fields
.field private cardId:Ljava/lang/String;

.field private extraData:Landroid/os/Bundle;

.field private messageType:I

.field private receiverPackage:Ljava/lang/String;

.field private remoteViews:Lcom/zte/toolsdk/widget/RemoteViews;

.field private senderPackage:Ljava/lang/String;

.field private timestamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/common/CardMessage$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/common/CardMessage$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/toolsdk/common/CardMessage;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/zte/toolsdk/common/CardMessage;->timestamp:J

    .line 3
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput p1, p0, Lcom/zte/toolsdk/common/CardMessage;->messageType:I

    .line 6
    iput-object p2, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 7
    iput-object p3, p0, Lcom/zte/toolsdk/common/CardMessage;->remoteViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/zte/toolsdk/common/CardMessage;->timestamp:J

    .line 9
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iput-object p1, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/common/CardMessage;->messageType:I

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 13
    const-class v0, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->remoteViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->senderPackage:Ljava/lang/String;

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->receiverPackage:Ljava/lang/String;

    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/zte/toolsdk/common/CardMessage;->timestamp:J

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getCardId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->senderPackage:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/zte/toolsdk/common/CardMessage;->senderPackage:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "_"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 37
    .line 38
    return-object p0
.end method

.method public getCardPriority(Landroid/content/Context;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->getOriginalCardId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\\d"

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1, p0}, Lcom/zte/toolsdk/utils/CardPriorityUtil;->getCardPriority(Landroid/content/Context;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public getDisplayPriority()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const-string v2, "display_priority"

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 15
    .line 16
    invoke-virtual {p0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    return v1
.end method

.method public getDisplayStyle()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const-string v2, "display_style"

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 15
    .line 16
    invoke-virtual {p0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    return v1
.end method

.method public getExtraData()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLaunchAction()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "launch_action"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public getMessageType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/common/CardMessage;->messageType:I

    .line 2
    .line 3
    return p0
.end method

.method public getMiniRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "mini_remote_views"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public getOriginalCardId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReceiverPackage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->receiverPackage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->remoteViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSenderPackage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->senderPackage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSmallRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "small_remote_views"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public getTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/zte/toolsdk/common/CardMessage;->timestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasMiniCard()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->getMiniRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public hasSmallCard()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->getSmallRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public putExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 1
    instance-of v0, p2, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 6
    .line 7
    check-cast p2, Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    instance-of v0, p2, Ljava/lang/Integer;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 18
    .line 19
    check-cast p2, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    instance-of v0, p2, Ljava/lang/Long;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 34
    .line 35
    check-cast p2, Ljava/lang/Long;

    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    instance-of v0, p2, Ljava/lang/Boolean;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 50
    .line 51
    check-cast p2, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    instance-of v0, p2, Landroid/os/Bundle;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 66
    .line 67
    check-cast p2, Landroid/os/Bundle;

    .line 68
    .line 69
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_4
    instance-of v0, p2, Landroid/os/Parcelable;

    .line 74
    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 78
    .line 79
    check-cast p2, Landroid/os/Parcelable;

    .line 80
    .line 81
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 82
    .line 83
    .line 84
    :cond_5
    return-void
.end method

.method public setCardId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDisplayPriority(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 13
    .line 14
    const-string v0, "display_priority"

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setDisplayStyle(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 13
    .line 14
    const-string v0, "display_style"

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setExtraData(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    return-void
.end method

.method public setLaunchAction(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 11
    .line 12
    :cond_0
    const-string v0, "launch_action"

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setMessageType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/toolsdk/common/CardMessage;->messageType:I

    .line 2
    .line 3
    return-void
.end method

.method public setMiniRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 11
    .line 12
    :cond_0
    const-string v0, "mini_remote_views"

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setReceiverPackage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/CardMessage;->receiverPackage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/CardMessage;->remoteViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    return-void
.end method

.method public setSenderPackage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/common/CardMessage;->senderPackage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSmallRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 11
    .line 12
    :cond_0
    const-string v0, "small_remote_views"

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/zte/toolsdk/common/CardMessage;->timestamp:J

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "CardMessage{messageType="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/zte/toolsdk/common/CardMessage;->messageType:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", fullCardId=\'"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->getCardId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const/16 v1, 0x27

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, ", originalCardId=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, ", hasLarge="

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/zte/toolsdk/common/CardMessage;->remoteViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 52
    .line 53
    if-eqz v2, :cond_0

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const/4 v2, 0x0

    .line 58
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v2, ", hasSmall="

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->hasSmallCard()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v2, ", hasMini="

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->hasMiniCard()Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v2, ", displayPriority="

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->getDisplayPriority()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v2, ", displayStyle="

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->getDisplayStyle()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v2, ", launchAction=\'"

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/CardMessage;->getLaunchAction()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v2, ", senderPackage=\'"

    .line 125
    .line 126
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Lcom/zte/toolsdk/common/CardMessage;->senderPackage:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v2, ", receiverPackage=\'"

    .line 138
    .line 139
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v2, p0, Lcom/zte/toolsdk/common/CardMessage;->receiverPackage:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v1, ", timestamp="

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    iget-wide v1, p0, Lcom/zte/toolsdk/common/CardMessage;->timestamp:J

    .line 156
    .line 157
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const/16 p0, 0x7d

    .line 161
    .line 162
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/common/CardMessage;->messageType:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->cardId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/toolsdk/common/CardMessage;->remoteViews:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 12
    .line 13
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/zte/toolsdk/common/CardMessage;->senderPackage:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/zte/toolsdk/common/CardMessage;->receiverPackage:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-wide v0, p0, Lcom/zte/toolsdk/common/CardMessage;->timestamp:J

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/zte/toolsdk/common/CardMessage;->extraData:Landroid/os/Bundle;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
