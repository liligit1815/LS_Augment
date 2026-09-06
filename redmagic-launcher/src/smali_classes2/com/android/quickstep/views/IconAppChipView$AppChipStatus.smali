.class public final enum Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;
.super Ljava/lang/Enum;
.source "IconAppChipView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/IconAppChipView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AppChipStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Ln4/a;

.field private static final synthetic $VALUES:[Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

.field public static final enum Collapsed:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

.field public static final enum Expanded:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;


# direct methods
.method private static final synthetic $values()[Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Expanded:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Collapsed:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

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
    new-instance v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 2
    .line 3
    const-string v1, "Expanded"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Expanded:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 12
    .line 13
    const-string v1, "Collapsed"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Collapsed:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 20
    .line 21
    invoke-static {}, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->$values()[Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->$VALUES:[Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 26
    .line 27
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->$ENTRIES:Ln4/a;

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
            "Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->$ENTRIES:Ln4/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->$VALUES:[Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 8
    .line 9
    return-object v0
.end method
