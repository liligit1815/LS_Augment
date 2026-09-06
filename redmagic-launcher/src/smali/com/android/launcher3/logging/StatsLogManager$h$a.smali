.class public final enum Lcom/android/launcher3/logging/StatsLogManager$h$a;
.super Ljava/lang/Enum;
.source "StatsLogManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/logging/StatsLogManager$h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/launcher3/logging/StatsLogManager$h$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum i:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum j:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum k:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum l:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum m:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum n:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum o:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum p:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum q:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field public static final enum r:Lcom/android/launcher3/logging/StatsLogManager$h$a;

.field private static final synthetic s:[Lcom/android/launcher3/logging/StatsLogManager$h$a;


# instance fields
.field private final g:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 2
    .line 3
    const-string v1, "UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->h:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 12
    .line 13
    const-string v1, "COLD"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->i:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 22
    .line 23
    const-string v1, "HOT"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->j:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 30
    .line 31
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 32
    .line 33
    const-string v1, "TIMEOUT"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->k:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 40
    .line 41
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 42
    .line 43
    const-string v1, "FAIL"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->l:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 50
    .line 51
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 52
    .line 53
    const-string v1, "COLD_USERWAITING"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->m:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 60
    .line 61
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 62
    .line 63
    const-string v1, "ATOMIC"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->n:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 70
    .line 71
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 72
    .line 73
    const-string v1, "CONTROLLED"

    .line 74
    .line 75
    const/4 v2, 0x7

    .line 76
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->o:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 80
    .line 81
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 82
    .line 83
    const-string v1, "CACHED"

    .line 84
    .line 85
    const/16 v2, 0x8

    .line 86
    .line 87
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->p:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 91
    .line 92
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 93
    .line 94
    const-string v1, "COLD_DEVICE_REBOOTING"

    .line 95
    .line 96
    const/16 v2, 0x9

    .line 97
    .line 98
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->q:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 102
    .line 103
    new-instance v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 104
    .line 105
    const-string v1, "WARM"

    .line 106
    .line 107
    const/16 v2, 0xa

    .line 108
    .line 109
    invoke-direct {v0, v1, v2, v2}, Lcom/android/launcher3/logging/StatsLogManager$h$a;-><init>(Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->r:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 113
    .line 114
    invoke-static {}, Lcom/android/launcher3/logging/StatsLogManager$h$a;->a()[Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    sput-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->s:[Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 119
    .line 120
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
    iput p3, p0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->g:I

    .line 5
    .line 6
    return-void
.end method

.method private static synthetic a()[Lcom/android/launcher3/logging/StatsLogManager$h$a;
    .locals 11

    .line 1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->h:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$h$a;->i:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 4
    .line 5
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$h$a;->j:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 6
    .line 7
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$h$a;->k:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 8
    .line 9
    sget-object v4, Lcom/android/launcher3/logging/StatsLogManager$h$a;->l:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 10
    .line 11
    sget-object v5, Lcom/android/launcher3/logging/StatsLogManager$h$a;->m:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 12
    .line 13
    sget-object v6, Lcom/android/launcher3/logging/StatsLogManager$h$a;->n:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 14
    .line 15
    sget-object v7, Lcom/android/launcher3/logging/StatsLogManager$h$a;->o:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 16
    .line 17
    sget-object v8, Lcom/android/launcher3/logging/StatsLogManager$h$a;->p:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 18
    .line 19
    sget-object v9, Lcom/android/launcher3/logging/StatsLogManager$h$a;->q:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 20
    .line 21
    sget-object v10, Lcom/android/launcher3/logging/StatsLogManager$h$a;->r:Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 22
    .line 23
    filled-new-array/range {v0 .. v10}, [Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$h$a;
    .locals 1

    .line 1
    const-class v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/launcher3/logging/StatsLogManager$h$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->s:[Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/launcher3/logging/StatsLogManager$h$a;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/launcher3/logging/StatsLogManager$h$a;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/logging/StatsLogManager$h$a;->g:I

    .line 2
    .line 3
    return p0
.end method
