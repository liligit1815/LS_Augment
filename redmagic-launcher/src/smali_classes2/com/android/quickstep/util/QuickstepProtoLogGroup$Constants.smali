.class final Lcom/android/quickstep/util/QuickstepProtoLogGroup$Constants;
.super Ljava/lang/Object;
.source "QuickstepProtoLogGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/QuickstepProtoLogGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Constants"
.end annotation


# static fields
.field private static final DEBUG_ACTIVE_GESTURE:Z = false

.field private static final DEBUG_RECENTS_WINDOW:Z = false

.field private static final DEBUG_STATE_MANAGER:Z = true

.field private static final LOG_START_ID:I

.field private static final TAG:Ljava/lang/String; = "QuickstepProtoLogGroup"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-class v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/UUID;->nameUUIDFromBytes([B)Ljava/util/UUID;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    const-wide/32 v2, 0x7fffffff

    .line 20
    .line 21
    .line 22
    rem-long/2addr v0, v2

    .line 23
    long-to-int v0, v0

    .line 24
    sput v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup$Constants;->LOG_START_ID:I

    .line 25
    .line 26
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

.method static bridge synthetic a()I
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup$Constants;->LOG_START_ID:I

    .line 2
    .line 3
    return v0
.end method
