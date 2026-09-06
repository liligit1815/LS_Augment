.class abstract Lz1/J3$e;
.super Lz1/J3$c;
.source "ModelWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/J3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "e"
.end annotation


# instance fields
.field private final i:[Ljava/lang/StackTraceElement;

.field private final j:Lz1/J3$d;

.field final synthetic k:Lz1/J3;


# direct methods
.method constructor <init>(Lz1/J3;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lz1/J3$e;->k:Lz1/J3;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lz1/J3$c;-><init>(Lz1/J3;Lz1/L3;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lz1/J3$d;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Lz1/J3$d;-><init>(Lz1/J3;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lz1/J3$e;->j:Lz1/J3$d;

    .line 13
    .line 14
    new-instance p1, Ljava/lang/Throwable;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/lang/Throwable;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lz1/J3$e;->i:[Ljava/lang/StackTraceElement;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method protected c(Lcom/android/launcher3/model/data/y;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lz1/J3$e;->k:Lz1/J3;

    .line 2
    .line 3
    invoke-static {v0}, Lz1/J3;->q(Lz1/J3;)Lz1/y0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lz1/J3$e;->k:Lz1/J3;

    .line 9
    .line 10
    iget-object v2, p0, Lz1/J3$e;->i:[Ljava/lang/StackTraceElement;

    .line 11
    .line 12
    invoke-static {v1, p2, p1, v2}, Lz1/J3;->v(Lz1/J3;ILcom/android/launcher3/model/data/y;[Ljava/lang/StackTraceElement;)V

    .line 13
    .line 14
    .line 15
    iget p2, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 16
    .line 17
    const/16 v1, -0x64

    .line 18
    .line 19
    if-eq p2, v1, :cond_0

    .line 20
    .line 21
    const/16 v1, -0x65

    .line 22
    .line 23
    if-eq p2, v1, :cond_0

    .line 24
    .line 25
    iget-object p2, p0, Lz1/J3$e;->k:Lz1/J3;

    .line 26
    .line 27
    invoke-static {p2}, Lz1/J3;->q(Lz1/J3;)Lz1/y0;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iget-object p2, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 32
    .line 33
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 34
    .line 35
    invoke-virtual {p2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    instance-of p2, p2, Lcom/android/launcher3/model/data/m;

    .line 40
    .line 41
    if-nez p2, :cond_0

    .line 42
    .line 43
    new-instance p2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v1, "item: "

    .line 49
    .line 50
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, " container being set to: "

    .line 57
    .line 58
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget p1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 62
    .line 63
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, ", not in the list of collections"

    .line 67
    .line 68
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string p2, "ModelWriter"

    .line 76
    .line 77
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_1

    .line 83
    :cond_0
    :goto_0
    iget-object p0, p0, Lz1/J3$e;->j:Lz1/J3$d;

    .line 84
    .line 85
    invoke-virtual {p0}, Lz1/J3$d;->c()V

    .line 86
    .line 87
    .line 88
    monitor-exit v0

    .line 89
    return-void

    .line 90
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    throw p0
.end method
