.class public final enum LN2/h;
.super Ljava/lang/Enum;
.source "BubbleBarLocation.kt"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN2/h$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LN2/h;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "LN2/h;",
            ">;"
        }
    .end annotation
.end field

.field public static final g:LN2/h$b;

.field public static final enum h:LN2/h;

.field public static final enum i:LN2/h;

.field public static final enum j:LN2/h;

.field private static final synthetic k:[LN2/h;

.field private static final synthetic l:Ln4/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LN2/h;

    .line 2
    .line 3
    const-string v1, "DEFAULT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LN2/h;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LN2/h;->h:LN2/h;

    .line 10
    .line 11
    new-instance v0, LN2/h;

    .line 12
    .line 13
    const-string v1, "LEFT"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, LN2/h;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LN2/h;->i:LN2/h;

    .line 20
    .line 21
    new-instance v0, LN2/h;

    .line 22
    .line 23
    const-string v1, "RIGHT"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, LN2/h;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LN2/h;->j:LN2/h;

    .line 30
    .line 31
    invoke-static {}, LN2/h;->a()[LN2/h;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, LN2/h;->k:[LN2/h;

    .line 36
    .line 37
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, LN2/h;->l:Ln4/a;

    .line 42
    .line 43
    new-instance v0, LN2/h$b;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-direct {v0, v1}, LN2/h$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, LN2/h;->g:LN2/h$b;

    .line 50
    .line 51
    new-instance v0, LN2/h$a;

    .line 52
    .line 53
    invoke-direct {v0}, LN2/h$a;-><init>()V

    .line 54
    .line 55
    .line 56
    sput-object v0, LN2/h;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 57
    .line 58
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

.method private static final synthetic a()[LN2/h;
    .locals 3

    .line 1
    sget-object v0, LN2/h;->h:LN2/h;

    .line 2
    .line 3
    sget-object v1, LN2/h;->i:LN2/h;

    .line 4
    .line 5
    sget-object v2, LN2/h;->j:LN2/h;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [LN2/h;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LN2/h;
    .locals 1

    .line 1
    const-class v0, LN2/h;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LN2/h;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LN2/h;
    .locals 1

    .line 1
    sget-object v0, LN2/h;->k:[LN2/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LN2/h;

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

.method public final e(Z)Z
    .locals 1

    .line 1
    sget-object v0, LN2/h;->h:LN2/h;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    return p1

    .line 6
    :cond_0
    sget-object p1, LN2/h;->i:LN2/h;

    .line 7
    .line 8
    if-ne p0, p1, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_1
    const/4 p0, 0x0

    .line 13
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
