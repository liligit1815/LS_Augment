.class public abstract LH3/d;
.super Ljava/lang/Object;


# static fields
.field private static a:LH3/d;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(II)I
    .locals 4

    .line 1
    const/16 v0, 0x29

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    const/16 v2, 0xf

    .line 6
    .line 7
    const/16 v3, 0x32

    .line 8
    .line 9
    if-lt p1, v0, :cond_2

    .line 10
    .line 11
    const/16 v0, 0x44

    .line 12
    .line 13
    if-gt p1, v0, :cond_2

    .line 14
    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    if-ge p0, v3, :cond_0

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    const/16 p1, 0x4b

    .line 21
    .line 22
    if-lt p0, v3, :cond_1

    .line 23
    .line 24
    if-ge p0, p1, :cond_1

    .line 25
    .line 26
    const/16 p0, 0x14

    .line 27
    .line 28
    return p0

    .line 29
    :cond_1
    if-lt p0, p1, :cond_4

    .line 30
    .line 31
    if-gt p0, v1, :cond_4

    .line 32
    .line 33
    const/16 p0, 0x1e

    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    if-lez p0, :cond_3

    .line 37
    .line 38
    if-ge p0, v3, :cond_3

    .line 39
    .line 40
    const/16 p0, 0xa

    .line 41
    .line 42
    return p0

    .line 43
    :cond_3
    if-lt p0, v3, :cond_4

    .line 44
    .line 45
    if-gt p0, v1, :cond_4

    .line 46
    .line 47
    return v2

    .line 48
    :cond_4
    const/4 p0, 0x0

    .line 49
    return p0
.end method

.method public static b(Landroid/content/Context;)LH3/d;
    .locals 2

    .line 1
    sget-object v0, LH3/d;->a:LH3/d;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, LH3/d;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, LH3/d;->a:LH3/d;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, LH3/e;

    .line 13
    .line 14
    invoke-direct {v1, p0}, LH3/e;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, LH3/d;->a:LH3/d;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, LH3/d;->a:LH3/d;

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public abstract c()V
.end method

.method public abstract d(Ljava/lang/String;IIII)V
.end method
