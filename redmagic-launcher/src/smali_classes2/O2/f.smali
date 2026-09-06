.class public final enum LO2/f;
.super Ljava/lang/Enum;
.source "DesktopTaskToFrontReason.kt"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO2/f$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LO2/f;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "LO2/f;",
            ">;"
        }
    .end annotation
.end field

.field public static final g:LO2/f$b;

.field public static final enum h:LO2/f;

.field public static final enum i:LO2/f;

.field public static final enum j:LO2/f;

.field public static final enum k:LO2/f;

.field private static final synthetic l:[LO2/f;

.field private static final synthetic m:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LO2/f;

    .line 2
    .line 3
    const-string v1, "UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LO2/f;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LO2/f;->h:LO2/f;

    .line 10
    .line 11
    new-instance v0, LO2/f;

    .line 12
    .line 13
    const-string v1, "TASKBAR_TAP"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LO2/f;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LO2/f;->i:LO2/f;

    .line 20
    .line 21
    new-instance v0, LO2/f;

    .line 22
    .line 23
    const-string v1, "ALT_TAB"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LO2/f;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LO2/f;->j:LO2/f;

    .line 30
    .line 31
    new-instance v0, LO2/f;

    .line 32
    .line 33
    const-string v1, "TASKBAR_MANAGE_WINDOW"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LO2/f;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LO2/f;->k:LO2/f;

    .line 40
    .line 41
    invoke-static {}, LO2/f;->a()[LO2/f;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, LO2/f;->l:[LO2/f;

    .line 46
    .line 47
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, LO2/f;->m:Ln4/a;

    .line 52
    .line 53
    new-instance v0, LO2/f$b;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-direct {v0, v1}, LO2/f$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, LO2/f;->g:LO2/f$b;

    .line 60
    .line 61
    new-instance v0, LO2/f$a;

    .line 62
    .line 63
    invoke-direct {v0}, LO2/f$a;-><init>()V

    .line 64
    .line 65
    .line 66
    sput-object v0, LO2/f;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 67
    .line 68
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

.method private static final synthetic a()[LO2/f;
    .locals 4

    .line 1
    sget-object v0, LO2/f;->h:LO2/f;

    .line 2
    .line 3
    sget-object v1, LO2/f;->i:LO2/f;

    .line 4
    .line 5
    sget-object v2, LO2/f;->j:LO2/f;

    .line 6
    .line 7
    sget-object v3, LO2/f;->k:LO2/f;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [LO2/f;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LO2/f;
    .locals 1

    .line 1
    const-class v0, LO2/f;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LO2/f;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LO2/f;
    .locals 1

    .line 1
    sget-object v0, LO2/f;->l:[LO2/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LO2/f;

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
    const-string p2, "dest"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
