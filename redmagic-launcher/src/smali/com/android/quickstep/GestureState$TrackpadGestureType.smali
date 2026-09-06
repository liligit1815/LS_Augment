.class public final enum Lcom/android/quickstep/GestureState$TrackpadGestureType;
.super Ljava/lang/Enum;
.source "GestureState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/GestureState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TrackpadGestureType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/GestureState$TrackpadGestureType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/GestureState$TrackpadGestureType;

.field public static final enum FOUR_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;

.field public static final enum NONE:Lcom/android/quickstep/GestureState$TrackpadGestureType;

.field public static final enum THREE_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/GestureState$TrackpadGestureType;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->NONE:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/GestureState$TrackpadGestureType;->THREE_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/GestureState$TrackpadGestureType;->FOUR_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/GestureState$TrackpadGestureType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->NONE:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 12
    .line 13
    const-string v1, "THREE_FINGER"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/GestureState$TrackpadGestureType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->THREE_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 22
    .line 23
    const-string v1, "FOUR_FINGER"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/GestureState$TrackpadGestureType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->FOUR_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 30
    .line 31
    invoke-static {}, Lcom/android/quickstep/GestureState$TrackpadGestureType;->$values()[Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->$VALUES:[Lcom/android/quickstep/GestureState$TrackpadGestureType;

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

.method public static getTrackpadGestureType(Landroid/view/MotionEvent;)Lcom/android/quickstep/GestureState$TrackpadGestureType;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/H4;->e(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->THREE_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/H4;->a(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->FOUR_FINGER:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    sget-object p0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->NONE:Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 20
    .line 21
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/GestureState$TrackpadGestureType;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/GestureState$TrackpadGestureType;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/GestureState$TrackpadGestureType;->$VALUES:[Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/GestureState$TrackpadGestureType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/GestureState$TrackpadGestureType;

    .line 8
    .line 9
    return-object v0
.end method
