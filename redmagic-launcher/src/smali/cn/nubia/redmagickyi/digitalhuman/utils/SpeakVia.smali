.class public final enum Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;
.super Ljava/lang/Enum;
.source "SpeakVia.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum Client:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

.field public static final enum Server_From_Care:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

.field public static final enum Server_From_Unity:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;


# direct methods
.method private static synthetic $values()[Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;
    .locals 3

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->Client:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 2
    .line 3
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->Server_From_Unity:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 4
    .line 5
    sget-object v2, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->Server_From_Care:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 2
    .line 3
    const-string v1, "Client"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->Client:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 10
    .line 11
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 12
    .line 13
    const-string v1, "Server_From_Unity"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->Server_From_Unity:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 20
    .line 21
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 22
    .line 23
    const-string v1, "Server_From_Care"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->Server_From_Care:Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 30
    .line 31
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->$values()[Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->$VALUES:[Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 36
    .line 37
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia$1;

    .line 38
    .line 39
    invoke-direct {v0}, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia$1;-><init>()V

    .line 40
    .line 41
    .line 42
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 43
    .line 44
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;
    .locals 1

    .line 1
    const-class v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->$VALUES:[Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;

    .line 8
    .line 9
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

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
