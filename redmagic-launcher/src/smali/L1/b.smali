.class public LL1/b;
.super Ljava/lang/Object;
.source "ClockViewUtils.java"


# static fields
.field public static final a:[I

.field private static final b:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const v0, 0x7f0e00c5

    .line 2
    .line 3
    .line 4
    const v1, 0x7f0e0103

    .line 5
    .line 6
    .line 7
    const v2, 0x7f0e0193

    .line 8
    .line 9
    .line 10
    filled-new-array {v2, v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, LL1/b;->a:[I

    .line 15
    .line 16
    const-string v0, "pointer_clock_default"

    .line 17
    .line 18
    const-string v1, "digital_clock_default"

    .line 19
    .line 20
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, LL1/b;->b:[Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public static a(ZLjava/lang/String;)I
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, LL1/b;->b:[Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object p0, LL1/b;->a:[I

    .line 15
    .line 16
    array-length p0, p0

    .line 17
    add-int/lit8 p0, p0, -0x1

    .line 18
    .line 19
    :goto_0
    const/4 p1, -0x1

    .line 20
    if-ne p0, p1, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    :cond_1
    return p0
.end method
