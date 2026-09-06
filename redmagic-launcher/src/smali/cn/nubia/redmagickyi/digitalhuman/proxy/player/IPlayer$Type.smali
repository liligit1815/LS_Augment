.class public final enum Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;
.super Ljava/lang/Enum;
.source "IPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

.field public static final enum SurfaceView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

.field public static final enum TextureView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;


# direct methods
.method private static synthetic $values()[Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;
    .locals 2

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->SurfaceView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 2
    .line 3
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->TextureView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 2
    .line 3
    const-string v1, "SurfaceView"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->SurfaceView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 10
    .line 11
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 12
    .line 13
    const-string v1, "TextureView"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->TextureView:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 20
    .line 21
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->$values()[Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->$VALUES:[Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 26
    .line 27
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

.method public static valueOf(Ljava/lang/String;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;
    .locals 1

    .line 1
    const-class v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->$VALUES:[Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;

    .line 8
    .line 9
    return-object v0
.end method
