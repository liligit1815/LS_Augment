.class public final Lo0/p;
.super Ljava/lang/Object;
.source "EmbeddingConfiguration.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/p$a;
    }
.end annotation


# static fields
.field public static final b:Lo0/p$a;

.field public static final c:Lo0/p;

.field public static final d:Lo0/p;

.field public static final e:Lo0/p;


# instance fields
.field private final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo0/p$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/p$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/p;->b:Lo0/p$a;

    .line 8
    .line 9
    new-instance v0, Lo0/p;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, v1}, Lo0/p;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lo0/p;->c:Lo0/p;

    .line 16
    .line 17
    new-instance v0, Lo0/p;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-direct {v0, v1}, Lo0/p;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lo0/p;->d:Lo0/p;

    .line 24
    .line 25
    new-instance v0, Lo0/p;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-direct {v0, v1}, Lo0/p;-><init>(I)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lo0/p;->e:Lo0/p;

    .line 32
    .line 33
    return-void
.end method

.method private constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lo0/p;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "DimArea="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget p0, p0, Lo0/p;->a:I

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq p0, v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq p0, v1, :cond_0

    .line 20
    .line 21
    const-string p0, "UNKNOWN"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, "ON_TASK"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p0, "ON_ACTIVITY_STACK"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    const-string p0, "UNDEFINED"

    .line 31
    .line 32
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method
