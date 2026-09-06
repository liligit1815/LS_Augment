.class public final Lcom/android/quickstep/util/ChoreographerFrameRateTracker;
.super Ljava/lang/Object;
.source "ChoreographerFrameRateTracker.kt"

# interfaces
.implements Lcom/android/launcher3/util/window/b;


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/ChoreographerFrameRateTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ChoreographerFrameRateTracker;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/ChoreographerFrameRateTracker;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/ChoreographerFrameRateTracker;->INSTANCE:Lcom/android/quickstep/util/ChoreographerFrameRateTracker;

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


# virtual methods
.method public getSingleFrameMs()I
    .locals 5

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getMainThreadInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/Choreographer;->getFrameIntervalNanos()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    const-wide/32 v3, 0xf4240

    .line 13
    .line 14
    .line 15
    div-long/2addr v1, v3

    .line 16
    long-to-int p0, v1

    .line 17
    invoke-static {p0, v0}, LA4/d;->c(II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    return v0
.end method
