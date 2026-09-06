.class public Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;
.super Ljava/lang/Object;
.source "ServerIdCreator.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private serverId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;->serverId:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;->serverId:Ljava/lang/String;

    return-void
.end method

.method public static getDefault()Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;
    .locals 2

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;

    .line 2
    .line 3
    const-string v1, "35df5c04-dbe8-44f6-b007-8fb48c51fb07"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static mine()Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;
    .locals 2

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;

    .line 2
    .line 3
    const-string v1, "mine"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;->serverId:Ljava/lang/String;

    .line 6
    .line 7
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
    const-string v1, "ServerIdCreator{serverId=\'"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;->serverId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const/16 p0, 0x27

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const/16 p0, 0x7d

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;->serverId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
