.class public final enum Lcom/android/launcher3/logger/d$b;
.super Ljava/lang/Enum;
.source "LauncherAtomExtensions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/logger/d$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:Lcom/android/launcher3/logger/d$b;

.field public static final enum i:Lcom/android/launcher3/logger/d$b;

.field private static final synthetic j:[Lcom/android/launcher3/logger/d$b;


# instance fields
.field private final g:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/logger/d$b;

    .line 2
    .line 3
    const-string v1, "DEVICE_SEARCH_RESULT_CONTAINER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher3/logger/d$b;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/logger/d$b;->h:Lcom/android/launcher3/logger/d$b;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/logger/d$b;

    .line 13
    .line 14
    const-string v1, "CONTAINER_NOT_SET"

    .line 15
    .line 16
    invoke-direct {v0, v1, v3, v2}, Lcom/android/launcher3/logger/d$b;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/logger/d$b;->i:Lcom/android/launcher3/logger/d$b;

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/logger/d$b;->a()[Lcom/android/launcher3/logger/d$b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/android/launcher3/logger/d$b;->j:[Lcom/android/launcher3/logger/d$b;

    .line 26
    .line 27
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
    iput p3, p0, Lcom/android/launcher3/logger/d$b;->g:I

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Lcom/android/launcher3/logger/d$b;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/d$b;->h:Lcom/android/launcher3/logger/d$b;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/logger/d$b;->i:Lcom/android/launcher3/logger/d$b;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/android/launcher3/logger/d$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static c(I)Lcom/android/launcher3/logger/d$b;
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Lcom/android/launcher3/logger/d$b;->h:Lcom/android/launcher3/logger/d$b;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    sget-object p0, Lcom/android/launcher3/logger/d$b;->i:Lcom/android/launcher3/logger/d$b;

    .line 12
    .line 13
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/logger/d$b;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/logger/d$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/logger/d$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/logger/d$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/d$b;->j:[Lcom/android/launcher3/logger/d$b;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/logger/d$b;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/logger/d$b;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/logger/d$b;->g:I

    .line 2
    .line 3
    return p0
.end method
