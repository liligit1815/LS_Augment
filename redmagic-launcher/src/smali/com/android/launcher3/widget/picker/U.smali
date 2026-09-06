.class final enum Lcom/android/launcher3/widget/picker/U;
.super Ljava/lang/Enum;
.source "WidgetsListDrawableState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/widget/picker/U;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:Lcom/android/launcher3/widget/picker/U;

.field public static final enum i:Lcom/android/launcher3/widget/picker/U;

.field public static final enum j:Lcom/android/launcher3/widget/picker/U;

.field public static final enum k:Lcom/android/launcher3/widget/picker/U;

.field private static final synthetic l:[Lcom/android/launcher3/widget/picker/U;


# instance fields
.field final g:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/U;

    .line 2
    .line 3
    const v1, 0x10100a4

    .line 4
    .line 5
    .line 6
    filled-new-array {v1}, [I

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "FIRST"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-direct {v0, v2, v3, v1}, Lcom/android/launcher3/widget/picker/U;-><init>(Ljava/lang/String;I[I)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/android/launcher3/widget/picker/U;->h:Lcom/android/launcher3/widget/picker/U;

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/widget/picker/U;

    .line 19
    .line 20
    const v1, 0x10100a5

    .line 21
    .line 22
    .line 23
    filled-new-array {v1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "MIDDLE"

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-direct {v0, v2, v3, v1}, Lcom/android/launcher3/widget/picker/U;-><init>(Ljava/lang/String;I[I)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/android/launcher3/widget/picker/U;->i:Lcom/android/launcher3/widget/picker/U;

    .line 34
    .line 35
    new-instance v0, Lcom/android/launcher3/widget/picker/U;

    .line 36
    .line 37
    const v1, 0x10100a6

    .line 38
    .line 39
    .line 40
    filled-new-array {v1}, [I

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "LAST"

    .line 45
    .line 46
    const/4 v3, 0x2

    .line 47
    invoke-direct {v0, v2, v3, v1}, Lcom/android/launcher3/widget/picker/U;-><init>(Ljava/lang/String;I[I)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/android/launcher3/widget/picker/U;->j:Lcom/android/launcher3/widget/picker/U;

    .line 51
    .line 52
    new-instance v0, Lcom/android/launcher3/widget/picker/U;

    .line 53
    .line 54
    const v1, 0x10100a3

    .line 55
    .line 56
    .line 57
    filled-new-array {v1}, [I

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "SINGLE"

    .line 62
    .line 63
    const/4 v3, 0x3

    .line 64
    invoke-direct {v0, v2, v3, v1}, Lcom/android/launcher3/widget/picker/U;-><init>(Ljava/lang/String;I[I)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/android/launcher3/widget/picker/U;->k:Lcom/android/launcher3/widget/picker/U;

    .line 68
    .line 69
    invoke-static {}, Lcom/android/launcher3/widget/picker/U;->a()[Lcom/android/launcher3/widget/picker/U;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sput-object v0, Lcom/android/launcher3/widget/picker/U;->l:[Lcom/android/launcher3/widget/picker/U;

    .line 74
    .line 75
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/android/launcher3/widget/picker/U;->g:[I

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Lcom/android/launcher3/widget/picker/U;
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/picker/U;->h:Lcom/android/launcher3/widget/picker/U;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/widget/picker/U;->i:Lcom/android/launcher3/widget/picker/U;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/widget/picker/U;->j:Lcom/android/launcher3/widget/picker/U;

    .line 6
    .line 7
    sget-object v3, Lcom/android/launcher3/widget/picker/U;->k:Lcom/android/launcher3/widget/picker/U;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/android/launcher3/widget/picker/U;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static c(ZZ)Lcom/android/launcher3/widget/picker/U;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/widget/picker/U;->k:Lcom/android/launcher3/widget/picker/U;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    sget-object p0, Lcom/android/launcher3/widget/picker/U;->h:Lcom/android/launcher3/widget/picker/U;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    if-eqz p1, :cond_2

    .line 14
    .line 15
    sget-object p0, Lcom/android/launcher3/widget/picker/U;->j:Lcom/android/launcher3/widget/picker/U;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    sget-object p0, Lcom/android/launcher3/widget/picker/U;->i:Lcom/android/launcher3/widget/picker/U;

    .line 19
    .line 20
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/widget/picker/U;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/widget/picker/U;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/widget/picker/U;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/widget/picker/U;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/picker/U;->l:[Lcom/android/launcher3/widget/picker/U;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/widget/picker/U;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/widget/picker/U;

    .line 8
    .line 9
    return-object v0
.end method
