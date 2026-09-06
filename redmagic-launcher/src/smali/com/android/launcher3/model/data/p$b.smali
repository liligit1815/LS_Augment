.class public final enum Lcom/android/launcher3/model/data/p$b;
.super Ljava/lang/Enum;
.source "FolderInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/model/data/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/model/data/p$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:Lcom/android/launcher3/model/data/p$b;

.field public static final enum i:Lcom/android/launcher3/model/data/p$b;

.field public static final enum j:Lcom/android/launcher3/model/data/p$b;

.field public static final enum k:Lcom/android/launcher3/model/data/p$b;

.field private static final synthetic l:[Lcom/android/launcher3/model/data/p$b;


# instance fields
.field private final g:Lcom/android/launcher3/logger/LauncherAtom$Attribute;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/p$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    sget-object v2, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->UNLABELED:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 5
    .line 6
    const-string v3, "UNLABELED"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/model/data/p$b;-><init>(Ljava/lang/String;ILcom/android/launcher3/logger/LauncherAtom$Attribute;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/model/data/p$b;->h:Lcom/android/launcher3/model/data/p$b;

    .line 12
    .line 13
    new-instance v0, Lcom/android/launcher3/model/data/p$b;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    sget-object v2, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->EMPTY_LABEL:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 17
    .line 18
    const-string v3, "EMPTY"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/model/data/p$b;-><init>(Ljava/lang/String;ILcom/android/launcher3/logger/LauncherAtom$Attribute;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/android/launcher3/model/data/p$b;->i:Lcom/android/launcher3/model/data/p$b;

    .line 24
    .line 25
    new-instance v0, Lcom/android/launcher3/model/data/p$b;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    sget-object v2, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->SUGGESTED_LABEL:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 29
    .line 30
    const-string v3, "SUGGESTED"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/model/data/p$b;-><init>(Ljava/lang/String;ILcom/android/launcher3/logger/LauncherAtom$Attribute;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/android/launcher3/model/data/p$b;->j:Lcom/android/launcher3/model/data/p$b;

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/model/data/p$b;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    sget-object v2, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->MANUAL_LABEL:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 41
    .line 42
    const-string v3, "MANUAL"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/android/launcher3/model/data/p$b;-><init>(Ljava/lang/String;ILcom/android/launcher3/logger/LauncherAtom$Attribute;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/android/launcher3/model/data/p$b;->k:Lcom/android/launcher3/model/data/p$b;

    .line 48
    .line 49
    invoke-static {}, Lcom/android/launcher3/model/data/p$b;->a()[Lcom/android/launcher3/model/data/p$b;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/android/launcher3/model/data/p$b;->l:[Lcom/android/launcher3/model/data/p$b;

    .line 54
    .line 55
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/android/launcher3/logger/LauncherAtom$Attribute;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/logger/LauncherAtom$Attribute;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/android/launcher3/model/data/p$b;->g:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Lcom/android/launcher3/model/data/p$b;
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/model/data/p$b;->h:Lcom/android/launcher3/model/data/p$b;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/model/data/p$b;->i:Lcom/android/launcher3/model/data/p$b;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/model/data/p$b;->j:Lcom/android/launcher3/model/data/p$b;

    .line 6
    .line 7
    sget-object v3, Lcom/android/launcher3/model/data/p$b;->k:Lcom/android/launcher3/model/data/p$b;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/android/launcher3/model/data/p$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/model/data/p$b;)Lcom/android/launcher3/logger/LauncherAtom$Attribute;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/p$b;->g:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 2
    .line 3
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/model/data/p$b;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/model/data/p$b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/model/data/p$b;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/model/data/p$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/model/data/p$b;->l:[Lcom/android/launcher3/model/data/p$b;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/model/data/p$b;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/model/data/p$b;

    .line 8
    .line 9
    return-object v0
.end method
