.class public final enum Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;
.super Ljava/lang/Enum;
.source "TaskThumbnailView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ScrimViewAlpha"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Ln4/a;

.field private static final synthetic $VALUES:[Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

.field public static final enum MenuProgress:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

.field public static final enum TintAmount:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;


# direct methods
.method private static final synthetic $values()[Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->MenuProgress:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->TintAmount:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 2
    .line 3
    const-string v1, "MenuProgress"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->MenuProgress:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 12
    .line 13
    const-string v1, "TintAmount"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->TintAmount:Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 20
    .line 21
    invoke-static {}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->$values()[Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->$VALUES:[Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 26
    .line 27
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->$ENTRIES:Ln4/a;

    .line 32
    .line 33
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

.method public static getEntries()Ln4/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ln4/a<",
            "Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->$ENTRIES:Ln4/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;->$VALUES:[Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/task/thumbnail/TaskThumbnailView$Companion$ScrimViewAlpha;

    .line 8
    .line 9
    return-object v0
.end method
