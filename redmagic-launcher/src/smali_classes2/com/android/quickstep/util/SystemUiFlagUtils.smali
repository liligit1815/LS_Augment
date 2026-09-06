.class public final Lcom/android/quickstep/util/SystemUiFlagUtils;
.super Ljava/lang/Object;
.source "SystemUiFlagUtils.kt"


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/SystemUiFlagUtils;

.field public static final KEYGUARD_SYSUI_FLAGS:J = 0x306003c8L

.field private static final MASK_ANY_SYSUI_LOCKED:J = 0x8000248L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SystemUiFlagUtils;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/SystemUiFlagUtils;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/SystemUiFlagUtils;->INSTANCE:Lcom/android/quickstep/util/SystemUiFlagUtils;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final hasAnyFlag(JJ)Z
    .locals 0

    .line 1
    and-long p0, p1, p3

    .line 2
    .line 3
    const-wide/16 p2, 0x0

    .line 4
    .line 5
    cmp-long p0, p0, p2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static final isLocked(J)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/util/SystemUiFlagUtils;->INSTANCE:Lcom/android/quickstep/util/SystemUiFlagUtils;

    .line 2
    .line 3
    const-wide/32 v1, 0x8000248

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->hasAnyFlag(JJ)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-wide v1, 0x80000000L

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->hasAnyFlag(JJ)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static final isTaskbarHidden(J)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/util/SystemUiFlagUtils;->INSTANCE:Lcom/android/quickstep/util/SystemUiFlagUtils;

    .line 2
    .line 3
    const-wide/32 v1, 0x8000000

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->hasAnyFlag(JJ)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-wide v1, 0x800000000L

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    invoke-direct {v0, p0, p1, v1, v2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->hasAnyFlag(JJ)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    const-wide/32 v0, 0x30000000

    .line 24
    .line 25
    .line 26
    and-long/2addr p0, v0

    .line 27
    const-wide/32 v0, 0x10000000

    .line 28
    .line 29
    .line 30
    cmp-long p0, p0, v0

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    :cond_1
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    return p0
.end method
