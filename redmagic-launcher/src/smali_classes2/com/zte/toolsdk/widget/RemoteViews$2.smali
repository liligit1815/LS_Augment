.class Lcom/zte/toolsdk/widget/RemoteViews$2;
.super Ljava/lang/Object;
.source "RemoteViews.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/zte/toolsdk/widget/RemoteViews;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 2
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;)V

    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$2;->createFromParcel(Landroid/os/Parcel;)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public newArray(I)[Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 2
    new-array p0, p1, [Lcom/zte/toolsdk/widget/RemoteViews;

    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$2;->newArray(I)[Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method
