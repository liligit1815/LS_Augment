.class final enum Landroidx/constraintlayout/motion/widget/p$i;
.super Ljava/lang/Enum;
.source "MotionLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/widget/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "i"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/constraintlayout/motion/widget/p$i;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum g:Landroidx/constraintlayout/motion/widget/p$i;

.field public static final enum h:Landroidx/constraintlayout/motion/widget/p$i;

.field public static final enum i:Landroidx/constraintlayout/motion/widget/p$i;

.field public static final enum j:Landroidx/constraintlayout/motion/widget/p$i;

.field private static final synthetic k:[Landroidx/constraintlayout/motion/widget/p$i;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$i;

    .line 2
    .line 3
    const-string v1, "UNDEFINED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/motion/widget/p$i;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Landroidx/constraintlayout/motion/widget/p$i;->g:Landroidx/constraintlayout/motion/widget/p$i;

    .line 10
    .line 11
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$i;

    .line 12
    .line 13
    const-string v1, "SETUP"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/motion/widget/p$i;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Landroidx/constraintlayout/motion/widget/p$i;->h:Landroidx/constraintlayout/motion/widget/p$i;

    .line 20
    .line 21
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$i;

    .line 22
    .line 23
    const-string v1, "MOVING"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/motion/widget/p$i;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 30
    .line 31
    new-instance v0, Landroidx/constraintlayout/motion/widget/p$i;

    .line 32
    .line 33
    const-string v1, "FINISHED"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/motion/widget/p$i;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 40
    .line 41
    invoke-static {}, Landroidx/constraintlayout/motion/widget/p$i;->a()[Landroidx/constraintlayout/motion/widget/p$i;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Landroidx/constraintlayout/motion/widget/p$i;->k:[Landroidx/constraintlayout/motion/widget/p$i;

    .line 46
    .line 47
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

.method private static synthetic a()[Landroidx/constraintlayout/motion/widget/p$i;
    .locals 4

    .line 1
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->g:Landroidx/constraintlayout/motion/widget/p$i;

    .line 2
    .line 3
    sget-object v1, Landroidx/constraintlayout/motion/widget/p$i;->h:Landroidx/constraintlayout/motion/widget/p$i;

    .line 4
    .line 5
    sget-object v2, Landroidx/constraintlayout/motion/widget/p$i;->i:Landroidx/constraintlayout/motion/widget/p$i;

    .line 6
    .line 7
    sget-object v3, Landroidx/constraintlayout/motion/widget/p$i;->j:Landroidx/constraintlayout/motion/widget/p$i;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Landroidx/constraintlayout/motion/widget/p$i;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/constraintlayout/motion/widget/p$i;
    .locals 1

    .line 1
    const-class v0, Landroidx/constraintlayout/motion/widget/p$i;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/constraintlayout/motion/widget/p$i;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Landroidx/constraintlayout/motion/widget/p$i;
    .locals 1

    .line 1
    sget-object v0, Landroidx/constraintlayout/motion/widget/p$i;->k:[Landroidx/constraintlayout/motion/widget/p$i;

    .line 2
    .line 3
    invoke-virtual {v0}, [Landroidx/constraintlayout/motion/widget/p$i;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Landroidx/constraintlayout/motion/widget/p$i;

    .line 8
    .line 9
    return-object v0
.end method
