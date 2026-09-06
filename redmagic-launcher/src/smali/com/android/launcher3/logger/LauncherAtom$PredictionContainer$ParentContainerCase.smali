.class public final enum Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;
.super Ljava/lang/Enum;
.source "LauncherAtom.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ParentContainerCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

.field public static final enum PARENTCONTAINER_NOT_SET:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

.field public static final enum TASKBAR_CONTAINER:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->TASKBAR_CONTAINER:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->PARENTCONTAINER_NOT_SET:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 2
    .line 3
    const-string v1, "TASKBAR_CONTAINER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->TASKBAR_CONTAINER:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 13
    .line 14
    const-string v1, "PARENTCONTAINER_NOT_SET"

    .line 15
    .line 16
    invoke-direct {v0, v1, v3, v2}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->PARENTCONTAINER_NOT_SET:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->$values()[Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->$VALUES:[Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

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
    iput p3, p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;
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
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->TASKBAR_CONTAINER:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->PARENTCONTAINER_NOT_SET:Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 12
    .line 13
    return-object p0
.end method

.method public static valueOf(I)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    invoke-static {p0}, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->forNumber(I)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->$VALUES:[Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/logger/LauncherAtom$PredictionContainer$ParentContainerCase;->value:I

    .line 2
    .line 3
    return p0
.end method
