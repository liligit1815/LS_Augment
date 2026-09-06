.class public final enum Lv0/B;
.super Ljava/lang/Enum;
.source "RenderMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lv0/B;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:Lv0/B;

.field public static final enum h:Lv0/B;

.field public static final enum i:Lv0/B;

.field private static final synthetic j:[Lv0/B;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lv0/B;

    .line 2
    .line 3
    const-string v1, "AUTOMATIC"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lv0/B;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lv0/B;->g:Lv0/B;

    .line 10
    .line 11
    new-instance v0, Lv0/B;

    .line 12
    .line 13
    const-string v1, "HARDWARE"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lv0/B;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lv0/B;->h:Lv0/B;

    .line 20
    .line 21
    new-instance v0, Lv0/B;

    .line 22
    .line 23
    const-string v1, "SOFTWARE"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lv0/B;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lv0/B;->i:Lv0/B;

    .line 30
    .line 31
    invoke-static {}, Lv0/B;->a()[Lv0/B;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lv0/B;->j:[Lv0/B;

    .line 36
    .line 37
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

.method private static synthetic a()[Lv0/B;
    .locals 3

    .line 1
    sget-object v0, Lv0/B;->g:Lv0/B;

    .line 2
    .line 3
    sget-object v1, Lv0/B;->h:Lv0/B;

    .line 4
    .line 5
    sget-object v2, Lv0/B;->i:Lv0/B;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lv0/B;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lv0/B;
    .locals 1

    .line 1
    const-class v0, Lv0/B;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv0/B;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lv0/B;
    .locals 1

    .line 1
    sget-object v0, Lv0/B;->j:[Lv0/B;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lv0/B;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lv0/B;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public c(IZI)Z
    .locals 3

    .line 1
    sget-object v0, Lv0/B$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq p0, v1, :cond_4

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq p0, v2, :cond_3

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    const/16 p0, 0x1c

    .line 19
    .line 20
    if-ge p1, p0, :cond_0

    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    const/4 p0, 0x4

    .line 24
    if-le p3, p0, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    const/16 p0, 0x19

    .line 28
    .line 29
    if-gt p1, p0, :cond_2

    .line 30
    .line 31
    return v1

    .line 32
    :cond_2
    return v0

    .line 33
    :cond_3
    return v1

    .line 34
    :cond_4
    return v0
.end method
