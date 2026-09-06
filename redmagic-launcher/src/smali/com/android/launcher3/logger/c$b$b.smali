.class public final enum Lcom/android/launcher3/logger/c$b$b;
.super Ljava/lang/Enum;
.source "LauncherAtomExtensions.java"

# interfaces
.implements Lcom/google/protobuf/A$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/c$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/logger/c$b$b$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/logger/c$b$b;",
        ">;",
        "Lcom/google/protobuf/A$c;"
    }
.end annotation


# static fields
.field public static final enum h:Lcom/android/launcher3/logger/c$b$b;

.field public static final enum i:Lcom/android/launcher3/logger/c$b$b;

.field public static final enum j:Lcom/android/launcher3/logger/c$b$b;

.field public static final enum k:Lcom/android/launcher3/logger/c$b$b;

.field public static final enum l:Lcom/android/launcher3/logger/c$b$b;

.field private static final m:Lcom/google/protobuf/A$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/A$d<",
            "Lcom/android/launcher3/logger/c$b$b;",
            ">;"
        }
    .end annotation
.end field

.field private static final synthetic n:[Lcom/android/launcher3/logger/c$b$b;


# instance fields
.field private final g:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/logger/c$b$b;

    .line 2
    .line 3
    const-string v1, "ENTRY_STATE_UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logger/c$b$b;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/launcher3/logger/c$b$b;->h:Lcom/android/launcher3/logger/c$b$b;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/logger/c$b$b;

    .line 12
    .line 13
    const-string v1, "ALL_APPS"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logger/c$b$b;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/logger/c$b$b;->i:Lcom/android/launcher3/logger/c$b$b;

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/logger/c$b$b;

    .line 22
    .line 23
    const-string v1, "QSB"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logger/c$b$b;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/launcher3/logger/c$b$b;->j:Lcom/android/launcher3/logger/c$b$b;

    .line 30
    .line 31
    new-instance v0, Lcom/android/launcher3/logger/c$b$b;

    .line 32
    .line 33
    const-string v1, "OVERVIEW"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logger/c$b$b;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/android/launcher3/logger/c$b$b;->k:Lcom/android/launcher3/logger/c$b$b;

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/logger/c$b$b;

    .line 42
    .line 43
    const-string v1, "TASKBAR"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logger/c$b$b;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/android/launcher3/logger/c$b$b;->l:Lcom/android/launcher3/logger/c$b$b;

    .line 50
    .line 51
    invoke-static {}, Lcom/android/launcher3/logger/c$b$b;->a()[Lcom/android/launcher3/logger/c$b$b;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lcom/android/launcher3/logger/c$b$b;->n:[Lcom/android/launcher3/logger/c$b$b;

    .line 56
    .line 57
    new-instance v0, Lcom/android/launcher3/logger/c$b$b$a;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/android/launcher3/logger/c$b$b$a;-><init>()V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lcom/android/launcher3/logger/c$b$b;->m:Lcom/google/protobuf/A$d;

    .line 63
    .line 64
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/android/launcher3/logger/c$b$b;->g:I

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Lcom/android/launcher3/logger/c$b$b;
    .locals 5

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/c$b$b;->h:Lcom/android/launcher3/logger/c$b$b;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/logger/c$b$b;->i:Lcom/android/launcher3/logger/c$b$b;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/logger/c$b$b;->j:Lcom/android/launcher3/logger/c$b$b;

    .line 6
    .line 7
    sget-object v3, Lcom/android/launcher3/logger/c$b$b;->k:Lcom/android/launcher3/logger/c$b$b;

    .line 8
    .line 9
    sget-object v4, Lcom/android/launcher3/logger/c$b$b;->l:Lcom/android/launcher3/logger/c$b$b;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/android/launcher3/logger/c$b$b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static c(I)Lcom/android/launcher3/logger/c$b$b;
    .locals 1

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    sget-object p0, Lcom/android/launcher3/logger/c$b$b;->l:Lcom/android/launcher3/logger/c$b$b;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_1
    sget-object p0, Lcom/android/launcher3/logger/c$b$b;->k:Lcom/android/launcher3/logger/c$b$b;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_2
    sget-object p0, Lcom/android/launcher3/logger/c$b$b;->j:Lcom/android/launcher3/logger/c$b$b;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_3
    sget-object p0, Lcom/android/launcher3/logger/c$b$b;->i:Lcom/android/launcher3/logger/c$b$b;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_4
    sget-object p0, Lcom/android/launcher3/logger/c$b$b;->h:Lcom/android/launcher3/logger/c$b$b;

    .line 30
    .line 31
    return-object p0
.end method

.method public static d()Lcom/google/protobuf/A$e;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/c$b$b$b;->a:Lcom/google/protobuf/A$e;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/logger/c$b$b;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/logger/c$b$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/logger/c$b$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/logger/c$b$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/c$b$b;->n:[Lcom/android/launcher3/logger/c$b$b;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/logger/c$b$b;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/logger/c$b$b;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/logger/c$b$b;->g:I

    .line 2
    .line 3
    return p0
.end method
