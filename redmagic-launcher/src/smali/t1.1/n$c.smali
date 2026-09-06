.class final Lt1/n$c;
.super Ljava/lang/Object;
.source "IconCacheUpdateHandler.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lt1/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private final g:J

.field private final h:Landroid/os/UserHandle;

.field private final i:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final j:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final k:Lt1/j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lt1/j<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final l:Lt1/n$b;

.field private final m:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic n:Lt1/n;


# direct methods
.method public constructor <init>(Lt1/n;JLandroid/os/UserHandle;Ljava/util/ArrayDeque;Ljava/util/ArrayDeque;Lt1/j;Lt1/n$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroid/os/UserHandle;",
            "Ljava/util/ArrayDeque<",
            "TT;>;",
            "Ljava/util/ArrayDeque<",
            "TT;>;",
            "Lt1/j<",
            "TT;>;",
            "Lt1/n$b;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "userHandle"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "appsToAdd"

    .line 7
    .line 8
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "appsToUpdate"

    .line 12
    .line 13
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "cachingLogic"

    .line 17
    .line 18
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "onUpdateCallback"

    .line 22
    .line 23
    invoke-static {p8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lt1/n$c;->n:Lt1/n;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-wide p2, p0, Lt1/n$c;->g:J

    .line 32
    .line 33
    iput-object p4, p0, Lt1/n$c;->h:Landroid/os/UserHandle;

    .line 34
    .line 35
    iput-object p5, p0, Lt1/n$c;->i:Ljava/util/ArrayDeque;

    .line 36
    .line 37
    iput-object p6, p0, Lt1/n$c;->j:Ljava/util/ArrayDeque;

    .line 38
    .line 39
    iput-object p7, p0, Lt1/n$c;->k:Lt1/j;

    .line 40
    .line 41
    iput-object p8, p0, Lt1/n$c;->l:Lt1/n$b;

    .line 42
    .line 43
    new-instance p1, Ljava/util/HashSet;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lt1/n$c;->m:Ljava/util/HashSet;

    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    iget-object v0, p0, Lt1/n$c;->n:Lt1/n;

    .line 2
    .line 3
    invoke-static {v0}, Lt1/n;->e(Lt1/n;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lt1/n$c;->n:Lt1/n;

    .line 8
    .line 9
    invoke-static {v1}, Lt1/n;->d(Lt1/n;)Lt1/f;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lt1/f;->x()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    const-wide/16 v4, 0x1

    .line 22
    .line 23
    add-long/2addr v2, v4

    .line 24
    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lt1/n$c;->j:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lt1/n$c;->j:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lt1/n$c;->k:Lt1/j;

    .line 16
    .line 17
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v1, v0}, Lt1/j;->h(Ljava/lang/Object;)Landroid/content/ComponentName;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "getPackageName(...)"

    .line 29
    .line 30
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lt1/n$c;->n:Lt1/n;

    .line 34
    .line 35
    invoke-static {v2}, Lt1/n;->d(Lt1/n;)Lt1/f;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v3, p0, Lt1/n$c;->k:Lt1/j;

    .line 40
    .line 41
    iget-wide v4, p0, Lt1/n$c;->g:J

    .line 42
    .line 43
    invoke-virtual {v2, v0, v3, v4, v5}, Lt1/f;->e(Ljava/lang/Object;Lt1/j;J)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lt1/n$c;->m:Ljava/util/HashSet;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lt1/n$c;->j:Ljava/util/ArrayDeque;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Lt1/n$c;->m:Ljava/util/HashSet;

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lt1/n$c;->l:Lt1/n$b;

    .line 68
    .line 69
    iget-object v1, p0, Lt1/n$c;->m:Ljava/util/HashSet;

    .line 70
    .line 71
    iget-object v2, p0, Lt1/n$c;->h:Landroid/os/UserHandle;

    .line 72
    .line 73
    invoke-interface {v0, v1, v2}, Lt1/n$b;->a(Ljava/util/HashSet;Landroid/os/UserHandle;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    invoke-virtual {p0}, Lt1/n$c;->a()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    iget-object v0, p0, Lt1/n$c;->i:Ljava/util/ArrayDeque;

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_2

    .line 87
    .line 88
    iget-object v0, p0, Lt1/n$c;->n:Lt1/n;

    .line 89
    .line 90
    invoke-static {v0}, Lt1/n;->d(Lt1/n;)Lt1/f;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Lt1/n$c;->i:Ljava/util/ArrayDeque;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v2, "removeLast(...)"

    .line 101
    .line 102
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object v2, p0, Lt1/n$c;->k:Lt1/j;

    .line 106
    .line 107
    iget-wide v3, p0, Lt1/n$c;->g:J

    .line 108
    .line 109
    invoke-virtual {v0, v1, v2, v3, v4}, Lt1/f;->e(Ljava/lang/Object;Lt1/j;J)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lt1/n$c;->a()V

    .line 113
    .line 114
    .line 115
    :cond_2
    return-void
.end method
