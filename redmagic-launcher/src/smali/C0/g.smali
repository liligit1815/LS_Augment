.class public final enum LC0/g;
.super Ljava/lang/Enum;
.source "GradientType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LC0/g;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:LC0/g;

.field public static final enum h:LC0/g;

.field private static final synthetic i:[LC0/g;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LC0/g;

    .line 2
    .line 3
    const-string v1, "LINEAR"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LC0/g;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LC0/g;->g:LC0/g;

    .line 10
    .line 11
    new-instance v0, LC0/g;

    .line 12
    .line 13
    const-string v1, "RADIAL"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LC0/g;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LC0/g;->h:LC0/g;

    .line 20
    .line 21
    invoke-static {}, LC0/g;->a()[LC0/g;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, LC0/g;->i:[LC0/g;

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

.method private static synthetic a()[LC0/g;
    .locals 2

    .line 1
    sget-object v0, LC0/g;->g:LC0/g;

    .line 2
    .line 3
    sget-object v1, LC0/g;->h:LC0/g;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [LC0/g;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LC0/g;
    .locals 1

    .line 1
    const-class v0, LC0/g;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LC0/g;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LC0/g;
    .locals 1

    .line 1
    sget-object v0, LC0/g;->i:[LC0/g;

    .line 2
    .line 3
    invoke-virtual {v0}, [LC0/g;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LC0/g;

    .line 8
    .line 9
    return-object v0
.end method
