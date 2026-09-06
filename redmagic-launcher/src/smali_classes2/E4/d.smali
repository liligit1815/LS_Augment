.class public final enum LE4/d;
.super Ljava/lang/Enum;
.source "DurationUnitJvm.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "LE4/d;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum h:LE4/d;

.field public static final enum i:LE4/d;

.field public static final enum j:LE4/d;

.field public static final enum k:LE4/d;

.field public static final enum l:LE4/d;

.field public static final enum m:LE4/d;

.field public static final enum n:LE4/d;

.field private static final synthetic o:[LE4/d;

.field private static final synthetic p:Ln4/a;


# instance fields
.field private final g:Ljava/util/concurrent/TimeUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, LE4/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 5
    .line 6
    const-string v3, "NANOSECONDS"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, LE4/d;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, LE4/d;->h:LE4/d;

    .line 12
    .line 13
    new-instance v0, LE4/d;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    const-string v3, "MICROSECONDS"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, LE4/d;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, LE4/d;->i:LE4/d;

    .line 24
    .line 25
    new-instance v0, LE4/d;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    const-string v3, "MILLISECONDS"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, LE4/d;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, LE4/d;->j:LE4/d;

    .line 36
    .line 37
    new-instance v0, LE4/d;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 41
    .line 42
    const-string v3, "SECONDS"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, LE4/d;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, LE4/d;->k:LE4/d;

    .line 48
    .line 49
    new-instance v0, LE4/d;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 53
    .line 54
    const-string v3, "MINUTES"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, LE4/d;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, LE4/d;->l:LE4/d;

    .line 60
    .line 61
    new-instance v0, LE4/d;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    sget-object v2, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 65
    .line 66
    const-string v3, "HOURS"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, LE4/d;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, LE4/d;->m:LE4/d;

    .line 72
    .line 73
    new-instance v0, LE4/d;

    .line 74
    .line 75
    const/4 v1, 0x6

    .line 76
    sget-object v2, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    .line 77
    .line 78
    const-string v3, "DAYS"

    .line 79
    .line 80
    invoke-direct {v0, v3, v1, v2}, LE4/d;-><init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, LE4/d;->n:LE4/d;

    .line 84
    .line 85
    invoke-static {}, LE4/d;->a()[LE4/d;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, LE4/d;->o:[LE4/d;

    .line 90
    .line 91
    invoke-static {v0}, Ln4/b;->a([Ljava/lang/Enum;)Ln4/a;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sput-object v0, LE4/d;->p:Ln4/a;

    .line 96
    .line 97
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/util/concurrent/TimeUnit;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, LE4/d;->g:Ljava/util/concurrent/TimeUnit;

    .line 5
    .line 6
    return-void
.end method

.method private static final synthetic a()[LE4/d;
    .locals 7

    .line 1
    sget-object v0, LE4/d;->h:LE4/d;

    .line 2
    .line 3
    sget-object v1, LE4/d;->i:LE4/d;

    .line 4
    .line 5
    sget-object v2, LE4/d;->j:LE4/d;

    .line 6
    .line 7
    sget-object v3, LE4/d;->k:LE4/d;

    .line 8
    .line 9
    sget-object v4, LE4/d;->l:LE4/d;

    .line 10
    .line 11
    sget-object v5, LE4/d;->m:LE4/d;

    .line 12
    .line 13
    sget-object v6, LE4/d;->n:LE4/d;

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [LE4/d;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)LE4/d;
    .locals 1

    .line 1
    const-class v0, LE4/d;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LE4/d;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LE4/d;
    .locals 1

    .line 1
    sget-object v0, LE4/d;->o:[LE4/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LE4/d;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final c()Ljava/util/concurrent/TimeUnit;
    .locals 0

    .line 1
    iget-object p0, p0, LE4/d;->g:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    return-object p0
.end method
