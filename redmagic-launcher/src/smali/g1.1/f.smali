.class public final Lg1/f;
.super Ljava/lang/Object;
.source "Modules.kt"


# static fields
.field public static final a:Lg1/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lg1/f;

    .line 2
    .line 3
    invoke-direct {v0}, Lg1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lg1/f;->a:Lg1/f;

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

.method public static final a()Lcom/android/quickstep/util/GestureExclusionManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/GestureExclusionManager;->INSTANCE:Lcom/android/quickstep/util/GestureExclusionManager;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final b()Lcom/android/launcher3/util/window/b;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/ChoreographerFrameRateTracker;->INSTANCE:Lcom/android/quickstep/util/ChoreographerFrameRateTracker;

    .line 2
    .line 3
    return-object v0
.end method
