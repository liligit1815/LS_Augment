.class public final enum Lcom/android/quickstep/GestureState$GestureEndTarget;
.super Ljava/lang/Enum;
.source "GestureState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/GestureState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GestureEndTarget"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/GestureState$GestureEndTarget;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/GestureState$GestureEndTarget;

.field public static final enum ALL_APPS:Lcom/android/quickstep/GestureState$GestureEndTarget;

.field public static final enum HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

.field public static final enum LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

.field public static final enum NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

.field public static final enum RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;


# instance fields
.field public final containerType:I

.field public final isLauncher:Z

.field public final recentsAttachedToAppWindow:Z


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/GestureState$GestureEndTarget;
    .locals 5

    .line 1
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 6
    .line 7
    sget-object v3, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->ALL_APPS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    const/4 v4, 0x2

    .line 4
    const/4 v5, 0x0

    .line 5
    const-string v1, "HOME"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/GestureState$GestureEndTarget;-><init>(Ljava/lang/String;IZIZ)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 13
    .line 14
    new-instance v1, Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 15
    .line 16
    const/4 v5, 0x3

    .line 17
    const/4 v6, 0x1

    .line 18
    const-string v2, "RECENTS"

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    invoke-direct/range {v1 .. v6}, Lcom/android/quickstep/GestureState$GestureEndTarget;-><init>(Ljava/lang/String;IZIZ)V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 25
    .line 26
    new-instance v2, Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 27
    .line 28
    const/4 v7, 0x1

    .line 29
    const-string v3, "NEW_TASK"

    .line 30
    .line 31
    const/4 v4, 0x2

    .line 32
    const/4 v5, 0x0

    .line 33
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/GestureState$GestureEndTarget;-><init>(Ljava/lang/String;IZIZ)V

    .line 34
    .line 35
    .line 36
    sput-object v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 37
    .line 38
    new-instance v3, Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 39
    .line 40
    const/4 v8, 0x1

    .line 41
    const-string v4, "LAST_TASK"

    .line 42
    .line 43
    const/4 v5, 0x3

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-direct/range {v3 .. v8}, Lcom/android/quickstep/GestureState$GestureEndTarget;-><init>(Ljava/lang/String;IZIZ)V

    .line 46
    .line 47
    .line 48
    sput-object v3, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 49
    .line 50
    new-instance v4, Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 51
    .line 52
    const/4 v8, 0x4

    .line 53
    const/4 v9, 0x0

    .line 54
    const-string v5, "ALL_APPS"

    .line 55
    .line 56
    const/4 v6, 0x4

    .line 57
    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/GestureState$GestureEndTarget;-><init>(Ljava/lang/String;IZIZ)V

    .line 58
    .line 59
    .line 60
    sput-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->ALL_APPS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 61
    .line 62
    invoke-static {}, Lcom/android/quickstep/GestureState$GestureEndTarget;->$values()[Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->$VALUES:[Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 67
    .line 68
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZIZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZIZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->isLauncher:Z

    .line 5
    .line 6
    iput p4, p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->containerType:I

    .line 7
    .line 8
    iput-boolean p5, p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->recentsAttachedToAppWindow:Z

    .line 9
    .line 10
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/GestureState$GestureEndTarget;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/GestureState$GestureEndTarget;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->$VALUES:[Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/GestureState$GestureEndTarget;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    return-object v0
.end method
