.class public final enum LO2/e;
.super Ljava/lang/Enum;
.source "DesktopModeTransitionSource.kt"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO2/e$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LO2/e;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "LO2/e;",
            ">;"
        }
    .end annotation
.end field

.field public static final g:LO2/e$b;

.field public static final enum h:LO2/e;

.field public static final enum i:LO2/e;

.field public static final enum j:LO2/e;

.field public static final enum k:LO2/e;

.field public static final enum l:LO2/e;

.field private static final synthetic m:[LO2/e;

.field private static final synthetic n:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LO2/e;

    .line 2
    .line 3
    const-string v1, "TASK_DRAG"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LO2/e;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LO2/e;->h:LO2/e;

    .line 10
    .line 11
    new-instance v0, LO2/e;

    .line 12
    .line 13
    const-string v1, "APP_FROM_OVERVIEW"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LO2/e;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LO2/e;->i:LO2/e;

    .line 20
    .line 21
    new-instance v0, LO2/e;

    .line 22
    .line 23
    const-string v1, "APP_HANDLE_MENU_BUTTON"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LO2/e;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LO2/e;->j:LO2/e;

    .line 30
    .line 31
    new-instance v0, LO2/e;

    .line 32
    .line 33
    const-string v1, "KEYBOARD_SHORTCUT"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, LO2/e;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, LO2/e;->k:LO2/e;

    .line 40
    .line 41
    new-instance v0, LO2/e;

    .line 42
    .line 43
    const-string v1, "UNKNOWN"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, LO2/e;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, LO2/e;->l:LO2/e;

    .line 50
    .line 51
    invoke-static {}, LO2/e;->a()[LO2/e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, LO2/e;->m:[LO2/e;

    .line 56
    .line 57
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, LO2/e;->n:Ln4/a;

    .line 62
    .line 63
    new-instance v0, LO2/e$b;

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    invoke-direct {v0, v1}, LO2/e$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, LO2/e;->g:LO2/e$b;

    .line 70
    .line 71
    new-instance v0, LO2/e$a;

    .line 72
    .line 73
    invoke-direct {v0}, LO2/e$a;-><init>()V

    .line 74
    .line 75
    .line 76
    sput-object v0, LO2/e;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 77
    .line 78
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

.method private static final synthetic a()[LO2/e;
    .locals 5

    .line 1
    sget-object v0, LO2/e;->h:LO2/e;

    .line 2
    .line 3
    sget-object v1, LO2/e;->i:LO2/e;

    .line 4
    .line 5
    sget-object v2, LO2/e;->j:LO2/e;

    .line 6
    .line 7
    sget-object v3, LO2/e;->k:LO2/e;

    .line 8
    .line 9
    sget-object v4, LO2/e;->l:LO2/e;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [LO2/e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LO2/e;
    .locals 1

    .line 1
    const-class v0, LO2/e;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LO2/e;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LO2/e;
    .locals 1

    .line 1
    sget-object v0, LO2/e;->m:[LO2/e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LO2/e;

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
