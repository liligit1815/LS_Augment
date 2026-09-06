.class public Lcom/zte/toolsdk/common/ToolsResult;
.super Ljava/lang/Object;
.source "ToolsResult.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/common/ToolsResult$AssistantState;,
        Lcom/zte/toolsdk/common/ToolsResult$ToolState;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/zte/toolsdk/common/ToolsResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBundle:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/common/ToolsResult$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/common/ToolsResult$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/toolsdk/common/ToolsResult;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

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

.method public getAssistantState()Lcom/zte/toolsdk/common/ToolsResult$AssistantState;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/ToolsResult;->getShowChatWindow()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    sget-object p0, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->SHOW_CHAT_WINDOW:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0}, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    sget-object p0, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->HIDE_WINDOW_KEEP_ASR:Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :goto_1
    const-string v1, "assistantState"

    .line 25
    .line 26
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->fromValue(I)Lcom/zte/toolsdk/common/ToolsResult$AssistantState;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public getCardId()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string v1, "cardId"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public getFinish()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string v1, "finish"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public getFromUser()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string v1, "fromUser"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public getLongRunningWork()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string v1, "longRunningWork"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public getPlaySpeech()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "playSpeech"

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public getRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "remoteViews"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getReplace()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string v1, "replace"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "response"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getShowChatWindow()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "showChatWindow"

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "text"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getToUserContent()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "toUserContent"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getToolState()Lcom/zte/toolsdk/common/ToolsResult$ToolState;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->COMPLETE:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object v0, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->COMPLETE:Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->getValue()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, "toolState"

    .line 15
    .line 16
    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->fromValue(I)Lcom/zte/toolsdk/common/ToolsResult$ToolState;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public setAssistantState(Lcom/zte/toolsdk/common/ToolsResult$AssistantState;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "assistantState"

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/zte/toolsdk/common/ToolsResult$AssistantState;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setCardId(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "cardId"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setFinish(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "finish"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setFromUser(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "fromUser"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setLongRunningWork(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "longRunningWork"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setPlaySpeech(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "playSpeech"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "remoteViews"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setReplace(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "replace"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setResponse(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "response"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setShowChatWindow(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "showChatWindow"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "text"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setToUserContent(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "toUserContent"

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setToolState(Lcom/zte/toolsdk/common/ToolsResult$ToolState;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "toolState"

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/zte/toolsdk/common/ToolsResult$ToolState;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/common/ToolsResult;->mBundle:Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr p0, p2

    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string p2, "Parcel size: "

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, " bytes"

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "ToolsResult"

    .line 38
    .line 39
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    return-void
.end method
