.class final Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NightModeReflectionAction"
.end annotation


# instance fields
.field private final mDarkValue:Ljava/lang/Object;

.field private final mLightValue:Ljava/lang/Object;


# direct methods
.method constructor <init>(ILjava/lang/String;ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;-><init>(ILjava/lang/String;I)V

    .line 2
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 3
    iput-object p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 4
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 5
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/16 v1, 0xf

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    .line 6
    sget-object v0, Landroid/graphics/drawable/Icon;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    return-void

    .line 8
    :cond_0
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected night mode action type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_1
    sget-object v0, Landroid/content/res/ColorStateList;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 10
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    return-void

    .line 11
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x1e

    .line 2
    .line 3
    return p0
.end method

.method protected getParameterValue(Landroid/view/View;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Landroid/content/res/Configuration;->isNightModeActive()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 23
    .line 24
    return-object p0
.end method

.method public visitUris(Ljava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Landroid/graphics/drawable/Icon;

    .line 10
    .line 11
    invoke-static {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Landroid/graphics/drawable/Icon;

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    const/16 v1, 0xf

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/16 v1, 0x10

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Landroid/os/Parcelable;

    .line 21
    .line 22
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p0, Landroid/os/Parcelable;

    .line 28
    .line 29
    invoke-virtual {p1, p0, p2}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mLightValue:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p2, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;->mDarkValue:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p0, Ljava/lang/Integer;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
