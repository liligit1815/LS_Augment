.class public final enum Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;
.super Ljava/lang/Enum;
.source "MotionVia.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum Care:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

.field public static final enum Emotion:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

.field public static final enum Specify:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

.field public static final enum TouchEvent:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;


# direct methods
.method private static synthetic $values()[Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;
    .locals 4

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->Emotion:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 2
    .line 3
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->Care:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 4
    .line 5
    sget-object v2, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->Specify:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 6
    .line 7
    sget-object v3, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->TouchEvent:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 2
    .line 3
    const-string v1, "Emotion"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->Emotion:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 10
    .line 11
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 12
    .line 13
    const-string v1, "Care"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->Care:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 20
    .line 21
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 22
    .line 23
    const-string v1, "Specify"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->Specify:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 30
    .line 31
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 32
    .line 33
    const-string v1, "TouchEvent"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->TouchEvent:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 40
    .line 41
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->$values()[Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->$VALUES:[Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 46
    .line 47
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia$1;

    .line 48
    .line 49
    invoke-direct {v0}, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia$1;-><init>()V

    .line 50
    .line 51
    .line 52
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 53
    .line 54
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

.method public static valueOf(Ljava/lang/String;)Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;
    .locals 1

    .line 1
    const-class v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->$VALUES:[Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

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
